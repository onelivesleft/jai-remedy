#module_parameters(
    REMEDY_SERVERNAME := "jai",
    CONTROL_SEND_BUFFER_SIZE := 2048,
    CONTROL_RECEIVE_BUFFER_SIZE := 2048,
    EVENTS_BUFFER_SIZE := 2048
);

CONTROL_PIPE_NAME :: #run tprint("\\\\.\\pipe\\%", REMEDY_SERVERNAME);
EVENTS_PIPE_NAME :: #run tprint("\\\\.\\pipe\\%-events", REMEDY_SERVERNAME);

#load "Remedy.jai";
#load "remedy_driver.jai";
#load "events.jai";
#load "control.jai";

#import "Basic";
#import "Process";
#import "Windows";
#import "Windows_Utf8";