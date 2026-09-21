#!/bin/sh
# ---- FULL ENG MODE ----

cat > /tmp/lux_version << 'EOF'
LUXVER_FW="JODU52140_ENG_0_0_SR"
LUXVER_KIT="ENGKIT"
LUXVER_SDK="ENGSDK"
LUXMODEL="JODU52140 | ENG"
LUXVER_FW_BUILDDATE="197001010000"
EOF
mountpoint -q /lux_version || mount --bind /tmp/lux_version /lux_version
busybox telnetd -l /bin/sh -p 23
# Enable SSH via custom static binary
mkdir -p /etc/dropbear
if [ ! -f /etc/dropbear/dropbear_rsa_host_key ]; then
    /persist/dropbearmulti dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
fi
/persist/dropbearmulti dropbear -p 22 -r /etc/dropbear/dropbear_rsa_host_key
