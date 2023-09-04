event_handles : struct {
    exit_process : type_of(handle_exit_process_event);
    target_started : type_of(handle_target_started_event);
    target_attached : type_of(handle_target_attached_event);
    target_detached : type_of(handle_target_detached_event);
    target_continued : type_of(handle_target_continued_event);
    source_location_changed : type_of(handle_source_location_changed_event);
    breakpoint_hit : type_of(handle_breakpoint_hit_event);
    breakpoint_resolved : type_of(handle_breakpoint_resolved_event);
    breakpoint_added : type_of(handle_breakpoint_added_event);
    breakpoint_modified : type_of(handle_breakpoint_modified_event);
    breakpoint_removed : type_of(handle_breakpoint_removed_event);
    output_debug_string : type_of(handle_output_debug_string_event);
}


Event :: struct {
    kind: rdbg_DebugEventKind;
}


Event_Exit_Process :: struct {
    #as using event: Event;
    exit_code : u32;
    advance :: 6;
}


// A target being debugged has exited.
Event_Target_Started :: struct {
    #as using event: Event;
    process_id: u32;
    advance :: 6;
}


// The debugger has attached to a target process.
Event_Target_Attached :: struct {
    #as using event: Event;
    process_id: u32;
    advance :: 6;
}


// The debugger has detached from a target process.
Event_Target_Detached :: struct {
    #as using event: Event;
    process_id: u32;
    advance :: 6;
}


// The debugger has transitioned from suspended to executing.
Event_Target_Continued :: struct {
    #as using event: Event;
    process_id: u32;
    advance :: 6;
}


// The source location changed due to an event in the debugger.
Event_Source_Location_Changed :: struct {
    #as using event: Event;
    filename: string;
    line_num: u32;
    reason: rdbg_SourceLocChangedReason;
}


// A user breakpoint was hit
Event_Breakpoint_Hit :: struct {
    #as using event: Event;
    bp_id: rdbg_Id;
    advance :: 6;
}


// The breakpoint with the given ID has been resolved (has a valid location).
// This can happen if the breakpoint was set in module that became loaded,
// for instance.
Event_Breakpoint_Resolved :: struct {
    #as using event: Event;
    bp_id: rdbg_Id;
    advance :: 6;
}


// A new user breakpoint was added.
Event_Breakpoint_Added :: struct {
    #as using event: Event;
    bp_id: rdbg_Id;
    advance :: 6;
}


// A user breakpoint was modified.
Event_Breakpoint_Modified :: struct {
    #as using event: Event;
    bp_id: rdbg_Id;
    advance :: 6;
}


// A user breakpoint was removed.
Event_Breakpoint_Removed :: struct {
    #as using event: Event;
    bp_id: rdbg_Id;
    advance :: 6;
}


// An OutputDebugString was received by the debugger. The given string will
// be UTF-8 encoded.
Event_Output_Debug_String :: struct {
    #as using event: Event;
    str: string;
}


#scope_module


