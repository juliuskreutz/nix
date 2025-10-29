{
  pkgs,
  ...
}:
{
  home.file.".jdks/jdk23".source = (pkgs.jdk23.override { enableJavaFX = true; });
  home.file.".jdks/jdk25".source = pkgs.jdk25;
}
