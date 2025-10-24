{
  lib,
  stdenvNoCC,
  appimageTools,
  fetchurl,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "zoho-mail-desktop";
  version = "1.7.1";

  src = fetchurl {
    url = "https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-lite-x64-v${finalAttrs.version}.AppImage";
    hash = "sha256-KLDJl91vfTdDtUQ5maDuCBU1HJQf4V0VEnplAc4ytZM=";
  };

  wrapped = appimageTools.wrapType2 { inherit (finalAttrs) pname version src; };
  extracted = appimageTools.extract { inherit (finalAttrs) pname version src; };

  buildInputs = [
    finalAttrs.wrapped
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin

    ln -s ${finalAttrs.wrapped}/bin/zoho-mail-desktop $out/bin/zoho-mail-desktop

    mkdir -p $out/share/applications
    mkdir -p $out/share/lib/zoho-mail-desktop

    cp -r ${finalAttrs.extracted}/usr/* $out/
    cp -r ${finalAttrs.extracted}/{locales,resources} $out/share/lib/zoho-mail-desktop/

    cp ${finalAttrs.extracted}/zoho-mail-desktop.desktop $out/share/applications/
    substituteInPlace $out/share/applications/zoho-mail-desktop.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=zoho-mail-desktop'

    runHook postInstall
  '';

  meta = {
    description = "Zoho Mail Desktop Lite client";
    homepage = "https://www.zoho.com/mail/desktop/";
    license = lib.licenses.unfree;
    maintainers = [ lib.maintainers.juliuskreutz ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "zoho-mail-desktop";
  };
})
