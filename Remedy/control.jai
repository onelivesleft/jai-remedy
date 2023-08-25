result_callbacks : struct {
    open_session :                         type_of(handle_open_session_control_result);
    bring_debugger_to_foreground :         type_of(handle_bring_debugger_to_foreground_control_result);
    set_window_pos :                       type_of(handle_set_window_pos_control_result);
    get_window_pos :                       type_of(handle_get_window_pos_control_result);
    set_bring_to_foreground_on_suspended : type_of(handle_set_bring_to_foreground_on_suspended_control_result);
    exit_debugger :                        type_of(handle_exit_debugger_control_result);
    get_is_session_modified :              type_of(handle_get_is_session_modified_control_result);
    get_session_filename :                 type_of(handle_get_session_filename_control_result);
    new_session :                          type_of(handle_new_session_control_result);
    save_session :                         type_of(handle_save_session_control_result);
    save_as_session :                      type_of(handle_save_as_session_control_result);
    get_session_configs :                  type_of(handle_get_session_configs_control_result);
    add_session_config :                   type_of(handle_add_session_config_control_result);
    set_active_session_config :            type_of(handle_set_active_session_config_control_result);
    delete_session_config :                type_of(handle_delete_session_config_control_result);
    delete_all_session_configs :           type_of(handle_delete_all_session_configs_control_result);
    goto_file_at_line :                    type_of(handle_goto_file_at_line_control_result);
    close_file :                           type_of(handle_close_file_control_result);
    close_all_files :                      type_of(handle_close_all_files_control_result);
    get_current_file :                     type_of(handle_get_current_file_control_result);
    get_open_files :                       type_of(handle_get_open_files_control_result);
    get_target_state :                     type_of(handle_get_target_state_control_result);
    start_debugging :                      type_of(handle_start_debugging_control_result);
    stop_debugging :                       type_of(handle_stop_debugging_control_result);
    restart_debugging :                    type_of(handle_restart_debugging_control_result);
    attach_to_process_by_pid :             type_of(handle_attach_to_process_by_pid_control_result);
    attach_to_process_by_name :            type_of(handle_attach_to_process_by_name_control_result);
    detach_from_process :                  type_of(handle_detach_from_process_control_result);
    step_into_by_line :                    type_of(handle_step_into_by_line_control_result);
    step_into_by_instruction :             type_of(handle_step_into_by_instruction_control_result);
    step_over_by_line :                    type_of(handle_step_over_by_line_control_result);
    step_over_by_instruction :             type_of(handle_step_over_by_instruction_control_result);
    step_out :                             type_of(handle_step_out_control_result);
    continue_execution :                   type_of(handle_continue_execution_control_result);
    run_to_file_at_line :                  type_of(handle_run_to_file_at_line_control_result);
    break_execution :                      type_of(handle_break_execution_control_result);
    get_breakpoints :                      type_of(handle_get_breakpoints_control_result);
    get_breakpoint_locations :             type_of(handle_get_breakpoint_locations_control_result);
    get_function_overloads :               type_of(handle_get_function_overloads_control_result);
    add_breakpoint_at_function :           type_of(handle_add_breakpoint_at_function_control_result);
    add_breakpoint_at_filename_line :      type_of(handle_add_breakpoint_at_filename_line_control_result);
    add_breakpoint_at_address :            type_of(handle_add_breakpoint_at_address_control_result);
    add_processor_breakpoint :             type_of(handle_add_processor_breakpoint_control_result);
    set_breakpoint_condition :             type_of(handle_set_breakpoint_condition_control_result);
    update_breakpoint_line :               type_of(handle_update_breakpoint_line_control_result);
    enable_breakpoint :                    type_of(handle_enable_breakpoint_control_result);
    delete_breakpoint :                    type_of(handle_delete_breakpoint_control_result);
    delete_all_breakpoints :               type_of(handle_delete_all_breakpoints_control_result);
    get_breakpoint :                       type_of(handle_get_breakpoint_control_result);
    get_watches :                          type_of(handle_get_watches_control_result);
    add_watch :                            type_of(handle_add_watch_control_result);
    update_watch_expression :              type_of(handle_update_watch_expression_control_result);
    update_watch_comment :                 type_of(handle_update_watch_comment_control_result);
    delete_watch :                         type_of(handle_delete_watch_control_result);
    delete_all_watches :                   type_of(handle_delete_all_watches_control_result);
}


new_session :: (debugging_target_behavior := rdbg_DebuggingTargetBehavior.RDBG_IF_DEBUGGING_TARGET_STOP_DEBUGGING, modified_session_behavior := rdbg_ModifiedSessionBehavior.RDBG_IF_SESSION_IS_MODIFIED_CONTINUE_WITHOUT_SAVING) {
    message := Message_New_Session.{
        dtb = debugging_target_behavior,
        msb = modified_session_behavior,
    };

    send_control_message(*message);
}

get_current_file :: () {
    message := Message_Get_Current_File.{};
    send_control_message(*message);
}


step_over_by_line :: () {
    message := Message_Step_Over_By_Line.{};
    send_control_message(*message);
}


#scope_module


bring_debugger_to_foreground :: () {
    command := rdbg_Command.RDBG_COMMAND_BRING_DEBUGGER_TO_FOREGROUND;
    assert(false, "bring_debugger_to_foreground is not yet supported");
}

set_window_pos :: () {
    command := rdbg_Command.RDBG_COMMAND_SET_WINDOW_POS;
    assert(false, "set_window_pos is not yet supported");
}

get_window_pos :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_WINDOW_POS;
    assert(false, "get_window_pos is not yet supported");
}

set_bring_to_foreground_on_suspended :: () {
    command := rdbg_Command.RDBG_COMMAND_SET_BRING_TO_FOREGROUND_ON_SUSPENDED;
    assert(false, "set_bring_to_foreground_on_suspended is not yet supported");
}

exit_debugger :: () {
    command := rdbg_Command.RDBG_COMMAND_EXIT_DEBUGGER;
    assert(false, "exit_debugger is not yet supported");
}

get_is_session_modified :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_IS_SESSION_MODIFIED;
    assert(false, "get_is_session_modified is not yet supported");
}

