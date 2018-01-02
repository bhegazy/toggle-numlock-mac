# Toggle Numlock for Mac OS X

Forked from https://github.com/chaimpeck/setledsmac and based on the advice of @gilsonolegario, this tool will let you toggle the numlock key on the CoolerMaster MasterKeys Pro M keyboard. It might work for other MasterKeys keyboards as well as other brands. I have not tested it on any keybaord other than the one that I am typing on right now.

Follow the setup to get this working with the actual numlock key on your keyboard.

## Setup

Run setup:
```bash
$ ./setup.sh
```

This will build the setleds tool and move it into `/usr/local/bin`. If you are having trouble building it or do not want to build it, you can alternatively move the included setled file:
```bash
$ cp -p bin/setleds /usr/local/bin # <--- do this if ./setup.sh does not work for some reason
```

You should now be able to toggle the LEDs with the included `toggle.sh` script:
```bash
$ ./toggle.sh
Turning on numlock
SUCCESS

$ ./toggle.sh
Turning off numlock
SUCCESS
```

You should notice the light on the keyboard changing when you run the script and should be able to confirm that the behavior of the number keys changes as well.

If the above script doesn't work, confirm that your keyboard is actually listed:
```bash
$ setleds -v
```

If the name is different than "MasterKeys*", then change that in the script to be sure that it works before the next step.

Once the script is working as expected, you will probably want to bind the toggling to the actual numlock key. To do this, I used a tool called Spark, found here:
https://www.shadowlab.org/softwares/spark.php

Download and put in your /Applications directory. Open it and add an Applescript shortcut. Press the numlock key for the shortcut and put the following Applescript:

```
set keyboardNameWildcard to "MasterKeys*"
set setledsScript to "/usr/local/bin/setleds -name \"" & keyboardNameWildcard & "\""

set currLeds to do shell script setledsScript & " -v"

if currLeds contains "+num" then
do shell script setledsScript & " -num"
else
do shell script setledsScript & " +num"
end if
```
If necessary, change the `keyboardNameWildcard` to whatever the correct name for your keyboard is. (The above applescript is included in the file `toggle-numlock.scpt`.)

[[https://github.com/chaimpeck/toggle-numlock-mac/blob/master/setup-screenshot.png|alt=setup-screenshot]]

![setup-screenshot](https://github.com/chaimpeck/toggle-numlock-mac/blob/master/setup-screenshot.png "Spark Setup Screenshot")


Create the hotkey and try it out. You should now have a working numlock key.

---

Please see here for usage of the setleds command-line tool:
https://github.com/chaimpeck/setledsmac
