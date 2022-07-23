#!/bin/bash

echo "--My Xmonad Keybindings--

((modm .|. shiftMask, xK_Return), spawn $  XMonad.terminal conf),  -- Provides functionality to use key chords to focus a visible window
((modm, xK_f), selectWindow def >>= (`whenJust` windows . W.focusWindow)),  --full screen
((modm .|. shiftMask, xK_f), sendMessage $ JumpToLayout 'Full'),  -- BSP
((modm .|. shiftMask, xK_g), sendMessage $ JumpToLayout 'BSP'),  -- Org mode - todo list
((modm, xK_o), orgPrompt def 'TODO' '/home/jowtro/todos.org'),  -- kill xmobar
((modm .|. shiftMask, xK_u), spawn '/home/jowtro/kxmobar' ),  -- block screen
((modm, xK_s), spawn '/home/jowtro/.xmonad/xmonad_keybindings.sh'),   -- runs the script that shows key bindings.
((modm .|. shiftMask, xK_l), spawn 'xflock4'),
((modm, xK_p), spawn 'dmenu_run -fn 'Ubuntu Mono:normal:pixelsize=16' '),  -- launch dmenu
((modm .|. shiftMask, xK_c), kill),  -- kill window
((modm, xK_space), sendMessage NextLayout),  --  Reset the layouts on the current workspace to default
((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf),  -- Resize viewed windows to the correct size
((modm, xK_n), refresh),  -- Move focus to the next window
((modm, xK_Tab), windows W.focusDown),  -- Move focus to the next window
((modm, xK_j), windows W.focusDown),  -- Move focus to the previous window
((modm, xK_k), windows W.focusUp),  -- Move focus to the master window
((modm, xK_m), windows W.focusMaster),  -- Swap the focused window and the master window
((modm, xK_Return), windows W.swapMaster),  -- Swap the focused window with the next window
((modm .|. shiftMask, xK_j), windows W.swapDown),  -- Swap the focused window with the previous window
((modm .|. shiftMask, xK_k), windows W.swapUp),  -- Shrink the master area
((modm, xK_h), sendMessage Shrink),  -- Expand the master area
((modm, xK_l), sendMessage Expand),  -- Push window back into tiling
((modm, xK_t), withFocused $ windows . W.sink),  -- Increment the number of windows in the master area
((modm, xK_comma), sendMessage (IncMasterN 1)),  -- Deincrement the number of windows in the master area
((modm, xK_period), sendMessage (IncMasterN (-1))),  -- Toggle the status bar gap
((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess)),  -- Restart xmonad
((modm, xK_q), spawn 'xmonad --recompile; xmonad --restart'),
-- Run xmessage with a summary of the default keybindings (useful for beginners)
((modm .|. shiftMask, xK_slash), spawn ('echo \'' ++ help ++ '\' | xmessage -file -')), -- sound control via keybind requires pactl
((0, xF86XK_AudioMute), spawn 'pactl set-sink-mute @DEFAULT_SINK@ toggle'),
((0, xF86XK_AudioLowerVolume), spawn 'pactl set-sink-volume @DEFAULT_SINK@ -4%'),
((0, xF86XK_AudioRaiseVolume), spawn 'pactl set-sink-volume @DEFAULT_SINK@ +4%'),
--((0, xK_Print), spawn 'scrot -q 1 /home/jowtro/Pictures/screenshot/%Y-%m-%d-%H:%M:%S.png')
((0, xK_Print), spawn 'flameshot gui') -- take screeshot
]
-- mod-[1..9], Switch to workspace N
-- mod-shift-[1..9], Move client to workspace N
-- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
-- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
" | \
yad --text-info