get_session_filename :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_SESSION_FILENAME;
    assert(false, "get_session_filename is not yet supported");
}


open_session :: () {
    command := rdbg_Command.RDBG_COMMAND_OPEN_SESSION;
    assert(false, "open_session is not yet supported");
}

save_session :: () {
    command := rdbg_Command.RDBG_COMMAND_SAVE_SESSION;
    assert(false, "save_session is not yet supported");
}

save_as_session :: () {
    command := rdbg_Command.RDBG_COMMAND_SAVE_AS_SESSION;
    assert(false, "save_as_session is not yet supported");
}

get_session_configs :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_SESSION_CONFIGS;
    assert(false, "get_session_configs is not yet supported");
}

add_session_config :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_SESSION_CONFIG;
    assert(false, "add_session_config is not yet supported");
}

set_active_session_config :: () {
    command := rdbg_Command.RDBG_COMMAND_SET_ACTIVE_SESSION_CONFIG;
    assert(false, "set_active_session_config is not yet supported");
}

delete_session_config :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_SESSION_CONFIG;
    assert(false, "delete_session_config is not yet supported");
}

delete_all_session_configs :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_ALL_SESSION_CONFIGS;
    assert(false, "delete_all_session_configs is not yet supported");
}

goto_file_at_line :: () {
    command := rdbg_Command.RDBG_COMMAND_GOTO_FILE_AT_LINE;
    assert(false, "goto_file_at_line is not yet supported");
}

close_file :: () {
    command := rdbg_Command.RDBG_COMMAND_CLOSE_FILE;
    assert(false, "close_file is not yet supported");
}

close_all_files :: () {
    command := rdbg_Command.RDBG_COMMAND_CLOSE_ALL_FILES;
    assert(false, "close_all_files is not yet supported");
}


get_open_files :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_OPEN_FILES;
    assert(false, "get_open_files is not yet supported");
}

get_target_state :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_TARGET_STATE;
    assert(false, "get_target_state is not yet supported");
}

start_debugging :: () {
    command := rdbg_Command.RDBG_COMMAND_START_DEBUGGING;
    assert(false, "start_debugging is not yet supported");
}

stop_debugging :: () {
    command := rdbg_Command.RDBG_COMMAND_STOP_DEBUGGING;
    assert(false, "stop_debugging is not yet supported");
}

restart_debugging :: () {
    command := rdbg_Command.RDBG_COMMAND_RESTART_DEBUGGING;
    assert(false, "restart_debugging is not yet supported");
}

attach_to_process_by_pid :: () {
    command := rdbg_Command.RDBG_COMMAND_ATTACH_TO_PROCESS_BY_PID;
    assert(false, "attach_to_process_by_pid is not yet supported");
}

attach_to_process_by_name :: () {
    command := rdbg_Command.RDBG_COMMAND_ATTACH_TO_PROCESS_BY_NAME;
    assert(false, "attach_to_process_by_name is not yet supported");
}

detach_from_process :: () {
    command := rdbg_Command.RDBG_COMMAND_DETACH_FROM_PROCESS;
    assert(false, "detach_from_process is not yet supported");
}

step_into_by_line :: () {
    command := rdbg_Command.RDBG_COMMAND_STEP_INTO_BY_LINE;
    assert(false, "step_into_by_line is not yet supported");
}

step_into_by_instruction :: () {
    command := rdbg_Command.RDBG_COMMAND_STEP_INTO_BY_INSTRUCTION;
    assert(false, "step_into_by_instruction is not yet supported");
}

step_over_by_instruction :: () {
    command := rdbg_Command.RDBG_COMMAND_STEP_OVER_BY_INSTRUCTION;
    assert(false, "step_over_by_instruction is not yet supported");
}

step_out :: () {
    command := rdbg_Command.RDBG_COMMAND_STEP_OUT;
    assert(false, "step_out is not yet supported");
}

continue_execution :: () {
    command := rdbg_Command.RDBG_COMMAND_CONTINUE_EXECUTION;
    assert(false, "continue_execution is not yet supported");
}

run_to_file_at_line :: () {
    command := rdbg_Command.RDBG_COMMAND_RUN_TO_FILE_AT_LINE;
    assert(false, "run_to_file_at_line is not yet supported");
}

break_execution :: () {
    command := rdbg_Command.RDBG_COMMAND_BREAK_EXECUTION;
    assert(false, "break_execution is not yet supported");
}

get_breakpoints :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_BREAKPOINTS;
    assert(false, "get_breakpoints is not yet supported");
}

get_breakpoint_locations :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_BREAKPOINT_LOCATIONS;
    assert(false, "get_breakpoint_locations is not yet supported");
}

get_function_overloads :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_FUNCTION_OVERLOADS;
    assert(false, "get_function_overloads is not yet supported");
}

add_breakpoint_at_function :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_BREAKPOINT_AT_FUNCTION;
    assert(false, "add_breakpoint_at_function is not yet supported");
}

add_breakpoint_at_filename_line :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_BREAKPOINT_AT_FILENAME_LINE;
    assert(false, "add_breakpoint_at_filename_line is not yet supported");
}

add_breakpoint_at_address :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_BREAKPOINT_AT_ADDRESS;
    assert(false, "add_breakpoint_at_address is not yet supported");
}

add_processor_breakpoint :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_PROCESSOR_BREAKPOINT;
    assert(false, "add_processor_breakpoint is not yet supported");
}

set_breakpoint_condition :: () {
    command := rdbg_Command.RDBG_COMMAND_SET_BREAKPOINT_CONDITION;
    assert(false, "set_breakpoint_condition is not yet supported");
}

update_breakpoint_line :: () {
    command := rdbg_Command.RDBG_COMMAND_UPDATE_BREAKPOINT_LINE;
    assert(false, "update_breakpoint_line is not yet supported");
}

enable_breakpoint :: () {
    command := rdbg_Command.RDBG_COMMAND_ENABLE_BREAKPOINT;
    assert(false, "enable_breakpoint is not yet supported");
}

delete_breakpoint :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_BREAKPOINT;
    assert(false, "delete_breakpoint is not yet supported");
}

