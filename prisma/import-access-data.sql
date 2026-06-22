-- Access data import: update existing therapist records by name match
-- Run in Railway PostgreSQL console

UPDATE "User" SET skill = 'Reiki', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Anita Banham') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapy', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Aileen Robinson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapy', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Lisa Few') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapy', notes = 'may want room - uktr - meeting at 2:15 Sat 19/09', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Emma Foster') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Laser treatment', notes = 'Simin Soleimani', "referredBy" = 'Website', "viewingDate" = '2020-05-05 00:00:00'::timestamp, "documentPackDate" = '2020-05-05 00:00:00'::timestamp, "documentReviewDate" = '2020-05-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2020-05-05 00:00:00'::timestamp, "keyGivenDate" = '2020-05-05 00:00:00'::timestamp, "keySentDate" = '2020-05-05 00:00:00'::timestamp, "depositInvoicedDate" = '2020-05-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Simin Sol') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'First Health Ltd', skill = 'Audiologist' WHERE LOWER(name) = LOWER('Carol Beecher') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Chartered Psychologist' WHERE LOWER(name) = LOWER('Sarah Corrie') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Clinical Psychologist' WHERE LOWER(name) = LOWER('Anila George') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'CBT' WHERE LOWER(name) = LOWER('Joanna Lilley') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'CBT/Hypnotherapy', notes = 'will take rooms ad-hoc - key given 22/10/20', "accreditationBody" = 'GHR', "accreditationNumber" = '8515', "clinicTelephone" = '07960 309 397', "clinicEmail" = 'marilyn@mjhypnotherapy.co.uk', website = 'www.mjhypnotherapy.com', "viewingDate" = '2020-09-30 00:00:00'::timestamp, "documentPackDate" = '2020-10-01 00:00:00'::timestamp, "documentReviewDate" = '2020-10-12 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2020-10-12 00:00:00'::timestamp, "keyGivenDate" = '2020-10-12 00:00:00'::timestamp, "depositInvoicedDate" = '2020-10-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Marilyn Jarman') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '20 Priory Lane', address3 = 'West Molesey', postcode = 'KT8 2PS', skill = 'Counselling', "referredBy" = 'UKTR', "viewingDate" = '2022-05-19 00:00:00'::timestamp, "documentPackDate" = '2022-05-19 00:00:00'::timestamp, "documentReviewDate" = '2022-05-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-05-19 00:00:00'::timestamp, "keyGivenDate" = '2022-05-19 00:00:00'::timestamp, "keySentDate" = '2022-05-19 00:00:00'::timestamp, "depositInvoicedDate" = '2022-05-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jo Spooner') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Acupuncture', notes = 'key given 10/20', "referredBy" = 'Friend' WHERE LOWER(name) = LOWER('Sing Sing Yu') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Beauty Therapsit', notes = 'wants block' WHERE LOWER(name) = LOWER('Hiba Nasser') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reiki', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Karen Jackel') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'First Health Ltd', skill = 'Audiologist', notes = 'retired' WHERE LOWER(name) = LOWER('David Glenn') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Coaching', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Lisa-Marie Sikand') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'GP', notes = 'UKTR lead - GP service', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Madalina Marcu') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapy', notes = 'will contact in feb 21', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Katherine Ashmore') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Coaching', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Rebecca Barr') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '5 Oak Hill Crescent', address3 = 'Surbiton', postcode = 'KT6 6ED', skill = 'Osteopath', "referredBy" = 'UKTR', "accreditationBody" = 'GOC', "accreditationNumber" = '7480', "clinicTelephone" = '07912 963 665', "clinicEmail" = 'info@LTosteo.co.uk', website = 'www.LTosteo.co.uk', "keyCard" = '4037855', "viewingDate" = '2020-12-07 00:00:00'::timestamp, "documentPackDate" = '2020-12-08 00:00:00'::timestamp, "documentReviewDate" = '2020-12-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2020-12-20 00:00:00'::timestamp, "keyGivenDate" = '2020-12-20 00:00:00'::timestamp, "keySentDate" = '2020-12-20 00:00:00'::timestamp, "depositInvoicedDate" = '2020-12-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Laura Tilson') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '135 Grand Avenue', address3 = 'Surbiton', postcode = 'KT5 9HY', skill = 'Osteopath', "referredBy" = 'Website', "accreditationBody" = 'GOC', "accreditationNumber" = '5856', "viewingDate" = '2020-12-08 00:00:00'::timestamp, "documentPackDate" = '2020-12-08 00:00:00'::timestamp, "documentReviewDate" = '2020-12-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2020-12-10 00:00:00'::timestamp, "keyGivenDate" = '2020-12-10 00:00:00'::timestamp, "depositInvoicedDate" = '2020-12-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ismet Rasul') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Whirlowdale', address2 = 'Poplar Grove', address3 = 'Woking', postcode = 'GU22 7SD', skill = 'Psychotherapy', notes = 'https://www.psychotherapy.org.uk/therapist/olga-gelfman-iahkxaak/', "referredBy" = 'UKTR', "accreditationBody" = 'UKCP', "accreditationNumber" = '2011163133', "documentPackDate" = '2022-06-13 00:00:00'::timestamp, "documentReviewDate" = '2022-06-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-06-15 00:00:00'::timestamp, "keyGivenDate" = '2022-06-16 00:00:00'::timestamp, "depositInvoicedDate" = '2022-06-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Olga Gelfman') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Vera Kong') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '75 Hamilton Avenue', address3 = 'Sutton', postcode = 'SM3 9EA', skill = 'Counsellor', notes = 'Room 1 from 5th June from 0900 to 1330 every Saturday', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '110464', "viewingDate" = '2021-03-08 00:00:00'::timestamp, "documentPackDate" = '2021-03-08 00:00:00'::timestamp, "documentReviewDate" = '2021-03-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-03-08 00:00:00'::timestamp, "keyGivenDate" = '2021-03-08 00:00:00'::timestamp, "keySentDate" = '2021-03-08 00:00:00'::timestamp, "depositInvoicedDate" = '2021-03-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mary Chubb') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', notes = 'was active', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Helen Caro') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '18 Arnold Drive', address3 = 'Chessington', postcode = 'KT9 2GD', county = 'Surrey', skill = 'Aesthetics', notes = 'was Pankhania', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '7284310', "viewingDate" = '2021-04-10 00:00:00'::timestamp, "documentPackDate" = '2021-04-10 00:00:00'::timestamp, "documentReviewDate" = '2021-06-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-06-04 00:00:00'::timestamp, "keyGivenDate" = '2021-06-04 00:00:00'::timestamp, "keySentDate" = '2021-06-04 00:00:00'::timestamp, "depositInvoicedDate" = '2021-06-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Neena Ladwa') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '22 Wolsey Close', address3 = 'Worcester Park', postcode = 'KT4 7EF', county = 'Surrey', skill = 'Aesthetics (dentist)', notes = 'Registation: 
https://olr.gdc-uk.org/SearchRegister/SearchResult?Register=All&FirstName=Dvija&FirstNameSoundsLike=False&SurnameSoundsLike=False&IncludeErasedRegistrants=False&RegistrationNumber=258051&SortAscending=True', "referredBy" = 'Other', "accreditationBody" = 'GDC', "accreditationNumber" = '258051', "keyCard" = '8080656', "viewingDate" = '2021-03-28 00:00:00'::timestamp, "documentPackDate" = '2021-03-28 00:00:00'::timestamp, "documentReviewDate" = '2021-04-14 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-04-14 00:00:00'::timestamp, "keyGivenDate" = '2021-04-14 00:00:00'::timestamp, "keySentDate" = '2021-04-14 00:00:00'::timestamp, "depositInvoicedDate" = '2021-04-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Dvija Acharya') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Tricologist' WHERE LOWER(name) = LOWER('Julie Hacket') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '22 The Ridings', address3 = 'Surbiton', postcode = 'KT5 8HQ', skill = 'Clinical Psychologist', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL04277', "viewingDate" = '2025-11-01 00:00:00'::timestamp, "documentPackDate" = '2025-11-01 00:00:00'::timestamp, "documentReviewDate" = '2025-12-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-12-04 00:00:00'::timestamp, "keyGivenDate" = '2025-12-04 00:00:00'::timestamp, "depositInvoicedDate" = '2025-12-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Caroline Urwin') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Swedish massage/Reiki', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Mihaly Andras Bene') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Jane Sharpe') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Spiral Tea Ltd', address1 = '20a Beaufort Road', address3 = 'Kingston upon Thames', postcode = 'KT1 2TQ', skill = 'Reiki', notes = 'Requires SPL', "referredBy" = 'Walk In', "viewingDate" = '2021-04-21 00:00:00'::timestamp, "documentPackDate" = '2021-04-21 00:00:00'::timestamp, "documentReviewDate" = '2021-04-21 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-04-21 00:00:00'::timestamp, "keyGivenDate" = '2021-04-21 00:00:00'::timestamp, "depositInvoicedDate" = '2021-04-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Francesca Raffa') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Ear wax removal', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Sharan Webb') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'The Therapy Home', skill = 'Clinical Psychologist', notes = 'Works With Seb Sutcliffe', "referredBy" = 'UKTR', "viewingDate" = '2023-05-10 00:00:00'::timestamp, "documentPackDate" = '2023-04-30 00:00:00'::timestamp, "documentReviewDate" = '2023-05-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-05-10 00:00:00'::timestamp, "keyGivenDate" = '2023-05-10 00:00:00'::timestamp, "depositInvoicedDate" = '2023-05-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nisha Hickin') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Aesculus Health Ltd', address1 = '84 Lakeside', address2 = 'Eaton Drive', address3 = 'Kingston upon Thames', postcode = 'KT2 7RA', skill = 'Aesthetics', notes = 'Simin''s friend
Parmacist not requiring STL', "referredBy" = 'Friend', "viewingDate" = '2021-05-07 00:00:00'::timestamp, "documentPackDate" = '2021-05-07 00:00:00'::timestamp, "documentReviewDate" = '2021-05-11 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-05-11 00:00:00'::timestamp, "keyGivenDate" = '2021-05-11 00:00:00'::timestamp, "depositInvoicedDate" = '2021-05-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Asmaa Ismail') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '14 St Marys Road', address3 = 'Surbiton', postcode = 'KT6 5EY', skill = 'Child Psychologist', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '379577', "viewingDate" = '2021-05-14 00:00:00'::timestamp, "documentPackDate" = '2021-05-14 00:00:00'::timestamp, "documentReviewDate" = '2021-05-14 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-05-14 00:00:00'::timestamp, "keyGivenDate" = '2021-05-14 00:00:00'::timestamp, "keySentDate" = '2021-05-14 00:00:00'::timestamp, "depositInvoicedDate" = '2021-05-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Helen Taylor') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reflexology', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Alexandra Grant') AND role = 'THERAPIST';
UPDATE "User" SET postcode = 'KT6', skill = 'UKCP' WHERE LOWER(name) = LOWER('Sally Willis') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'BACP' WHERE LOWER(name) = LOWER('Kate Bowler') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Speech Therpaist' WHERE LOWER(name) = LOWER('Julie O''Connor') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'EMDR' WHERE LOWER(name) = LOWER('Christine Pearson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'HCPC' WHERE LOWER(name) = LOWER('Gurpreet Kaur') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'CBT/EMDR' WHERE LOWER(name) = LOWER('Roxane Agnew-Davies') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath' WHERE LOWER(name) = LOWER('Benjamin Brown') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Chiropractic' WHERE LOWER(name) = LOWER('Pernille Larsen') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'BABCP', notes = 'www.couchless.org' WHERE LOWER(name) = LOWER('Luciana Forzisi') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Child and Adolescent Psychotherapist' WHERE LOWER(name) = LOWER('Maria Chiara Barbuscia') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Bereavement  Counsellor', "referredBy" = 'Other' WHERE LOWER(name) = LOWER('Clare Gyde') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 48 Grafham House', address2 = '11 St Johns Road', address3 = 'New Malden', postcode = 'KT3 3FL', skill = 'Dietitian', "referredBy" = 'Website', "accreditationBody" = 'BDA', "accreditationNumber" = '22716', "viewingDate" = '2021-06-17 00:00:00'::timestamp, "documentPackDate" = '2021-06-17 00:00:00'::timestamp, "documentReviewDate" = '2021-06-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-06-17 00:00:00'::timestamp, "keyGivenDate" = '2021-06-17 00:00:00'::timestamp, "keySentDate" = '2021-06-17 00:00:00'::timestamp, "depositInvoicedDate" = '2021-06-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Caroline Bletcher') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Sports Massage', notes = 'needs SL', "viewingDate" = '2021-07-01 00:00:00'::timestamp, "documentPackDate" = '2021-07-01 00:00:00'::timestamp, "documentReviewDate" = '2021-07-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-07-17 00:00:00'::timestamp, "keyGivenDate" = '2021-07-17 00:00:00'::timestamp, "depositInvoicedDate" = '2021-07-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sheldon Lee') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '76 Elmfield Avenue', address3 = 'Teddington', postcode = 'TW11 8BT', skill = 'Relationships, Anxiety, Depression, Addiction and Eating Disorders', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '387928', "clinicTelephone" = '07768 293 218​', "clinicEmail" = 'sam@thamestherapyandwellbeing.co.uk', website = 'www.thamestherapyandwellbeing.co.uk​', "viewingDate" = '2021-07-13 00:00:00'::timestamp, "documentPackDate" = '2021-07-13 00:00:00'::timestamp, "documentReviewDate" = '2021-07-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-09-02 00:00:00'::timestamp, "keyGivenDate" = '2021-09-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sam Bulkeley') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath', notes = 'via Laura Tilson
https://www.osteopathy.org.uk/register-search/registrants/?location=&radius=5&surname=eastwood&registration=', "referredBy" = 'Friend', "accreditationBody" = 'GOC', "accreditationNumber" = '3594', "viewingDate" = '2021-08-18 00:00:00'::timestamp, "documentReviewDate" = '2021-07-12 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-08-20 00:00:00'::timestamp, "keyGivenDate" = '2021-08-20 00:00:00'::timestamp, "depositInvoicedDate" = '2021-08-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Karen Eastwood') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '94A Thorkhill Road', address3 = 'Thames Ditton', postcode = 'KT7 0UQ', county = 'Surrey', skill = 'Psychotherapy', notes = 'KD sent 02/10/2021
Key received back 23/06/2022
Gone to Portsmouth', "referredBy" = 'Other', "accreditationBody" = 'BACP', "accreditationNumber" = '387990', "viewingDate" = '2021-07-26 00:00:00'::timestamp, "documentPackDate" = '2021-07-27 00:00:00'::timestamp, "documentReviewDate" = '2021-08-06 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-08-25 00:00:00'::timestamp, "keyGivenDate" = '2021-09-28 00:00:00'::timestamp, "depositInvoicedDate" = '2021-10-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sarah Williams') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor & Psychotherapist' WHERE LOWER(name) = LOWER('Dave Davidson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Gestalt psychotherapist', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Julie Nathanson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Clinical Psychologist', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Kate Robinson') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '41 Swansmere Close', address3 = 'Walton-on-Thames', postcode = 'KT12 3FD', skill = 'Aesthetics', notes = 'Margaretha Lee Anne Van Aswegen', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "viewingDate" = '2021-09-14 00:00:00'::timestamp, "documentPackDate" = '2021-09-15 00:00:00'::timestamp, "documentReviewDate" = '2021-09-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-01 00:00:00'::timestamp, "keyGivenDate" = '2021-10-02 00:00:00'::timestamp, "depositInvoicedDate" = '2021-10-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lee-Anne van Aswegen') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Cognative Behavioural Coach', notes = 'V', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Melanie Sheehan') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '37b St James Road', address3 = 'Surbiton', postcode = 'KT6 4QL', skill = 'Counsellor', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '387940', "viewingDate" = '2021-09-06 00:00:00'::timestamp, "documentPackDate" = '2021-09-06 00:00:00'::timestamp, "documentReviewDate" = '2021-09-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-04 00:00:00'::timestamp, "keyGivenDate" = '2022-02-03 00:00:00'::timestamp, "keySentDate" = '2022-02-03 00:00:00'::timestamp, "depositInvoicedDate" = '2022-04-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Clair Martin') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '15 Sycamore Court', address2 = 'Penners Gardens', address3 = 'Surbiton', postcode = 'KT6 6LG', skill = 'Reflexology and Massage', notes = 'friend of Simin
VD
requires SP

key deposite repaid 23/09/2025', "referredBy" = 'Friend', "accreditationBody" = 'FHT', "accreditationNumber" = '143117', "viewingDate" = '2025-05-15 00:00:00'::timestamp, "documentPackDate" = '2021-09-15 00:00:00'::timestamp, "documentReviewDate" = '2025-05-25 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-05-25 00:00:00'::timestamp, "keyGivenDate" = '2025-05-26 00:00:00'::timestamp, "depositInvoicedDate" = '2025-05-26 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Zorana Nisic') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '8 Falconhurst', address2 = 'The Crescent', address3 = 'Surbiton', postcode = 'KT6 4BP', skill = 'Counsellor & Psychotherapist', notes = 'VDRK', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '00948794', "viewingDate" = '2021-07-31 00:00:00'::timestamp, "documentPackDate" = '2021-08-01 00:00:00'::timestamp, "documentReviewDate" = '2021-08-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-08-23 00:00:00'::timestamp, "keyGivenDate" = '2021-08-23 00:00:00'::timestamp, "keySentDate" = '2021-08-23 00:00:00'::timestamp, "depositInvoicedDate" = '2021-08-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Emily Knivett') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '13 Minchin Close', address3 = 'Leatherhead', postcode = 'KT22 8BH', skill = 'Counsellor & Psychotherapist', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '387920', "viewingDate" = '2021-09-01 00:00:00'::timestamp, "documentPackDate" = '2021-09-01 00:00:00'::timestamp, "documentReviewDate" = '2021-09-02 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-09-02 00:00:00'::timestamp, "keyGivenDate" = '2021-09-02 00:00:00'::timestamp, "keySentDate" = '2021-09-02 00:00:00'::timestamp, "depositInvoicedDate" = '2021-09-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nikki King') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Sports Massage', notes = 'VDRS', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Hilary Insall') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 6', address2 = '12 St Phillips Road', address3 = 'Surbiton', postcode = 'KT6 4DX', skill = 'Integrative counsellor and psychotherapist', notes = 'VDRS', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '00853297', "clinicTelephone" = '07393 706 699', "clinicEmail" = 'counsellingforchildren@hotmail.com     (services for children)
blueseacounselling@hotmail.com   (services for adults)', "viewingDate" = '2021-09-18 00:00:00'::timestamp, "documentPackDate" = '2021-09-18 00:00:00'::timestamp, "documentReviewDate" = '2021-10-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-09-27 00:00:00'::timestamp, "keyGivenDate" = '2021-09-30 00:00:00'::timestamp, "depositInvoicedDate" = '2021-10-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Dana Wester') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '7 Kingsmead Avenue', address3 = 'Surbiton', postcode = 'KT6 7PP', skill = 'CBT and Behavioural Therapy', notes = 'VDRSK
https://www.nmc.org.uk/registration/search-the-register/
Nicola Stephany Ryan', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "clinicTelephone" = '07866 388 935', "clinicEmail" = 'nicolaryan568@gmail.com', website = 'www.nicolaryan.net', "viewingDate" = '2021-09-30 00:00:00'::timestamp, "documentPackDate" = '2021-09-30 00:00:00'::timestamp, "documentReviewDate" = '2021-09-30 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-09-30 00:00:00'::timestamp, "keyGivenDate" = '2021-09-27 00:00:00'::timestamp, "keySentDate" = '2021-09-27 00:00:00'::timestamp, "depositInvoicedDate" = '2021-09-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nicola Ryan') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '36 Breamwater Gardens', address3 = 'Richmond', postcode = 'TW10 7SQ', skill = 'Consultant Child and Adolescent Psychiatrist', notes = 'VDRSK
Nicola Ryan

