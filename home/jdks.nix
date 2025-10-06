{
  pkgs,
  ...
}:
{
  home.file.".jdks/jdk25".source = pkgs.jdk25;
}
