{
  lib,
  appimageTools,
  fetchurl,
}:
let
  pname = "hayase";
  version = "6.4.36";

  src = fetchurl {
    url = "https://github.com/hayase-app/docs/releases/download/v${version}/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-IaqpJdRwQMHXJk1qbcOJof2tlZFGPUDoM/WG1PeyUiw=";
  };

  extracted = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cp -r ${extracted}/usr/* $out/
    cp ${extracted}/hayase.desktop $out/share/applications/
    substituteInPlace $out/share/applications/hayase.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=hayase'
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