surreyhealthcare@gmail.com', "referredBy" = 'Friend', "accreditationBody" = 'GMC', "accreditationNumber" = '6062254', "clinicEmail" = 'surreyhealthcare@gmail.com', website = 'https://www.healthcareclinic.org.uk/', "viewingDate" = '2021-10-05 00:00:00'::timestamp, "documentPackDate" = '2021-10-05 00:00:00'::timestamp, "documentReviewDate" = '2021-10-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-05 00:00:00'::timestamp, "keyGivenDate" = '2021-10-05 00:00:00'::timestamp, "depositInvoicedDate" = '2021-10-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mehdi Mirkhani') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Microblading', notes = 'X', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Ana Maria Acostandei') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '46 Westcroft Gardens', address3 = 'Morden', postcode = 'SM4 4DL', skill = 'CBT and EMDR Therapsit', "referredBy" = 'Friend', "keyGivenDate" = '2021-10-06 00:00:00'::timestamp, "keySentDate" = '2021-10-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nataliya Khromey') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Managing Director', "documentPackDate" = '2021-10-11 00:00:00'::timestamp, "keyGivenDate" = '2021-10-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Peter Strong') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'SPMU Artist', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Shauna Wilson') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Olivia Shaw Acupuncture Limited', address1 = '69 York Road', address3 = 'Teddington', postcode = 'TW11 8SL', skill = 'Acupuncturist', notes = 'personal mobile 07914 852 435

professional accreditation with the Register of Chinese Herbal Medicine
https://rchm.co.uk/find-a-practitioner/profile/1198. 
membership number MRCHM-2012-1198. .

Olivia Shaw Acupuncture Limited
Registered as a company in England and Wales
Company number 9019001
Registered office: 
8 Paragon Court
129 Holders Hill Road, 
London NW4 1LH
United Kingdom', "referredBy" = 'UKTR', "accreditationBody" = 'RCHM', "accreditationNumber" = 'MRCHM-2012-1198', website = 'www.oliviashawacupuncture.co.uk', "viewingDate" = '2021-10-07 00:00:00'::timestamp, "documentPackDate" = '2021-10-13 00:00:00'::timestamp, "documentReviewDate" = '2021-10-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-13 00:00:00'::timestamp, "keyGivenDate" = '2021-11-15 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Olivia Shaw') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist specialising in Women’s Health', notes = 'Hi I wondered if there was availability for one of your therapy rooms with a plinth and whether I could arrange a time to come and have a look at it please?', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Claire Rutherford') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Child and Adult Psychotherapist', notes = 'I am interested in running my private practice out of another space. I am a Child and Adult Psychotherapist who currently works in the NHS and a Boarding school in Surrey.', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Sarah Friggieri') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Hello I am interested in your room rental

PAS sent her STL info 08/10/2021', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Chrissie Lancaster') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'True Hearing Ltd', skill = 'Audiologist', notes = 'Invoice to First Health <jason.levy@hearingfirst.co.uk> 07513 014 004', website = 'www.earwaxremoval.net/book', "viewingDate" = '2021-10-12 00:00:00'::timestamp, "documentPackDate" = '2021-10-12 00:00:00'::timestamp, "documentReviewDate" = '2021-10-12 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-12 00:00:00'::timestamp, "keyGivenDate" = '2021-10-12 00:00:00'::timestamp, "depositInvoicedDate" = '2021-10-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Elena Magnavacca') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'counsellor in training with ECS', "referredBy" = 'Website', "documentPackDate" = '2021-10-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Olga Vysotska') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '4 Springfield Road', address3 = 'Walton-on-Thames', postcode = 'KT1 2SA', skill = 'Integrative Counsellor', "referredBy" = 'Walk In', "accreditationBody" = 'BACP', "accreditationNumber" = '00899677', "viewingDate" = '2021-10-20 00:00:00'::timestamp, "documentPackDate" = '2021-10-20 00:00:00'::timestamp, "documentReviewDate" = '2021-10-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-10-26 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Liz Goldspink') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '4 Woodhall House', address2 = 'Fitzhugh Grove', address3 = 'London', postcode = 'SW18 3SA', skill = 'Osteopath', notes = 'Billed through Laura Tilson', "accreditationBody" = 'GOSC', "accreditationNumber" = '9880', "documentPackDate" = '2021-10-28 00:00:00'::timestamp, "documentReviewDate" = '2021-12-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Chiara Berton') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Hypnotherapist', "viewingDate" = '2021-11-08 00:00:00'::timestamp, "documentPackDate" = '2021-11-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jade Cotterell') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'PCR testing', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('James Davidson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counselling', "referredBy" = 'Website', "documentPackDate" = '2021-12-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('India Sunderland') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', notes = 'Accresdiation: https://olr.gdc-uk.org/SearchRegister/SearchResult?Register=All&FirstName=foroogh&FirstNameSoundsLike=False&Surname=Aref&SurnameSoundsLike=False&IncludeErasedRegistrants=False&RegistrationNumber=282600&SortAscending=True', "accreditationNumber" = '282600', "viewingDate" = '2021-12-06 00:00:00'::timestamp, "documentPackDate" = '2021-12-07 00:00:00'::timestamp, "documentReviewDate" = '2021-12-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2021-12-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Foroogh Aref') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapy and sports massage', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Shaneen Sia') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Child Psychotherapist' WHERE LOWER(name) = LOWER('Ayaz Akhtar') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reiki', notes = 'replied 03/01/2022 re STL requirements', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Sinem Ahmet') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Rehabplus Limited', skill = 'Physiotherapist', notes = 'Amina - office@rehabplus.co.uk
Richard Jackson -  Chief Development Officer - richard@rehabplus.co.uk
Chris Bartlett - chris.bartlett@rehabplus.co.uk - CEO
Sven Ehlers - sven@rehabplus.co.uk - Clinic Management
Fiona Hiron - fiona@rehabplus.co.uk - Accounts

Shivangi Pathak
shivangi@championhealthplus.co.uk

01329 755 755

ceased Jan 2025', "accreditationBody" = 'CSP', "accreditationNumber" = '113031', "viewingDate" = '2022-03-15 00:00:00'::timestamp, "documentPackDate" = '2022-03-17 00:00:00'::timestamp, "documentReviewDate" = '2022-03-01 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-03-20 00:00:00'::timestamp, "keyGivenDate" = '2022-03-20 00:00:00'::timestamp, "keySentDate" = '2022-03-20 00:00:00'::timestamp, "depositInvoicedDate" = '2022-04-23 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Amina Majeed') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Holistic massage therapist', "referredBy" = 'Website', "documentPackDate" = '2022-02-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lilly Edward') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '150a Leatherhead Road', address3 = 'Chessington', postcode = 'KT9 2HU', skill = 'Aesthetics', notes = 'Phlebotomist
deposit returned 26/05/23', "referredBy" = 'UKTR', "viewingDate" = '2022-01-27 00:00:00'::timestamp, "documentPackDate" = '2022-02-01 00:00:00'::timestamp, "documentReviewDate" = '2022-02-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-02-08 00:00:00'::timestamp, "keyGivenDate" = '2022-02-10 00:00:00'::timestamp, "keySentDate" = '2022-02-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Peggy Vozaiti') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics' WHERE LOWER(name) = LOWER('Suzanne Martin') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician' WHERE LOWER(name) = LOWER('Paula O''Sullivan') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '14 Sanger Avenue', address3 = 'Chessington', postcode = 'KT9 1BX', notes = '07976 017 659

25/11/2022 let to private room
key returned 30/11/22', "accreditationBody" = 'BACP', "accreditationNumber" = '387904', "viewingDate" = '2022-03-04 00:00:00'::timestamp, "documentPackDate" = '2022-03-04 00:00:00'::timestamp, "documentReviewDate" = '2022-03-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-03-05 00:00:00'::timestamp, "keyGivenDate" = '2022-03-09 00:00:00'::timestamp, "depositInvoicedDate" = '2022-03-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nicola Hambley') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '12 South Terrace', address3 = 'Surbiton', postcode = 'KT6 6HT', county = 'Surrey', skill = 'aromatherapist/massage therapist', notes = 'https://www.fht.org.uk/users/willis216187
deposit not invoiced', "accreditationBody" = 'FHT', "accreditationNumber" = '216187', "viewingDate" = '2022-03-17 00:00:00'::timestamp, "documentPackDate" = '2022-03-21 00:00:00'::timestamp, "documentReviewDate" = '2022-03-25 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-03-25 00:00:00'::timestamp, "keyGivenDate" = '2023-01-03 00:00:00'::timestamp, "keySentDate" = '2023-01-03 00:00:00'::timestamp, "depositInvoicedDate" = '1999-01-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ines Willis') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '18 Sheridan Road', address3 = 'Camberley', postcode = 'GU16 7DX', skill = 'Osteopath', notes = 'initially it will be on an hourly/ session basis, with the intention to expand and block book several days a week. I am looking for Mon afternoon/evenings and Wednesday availability atm. Please let me know if your room is available and if we can view the room.ThanksRebecca Reddy', "referredBy" = 'UKTR', "accreditationBody" = 'GOC', "accreditationNumber" = '10377', "documentPackDate" = '2022-04-20 00:00:00'::timestamp, "documentReviewDate" = '2022-05-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-05-17 00:00:00'::timestamp, "keyGivenDate" = '2022-05-17 00:00:00'::timestamp, "keySentDate" = '2022-05-17 00:00:00'::timestamp, "depositInvoicedDate" = '2022-05-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rebecca Reddy') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Briar') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '3a High St', address3 = 'Esher', postcode = 'KT10 9RL', skill = 'Counsellor', notes = '07578 469 390 (work)', "referredBy" = 'Website', "accreditationBody" = 'BACP', "viewingDate" = '2022-04-07 00:00:00'::timestamp, "documentPackDate" = '2022-04-08 00:00:00'::timestamp, "documentReviewDate" = '2022-04-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-04-19 00:00:00'::timestamp, "keyGivenDate" = '2022-04-21 00:00:00'::timestamp, "keySentDate" = '2022-04-21 00:00:00'::timestamp, "depositInvoicedDate" = '2022-04-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Madeleine Narciso') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '60 Alexandra Drive', address3 = 'Surbiton', postcode = 'KT5 9AF', skill = 'Hand Therapist', notes = 'British Association of Occupational Therapists
https://www.hcpc-uk.org/check-the-register/register-results/?query=gwynne&profession=OT', "accreditationBody" = 'HCPC', "accreditationNumber" = 'OT59471', "viewingDate" = '2022-04-14 00:00:00'::timestamp, "documentPackDate" = '2022-04-15 00:00:00'::timestamp, "documentReviewDate" = '2022-04-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-04-19 00:00:00'::timestamp, "keyGivenDate" = '2022-05-06 00:00:00'::timestamp, "keySentDate" = '2022-05-06 00:00:00'::timestamp, "depositInvoicedDate" = '2022-05-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Liz Gwynne') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '24 Newlands Avenue', address3 = 'Thames Ditton', postcode = 'KT7 0HF', skill = 'Nutritionist', notes = 'I qualified as a Registered Nutritional Therapist almost 5yrs ago and support (but not exclusively) women and teens with gut/digestive issues and hormone balance throughout the life stages. I am a certified health coach and am working toward being an accredited EFT practitioner. I have undertaken some functional medicine training with The IFM. My background is I worked as an NHS nurse for many years prior to training to become a naturopathic nutritionist.', "referredBy" = 'UKTR', "accreditationBody" = 'CNHC', "accreditationNumber" = 'CNHC04797', "viewingDate" = '2022-04-28 00:00:00'::timestamp, "documentPackDate" = '2022-04-29 00:00:00'::timestamp, "documentReviewDate" = '2022-06-03 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-05-30 00:00:00'::timestamp, "keyGivenDate" = '2022-06-06 00:00:00'::timestamp, "keySentDate" = '2022-06-06 00:00:00'::timestamp, "depositInvoicedDate" = '2022-06-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Juliet Goodwin') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '7 Jillian Court', address2 = 'Adelaide Road', address3 = 'Surbiton', postcode = 'KT6 4SY', skill = 'Reiki and Counselliing', notes = 'I am interested in having a look at your therapy rooms, do you still offer rooms at the moment? I am both a talk therapist and an energy healer who might need a massage bed for body therapy.

Name change May 2025', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '380936', "viewingDate" = '2022-05-05 00:00:00'::timestamp, "documentPackDate" = '2022-05-05 00:00:00'::timestamp, "documentReviewDate" = '2022-05-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-05-10 00:00:00'::timestamp, "keyGivenDate" = '2022-05-10 00:00:00'::timestamp, "keySentDate" = '2022-05-10 00:00:00'::timestamp, "depositInvoicedDate" = '2022-05-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jada Xinyi Wang') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Cognivate Rehab Limited', address1 = 'Unit 18 & 19 Dean House Farm,', address2 = 'Church Lane', address3 = 'Newdigate', postcode = 'RH5 5DL', county = 'Surrey', notes = 'Hi, I was wondering if you could provide any pricing and availability for these rooms? We have a client where we will likely need a one of session of about 2-3 hours to begin with, and then potentially subsequent sessions.

Alison Hipkiss', "referredBy" = 'UKTR', "documentPackDate" = '2022-05-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Eve Powell') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '82 South Park Road', address3 = 'London', postcode = 'SW19 8SZ', skill = 'Acupuncturist', "referredBy" = 'Website', "accreditationBody" = 'BAF', "accreditationNumber" = '3074', "keyCard" = '8102773', "viewingDate" = '2022-05-09 00:00:00'::timestamp, "documentPackDate" = '2022-05-09 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-05-09 00:00:00'::timestamp, "keyGivenDate" = '2022-05-10 00:00:00'::timestamp, "keySentDate" = '2022-05-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Amy Moore') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'am interested in finding out about booking and availability and how it works for a room suitable for counselling, possibly from August and would be grateful for any further information.', "referredBy" = 'Website', "viewingDate" = '2022-05-19 00:00:00'::timestamp, "documentPackDate" = '2022-05-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Anna Bramley') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '11 Harvest Lane', address3 = 'Thames Ditton', postcode = 'KT7 0NG', county = 'Surrey', skill = 'Medical Aesthetics', notes = '11 Harvest Lane', "accreditationBody" = 'GMC', "accreditationNumber" = '7450887', "documentPackDate" = '2023-03-01 00:00:00'::timestamp, "documentReviewDate" = '2023-03-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-03-07 00:00:00'::timestamp, "keyGivenDate" = '2023-03-09 00:00:00'::timestamp, "depositInvoicedDate" = '2023-03-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rajdeep Dhillon') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '11a Upper Brighton Road', address3 = 'Surbiton', postcode = 'KT6 6LQ', skill = 'Counselling and psychotherapy', notes = 'Personal email/phone:
lvshum@gmail.com

work email
lai.counsellor@gmail.com

client number
07305 934 888', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '393767', "viewingDate" = '2022-05-25 00:00:00'::timestamp, "documentPackDate" = '2022-05-25 00:00:00'::timestamp, "documentReviewDate" = '2022-11-01 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-11-01 00:00:00'::timestamp, "keyGivenDate" = '2022-11-22 00:00:00'::timestamp, "keySentDate" = '2022-11-22 00:00:00'::timestamp, "depositInvoicedDate" = '2022-11-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lai Shum') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', notes = 'rejcted 17/06/22 - low Indenity Insurance and no Professional body', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Millie Bridger') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '67 Poplar Grove', address3 = 'New Malden', postcode = 'KT3 3DN', skill = 'Aesthetician', notes = 'Hi there, myself and my colleague are looking for a space to do aesthetics treatments. Look forward to hearing from you AKA McArdle

https://www.hcpc-uk.org/check-the-register/register-results/?query=chaggar&profession=ODP', "referredBy" = 'UKTR', "accreditationBody" = 'HCPC', "accreditationNumber" = 'ODP34731', "viewingDate" = '2022-06-24 00:00:00'::timestamp, "documentPackDate" = '2022-06-24 00:00:00'::timestamp, "documentReviewDate" = '2022-08-21 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-08-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sharon Chaggar') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', notes = 'Hi,I’m an aesthetic nurse practitioner based in Kent. I have several clients in Surrey who want me to treat them. I’m looking to hire a space maybe one Saturday or Sunday per month (to begin with) Would this be available? Thanks' WHERE LOWER(name) = LOWER('Carrie Cropper') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage therapist', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Leire Baigorri') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '9 Dover Road', address3 = 'Tadworth', postcode = 'KT20 5FN', skill = 'Aesthetician', notes = 'Friend of Chaggar
Zaneta Zbierska Walicka
https://www.nmc.org.uk/search-the-register/

keys to SWIM and SURB', "referredBy" = 'Website', "accreditationBody" = 'nmc', "keyCard" = '0000741070', "viewingDate" = '2022-06-24 00:00:00'::timestamp, "documentPackDate" = '2022-06-24 00:00:00'::timestamp, "documentReviewDate" = '2022-08-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-08-20 00:00:00'::timestamp, "keyGivenDate" = '2022-09-22 00:00:00'::timestamp, "keySentDate" = '2022-09-22 00:00:00'::timestamp, "depositInvoicedDate" = '2022-09-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Zaneta Zbierska') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 2', address2 = '8 St Philips Road', address3 = 'Surbiton', postcode = 'KT6 4DX', skill = 'Clinical Psychologist, CBT. Young people and adults', notes = 'clinical psychologist and psychoanalytic psychotherapist registered with the HCPC, UKCP, BPS, BABCP, BACP, IPT. I would be interested to hire a therapy room for ad hoc hour. 
Evenings and weekends availability.

For your information, I have professional insurance with Balens. Thanks', "referredBy" = 'Website', "accreditationBody" = 'BABCP', "accreditationNumber" = '00000998449', "viewingDate" = '2022-07-05 00:00:00'::timestamp, "documentPackDate" = '2022-07-05 00:00:00'::timestamp, "documentReviewDate" = '2022-07-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-07-27 00:00:00'::timestamp, "keyGivenDate" = '2022-07-28 00:00:00'::timestamp, "keySentDate" = '2022-07-28 00:00:00'::timestamp, "depositInvoicedDate" = '2022-07-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Grazia Zovanni') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '1 Hazelway Close', address3 = 'Leatherhead', postcode = 'KT22 9QE', county = 'Surrey', skill = 'Aesthetician  1, Hazelway Close, Leatherhead, Surrey, KT22 9QE', notes = 'Looking for a room to rent for my aesthetics practice. which I''m launching this summer. I''m also studying for my Level 7 in aesthetics to add another layer of safety and credibility to my practice

NMC registered. I currently work as a sister in paediatric A&E

GROOVE AESTHETICS & BEAUTY LTD
https://www.nmc.org.uk/registration/search-the-register/

