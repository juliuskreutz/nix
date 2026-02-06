{
  lib,
  appimageTools,
  fetchurl,
  forceX11 ? false,
}:
let
  pname = "hayase";
  version = "6.4.52";

  src = fetchurl {
    url = "https://api.hayase.watch/files/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-7Xar1NNWL2uLuhrsNyB6dTx8y0XDecotbs09WKzkWag=";
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
      --replace-fail 'Exec=AppRun' 'Exec=hayase${lib.optionalString forceX11 " --ozone-platform=x11"}'
  '';

  meta = {
    description = "Stream your torrents real-time, without waiting for downloads.";
    longDescription = "Hayase is a bring-your-own-content application. It does not ship or link to unofficial libraries, it simply lets you organise and watch the media you already have permission to access.";
    homepage = "https://hayase.watch/";
    license = lib.licenses.bsl11;
    maintainers = [ lib.maintainers.juliuskreutz ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "hayase";
  };
}
