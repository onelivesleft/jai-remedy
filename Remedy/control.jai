add_breakpoint_at_filename_line :: (filename: string, line_number: u32, condition := "") -> *Result_Add_Breakpoint_At_Filename_Line {
    _filename := fix_filename(filename);
    message, size := make_add_breakpoint_at_filename_line(_filename, line_number, condition,, temp);
    return cast(*Result_Add_Breakpoint_At_Filename_Line) send_control_message(message, size);
}

add_session_config :: (command := "", command_args := "", working_dir := "", environment_vars := [] string, inherit_environment_vars_from_parent := false, break_at_nominal_entry_point := false, name := "") -> *Result_Add_Session_Config {
    message, size := make_add_session_config(command, command_args, working_dir, environment_vars, inherit_environment_vars_from_parent, break_at_nominal_entry_point, name,, temp);
    return cast(*Result_Add_Session_Config) send_control_message(message, size);
}

break_execution :: () -> *Result_Break_Execution {
    message := Message_Break_Execution.{};
    return cast(*Result_Break_Execution) send_control_message(*message);
}

continue_execution :: () -> *Result_Continue_Execution {
    message := Message_Continue_Execution.{};
    return cast(*Result_Continue_Execution) send_control_message(*message);
}

delete_all_breakpoints :: () -> *Result_Delete_All_Breakpoints {
    message := Message_Delete_All_Breakpoints.{};
    return cast(*Result_Delete_All_Breakpoints) send_control_message(*message);
}

delete_breakpoint :: (breakpoint_id: rdbg_Id) -> *Result_Delete_Breakpoint {
    message := Message_Delete_Breakpoint.{
        bp_id = breakpoint_id
    };
    return cast(*Result_Delete_Breakpoint) send_control_message(*message);
}

enable_breakpoint :: (breakpoint_id: rdbg_Id, enabled: bool) -> *Result_Enable_Breakpoint {
    message := Message_Enable_Breakpoint.{
        bp_id = breakpoint_id,
        enable = enabled,
    };
    return cast(*Result_Enable_Breakpoint) send_control_message(*message);
}

get_breakpoint_locations :: (breakpoint_id: rdbg_Id) -> *Result_Get_Breakpoint_Locations {
    message := Message_Get_Breakpoint_Locations.{
        bp_id = breakpoint_id
    };
    result := cast(*Result_Get_Breakpoint_Locations_Header) send_control_message(*message);
    return parse_get_breakpoint_locations_result(result, breakpoint_id);
}

get_breakpoints :: () -> *Result_Get_Breakpoints {
    message := Message_Get_Breakpoints.{};
    result := cast(*Result_Get_Breakpoints_Header) send_control_message(*message);
    return parse_get_breakpoints_result(result);
}

get_current_file :: () -> *Result_Get_Current_File {
    message := Message_Get_Current_File.{};
    /*
    prefix := cast(*Result_Get_Current_File_Prefix) data;
            print("%\n", prefix.*);
            postfix := cast(*Result_Get_Current_File_Postfix) (data + prefix.filename.count + Result_Get_Current_File_Prefix.size);
            print("%\n", postfix.*);
            advance = cast(*void)postfix - data + Result_Get_Current_File_Postfix.size;
            get_current_rent_file_result := Result_Get_Current_File.{
                prefix.base, prefix.id, to_string(*prefix.filename), postfix.line_num
            };
            assert(advance <= count, "We tried to advance past the end of the received data.");
            if result.result == .OK  handle_get_current_file_control_result(get_current_rent_file_result);
    */
    return cast(*Result_Get_Current_File) send_control_message(*message);
}

new_session :: (debugging_target_behavior := rdbg_DebuggingTargetBehavior.STOP_DEBUGGING, modified_session_behavior := rdbg_ModifiedSessionBehavior.CONTINUE_WITHOUT_SAVING) -> *Result_New_Session {
    message := Message_New_Session.{
        dtb = debugging_target_behavior,
        msb = modified_session_behavior,
    };

    return cast(*Result_New_Session) send_control_message(*message);
}

