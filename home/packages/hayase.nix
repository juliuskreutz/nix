{
  lib,
  appimageTools,
  fetchurl,
}:
appimageTools.wrapType2 rec {
  pname = "hayase";
  version = "6.4.21";

  src = fetchurl {
    url = "https://github.com/hayase-app/ui/releases/download/v${version}/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-KCUNOlzPKiyXxwbmHyOcVnatMpdl4aSdaLUKLoso0YU=";
  };

  extracted = appimageTools.extractType2 { inherit pname version src; };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    mkdir -p $out/share/lib/${pname}

    cp -r ${extracted}/usr/* $out/
    cp -r ${extracted}/{locales,resources} $out/share/lib/${pname}/

    cp ${extracted}/${pname}.desktop $out/share/applications/
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
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
