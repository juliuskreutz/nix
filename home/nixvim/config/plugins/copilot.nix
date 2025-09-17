{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = copilot-lua;
      cmd = "Copilot";
      event = "InsertEnter";
      opts = {
        suggestion = {
          keymap = {
            next = "<M-n>";
            prev = "<M-p>";
          };
        };
      };
    }
  ];
}