run_to_file_at_line :: (filename: string, line_number: u32) -> *Result_Run_To_File_At_Line {
    _filename := fix_filename(filename);
    message, size := make_run_to_file_at_line(_filename, line_number,, temp);
    return cast(*Result_Run_To_File_At_Line) send_control_message(message, size);
}

set_active_session_config :: (session_id: rdbg_Id) -> *Result_Set_Active_Session_Config {
    message := Message_Set_Active_Session_Config.{
        id = session_id
    };

    return cast(*Result_Set_Active_Session_Config) send_control_message(*message);
}

set_bring_to_foreground_on_suspended :: (bring_to_foreground_on_suspended: bool) -> *Result_Set_Bring_To_Foreground_On_Suspended {
    message := Message_Set_Bring_To_Foreground_On_Suspended.{
        bring_to_foreground_on_suspended=bring_to_foreground_on_suspended
    };

    return cast(*Result_Set_Bring_To_Foreground_On_Suspended) send_control_message(*message);
}

start_debugging :: (break_at_entry_point := false) -> *Result_Start_Debugging {
    message := Message_Start_Debugging.{
        break_at_entry_point = break_at_entry_point
    };

    return cast(*Result_Start_Debugging) send_control_message(*message);
}

step_into_by_line :: () -> *Result_Step_Into_By_Line {
    message := Message_Step_Into_By_Line.{};
    return cast(*Result_Step_Into_By_Line) send_control_message(*message);
}

step_over_by_line :: () -> *Result_Step_Over_By_Line {
    message := Message_Step_Over_By_Line.{};
    return cast(*Result_Step_Over_By_Line) send_control_message(*message);
}

step_out :: () -> *Result_Step_Out {
    message := Message_Step_Out.{};
    return cast(*Result_Step_Out) send_control_message(*message);
}

stop_debugging :: () -> *Result_Stop_Debugging {
    message := Message_Stop_Debugging.{};
    return cast(*Result_Stop_Debugging) send_control_message(*message);
}

update_breakpoint_line :: (breakpoint_id: rdbg_Id, line_number: u32) -> *Result_Update_Breakpoint_Line {
    message := Message_Update_Breakpoint_Line.{
        bp_id = breakpoint_id,
        line_num = line_number,
    };
    return cast(*Result_Update_Breakpoint_Line) send_control_message(*message);
}

// TODO

set_breakpoint_condition :: () {
    command := rdbg_Command.SET_BREAKPOINT_CONDITION;
    assert(false, "set_breakpoint_condition is not yet supported");
}


#scope_module


bring_debugger_to_foreground :: () {
    command := rdbg_Command.BRING_DEBUGGER_TO_FOREGROUND;
    assert(false, "bring_debugger_to_foreground is not yet supported");
}

set_window_pos :: () {
    command := rdbg_Command.SET_WINDOW_POS;
    assert(false, "set_window_pos is not yet supported");
}

get_window_pos :: () {
    command := rdbg_Command.GET_WINDOW_POS;
    assert(false, "get_window_pos is not yet supported");
}

exit_debugger :: () {
    command := rdbg_Command.EXIT_DEBUGGER;
    assert(false, "exit_debugger is not yet supported");
}

get_is_session_modified :: () {
    command := rdbg_Command.GET_IS_SESSION_MODIFIED;
    assert(false, "get_is_session_modified is not yet supported");
}

get_session_filename :: () {
    command := rdbg_Command.GET_SESSION_FILENAME;
    assert(false, "get_session_filename is not yet supported");
}

open_session :: () {
    command := rdbg_Command.OPEN_SESSION;
    assert(false, "open_session is not yet supported");
}

save_session :: () {
    command := rdbg_Command.SAVE_SESSION;
    assert(false, "save_session is not yet supported");
}

save_as_session :: () {
    command := rdbg_Command.SAVE_AS_SESSION;
    assert(false, "save_as_session is not yet supported");
}

get_session_configs :: () {
    command := rdbg_Command.GET_SESSION_CONFIGS;
    assert(false, "get_session_configs is not yet supported");
}

delete_session_config :: () {
    command := rdbg_Command.DELETE_SESSION_CONFIG;
    assert(false, "delete_session_config is not yet supported");
}

