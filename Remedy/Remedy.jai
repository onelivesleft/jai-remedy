// TODO: Readme
// [ ] Readme
// [ ] remove size member of results/events, just use size_of
// [ ] solidify MO of parsing results (into a parse proc that returns a jai-happy struct, not a remedy synonym)
// [ ] make big theme change when running target so it's obvious we're not in an edit mode.
// [ ] hover vars
// [ ] watch window
// [ ] stack window
// [x] Convert pipe reading to message mode, simplifying code greatly!

// All data returned in events and results is temporary, stored in a module specific buffer or temporary_storage.
// These last until the next call to update, reset_temporary_storage repsectively.
// If you want to keep a string around, copy it!


init :: () -> success: bool {
    name := utf8_to_wide_new(CONTROL_PIPE_NAME,, temp);
    control_pipe = CreateFileW(name, GENERIC_READ | GENERIC_WRITE, 0, null, OPEN_EXISTING, 0, null);
    if control_pipe == INVALID_HANDLE_VALUE {
        #if VERBOSE {
            error := GetLastError();
            if error == ERROR_FILE_NOT_FOUND
                print("Could not find Remedy control pipe: is remedy running with the -servername option set?\n");
            else
                print("Error connecting to Remedy control pipe: %\n", error);
        }
        return false;
    }
    SetNamedPipeHandleState(control_pipe, *PIPE_READMODE_MESSAGE, null, null);

    name = utf8_to_wide_new(EVENTS_PIPE_NAME,, temp);
    MAGIC :: 256;
    events_pipe = CreateFileW(name, GENERIC_READ|MAGIC, 0, null, OPEN_EXISTING, 0, null);
    if events_pipe == INVALID_HANDLE_VALUE {
        #if VERBOSE {
            error := GetLastError();
            if error == ERROR_FILE_NOT_FOUND
                print("Could not find Remedy events pipe: is remedy running with the -servername option set?\n");
            else
                print("Error connecting to Remedy events pipe: %\n", error);
        }
        return false;
    }

    SetNamedPipeHandleState(events_pipe, *PIPE_READMODE_MESSAGE, null, null);

    return true;
}

update :: () -> something_happened: bool, error: OS_Error_Code {
    something_happened, error := process_events();
    return something_happened, error;
}


#scope_module


control_pipe: HANDLE;
events_pipe: HANDLE;

control_buffer : [CONTROL_BUFFER_SIZE] u8;
events_buffer : [EVENTS_BUFFER_SIZE] u8;


to_string :: inline (rdbg_string: *rdbg_String) -> string {
    s : string = ---;
    s.count = rdbg_string.count;
    s.data = (cast(*void)rdbg_string) + 2;
    return copy_string(s);
}


to_rdbg_string :: (s: string) -> rdbg_String {
    rdbg_string := alloc(2 + s.count);
    len := cast(*u16) rdbg_string;
    data := cast(*u8) (rdbg_string + 2);

    len.* = cast,trunc(u16) s.count;
    memcpy(data, s.data, s.count);
    return (cast(*rdbg_String) rdbg_string).*;
}

append_as_rdbg_string :: (builder: *String_Builder, s: string) {
    len := cast,trunc(u16) s.count;
    append_by_pointer(builder, *len);
    append(builder, s);
}

read_and_advance :: (src: **void, dst: *$T) {
    dst.* = cast(T) (cast(*T) src.*).*;
    src.* += size_of(T);
}

read_and_advance :: (src: **void, dst: *string) {
    len: u16;
    read_and_advance(src, *len);
    dst.data = src.*;
    dst.count = len;
    src.* += len;
}