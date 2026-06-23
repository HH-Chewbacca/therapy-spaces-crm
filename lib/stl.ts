// Shared Special Treatment Licence detection.
// Keywords from the London Local Authorities Act A-Z list of treatments
// that typically require a special treatment licence.
export const STL_KEYWORDS = [
  "acupressure","acupuncture","acupuncturist","aesthet","aromatherapy","ayurvedic",
  "body massage","body piercing","body talk","body wrap","bowen","champissage",
  "chiropody","chiropractic","chiropractor","colour therapy","craniosacral","cryosauna",
  "deep tissue","dermal filler","dry needling","eft","electrolysis","electrocautery",
  "endermologie","faradism","fibroblast","filler","floatation","foot detox","galvanism",
  "gyratory","halotherapy","high frequency","holistic massage","hot stone","hydrotherapy",
  "indian head","infra red","infrared","infusion","ipl","kirlian","korean hand",
  "laser","lipo","lymphatic drainage","manicure","manual lymphatic","marma",
  "massage","metamorphic","micro current","microblading","micropigmentation","moxibustion",
  "myofascial","naet","nail extension","neuroskeletal","no hands massage","osteopath",
  "osteomyology","oxygen therapy","ozone sauna","pedicure","permanent make","permanent makeup",
  "physiotherap","physiotherapy","plasma","podiatry","polarity therapy","prp",
  "qi gong","radio frequency","reflexolog","reiki","rolfing","roll shaper","sauna",
  "scenar","semi permanent","shiatsu","soft tissue","spmu","sports massage","sports therapy",
  "steam","stone therapy","swedish massage","tapas acupressure","tattoo","thai massage",
  "thalassotherapy","thermavein","tongue tie","tui na","tui-na","ultrasonic","ultra sonic",
  "ultra violet","uv tanning",
];

export function detectStlRequired(skill: string | null | undefined): boolean {
  if (!skill) return false;
  const s = skill.toLowerCase();
  return STL_KEYWORDS.some(k => s.includes(k));
}
