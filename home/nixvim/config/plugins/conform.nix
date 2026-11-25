{ pkgs, ... }:
{
  programs.nixvim.extraPackages = with pkgs; [ rumdl ];
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        json = [ "jq" ];
      };
      format_on_save = {
        lsp_fallback = true;
      };
    };
  };
}
