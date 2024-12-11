{
  lib,
  appimageTools,
  fetchurl,
}:
let
  version = "1.6.5";
  pname = "zoho-mail-desktop";

  src = fetchurl {
    url = "https://downloads.zohocdn.com/zmail-desktop/linux/${pname}-lite-x64-v${version}.AppImage";
    hash = "sha256-TiPf5tQnVjPpzteSxIa4RLEyYBx6ohnnxPTAG0JjnrM=";
  };

  appimageContents = appimageTools.extractType1 { inherit pname version src; };
in
appimageTools.wrapType1 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = {
    description = "Zoho Mail Desktop Lite client";
    homepage = "https://www.zoho.com/mail/desktop/";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ juliuskreutz ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    mainProgram = "zoho-mail-desktop";
  };
}
