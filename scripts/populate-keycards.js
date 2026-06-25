/* Populate the Key card / fob number (keyCard) for therapists from the Fanvil
 * card list, matching by name. Only fills BLANK keyCard fields, so it is safe to
 * re-run and won't overwrite anything already entered.
 * Run in the CRM Railway console:  node scripts/populate-keycards.js
 */
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// name -> most recently issued card number (latest by issuing time)
const CARDS = [
  { name: "Peter Strong", card: "0006641417", count: 1 },
  { name: "Nataliya Khromey", card: "0008108156", count: 2 },
  { name: "Michael Saad", card: "0000725396", count: 1 },
  { name: "Annice Ling", card: "0000043896", count: 1 },
  { name: "Sabira Camp", card: "0000006878", count: 1 },
  { name: "Ellen Dempsey", card: "0008095224", count: 1 },
  { name: "Geneen Gray", card: "0000723874", count: 1 },
  { name: "Zahrah Sadiq", card: "0000190331", count: 1 },
  { name: "Karishma Tanna", card: "0000682693", count: 1 },
  { name: "Carmel Grannell", card: "0008137804", count: 1 },
  { name: "India Wilde", card: "0000031682", count: 1 },
  { name: "Aoife Boland", card: "0000243725", count: 1 },
  { name: "Rachel Baynes", card: "0010139083", count: 1 },
  { name: "Dvija Acharya", card: "0008080656", count: 1 },
  { name: "Odette Giordmaina", card: "0000275407", count: 1 },
  { name: "Zaneta Zbierska", card: "0000741070", count: 1 },
  { name: "Joanna Zubkowicz", card: "0000265514", count: 1 },
  { name: "Myla Etac", card: "0000678766", count: 1 },
  { name: "Adrienne Bradshaw", card: "0000013777", count: 1 },
  { name: "Diana Genas", card: "0000386344", count: 1 },
  { name: "Imogen Smith", card: "0000677345", count: 1 },
  { name: "Ziad El Damerji", card: "00006827210", count: 1 },
  { name: "Julian Pearce", card: "0000048156", count: 1 },
  { name: "Gaby White", card: "0000432020", count: 1 },
  { name: "Zaccaria Caimi", card: "0000736263", count: 1 },
  { name: "Amy Moore", card: "0008102773", count: 1 },
  { name: "Ras Oburoh", card: "0000428577", count: 1 },
  { name: "Andrea Prieto", card: "0002878011", count: 1 },
  { name: "Sylvia Ikpedighe", card: "0000388746", count: 1 },
  { name: "Vishnu Nathan", card: "0007905802", count: 1 },
  { name: "Ema Borges", card: "0000034058", count: 1 },
  { name: "Joanna Nuttall", card: "0000678727", count: 1 },
  { name: "Yasmeen Kara", card: "0000445365", count: 1 },
  { name: "Katrina Edwards", card: "0007957353", count: 1 },
  { name: "Nilufar Rahim", card: "0000713697", count: 1 },
  { name: "India Cooke", card: "0000008386", count: 2 },
  { name: "Hansel Misquitta", card: "0008132052", count: 1 },
  { name: "Laura Tilson", card: "0004037855", count: 1 },
  { name: "Madeleine Kibbel", card: "0000408742", count: 1 },
  { name: "Tefeshet Yohannes", card: "0008140711", count: 1 },
  { name: "Carmelle Gentle", card: "0003875621", count: 1 },
  { name: "Valeria Sisova", card: "0000683498", count: 1 },
  { name: "Satpal Chaggar", card: "0000009946", count: 1 },
  { name: "Simona Ahmed", card: "0004037870", count: 1 },
  { name: "Kaveetha Kandiah", card: "0000462844", count: 1 },
  { name: "Melvyn Egwuatu", card: "0000044826", count: 1 },
  { name: "Maja Wilinska", card: "0011679033", count: 1 },
  { name: "Thriya Pillay", card: "0000040777", count: 1 },
  { name: "Max Fedyk", card: "0000018161", count: 1 },
  { name: "Lauren Bright", card: "0000064860", count: 1 },
  { name: "Terri Claire Paterson", card: "0000691392", count: 1 },
  { name: "Abbey Robb", card: "0000020918", count: 1 },
  { name: "Monika Andrzejewska", card: "0008132331", count: 1 },
  { name: "Rachel Koranteng", card: "0000462162", count: 1 },
  { name: "Valentina Zambrana", card: "0008107859", count: 1 },
  { name: "Veronica Grey", card: "0000426936", count: 1 },
  { name: "Karolina Domagala", card: "0000079251", count: 1 },
  { name: "Rina Thapa", card: "0008078674", count: 1 }
];

const norm = (s) => (s || "").trim().toLowerCase().replace(/\s+/g, " ");

async function main() {
  const therapists = await prisma.user.findMany({
    where: { role: "THERAPIST" },
    select: { id: true, name: true, keyCard: true },
  });
  const byName = new Map();
  for (const t of therapists) byName.set(norm(t.name), t);

  let set = 0, already = 0;
  const noMatch = [], multiples = [];

  for (const c of CARDS) {
    if (c.count > 1) multiples.push(c);
    const t = byName.get(norm(c.name));
    if (!t) { noMatch.push(c); continue; }
    if (t.keyCard && t.keyCard.trim()) { already++; continue; }
    await prisma.user.update({ where: { id: t.id }, data: { keyCard: c.card } });
    set++;
    console.log(`+ ${t.name}  ->  ${c.card}`);
  }

  console.log("");
  console.log("Set:                       ", set);
  console.log("Skipped (already had one): ", already);
  console.log("");
  console.log("CSV names with NO matching therapist (check spelling / not in CRM):");
  noMatch.forEach((c) => console.log(`  ${c.name}  (${c.card})`));
  console.log("");
  console.log("Names that had MULTIPLE cards (latest issued was used - verify):");
  multiples.forEach((c) => console.log(`  ${c.name}  ->  ${c.card}`));
}

main().catch((e) => { console.error(e); process.exit(1); }).finally(() => prisma.$disconnect());
