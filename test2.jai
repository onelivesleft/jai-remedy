#import "Basic";
#import "GUI";

main :: () {
    window := gui_create_application_window("Test", 768, 768, 3024, 100);

    while true {
        quit := gui_begin_frame();
        defer  if quit  break;

        if keyboard.escape  quit = true;

        if button(at(0.25,0.25, 0.75,0.75), .EMOTICON_POOP)
            quit = true;
    }
}
