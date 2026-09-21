adb wait-for-device
adb push fake_sbin /tmp/fake_sbin/
adb shell "chmod +x /tmp/fake_sbin/*;export PATH=/tmp/fake_sbin:$PATH;mount --bind /tmp/fake_sbin/pkill /usr/bin/pkill;mount --bind /tmp/fake_sbin/reboot /sbin/reboot;mount --bind /tmp/fake_sbin/recovery /usr/bin/recovery;which pkill;ps"
adb shell