delete_all_breakpoints :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_ALL_BREAKPOINTS;
    assert(false, "delete_all_breakpoints is not yet supported");
}

get_breakpoint :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_BREAKPOINT;
    assert(false, "get_breakpoint is not yet supported");
}

get_watches :: () {
    command := rdbg_Command.RDBG_COMMAND_GET_WATCHES;
    assert(false, "get_watches is not yet supported");
}

add_watch :: () {
    command := rdbg_Command.RDBG_COMMAND_ADD_WATCH;
    assert(false, "add_watch is not yet supported");
}

update_watch_expression :: () {
    command := rdbg_Command.RDBG_COMMAND_UPDATE_WATCH_EXPRESSION;
    assert(false, "update_watch_expression is not yet supported");
}

update_watch_comment :: () {
    command := rdbg_Command.RDBG_COMMAND_UPDATE_WATCH_COMMENT;
    assert(false, "update_watch_comment is not yet supported");
}

delete_watch :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_WATCH;
    assert(false, "delete_watch is not yet supported");
}

delete_all_watches :: () {
    command := rdbg_Command.RDBG_COMMAND_DELETE_ALL_WATCHES;
    assert(false, "delete_all_watches is not yet supported");
}


#scope_export


Result :: struct {
    result: rdbg_CommandResult;
} #no_padding

Result_Bring_Debugger_To_Foreground :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Set_Window_Pos :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Window_Pos :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Set_Bring_To_Foreground_On_Suspended :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Exit_Debugger :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Is_Session_Modified :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Session_Filename :: struct {
    #as using base: Result;
    size :: 2;
}

Result_New_Session :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Open_Session :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Save_Session :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Save_As_Session :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Session_Configs :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Session_Config :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Set_Active_Session_Config :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_Session_Config :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_All_Session_Configs :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Goto_File_At_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Close_File :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Close_All_Files :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Current_File :: struct {
    #as using base: Result;
    id: rdbg_Id;
    filename: string;
    line_num: u32;
}

Result_Get_Open_Files :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Target_State :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Start_Debugging :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Stop_Debugging :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Restart_Debugging :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Attach_To_Process_By_Pid :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Attach_To_Process_By_Name :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Detach_From_Process :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Step_Into_By_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Step_Into_By_Instruction :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Step_Over_By_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Step_Over_By_Instruction :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Step_Out :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Continue_Execution :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Run_To_File_At_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Break_Execution :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Breakpoints :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Breakpoint_Locations :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Function_Overloads :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Breakpoint_At_Function :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Breakpoint_At_Filename_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Breakpoint_At_Address :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Processor_Breakpoint :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Set_Breakpoint_Condition :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Update_Breakpoint_Line :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Enable_Breakpoint :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_Breakpoint :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_All_Breakpoints :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Breakpoint :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Get_Watches :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Add_Watch :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Update_Watch_Expression :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Update_Watch_Comment :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_Watch :: struct {
    #as using base: Result;
    size :: 2;
}

Result_Delete_All_Watches :: struct {
    #as using base: Result;
    size :: 2;
}


#scope_module


send_control_message :: (message: *$T) {
    assert(message.size > 0);
    expect(message.cmd);

    bytes_written : u32 = ---;
    result := WriteFile(control_pipe, message, cast(u32) message.size, *bytes_written, null);
    if !result || !bytes_written {
        error := GetLastError();
        print("Error writing to Remedy control pipe: %\n", error);
    }
}

expected_results : [..] rdbg_Command;
expect :: (for_command: rdbg_Command) {
    array_add(*expected_results, for_command);
}



