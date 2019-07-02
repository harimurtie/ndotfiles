
Skip to end of metadata
Created by Jay Ta'ala, last modified on Jun 17, 2019 Go to start of metadata
I'm a big fan of i3 (tiling window manager for Linux).  I'm also a big fan of Arch and the user-friendly Manjaro Linux (which is based on Arch).  Put these together (i3 + Manjaro) and you get the pure awesomeness that is Manjaro i3 (Community Edition).

Tiling window managers do have a fairly steep learning curve, but dang, in terms of efficiency and managing many windows and tasks at once, you just can't beat a tiling window manager (for me anyway).

The below is a guide mostly just for me and covers some setup notes for my Manjaro i3 systems.

The below guide was written largely for me and covers some setup notes for my Manjaro i3 systems. It might not work directly on your system as it depends (somewhat) on other applications I install/use (these are also outlined in the the guide below). In other words YMMV - and expect to have to modify the below to suit your needs.

Note: for brevity I'm going to refer to my Manjaro i3 system as Mi3 below.


Turn on firewall
Enable TRIM for SSD
Trackpad setup
If you use libinput
If you use (or prefer) xf86-input-synaptics
Disable "beep" sound in terminal application
Screen tearing (with Compton)
Fixing QT5 applications (like VLC) UI scaling (if icons, fonts are too big)
Hibernate (suspend to disk)
Stop Razer Blade 15 waking right after sleep
Set default applications
Unlocking gnome-keyring on login
Ricing (theming) and modifying i3
Ricing Conky (numix theme)
Ricing the (standard) i3 status bar
Using (and ricing) py3status instead of i3status
Ricing dmenu
Ricing rofi (to match my theming)
Ricing notifications (dunst)
Ricing alttab
Enabling per window transparency with transset-df (and keybind changing it)
Window Management and various other implementations in i3
My "special" window combiner bindsyms
Container renaming
Dynamic container renaming
Automatic container renaming from selected window
Scratchpad specific applications and bind their showing/hiding to a key shortcut
Save i3 layouts with i3-layout-manager
Guide
Turn on firewall
Let's first enable the firewall (here we're using ufw):

sudo systemctl enable ufw
sudo ufw enable
We can set firewall config via the gufw:

sudo gufw
Enable TRIM for SSD
If you have an SSD, I'd suggest enabling the fstrim.timer service for TRIM:

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
Trackpad setup
With i3 my hands hardly leave the keyboard and almost never reach for the mouse.  As such, I generally use my touchpad.  My preference is to disable mouse tapping, use 'natural scrolling' and disable 'horizontal scrolling'.  Although you can set all these settings using Manjaro i3's bmenu (mod+ctrl+b, and choose 'Hardware and drivers' → 'Configure touchpad'), these settings will not survive a reboot.

If you use libinput
To make these settings permanent, you can either add them to your .i3/config file, or set the options in /etc/X11/xorg.conf.d/30-touchpad.conf.  We're going to do the latter.  Edit the file using your preferred editor.  Below is an example of the settings I prefer.

/etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
        Driver "libinput"
            MatchIsTouchpad "on"
                Option "Tapping" "off"
                    Option "NaturalScrolling" "true"
                        Option "HorizontalScrolling" "false"
                        EndSection
                        If you use (or prefer) xf86-input-synaptics
                        So, you can use the older arch synaptics driver instead of the newer libinput drivers.  Note that the synaptics driver is deprecated and hasn't been updated since 2012.  Having said that, on my Metabox P650RS-G the synaptics driver just feels better (the libinput drivers feel a bit "floaty", and not as responsive - I've yet to play around with it's config to improve the feel).

                        Let's first install the driver with pacman

                        sudo pacman -S xf86-input-synaptics
                        Once pacman installs, you'll need to copy /usr/share/X11/xorg.conf.d/70-synaptics.conf to the /etc/X11/xorg.conf.d

                        sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
                        Now let's backup and then remove the current libinput touchpad conf file (which in my case was 30-touchpad.conf

                        sudo mv 30-touchpad.conf 30-touchpad.conf.backup
                        I prefer natural scrolling with the touchpad, so let's modify 70-synaptics.conf to add this (note this is taken direclty from the official arch synaptics page):

                        Section "InputClass"
                            Identifier "touchpad catchall"
                                Driver "synaptics"
                                    MatchIsTouchpad "on"
                                        ...
                                            Option "VertScrollDelta" "-111"
                                                Option "HorizScrollDelta" "-111"
                                                ...
                                                EndSection
                                                Note you'll need to reboot or restart x for the changes to take place.

                                                Disable "beep" sound in terminal application
                                                On one of my machines there was a very annoying "beep" sound that played whenever I did stuff (like hitting backspace too much in the terminal).  This got annoying pretty quickly.

                                                I couldn't find a setting to disable this.  After some research it appears to be an X11 session property which can be disabled by running the following from terminal:

                                                xset -b
                                                You can make this stick after reboot by editing /etc/xprofile or ~/.xprofile (user specific setting) and adding the above command to either file.  If either file does not exist just create one.

                                                Screen tearing (with Compton)
                                                On one my laptops (Thinkpad e480) there was noticable screen tearing with compton enabled.  To eliminate the screen tearing found there were several tweaks needed to the ~/.config/compton.conf configuration file.  Below are the changes needed (note you'll need to replace the original settings below with these ones):

                                                backend = "glx";
                                                ...
                                                vsync = "opengl-swc";
                                                Fixing QT5 applications (like VLC) UI scaling (if icons, fonts are too big)
                                                On my Mi3 setup, I noticed that QT5 applications like VLC had huge icons and fonts were all messed up.  Now, I don't have a HiDPI screen (screen resolution is 1920x1080) but still had this issue.  Here's what ended up fixing this for me:

                                                Add the following lines to your .profile:

                                                export QT_QPA_PLATFORMTHEME="qt5ct"
                                                export QT_AUTO_SCREEN_SCALE_FACTOR=0
                                                export QT_SCALE_FACTOR=1
                                                Restart then open up (install if not already installed) qt5ct (run from terminal).  Change settings and font to size 10 of some look that you like.  Here's settings that I quite like:





Hibernate (suspend to disk)
I sometimes prefer to hibernate my system, but unfortunately on my default Mi3 install hibernation wasn't working.  This may be because in this instance I didn't use a separate swap partition and instead opted to simply use a swap file for swap needs.

First just check that you can hibernate (mod+0, followed by h).  If you can, then there's no need to do the below.  If you can't, continue (below).

Let's first enable hibernation.  To setup hibernate we're going to install the hibernator package and run it as root:

sudo pacman -S hibernator
sudo hibernator
Once the hibernator script has run you should have the requirements for hibernate to work.

If you're using a swap file (as opposed to a swap partition) then we'll need to do a bit more work.  I assume there that you're using grub as you're boot loader.

We're going to be editing /etc/default/grub.  Note that there is scope here to mess things up royally.  So, let's backup our current grub file to be safe(r)

sudo cp /etc/default/grub /etc/default/grub.backup
So, before we can edit our grub, we need a few pieces of information:

device name of parition where have swap file;
physical offset of /swapfile (which is my swap file).
For (1), we can simply run df and find the partition where our swap file is (which will usually be the same partition as Mi3 is installed to).  In my case, running dfoutputs:



The partition where I have Mi3 installed is /dev/sda3.

For (2), we can run sudo sudo filefrag -v /swapfile.  For my system doing so outputs:



The value we are after is the ext 0 physical offset as shown in the image (red rectangle).

With these pieces of information let's now edit our grub

sudo nano /etc/default/grub
We want to find the lines starting with GRUB_CMDLINE_LINUX (which was line 5 in my case) and add the following with the bits of information previously outlined:

GRUB_CMDLINE_LINUX="resume=/dev/sda3 resume_offset=249856"
Now, we can save our changes and then run

sudo update-grub
Reboot and hibernation should hopefully now be working.  GIve it a go.

Stop Razer Blade 15 waking right after sleep
One of my (nicer) machines (Razer Blade 15) wouldn't sleep, or at least stay asleep (kind of like my kids...).  It would immediately wake after trying to sleep.  Apparently, it's caused by the USB 3.0 chip used on the machine.

You can fix this by running (see Arch wiki here):

echo XHC | sudo tee /proc/acpi/wakeup
However, this needs to be run after every startup.  Let's use systemd to run this as a service.

First, create a service file by:

sudo nano /etc/systemd/system/xhc-sleep.service
and paste the following:

[Unit]
Description=Workaround for razer blade 15 waking after sleeping (USB 3.0 causing).

 [Service]
 ExecStart=echo XHC | tee /proc/acpi/wakeup

  [Install]
  WantedBy=multi-user.target
  Now, let's enable and start the service:

  sudo systemctl enable xhc-sleep.service
  sudo systemctl start xhc-sleep.service
  Set default applications
  We can generally set default (or preferred applications) in Mi3 by using the morec_menu (mod+z).  Navigate with mod+z → settings → preferred applications.  However, in my case, even setting my preferred browser to chrome (or chromium) didn't stick.

  What did work though was modifying the ~/.config/mimeapps.list and replacing the default userapp-Pale Moon.desktop reference with google-chrome.desktop.

  Alternatively, you can set the default http and https xdg-mime applications with:

  xdg-mime default <browser>.desktop x-scheme-handler/http
  xdg-mime default <browser>.desktop x-scheme-handler/https
  where you can replace <browser> with you installed browser (e.g. pale-moon, firefox, chromium etc.).

  Unlocking gnome-keyring on login
  On many DEs that use gnome-keyring to securely store credentials (like usernames and passwords) they will automatically unlock the the keyring when logging in.  On i3... not so much.

  To get i3 to successfully unlock your keyring on login, you'll need to use the method outlined here.

  Edit /etc/pam.d/login and add the following two lines:

  auth       optional     pam_gnome_keyring.so
  session    optional     pam_gnome_keyring.so auto_start
  After a restart (or logout/login) your gnome keyring should be unlocked.

  Ricing (theming) and modifying i3
  One of the beauties with i3 (and Linux in general) is that you can you modify your environment to suit how you like to work.  This is particularly true with i3 where you can modify not only how it looks but also how it behaves.

  i3 makes this quite easy by providing a single config file where most changes can be made (~/.i3/config).

  Below is a copy of my config file that I usually implement to make the interface more appealing (to me).  Note the visual changes in my config are chosen to go along with the numix gtk theme (install with sudo pacman -S numix-gtk-theme).  It looks like this (screenshot running chrome, watching some netflix, and working in urxvt):



My config file:

Note that this config file contains other modifications that I prefer in my i3 setup, such as:

conky config files (see following section)
pamac-manager now starts as normal (not float);
using kupfer instead of dmenu (sudo pacman -S kupfer);
also using rofi for some windows manager - mainly listing all windows in all desktops (sudo pacman -S rofi);
using py3status instead of i3status (sudo pacman -S py3status);
mod+F12 suspends and locks the screen, and mod+Home locks the screen;
using 'uiop[' keys for various apps (like launching pamac, chromium, keeweb, putty, pcmanfm);
added resizing windows without needing resize mode (mod+alt+Left shrinks width by 20ppt, mod+alt+shift+Left shrinks width by 10ppt, etc.) - and disabled resizing mode.  Can also use vim style keys here;
changes to container and splitting shortcuts;
mod+alt+z, mod+alt+x increases/decreases current window transparency needs transset-df (sudo pacman -S transset-df);
sticky window toggle set to (mod+alt+s);
added "netflix" and "spotify" modes (mod+alt+n, mod+alt+m);
added some "special" window management shortcuts (mod+z, mod+shift+z, mod+x, mod+shift+x): these are some of my favourites and essentially combines two windows (that are next to each other) into a separate container.
I have several bindsyms that use integrated bash scripts (i.e. not external but explicitly defined in my i3 config) which depend on xdotool. Please ensure you have xdotool installed, e.g. do "pacman -S xdotool"

i3/config (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Contents of my ~/.i3/config  Expand source
Ricing Conky (numix theme)
I've also riced my Conky setup somewhat.  Most of these changes to are to match my theme and current shortcuts setup.  I have two conky configs: one for showing various system stats (like cpu, RAM, swap etc.) and one showing several keyboard shortcuts.  See below for screenshot of my current conky setup:



Let's start with the conky config files:

conky/conky_numix (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Conky (numix) theme for system stats (top right in image above)  Expand source
conky/conky_shortcuts_numix (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Conky shortcuts conf (see lower left in image above)  Expand source
My main i3 config file (see preceding section) expects these conky config files to be in ~/.config (you can place them anywhere really, you'll just need to update your i3 config file to point to them).

Ricing the (standard) i3 status bar
I usually also make modifications to the i3 status bar colours for the system stats.  User specific i3 status bar config is configured int he ~/.i3status.conf file.  Here's is mine, with several changes including:

default font colour change;
disk format change (showing decimal %used / %total);
added wlan ip address and ethernet ip address (these are hidden if not connected);
added battery %remaining time (next to %percentage)
i3status/.i3status.conf.standard (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Contents of my ~/.i3status.conf (for use with standard i3status)  Expand source
Using (and ricing) py3status instead of i3status
py3status is a python wrapper for i3status that provides a lot more features and extendability.  py3status gives more much control and provides some very cool modules.  First, you'll need to install py3status with:

sudo pacman -S py3status
Once, installed you'll need to modify your ~/.i3/config file and replace the status_command i3status directive with

status_command py3status -c ~/.i3status.conf
You'll notice that we use the same .i3status.conf file (which with py3status we can define some extra modules etc.).

Before you can use my py3status config file, you'll need to install font-awesome fonts (4.7) - I had issues with version 5, but works well with v4:

yaourt -S ttf-font-awesome-4
Below is my config file, which looks like this:



and includes p3status modules for:

spotify;
current network rate (download / upload);
public ip address information (isp, city, country);
currently connected network (wifi ssid and local ip address);
battery (with font awesome icons);
countdown timer;
i3status/.i3status.conf.py3status (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Contents of my ~/.i3status.conf (for use with py3status)  Expand source
Ricing dmenu
Along with the main i3 config file, there is also a config file dmenu (main application launcher in Mi3).  The appearance (colours etc.) are configured in the ~/.dmenurc file.  Here is my .dmenurc config file with colours that match my main i3 config:

dmenu/.dmenurc (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Contents of my ~/.dmenurc  Expand source
Ricing rofi (to match my theming)
If you use rofi, as I do (see my .i3/config above), you can also change it's theme.  There are a very nice selection of themes included with rofi.  You can change theme by running the following from your terminal

rofi-theme-selector
Theme files can be found in usr/share/rofi/themes.

I really liked the lb.rasi theme (which is included with rofi).  However, it didn't quite match the colours of my current theme.  I made a few subtle changes to this theme (only changed colours to match what I like).  Below is the resulting file, which should be placed in the rofi theme folder (see above).

rofi/themes/lb-numix.rasi (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Contents of my /usr/share/rofi/themes/lb-numix.rasi  Expand source
Ricing notifications (dunst)
You can also modify the look of the system notifications.  Configure colours etc. in ~/.config/dunst/dunstrc.  Here's a few small modifications to my dunstrc file (to match my theme):

dunst/dunstrc (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
Modifications to ~/.config/dunst/dunstrc  Expand source
I've disabled the default dunst shortcuts as they interfered with some of my i3 config bindsyms.

Ricing alttab
Although I do like the way i3 approaches window switching - I do miss the speed of alt-tabbing for switching between the last focused application and the current application (and doing so often).  For this I use the very nice alttab.  It's in the AUR so once you've enabled AUR (and installed something like yay) you can do:

sudo yay -S alttab-git
You can customise the look of alttab by changing the background, foreground and frame colour.  Below is the settings that match my numix theme.  Add the following to your ~/.i3/config:

exec --no-startup-id alttab -fg "#d58681" -bg "#4a4a4a" -frame "#eb564d" -t 128x150 -i 127x64
I also like to add a bit of transparency to my alttab.  You can do this by adding a rule for alttab to the opacity-rule array definition as seen in my compton.conf:

compton/compton.conf (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
 Expand source
 Resulting alttab settings that match my theme:



Enabling per window transparency with transset-df (and keybind changing it)
Using window transparencies effectively can make a big difference to the overall use and focus in managing lots of windows, especially when you might have a few sticky windows as well.

Although you can modify transparencies etc. by editing ~/.config/compton.conf, there's no functionality to increase or decrease transparencies 'on the fly' and for specific windows only.

You can achieve this with transset-df.  First you'll need to install it with

sudo pacman -S transset-df
Once installed, using transset-df is very straightforward, for example, to set transparency to 80%, simply call

transset-df 0.8
and then click on a window to set the transparency for that window.

We can do even better though with i3.  In my ~/.i3/config I've added

# window transparency adjustment (and alias to restart compton)
bindsym $mod+Mod1+z exec transset-df -a --min 0.25 --dec 0.25
bindsym $mod+Mod1+x exec transset-df -a --inc 0.25
bindsym $mod+Mod1+c exec --no-startup-id compton -b
These shortcuts will increase or decrease transparency of the currently selected window by +/-25%.  You might notice I also have a shortcut (mod+alt+c) for compton, which will reset start/reset compton.  You'll see why next.

I prefer my sticky windows to be opaque by default, and using the above I can then change them to suit. To change the default window transparency used for sticky windows you'll need to modify your compton config (~/.config/compton.conf) and make sure it contains

"99:_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
in the opacity-rule array.

This works to my liking.  However, I've found that when I want to change my sticky window back to opaque, my default inactive-opacity setting for compton kicks in (in other words, when I select something else my sticky window is not quite opaque).  Resetting compton with mod+alt+c fixes this and reapplies my default transparency setting for sticky windows.

For reference here is my ~/.config/compton.conf

compton/compton.conf (source from https://gitlab.jaytaala.com/j.taala/jt-config-repo.git)
~/.config/compton.conf  Expand source


Window Management and various other implementations in i3
My usage and window management approaches in i3 have evolved over time - and continue to evolve.  If you look through my dev branch you'll see many changes and things tried (and reverted) as I've slowly tried out things until I've found what works best for me.  That's one the many things I love about i3 (and linux in general).

Below are just a few of the window management approaches that have stuck with me.  Please note that these approaches might not work for you - and that's fine.  Feel free to adapt (or disregard) them.

My "special" window combiner bindsyms
I found that much of my time was spend combining two adjacent windows into a single container.  That is, say I have four application windows all in a tabbed container, like so:



Now, most of the time I just want to combine two windows (in this example, my browser window and the Atom window to the right) into a split h container.  To do this, you would usually do something like

create split h container;
focus on the right app window;
move right app window left (which combines into container);
focus back on left app.
The above steps result in:



Now, that gets rather tedious after doing it a thousand times.

Thankfully, you can basically do all these steps and bind it to a single shortcut defined in you i3 config file.  Behold:

# special combo for horizontal split of two windows next to each other
bindsym $mod+x split h, layout splith, focus right, move left, focus left, $con_title
bindsym $mod+Shift+x split h, layout splith, focus left, move right, focus right, $con_title
The two bindsyms will combine in a split container with the right adjacent window ($mod+x) or with the adjacent window on the left ($mod+Shift+x).

I also have similar bindsyms for combining adjacent windows into a tabbed container:

# special combo for container tabbed split of two windows next to each other
bindsym $mod+z split h, layout tabbed, focus right, move left, focus left, $con_title
bindsym $mod+Shift+z split h, layout tabbed, focus left, move right, focus right, $con_title
Container renaming
Dynamic container renaming
I've noticed that when you have a heavy window workload (lots of windows) and you've containerised lots of them - container names kind of... suck.  That is, they almost become so convoluted that it's easy to get lost.  For example look at the screenshot below of a normal workload for me (during development):



Notice the container names at the top (stuff like T[filezilla putty H[chromium chromium]]...) I struggle to segregate and identify (remember) where I put that chromium or terminal window that I was working on.

Now notice the difference with the same workload but container names changed:



Can you see the difference?  I've simply renamed the containers into something I understand; I have a container to my git related stuff (git clients and stuff), a container for several IDEs I use, another for apps I'm using to deploy applications to several web servers, and a container with stuff related to the latest javascript question/problem I'm figuring out.  These are all much more recognisable to me and helps me avoid "too many obscure window titles" hell.

I recently found this post on reddit that outlined a few ways to rename containers on the fly.  This can be achieved with a single bindsym that uses zenity (so make sure you have the zenity package installed) to pop up an input window for you to enter a container name and then focuses on the window parent, renames the container and then focuses back on the child window.  Below I've embedded a modified version of the script into a single bindsym command:

# dynamic renaming of parent container
bindsym $mod+slash exec "answer=$(zenity --title=\\"i3-msg title_format\\" --text \\"Change %TITLE for parent container\\" --entry); if [ -n \\"$answer\\" ]; then i3-msg focus parent, title_format \\"<span foreground='pink'><b> $answer</b></span>\\", focus child; else i3-msg focus parent, title_format \\"<span foreground='pink'><b> %title</b></span>\\", focus child; fi"
I've bound it to $mod+slash ("/" key).

Automatic container renaming from selected window
The above method can be used to default any container name to that of (for example) the currently selected window at the time of creating the container.  By defining the following config variable:

set $con_title exec "answer=$(xdotool getwindowfocus getwindowname); i3-msg focus parent, title_format \\"<span foreground='#ff8c85'><b> ⮡$answer</b></span>\\", focus child"
 and appending to our special window combiner bindsyms (see sections above), like this:

# special combo for horizontal split of two windows next to each other
bindsym $mod+x split h, layout splith, focus right, move left, focus left, $con_title
bindsym $mod+Shift+x split h, layout splith, focus left, move right, focus right, $con_title
Will cause the container title (created by $mod+x etc.) to be based on the window title of the application selected at the time of container generation.

Changing title behaviour to default for a single container
I've created a simple bindsym shortcut ($mod+Mod1+slash) to change the container title of a single (selected) container back to i3 default (e.g. T[chromium]).

Reverting to previous window title behaviour altogether
If you don't like this container title behaviour simply change the $con_title definition to:

set $con_title focus parent; title_format "<span foreground='#ff8c85'><b> %title</b></span>"; focus child; title_format " %title"
Scratchpad specific applications and bind their showing/hiding to a key shortcut
The i3 scratchpad is great holding area for application windows that you might want to keep hide from all workspaces until you need them.  I often use the scratchpad for applications like my email client (which I don't want to see until an email arrives etc.) or for an on-demand terminal (not really a drop-down terminal but similar use case), or for an application that I regularly want to (quickly) popup, retrieve information and then have it get out of the way just as quickly (like a password manager for example).

In order for the use case(s) above, you really want to bind the scratchpad application to a keyboard shortcut that can be pressed to show the scratchpad application, and then pressed again to hide said application.

I wrote several scripts and integrated these directly in my i3.conf.  They basically check if an application is running, if it's not then start it (where you can then scratchpad it with the normal shortcut: mod+Shift+minus).  If it is running (and already on the scratchpad) pressing the shortcut will show/hide said application.  Of course, you can write a script to do all this and call it from your i3.conf, but I prefer to explicitly define the bash script in my conf (partly to cut down on others needing to take copy of my scripts separately from my i3.conf file).

Enough waffling, some i3.conf examples:

Terminator (terminal application)
I use the very cool (I think) terminator.  See my i3.conf bindsym below:

bindsym $mod+Shift+Return exec "APP=\\"terminator\\"; CLASS=\\"Terminator\\"; if pgrep -x \\"$APP\\" > /dev/null 2>&1; then i3-msg \\"[class=\\"$CLASS\\"] scratchpad show\\"; else \\"$APP\\"; fi"
You'll note that I define separate bash variables ($APP, $CLASS) here as the command to start Terminator is "terminator" but the WM_CLASS (window class) returned is "Terminator".

KeeWeb
My bindsym for KeeWeb (keepass cross-platform client):

bindsym $mod+o exec "APP=\\"KeeWeb\\"; if pgrep -x \\"$APP\\" > /dev/null 2>&1; then i3-msg \\"[class=\\"$APP\\"] scratchpad show\\"; else \\"$APP\\"; fi"
Save i3 layouts with i3-layout-manager
i3 natively supports saving and loading specific window layouts with the i3-save-tree, however the implementation is not really "user ready" in the sense that you can't use it as is to easily save and load different layouts.

Tomáš Báča wrote a fantastic script that makes this functionality extremely simple to use.

I find having set/defined layouts really eases managing complex window setups.  Often I am working with many windows in some complicated setup (with child window containers of window containers etc.) and want to just get back to something simple(r) - which can be surprisingly tedious

I've also added three layouts (which can be loaded) I use most and have provided bindsyms for each in my i3 config file.  These are:

layout-ALL-TABBED.json  ALL-TABBED  mod+Shift+w Basic layout with single (root) tab container.  Useful for when you have a complex window layout and want to remove all windows and place in simple tabbed layout.
layout-SPLIT-TWO-TABBED.json    SPLIT-TWO-TABBED    mod+Shift+a Layout with two root child containers (horizontally split) with each root child container set to be a tabbed container.
layout-SPLIT-FOUR-TABBED.json   SPLIT-FOUR-TABBED   mod+Shift+s Layout with four root child containers (screen partitioned into four quarters) with each root child container set to be a tabbed container.
You'll need to have the i3-layout-manager script in your system path for the i3.conf  shortcuts to work and load on startup.

You can clone the git repo (or even just download the script) and copy (or create a symbolic link) in your system path (I'd suggest /usr/local/bin), like below

git clone https://github.com/klaxalk/i3-layout-manager.git
cd i3-layout-manager
sudo cp layout_manager.sh /usr/local/bin/i3-layout-manager
sudo chmod +x /usr/local/bin/i3-layout-manager
Download (somewhere) and copy my layouts above into the ~/.layouts folder, e.g.:

cp layout-ALL-TABBED.json layout-SPLIT-TWO-TABBED.json layout-SPLIT-FOUR-TABBED.json ~/.layouts
References
https://forum.manjaro.org/t/reversed-scrolling-in-i3-edition/25811
https://wiki.archlinux.org/index.php/Libinput
https://wiki.archlinux.org/index.php/Touchpad_Synaptics
https://wiki.archlinux.org/index.php/Razer_Blade#2018_version
https://forum.manjaro.org/t/how-disable-bios-beep-like-sound-in-some-applications/17094/5
https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
https://i3wm.org/i3status/manpage.html#_disk
http://duncanlock.net/blog/2013/06/07/how-to-switch-to-compton-for-beautiful-tear-free-compositing-in-xfce/
http://vadim-kirilchuk-linux.blogspot.com.au/2013/05/swap-file-for-hibernation.html
https://github.com/DaveDavenport/rofi
https://wiki.archlinux.org/index.php/Per-application_transparency
https://forum.manjaro.org/t/manjaro-i3-how-to-use-lightdm-as-lockscreen/42131
https://www.reddit.com/r/i3wm/comments/7f84ae/is_there_a_way_to_rename_parent_containers/
https://github.com/klaxalk/i3-layout-manager
Related articles
Page:
Install Microsoft Office 2010 with wine on Arch, Manjaro, Linux
Page:
My Manjaro i3 setup
Page:
Japanese input with i3 and Arch based distros
Page:
Add user folder to path in Arch based based distros

