{ ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        json = [ "jq" ];
        markdown = [ "rumdl" ];
        sql = [ "pg_format" ];
      };
      format_on_save = {
        lsp_fallback = true;
      };
    };
  };
}
