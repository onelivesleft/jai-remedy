#import "Basic";
#import "GUI";
#import "Strings";

main :: () {
    window := gui_create_application_window("Test", 512, 512, 2624, 10);

    should_quit := false;

    while !should_quit {
        should_quit = gui_begin_frame();

        if keyboard.escape  should_quit = true;

        if button(at(0.25,0.25, 0.75,0.75), .EMOTICON_POOP)
            should_quit = true;
    }
}
