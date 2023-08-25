remedy_init :: () -> success: bool {
    name := utf8_to_wide(CONTROL_PIPE_NAME);
    control_pipe = CreateFileW(name, GENERIC_READ | GENERIC_WRITE, 0, null, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, null);
    if control_pipe == INVALID_HANDLE_VALUE {
        error := GetLastError();
        if error == ERROR_FILE_NOT_FOUND {
            print("Could not find Remedy control pipe: is remedy running with the -servername option set?\n");
        }
        else {
            print("Error connecting to Remedy control pipe: %\n", error);
        }
        return false;
    }

    name = utf8_to_wide(EVENTS_PIPE_NAME);
    events_pipe = CreateFileW(name, GENERIC_READ, 0, null, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, null);
    if control_pipe == INVALID_HANDLE_VALUE {
        error := GetLastError();
        if error == ERROR_FILE_NOT_FOUND {
            print("Could not find Remedy events pipe: is remedy running with the -servername option set?\n");
        }
        else {
            print("Error connecting to Remedy events pipe: %\n", error);
        }
        return false;
    }

    return true;
}

remedy_update :: () {
    process_events();
    process_control_results();
}


#scope_module


control_pipe: HANDLE;
events_pipe: HANDLE;

control_receive_buffer : [CONTROL_RECEIVE_BUFFER_SIZE] u8;
events_buffer : [EVENTS_BUFFER_SIZE] u8;


copy_string :: inline (rdbg_string: *rdbg_String) -> string {
    s : string = ---;
    s.count = rdbg_string.count;
    s.data = xx (rdbg_string + 1);
    return copy_string(s, temp);
}

read_pipe :: (pipe: HANDLE, buffer: [] u8) -> success: bool, bytes_read: int {
    bytes_read: u32;
    bytes_available: u32;
    success := PeekNamedPipe(pipe, null, 0, null, *bytes_available, null) != 0;
    if success && bytes_available {
        success = ReadFile(pipe, buffer.data, cast(u32) buffer.count, *bytes_read, null) != 0;
    }

    if !success
        return false, 0;

    return true, bytes_read;
}