delete_all_session_configs :: () {
    command := rdbg_Command.DELETE_ALL_SESSION_CONFIGS;
    assert(false, "delete_all_session_configs is not yet supported");
}

goto_file_at_line :: () {
    command := rdbg_Command.GOTO_FILE_AT_LINE;
    assert(false, "goto_file_at_line is not yet supported");
}

close_file :: () {
    command := rdbg_Command.CLOSE_FILE;
    assert(false, "close_file is not yet supported");
}

close_all_files :: () {
    command := rdbg_Command.CLOSE_ALL_FILES;
    assert(false, "close_all_files is not yet supported");
}

get_open_files :: () {
    command := rdbg_Command.GET_OPEN_FILES;
    assert(false, "get_open_files is not yet supported");
}

get_target_state :: () {
    command := rdbg_Command.GET_TARGET_STATE;
    assert(false, "get_target_state is not yet supported");
}

restart_debugging :: () {
    command := rdbg_Command.RESTART_DEBUGGING;
    assert(false, "restart_debugging is not yet supported");
}

attach_to_process_by_pid :: () {
    command := rdbg_Command.ATTACH_TO_PROCESS_BY_PID;
    assert(false, "attach_to_process_by_pid is not yet supported");
}

attach_to_process_by_name :: () {
    command := rdbg_Command.ATTACH_TO_PROCESS_BY_NAME;
    assert(false, "attach_to_process_by_name is not yet supported");
}

detach_from_process :: () {
    command := rdbg_Command.DETACH_FROM_PROCESS;
    assert(false, "detach_from_process is not yet supported");
}

step_into_by_instruction :: () {
    command := rdbg_Command.STEP_INTO_BY_INSTRUCTION;
    assert(false, "step_into_by_instruction is not yet supported");
}

step_over_by_instruction :: () {
    command := rdbg_Command.STEP_OVER_BY_INSTRUCTION;
    assert(false, "step_over_by_instruction is not yet supported");
}

get_function_overloads :: () {
    command := rdbg_Command.GET_FUNCTION_OVERLOADS;
    assert(false, "get_function_overloads is not yet supported");
}

add_breakpoint_at_function :: () {
    command := rdbg_Command.ADD_BREAKPOINT_AT_FUNCTION;
    assert(false, "add_breakpoint_at_function is not yet supported");
}

add_breakpoint_at_address :: () {
    command := rdbg_Command.ADD_BREAKPOINT_AT_ADDRESS;
    assert(false, "add_breakpoint_at_address is not yet supported");
}

add_processor_breakpoint :: () {
    command := rdbg_Command.ADD_PROCESSOR_BREAKPOINT;
    assert(false, "add_processor_breakpoint is not yet supported");
}

get_breakpoint :: () {
    command := rdbg_Command.GET_BREAKPOINT;
    assert(false, "get_breakpoint is not yet supported");
}

get_watches :: () {
    command := rdbg_Command.GET_WATCHES;
    assert(false, "get_watches is not yet supported");
}

add_watch :: () {
    command := rdbg_Command.ADD_WATCH;
    assert(false, "add_watch is not yet supported");
}

update_watch_expression :: () {
    command := rdbg_Command.UPDATE_WATCH_EXPRESSION;
    assert(false, "update_watch_expression is not yet supported");
}

update_watch_comment :: () {
    command := rdbg_Command.UPDATE_WATCH_COMMENT;
    assert(false, "update_watch_comment is not yet supported");
}

delete_watch :: () {
    command := rdbg_Command.DELETE_WATCH;
    assert(false, "delete_watch is not yet supported");
}

delete_all_watches :: () {
    command := rdbg_Command.DELETE_ALL_WATCHES;
    assert(false, "delete_all_watches is not yet supported");
}


#scope_export


Result :: struct {
    result: rdbg_CommandResult;
} #no_padding

Result_Bring_Debugger_To_Foreground :: struct {
    #as using base: Result;
} #no_padding

Result_Set_Window_Pos :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Window_Pos :: struct {
    #as using base: Result;
} #no_padding

