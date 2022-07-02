------------------------------------------------------------------------
-------------------------------- IMPORTS -------------------------------
------------------------------------------------------------------------
import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import Xmobar (Monitors(Brightness))
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Layout.ToggleLayouts (toggleLayouts, ToggleLayout (Toggle))
import XMonad.Layout.NoBorders

import Colors.Dracula
import Language.Haskell.Exts (Token(RULES))


------------------------------------------------------------------------
------------------------------ PREFERENCES -----------------------------
------------------------------------------------------------------------
myModMask = mod4Mask  -- Sets modkey to super/windows key

myTerminal = "kitty"
myBrowser = "firefox"

myFocusFollowsMouse = True  -- Whether focus follows the mouse pointer.

myClickJustFocuses = False  -- Whether clicking on a window to focus also passes the click to the window

-- Window borders
myBorderWidth = 2
myNormalBorderColor  = colorBack
myFocusedBorderColor = colorFore

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]


------------------------------------------------------------------------
----------------------------- KEY BINDINGS -----------------------------
------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- launch rofi
    , ((modm,               xK_p     ), spawn "rofi -modi drun,run -show drun")

    -- launch powermenu
    , ((modm .|. shiftMask, xK_p     ), unsafeSpawn "$HOME/.config/scripts/powermenu.sh")

    -- launch browser
    , ((modm,               xK_b     ), spawn myBrowser)

    -- launch emacs
    , ((modm,               xK_e     ), spawn "emacs")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_a     ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_a     ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm,               xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm,               xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle fullscreen
    , ((modm,               xK_f), sendMessage (Toggle "Full"))

    -- Volume buttons
    , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 5%+")
    , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 5%-")
    , ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")

    -- Brightness buttons
    , ((0, xF86XK_MonBrightnessUp    ), spawn "xbacklight + 5")
    , ((0, xF86XK_MonBrightnessDown  ), spawn "xbacklight - 5")

    -- Toggle the status bar gap
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io exitSuccess)

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
---------------------------- MOUSE BINDINGS ----------------------------
------------------------------------------------------------------------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                      >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                      >> windows W.shiftMaster)
    ]


------------------------------------------------------------------------
-------------------------------- LAYOUTS -------------------------------
------------------------------------------------------------------------
myLayout = toggleLayouts (noBorders Full) (avoidStruts (tiled ||| Mirror tiled ||| Full))
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


------------------------------------------------------------------------
----------------------------- WINDOW RULES -----------------------------
------------------------------------------------------------------------
-- To find the property name associated with a program, use
-- `xprop | grep WM_CLASS` and click on the client you're interested in.
-- Window details: 'title', 'className', 'resource'
myManageHook = composeAll
  [ className =? "confirm"         --> doFloat
  , className =? "file_progress"   --> doFloat
  , className =? "dialog"          --> doFloat
  , className =? "download"        --> doFloat
  , className =? "error"           --> doFloat
  , className =? "Gimp"            --> doFloat
  , className =? "notification"    --> doFloat
  , className =? "pinentry-gtk-2"  --> doFloat
  , className =? "splash"          --> doFloat
  , className =? "toolbar"         --> doFloat
  , className =? "Yad"             --> doCenterFloat
  -- , title =? "Oracle VM VirtualBox Manager"  --> doFloat
  -- , title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
  -- , className =? "Brave-browser"   --> doShift ( myWorkspaces !! 1 )
  -- , className =? "mpv"             --> doShift ( myWorkspaces !! 7 )
  -- , className =? "Gimp"            --> doShift ( myWorkspaces !! 8 )
  -- , className =? "VirtualBox Manager" --> doShift  ( myWorkspaces !! 4 )
  , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
  , isFullscreen --> doFullFloat ]


------------------------------------------------------------------------
---------------------------- EVENT HANDLING ----------------------------
------------------------------------------------------------------------
myEventHook = docksEventHook <+> fullscreenEventHook


------------------------------------------------------------------------
----------------------------- STARTUP HOOP -----------------------------
------------------------------------------------------------------------
myStartupHook = do
  spawn "killall conky"
  spawn "killall trayer"

  spawnOnce "picom"
  spawnOnce "nm-applet"

  spawn ( "sleep 2 && trayer"
        ++ " --edge top"
        ++ " --align right"
        ++ " --widthtype request"
        ++ " --padding 6"
        ++ " --SetDockType true"
        ++ " --SetPartialStrut true"
        ++ " --expand true"
        ++ " --monitor 0"
        ++ " --transparent true"
        ++ " --alpha 0"
        ++ " --tint 0x00282A36"
        ++ " --height 19" )

  spawnOnce "nitrogen --restore &"
  spawnOnce ( "xss-lock --transfer-sleep-lock -- i3lock"
            ++ " --nofork"
            ++ " --clock"
            ++ " --{time,date,layout}-color=282a36ff"
            ++ " --time-align 1"
            ++ " --date-align 1"
            ++ " --layout-align 2"
            ++ " --time-size=70"
            ++ " --date-size=20"
            ++ " --time-pos=\"x+30:y+h-65\""
            ++ " --layout-pos=\"x+w-10:y+h-10\""
            ++ " --keylayout 1"
            ++ " --image /usr/share/backgrounds/screenlock.png"
            ++ " --inside-color=282a3670"
            ++ " --{ring,{key,bs}hl}-color=50fa7bff"
            ++ " --{inside,ring}ver-color=6272a4ff"
            ++ " --{inside,ring}wrong-color=ff5555ff"
            ++ " --{line,separator,verif,wrong,modif}-color=282a36ff" )


------------------------------------------------------------------------
----------------------------- MAIN FUNCTION ----------------------------
------------------------------------------------------------------------
main = do
  xmproc <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc"
  xmonad $ docks defaults {
    logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc . wrap " " ""
      , ppCurrent = xmobarColor "#50fa7b" "" . wrap "[" "]"
      , ppUrgent = xmobarColor "#ff5555" ""
      , ppTitle = xmobarColor "#50fa7b" "" . shorten 50
      , ppSep = " | "}
    }

defaults = def {
  -- simple stuff
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  clickJustFocuses   = myClickJustFocuses,
  borderWidth        = myBorderWidth,
  modMask            = myModMask,
  workspaces         = myWorkspaces,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,

  -- key bindings
  keys               = myKeys,
  mouseBindings      = myMouseBindings,

  -- hooks, layouts
  layoutHook         = myLayout,
  manageHook         = myManageHook,
  handleEventHook    = myEventHook,
  startupHook        = myStartupHook
}
