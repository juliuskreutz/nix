{
  lib,
  appimageTools,
  fetchurl,
}:
let
  pname = "hayase";
  version = "6.4.46";

  src = fetchurl {
    url = "https://api.hayase.watch/files/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-QvuxWtkcZbC94e7BcpTnFrhEZNItLJQQqUFODzJ83HA=";
  };

  extracted = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cp -r ${extracted}/usr/share/icons $out/share/
    cp ${extracted}/hayase.desktop $out/share/applications/
    substituteInPlace $out/share/applications/hayase.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=hayase --ozone-platform=x11'
  '';

  meta = {
    description = "Stream anime torrents instantly, real-time with no waiting for downloads to finish! 🍿";
    homepage = "https://hayase.watch/";
    license = lib.licenses.bsl11;
    maintainers = [ lib.maintainers.juliuskreutz ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "hayase";
  };
}