Result_Set_Bring_To_Foreground_On_Suspended :: struct {
    #as using base: Result;
} #no_padding

Result_Exit_Debugger :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Is_Session_Modified :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Session_Filename :: struct {
    #as using base: Result;
} #no_padding

Result_New_Session :: struct {
    #as using base: Result;
} #no_padding

Result_Open_Session :: struct {
    #as using base: Result;
} #no_padding

Result_Save_Session :: struct {
    #as using base: Result;
} #no_padding

Result_Save_As_Session :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Session_Configs :: struct {
    #as using base: Result;
} #no_padding

Result_Add_Session_Config :: struct {
    #as using base: Result;
    uid: rdbg_Id #align 1;
} #no_padding

Result_Set_Active_Session_Config :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_Session_Config :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_All_Session_Configs :: struct {
    #as using base: Result;
} #no_padding

Result_Goto_File_At_Line :: struct {
    #as using base: Result;
} #no_padding

Result_Close_File :: struct {
    #as using base: Result;
} #no_padding

Result_Close_All_Files :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Current_File_Prefix :: struct {
    #as using base: Result;
    id: rdbg_Id #align 1;
    filename: rdbg_String #align 1;
} #no_padding

Result_Get_Current_File_Postfix :: struct {
    line_num: u32 #align 1;
} #no_padding

Result_Get_Current_File :: struct {
    #as using base: Result;
    id: rdbg_Id;
    filename: string;
    line_num: u32;
}

Result_Get_Open_Files :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Target_State :: struct {
    #as using base: Result;
} #no_padding

Result_Start_Debugging :: struct {
    #as using base: Result;
} #no_padding

Result_Stop_Debugging :: struct {
    #as using base: Result;
} #no_padding

Result_Restart_Debugging :: struct {
    #as using base: Result;
} #no_padding

Result_Attach_To_Process_By_Pid :: struct {
    #as using base: Result;
} #no_padding

Result_Attach_To_Process_By_Name :: struct {
    #as using base: Result;
} #no_padding

Result_Detach_From_Process :: struct {
    #as using base: Result;
} #no_padding

Result_Step_Into_By_Line :: struct {
    #as using base: Result;
} #no_padding

Result_Step_Into_By_Instruction :: struct {
    #as using base: Result;
} #no_padding

Result_Step_Over_By_Line :: struct {
    #as using base: Result;
} #no_padding

Result_Step_Over_By_Instruction :: struct {
    #as using base: Result;
} #no_padding

Result_Step_Out :: struct {
    #as using base: Result;
} #no_padding

Result_Continue_Execution :: struct {
    #as using base: Result;
} #no_padding

Result_Run_To_File_At_Line :: struct {
    #as using base: Result;
} #no_padding

Result_Break_Execution :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Breakpoints :: struct {
    #as using base: Result;
    breakpoints: [] Breakpoint;
}

Result_Get_Breakpoints_Header :: struct {
    #as using base: Result;
    num_bps: u16 #align 1;
} #no_padding

Breakpoint :: struct {
    uid: rdbg_Id;
    enabled: bool;
    module_name: string;
    condition_expr: string;
    kind: rdbg_BreakpointKind;

    // .FILENAME_LINE (moved this one to be first union member so it automatically prints with the default struct printer)
    filename: string;
    line_num: u32;

    // .FUNCTION_NAME
    #place filename;
    function_name: string;
    overload_id: u32;

    // .ADDRESS
    #place filename;
    address: u64;

    // .PROCESSOR
    #place filename;
    addr_expression: string;
    num_bytes: u8;
    access_kind: rdbg_ProcessorBreakpointAccessKind;
}

