#import "Basic";
#import "Remedy";
#import "GUI";
#import "File";

current_source_file: string;
current_source_filename: string;
current_source_line: int;
previous_source_filename: string;
previous_source_line: int;

main :: () {
    remedy_init();
    get_current_file();

    event_handles.source_location_changed = handle_source_location_changed_event;
    result_callbacks.get_current_file = handle_get_current_file_result;

    window := gui_create_window("Remedy", 1024, 768, 2100, 100);

    row_height :: 32;

    while gui_begin_frame() {
        remedy_update();

        top, bottom := split_top_bottom(at(window), row_height);
        left, right := split_left_right(at(top), 300);
        executable_filename := text_input(at(left), "c:\\repos\\jai-gui\\test.exe");

        if button(at(right, 0,0, row_height,row_height), .PLAY) {
        }

        if button(at(.COPY_RIGHT), .STOP) {
        }

        if button(at(.COPY_RIGHT), .DEBUG_STEP_OVER) {
            step_over_by_line();
        }

        code_panel, status_panel := split_top_bottom(bottom, -row_height);
        margin, main := split_left_right(code_panel, 100);
        label(at(status_panel, 0,0, 60,1.0), current_source_line, Flags.RIGHT);
        label(at(.FILL_RIGHT), current_source_filename);

        _, source_code := text_box(at(main), current_source_file, .FIXED | .NO_WRAP);
        goto_line := false;
        if current_source_filename != previous_source_filename {
            previous_source_filename = current_source_filename;
            goto_line = true;
            set_text(source_code, read_entire_file(current_source_filename));
        }
        if goto_line || current_source_line != previous_source_line {
            previous_source_line = current_source_line;
            source_code.scrollbar.int_value = max(0, current_source_line - source_code.labels.count / 2);
        }
        _label := source_code.labels[source_code.labels.count / 2 - 1];
        rect := _label.rect;
        rect.w += rect.x;
        rect.x = 0;
        draw_box(rect, .{1.0, 1.0, 0.0, 0.1});
    }
}

update_current_source_location :: (filename: string, line: int) {
    current_source_line = line;
    if current_source_filename  free(current_source_filename);
    current_source_filename = copy_string(filename);
}

handle_source_location_changed_event :: (event: Event_Source_Location_Changed) {
    update_current_source_location(event.filename, event.line_num);
}


handle_get_current_file_result :: (result: Result_Get_Current_File) {
    update_current_source_location(result.filename, result.line_num);
}