Don-Carolis', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "viewingDate" = '2022-07-14 00:00:00'::timestamp, "documentPackDate" = '2023-06-29 00:00:00'::timestamp, "documentReviewDate" = '2023-07-24 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-07-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lydia Ashton') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '195A Surbiton Hill Park', address3 = 'Surbiton', postcode = 'KT5 8EL', skill = 'Clinical Psychologist', notes = 'https://www.hcpc-uk.org/check-the-register/professional-registration-detail/?query=PYL31200&profession=PYL', "referredBy" = 'UKTR', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL31200', "documentPackDate" = '2022-08-08 00:00:00'::timestamp, "documentReviewDate" = '2022-08-11 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-08-11 00:00:00'::timestamp, "keyGivenDate" = '2022-08-11 00:00:00'::timestamp, "keySentDate" = '2022-08-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sarah Beaumont') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '1 Aukland Road', address3 = 'Kingston-upon-Thames', postcode = 'KT1 3BG', skill = 'CBT and EMDR', "referredBy" = 'Website', "accreditationBody" = 'BABCP', "accreditationNumber" = '160477', "viewingDate" = '2022-08-25 00:00:00'::timestamp, "documentPackDate" = '2022-08-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-08-31 00:00:00'::timestamp, "keyGivenDate" = '2022-09-03 00:00:00'::timestamp, "keySentDate" = '2022-09-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Caroline Harrison') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'body & face therapist', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Keiri Patu') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Manor Lodge', address2 = 'Portsmouth Road,', address3 = 'Thames Ditton', postcode = 'KT7 0EG', skill = 'counsellor and psychotherapist', notes = 'emmafurr@blueyonder.co.uk
new key 19/06/2024', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '00113938', "viewingDate" = '2023-06-01 00:00:00'::timestamp, "documentPackDate" = '2023-05-06 00:00:00'::timestamp, "documentReviewDate" = '2023-05-31 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-05-31 00:00:00'::timestamp, "keyGivenDate" = '2024-06-19 00:00:00'::timestamp, "depositInvoicedDate" = '2024-06-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Emma Furr') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Laura Tilson Osteopathy', skill = 'Osteopath', notes = 'Gaby White <gabyeilon@gmail.com>', "keyCard" = '432020', "keyGivenDate" = '2024-04-24 00:00:00'::timestamp, "depositInvoicedDate" = '2024-04-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Gaby White') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '3 Dolphin Court', address2 = 'Dolphin Close', address3 = 'Surbiton', postcode = 'KT6 4DZ', skill = 'Holistic Massage Therapist', notes = 'registering with FHT so will be exempt from ST licence
https://www.fht.org.uk/users/amistri

anjanamistri@gmail.com', "referredBy" = 'Website', "accreditationBody" = 'FHT', "accreditationNumber" = '217047', "viewingDate" = '2022-09-22 00:00:00'::timestamp, "documentPackDate" = '2022-09-22 00:00:00'::timestamp, "documentReviewDate" = '2022-10-11 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-10-18 00:00:00'::timestamp, "keyGivenDate" = '2022-10-19 00:00:00'::timestamp, "keySentDate" = '2022-10-19 00:00:00'::timestamp, "depositInvoicedDate" = '2022-10-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Anjana Mistri') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 7', address2 = '14 Avenue Elmers', address3 = 'Surbiton', postcode = 'KT6 4SF', county = 'Surrey', skill = 'Psychotherapist', notes = 'I am a psychotherapist working with individuals and couples. I moved from Istanbul/Turkey to Surbiton two months ago. I am working fully online right now. But I am looking for a room where I can also do face to face psychotherapy sessions with my prospective clients.I came across your website while researching on the internet. I would be glad if you could help me with this. You can find my resume on my personal website: www.mirayevci.com', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '00990892', "viewingDate" = '2022-10-10 00:00:00'::timestamp, "documentPackDate" = '2022-10-11 00:00:00'::timestamp, "documentReviewDate" = '2022-12-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-12-20 00:00:00'::timestamp, "keyGivenDate" = '2023-01-04 00:00:00'::timestamp, "keySentDate" = '2023-01-04 00:00:00'::timestamp, "depositInvoicedDate" = '2023-01-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Miray Evci') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 4, Albany House', address2 = 'Lovelace Road', address3 = 'Surbiton', postcode = 'KT6 6JP', skill = 'CBT', notes = 'I was hoping to get a little more information of how booking a room works and to enquire about registering with yourselves. I currently have a busy online practice, but wish to start offering face to face for new clients', "referredBy" = 'Website', "accreditationBody" = 'UKCP', "accreditationNumber" = '2011169290', "viewingDate" = '2023-02-22 00:00:00'::timestamp, "documentPackDate" = '2023-02-22 00:00:00'::timestamp, "documentReviewDate" = '2023-02-23 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-02-23 00:00:00'::timestamp, "keyGivenDate" = '2023-02-28 00:00:00'::timestamp, "depositInvoicedDate" = '2023-03-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Suzi Loxton') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '13 Dudley Grove', address3 = 'Epsom', postcode = 'KT18 7NB', skill = 'Nutritional Therapist', "referredBy" = 'Website', "accreditationBody" = 'BANT', "accreditationNumber" = 'CLA1003356', "viewingDate" = '2022-10-17 00:00:00'::timestamp, "documentPackDate" = '2022-10-17 00:00:00'::timestamp, "documentReviewDate" = '2022-10-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-10-27 00:00:00'::timestamp, "keyGivenDate" = '2022-11-08 00:00:00'::timestamp, "keySentDate" = '2022-11-08 00:00:00'::timestamp, "depositInvoicedDate" = '2022-11-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Leanne Clary') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', notes = 'I am looking to expand my private practice. Do you have a room suitable for counselling available on a Monday evening

offreed to show SW', "referredBy" = 'UKTR', "accreditationBody" = 'BACP' WHERE LOWER(name) = LOWER('Chiedza Mugomba') AND role = 'THERAPIST';
UPDATE "User" SET "referredBy" = 'Friend', "viewingDate" = '2022-10-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Greta Trentin') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '117 Compton Crescent', address3 = 'Chessington', postcode = 'KT9 2HG', county = 'Surrey', skill = 'Integrative Therapist & Counsellor', notes = 'talking therapy room for use with clients. Can I just check what the earliest slot is? I would be looking to book around 7-9am

Natasha-Rae Adams <admin@natasharaeadamstherapy.com>

117, Compton Crescent, Chessington, Surrey, KT9 2HG', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '393555', "viewingDate" = '2022-10-31 00:00:00'::timestamp, "documentPackDate" = '2022-11-02 00:00:00'::timestamp, "documentReviewDate" = '2023-01-16 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-01-16 00:00:00'::timestamp, "keyGivenDate" = '2023-01-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Natasha Adams') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '20 Ely Close', address3 = 'New Malden', postcode = 'KT3 4LG', county = 'Surrey', skill = 'Acupuncturist', notes = 'Friend of Amy Moore - intersted in SW', "referredBy" = 'Friend', "accreditationBody" = 'BAC', "accreditationNumber" = '960935', "keyCard" = '0000678727', "viewingDate" = '2025-04-08 00:00:00'::timestamp, "documentPackDate" = '2025-04-28 00:00:00'::timestamp, "documentReviewDate" = '2025-04-30 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-04-30 00:00:00'::timestamp, "keyGivenDate" = '2025-04-30 00:00:00'::timestamp, "depositInvoicedDate" = '2025-04-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Joanna Nuttall') AND role = 'THERAPIST';
UPDATE "User" SET postcode = 'KT6 5EY', skill = 'Counsellor', notes = 'I qualified as a counsellor in August and am beginning the process of setting up private practice. Ideally I am looking to start with two days a week, working in 4 hour blocks. Wednesday 5pm- 9pm and Friday 2pm-6pm.', "referredBy" = 'UKTR', "viewingDate" = '2022-11-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Stephanie Taylor') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '24A Parkwood Avenue', address3 = 'Esher', postcode = 'KT10 8DG', skill = 'Counselling Psychologist', notes = 'accredited with HCPC (Health and Care Professions Council) and BPS (British Psychological association).

https://www.hcpc-uk.org/check-the-register/professional-registration-detail/?query=PYL18339', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL18339', "viewingDate" = '2022-11-21 00:00:00'::timestamp, "documentPackDate" = '2022-11-21 00:00:00'::timestamp, "documentReviewDate" = '2022-11-25 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2022-11-25 00:00:00'::timestamp, "keyGivenDate" = '2022-12-11 00:00:00'::timestamp, "keySentDate" = '2022-12-11 00:00:00'::timestamp, "depositInvoicedDate" = '2022-12-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sohila Sayma') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'wqe', skill = 'Dramatherapist 
HCPC Reg.', notes = 'I’d be eager to hear of any upcoming developments regarding therapy spaces in the SW London area so please feel free to add me to your email list and update me where appropriate.' WHERE LOWER(name) = LOWER('Toby Cooper') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 56', address2 = 'Ascot House', address3 = 'Staines-Upon-Thames', postcode = 'TW18 4QZ', skill = 'Autism Asessments', notes = 'Medhi''s referral', "referredBy" = 'Friend', "viewingDate" = '2022-12-12 00:00:00'::timestamp, "documentPackDate" = '2022-12-13 00:00:00'::timestamp, "documentReviewDate" = '2023-01-03 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-01-03 00:00:00'::timestamp, "keyGivenDate" = '2023-01-03 00:00:00'::timestamp, "keySentDate" = '2023-01-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Will Barker') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Laura Tilson Osteopathy', address1 = 'Flat 19 College House', address2 = '52 Putney Hill', address3 = 'London', postcode = 'SW15 6BF', skill = 'Osteopath', notes = 'Works for Laura Tilson', "referredBy" = 'Friend', "accreditationBody" = 'GOC', "accreditationNumber" = '10114', "keyCard" = '408742', "documentPackDate" = '2024-03-16 00:00:00'::timestamp, "documentReviewDate" = '2023-01-16 00:00:00'::timestamp, "keyGivenDate" = '2023-01-03 00:00:00'::timestamp, "keySentDate" = '2023-01-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Madeleine Kibbel') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reiki' WHERE LOWER(name) = LOWER('Sarah Ashe') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 31 Harrier House', address2 = '5 Antoinette Close', address3 = 'Kingston Upon Thames', postcode = 'KT1 2FJ', county = 'Surrey', skill = 'Physiotherapist', notes = ',', "referredBy" = 'UKTR', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PH109779', "viewingDate" = '2023-01-30 00:00:00'::timestamp, "documentPackDate" = '2023-01-30 00:00:00'::timestamp, "documentReviewDate" = '2023-02-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-02-19 00:00:00'::timestamp, "keyGivenDate" = '2023-03-01 00:00:00'::timestamp, "depositInvoicedDate" = '2023-03-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Hollie Maskell') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '11 Padley Close', address3 = 'Chessington', postcode = 'KT9 2BA', county = 'Surrey', skill = 'Complementary health therapist', "referredBy" = 'Website', "accreditationBody" = 'CThA', "accreditationNumber" = 'G4383', "documentPackDate" = '2023-01-30 00:00:00'::timestamp, "documentReviewDate" = '2023-03-02 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-03-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Helen Martin') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '7 Alfred Road', address3 = 'Kingston Upon Thames', postcode = 'KT1 2UA', skill = 'Psychotherapist', notes = 'enquiring about your room availability & how I book rooms on an ad hoc basis.

kellyb1980@hotmail.com', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '392813', "viewingDate" = '2023-03-06 00:00:00'::timestamp, "documentPackDate" = '2023-03-06 00:00:00'::timestamp, "documentReviewDate" = '2023-03-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-03-07 00:00:00'::timestamp, "keyGivenDate" = '2023-03-09 00:00:00'::timestamp, "depositInvoicedDate" = '2023-03-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Kelly Brown') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', notes = 'I am interested in your room rental.
I am an aesthetic practitioner specialising in cosmetic dermatology.
Please can we arrange a room viewing.', "viewingDate" = '2023-03-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ashleigh Poulsen') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'True Hearing Limited', address1 = '103 High Street', address3 = 'Waltham Cross', postcode = 'EN8 7AN', notes = '103 High Street, Waltham Cross, England, EN8 7AN', "keyGivenDate" = '2023-03-31 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jason Levy') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '111 Douglas Road', address3 = 'Esher', postcode = 'KT10 8BG', county = 'Surrey', skill = 'CBT', "accreditationBody" = 'BABCP', "accreditationNumber" = '00001000566', "viewingDate" = '2023-04-05 00:00:00'::timestamp, "documentPackDate" = '2023-04-18 00:00:00'::timestamp, "documentReviewDate" = '2023-04-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-04-27 00:00:00'::timestamp, "keyGivenDate" = '2023-04-27 00:00:00'::timestamp, "keySentDate" = '2023-04-27 00:00:00'::timestamp, "depositInvoicedDate" = '2023-04-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Tatiana Montibeller') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reflexology', notes = 'I''ve been practising reflexology since 1997 and have a special interest in women''s health - particularly offering reflexology for natural fertility, IVF support and pregnancy' WHERE LOWER(name) = LOWER('Lyn Franklin') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 2 Ground Floor', address2 = '38 St Andrew''s Square', address3 = 'Surbiton', postcode = 'KT6 4EG', skill = 'health and fitness coach', notes = 'Mahsa Aghdam
boyfriend travis perkins builder', "referredBy" = 'Friend', "viewingDate" = '2023-05-11 00:00:00'::timestamp, "documentPackDate" = '2023-05-12 00:00:00'::timestamp, "documentReviewDate" = '2023-05-22 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-05-22 00:00:00'::timestamp, "keyGivenDate" = '2023-05-25 00:00:00'::timestamp, "depositInvoicedDate" = '2023-05-26 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mahsa Rahbari') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', notes = 'Hello, I would be interested in renting one of the talking therapy rooms on a weekly basis. My preference would be for Tuesday, Wednesday or Thursday afternoon, for a 4 hour block between 16.00 - 20.00. My intention would be to start the renting on the 1st of September but happy to contract from no', "referredBy" = 'UKTR', "viewingDate" = '2023-05-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Robert Preda') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '3 Fullers Avenue', address3 = 'Surbiton', postcode = 'KT6 7TD', skill = 'Holistic Massage', notes = 'Miss C L Brown

No STL requirement as
Full Member of info@thinktreehub.com - (1178)', "accreditationBody" = 'Think Tree Hub', "accreditationNumber" = '1178', "viewingDate" = '2023-05-29 00:00:00'::timestamp, "documentPackDate" = '2023-05-29 00:00:00'::timestamp, "documentReviewDate" = '2023-05-31 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-05-30 00:00:00'::timestamp, "keyGivenDate" = '2023-06-03 00:00:00'::timestamp, "depositInvoicedDate" = '2023-06-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Chantal Brown') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'BABCP', "viewingDate" = '2023-05-31 00:00:00'::timestamp, "documentPackDate" = '2023-05-31 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Bert Kidwell') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'member of Ctha (so that covers special treatments licence) and have many qualifications.

Advanced Level 5 Sports Therapy
VTCT diploma in Sports Massage
VTCT diploma in sports injuries
ITEC Anatomy Physiology and Holistic Massage 
CST Craniosacral Therapy Diploma', "referredBy" = 'Website', "viewingDate" = '2023-06-01 00:00:00'::timestamp, "documentPackDate" = '2023-06-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sangi Anantha') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 13', address2 = 'Liddesdale  East', address3 = 'Kingston Upon Thames', postcode = 'KT2 7BS', skill = 'Voice Therapist', notes = 'HCPC Registration number: SL27660
RCSLT Registration number: RC0029689', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'SL27660', "viewingDate" = '2023-06-08 00:00:00'::timestamp, "documentPackDate" = '2023-06-10 00:00:00'::timestamp, "documentReviewDate" = '2023-10-25 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-10-25 00:00:00'::timestamp, "keyGivenDate" = '2023-10-26 00:00:00'::timestamp, "depositInvoicedDate" = '2023-10-25 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lisa Aldwinckle') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reflexologist', "referredBy" = 'UKTR', "viewingDate" = '2023-07-20 00:00:00'::timestamp, "documentPackDate" = '2023-07-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Samantha Anstead') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', notes = 'I have got my GDC number, insurance.
I do injections, peel treatment, PRP for face and hair.', "referredBy" = 'UKTR', "viewingDate" = '2023-07-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alexandra Knyazevich') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Phsychotherapist', "documentPackDate" = '2023-07-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ugo Chijiutomi') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '20 Rushett Close', address3 = 'Thames Ditton', postcode = 'KT7 0UR', skill = 'postnatal well-being practitioner', notes = 'laura@laurabardell.co.uk

I’m a postnatal well-being practitioner offering tailored postnatal recovery treatments to help balance the body after birth. I’m trained in kinesiology, coaching, facial massage and as a postnatal doula so combine these modalities in what I offer.
I’m very interested in doing some adhoc treatments at Therapy Rooms and would love to have a chat with you about how I can set this up.', "referredBy" = 'Website', "viewingDate" = '2023-08-21 00:00:00'::timestamp, "documentPackDate" = '2023-08-16 00:00:00'::timestamp, "documentReviewDate" = '2023-09-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-09-27 00:00:00'::timestamp, "keyGivenDate" = '2023-09-28 00:00:00'::timestamp, "depositInvoicedDate" = '2023-09-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Laura Bardell-Smith') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'https://www.fht.org.uk/users/gordonsmalley218486', "accreditationBody" = 'FHT', "accreditationNumber" = '218486', "documentPackDate" = '2023-08-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Niamh Gordon-Smalley') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '33 Stratton Court', address2 = '16 Adelaide Road', address3 = 'Surbiton', postcode = 'KT6 4SU', skill = 'Aesthitics', notes = 'local Nurse prescriber looking for a professional room to hire for at least weekly or monthly depending on the client demand.  I am a medial dermatology Nurse with 7 years experience.  I would like the room to further my aesthetics business along with health and wellness', "referredBy" = 'UKTR', "viewingDate" = '2023-10-05 00:00:00'::timestamp, "documentPackDate" = '2023-10-06 00:00:00'::timestamp, "documentReviewDate" = '2023-10-13 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-10-13 00:00:00'::timestamp, "keyGivenDate" = '2023-10-11 00:00:00'::timestamp, "depositInvoicedDate" = '2023-10-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Amy Maguire') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "viewingDate" = '2023-10-05 00:00:00'::timestamp, "documentPackDate" = '2023-10-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Monica Fernandez') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Clinical Psychologist looking for a therapy room to rent on Monday mornings. Do you have availability in one of your talking therapy rooms from 8am - 11am or 9am - 12pm?', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Anna Hall') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Laura Tilson Osteopathy', skill = 'Osteopath', "referredBy" = 'Friend', "keyCard" = '8386', "viewingDate" = '2023-10-12 00:00:00'::timestamp, "keyGivenDate" = '2023-10-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('India Cooke') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '33 Surbiton Court', address2 = 'St. Andrews Square', address3 = 'Surbiton', postcode = 'KT6 4EB', county = 'Surrey', skill = 'Psychotherapist', "referredBy" = 'Website', "accreditationBody" = 'UKCP', "accreditationNumber" = '2011170504', "viewingDate" = '2023-10-19 00:00:00'::timestamp, "documentPackDate" = '2023-10-19 00:00:00'::timestamp, "documentReviewDate" = '2023-10-24 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-10-24 00:00:00'::timestamp, "keyGivenDate" = '2023-10-24 00:00:00'::timestamp, "depositInvoicedDate" = '2023-10-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Marta Kudrnova') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'The Therapy Home', skill = 'Child Mental Health Practitioner', notes = 'see Nisha Hickin
01/12/2023 left 6 bookng in which I removed - 4 billale waived', "referredBy" = 'Friend', "documentPackDate" = '2023-10-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sebastian Sutcliffe') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 6', address2 = '64 Palace Road', address3 = 'East Molesey', postcode = 'KT8 9DW', skill = 'EFT Practitioner and Coach', notes = 'https://www.emccglobal.org/accreditation/eia/eia-awards/?first_name=Josh&last_name=Alward&award_level=3&reference=&search=1

KD returned 11/04/25', "referredBy" = 'Website', "viewingDate" = '2023-11-02 00:00:00'::timestamp, "documentPackDate" = '2023-11-02 00:00:00'::timestamp, "documentReviewDate" = '2023-11-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-11-10 00:00:00'::timestamp, "keyGivenDate" = '2023-11-11 00:00:00'::timestamp, "depositInvoicedDate" = '2023-11-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Josh Alward') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '37 Hill Rise', address3 = 'Esher', postcode = 'KT10 0AL', skill = 'Counsellor', notes = 'I''m interested in room hire for my private practice - counselling. I live in Hinchley Wood, Esher.