parse_get_breakpoints_result :: (result_header: *Result_Get_Breakpoints_Header) -> *Result_Get_Breakpoints {
    result := New(Result_Get_Breakpoints,, temp);
    if result_header.num_bps == 0  return result;

    result.breakpoints = NewArray(result_header.num_bps, Breakpoint,, temp);
    data := (cast(*void) result_header) + size_of(Result_Get_Breakpoints_Header);
    for * result.breakpoints {
        read_and_advance(*data, *it.uid);
        read_and_advance(*data, *it.enabled);
        read_and_advance(*data, *it.module_name);
        read_and_advance(*data, *it.condition_expr);
        read_and_advance(*data, *it.kind);

        if #complete it.kind == {
            case .FILENAME_LINE;
            read_and_advance(*data, *it.filename);
            read_and_advance(*data, *it.line_num);

            case .FUNCTION_NAME;
            read_and_advance(*data, *it.function_name);
            read_and_advance(*data, *it.overload_id);

            case .ADDRESS;
            read_and_advance(*data, *it.address);

            case .PROCESSOR;
            read_and_advance(*data, *it.addr_expression);
            read_and_advance(*data, *it.num_bytes);
            read_and_advance(*data, *it.access_kind);
        }
    }

    return result;
}


Result_Get_Breakpoint_Locations :: struct {
    #as using base: Result;
    bp_id: rdbg_Id;
    locations: [] Breakpoint_Location;
}

Result_Get_Breakpoint_Locations_Header :: struct {
    #as using base: Result;
    num_locs: u16 #align 1;
} #no_padding

Breakpoint_Location :: struct {
    address: u64;
    module_name: string;
    filename: string;
    actual_line_num: u32;
}

parse_get_breakpoint_locations_result :: (result_header: *Result_Get_Breakpoint_Locations_Header, breakpoint_id: rdbg_Id) -> *Result_Get_Breakpoint_Locations {
    result := New(Result_Get_Breakpoint_Locations, initialized=false,, temp);
    result.* = .{ result_header.*, breakpoint_id, .[] };
    if result_header.num_locs == 0  return result;

    result.locations = NewArray(result_header.num_locs, Breakpoint_Location,, temp);
    data := (cast(*void) result_header) + size_of(Result_Get_Breakpoint_Locations_Header);
    for * result.locations {
        read_and_advance(*data, *it.address);
        read_and_advance(*data, *it.module_name);
        read_and_advance(*data, *it.filename);
        read_and_advance(*data, *it.actual_line_num);
    }

    return result;
}


Result_Get_Function_Overloads :: struct {
    #as using base: Result;
} #no_padding

Result_Add_Breakpoint_At_Function :: struct {
    #as using base: Result;
    bp_id: rdbg_Id #align 1;
} #no_padding

Result_Add_Breakpoint_At_Filename_Line :: struct {
    #as using base: Result;
    bp_id: rdbg_Id #align 1;
} #no_padding

Result_Add_Breakpoint_At_Address :: struct {
    #as using base: Result;
    bp_id: rdbg_Id #align 1;
} #no_padding

Result_Add_Processor_Breakpoint :: struct {
    #as using base: Result;
    bp_id: rdbg_Id #align 1;
} #no_padding

Result_Set_Breakpoint_Condition :: struct {
    #as using base: Result;
    bp_id: rdbg_Id #align 1;
} #no_padding

Result_Update_Breakpoint_Line :: struct {
    #as using base: Result;
} #no_padding

Result_Enable_Breakpoint :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_Breakpoint :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_All_Breakpoints :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Breakpoint :: struct {
    #as using base: Result;
} #no_padding

Result_Get_Watches :: struct {
    #as using base: Result;
} #no_padding

Result_Add_Watch :: struct {
    #as using base: Result;
} #no_padding

Result_Update_Watch_Expression :: struct {
    #as using base: Result;
} #no_padding

Result_Update_Watch_Comment :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_Watch :: struct {
    #as using base: Result;
} #no_padding

Result_Delete_All_Watches :: struct {
    #as using base: Result;
} #no_padding


#scope_module


control_pipe_error :: Result.{ .FAIL };

