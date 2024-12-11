{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = conform-nvim;
      event = [
        "BufReadPre"
        "BufNewFile"
      ];
      opts = {
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          json = [ "jq" ];
          markdown = [ "prettierd" ];
          css = [ "prettierd" ];
          sql = [ "pg_format" ];
        };
        format_on_save = {
          lsp_fallback = true;
        };
      };
    }
  ];
}
