{
  appimageTools,
  fetchurl,
  makeWrapper,
}:
appimageTools.wrapType2 rec {
  pname = "hayase";
  version = "6.4.15";

  src = fetchurl {
    url = "https://github.com/hayase-app/ui/releases/download/v${version}/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-WN4qMZmYOcbz4Htj5URzKU3JPoE84vstYxOduWl4IYk=";
  };

  extracted = appimageTools.extractType2 { inherit pname version src; };

  nativeBuildInputs = [ makeWrapper ];

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    mkdir -p $out/share/lib/${pname}

    cp -r ${extracted}/usr/* $out/
    cp -r ${extracted}/{locales,resources} $out/share/lib/${pname}/

    cp ${extracted}/${pname}.desktop $out/share/applications/
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';
}