send_control_message :: (message: *$T, size : u32 = 0) -> *Result {
    message_size := ifx size else size_of(T);

    #if VERBOSE {
        if !size {
            print("Sending message:\n%\n", message.*);
        }
        else {
            s : string = ---;
            s.data = (cast(*void)message) + size_of(T);
            s.count = size - size_of(T);
            print("Sending message (%):\n%\n%\n", message_size, message.*, s);
        }
    }

    assert(message_size > 0);

    bytes_read: u32;
    success := TransactNamedPipe(control_pipe, message, message_size, *control_buffer, control_buffer.count, *bytes_read);
    if !success {
        error := GetLastError();
        #if VERBOSE {
            print("Error transacting to Remedy control pipe: %\n", error);
        }
        return *control_pipe_error;
    }

    #if VERBOSE {
        if bytes_read {
            print("Read % bytes\n", bytes_read);
            for i: 0 .. bytes_read - 1
                print("% ", formatInt(control_buffer[i], minimum_digits=2, base=16));
            print("\n");
        }
    }

    return cast(*Result) *control_buffer;
}

fix_filename :: (filename: string) -> string {
    s := copy_string(filename,, temp);
    for 0 .. s.count - 1  if s[it] == #char "/"  s[it] = #char "\\";
    print("Fixed filename: %\n", s);
    return s;
}

Message :: struct {
    cmd: rdbg_Command;
}

Message_Bring_Debugger_To_Foreground :: struct {
    #as using message: Message;
    cmd = .BRING_DEBUGGER_TO_FOREGROUND;
} #no_padding

Message_Set_Window_Pos :: struct {
    #as using message: Message;
    cmd = .SET_WINDOW_POS;
} #no_padding

Message_Get_Window_Pos :: struct {
    #as using message: Message;
    cmd = .GET_WINDOW_POS;
} #no_padding

Message_Set_Bring_To_Foreground_On_Suspended :: struct {
    #as using message: Message;
    cmd = .SET_BRING_TO_FOREGROUND_ON_SUSPENDED;
    bring_to_foreground_on_suspended: bool #align 1;
} #no_padding

Message_Exit_Debugger :: struct {
    #as using message: Message;
    cmd = .EXIT_DEBUGGER;
} #no_padding

Message_Get_Is_Session_Modified :: struct {
    #as using message: Message;
    cmd = .GET_IS_SESSION_MODIFIED;
} #no_padding

Message_Get_Session_Filename :: struct {
    #as using message: Message;
    cmd = .GET_SESSION_FILENAME;
} #no_padding

Message_New_Session :: struct {
    #as using message: Message;
    cmd = rdbg_Command.RDBG_COMMAND_NEW_SESSION;
    dtb: rdbg_DebuggingTargetBehavior #align 1;
    msb: rdbg_ModifiedSessionBehavior #align 1;
} #no_padding

Message_Open_Session :: struct {
    #as using message: Message;
    cmd = .OPEN_SESSION;
} #no_padding

Message_Save_Session :: struct {
    #as using message: Message;
    cmd = .SAVE_SESSION;
} #no_padding

Message_Save_As_Session :: struct {
    #as using message: Message;
    cmd = .SAVE_AS_SESSION;
} #no_padding

Message_Get_Session_Configs :: struct {
    #as using message: Message;
    cmd = .GET_SESSION_CONFIGS;
} #no_padding

Message_Add_Session_Config :: struct {
    #as using message: Message;
    cmd = .ADD_SESSION_CONFIG;
    // command: rdbg_String;
    // command_args: rdbg_String;
    // working_dir: rdbg_String;
    // environment_vars: rdbg_String;
    // inherit_environment_vars_from_parent: bool;
    // break_at_nominal_entry_point: bool;
    // name: rdbg_String;
} #no_padding

make_add_session_config :: (command := "", command_args := "", working_dir := "", environment_vars := [] string, inherit_environment_vars_from_parent := false, break_at_nominal_entry_point := false, name := "") -> *Message_Add_Session_Config, size: u32 {
    builder: String_Builder;

    cmd := rdbg_Command.RDBG_COMMAND_ADD_SESSION_CONFIG;
    append_by_pointer(*builder, *cmd);
    append_as_rdbg_string(*builder, command);
    append_as_rdbg_string(*builder, command_args);
    append_as_rdbg_string(*builder, working_dir);
    append_as_rdbg_string(*builder, ""); // @TODO loop over environment_vars creating \n joined string
    append_by_pointer(*builder, *inherit_environment_vars_from_parent);
    append_by_pointer(*builder, *break_at_nominal_entry_point);
    append_as_rdbg_string(*builder, name);

    data := builder_to_string(*builder,, temp);
    return cast(*Message_Add_Session_Config) data.data, cast,trunc(u32) data.count;
}