Please let me know if you have any space, I would like a spot in Surbiton to see clients.', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '395685', "viewingDate" = '2023-11-09 00:00:00'::timestamp, "documentPackDate" = '2023-11-09 00:00:00'::timestamp, "documentReviewDate" = '2023-11-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-11-18 00:00:00'::timestamp, "keyGivenDate" = '2023-11-20 00:00:00'::timestamp, "depositInvoicedDate" = '2023-11-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Deborah Morley') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '274 Hook Road', address3 = 'Chessington', postcode = 'KT9 1PF', skill = 'CBT therapist', "referredBy" = 'Website', "accreditationBody" = 'BABCP', "accreditationNumber" = '180114', "viewingDate" = '2023-11-21 00:00:00'::timestamp, "documentPackDate" = '2023-11-21 00:00:00'::timestamp, "documentReviewDate" = '2024-02-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-02-05 00:00:00'::timestamp, "keyGivenDate" = '2024-02-06 00:00:00'::timestamp, "depositInvoicedDate" = '2024-02-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rhianna Blackwell') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', notes = 'Hi, I’m looking for a room to rent half a day a week. I’m a physiotherapist specialising in diagnostic ultrasound and ultrasound guided injections. I live locally in fact only a few minutes from the Surbiton branch. I’m keen to talk to somebody about room rentals. Of note, I do need a sink in the room.', "referredBy" = 'Website', "viewingDate" = '2023-12-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Chris Myers') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '52 Arlington Road', address3 = 'Surbiton', postcode = 'KT6 6BN', skill = 'Psychotherapist', notes = 'looking for a therapy room to hire in Surbiton - I''m a psychotherapist who has recently moved to the area. At the moment I just need a room for one session a week, however I envisage this will increase when my practice grows', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '401992', "viewingDate" = '2023-12-21 00:00:00'::timestamp, "documentPackDate" = '2023-12-22 00:00:00'::timestamp, "documentReviewDate" = '2023-12-24 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2023-12-24 00:00:00'::timestamp, "keyGivenDate" = '2023-12-28 00:00:00'::timestamp, "depositInvoicedDate" = '2024-01-07 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Phoebe Gorry') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '1 Thames Court', address2 = 'Victoria Avenue', address3 = 'West Molesey', postcode = 'KT8 1TP', skill = 'Aesthetics', notes = 'advanced aesthetic nurse prescriber working in London and looking to set my business in kingston area.  
I am interested in hiring a room once a week

www.nmc-uk.org/Search-the-
Register', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "accreditationNumber" = '15D0295C', "viewingDate" = '2024-01-15 00:00:00'::timestamp, "documentPackDate" = '2024-01-15 00:00:00'::timestamp, "documentReviewDate" = '2024-01-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-01-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Smeralda de Lucia') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Craniosacral Therapist', notes = 'Craniosacral Therapist from purley and would like to expand  practice in Surbiton.', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Rucha Dixit') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath', notes = 'Laura Tilson''s clinic
Reg no: 8784

Web: www.blossomosteopathy.com', "referredBy" = 'Friend' WHERE LOWER(name) = LOWER('Kam Bening') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 2 Shelley Court', address3 = 'Surbiton', postcode = 'KT6 6NP', skill = 'Psychotherapy', "referredBy" = 'Website', "viewingDate" = '2024-02-22 00:00:00'::timestamp, "documentPackDate" = '2024-08-21 00:00:00'::timestamp, "documentReviewDate" = '2024-10-01 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-01 00:00:00'::timestamp, "keyGivenDate" = '2024-10-01 00:00:00'::timestamp, "depositInvoicedDate" = '2024-10-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Omur Koluman') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Nurse Practitioner -Prescriber trained in Aesthetics', "referredBy" = 'UKTR', "keyCard" = '0', "documentPackDate" = '2024-03-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Dessislava Tcholakova') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-03-16 00:00:00'::timestamp, "documentPackDate" = '2024-03-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Adela Lofts') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0' WHERE LOWER(name) = LOWER('Paris Fuller') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '93 Berrylands', address3 = 'Surbiton', postcode = 'KT5 8JX', skill = 'Craniosacral Therapist, Reiki', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-03-20 00:00:00'::timestamp, "documentPackDate" = '2024-03-24 00:00:00'::timestamp, "documentReviewDate" = '2024-03-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-03-26 00:00:00'::timestamp, "keyGivenDate" = '2024-04-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Steph Edwards') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 105', address2 = '278 Magdalen Road', address3 = 'London', postcode = 'SW18 3NY', skill = 'nurse prescriber, aesthetics', notes = 'Nurse prescriber working in a private clinic in Central London, but I am keen start my own business. I will be looking at one day a month, with the aim of increasing this.

0009620805 146,52549

fob returned 10/10/2025', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "accreditationNumber" = '16L0081E', "keyCard" = '8108156', "viewingDate" = '2024-03-29 00:00:00'::timestamp, "documentPackDate" = '2024-04-03 00:00:00'::timestamp, "documentReviewDate" = '2024-04-09 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-04-09 00:00:00'::timestamp, "keyGivenDate" = '2024-04-11 00:00:00'::timestamp, "depositInvoicedDate" = '2024-04-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Verity Pearce') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Womens Health Osteopath', notes = 'I work as a Womens Health Osteopath and have been looking for a local space to extend my practice.', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-04-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Samantha Berman') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 23', address2 = 'Deauville Mansions', address3 = 'London', postcode = 'SW4 8QJ', skill = 'Massage and Beauty', notes = 'no key deposit - £400 deposit paid in advance
Melvin', "referredBy" = 'UKTR', "accreditationBody" = 'Thinktree', "accreditationNumber" = '636', "keyCard" = '44826', "viewingDate" = '2024-04-12 00:00:00'::timestamp, "documentPackDate" = '2024-04-12 00:00:00'::timestamp, "documentReviewDate" = '2024-04-29 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-04-29 00:00:00'::timestamp, "keyGivenDate" = '2024-04-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Melvin Egwuatu') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '96 Gorringe Park Avenue', address3 = 'Mitcham', postcode = 'CR4 2DJ', county = 'Surrey', skill = 'Aesthetics', notes = '96 Gorringe Park Avenue
Mitcham
Surrey
CR4 2DJ', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '7421060', "keyCard" = '48156', "viewingDate" = '2024-04-22 00:00:00'::timestamp, "documentPackDate" = '2024-04-22 00:00:00'::timestamp, "documentReviewDate" = '2024-04-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-04-29 00:00:00'::timestamp, "keyGivenDate" = '2024-04-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Julian Pearce') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat C', address2 = '52 Conyers Road', address3 = 'London', postcode = 'SW16 6LT', skill = 'Counsellor', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "keyCard" = '8137804', "viewingDate" = '2024-05-28 00:00:00'::timestamp, "documentPackDate" = '2024-04-30 00:00:00'::timestamp, "documentReviewDate" = '2024-05-30 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-05-30 00:00:00'::timestamp, "keyGivenDate" = '2024-06-03 00:00:00'::timestamp, "depositInvoicedDate" = '2024-06-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Carmel Grannell') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0', "documentPackDate" = '2024-05-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rochelle Beckford') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '16 Quicks Road', address3 = 'London', postcode = 'SW19 1EZ', skill = 'Acupuncture', notes = 'don''t use rachel@acupuncturelondon.co', "referredBy" = 'UKTR', "accreditationBody" = 'BAcC', "accreditationNumber" = '958059', "keyCard" = '10139083', "viewingDate" = '2024-05-04 00:00:00'::timestamp, "documentPackDate" = '2024-05-04 00:00:00'::timestamp, "documentReviewDate" = '2024-05-14 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-05-14 00:00:00'::timestamp, "keyGivenDate" = '2024-05-20 00:00:00'::timestamp, "depositInvoicedDate" = '2024-05-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rachel Baynes') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-05-09 00:00:00'::timestamp, "documentPackDate" = '2024-05-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Claire Harper') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', "referredBy" = 'UKTR', "keyCard" = '0', "documentPackDate" = '2024-05-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Verdah Malik') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Infusions', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-05-13 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Fouzia Mahmood') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'medical consultations', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-05-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Amina Albeyatti') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Mooy Aesthetics', address1 = 'Flat 16 Simon Lodge', address2 = '76 Victoria Drive', address3 = 'London', postcode = 'SW19 6HJ', skill = 'Asthetics', notes = 'aesthetic nurse. I have recently opened an Aesthetics business called Mooy Aesthetics, I currently have Clinics every 2nd Sunday and would love to come in and have a look at your space?', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "keyCard" = '6866972', "viewingDate" = '2024-05-23 00:00:00'::timestamp, "documentPackDate" = '2024-05-27 00:00:00'::timestamp, "documentReviewDate" = '2024-05-28 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-05-28 00:00:00'::timestamp, "keyGivenDate" = '2024-05-28 00:00:00'::timestamp, "depositInvoicedDate" = '2024-05-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Bronte Shokkos') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Child Psychiatrist', "keyCard" = '0', "viewingDate" = '2024-05-30 00:00:00'::timestamp, "documentPackDate" = '2026-05-15 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ramya Mohan') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Hair specialist', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-05-29 00:00:00'::timestamp, "documentPackDate" = '2024-05-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Precious Stewart') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '5 Offers Court', address2 = 'Winery Lane', address3 = 'Kingston Upon Thames', postcode = 'KT1 3GQ', skill = 'Massage therapist', "referredBy" = 'UKTR', "accreditationBody" = 'FHT', "accreditationNumber" = '218211', "keyCard" = '0', "viewingDate" = '2024-06-06 00:00:00'::timestamp, "documentPackDate" = '2024-06-06 00:00:00'::timestamp, "documentReviewDate" = '2024-06-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-06-19 00:00:00'::timestamp, "keyGivenDate" = '2024-06-20 00:00:00'::timestamp, "depositInvoicedDate" = '2024-06-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Chelsea Powell') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-06-21 00:00:00'::timestamp, "documentPackDate" = '2024-06-23 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mark Chapman') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0' WHERE LOWER(name) = LOWER('Catherine Brooks') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-06-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Humaira Fawad') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aromatherapist', notes = 'qualified and registered clinical aromatherapist with a specialist interest in manual scar therapy, offering holistic therapy treatments and body work. I currently use a home treatment room but would like to move to a clinic environment in the Wimbledon area. I would initially like to book the room for adhoc hours with a view to increasing to a more regular contract in the future.', "referredBy" = 'UKTR', "keyCard" = '0' WHERE LOWER(name) = LOWER('Georgie Hopkins') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Need to find a room 2 days a week to start with to carry out Laser hair removal treatments.', "referredBy" = 'UKTR', "keyCard" = '0' WHERE LOWER(name) = LOWER('Patricia Gordon') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Hypnotherapist and Psychosynthesis Coach', notes = 'I am a registered clinical hypnotherapist and psychosynthesis coach based in Surbiton and wanted to reach out to you for further information on hiring rooms. My current client base is entirely online and I am looking to move into offering face-to-face sessions.', "referredBy" = 'Website', "keyCard" = '0', "documentPackDate" = '2024-07-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Allan Johnson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Speech and Language Therapist', notes = 'looking to book a room out for therapy sessions for children 4-12 years of age from September 2024.', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-07-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Neema Salema') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '134 Wandle Road', address3 = 'Morden', postcode = 'SM4 6AE', skill = 'Naturopathic Therapist', notes = 'hypnotherapist
https://general-hypnotherapy-register.com/martin-butler/', "referredBy" = 'UKTR', "accreditationBody" = 'GHR', "accreditationNumber" = '9956', "keyCard" = '0', "viewingDate" = '2024-07-15 00:00:00'::timestamp, "documentPackDate" = '2024-07-22 00:00:00'::timestamp, "documentReviewDate" = '2024-07-23 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-07-23 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Martin Butler') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reflexology', notes = 'CNHC regsitered, Fellow of the AOR and FHT', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-08-02 00:00:00'::timestamp, "documentPackDate" = '2024-08-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nigel Watkins') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '28 Dun Na Riogh Green', address2 = 'Monread Ave', county = 'County Kildaire', skill = 'Physiotherapist, Sports Massage', notes = 'Physiotherapist/Physical therapist from Dublin

fob sent to 
Melanie Justiniani 
Flat 16 Preece Apartments
18-20 Waterfall Cottages
London SW19 2FN', "referredBy" = 'UKTR', "keyCard" = '6787660', "viewingDate" = '2024-08-02 00:00:00'::timestamp, "documentPackDate" = '2024-08-02 00:00:00'::timestamp, "documentReviewDate" = '2024-08-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-08-26 00:00:00'::timestamp, "keyGivenDate" = '2024-09-03 00:00:00'::timestamp, "depositInvoicedDate" = '2024-09-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Myla Etac') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Clinical Psychologist', notes = 'I’m interested in finding a therapy room to use on an adjoining basis on Wednesday. I’m a clinical psychologist and work with children and families so would need a room that can fit up up to 4 people', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-08-14 00:00:00'::timestamp, "documentPackDate" = '2024-08-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Stephanie Doig') AND role = 'THERAPIST';
UPDATE "User" SET address2 = 'Flat 4', address3 = 'Surbiton', postcode = 'KT5 8PA', skill = 'Somatic coaching', notes = 'Hi, I’m looking for a therapy space in Surbiton for my somatic coaching (and in future psychotherapy). I’m currently building my client base but I have a few ad hoc booking requests.', "referredBy" = 'Website', "keyCard" = '0', "viewingDate" = '2024-08-12 00:00:00'::timestamp, "documentPackDate" = '2024-08-09 00:00:00'::timestamp, "documentReviewDate" = '2024-08-12 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-08-12 00:00:00'::timestamp, "keyGivenDate" = '2024-08-15 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Eleanor Forder') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '39 Autumn Close', address3 = 'London', postcode = 'SW19 1UD', skill = 'Foot Health Professional and Massage Therapist', notes = 'will join FHT for STL exemption

https://barefootdynamics.com/

, Colliers Wood, London SW19', "referredBy" = 'UKTR', "accreditationBody" = 'FHT', "accreditationNumber" = '220355', "keyCard" = '386344', "viewingDate" = '2024-09-02 00:00:00'::timestamp, "documentPackDate" = '2024-09-02 00:00:00'::timestamp, "documentReviewDate" = '2024-09-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-09-27 00:00:00'::timestamp, "keyGivenDate" = '2024-09-28 00:00:00'::timestamp, "depositInvoicedDate" = '2024-09-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Diana Genas') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Mapicare Ltd', address1 = '13 Grove Close', address3 = 'Kingston upon Thames', skill = 'Aesthetics', notes = 'El Damerji <bd@mapicare.uk>', "referredBy" = 'UKTR', "keyCard" = '6827210', "viewingDate" = '2024-09-05 00:00:00'::timestamp, "documentPackDate" = '2024-09-06 00:00:00'::timestamp, "documentReviewDate" = '2024-09-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-09-10 00:00:00'::timestamp, "keyGivenDate" = '2024-09-11 00:00:00'::timestamp, "depositInvoicedDate" = '2024-09-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ziad El Damerji') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'have my own studio on the side but would like to move between „people” . 
I have 18years experience in beauty industry, semipermanent makeup around 14 years and 4 years with aesthetics. 
Please let me know if my person will meet your expectations and my service would suit your salon

www.beauty4yourself.co.uk', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-09-09 00:00:00'::timestamp, "documentPackDate" = '2024-09-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Daga Korecka') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Coach and trainee therapist', notes = 'Coach and trainee therapist, working 1:1 with clients using Cognitive Behavioural Therapy techniques. I want to find an room near to me (I live on The Crescent, and know the location of your offices well) to start seeing clients face to face from this month.', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-09-05 00:00:00'::timestamp, "documentPackDate" = '2024-09-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Benjamin Mitchell') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 1 Greener Court', address2 = '156 Worple Road', address3 = 'London', postcode = 'SW20 8QA', skill = 'Massage therapist', "referredBy" = 'UKTR', "keyCard" = '13777', "viewingDate" = '2024-09-12 00:00:00'::timestamp, "documentPackDate" = '2024-09-12 00:00:00'::timestamp, "documentReviewDate" = '2024-09-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-09-18 00:00:00'::timestamp, "keyGivenDate" = '2024-09-18 00:00:00'::timestamp, "depositInvoicedDate" = '2024-09-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Adrienne Bradshaw') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'semi permanent make up & non invasive  body contourin', "referredBy" = 'UKTR', "keyCard" = '0', "viewingDate" = '2024-09-12 00:00:00'::timestamp, "documentPackDate" = '2024-09-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sophia Ward') AND role = 'THERAPIST';
UPDATE "User" SET "keyCard" = '0' WHERE LOWER(name) = LOWER('Taihesha Duncan Hill') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '46 Norman Road', address3 = 'Sutton', postcode = 'SM1 2TA', skill = 'Reiki', "referredBy" = 'UKTR', "keyCard" = '0' WHERE LOWER(name) = LOWER('Tinki Gupta') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 3 Quadrangle Lodge', address2 = '40 Queens Road', address3 = 'London', postcode = 'SW19 8LJ', skill = 'deep tissue and sports massage', "referredBy" = 'UKTR', "keyCard" = '0000736263', "viewingDate" = '2024-09-23 00:00:00'::timestamp, "documentPackDate" = '2024-09-23 00:00:00'::timestamp, "documentReviewDate" = '2024-10-09 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-09 00:00:00'::timestamp, "keyGivenDate" = '2024-10-11 00:00:00'::timestamp, "depositInvoicedDate" = '2024-10-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Zaccaria Caimi') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counselling', "referredBy" = 'Walk In', "keyCard" = '0' WHERE LOWER(name) = LOWER('Christina Gigli') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 105', address2 = 'Fairfax Place', address3 = 'Woking', postcode = 'GU21 5FU', skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0000677345', "viewingDate" = '2024-10-02 00:00:00'::timestamp, "documentPackDate" = '2024-10-03 00:00:00'::timestamp, "documentReviewDate" = '2024-10-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-04 00:00:00'::timestamp, "keyGivenDate" = '2024-10-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Imogen Smith') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Oak View', address2 = 'Pyrford Green', address3 = 'Woking', postcode = 'GU22 8UZ', skill = 'Psychotherapist', notes = 'UKCP trainee psychotherapist living in Surrey. I’m currently starting my own private practice and I’m looking for rooms to rent.', "referredBy" = 'Website', "viewingDate" = '2024-10-15 00:00:00'::timestamp, "documentPackDate" = '2024-10-15 00:00:00'::timestamp, "documentReviewDate" = '2024-10-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-18 00:00:00'::timestamp, "keyGivenDate" = '2024-10-17 00:00:00'::timestamp, "depositInvoicedDate" = '2024-10-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('David Pusey') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Medsquare Ltd', address1 = '14 Stevedale Road', address3 = 'Welling', postcode = 'DA16 1NH', skill = 'PRP for hair loss, Botox, etc.', notes = 'Hansel Misquitta  07833 881417

Saleem Akbar