process_control_results :: () {
    success, count := read_pipe(control_pipe, control_receive_buffer);
    if !success {
        error := GetLastError();
        print("Error reading from Remedy control pipe: %\n", error);
        return;
    }

    if !count  return;

    print("Read % bytes\n", count);
    for i: 0 .. count - 1
        print("% ", formatInt(control_receive_buffer[i], minimum_digits=2, base=16));
    print("\n");

    data := control_receive_buffer.data;

    while count > 0 {
        advance := 0;
        defer {
            assert(advance > 0);
            assert(advance <= count, "We tried to advance past the end of the received data.");
            data += advance;
            count -= advance;
        }
        assert(expected_results.count > 0);
        result_command := expected_results[0];
        array_ordered_remove_by_index(*expected_results, 0);
        result := cast(*Result) data;
        print("Result: %\n", result.*);
        if result.result != .RDBG_COMMAND_RESULT_OK {
            print("Error result: %\nExpected: %\n", result.result, result_command);
            advance = 2;
            continue;
        }

        if #complete result_command == {
            case .RDBG_COMMAND_OPEN_SESSION;
            open_session_result := (cast(*Result_Open_Session) result).*;
            advance = Result_Open_Session.size;
            handle_open_session_control_result(open_session_result);

            case .RDBG_COMMAND_BRING_DEBUGGER_TO_FOREGROUND;
            bring_debugger_to_foreground_result := (cast(*Result_Bring_Debugger_To_Foreground) result).*;
            advance = Result_Bring_Debugger_To_Foreground.size;
            handle_bring_debugger_to_foreground_control_result(bring_debugger_to_foreground_result);

            case .RDBG_COMMAND_SET_WINDOW_POS;
            set_window_pos_result := (cast(*Result_Set_Window_Pos) result).*;
            advance = Result_Set_Window_Pos.size;
            handle_set_window_pos_control_result(set_window_pos_result);

            case .RDBG_COMMAND_GET_WINDOW_POS;
            get_window_pos_result := (cast(*Result_Get_Window_Pos) result).*;
            advance = Result_Get_Window_Pos.size;
            handle_get_window_pos_control_result(get_window_pos_result);

            case .RDBG_COMMAND_SET_BRING_TO_FOREGROUND_ON_SUSPENDED;
            set_bring_to_foreground_on_suspended_result := (cast(*Result_Set_Bring_To_Foreground_On_Suspended) result).*;
            advance = Result_Set_Bring_To_Foreground_On_Suspended.size;
            handle_set_bring_to_foreground_on_suspended_control_result(set_bring_to_foreground_on_suspended_result);

            case .RDBG_COMMAND_EXIT_DEBUGGER;
            exit_debugger_result := (cast(*Result_Exit_Debugger) result).*;
            advance = Result_Exit_Debugger.size;
            handle_exit_debugger_control_result(exit_debugger_result);

            case .RDBG_COMMAND_GET_IS_SESSION_MODIFIED;
            get_is_session_modified_result := (cast(*Result_Get_Is_Session_Modified) result).*;
            advance = Result_Get_Is_Session_Modified.size;
            handle_get_is_session_modified_control_result(get_is_session_modified_result);

            case .RDBG_COMMAND_GET_SESSION_FILENAME;
            get_session_filename_result := (cast(*Result_Get_Session_Filename) result).*;
            advance = Result_Get_Session_Filename.size;
            handle_get_session_filename_control_result(get_session_filename_result);

            case .RDBG_COMMAND_NEW_SESSION;
            new_session_result := (cast(*Result_New_Session) result).*;
            advance = Result_New_Session.size;
            handle_new_session_control_result(new_session_result);

            case .RDBG_COMMAND_SAVE_SESSION;
            save_session_result := (cast(*Result_Save_Session) result).*;
            advance = Result_Save_Session.size;
            handle_save_session_control_result(save_session_result);

            case .RDBG_COMMAND_SAVE_AS_SESSION;
            save_as_session_result := (cast(*Result_Save_As_Session) result).*;
            advance = Result_Save_As_Session.size;
            handle_save_as_session_control_result(save_as_session_result);

            case .RDBG_COMMAND_GET_SESSION_CONFIGS;
            get_session_configs_result := (cast(*Result_Get_Session_Configs) result).*;
            advance = Result_Get_Session_Configs.size;
            handle_get_session_configs_control_result(get_session_configs_result);

            case .RDBG_COMMAND_ADD_SESSION_CONFIG;
            add_session_config_result := (cast(*Result_Add_Session_Config) result).*;
            advance = Result_Add_Session_Config.size;
            handle_add_session_config_control_result(add_session_config_result);

            case .RDBG_COMMAND_SET_ACTIVE_SESSION_CONFIG;
            set_active_session_config_result := (cast(*Result_Set_Active_Session_Config) result).*;
            advance = Result_Set_Active_Session_Config.size;
            handle_set_active_session_config_control_result(set_active_session_config_result);

            case .RDBG_COMMAND_DELETE_SESSION_CONFIG;
            delete_session_config_result := (cast(*Result_Delete_Session_Config) result).*;
            advance = Result_Delete_Session_Config.size;
            handle_delete_session_config_control_result(delete_session_config_result);

            case .RDBG_COMMAND_DELETE_ALL_SESSION_CONFIGS;
            delete_all_session_configs_result := (cast(*Result_Delete_All_Session_Configs) result).*;
            advance = Result_Delete_All_Session_Configs.size;
            handle_delete_all_session_configs_control_result(delete_all_session_configs_result);

            case .RDBG_COMMAND_GOTO_FILE_AT_LINE;
            goto_file_at_line_result := (cast(*Result_Goto_File_At_Line) result).*;
            advance = Result_Goto_File_At_Line.size;
            handle_goto_file_at_line_control_result(goto_file_at_line_result);

            case .RDBG_COMMAND_CLOSE_FILE;
            close_file_result := (cast(*Result_Close_File) result).*;
            advance = Result_Close_File.size;
            handle_close_file_control_result(close_file_result);

            case .RDBG_COMMAND_CLOSE_ALL_FILES;
            close_all_files_result := (cast(*Result_Close_All_Files) result).*;
            advance = Result_Close_All_Files.size;
            handle_close_all_files_control_result(close_all_files_result);

            case .RDBG_COMMAND_GET_CURRENT_FILE;
            prefix := cast(*Result_Get_Current_File_Prefix) data;
            print("%\n", prefix.*);
            postfix := cast(*Result_Get_Current_File_Postfix) (data + prefix.filename.count + Result_Get_Current_File_Prefix.size);
            print("%\n", postfix.*);
            advance = cast(*void)postfix - data + Result_Get_Current_File_Postfix.size;
            get_current_rent_file_result := Result_Get_Current_File.{
                prefix.base, prefix.id, copy_string(*prefix.filename), postfix.line_num
            };
            assert(advance <= count, "We tried to advance past the end of the received data.");
            handle_get_current_file_control_result(get_current_rent_file_result);

            case .RDBG_COMMAND_GET_OPEN_FILES;
            get_open_files_result := (cast(*Result_Get_Open_Files) result).*;
            advance = Result_Get_Open_Files.size;
            handle_get_open_files_control_result(get_open_files_result);

            case .RDBG_COMMAND_GET_TARGET_STATE;
            get_target_state_result := (cast(*Result_Get_Target_State) result).*;
            advance = Result_Get_Target_State.size;
            handle_get_target_state_control_result(get_target_state_result);

            case .RDBG_COMMAND_START_DEBUGGING;
            start_debugging_result := (cast(*Result_Start_Debugging) result).*;
            advance = Result_Start_Debugging.size;
            handle_start_debugging_control_result(start_debugging_result);

            case .RDBG_COMMAND_STOP_DEBUGGING;
            stop_debugging_result := (cast(*Result_Stop_Debugging) result).*;
            advance = Result_Stop_Debugging.size;
            handle_stop_debugging_control_result(stop_debugging_result);

            case .RDBG_COMMAND_RESTART_DEBUGGING;
            restart_debugging_result := (cast(*Result_Restart_Debugging) result).*;
            advance = Result_Restart_Debugging.size;
            handle_restart_debugging_control_result(restart_debugging_result);

            case .RDBG_COMMAND_ATTACH_TO_PROCESS_BY_PID;
            attach_to_process_by_pid_result := (cast(*Result_Attach_To_Process_By_Pid) result).*;
            advance = Result_Attach_To_Process_By_Pid.size;
            handle_attach_to_process_by_pid_control_result(attach_to_process_by_pid_result);

            case .RDBG_COMMAND_ATTACH_TO_PROCESS_BY_NAME;
            attach_to_process_by_name_result := (cast(*Result_Attach_To_Process_By_Name) result).*;
            advance = Result_Attach_To_Process_By_Name.size;
            handle_attach_to_process_by_name_control_result(attach_to_process_by_name_result);

            case .RDBG_COMMAND_DETACH_FROM_PROCESS;
            detach_from_process_result := (cast(*Result_Detach_From_Process) result).*;
            advance = Result_Detach_From_Process.size;
            handle_detach_from_process_control_result(detach_from_process_result);

            case .RDBG_COMMAND_STEP_INTO_BY_LINE;
            step_into_by_line_result := (cast(*Result_Step_Into_By_Line) result).*;
            advance = Result_Step_Into_By_Line.size;
            handle_step_into_by_line_control_result(step_into_by_line_result);

            case .RDBG_COMMAND_STEP_INTO_BY_INSTRUCTION;
            step_into_by_instruction_result := (cast(*Result_Step_Into_By_Instruction) result).*;
            advance = Result_Step_Into_By_Instruction.size;
            handle_step_into_by_instruction_control_result(step_into_by_instruction_result);

            case .RDBG_COMMAND_STEP_OVER_BY_LINE;
            step_over_by_line_result := (cast(*Result_Step_Over_By_Line) result).*;
            advance = Result_Step_Over_By_Line.size;
            handle_step_over_by_line_control_result(step_over_by_line_result);

            case .RDBG_COMMAND_STEP_OVER_BY_INSTRUCTION;
            step_over_by_instruction_result := (cast(*Result_Step_Over_By_Instruction) result).*;
            advance = Result_Step_Over_By_Instruction.size;
            handle_step_over_by_instruction_control_result(step_over_by_instruction_result);

            case .RDBG_COMMAND_STEP_OUT;
            step_out_result := (cast(*Result_Step_Out) result).*;
            advance = Result_Step_Out.size;
            handle_step_out_control_result(step_out_result);

            case .RDBG_COMMAND_CONTINUE_EXECUTION;
            continue_execution_result := (cast(*Result_Continue_Execution) result).*;
            advance = Result_Continue_Execution.size;
            handle_continue_execution_control_result(continue_execution_result);

            case .RDBG_COMMAND_RUN_TO_FILE_AT_LINE;
            run_to_file_at_line_result := (cast(*Result_Run_To_File_At_Line) result).*;
            advance = Result_Run_To_File_At_Line.size;
            handle_run_to_file_at_line_control_result(run_to_file_at_line_result);

            case .RDBG_COMMAND_BREAK_EXECUTION;
            break_execution_result := (cast(*Result_Break_Execution) result).*;
            advance = Result_Break_Execution.size;
            handle_break_execution_control_result(break_execution_result);

            case .RDBG_COMMAND_GET_BREAKPOINTS;
            get_breakpoints_result := (cast(*Result_Get_Breakpoints) result).*;
            advance = Result_Get_Breakpoints.size;
            handle_get_breakpoints_control_result(get_breakpoints_result);

            case .RDBG_COMMAND_GET_BREAKPOINT_LOCATIONS;
            get_breakpoint_locations_result := (cast(*Result_Get_Breakpoint_Locations) result).*;
            advance = Result_Get_Breakpoint_Locations.size;
            handle_get_breakpoint_locations_control_result(get_breakpoint_locations_result);

            case .RDBG_COMMAND_GET_FUNCTION_OVERLOADS;
            get_function_overloads_result := (cast(*Result_Get_Function_Overloads) result).*;
            advance = Result_Get_Function_Overloads.size;
            handle_get_function_overloads_control_result(get_function_overloads_result);

            case .RDBG_COMMAND_ADD_BREAKPOINT_AT_FUNCTION;
            add_breakpoint_at_function_result := (cast(*Result_Add_Breakpoint_At_Function) result).*;
            advance = Result_Add_Breakpoint_At_Function.size;
            handle_add_breakpoint_at_function_control_result(add_breakpoint_at_function_result);

            case .RDBG_COMMAND_ADD_BREAKPOINT_AT_FILENAME_LINE;
            add_breakpoint_at_filename_line_result := (cast(*Result_Add_Breakpoint_At_Filename_Line) result).*;
            advance = Result_Add_Breakpoint_At_Filename_Line.size;
            handle_add_breakpoint_at_filename_line_control_result(add_breakpoint_at_filename_line_result);

            case .RDBG_COMMAND_ADD_BREAKPOINT_AT_ADDRESS;
            add_breakpoint_at_address_result := (cast(*Result_Add_Breakpoint_At_Address) result).*;
            advance = Result_Add_Breakpoint_At_Address.size;
            handle_add_breakpoint_at_address_control_result(add_breakpoint_at_address_result);

            case .RDBG_COMMAND_ADD_PROCESSOR_BREAKPOINT;
            add_processor_breakpoint_result := (cast(*Result_Add_Processor_Breakpoint) result).*;
            advance = Result_Add_Processor_Breakpoint.size;
            handle_add_processor_breakpoint_control_result(add_processor_breakpoint_result);

            case .RDBG_COMMAND_SET_BREAKPOINT_CONDITION;
            set_breakpoint_condition_result := (cast(*Result_Set_Breakpoint_Condition) result).*;
            advance = Result_Set_Breakpoint_Condition.size;
            handle_set_breakpoint_condition_control_result(set_breakpoint_condition_result);

            case .RDBG_COMMAND_UPDATE_BREAKPOINT_LINE;
            update_breakpoint_line_result := (cast(*Result_Update_Breakpoint_Line) result).*;
            advance = Result_Update_Breakpoint_Line.size;
            handle_update_breakpoint_line_control_result(update_breakpoint_line_result);

            case .RDBG_COMMAND_ENABLE_BREAKPOINT;
            enable_breakpoint_result := (cast(*Result_Enable_Breakpoint) result).*;
            advance = Result_Enable_Breakpoint.size;
            handle_enable_breakpoint_control_result(enable_breakpoint_result);

            case .RDBG_COMMAND_DELETE_BREAKPOINT;
            delete_breakpoint_result := (cast(*Result_Delete_Breakpoint) result).*;
            advance = Result_Delete_Breakpoint.size;
            handle_delete_breakpoint_control_result(delete_breakpoint_result);

            case .RDBG_COMMAND_DELETE_ALL_BREAKPOINTS;
            delete_all_breakpoints_result := (cast(*Result_Delete_All_Breakpoints) result).*;
            advance = Result_Delete_All_Breakpoints.size;
            handle_delete_all_breakpoints_control_result(delete_all_breakpoints_result);

            case .RDBG_COMMAND_GET_BREAKPOINT;
            get_breakpoint_result := (cast(*Result_Get_Breakpoint) result).*;
            advance = Result_Get_Breakpoint.size;
            handle_get_breakpoint_control_result(get_breakpoint_result);

            case .RDBG_COMMAND_GET_WATCHES;
            get_watches_result := (cast(*Result_Get_Watches) result).*;
            advance = Result_Get_Watches.size;
            handle_get_watches_control_result(get_watches_result);

            case .RDBG_COMMAND_ADD_WATCH;
            add_watch_result := (cast(*Result_Add_Watch) result).*;
            advance = Result_Add_Watch.size;
            handle_add_watch_control_result(add_watch_result);

            case .RDBG_COMMAND_UPDATE_WATCH_EXPRESSION;
            update_watch_expression_result := (cast(*Result_Update_Watch_Expression) result).*;
            advance = Result_Update_Watch_Expression.size;
            handle_update_watch_expression_control_result(update_watch_expression_result);

            case .RDBG_COMMAND_UPDATE_WATCH_COMMENT;
            update_watch_comment_result := (cast(*Result_Update_Watch_Comment) result).*;
            advance = Result_Update_Watch_Comment.size;
            handle_update_watch_comment_control_result(update_watch_comment_result);

            case .RDBG_COMMAND_DELETE_WATCH;
            delete_watch_result := (cast(*Result_Delete_Watch) result).*;
            advance = Result_Delete_Watch.size;
            handle_delete_watch_control_result(delete_watch_result);

            case .RDBG_COMMAND_DELETE_ALL_WATCHES;
            delete_all_watches_result := (cast(*Result_Delete_All_Watches) result).*;
            advance = Result_Delete_All_Watches.size;
            handle_delete_all_watches_control_result(delete_all_watches_result);
        }
    }
}


