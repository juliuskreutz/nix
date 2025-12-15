{
  pkgs,
  ...
}:
{
  home.file.".jdks/jdk17".source = pkgs.jdk17;
  home.file.".jdks/jdk25".source = pkgs.jdk25;
}
