from xwaykeyz.config_api import *
from xwaykeyz.lib.key_context import KeyContext
from xwaykeyz.lib.logger import debug, error
from xwaykeyz.models.modifier import Modifier

environ_api(session_type='wayland', wl_compositor='sway')

modmap("macOS left side swap", {
    Key.LEFT_CTRL: Key.LEFT_META,     # Physical Ctrl -> Logical Meta (Apple Ctrl)
    Key.LEFT_META: Key.LEFT_ALT,      # Physical Meta -> Logical Alt (Apple Opt)
    Key.LEFT_ALT: Key.LEFT_CTRL,      # Physical Alt -> Logical Ctrl (Apple Cmd)
})

ACmd = "C"          # Command key
AOpt = "Alt"        # Option key
ACtrl = "Meta"      # Control key

include("jetbrains.py")
include("file_managers.py")

keymap("macOS global shortcuts", {
    # Walker
    C(f"{ACmd}-Space"): C(f"Alt-Meta-a"),
    C(f"{ACtrl}-Space"): C("C-Space"),

    # Word navigation with Option
    C(f"{AOpt}-Left"): C("C-Left"),
    C(f"{AOpt}-Right"): C("C-Right"),
    C(f"{AOpt}-Shift-Left"): C("C-Shift-Left"),
    C(f"{AOpt}-Shift-Right"): C("C-Shift-Right"),
    C(f"{AOpt}-Backspace"): C("C-Backspace"),

    # Line navigation with Cmd
    C(f"{ACmd}-Left"): C("Home"),
    C(f"{ACmd}-Right"): C("End"),
    C(f"{ACmd}-Shift-Left"): C("Shift-Home"),
    C(f"{ACmd}-Shift-Right"): C("Shift-End"),

    # Tab navigation with Cmd+Numbers
    **{C(f"{ACmd}-KEY_{i}"): C(f"Alt-KEY_{i}") for i in range(10)},

    # Cmd+Backspace: delete entire line
    C(f"{ACmd}-Backspace"): [C("Shift-Home"), C("Delete")],

    # Cmd+Tab: window switching
    C(f"{ACmd}-Tab"): C("Super-Right"),
    C(f"{ACmd}-Shift-Tab"): C("Super-Left"),
})