Message :: struct {
    cmd: rdbg_Command;
}

Message_Bring_Debugger_To_Foreground :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_BRING_DEBUGGER_TO_FOREGROUND;
    size :: 2;
}

Message_Set_Window_Pos :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SET_WINDOW_POS;
    size :: 2;
}

Message_Get_Window_Pos :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_WINDOW_POS;
    size :: 2;
}

Message_Set_Bring_To_Foreground_On_Suspended :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SET_BRING_TO_FOREGROUND_ON_SUSPENDED;
    size :: 2;
}

Message_Exit_Debugger :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_EXIT_DEBUGGER;
    size :: 2;
}

Message_Get_Is_Session_Modified :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_IS_SESSION_MODIFIED;
    size :: 2;
}

Message_Get_Session_Filename :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_SESSION_FILENAME;
    size :: 2;
}

Message_New_Session :: struct {
    #as using message: Message;
    cmd = rdbg_Command.RDBG_COMMAND_NEW_SESSION;
    dtb : rdbg_DebuggingTargetBehavior;
    msb : rdbg_ModifiedSessionBehavior;
    size :: 6;
}

Message_Open_Session :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_OPEN_SESSION;
    size :: 2;
}

Message_Save_Session :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SAVE_SESSION;
    size :: 2;
}

