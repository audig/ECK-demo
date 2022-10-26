import { SfeirThemeInitializer } from "../web_modules/sfeir-school-theme/sfeir-school-theme.mjs";


// One method per module
function schoolSlides() {
  return [
    "00_intro.md",
    "01_speaker.md",
    "02_disclaimer.md",
    "03_recette-stack-collecte-logs-elastic.md",
    "04_galeres_de_cuisine.md",
    "05-eck-route-michelin.md"
  ];
}

function formation() {
  return [
    //
    ...schoolSlides(),
  ].map((slidePath) => {
    return { path: slidePath };
  });
}

SfeirThemeInitializer.init(formation);
