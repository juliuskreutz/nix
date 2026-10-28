{ pkgs, ... }: {
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "50-newae.rules";
      text = ''
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2b3e", ATTRS{idProduct}=="*", MODE="0664", GROUP="chipwhisperer"
        SUBSYSTEM=="tty", ATTRS{idVendor}=="2b3e", ATTRS{idProduct}=="*", MODE="0664", GROUP="chipwhisperer", SYMLINK+="cw_serial%n"
        SUBSYSTEM=="tty", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="6124", MODE="0664", GROUP="chipwhisperer", SYMLINK+="cw_bootloader%n"
      '';
      destination = "/lib/udev/rules.d/50-newae.rules";
    })
  ];

  users.groups.chipwhisperer = { };
  users.groups.plugdev = { };

  users.users.julius.extraGroups = [
    "chipwhisperer"
    "plugdev"
  ];
}