lost fob 0003062886', "referredBy" = 'UKTR', "keyCard" = '0008132052', "documentPackDate" = '2024-10-14 00:00:00'::timestamp, "documentReviewDate" = '2024-10-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-17 00:00:00'::timestamp, "keyGivenDate" = '2024-10-17 00:00:00'::timestamp, "depositInvoicedDate" = '2024-10-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Hansel Misquitta') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '17 St. Georges Road', address3 = 'Mitcham', postcode = 'CR4 1ED', county = 'Surrey', skill = 'Aesthetics', "referredBy" = 'UKTR', "keyCard" = '0000462162', "viewingDate" = '2024-10-18 00:00:00'::timestamp, "documentPackDate" = '2025-02-25 00:00:00'::timestamp, "documentReviewDate" = '2025-02-25 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-02-25 00:00:00'::timestamp, "keyGivenDate" = '2025-02-25 00:00:00'::timestamp, "depositInvoicedDate" = '2025-02-25 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rachel Koranteng') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', notes = 'Dentist looking for a room to rent to carry out my own aesthetics clinic. I am currently studying the Level 7 Diploma with Harley Academy. Until I build my client base, I wondered if you would be able to do it as an ad hoc rental and if this is something you would be interested in? If so, what would your daily rate be? I would also be interested in discussing a rate for 1 day a week or half days if this is a better option for you.', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Nicola Whidborne') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'counsellor', "referredBy" = 'Website', "viewingDate" = '2024-10-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Natania Kobayashi') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 1', address2 = '11 Victoria Avenue', address3 = 'Subiton', postcode = 'KT6 5DL', skill = 'Massage Therapist', notes = 'Massage Therapist
https://www.theisrm.com/directory.php
https://www.byhannah.uk/', "referredBy" = 'UKTR', "accreditationBody" = 'ISRM', "viewingDate" = '2024-10-24 00:00:00'::timestamp, "documentPackDate" = '2024-10-25 00:00:00'::timestamp, "documentReviewDate" = '2024-11-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-08 00:00:00'::timestamp, "keyGivenDate" = '2024-11-08 00:00:00'::timestamp, "depositInvoicedDate" = '2024-11-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Hannah Dakin') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Semo''s Aesthetics Studio Ltd', address1 = '30 Florence Avenue', address3 = 'Morden', postcode = 'SM4 6EX', skill = 'Aesthetics', "referredBy" = 'Walk In', "keyCard" = '0000428577', "documentPackDate" = '2024-10-22 00:00:00'::timestamp, "documentReviewDate" = '2024-10-24 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-10-28 00:00:00'::timestamp, "keyGivenDate" = '2024-10-28 00:00:00'::timestamp, "depositInvoicedDate" = '2024-10-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ras Oburoh') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapist', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Cyan') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Laura Tilson Ostepathy', address1 = '3 Fairfield South', address3 = 'Kingston Upon Thames', postcode = 'KT1 2UH', notes = 'fob sent 10/12/2024 no deposit', "referredBy" = 'Friend', "keyCard" = '0000031682', "keyGivenDate" = '2024-10-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('India Wilde') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', notes = 'Mariah Wilde (MA, PG Dip, PG Cert, BSc)
Psychotherapist | BABCP Accredited
Riah Therapies Psychotherapy Practice
Website: www.riahtherapies.com', "referredBy" = 'Website', "accreditationBody" = 'BABCP', "viewingDate" = '2024-10-30 00:00:00'::timestamp, "documentPackDate" = '2025-12-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mariah Wilde') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '31 Botleys Road', address2 = 'Ottershaw', address3 = 'Chertsey', postcode = 'KT16 0SE', county = 'Surrey', skill = 'Aesthetics', "referredBy" = 'Website', "accreditationBody" = 'GMC', "accreditationNumber" = '6055791', "viewingDate" = '2024-11-02 00:00:00'::timestamp, "documentPackDate" = '2024-11-02 00:00:00'::timestamp, "documentReviewDate" = '2024-11-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-05 00:00:00'::timestamp, "keyGivenDate" = '2024-11-07 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Tatiana Gutierrez') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'talk therapy', notes = 'wondering if you have a talk therapy room available on Thursdays at 6pm', "referredBy" = 'Website', "viewingDate" = '2025-01-09 00:00:00'::timestamp, "documentPackDate" = '2025-03-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jaime Rangeley') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Beauty Therapist', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Anne Santana') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'wonder if you have a room available each Tuesday in term time. The session would be from 16:15 for 50 minutes. 

I am particularly interested in Surbiton though South Wimbledon may be possible for my client. 
 
UKCP-BEd-MSc-AFT', "referredBy" = 'Website', "viewingDate" = '2024-11-05 00:00:00'::timestamp, "documentPackDate" = '2024-11-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alison Fish') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Private GP Clinic', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '745476', "viewingDate" = '2024-11-18 00:00:00'::timestamp, "documentPackDate" = '2025-04-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Victoria Ashman') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '32 Seymour Road', address3 = 'Mitcham', postcode = 'CR4 4JX', skill = 'Aesthetics', "referredBy" = 'UKTR', "keyCard" = '0002878011', "viewingDate" = '2024-11-14 00:00:00'::timestamp, "documentPackDate" = '2024-11-14 00:00:00'::timestamp, "documentReviewDate" = '2024-11-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-18 00:00:00'::timestamp, "keyGivenDate" = '2024-11-19 00:00:00'::timestamp, "depositInvoicedDate" = '2024-11-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Andrea Prieto') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '20 St. Mark''s Hill', address3 = 'Surbiton', postcode = 'KT6 4PT', skill = 'Psychotherapist', notes = 'qualified psychotherapist and I’m interested in practising at Therapy Spaces . Please could you let me know whether you have availability to rent rooms?

Changed mind 08/01/2025 - will return key', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '391415', "viewingDate" = '2024-11-21 00:00:00'::timestamp, "documentPackDate" = '2024-11-21 00:00:00'::timestamp, "documentReviewDate" = '2024-11-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-27 00:00:00'::timestamp, "keyGivenDate" = '2024-12-11 00:00:00'::timestamp, "depositInvoicedDate" = '2024-12-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ciara Kelly') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Sarah Griffiths') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 1', address2 = '109 Brighton Road', address3 = 'Surbiton', postcode = 'KT6 5NF', skill = 'Sports Massage', notes = 'strength and conditioning coach and Osteopath by trade', "referredBy" = 'UKTR', "viewingDate" = '2024-11-18 00:00:00'::timestamp, "documentPackDate" = '2024-11-19 00:00:00'::timestamp, "documentReviewDate" = '2024-11-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-27 00:00:00'::timestamp, "keyGivenDate" = '2024-12-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Josh Paine') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '16 Otter Drive', address3 = 'Carshalton', postcode = 'SM5 2FH', county = 'Surrey', skill = 'Aesthetics', notes = 'registered nurse starting up an aesthetics clinic  

To begin with I would probably need the room just once a week for a few hours to record content and as I get clients I would use the room more often on an adhoc basis.

https://www.nmc.org.uk/search-the-register/', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "keyCard" = '0000388746', "viewingDate" = '2024-11-19 00:00:00'::timestamp, "documentPackDate" = '2024-11-19 00:00:00'::timestamp, "documentReviewDate" = '2024-11-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-11-20 00:00:00'::timestamp, "keyGivenDate" = '2024-11-20 00:00:00'::timestamp, "depositInvoicedDate" = '2024-11-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sylvia Ikpedighe') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Beauty Therapist', notes = 'I currently have my own private clinic but am needing to move out of London I’m interested in taking a manual room 3/4 days week if possible', "referredBy" = 'UKTR', "viewingDate" = '2024-11-18 00:00:00'::timestamp, "documentPackDate" = '2024-11-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Angeline Crowie') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', notes = 'I’m a doctor returning to aesthetic practice after a year long break. 
I’ve recently moved to surbiton and hoping to get my practice up and running again. 
I came across your space and it would be really ideal for me. 
I hoped to look into what availability you currently had? 

I’d be offering medical aesthetics and some holistic services', "referredBy" = 'Website', "viewingDate" = '2024-11-21 00:00:00'::timestamp, "documentPackDate" = '2024-11-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sarah Rankine') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'EFT, NLP, Counseling and Coaching', notes = 'I''m writing to enquire about the therapy rooms for rent. I don''t have a specific date and time yet, but I''d like to have more information on how it works.
I do EFT, NLP, Counseling and Coaching, and other modalities, but I haven''t decided yet if I will advertise everything at the moment, for example Mindfulness, Brain Gym. We''ll talk more when you show me around.', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Sue Fernandez') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Clinical psychologist', notes = 'looking for a space on a Friday morning.', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Liana Hadleigh') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '44 Latimer Road', address3 = 'London', postcode = 'SW19 1EP', skill = 'Aesthetics', "referredBy" = 'Website', "accreditationBody" = 'GDC', "accreditationNumber" = '75206', "keyCard" = '0000243725', "viewingDate" = '2024-11-25 00:00:00'::timestamp, "documentPackDate" = '2024-11-25 00:00:00'::timestamp, "documentReviewDate" = '2024-12-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-12-09 00:00:00'::timestamp, "keyGivenDate" = '2024-12-09 00:00:00'::timestamp, "depositInvoicedDate" = '2024-12-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Aoife Boland') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '19a Tolworth Broadway', address3 = 'Surbiton', postcode = 'KT6 7DJ', skill = 'Aesthetics', notes = 'Home address:
22 Turners Lane
Brierley Hill
DY5 2PQ

Lara Rose Aesthetics
AKA Skin Maison
failed DD 17/11/2025', "referredBy" = 'UKTR', "viewingDate" = '2024-12-03 00:00:00'::timestamp, "documentPackDate" = '2024-12-06 00:00:00'::timestamp, "documentReviewDate" = '2024-12-09 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2024-12-09 00:00:00'::timestamp, "keyGivenDate" = '2024-12-10 00:00:00'::timestamp, "depositInvoicedDate" = '2024-12-10 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Laraib Akhtar') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 2', address2 = '96 High Street', address3 = 'London', postcode = 'SW19 2BT', skill = 'aesthetics', notes = 'NMC registered nurse with aesthetics training
Glamour Haven', "referredBy" = 'UKTR', "accreditationBody" = 'NMC', "keyCard" = '0000275407', "viewingDate" = '2024-12-13 00:00:00'::timestamp, "documentPackDate" = '2025-01-02 00:00:00'::timestamp, "documentReviewDate" = '2025-01-02 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-01-02 00:00:00'::timestamp, "keyGivenDate" = '2025-01-02 00:00:00'::timestamp, "depositInvoicedDate" = '2025-01-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Odette Giordmaina') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'massage therapy and holistic fitness', notes = 'friend of Steph Edwards who is looking for a therapy space with a massage couch to rent. 
 
www.emily-owen.co.uk', "referredBy" = 'Friend' WHERE LOWER(name) = LOWER('Emily Owen') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Childrens therapist', notes = 'childrens therapist (BACP) looking to find somewhere to facilitate some private creative therapy sessions. Is this something I can explore at Therapy Spaces? Ideally I would be looking for an after school 3 hour slot on a weekday? Please feel free to give me a call', "referredBy" = 'Website', "viewingDate" = '2025-01-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rachel Chambers') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "viewingDate" = '2025-01-13 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Seema Vohra') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '51 Worton Way', address3 = 'Isleworth', postcode = 'TW7 4AY', skill = 'Aesthetics', notes = 'interested in hiring out therapy rooms on a regular basis for aesthetic treatment work. Would appreciate to understand the availability and booking process and viewing the rooms if possible.

Https://www.gmc-uk.org/registrants?text=Zahrah%20Sadiq&allProfessions=true', "referredBy" = 'Website', "accreditationBody" = 'GMC', "accreditationNumber" = '7842154', "keyCard" = '0000190331', "viewingDate" = '2025-01-10 00:00:00'::timestamp, "documentPackDate" = '2025-01-12 00:00:00'::timestamp, "documentReviewDate" = '2025-01-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-01-20 00:00:00'::timestamp, "keyGivenDate" = '2025-01-21 00:00:00'::timestamp, "depositInvoicedDate" = '2025-01-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Zahrah Sadiq') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetics', "referredBy" = 'UKTR', "accreditationBody" = 'GDC' WHERE LOWER(name) = LOWER('Kajal Patel') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapeutic Counsellor', "referredBy" = 'Website', "accreditationBody" = 'BACP', "viewingDate" = '2025-01-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alice Joyce') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '69 Hartscroft', address2 = 'Linton Glade', address3 = 'Croydon', postcode = 'CR0 9LD', skill = 'Physiotherapist', notes = 'Enquiring on behalf of our physio as to room availability for full day and half day bookings.

Alexandra Broad <info@waterhousephysio.com>

Want Wednesday and Saturdays', "referredBy" = 'Website', "accreditationBody" = 'CSP', "keyCard" = '0000725396', "viewingDate" = '2025-01-28 00:00:00'::timestamp, "documentPackDate" = '2025-01-30 00:00:00'::timestamp, "documentReviewDate" = '2025-02-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-02-05 00:00:00'::timestamp, "keyGivenDate" = '2025-08-04 00:00:00'::timestamp, "depositInvoicedDate" = '2025-08-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Michael Saad') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '117 Runnymede', address3 = 'London', postcode = 'SW19 2RQ', skill = 'Counselling Psychologist', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL047594', "keyCard" = '0003054642', "viewingDate" = '2025-12-05 00:00:00'::timestamp, "documentPackDate" = '2025-12-06 00:00:00'::timestamp, "documentReviewDate" = '2025-12-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-12-08 00:00:00'::timestamp, "keyGivenDate" = '2025-12-09 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Elliott Gibbs') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '5 Watery Lane', address3 = 'London', postcode = 'SW20 9AA', skill = 'Aesthetics', notes = 'I am writing to enquire about the possibility of scheduling a visit to review the therapy space Wimbledon, with a view to using it on an ad hoc basis for remote medical aesthetics consultations and treatments.', "referredBy" = 'Website', "accreditationBody" = 'GMC', "accreditationNumber" = '7517329', "keyCard" = '0007905802', "viewingDate" = '2025-02-07 00:00:00'::timestamp, "documentPackDate" = '2025-02-06 00:00:00'::timestamp, "documentReviewDate" = '2025-02-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-02-07 00:00:00'::timestamp, "keyGivenDate" = '2025-02-07 00:00:00'::timestamp, "depositInvoicedDate" = '2025-02-07 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Vishnu Nathan') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Auesthetics', notes = 'I''m looking for a clinical room to book a few hours on an advocate basis & hopefully a more regulate basis once I''m established. I run a dentist led aesthetics practice drsarahhughes.co.uk', "referredBy" = 'UKTR', "accreditationBody" = 'GDC', "accreditationNumber" = '86105' WHERE LOWER(name) = LOWER('Sarah Hughes') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 49', address2 = 'Longlands Court', address3 = 'Mitcham', postcode = 'CR4 2NQ', notes = 'I am soft tissue therapist and I am interested in ad hoc rental of your room. 
I’ve read your terms of use, however it doesn’t say if the items like towels required for the massage treatments are provided or is it sole responsibility of the therapist?', "referredBy" = 'Website', "keyCard" = '0000265514', "viewingDate" = '2025-02-24 00:00:00'::timestamp, "documentPackDate" = '2025-02-24 00:00:00'::timestamp, "documentReviewDate" = '2025-03-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-03-08 00:00:00'::timestamp, "keyGivenDate" = '2025-03-08 00:00:00'::timestamp, "depositInvoicedDate" = '2025-03-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Joanna Zubkowicz') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage', notes = 'massage therapist based in Wimbledon looking to grow my client base.

I am interested in viewing the therapy room if that would be possible sometime soon?', "referredBy" = 'UKTR', "viewingDate" = '2025-02-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Louise Pavoni') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '24 The Causeway', address3 = 'Chessington', postcode = 'KT9 1DB', skill = 'Kinesiologist', notes = 'kinesiologist and I am interested in hiring a treatment room with couch for a couple of Saturdays a month', "referredBy" = 'Website', "viewingDate" = '2025-02-27 00:00:00'::timestamp, "documentPackDate" = '2025-02-28 00:00:00'::timestamp, "documentReviewDate" = '2025-04-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-04-04 00:00:00'::timestamp, "keyGivenDate" = '2025-04-04 00:00:00'::timestamp, "depositInvoicedDate" = '2025-04-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Amanda Douglas') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', notes = 'BACP registered, qualified and experienced psychotherapist looking for ad hoc rental of a therapy room. Please kindly advise your availability.', "referredBy" = 'Website', "viewingDate" = '2025-03-13 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Louise McDowell') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Sports Therapist', notes = 'sports massage therapist looking for a potential space to hire,', "referredBy" = 'UKTR', "viewingDate" = '2025-03-15 00:00:00'::timestamp, "documentPackDate" = '2025-03-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jess Dibble') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapist', notes = 'I am in the infancy of starting up a business which will primarily be massage and am looking for a space to rent to undertake these. The space won’t be needed every day and ideally I would rent by the hour so that I am only using the space when I have clients.', "referredBy" = 'Website', "viewingDate" = '2025-11-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jessica Craig') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Colette Charmaine Mattos') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'I work for a company called Check4Cancer Ltd who offer cancer screening services to private patients. More information about us can be found here:
https://www.check4cancer.com/
We are looking to start holding our SkinCheck clinics in your area and I was wondering whether you offer private clinic room rentals at all? We would be looking at clinic room rentals every Monday or Tuesday for the full day.
The skin cancer screening service that we provide consists of a specialist nurse examination using Dermoscopy with no procedures or treatment taking place during clinics.', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Aimee Robinson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapy', notes = 'Good afternoon,
I would like to enquire about your available therapy rooms. This is for massage therapy. I look forward to your advice', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Elaine Davis') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapist', notes = 'Hi I am a massage therapist in the area. And I’m interested in the South Wimbledon space. Please can you share some more information about how it could work on an ad hoc basis', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Nadia Ossoble') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', notes = 'Psychotherapist, Supervisor, Couple''s Therapist, Group Facilitator
MBACP (Accred) MNCPS (Accred)', "referredBy" = 'Website', "viewingDate" = '2025-03-27 00:00:00'::timestamp, "documentPackDate" = '2025-03-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Emma Wallen') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Podiatrirst', notes = 'Experienced podiatrirst with NHS and private experience. Offers varities of treatments.
I will be interested in having this room, every Wednesday.', "referredBy" = 'UKTR', "viewingDate" = '2025-04-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ike') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '20b Claremont Avenue', address3 = 'New Malden', postcode = 'KT3 6QL', skill = 'Hypnotherapsit', notes = 'looking at options for spaces to treat with massage, reiki and hypnotherapy', "referredBy" = 'UKTR', "accreditationBody" = 'FHT', "keyCard" = '0000034058', "viewingDate" = '2025-04-14 00:00:00'::timestamp, "documentPackDate" = '2025-04-14 00:00:00'::timestamp, "documentReviewDate" = '2025-04-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-04-17 00:00:00'::timestamp, "keyGivenDate" = '2025-04-16 00:00:00'::timestamp, "depositInvoicedDate" = '2025-04-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ema Borges') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '7 Ronelean Road', address3 = 'Surbiton', postcode = 'KT6 7LJ', county = 'Surrey', skill = 'PRP Therapist', notes = 'Hi , i would like to enquire about manual therapy room, i am a prp therapist and would like to know about hiring the room, and also how far ahead i will have to make a booking for this room? Can it be done a day before ?', "referredBy" = 'UKTR', "viewingDate" = '2025-04-24 00:00:00'::timestamp, "documentPackDate" = '2025-04-25 00:00:00'::timestamp, "documentReviewDate" = '2025-04-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-04-26 00:00:00'::timestamp, "keyGivenDate" = '2025-04-27 00:00:00'::timestamp, "depositInvoicedDate" = '2025-04-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sania Jamal') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Reiki?', notes = 'I’m interested in renting a room in Southfield, as I currently work in the area. I would like to find out if there is a hot cabbi in the room?
Also, I’m considering to rent a room on a permanent basis two days per week, which would be Friday and Saturday, is there a possibility of renting two days per week?
Would you be available for a viewing on Thursday at 12.30?', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Aga Szkudlarek') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'True Hearing', skill = 'Audiologist', "referredBy" = 'Friend' WHERE LOWER(name) = LOWER('Breda Ryan') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapist', "referredBy" = 'UKTR', "viewingDate" = '2025-05-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ben Warden') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '8 Bewlys Road', address3 = 'London', postcode = 'SE27 0LA', "referredBy" = 'Website', "accreditationBody" = 'NMC', "keyCard" = '0000034328', "viewingDate" = '2025-05-13 00:00:00'::timestamp, "documentPackDate" = '2025-05-13 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Vonettea Rowe') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Cultskin', address1 = '50 High Street', address3 = 'Esher', postcode = 'KT10 9QY', skill = 'Aesthetician', notes = 'We have a clinic in Wimbledon village which we have an issue with which means that we have had to close today but we may need a temporary space for one of our doctors to perform injectables tomorrow and Friday 
Please can you let me know if you have a room available
50 High Street, Esher, KT10 9QY', "referredBy" = 'UKTR', "documentPackDate" = '2025-05-14 00:00:00'::timestamp, "documentReviewDate" = '2025-07-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-04 00:00:00'::timestamp, "keyGivenDate" = '2025-07-04 00:00:00'::timestamp, "depositInvoicedDate" = '2025-07-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Annice Ling') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 1', address2 = '23 Adelaide Road', address3 = 'Surbiton', postcode = 'KT6 4TA', skill = 'Sports Massage', "referredBy" = 'Website', "viewingDate" = '2025-05-22 00:00:00'::timestamp, "documentPackDate" = '2025-05-22 00:00:00'::timestamp, "documentReviewDate" = '2025-07-28 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-28 00:00:00'::timestamp, "keyGivenDate" = '2025-07-28 00:00:00'::timestamp, "depositInvoicedDate" = '2025-07-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Florence Dinar') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Podiatrist', notes = 'I am interested in renting a room for podiatry.', "referredBy" = 'Website', "viewingDate" = '2025-05-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Hazra Mallu') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Beauty Therpaist', notes = 'time waster - found somewhere chepaer after no shows', "referredBy" = 'UKTR', "viewingDate" = '2025-06-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Atalona Barton') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '11 Sovereign Way', address3 = 'Eastleigh', postcode = 'SO50 4SA', county = 'Hampshire', skill = 'Tonuge Tie Clinic', notes = 'looking to run a regular Tongue tie clinic and have been signposted to you there Therapy spaces. Is this something you feel you are able to facilitate for me. I am the Senior lead practitioner at Privatemidwives.com and I am an educator of tongue tie so will often have trainees in my clinic either observing or doing their final assessments. I have my own CQC registration.

