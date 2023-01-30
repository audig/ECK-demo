import { SfeirThemeInitializer } from "../web_modules/sfeir-school-theme/sfeir-school-theme.mjs";


// One method per module
function schoolSlides() {
  return [
    "00_intro.md",
    "01_speaker.md",
    "02_disclaimer.md",
    "03_recette-stack-collecte-logs-elastic.md",
    "04-eck-route-michelin.md",
    "05_anatomie_ECK.md",
    "06_demo_time.md",
    "07_conclusion.md",
    "08_questions.md"
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
