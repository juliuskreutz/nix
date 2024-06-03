{pkgs, ...}: {
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = conform-nvim;
      event = [
        "BufReadPre"
        "BufNewFile"
      ];
      opts = {
        formatters_by_ft = {
          nix = ["alejandra"];
          json = ["prettierd"];
          toml = ["taplo"];
          sql = ["pg_format"];
        };
        format_on_save = {
          lsp_fallback = true;
        };
      };
    }
  ];
}