, ,', "referredBy" = 'Friend', "accreditationBody" = 'NMC', "documentPackDate" = '2025-08-26 00:00:00'::timestamp, "documentReviewDate" = '2025-09-05 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-09-05 00:00:00'::timestamp, "keyGivenDate" = '2025-09-07 00:00:00'::timestamp, "depositInvoicedDate" = '2025-09-07 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sharon Gamon') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '123 Bensham Lane', address3 = 'Thornton Heath', postcode = 'CR7 7EW', skill = 'Aesthetician', notes = 'Website is www.drlailah.com. We are normally based in Essex but wanted to run a clinic day in South London where we live.
I will share that with Yasmeen and let her know to give you a call,

Lailah Kara-Newton daughter GMC 7564353 lailahkn@gmail.com', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '7564353', "keyCard" = '0000445365', "viewingDate" = '2025-06-27 00:00:00'::timestamp, "documentPackDate" = '2025-06-28 00:00:00'::timestamp, "documentReviewDate" = '2025-07-04 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-04 00:00:00'::timestamp, "keyGivenDate" = '2025-07-04 00:00:00'::timestamp, "depositInvoicedDate" = '2025-07-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Yasmeen Kara') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', notes = 'Please can you let me know if the rooms can be rented on a monthly basis and if so what would be the price?', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Gabor M') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '75a Melbury Gardens', address3 = 'London', postcode = 'SW20 0DL', skill = 'Aesthetics', notes = 'looking to hire a space to practice in. I am currently full time employed by the NHS and need a space to carry out my treatments in part time', "referredBy" = 'UKTR', "keyCard" = '0007957353', "viewingDate" = '2025-07-04 00:00:00'::timestamp, "documentPackDate" = '2025-07-07 00:00:00'::timestamp, "documentReviewDate" = '2025-07-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-08 00:00:00'::timestamp, "keyGivenDate" = '2025-07-08 00:00:00'::timestamp, "depositInvoicedDate" = '2025-07-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Katrina Edwards') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "viewingDate" = '2025-07-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Daniella Overton') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '99 Nelson Road', address3 = 'London', postcode = 'SW19 1HU', skill = 'Pyschotherapist', notes = 'interested in hiring a room by the hour on an ad hoc basis so am looking for flexible options. 

I am a fully qualified psychotherapist/counsellor and would use the room for talking therapy only. My website for your information is: 
www.opengatecounselling.com', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '379243', "keyCard" = '0000713697', "viewingDate" = '2025-07-08 00:00:00'::timestamp, "documentPackDate" = '2025-07-08 00:00:00'::timestamp, "documentReviewDate" = '2025-07-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-08 00:00:00'::timestamp, "keyGivenDate" = '2025-07-08 00:00:00'::timestamp, "depositInvoicedDate" = '2025-07-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Nilufar Rahim') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '12 Beaconsfield Road', address3 = 'Surbiton', postcode = 'KT5 9AP', skill = 'Physiotherpaist', notes = 'local physiotherapy clinic and our Kingston site is scheduled to be refurbished from the 21st July until early September.', "referredBy" = 'Website', "viewingDate" = '2025-07-10 00:00:00'::timestamp, "documentPackDate" = '2025-07-10 00:00:00'::timestamp, "documentReviewDate" = '2025-07-14 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-07-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Andreas Chavez Kenny') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Spinal Energetics, Spinal Flow & Reiki', "referredBy" = 'Website', "viewingDate" = '2025-07-30 00:00:00'::timestamp, "documentPackDate" = '2025-07-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sharon George') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'looking for a therapy room for hire by the hour to hold communication sessions for non speakers. Room to hold 3+ people.', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Melissa Stevenson') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '29 Embercourt Road', address3 = 'Thames Ditton', postcode = 'KT7 0LG', notes = 'I am beginning my private practice as a trainee therapist and I would be interested in hiring the room in Surbiton. I wondered what kind of availability you have for the rooms and how I can check this when booking in clients, is there much space generally?

: https://psychotherapy.my.site.com/s/searchdirectory?id=a3VTl0000001WIn', "referredBy" = 'Website', "accreditationBody" = 'UKCP', "accreditationNumber" = '2011167781', "keyCard" = '0000427033', "viewingDate" = '2025-11-26 00:00:00'::timestamp, "documentPackDate" = '2025-11-26 00:00:00'::timestamp, "documentReviewDate" = '2025-11-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-11-27 00:00:00'::timestamp, "keyGivenDate" = '2025-11-28 00:00:00'::timestamp, "depositInvoicedDate" = '2025-11-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ben Titheridge') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '28 Melrose Road', address3 = 'London', postcode = 'SW19 3HG', skill = 'Massage', notes = 'Estonian

Hi. I would like to make bookings few times a month for about 4-5 hours. How that works?

Val_ema@yahoo.co.uk?', "referredBy" = 'Website', "accreditationBody" = 'CThA', "keyCard" = '0000683498', "viewingDate" = '2026-02-06 00:00:00'::timestamp, "documentPackDate" = '2026-02-07 00:00:00'::timestamp, "documentReviewDate" = '2026-02-08 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-02-08 00:00:00'::timestamp, "keyGivenDate" = '2026-02-06 00:00:00'::timestamp, "depositInvoicedDate" = '2026-02-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Valeria Sisova') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Hi I’m looking to take on a room for my fertility acupuncture business and I wondered if there is any space in Surbiton?
Many thanks
Hannah Pear', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Hannah Pearn') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Permanent Make Up', notes = 'charlottetaylorspm.co.uk', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Charlotte Taylor') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '26 Verona Drive', address3 = 'Surbiton', postcode = 'KT6 5AL', skill = 'Psychotherapist', notes = 'Child and Adolescent Psychoanalytic Psychotherapist. I work alongside Mehdi and Will at West London NHS Trust. I live in Surbiton and I am considering taking on some more private therapy work. 

Https://www.linkedin.com/in/pippa-watson-59a144297?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', "referredBy" = 'Website', "viewingDate" = '2025-09-11 00:00:00'::timestamp, "documentPackDate" = '2025-09-12 00:00:00'::timestamp, "documentReviewDate" = '2025-09-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-09-26 00:00:00'::timestamp, "keyGivenDate" = '2025-09-28 00:00:00'::timestamp, "depositInvoicedDate" = '2025-09-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Pippa Watson') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Infant feeding and tongue tie management.', notes = 'I am interested in using the space once or twice a month. I run a CQC registered service that includes infant feeding and tongue tie management.

Look forward to hearing back from you soon.

Kind regards,
Janet', "referredBy" = 'Website', "viewingDate" = '2025-09-04 00:00:00'::timestamp, "documentPackDate" = '2025-09-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Janet Gold') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'cupping /  graston therapy', "referredBy" = 'UKTR', "viewingDate" = '2025-09-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Areeb Beg') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Lazy Moon L/7', address2 = 'Taggs Island', address3 = 'Hampton', postcode = 'TW12 2HA', skill = 'Psychotherapist', notes = 'KCP reg for 16 yrs, supervise and examine at Metanoia. I am looking for a cheerful easy space for my local sessions', "referredBy" = 'UKTR', "accreditationBody" = 'UKCP', "accreditationNumber" = '09160703', "viewingDate" = '2026-04-16 00:00:00'::timestamp, "documentPackDate" = '2026-04-17 00:00:00'::timestamp, "documentReviewDate" = '2026-04-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-04-19 00:00:00'::timestamp, "keyGivenDate" = '2026-06-18 00:00:00'::timestamp, "depositInvoicedDate" = '2026-06-01 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Michael Feat') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 9 Kelmscott House', address2 = '7 Abbey Road', address3 = 'Lodnon', postcode = 'SW19 2LZ', skill = 'Family Psychotherapist', notes = 'NOT PAID DEPOSIT - fob disabled 03/02/2026
Hello, I''m a local therapist and interested in using your rooms in South wimbledon, please let me know how to go about setting this up?
Many thanks
Gabi', "referredBy" = 'Website', "keyCard" = '0007955838', "viewingDate" = '2025-09-16 00:00:00'::timestamp, "documentPackDate" = '2025-09-16 00:00:00'::timestamp, "documentReviewDate" = '2025-09-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-09-25 00:00:00'::timestamp, "keyGivenDate" = '2025-09-16 00:00:00'::timestamp, "depositInvoicedDate" = '2025-09-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Gabi Schaper') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', notes = 'I''m a qualified counsellor, I''m contacting you to know about your rooms availability.
I''d appreciate you let me know when it is a good time to talk or visit.
Kind regards,
Eugenia', "referredBy" = 'Website', "viewingDate" = '2025-09-18 00:00:00'::timestamp, "documentPackDate" = '2025-09-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Eugenia Bonomi') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat B', address2 = '61 Clifton Park Avenue', address3 = 'London', postcode = 'SW20 8BB', skill = 'Play Therapist', notes = 'My name is Ellen Dempsey, and I am a recently qualifiedc (MA, University of Roehampton), due to be fully accredited by the British Association of Play Therapists (BAPT) in the coming weeks.

I am currently looking into suitable spaces to begin offering private play therapy sessions and would be very interested in learning more about the availability, facilities, and rates for room hire at your South Wimbledon venue over the coming months.

I would be grateful if you could let me know whether this is something you are currently offering, and if so, whether it might be possible to arrange a visit or phone call to discuss further.

Thank you in advance for your time, and I look forward to hearing from you.

Kind regards,
Ellen Dempsey
Play Therapist (MA, Roehampton)

07907485014', "referredBy" = 'Website', "accreditationBody" = 'BAPT', "accreditationNumber" = '1738', "keyCard" = '0008095224', "viewingDate" = '2025-09-22 00:00:00'::timestamp, "documentPackDate" = '2025-10-28 00:00:00'::timestamp, "documentReviewDate" = '2025-10-30 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-10-30 00:00:00'::timestamp, "keyGivenDate" = '2025-10-30 00:00:00'::timestamp, "depositInvoicedDate" = '2025-10-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ellen Dempsey') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 19 Disraeli House', address2 = '3 Breakspear Gardens', address3 = 'London', postcode = 'SW19 2FP', skill = 'Birth and Postnatal Doula', notes = 'Birth and Postnatal Doula, Baby massage instructor and Infant feeding specialist for the NHS.

I am currently training in Biodynamic Craniosacral Therapy and am looking for a space to treat a handful of clients I have lined up to support my training.

I have already seen the space as I have visited another practitioner in your spaces.

Please let me know if you have availability for me to book a block of hours one or two days a week. According to your availability.

Failed DD 17/11/2025', "referredBy" = 'UKTR', "keyCard" = '0000006878', "documentPackDate" = '2025-09-17 00:00:00'::timestamp, "documentReviewDate" = '2025-09-18 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-09-18 00:00:00'::timestamp, "keyGivenDate" = '2025-09-19 00:00:00'::timestamp, "depositInvoicedDate" = '2025-09-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sabira Camp') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '4 Haven Court', address2 = 'Berrylands', address3 = 'Surbiton', postcode = 'KT5 8JF', skill = 'Counseller', notes = 'interested in renting a room for counselling in Surbiton. Could you let me know your room rental price and if there is a minimum booking? Many thanks,', "referredBy" = 'Website', "viewingDate" = '2025-09-27 00:00:00'::timestamp, "documentPackDate" = '2025-09-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Emma Rowlands') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Remedial Soft Tissue Therapist, Sports Therapsit', notes = 'Remedial Soft Tissue Therapist, Pranic Healer, Reflexologist, **Holistic*
*& **Sports Massage Therapist, and Spiritual & Meditation Guide Therapist.*



Registered Member of the Institute for Soft Tissue Therapists / ISRM and
the Federation of Holistic Therapists / FHT

*Phone:* +447716498484
*Email:* hhs.uk.com@gmail.com
*Website:* www.holistichealingsolution.co.uk', "referredBy" = 'UKTR', "viewingDate" = '2025-09-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alessandro Mancini') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '57 Ellesmere Drive', address3 = 'South Croydon', postcode = 'CR2 9EL', skill = 'Audiologist', "referredBy" = 'UKTR', "keyCard" = '0000682693', "viewingDate" = '2025-10-12 00:00:00'::timestamp, "documentPackDate" = '2025-10-13 00:00:00'::timestamp, "documentReviewDate" = '2025-10-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-10-27 00:00:00'::timestamp, "keyGivenDate" = '2025-10-27 00:00:00'::timestamp, "depositInvoicedDate" = '2025-10-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Karishma Tanna') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychologist', notes = 'nterested in booking a room at 6pm on Tuesdays for 1 hour starting in September. Do you have any availability for that?', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Jay Solanki') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Lavender Cottage', address2 = 'Summerfield Lane', address3 = 'Long Ditton', postcode = 'KT6 5DZ', skill = 'Massage Therapist, Reiki', notes = 'currently looking for therapy rooms to rent in and around Surbiton. I am a fully qualified and insured Massage Therapist (with an ITEC Level 3 Diploma in Body Massage from St Mary''s University) and Level 2 Reiki Practitioner. At the moment, I have mostly been looking to rent rooms ad-hoc for when I have clients (as I am newly qualified and still building my client base). I would be keen to view the room in person and find out more about how the booking system works.
Georgina Letitia Pike
Lavender Cottage
Summerfield Lane
Long Ditton
Surbiton', "referredBy" = 'Website', "accreditationBody" = 'FHT', "accreditationNumber" = '222567', "viewingDate" = '2025-10-16 00:00:00'::timestamp, "documentPackDate" = '2025-10-17 00:00:00'::timestamp, "documentReviewDate" = '2025-10-27 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-10-27 00:00:00'::timestamp, "keyGivenDate" = '2025-10-28 00:00:00'::timestamp, "depositInvoicedDate" = '2025-10-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Georgie Pike') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Ground Floor Flat', address2 = '99 Boundary Road', address3 = 'London', postcode = 'SW19 2DE', notes = 'looking for space to hire for psychotherapy clients and would like to book a time to view your spaces please. Thank you.
T: 07888 676 253
E: geneengraypsychotherapy@outlook.com
W: https://www.geneengray.co.uk/

Dr Johannah Gray', "referredBy" = 'Website', "accreditationBody" = 'UKCP', "accreditationNumber" = '2011167368', "keyCard" = '0000723874', "viewingDate" = '2025-10-29 00:00:00'::timestamp, "documentPackDate" = '2025-11-04 00:00:00'::timestamp, "documentReviewDate" = '2025-11-07 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2025-11-07 00:00:00'::timestamp, "keyGivenDate" = '2025-11-08 00:00:00'::timestamp, "depositInvoicedDate" = '2025-11-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Geneen Gray') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '25 Neville Road', address3 = 'Kingston Upon Thames', postcode = 'KT1 3QX', skill = 'Counsellor', "referredBy" = 'UKTR', "accreditationBody" = 'BACP', "accreditationNumber" = '416420', "viewingDate" = '2026-01-10 00:00:00'::timestamp, "documentPackDate" = '2026-01-10 00:00:00'::timestamp, "documentReviewDate" = '2026-01-11 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-01-11 00:00:00'::timestamp, "keyGivenDate" = '2026-01-16 00:00:00'::timestamp, "depositInvoicedDate" = '2026-01-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Chiara Di Rienzo') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '476 Kingston Road', address3 = 'London', postcode = 'SW20 8DX', skill = 'Acupuncture', notes = 'newly qualified in acupuncture and  looking for a room to rent in the near future. Would I be able to book an appointment to view the space and going forward how do I book the space on an adhoc basis', "referredBy" = 'UKTR', "accreditationBody" = 'BAcC', "keyCard" = '0000691392', "viewingDate" = '2025-11-07 00:00:00'::timestamp, "documentPackDate" = '2025-11-08 00:00:00'::timestamp, "documentReviewDate" = '2026-03-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-20 00:00:00'::timestamp, "keyGivenDate" = '2026-03-27 00:00:00'::timestamp, "depositInvoicedDate" = '2026-03-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Terri Claire Paterson') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Found a place in Wimbledon

Interested in a space for counselling services 

How close are you to the tube? 

Many thanks
Gemma', "referredBy" = 'Website', "viewingDate" = '2025-11-25 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Gemma Klein') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Laura Tilson Osteopathy', skill = 'Osteopath', notes = 'Please can I arrange for Tefeshet (copied in) to get a key fob and sign your agreement to take over from Maddy''s shift in South Wimbledon in the clinic from 23rd dec?

Therapy room at Fresh Ground 
68 Battersea Rise 
London 
SW11 1EQ', "referredBy" = 'Friend', "keyCard" = '0008140711', "documentPackDate" = '2025-11-20 00:00:00'::timestamp, "keyGivenDate" = '2025-11-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Tefeshet Yohannes') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherpist', notes = 'I live in Surbiton and I am a qualified counsellor and psychotherpist. I am looking for a room where I can see clients for private practice. Also, I am a professor at Kingston University and your space is far enough away from the university for it to offer essential boundaries. Thank you so much. Warmly, Kay', "referredBy" = 'Website', "viewingDate" = '2025-12-04 00:00:00'::timestamp, "documentPackDate" = '2025-12-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Kay Peggs') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'I’m interested in a room on Tuesday evening. What time do you close?', "referredBy" = 'Website', "documentPackDate" = '2025-12-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Tom Nation') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '29A Surrey Grove', address3 = 'Sutton', postcode = 'SM1 3PW', skill = 'Tongue Tie Clinic', notes = 'I would be interested in hiring your space for a pop up clinic that I’ll be running over the next view months. I am a midwife and tongue tie practitioner, and I run a donation centre for families to support with tongue tie and oral dysfunction. My website is www.thetonguetiecentre.org for more information about my services. 



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMRhI1AQqw3p0-2FNOW0gHHRBUMsBA5ucqV-2BmZAdfChlo-2BvG3vnNNCqY24DWxsgcz3hjesEtd-2B3sKGF2J7DflwL-2BEFSh4X9B3-2BswJOwiwFpEejTKmordySeMmsvkJLHf0LUnTlCXgYPHki1QOW7-2FWpJ5x3vfOmTtDUyTMdmNBKojICy0E-2FwwaN3hfp0gkC0XBSqnw-3D>', "referredBy" = 'Website', "accreditationBody" = 'NMC', "keyCard" = '0003875621', "viewingDate" = '2026-01-09 00:00:00'::timestamp, "documentPackDate" = '2026-01-10 00:00:00'::timestamp, "documentReviewDate" = '2026-01-22 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-01-22 00:00:00'::timestamp, "keyGivenDate" = '2026-01-22 00:00:00'::timestamp, "depositInvoicedDate" = '2026-01-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Carmelle Gentle') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage', notes = 'plan on opening a massage business. I am looking for a salon in the local area which has a room available to rent, so I can set up my business there. I understand you might have a room available? If so, please do call me on 07766 055387 or my wife Liz on 07733 397032 to discuss it.

