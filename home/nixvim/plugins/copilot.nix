{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nodejs
    ];
  };
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = copilot-lua;
      cmd = "Copilot";
      event = "InsertEnter";
      opts = {
        suggestion = {
          auto_trigger = true;
          keymap = {
            next = "<M-n>";
            prev = "<M-p>";
          };
        };
      };
    }
  ];
}
