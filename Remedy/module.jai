#module_parameters(
    REMEDY_SERVERNAME := "jai",
    VERBOSE := false,
    CONTROL_BUFFER_SIZE := 2048,
    CONTROL_TIMEOUT := 5000,
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

TransactNamedPipe :: (hNamedPipe: HANDLE, lpInBuffer: *void, nInBufferSize: DWORD, lpOutBuffer: *void, nOutBufferSize: DWORD, lpBytesRead: *DWORD, lpOverlapped : *void = null) -> bool #foreign kernel32;
GetNamedPipeHandleStateA :: (hNamedPipe: HANDLE, lpState: *DWORD, lpCurInstances: *DWORD, lpMaxCollectionCount: *DWORD, lpCollectDataTimeout: *DWORD,  lpUserName: *void, nMaxUserNameSize: DWORD) -> bool #foreign kernel32;
PIPE_READMODE_MESSAGE : u32 = 0x00000002;

