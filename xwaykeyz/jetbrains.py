keymap("Jetbrains", {
    C("C-Comma"):               C("C-Alt-s"),                   # Open Settings dialog
    # Debugging
    C("C-Alt-r"):               C("F9"),                        # Resume program
    # Search/Replace
    C("C-g"):                   C("F3"),                        # Find next
    C("C-Shift-F3"):            C("Shift-F3"),                  # Find previous
    C("Super-g"):               C("Alt-j"),                     # Select next occurrence
    C("C-Super-g"):             C("C-Alt-Shift-j"),             # Select all occurrences
    C("Super-Shift-g"):         C("Alt-Shift-j"),               # Unselect occurrence
    # Editing
    #C("Super-Space"):           C("C-Space"),                   # Basic code completion (conflicts with input switching)
    #C("Super-Shift-Space"):     C("Shift-C-Space"),             # Smart code completion (conflicts with input switching)
    C("C-n"):                   C("Alt-Insert"),                # Generate code...
    C("Alt-Up"):                C("C-w"),                       # Extend selection
    C("Alt-Down"):              C("C-Shift-w"),                 # Shrink selection
    C(f"{ACmd}-Backspace"):     C("C-y"),                       # Delete line at caret
    C("Super-Shift-j"):         C("C-Shift-j"),                 # Smart line join
    C("Alt-Delete"):            C("C-Delete"),                  # Delete to word end
    C("Alt-Backspace"):         C("C-Backspace"),               # Delete to word start
    C("C-Shift-Equal"):         C("C-KPPLUS"),                  # Expand code block
    C("C-Minus"):               C("C-KPMINUS"),                 # Collapse code block
    C("C-Shift-Equal"):         C("C-Shift-KPPLUS"),            # Expand all
    C("C-Shift-Minus"):         C("C-Shift-KPMINUS"),           # Collapse all
    C("C-w"):                   C("C-F4"),                      # Close active editor tab
    # Refactoring
    C("C-Delete"):              C("Alt-Delete"),                # Safe Delete
    #C("C-T"):                   C("C-Alt-Shift-t"),             # Refactor this
    # Navigation
    C("C-o"):                   C("C-n"),                       # Go to class
    C("C-Shift-o"):             C("C-Shift-n"),                 # Go to file
    C("C-Alt-o"):               C("C-Alt-Shift-n"),             # Go to symbol
    C("C-l"):                   C("C-g"),                       # Go to line
    #C("Alt-Space"):             C("C-Shift-i"),                 # Open quick definition lookup
    C("C-Y"):                   C("C-Shift-i"),                 # Open quick definition lookup
    C("C-Left_Brace"):          C("Alt-Shift-Left"),            # Go back
    C("C-Right_Brace"):         C("Alt-Shift-Right"),           # Go forward
    C("Super-h"):               C("C-h"),                       # Type hierarchy
    C("Super-Alt-h"):           C("C-Alt-h"),                   # Call hierarchy
    C("C-Down"):                C("C-Enter"),                   # Edit source/View source
    C("Alt-Home"):              C("Alt-Home"),                  # Show navigation bar
    C("F2"):                    C("F11"),                       # Toggle bookmark
    C("C-F3"):                  C("Shift-F11"),                 # Show bookmarks
}, when = wm_class_match("^jetbrains-(?!.*toolbox).*$"))