I have over 15 years experience working in massage therapy, an NVQ Level 3 in Massage Therapy and an excellent reputation with my clients. I am experienced in Swedish massage, deep tissue massage, Balinese relaxing massage, hot stone massage, reflexology, scrub and facial massage.


 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMT37LDNQlywJsPLUt8aLkYo4AXZqxlcVYWJmmwA-2BxlhVFNuPOYPZe7OI36UHU0e3Fd-2Fa8YqQ4Auxv41OmWfvzF-2BoSh9EJHSmjNStmvTwmX1WPquU-2FLnJhaznz559xy1LMyvhn4VjjKs6hNK8OWdPwIjQT0-2F5VHK7gmbrZB736nnrG7PJ0F40-2FM4srdQ2mENnns-3D>', "referredBy" = 'Website', "viewingDate" = '2026-01-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Ketut Tegeh') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '82 Denison Road', address3 = 'London', postcode = 'SW19 2DH', skill = 'Psychotherapist', notes = 'qualified psychotherapist looking for a room to hire for my private practice. I am interested in your space and would like the chance to look around and get more information about how you work.

Kind regards,
Simona



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMT3mvBa9Jl2heli-2B5be0etS5l5juJFUTZfbs5I6gR42lDnAnpp-2BQvAfdfvrJNEQnsBWMM3QYVssdSMLd9mRqPT3OsNK4UatxgV8HXpT6n1qBrWSopYw9XMhtDInqX4y2sq8-2FbVqLJa8zrmHHFxCTpZbI7XlsYbWwmKhc9hrE-2B9adut8w2AqN1X00QbAUfIXpx0-3D>', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '416050', "keyCard" = '0004037870', "viewingDate" = '2026-01-14 00:00:00'::timestamp, "documentPackDate" = '2026-01-14 00:00:00'::timestamp, "documentReviewDate" = '2026-01-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-01-20 00:00:00'::timestamp, "keyGivenDate" = '2026-01-14 00:00:00'::timestamp, "depositInvoicedDate" = '2026-01-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Simona Ahmed') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '10 Burlington Gate', address2 = '91 Chadwick Place', address3 = 'Surbiton', postcode = 'KT6 5RR', skill = 'Psychotherapist', notes = 'Hi, I would like to rent one of your speaking therapy rooms on an hourly basis please. Please let me know how it works and how quickly I can rent it out. Many thanks, Anastasia 

winterflower24@gmail.com
https://www.hcpc-uk.org/check-the-register/professional-registration-detail/?query=PYL34462&profession=PYL


 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMRgzhcox4IrEBRahv5y142G5M8NU8aD2yzx1ky3BOiSM7YtVSQBbxrndXc1EUX3-2BkLZ7gEdhGEWwTauIYXmtEIdre6R22wL0p41ZSs1mWgmENicuCNo4oRba-2FBuYMoJWMyI0DZITMpqHuYmEzWa9JQkziKodEDp930Q-2Bvkr3AORBbKUuFzv1B5Kd-2BaMHtcsZK0-3D>', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL34462', "documentPackDate" = '2026-01-12 00:00:00'::timestamp, "documentReviewDate" = '2026-01-13 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-01-13 00:00:00'::timestamp, "keyGivenDate" = '2026-01-16 00:00:00'::timestamp, "depositInvoicedDate" = '2026-01-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Anastasia Volkova') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath', notes = 'looking for big blocks in SWIM', "referredBy" = 'Website', "viewingDate" = '2026-01-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Yan Kei Man') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 9', address2 = '37 The Avenue', address3 = 'Surbiton', postcode = 'KT5 8JN', skill = 'Clinical Psychologist', notes = 'recently came across your therapy rooms and spoke with one of the practitioners working there, who kindly gave me your contact details.
My name is Monika, and I am a clinical psychologist currently looking to rent a room in Surbiton. Initially, I am seeking an ad-hoc arrangement, with the intention of increasing my hours from March.
I was wondering whether you currently have availability at 6:00 PM on Mondays and Tuesdays for 1 hour. I would also be grateful if you could let me know what availability looks like on Saturdays.
Finally, could you please confirm your current rental rates?
Thank you very much in advance. I look forward to hearing from you.
Kind regards,
Monika



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMSPGLH4bE3T1LwakSFTPHWXnMo2Iq0tl0XRsa08v3aoR02cZCG6RpFRVLb7QwsNiNnbqzL9hF-2B0TUC208jR2tGRlnZU4Q8zgfASqnHdkOKACwF8-2FTNoss3auUkMvEkBAOY-2FN9je45-2BicoMLZlCCuM7NtnTsWnTvh6Pc0j4LVNdwnIf7aCxMq4FoZNHP0PbqGgU-3D>', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL044748', "viewingDate" = '2026-01-29 00:00:00'::timestamp, "documentPackDate" = '2026-01-27 00:00:00'::timestamp, "documentReviewDate" = '2026-02-03 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-02-03 00:00:00'::timestamp, "keyGivenDate" = '2026-02-03 00:00:00'::timestamp, "depositInvoicedDate" = '2026-02-03 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Monika Luksaite') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '42 Saxon Drive', address3 = 'London', postcode = 'W3 0NR', skill = 'Beautician', notes = 'looking for a room to rent for a cosmetologist for two days a week, all day long.



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMSxJxr1zM1eE6uW2D219DNX00NrQ-2Bi-2FIL0sLa5pnNToY1Dd9hGYG5pLCAcYxsswb8vGjZnLsLPmeHMGOIshEc8pE0oMFhpjpP0U8u7ww21lYIROeQtFzawXmGWvdtZCdSdGtZaXnlsBvwWJSj4lpRv0x1ot9-2FPLP9E0SDMxgWYrmk7-2B5nSYyepo7iH8GrXDIto-3D>', "referredBy" = 'Website', "keyCard" = '0011679033', "viewingDate" = '2026-03-10 00:00:00'::timestamp, "documentPackDate" = '2026-03-11 00:00:00'::timestamp, "documentReviewDate" = '2026-03-14 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-14 00:00:00'::timestamp, "keyGivenDate" = '2026-03-16 00:00:00'::timestamp, "depositInvoicedDate" = '2026-03-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Maja Wilinska') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Permanent Makeup', "referredBy" = 'UKTR', "viewingDate" = '2026-01-26 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Yadah Thompson') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '3A Oakwood Road', address3 = 'London', postcode = 'SW20 0PL', skill = 'Chiropractor', notes = 'a chiropractor that specializes in pregnancy and paediatrics 
2 fobs = Lauren Bright

was at 29 Ravensbury Terrace SW18 4RL


 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMT2Z3Krzv3wR80PI1839AP0FbLFvrNHsqgs0xoK8QZFdRdwd56GxeKs47IgoLVYQNvmXyFsWqtVeBJ6hbc736JoqSvzluZ9NX3cSgUbblcLbIQFx3fBZHApbO8npnv-2FNZH8l2ZmIzWMuKCA7LEAnkkM-2FE4rpenVRebNzc7RHJkScMGw2G-2BohK6ctZnSSwfclsM-3D>', "referredBy" = 'Website', "accreditationBody" = 'GCC', "accreditationNumber" = '05372', "keyCard" = '0000040777/0000064860', "viewingDate" = '2026-02-12 00:00:00'::timestamp, "documentPackDate" = '2026-02-28 00:00:00'::timestamp, "documentReviewDate" = '2026-03-10 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-10 00:00:00'::timestamp, "keyGivenDate" = '2026-03-12 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Thriya Pillay') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Apartment 118 Wimbledon Central', address2 = '21-33 Worple Road', address3 = 'London', postcode = 'SW19 4BG', skill = 'Aesthetics', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '7595211', "keyCard" = '0000462844', "viewingDate" = '2026-01-30 00:00:00'::timestamp, "documentPackDate" = '2026-01-30 00:00:00'::timestamp, "documentReviewDate" = '2026-02-20 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-02-20 00:00:00'::timestamp, "keyGivenDate" = '2026-02-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Kaveetha Kandiah') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'GMC-registered medical doctor. I would like to hire your room for dermal filler and Botox procedures. Could you please let me know if it is available on Saturdays?', "accreditationBody" = 'GMC', "accreditationNumber" = '7787583' WHERE LOWER(name) = LOWER('Rumeysa Nur Bulut') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', notes = 'I am a Physiotherapist and am looking for a treatment room that I can rent primarily on a Wednesday afternoon. How can I get more information on your system works?



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQQ9BQza1O827QXU3N3CViSAhmwjgzgw7tYc0uXBt9fMIHL2GJRqmWYVjJ49WEu3XUpDJ13L5XVcpel1kJHSdICFtxR4VacILavgUgDYu05Ii0E-2B5YgYemE9mhCoLe6pPPx9uyrDOFulnDWavx6jIP1MiqsW-2BL4eRTa-2FxyNLm977INXz0Rt1rGjBlxWG4ND-2BSU-3D>', "referredBy" = 'Website', "viewingDate" = '2026-02-04 00:00:00'::timestamp, "documentPackDate" = '2026-02-04 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Caroline Fourie') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Phtsiotherapist', "viewingDate" = '2026-02-02 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sachin Parab') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', notes = 'physiotherapist looking to see a client who''s Wimbledon-based, & would be keen to see your availability to rent out a therapy room for an hour, if you have availability this week (afternoon/evenings)?

Thank you,
Timi



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQBwSS8GXh5Ica27OtCyLZfrPGPAWVJg5Zq4t-2FV-2F3R28Yug0EKHIvbTnnl6CMDqpp8dbIov-2Ff-2BtQrOnj-2BpdOmN5LWlF86bgj8Qdy5xvEf3kvaZ1Iy81Rw0uza5hDgM21UJfYFTCTggFezryccTp2vrUvGpX-2FvvxCmbIVs8SGkr5snGmZ0NsEIVvCZBQ3vXGk4E-3D>', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Timi Odofin') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Massage Therapy', notes = '??? Maty be valeria sisova', "referredBy" = 'UKTR', "viewingDate" = '2026-02-06 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Maria Isova') AND role = 'THERAPIST';
UPDATE "User" SET address2 = '96 Brighton Road', address3 = 'Surbiton', postcode = 'KT6 5PP', skill = 'Psychologist', notes = 'Psychologist looking for a therapy room in Surbiton. 
Please could you let me know if you have as hoc availability and your rates.
I mostly work with couples 5 Plato Place, 72-74 St Dionis Road, London, SW6 4TU,', "referredBy" = 'Website', "accreditationBody" = 'HCPC', "accreditationNumber" = 'PYL039647', "viewingDate" = '2026-02-12 00:00:00'::timestamp, "documentPackDate" = '2026-02-12 00:00:00'::timestamp, "documentReviewDate" = '2026-02-16 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-02-16 00:00:00'::timestamp, "keyGivenDate" = '2026-02-16 00:00:00'::timestamp, "depositInvoicedDate" = '2026-02-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Carol Dixon') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '9 Kings Court', address2 = 'Deer Park Close', address3 = 'Kingston Upon Thames', postcode = 'KT2 7RJ', skill = 'Hypnotherapist', notes = 'I was given your details by Georgie Pike, who highly recommended your therapy rooms.

I’m a fully qualified  and trauma-informed coach, and have practised for many years, including previously on South Molton Street and Harley Street. I took a break over the past 18 months due to a long-term health condition, and I’m now preparing to return to practice.

I’m looking for a local space where I can begin seeing a small number of clients as I steadily rebuild my client base, and I have a client ready to book within the next week or so.

If you currently have availability for new therapists, I’d really appreciate it if you could get in touch for a brief chat.

Many thanks, and I look forward to hearing from you.

Best wishes,




 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMTRT-2FZZkMzje-2FYlsIwRI-2BBxEcgQNEzOtOWiBqfajWelffvjUlp75RNkqDwuIT5hzMsAxZVFG-2FFDxLlMT-2Fc-2FCqd7Wcvtha0TqeRVejvCNBcXCWyUjDYYhVGfiE-2FnPU7f1mRjM2Ra2HOWxLfdwxkLJeUvm3MzmZbbF333v2AlQhpRqNTDWM-2Fm0IJHYSYCIIjlp4c-3D>', "referredBy" = 'Website', "accreditationBody" = 'GHR', "accreditationNumber" = '3848', "viewingDate" = '2026-02-16 00:00:00'::timestamp, "documentPackDate" = '2026-02-16 00:00:00'::timestamp, "documentReviewDate" = '2026-03-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-26 00:00:00'::timestamp, "keyGivenDate" = '2026-03-27 00:00:00'::timestamp, "depositInvoicedDate" = '2026-03-27 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Katie Glen') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '125 Elm Walk', address3 = 'London', postcode = 'SW20 9EF', skill = 'Aesthetician', notes = 'looking for a long-term space to run my aesthetic clinic from.
I wonder if you have availability on Tuesday or Thursday please?

Dr Satpal Kaur Alg

SG Alg ltd', "referredBy" = 'UKTR', "accreditationBody" = 'GMC', "accreditationNumber" = '7265646', "keyCard" = '0000009946', "viewingDate" = '2026-02-20 00:00:00'::timestamp, "documentPackDate" = '2026-04-29 00:00:00'::timestamp, "documentReviewDate" = '2026-02-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-02-19 00:00:00'::timestamp, "keyGivenDate" = '2026-02-21 00:00:00'::timestamp, "depositInvoicedDate" = '2026-02-21 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Satpal Chaggar') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '6 Brickfield Road', address3 = 'Mitcham', postcode = 'CR4 3GN', county = 'Surrey', skill = 'Aesthetician', notes = 'Hi, I’m interested to rent on daily/hourly basis beauty room. I would like to see the rooms available 

My whatsapp nr: 07511692262
  Kind regards

Mrs Claudia Ioana Uglea / Kibra?', "referredBy" = 'UKTR', "viewingDate" = '2026-02-23 00:00:00'::timestamp, "documentPackDate" = '2026-02-23 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Claudia Oprea') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Top Floor Flat', address2 = 'Hexagon House', address3 = 'Surbiton', postcode = 'KT6 4TS', skill = 'Counsellor', notes = 'Good morning
I''m a counsellor working mainly online, but I occasionally have face-to-face requests.
For this reason I''m looking for a pay-as-you-go counselling room in Surbiton.
Your location is suitable.
Do you have an information pack and may I come and view the facility?
Best regards
Luisa



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMRIkbNzcLLP51RyNZjvEv29uQ1TYG7OrGbtumOA5ghSIWvqr9wIwex3ESxzQpaZvBdu-2BeP2OIjjFsUB04XzT5SHz96mnBs9LZKvizy5MHrXXUtsgx-2BRg4T-2FM4OJdpRq7eQLj4BZyrxaofnJ8onRiFwbU1vHSM2Jt387XAdqqCs0sP73KlXmw1EbzhwhvkGaPcw-3D>', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '405555', "viewingDate" = '2026-03-14 00:00:00'::timestamp, "documentPackDate" = '2026-03-21 00:00:00'::timestamp, "documentReviewDate" = '2026-03-21 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-21 00:00:00'::timestamp, "keyGivenDate" = '2026-04-08 00:00:00'::timestamp, "depositInvoicedDate" = '2026-04-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Luisa Passalacqua') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '34 Eland Road', address3 = 'Croydon', postcode = 'CR0 4LG', county = 'Surrey', skill = 'Counsellor', notes = 'interested in renting a room for therapy at your Wimbledon space. Please could you share more info if anything is available and next steps.





 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQe9DRpfZwRP2Kqd0601oi7EQYdyKthpR9uYqFKbjncs-2Bu0J3NRTrPeKEpQ06lw7XQO6kNa3FAF31UjcrdWbnH1fgpaYnxPOt7tGxC3lhCUGJUGPWoeRcP-2FokRzzsVq-2BhRXKE1yYfPoDDaOXzCNahQJyI3JlhA7VffWfH9ISiOHs5COClEP8VZKELNy0xEAxo8-3D>', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '416789', "keyCard" = '0000018161', "viewingDate" = '2026-03-16 00:00:00'::timestamp, "documentPackDate" = '2026-03-16 00:00:00'::timestamp, "documentReviewDate" = '2026-03-16 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-16 00:00:00'::timestamp, "keyGivenDate" = '2026-03-16 00:00:00'::timestamp, "depositInvoicedDate" = '2026-03-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Max Fedyk') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'Dental Beauty and Aesthetics Lotd', address1 = '62 Westleigh Avenue', address3 = 'London', postcode = 'SW15 6XF', skill = 'Aesthetician', notes = 'Dental Nurse at Putney Dental & Implant Centre
353 Upper Richmond Rd
London SW15 5QJ', "referredBy" = 'UKTR', "accreditationBody" = 'GDC', "accreditationNumber" = '263185', "keyCard" = '0000079251', "viewingDate" = '2026-03-21 00:00:00'::timestamp, "documentPackDate" = '2026-03-21 00:00:00'::timestamp, "documentReviewDate" = '2026-05-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-05-15 00:00:00'::timestamp, "keyGivenDate" = '2026-05-20 00:00:00'::timestamp, "depositInvoicedDate" = '2026-05-23 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Karolina Domagala') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Chiroprator', notes = 'workd with Thriya Pillay <info@bumpandbeyondclinic.co.uk>', "referredBy" = 'Friend', "documentPackDate" = '2026-03-18 00:00:00'::timestamp, "documentReviewDate" = '2026-03-18 00:00:00'::timestamp, "keyGivenDate" = '2026-03-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Lauren Bright') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '10 Ferry Road', address3 = 'Thames Ditton', postcode = 'KT7 0XZ', notes = 'Hi, I have an energy healing practice. I am looking for a therapy room, that I can rent by the hour for in-person sessions. Do you have availability? I''m free on the phone number listed above if easier to discuss over the phone. Many thanks, Matthew.

26/03/2026 no STL required as not hands on



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQN3IEYGvq8onQTmJ8Qe61kBxg7NhwB-2FF9PcpjgFefPnTjldRbIjmPZrf0CZRjTjqdBYRFX-2BhYnE0tmXmIq4J3s3W-2F3LFsHLumsk3rdJCmT4-2Fnn-2BXwQHoF8BYO4wsYy5SLuoCpWUZ8RubMhVhRH9bFHyPyfuHYJdDrJAEOeM3CKTQbsCjgOXUMdT5LZj7vIWhg-3D>', "referredBy" = 'Website', "viewingDate" = '2026-03-24 00:00:00'::timestamp, "documentPackDate" = '2026-03-24 00:00:00'::timestamp, "documentReviewDate" = '2026-03-26 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-03-26 00:00:00'::timestamp, "keyGivenDate" = '2026-04-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Matthew Reilly') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'I am interested to rent a room for physiotherapy clinic on Saturdays starting from 18 of April. 
Please contact me if available. 
Thanks 



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMR9usw-2FVX4ZnfZBGOheiICzJwWWljShT5Nij9MgmpBPGE-2BDsiXfa0l0DmSIh9-2BJKzwxTpMOJYQQ5s369idRPQMF1PsQCc5GCv1jbgayZ9ct20ki-2FX6-2BSlW1FQG1XAax4FURsZ0ZNgIrb-2Biq4-2BouxQwzxFFI15dxdGrEQ0qKpybgEiFGnZ7JzORTE0JQKPi6rXI-3D>', "referredBy" = 'Website', "viewingDate" = '2026-03-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Heba Elsayed') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'I am writing to inquire about booking therapy sessions at your South Wimbledon location. I am a qualified and registered Hypnotherapist and also a Spiritual Realignment Healing practitioner, and I am looking for a professional space to host my face-to-face sessions.