Message_Save_As_Session :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SAVE_AS_SESSION;
    size :: 2;
}

Message_Get_Session_Configs :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_SESSION_CONFIGS;
    size :: 2;
}

Message_Add_Session_Config :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_SESSION_CONFIG;
    size :: 2;
}

Message_Set_Active_Session_Config :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SET_ACTIVE_SESSION_CONFIG;
    size :: 2;
}

Message_Delete_Session_Config :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_SESSION_CONFIG;
    size :: 2;
}

Message_Delete_All_Session_Configs :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_ALL_SESSION_CONFIGS;
    size :: 2;
}

Message_Goto_File_At_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GOTO_FILE_AT_LINE;
    size :: 2;
}

Message_Close_File :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_CLOSE_FILE;
    size :: 2;
}

Message_Close_All_Files :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_CLOSE_ALL_FILES;
    size :: 2;
}

Message_Get_Current_File :: struct {
    #as using message: Message;
    cmd = rdbg_Command.RDBG_COMMAND_GET_CURRENT_FILE;
    size :: 2;
}

Message_Get_Open_Files :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_OPEN_FILES;
    size :: 2;
}

Message_Get_Target_State :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_TARGET_STATE;
    size :: 2;
}

Message_Start_Debugging :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_START_DEBUGGING;
    size :: 2;
}

Message_Stop_Debugging :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STOP_DEBUGGING;
    size :: 2;
}

Message_Restart_Debugging :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_RESTART_DEBUGGING;
    size :: 2;
}

Message_Attach_To_Process_By_Pid :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ATTACH_TO_PROCESS_BY_PID;
    size :: 2;
}

Message_Attach_To_Process_By_Name :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ATTACH_TO_PROCESS_BY_NAME;
    size :: 2;
}

Message_Detach_From_Process :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DETACH_FROM_PROCESS;
    size :: 2;
}

Message_Step_Into_By_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STEP_INTO_BY_LINE;
    size :: 2;
}

Message_Step_Into_By_Instruction :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STEP_INTO_BY_INSTRUCTION;
    size :: 2;
}

Message_Step_Over_By_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STEP_OVER_BY_LINE;
    size :: 2;
}

Message_Step_Over_By_Instruction :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STEP_OVER_BY_INSTRUCTION;
    size :: 2;
}

Message_Step_Out :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_STEP_OUT;
    size :: 2;
}

Message_Continue_Execution :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_CONTINUE_EXECUTION;
    size :: 2;
}

Message_Run_To_File_At_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_RUN_TO_FILE_AT_LINE;
    size :: 2;
}

Message_Break_Execution :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_BREAK_EXECUTION;
    size :: 2;
}