Message_Set_Active_Session_Config :: struct {
    #as using message: Message;
    cmd = .SET_ACTIVE_SESSION_CONFIG;
    id: rdbg_Id #align 1;
} #no_padding

Message_Delete_Session_Config :: struct {
    #as using message: Message;
    cmd = .DELETE_SESSION_CONFIG;
} #no_padding

Message_Delete_All_Session_Configs :: struct {
    #as using message: Message;
    cmd = .DELETE_ALL_SESSION_CONFIGS;
} #no_padding

Message_Goto_File_At_Line :: struct {
    #as using message: Message;
    cmd = .GOTO_FILE_AT_LINE;
} #no_padding

Message_Close_File :: struct {
    #as using message: Message;
    cmd = .CLOSE_FILE;
} #no_padding

Message_Close_All_Files :: struct {
    #as using message: Message;
    cmd = .CLOSE_ALL_FILES;
} #no_padding

Message_Get_Current_File :: struct {
    #as using message: Message;
    cmd = rdbg_Command.RDBG_COMMAND_GET_CURRENT_FILE;
} #no_padding

Message_Get_Open_Files :: struct {
    #as using message: Message;
    cmd = .GET_OPEN_FILES;
} #no_padding

Message_Get_Target_State :: struct {
    #as using message: Message;
    cmd = .GET_TARGET_STATE;
} #no_padding

Message_Start_Debugging :: struct {
    #as using message: Message;
    cmd = .START_DEBUGGING;
    break_at_entry_point: bool #align 1;
} #no_padding

Message_Stop_Debugging :: struct {
    #as using message: Message;
    cmd = .STOP_DEBUGGING;
} #no_padding

Message_Restart_Debugging :: struct {
    #as using message: Message;
    cmd = .RESTART_DEBUGGING;
} #no_padding

Message_Attach_To_Process_By_Pid :: struct {
    #as using message: Message;
    cmd = .ATTACH_TO_PROCESS_BY_PID;
} #no_padding

Message_Attach_To_Process_By_Name :: struct {
    #as using message: Message;
    cmd = .ATTACH_TO_PROCESS_BY_NAME;
} #no_padding

Message_Detach_From_Process :: struct {
    #as using message: Message;
    cmd = .DETACH_FROM_PROCESS;
} #no_padding

Message_Step_Into_By_Line :: struct {
    #as using message: Message;
    cmd = .STEP_INTO_BY_LINE;
} #no_padding

Message_Step_Into_By_Instruction :: struct {
    #as using message: Message;
    cmd = .STEP_INTO_BY_INSTRUCTION;
} #no_padding

Message_Step_Over_By_Line :: struct {
    #as using message: Message;
    cmd = .STEP_OVER_BY_LINE;
} #no_padding

Message_Step_Over_By_Instruction :: struct {
    #as using message: Message;
    cmd = .STEP_OVER_BY_INSTRUCTION;
} #no_padding

Message_Step_Out :: struct {
    #as using message: Message;
    cmd = .STEP_OUT;
} #no_padding

Message_Continue_Execution :: struct {
    #as using message: Message;
    cmd = .CONTINUE_EXECUTION;
} #no_padding

Message_Run_To_File_At_Line :: struct {
    #as using message: Message;
    cmd = .RUN_TO_FILE_AT_LINE;
    // filename: rdbg_String;
    // line_num: uint32_t;
} #no_padding

make_run_to_file_at_line :: (filename: string, line_number: u32) -> *Message_Run_To_File_At_Line, size: u32 {
    builder: String_Builder;

    cmd := rdbg_Command.RUN_TO_FILE_AT_LINE;
    append_by_pointer(*builder, *cmd);
    append_as_rdbg_string(*builder, filename);
    append_by_pointer(*builder, *line_number);

    data := builder_to_string(*builder,, temp);
    return cast(*Message_Run_To_File_At_Line) data.data, cast,trunc(u32) data.count;
}

