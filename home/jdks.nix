{
  pkgs,
  ...
}:
{
  home.file.".jdks/jdk23".source = pkgs.openjdk23;
  home.file.".jdks/jdk24".source = pkgs.openjdk24;
}
