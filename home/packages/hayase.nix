{
  lib,
  stdenvNoCC,
  appimageTools,
  fetchurl,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "hayase";
  version = "6.4.36";

  src = fetchurl {
    url = "https://github.com/hayase-app/docs/releases/download/v${finalAttrs.version}/linux-hayase-${finalAttrs.version}-linux.AppImage";
    hash = "sha256-IaqpJdRwQMHXJk1qbcOJof2tlZFGPUDoM/WG1PeyUiw=";
  };

  wrapped = appimageTools.wrapType2 { inherit (finalAttrs) pname version src; };
  extracted = appimageTools.extractType2 { inherit (finalAttrs) pname version src; };

  buildInputs = [
    finalAttrs.wrapped
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin

    ln -s ${finalAttrs.wrapped}/bin/hayase $out/bin/hayase

    mkdir -p $out/share/applications
    mkdir -p $out/share/lib/hayase

    cp -r ${finalAttrs.extracted}/usr/* $out/
    cp -r ${finalAttrs.extracted}/{locales,resources} $out/share/lib/hayase/

    cp ${finalAttrs.extracted}/hayase.desktop $out/share/applications/
    substituteInPlace $out/share/applications/hayase.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=hayase'

    runHook postInstall
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
})