Message_Get_Breakpoints :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_BREAKPOINTS;
    size :: 2;
}

Message_Get_Breakpoint_Locations :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_BREAKPOINT_LOCATIONS;
    size :: 2;
}

Message_Get_Function_Overloads :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_FUNCTION_OVERLOADS;
    size :: 2;
}

Message_Add_Breakpoint_At_Function :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_BREAKPOINT_AT_FUNCTION;
    size :: 2;
}

Message_Add_Breakpoint_At_Filename_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_BREAKPOINT_AT_FILENAME_LINE;
    size :: 2;
}

Message_Add_Breakpoint_At_Address :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_BREAKPOINT_AT_ADDRESS;
    size :: 2;
}

Message_Add_Processor_Breakpoint :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_PROCESSOR_BREAKPOINT;
    size :: 2;
}

Message_Set_Breakpoint_Condition :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_SET_BREAKPOINT_CONDITION;
    size :: 2;
}

Message_Update_Breakpoint_Line :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_UPDATE_BREAKPOINT_LINE;
    size :: 2;
}

Message_Enable_Breakpoint :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ENABLE_BREAKPOINT;
    size :: 2;
}

Message_Delete_Breakpoint :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_BREAKPOINT;
    size :: 2;
}

Message_Delete_All_Breakpoints :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_ALL_BREAKPOINTS;
    size :: 2;
}

Message_Get_Breakpoint :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_BREAKPOINT;
    size :: 2;
}

Message_Get_Watches :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_GET_WATCHES;
    size :: 2;
}

Message_Add_Watch :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_ADD_WATCH;
    size :: 2;
}

Message_Update_Watch_Expression :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_UPDATE_WATCH_EXPRESSION;
    size :: 2;
}

Message_Update_Watch_Comment :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_UPDATE_WATCH_COMMENT;
    size :: 2;
}

Message_Delete_Watch :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_WATCH;
    size :: 2;
}

Message_Delete_All_Watches :: struct {
    #as using message: Message;
    cmd = .RDBG_COMMAND_DELETE_ALL_WATCHES;
    size :: 2;
}


#scope_module


handle_open_session_control_result :: (result: Result_Open_Session) {
    if result_callbacks.open_session  result_callbacks.open_session(result);
}

handle_bring_debugger_to_foreground_control_result :: (result: Result_Bring_Debugger_To_Foreground) {
    if result_callbacks.bring_debugger_to_foreground  result_callbacks.bring_debugger_to_foreground(result);
}

handle_set_window_pos_control_result :: (result: Result_Set_Window_Pos) {
    if result_callbacks.set_window_pos  result_callbacks.set_window_pos(result);
}

handle_get_window_pos_control_result :: (result: Result_Get_Window_Pos) {
    if result_callbacks.get_window_pos  result_callbacks.get_window_pos(result);
}

handle_set_bring_to_foreground_on_suspended_control_result :: (result: Result_Set_Bring_To_Foreground_On_Suspended) {
    if result_callbacks.set_bring_to_foreground_on_suspended  result_callbacks.set_bring_to_foreground_on_suspended(result);
}

handle_exit_debugger_control_result :: (result: Result_Exit_Debugger) {
    if result_callbacks.exit_debugger  result_callbacks.exit_debugger(result);
}

handle_get_is_session_modified_control_result :: (result: Result_Get_Is_Session_Modified) {
    if result_callbacks.get_is_session_modified  result_callbacks.get_is_session_modified(result);
}

handle_get_session_filename_control_result :: (result: Result_Get_Session_Filename) {
    if result_callbacks.get_session_filename  result_callbacks.get_session_filename(result);
}

handle_new_session_control_result :: (result: Result_New_Session) {
    if result_callbacks.new_session  result_callbacks.new_session(result);
}

handle_save_session_control_result :: (result: Result_Save_Session) {
    if result_callbacks.save_session  result_callbacks.save_session(result);
}

handle_save_as_session_control_result :: (result: Result_Save_As_Session) {
    if result_callbacks.save_as_session  result_callbacks.save_as_session(result);
}

handle_get_session_configs_control_result :: (result: Result_Get_Session_Configs) {
    if result_callbacks.get_session_configs  result_callbacks.get_session_configs(result);
}

handle_add_session_config_control_result :: (result: Result_Add_Session_Config) {
    if result_callbacks.add_session_config  result_callbacks.add_session_config(result);
}

handle_set_active_session_config_control_result :: (result: Result_Set_Active_Session_Config) {
    if result_callbacks.set_active_session_config  result_callbacks.set_active_session_config(result);
}

handle_delete_session_config_control_result :: (result: Result_Delete_Session_Config) {
    if result_callbacks.delete_session_config  result_callbacks.delete_session_config(result);
}

handle_delete_all_session_configs_control_result :: (result: Result_Delete_All_Session_Configs) {
    if result_callbacks.delete_all_session_configs  result_callbacks.delete_all_session_configs(result);
}

handle_goto_file_at_line_control_result :: (result: Result_Goto_File_At_Line) {
    if result_callbacks.goto_file_at_line  result_callbacks.goto_file_at_line(result);
}

handle_close_file_control_result :: (result: Result_Close_File) {
    if result_callbacks.close_file  result_callbacks.close_file(result);
}

handle_close_all_files_control_result :: (result: Result_Close_All_Files) {
    if result_callbacks.close_all_files  result_callbacks.close_all_files(result);
}

handle_get_current_file_control_result :: (result: Result_Get_Current_File) {
    if result_callbacks.get_current_file  result_callbacks.get_current_file(result);
}

handle_get_open_files_control_result :: (result: Result_Get_Open_Files) {
    if result_callbacks.get_open_files  result_callbacks.get_open_files(result);
}

handle_get_target_state_control_result :: (result: Result_Get_Target_State) {
    if result_callbacks.get_target_state  result_callbacks.get_target_state(result);
}

handle_start_debugging_control_result :: (result: Result_Start_Debugging) {
    if result_callbacks.start_debugging  result_callbacks.start_debugging(result);
}

handle_stop_debugging_control_result :: (result: Result_Stop_Debugging) {
    if result_callbacks.stop_debugging  result_callbacks.stop_debugging(result);
}