I have already reviewed the pricing on your website, and I would appreciate some clarity on your administrative process:

1. The Booking Process: What are the initial steps to get started? Is there an online portal, or do bookings go through an intake coordinator?

2. Compliance & Onboarding: What documentation do you require (e.g., proof of insurance, professional body membership, etc.), and how long does the verification process typically take before I can make my first booking?

3. Booking Logistics: Is there a minimum notice period required for bookings, and what is your policy regarding cancellations?

I look forward to hearing from you and potentially joining your community of practitioners.

Best regards,
Mano



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMTlg5pgVsSdY1MNHEa0yZ6eIUIQuYbtiO42rs5ApZdqIbeB4KzV7I2pcP9hObvmqEajxpHUdK5nNjwQAfYUnP03aHeTB8Jzou-2FvX1WE8g8MyaIitJ88i3m5N3vR3b5228Ia3HkRA2fWHX5RS-2FhwWJb-2FXCcZvlabjNFBUhGDhDVJicF6O4rC3Eml6JLiF0nAKxc-3D>', "referredBy" = 'Website', "viewingDate" = '2026-04-08 00:00:00'::timestamp, "documentPackDate" = '2026-04-08 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Manorath Joshi') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '12 Old Church Road', address3 = 'London', postcode = 'E1 0QA', skill = 'Psychotherapist', notes = 'I’m looking for some ad hoc room rental on either Tuesday afternoons and evenings (preferred) or Mondays in South Wimbledon. I was wondering if you had any available space and if I could arrange to come and visit?



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMSmN6zH7wdAsj1QWA74GTGi88aZQwNAdVt6hCw4pPeOILTTNU0IhaG10iSurPOLClBQrNrdscgvpH6QrqJCeeDBlEpkKUj7seuD92gj8-2BFjNu5jwVqorwbHIGVx1qdAi03SHx-2B6M52mz343PM-2BqTS0-2F3kCqJe4MEXMTLHZEE5Z-2BTA0GNYGwKKqn3ydfjvG1L4A-3D>', "referredBy" = 'Website', "accreditationBody" = 'APHP', "accreditationNumber" = 'APHP-00153-74117', "viewingDate" = '2026-04-14 00:00:00'::timestamp, "documentPackDate" = '2026-04-08 00:00:00'::timestamp, "documentReviewDate" = '2026-04-13 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-04-13 00:00:00'::timestamp, "keyGivenDate" = '2026-04-14 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Abbey Robb') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', notes = 'Hi,

I''m looking to rent therapy space in Wimbledon on an hourly basis to start off with. Please could you send me some more information and perhaps I could arrange to come and view your rooms? 

Best wishes,

Sanna



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQbwfphdLvjcE6-2BgpTJGNsm4GaICyfOB3QWe-2FiH-2FKIvw-2Fm8AiJD0-2B75CwGaVMtiReuYBb1QyB-2BXRT-2BUf0gZsko9tki5dik-2F80v1gueCrPa9qeGqxKu6dRASR6uQXIk6ioCgQYXWFpvsTDqOel24lp93xL3FeNtVzQrWCN4WwYbZP6zukLsLCDyu6rogPoRfStI-3D>', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Sanna Wakefield') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', notes = 'I’m interested in a treatment room. Could you please let me know if it is available? Also, is it possible to rent it for a full month, and what would be the cost?', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Kate Tsikhanovich') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath', notes = 'Good evening, I was wondering if you have room availability for me to work at your Surbiton clinic? Ideally I would be looking at Mondays and Thursdays. I am a structural Osteopath and I work using manipulations, stretching, dry needling etc. I don’t think my treatment would conflict with Laura or Gaby’s. Please let me know. Kind regards. Andrew 



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQcA4jIMdqpR3IQ8QfQp8GvJpNt1afzkzKU9VqMsu-2F8VN0WdQf8YtXJTXk6czLd1hU-2Fncce9TpPM2xTLJuVxfDnMiRIH5SWxhpgn7sXIjMkA2GjZFvQSOXOqOPYmXM7WDcC4CUgLe9EpeKnZH0QLnWprZ22WEX67MMVcKu6dpPZlCXQb8Lj79Cphl7NQ34X2F4-3D>', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Andrew Graham') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist & Counsellor', notes = 'Hi! I am a therapist who has been in private practice for five years and am currently doing my level 7 at The Link Centre. I am interested in your therapy rooms and to find out if your model includes you match clients to therapists also as part of a monthly rental fee. 

Warm Wishes,
Amber



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQ6F-2BbTQfMvGk-2BrNCOCKjoAn0Bxh9b0MX7rfLfpjFQVnSHWaZdhFPDyX7afuydzK-2FIoWntH2gEE1YolhQI24I4sG8KKn6wbHt0C4fEIMLTbyWQ8RItHrcqe6CZWl5pKA8eYsdahqbIBPF2YjzAQcOZf6JDICBw0e-2BN08VkTCZHK2NiByxQnHz748vT1ahM36wo-3D>', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Amber Raine') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Counsellor', notes = 'Thanks so much for your time in showing me your therapy rooms last Thursday evening. It was lovely to meet you.

Whilst I love the rooms, for this particular client I feel that the other option I viewed is better suited, so I’m going to go with that on this occasion. However, if it’s ok with you I will keep hold of your details and certainly get back in touch if I have further requests for face-to-face sessions. As I mentioned to you, it’s something I’m looking to get back to if demand increases.', "referredBy" = 'UKTR', "viewingDate" = '2026-04-23 00:00:00'::timestamp, "documentPackDate" = '2026-04-24 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Julie Sherman') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '104 Glen Albyn Road', address3 = 'London', postcode = 'SW19 6HE', skill = 'Craniosacral Therapist', notes = 'Hi Peter. The rooms are looking nice. How your booking processes looks like?
RCST?

info@craniosacralharmony.co.uk
Monika Andrzejewska <andrzejewska20@gmail.com>', "referredBy" = 'UKTR', "keyCard" = '0008132331', "viewingDate" = '2026-04-24 00:00:00'::timestamp, "documentPackDate" = '2026-04-27 00:00:00'::timestamp, "documentReviewDate" = '2026-04-29 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-04-29 00:00:00'::timestamp, "keyGivenDate" = '2026-04-24 00:00:00'::timestamp, "depositInvoicedDate" = '2026-04-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Monika Andrzejewska-Maczuga') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '30 Durnsford Road', address3 = 'London', postcode = 'SW19 8HQ', skill = 'Aesthetics', notes = 'I''ve seen your space and would love to pop by for a 5-minute viewing next week.
If it’s a good fit, I’m looking to book a 2-hour slot in about 2 weeks'' time.', "referredBy" = 'UKTR', "keyCard" = '0008107859', "viewingDate" = '2026-04-28 00:00:00'::timestamp, "documentPackDate" = '2026-04-29 00:00:00'::timestamp, "documentReviewDate" = '2026-05-12 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-05-12 00:00:00'::timestamp, "keyGivenDate" = '2026-04-28 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Valentina Zambrana') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', notes = 'would you please give me more info including the address and availability. I am looking for a room possibly in Sunday and mondays for half days.', "referredBy" = 'UKTR' WHERE LOWER(name) = LOWER('Nimal') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Microneedling', "referredBy" = 'UKTR', "viewingDate" = '2026-05-11 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Farnoush Gashtasebi') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', "referredBy" = 'UKTR', "keyCard" = '0008110865', "viewingDate" = '2026-06-20 00:00:00'::timestamp, "documentPackDate" = '2026-06-20 00:00:00'::timestamp, "keyGivenDate" = '2026-06-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Laura Aldridge') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'https://www.jenniferpirtle.com/

Hello - I am a UKCP psychotherapist possibly looking to take a room in Surbiton, ideally in a practice with other talking and manual therapy practitioners. 

Do you have availability currently (which days/times?) and do you have any photos of your talk therapy spaces? 

Many thanks
Jennifer 



 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMQRXWLE2fwYJiBBqsRowu7tt6TVdzo5rsUZ-2FhCwJV0oxuwslmNuvZ4YqvmgRKiTrbO10Ytb0mXoTRfcvtSnYgGDNIDgrMtGQjPJ4Igbp0-2BUAVXE49XzFFMty-2Fm-2F843MnIKpvS-2Feb6gZMvOLoTwOf1e1lOW3Syhmv98nm0-2Fuw13TlF5rzrv2eB2DLgD-2BQtTVnxM-3D>', "referredBy" = 'Website', "viewingDate" = '2026-05-18 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Jennifer Pirtle') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '75 Palmerston Road', address3 = 'London', postcode = 'SW19 1PB', notes = 'Hi there, through word of mouth I heard about therapy spaces and I’d love to come check it out. I’m a registered nurse doing aesthetics on the side - currently living in Wimbledon.

I’m a registered nurse and know Katrina Edwards 





 	 
 	 

 <http://click.promote.weebly.com/wf/open?upn=u001.tJgujkKJsqqiE7hhYCQqUHIo-2FX50qLbMLFGwJc2cqMSPnQWnUwylygpw5Cdjl4QUQzI2yV2knPmqVYydqMPZCS-2Fptb-2FNYQAmkf6ebEZMM00J8M6l4qOHc9PT1xmlKbu8GdwE1-2F-2Fj-2BTJsdGbI9KQ-2FRe0Nu4WWeK6bM-2FwSftjYpmGhVcm0o6N53rsA3uTsK2nMlCbA3q4uWHtLNcrzZf-2FKnzolVOv7kklP28VYGKJGBTU-3D>', "referredBy" = 'Website', "accreditationBody" = 'NMC', "keyCard" = '0000409588', "viewingDate" = '2026-06-22 00:00:00'::timestamp, "documentPackDate" = '2026-06-01 00:00:00'::timestamp, "documentReviewDate" = '2026-06-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-06-22 00:00:00'::timestamp, "keyGivenDate" = '2026-06-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Fiona O''Neill') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Physiotherapist', notes = 'Geraldine veronica Grey
One off booking', "referredBy" = 'UKTR', "keyCard" = '0000426936', "viewingDate" = '2026-05-15 00:00:00'::timestamp, "documentPackDate" = '2026-05-15 00:00:00'::timestamp, "documentReviewDate" = '2026-05-15 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-05-16 00:00:00'::timestamp, "keyGivenDate" = '2026-05-15 00:00:00'::timestamp, "depositInvoicedDate" = '2026-05-16 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Veronica Grey') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 26 Grafham House', address2 = '11  St Johns Road', address3 = 'New Malden', postcode = 'KT3 3FL', notes = 'Therapy type: Medical Aesthetics & Skincare
Booking type: Not sure yet

I am a nurse aesthetician and am looking for somewhere locally to where I live to see clients. Caroline Bletcher a dietician who uses the space recommended the space as we may also do some point work together', "referredBy" = 'Website', "viewingDate" = '2026-05-19 00:00:00'::timestamp, "documentPackDate" = '2026-05-19 00:00:00'::timestamp, "documentReviewDate" = '2026-05-23 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-05-23 00:00:00'::timestamp, "keyGivenDate" = '2026-05-30 00:00:00'::timestamp, "depositInvoicedDate" = '2026-05-30 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rebecca Kennedy') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Talking therapy', notes = 'Therapy type: Talking therapy
Booking type: Ad hoc sessions

Hi I would I love to come and view the rooms please.', "referredBy" = 'Website', "keyCard" = '0000392793', "viewingDate" = '2026-05-19 00:00:00'::timestamp, "documentPackDate" = '2026-05-19 00:00:00'::timestamp, "keyGivenDate" = '2026-05-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Sarah Kate Bradbury') AND role = 'THERAPIST';
UPDATE "User" SET notes = 'Therapy type: Psychotherapy
Booking type: Not sure yet

Thursday afternoons', "referredBy" = 'Website' WHERE LOWER(name) = LOWER('Sophie Lawton') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Nutritional Therapy', notes = 'Therapy type: Nutritional Therapy
Booking type: Ad hoc sessions

As I''m setting up my practice, I''m seeking a therapy room space for 1:1 consultation. It only requires chairs and possibly a desk.

Chrysantia Sukarno <tia@naturalitee.com>', "referredBy" = 'Website', "viewingDate" = '2026-05-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Tia Sukarno') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat C', address2 = '239-241 Kingston Road', address3 = 'London', postcode = 'SW19 3NW', skill = 'Lymphatic drainage massage', notes = 'Therapy type: Lymphatic drainage massage
Booking type: Ad hoc sessions

Hi there, I am interested in renting the room weekends. This is a new business so would need to know how flexible/ how far in advance bookings need to be made.', "referredBy" = 'Website', "keyCard" = '0008083448', "viewingDate" = '2026-05-29 00:00:00'::timestamp, "documentPackDate" = '2026-05-30 00:00:00'::timestamp, "documentReviewDate" = '2026-06-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-06-17 00:00:00'::timestamp, "keyGivenDate" = '2026-06-20 00:00:00'::timestamp, "depositInvoicedDate" = '2026-06-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Emily Earles-Barrett') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'RTT (Rapid Transformational Therapy)', notes = 'Therapy type: RTT (Rapid Transformational Therapy)
Booking type: Ad hoc sessions

Ad hoc evenings/weekends probably in 2 hour bookings. Please note I am about to qualify and currently doing room searches. Insurance/accreditation etc will follow before I start practicing.', "referredBy" = 'Website', "viewingDate" = '2026-05-28 00:00:00'::timestamp, "documentPackDate" = '2026-05-29 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Clare Elliott') AND role = 'THERAPIST';
UPDATE "User" SET address1 = '63 South Lane', address3 = 'New Malden', postcode = 'KT3 5HX', skill = 'Counselling', notes = 'Therapy type: Counselling
Booking type: Ad hoc sessions

Hi, I''m a qualified therapist looking for a room to hire by the hour for a client. I''m around this Saturday from 11.30am to view the room.', "referredBy" = 'Website', "accreditationBody" = 'BACP', "accreditationNumber" = '403353', "viewingDate" = '2026-06-18 00:00:00'::timestamp, "documentPackDate" = '2026-06-19 00:00:00'::timestamp, "documentReviewDate" = '2026-06-19 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-06-19 00:00:00'::timestamp, "keyGivenDate" = '2026-06-20 00:00:00'::timestamp, "depositInvoicedDate" = '2026-06-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Fabian Devlin') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Psychotherapist', "referredBy" = 'UKTR', "viewingDate" = '2026-05-31 00:00:00'::timestamp, "documentPackDate" = '2026-06-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('David Hopkins') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'IV Vitamins and asthetics', notes = 'Therapy type: IV Vitamins and asthetics
Booking type: Regular weekly block

refered to Simin

Hi l looking for a space where l can work 3 or 4 days a week , can l come and view the location today. Please give me a call at 07857934461', "referredBy" = 'Website', "viewingDate" = '2026-06-04 00:00:00'::timestamp, "documentPackDate" = '2026-06-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Muna Mohamoud') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Aesthetician', notes = 'I am both a medical doctor and an aesthetic practitioner, offering a range
of aesthetic medical treatments tailored to individual patient needs.

My services include:

- Dermal fillers
- Anti-wrinkle treatments
- Skin boosters
- Microneedling
- Platelet-Rich Plasma (PRP) therapy
- Other non-surgical aesthetic procedures aimed at skin rejuvenation and
facial enhancement', "keyCard" = '0008114376', "viewingDate" = '2026-06-05 00:00:00'::timestamp, "documentPackDate" = '2026-06-06 00:00:00'::timestamp, "keyGivenDate" = '2026-06-05 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Mamoona Riaz') AND role = 'THERAPIST';
UPDATE "User" SET address1 = 'Flat 2 Manor Court', address2 = 'Hemus Place', address3 = 'London', postcode = 'SW3 3TP', skill = 'Sports Massage Therapy', notes = 'Therapy type: Sports Massage Therapy
Booking type: Ad hoc sessions

Key to 43 Conway Road, Feltham, TW136TE. 

Hello, I am a level 3 sports massage therapist looking for a simple, fair sized space that fits a massage couch, client and myself. Sink preferred in the room but could do with shared sink. I am targeting to book initially on hourly basis then target atleast couple of 8 hour days between Tuesday-Friday according to clients needs. Thankyou.', "referredBy" = 'Website', "accreditationBody" = 'FHT', "accreditationNumber" = '223589', "keyCard" = '0008078674', "viewingDate" = '2026-06-04 00:00:00'::timestamp, "documentPackDate" = '2026-06-04 00:00:00'::timestamp, "documentReviewDate" = '2026-06-17 00:00:00'::timestamp, "bookingSystemInvitedAt" = '2026-06-17 00:00:00'::timestamp, "keyGivenDate" = '2026-06-04 00:00:00'::timestamp, "depositInvoicedDate" = '2026-06-17 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Rina Thapa') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'psychotherapy, EMDR, playtherapy, Theraplay, parent coaching', notes = 'Therapy type: psychotherapy, EMDR, playtherapy, Theraplay, parent coaching
Booking type: Regular weekly block', "referredBy" = 'Website', "viewingDate" = '2026-06-18 00:00:00'::timestamp, "documentPackDate" = '2026-06-19 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alix Diemont') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Osteopath', notes = 'I’m an osteopath, currently looking to set up in a new location and I love the look of your clinic space and room. 

Please could you let me know availability for the manual therapy room, particularly on Wednesdays and Thursdays?', "referredBy" = 'UKTR', "viewingDate" = '2026-06-19 00:00:00'::timestamp, "documentPackDate" = '2026-06-20 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Alexandra Holt') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Neuropsychology', notes = 'Therapy type: Neuropsychology
Booking type: Ad hoc sessions

I work in community neuropsychology and occassionally need rooms to conduct 1:1 therapy with clients', "referredBy" = 'Website', "documentPackDate" = '2026-06-22 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Samantha Carter-Allison') AND role = 'THERAPIST';
UPDATE "User" SET "companyName" = 'TCC', skill = 'Tongue Tie Clinic', notes = 'Insured: Aiyana Holistic Services Ltd
Address: 12 Hanover Road
LONDON
NW10 3DS', "referredBy" = 'Friend' WHERE LOWER(name) = LOWER('Aneeka William') AND role = 'THERAPIST';
UPDATE "User" SET skill = 'Soft tissue Therapy', notes = 'Therapy type: Soft tissue Therapy
Booking type: Not sure yet

Hi, I hope you''re well. I recently moved to Kingston upon Thames and I''m looking for a therapy room to rent in the area. I''m a qualified Level 3 Sports Massage Therapist and currently completing the final stages of my Level 5 Soft Tissue Therapy qualification. As I''m building my client base locally, I''m looking for a professional and welcoming space where I can treat clients and continue growing my practice. I would be very interested in discussing your room and learning more about the availability, rental terms, and facilities. Thank you, I look forward to hearing from you. Kind regards, Philippe.', "referredBy" = 'Website', "viewingDate" = '2026-06-25 00:00:00'::timestamp WHERE LOWER(name) = LOWER('Philippe Grousset') AND role = 'THERAPIST';

SELECT COUNT(*) as updated FROM "User" WHERE role = 'THERAPIST' AND "viewingDate" IS NOT NULL;