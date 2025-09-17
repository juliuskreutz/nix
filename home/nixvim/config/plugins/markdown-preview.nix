{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = markdown-preview-nvim;
      cmd = [
        "MarkdownPreviewToggle"
        "MarkdownPreview"
        "MarkdownPreviewStop"
      ];
      ft = "markdown";
    }
  ];
}