handle_restart_debugging_control_result :: (result: Result_Restart_Debugging) {
    if result_callbacks.restart_debugging  result_callbacks.restart_debugging(result);
}

handle_attach_to_process_by_pid_control_result :: (result: Result_Attach_To_Process_By_Pid) {
    if result_callbacks.attach_to_process_by_pid  result_callbacks.attach_to_process_by_pid(result);
}

handle_attach_to_process_by_name_control_result :: (result: Result_Attach_To_Process_By_Name) {
    if result_callbacks.attach_to_process_by_name  result_callbacks.attach_to_process_by_name(result);
}

handle_detach_from_process_control_result :: (result: Result_Detach_From_Process) {
    if result_callbacks.detach_from_process  result_callbacks.detach_from_process(result);
}

handle_step_into_by_line_control_result :: (result: Result_Step_Into_By_Line) {
    if result_callbacks.step_into_by_line  result_callbacks.step_into_by_line(result);
}

handle_step_into_by_instruction_control_result :: (result: Result_Step_Into_By_Instruction) {
    if result_callbacks.step_into_by_instruction  result_callbacks.step_into_by_instruction(result);
}

handle_step_over_by_line_control_result :: (result: Result_Step_Over_By_Line) {
    if result_callbacks.step_over_by_line  result_callbacks.step_over_by_line(result);
}

handle_step_over_by_instruction_control_result :: (result: Result_Step_Over_By_Instruction) {
    if result_callbacks.step_over_by_instruction  result_callbacks.step_over_by_instruction(result);
}

handle_step_out_control_result :: (result: Result_Step_Out) {
    if result_callbacks.step_out  result_callbacks.step_out(result);
}

handle_continue_execution_control_result :: (result: Result_Continue_Execution) {
    if result_callbacks.continue_execution  result_callbacks.continue_execution(result);
}

handle_run_to_file_at_line_control_result :: (result: Result_Run_To_File_At_Line) {
    if result_callbacks.run_to_file_at_line  result_callbacks.run_to_file_at_line(result);
}

handle_break_execution_control_result :: (result: Result_Break_Execution) {
    if result_callbacks.break_execution  result_callbacks.break_execution(result);
}

handle_get_breakpoints_control_result :: (result: Result_Get_Breakpoints) {
    if result_callbacks.get_breakpoints  result_callbacks.get_breakpoints(result);
}

handle_get_breakpoint_locations_control_result :: (result: Result_Get_Breakpoint_Locations) {
    if result_callbacks.get_breakpoint_locations  result_callbacks.get_breakpoint_locations(result);
}

handle_get_function_overloads_control_result :: (result: Result_Get_Function_Overloads) {
    if result_callbacks.get_function_overloads  result_callbacks.get_function_overloads(result);
}

handle_add_breakpoint_at_function_control_result :: (result: Result_Add_Breakpoint_At_Function) {
    if result_callbacks.add_breakpoint_at_function  result_callbacks.add_breakpoint_at_function(result);
}

handle_add_breakpoint_at_filename_line_control_result :: (result: Result_Add_Breakpoint_At_Filename_Line) {
    if result_callbacks.add_breakpoint_at_filename_line  result_callbacks.add_breakpoint_at_filename_line(result);
}

handle_add_breakpoint_at_address_control_result :: (result: Result_Add_Breakpoint_At_Address) {
    if result_callbacks.add_breakpoint_at_address  result_callbacks.add_breakpoint_at_address(result);
}

handle_add_processor_breakpoint_control_result :: (result: Result_Add_Processor_Breakpoint) {
    if result_callbacks.add_processor_breakpoint  result_callbacks.add_processor_breakpoint(result);
}

handle_set_breakpoint_condition_control_result :: (result: Result_Set_Breakpoint_Condition) {
    if result_callbacks.set_breakpoint_condition  result_callbacks.set_breakpoint_condition(result);
}

handle_update_breakpoint_line_control_result :: (result: Result_Update_Breakpoint_Line) {
    if result_callbacks.update_breakpoint_line  result_callbacks.update_breakpoint_line(result);
}

handle_enable_breakpoint_control_result :: (result: Result_Enable_Breakpoint) {
    if result_callbacks.enable_breakpoint  result_callbacks.enable_breakpoint(result);
}

handle_delete_breakpoint_control_result :: (result: Result_Delete_Breakpoint) {
    if result_callbacks.delete_breakpoint  result_callbacks.delete_breakpoint(result);
}

handle_delete_all_breakpoints_control_result :: (result: Result_Delete_All_Breakpoints) {
    if result_callbacks.delete_all_breakpoints  result_callbacks.delete_all_breakpoints(result);
}

handle_get_breakpoint_control_result :: (result: Result_Get_Breakpoint) {
    if result_callbacks.get_breakpoint  result_callbacks.get_breakpoint(result);
}

handle_get_watches_control_result :: (result: Result_Get_Watches) {
    if result_callbacks.get_watches  result_callbacks.get_watches(result);
}

handle_add_watch_control_result :: (result: Result_Add_Watch) {
    if result_callbacks.add_watch  result_callbacks.add_watch(result);
}

handle_update_watch_expression_control_result :: (result: Result_Update_Watch_Expression) {
    if result_callbacks.update_watch_expression  result_callbacks.update_watch_expression(result);
}

handle_update_watch_comment_control_result :: (result: Result_Update_Watch_Comment) {
    if result_callbacks.update_watch_comment  result_callbacks.update_watch_comment(result);
}

handle_delete_watch_control_result :: (result: Result_Delete_Watch) {
    if result_callbacks.delete_watch  result_callbacks.delete_watch(result);
}

handle_delete_all_watches_control_result :: (result: Result_Delete_All_Watches) {
    if result_callbacks.delete_all_watches  result_callbacks.delete_all_watches(result);
}



Result_Get_Current_File_Prefix :: struct {
    #as using base: Result;
    id: rdbg_Id #align 2;
    filename: rdbg_String #align 2;
    size :: 8;
} #no_padding

Result_Get_Current_File_Postfix :: struct {
    line_num: u32;
    size :: 4;
}