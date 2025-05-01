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
          nix = [ "treefmt" ];
          json = [ "jq" ];
          markdown = [ "prettierd" ];
          css = [ "prettierd" ];
          sql = [ "pg_format" ];
        };
        format_on_save = {
          lsp_fallback = true;
        };
        formatters.treefmt = {
          command = "treefmt";
          args = [
            "--stdin"
            "$FILENAME"
          ];
        };
      };
    }
  ];
}
