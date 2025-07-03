{
  pkgs,
  ...
}:
{
  home.file.".jdks/jdk23".source = (pkgs.jdk23.override { enableJavaFX = true; });
  home.file.".jdks/jdk24".source = pkgs.jdk24;
}
