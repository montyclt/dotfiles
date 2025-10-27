keymap("File manager", {
    C(f"{ACmd}-Backspace"):               C("Delete"),                   # Delete a file
}, when = wm_class_match("^nemo*$"))