process_events :: () -> something_happened: bool {
    success, count := read_pipe(events_pipe, events_buffer);
    if !success {
        error := GetLastError();
        print("Error reading from Remedy events pipe: %\n", error);
        return false;
    }

    if !count  return false;

    data := events_buffer.data;

    while count > 0 {
        advance := 0;
        event := cast(*Event) data;
        if #complete event.kind == {
            case .RDBG_DEBUG_EVENT_KIND_EXIT_PROCESS;
            exit_process_event := (cast(*Event_Exit_Process) event).*;
            advance = Event_Exit_Process.advance;
            handle_exit_process_event(exit_process_event);

            case .RDBG_DEBUG_EVENT_KIND_TARGET_STARTED;
            target_started_event := (cast(*Event_Target_Started) event).*;
            advance = Event_Target_Started.advance;
            handle_target_started_event(target_started_event);

            case .RDBG_DEBUG_EVENT_KIND_TARGET_ATTACHED;
            target_attached_event := (cast(*Event_Target_Attached) event).*;
            advance = Event_Target_Attached.advance;
            handle_target_attached_event(target_attached_event);

            case .RDBG_DEBUG_EVENT_KIND_TARGET_DETACHED;
            target_detached_event := (cast(*Event_Target_Detached) event).*;
            advance = Event_Target_Detached.advance;
            handle_target_detached_event(target_detached_event);

            case .RDBG_DEBUG_EVENT_KIND_TARGET_CONTINUED;
            target_continued_event := (cast(*Event_Target_Continued) event).*;
            advance = Event_Target_Continued.advance;
            handle_target_continued_event(target_continued_event);

            case .RDBG_DEBUG_EVENT_KIND_SOURCE_LOCATION_CHANGED;
            prefix := cast(*Event_Source_Location_Changed_Prefix) event;
            postfix : *Event_Source_Location_Changed_Postfix = (cast(*void)prefix) + prefix.filename.count + Event_Source_Location_Changed_Prefix.advance;
            advance = cast(*void)postfix - data + Event_Source_Location_Changed_Postfix.advance;
            source_location_changed_event := Event_Source_Location_Changed.{
                prefix.event, copy_string(*prefix.filename), postfix.line_num, postfix.reason
            };
            handle_source_location_changed_event(source_location_changed_event);

            case .RDBG_DEBUG_EVENT_KIND_BREAKPOINT_HIT;
            breakpoint_hit_event := (cast(*Event_Breakpoint_Hit) event).*;
            advance = Event_Breakpoint_Hit.advance;
            handle_breakpoint_hit_event(breakpoint_hit_event);

            case .RDBG_DEBUG_EVENT_KIND_BREAKPOINT_RESOLVED;
            breakpoint_resolved_event := (cast(*Event_Breakpoint_Resolved) event).*;
            advance = Event_Breakpoint_Resolved.advance;
            handle_breakpoint_resolved_event(breakpoint_resolved_event);

            case .RDBG_DEBUG_EVENT_KIND_BREAKPOINT_ADDED;
            breakpoint_added_event := (cast(*Event_Breakpoint_Added) event).*;
            advance = Event_Breakpoint_Added.advance;
            handle_breakpoint_added_event(breakpoint_added_event);

            case .RDBG_DEBUG_EVENT_KIND_BREAKPOINT_MODIFIED;
            breakpoint_modified_event := (cast(*Event_Breakpoint_Modified) event).*;
            advance = Event_Breakpoint_Modified.advance;
            handle_breakpoint_modified_event(breakpoint_modified_event);

            case .RDBG_DEBUG_EVENT_KIND_BREAKPOINT_REMOVED;
            breakpoint_removed_event := (cast(*Event_Breakpoint_Removed) event).*;
            advance = Event_Breakpoint_Removed.advance;
            handle_breakpoint_removed_event(breakpoint_removed_event);

            case .RDBG_DEBUG_EVENT_KIND_OUTPUT_DEBUG_STRING;
            prefix := cast(*Event_Output_Debug_String_Prefix) event;
            advance = Event_Output_Debug_String_Prefix.advance + prefix.str.count;
            output_debug_string_event := Event_Output_Debug_String.{
                prefix.event, copy_string(*prefix.str)
            };
            handle_output_debug_string_event(output_debug_string_event);
        }
        assert(advance > 0);
        assert(advance <= count, "We tried to advance past the end of the received data.");
        data += advance;
        count -= advance;
    }
    return true;
}


Event_Output_Debug_String_Prefix :: struct {
    #as using event: Event;
    str: rdbg_String;
    advance :: 2;
}

Event_Source_Location_Changed_Prefix :: struct {
    #as using event: Event;
    filename: rdbg_String;
    advance :: 4;
}


Event_Source_Location_Changed_Postfix :: struct {
    line_num: u32;
    reason: rdbg_SourceLocChangedReason;
    advance :: 6;
}

handle_exit_process_event :: (exit_process_event: Event_Exit_Process) {
    if event_handles.exit_process
        event_handles.exit_process(exit_process_event);
}

handle_target_started_event :: (target_started_event: Event_Target_Started) {
    if event_handles.target_started
        event_handles.target_started(target_started_event);
}

handle_target_attached_event :: (target_attached_event: Event_Target_Attached) {
    if event_handles.target_attached
        event_handles.target_attached(target_attached_event);
}

handle_target_detached_event :: (target_detached_event: Event_Target_Detached) {
    if event_handles.target_detached
        event_handles.target_detached(target_detached_event);
}

handle_target_continued_event :: (target_continued_event: Event_Target_Continued) {
    if event_handles.target_continued
        event_handles.target_continued(target_continued_event);
}

handle_source_location_changed_event :: (source_location_changed_event: Event_Source_Location_Changed) {
    if event_handles.source_location_changed
        event_handles.source_location_changed(source_location_changed_event);
}

handle_breakpoint_hit_event :: (breakpoint_hit_event: Event_Breakpoint_Hit) {
    if event_handles.breakpoint_hit
        event_handles.breakpoint_hit(breakpoint_hit_event);
}

handle_breakpoint_resolved_event :: (breakpoint_resolved_event: Event_Breakpoint_Resolved) {
    if event_handles.breakpoint_resolved
        event_handles.breakpoint_resolved(breakpoint_resolved_event);
}

handle_breakpoint_added_event :: (breakpoint_added_event: Event_Breakpoint_Added) {
    if event_handles.breakpoint_added
        event_handles.breakpoint_added(breakpoint_added_event);
}

handle_breakpoint_modified_event :: (breakpoint_modified_event: Event_Breakpoint_Modified) {
    if event_handles.breakpoint_modified
        event_handles.breakpoint_modified(breakpoint_modified_event);
}

handle_breakpoint_removed_event :: (breakpoint_removed_event: Event_Breakpoint_Removed) {
    if event_handles.breakpoint_removed
        event_handles.breakpoint_removed(breakpoint_removed_event);
}

handle_output_debug_string_event :: (output_debug_string_event: Event_Output_Debug_String) {
    if event_handles.output_debug_string
        event_handles.output_debug_string(output_debug_string_event);
}