Message_Break_Execution :: struct {
    #as using message: Message;
    cmd = .BREAK_EXECUTION;
} #no_padding

Message_Get_Breakpoints :: struct {
    #as using message: Message;
    cmd = .GET_BREAKPOINTS;
} #no_padding

Message_Get_Breakpoint_Locations :: struct {
    #as using message: Message;
    cmd = .GET_BREAKPOINT_LOCATIONS;
    bp_id: rdbg_Id #align 1;
} #no_padding

Message_Get_Function_Overloads :: struct {
    #as using message: Message;
    cmd = .GET_FUNCTION_OVERLOADS;
} #no_padding

Message_Add_Breakpoint_At_Function :: struct {
    #as using message: Message;
    cmd = .ADD_BREAKPOINT_AT_FUNCTION;
} #no_padding

Message_Add_Breakpoint_At_Filename_Line :: struct {
    #as using message: Message;
    cmd = .ADD_BREAKPOINT_AT_FILENAME_LINE;
    // filename: rdbg_String;
    // line_num: u32;
    // condition_expr: rdbg_String;
} #no_padding

make_add_breakpoint_at_filename_line :: (filename: string, line_number: u32, condition: string) -> *Message_Add_Breakpoint_At_Filename_Line, size: u32 {
    builder: String_Builder;

    cmd := rdbg_Command.RDBG_COMMAND_ADD_BREAKPOINT_AT_FILENAME_LINE;
    append_by_pointer(*builder, *cmd);
    append_as_rdbg_string(*builder, filename);
    append_by_pointer(*builder, *line_number);
    append_as_rdbg_string(*builder, condition);

    data := builder_to_string(*builder,, temp);
    return cast(*Message_Add_Breakpoint_At_Filename_Line) data.data, cast,trunc(u32) data.count;
}

Message_Add_Breakpoint_At_Address :: struct {
    #as using message: Message;
    cmd = .ADD_BREAKPOINT_AT_ADDRESS;
} #no_padding

Message_Add_Processor_Breakpoint :: struct {
    #as using message: Message;
    cmd = .ADD_PROCESSOR_BREAKPOINT;
} #no_padding

Message_Set_Breakpoint_Condition :: struct {
    #as using message: Message;
    cmd = .SET_BREAKPOINT_CONDITION;
} #no_padding

Message_Update_Breakpoint_Line :: struct {
    #as using message: Message;
    cmd = .UPDATE_BREAKPOINT_LINE;
    bp_id: rdbg_Id #align 1;
    line_num: u32 #align 1;
} #no_padding

Message_Enable_Breakpoint :: struct {
    #as using message: Message;
    cmd = .ENABLE_BREAKPOINT;
    bp_id: rdbg_Id #align 1;
    enable: bool #align 1;
} #no_padding

Message_Delete_Breakpoint :: struct {
    #as using message: Message;
    cmd = .DELETE_BREAKPOINT;
    bp_id: rdbg_Id #align 1;
} #no_padding

Message_Delete_All_Breakpoints :: struct {
    #as using message: Message;
    cmd = .DELETE_ALL_BREAKPOINTS;
} #no_padding

Message_Get_Breakpoint :: struct {
    #as using message: Message;
    cmd = .GET_BREAKPOINT;
} #no_padding

Message_Get_Watches :: struct {
    #as using message: Message;
    cmd = .GET_WATCHES;
} #no_padding

Message_Add_Watch :: struct {
    #as using message: Message;
    cmd = .ADD_WATCH;
} #no_padding

Message_Update_Watch_Expression :: struct {
    #as using message: Message;
    cmd = .UPDATE_WATCH_EXPRESSION;
} #no_padding

Message_Update_Watch_Comment :: struct {
    #as using message: Message;
    cmd = .UPDATE_WATCH_COMMENT;
} #no_padding

Message_Delete_Watch :: struct {
    #as using message: Message;
    cmd = .DELETE_WATCH;
} #no_padding

Message_Delete_All_Watches :: struct {
    #as using message: Message;
    cmd = .DELETE_ALL_WATCHES;
} #no_padding


