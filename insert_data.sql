INSERT INTO destinasjon(navn)
VALUES 
	('Hurdal Hele Året'),
	('Sjusjøen');

INSERT INTO loype(DestinasjonID, Navn)
VALUES
	(1, 'Gjødingssætra-Abbortjern'),
	(2, 'Elgåsen');

INSERT INTO segment(LoypeID, Lengde, Stigning, Hoydetap)
VALUES
	(1, 2900, 43, 8), (1, 2000, 152.3, 0.2),
	(2, 600, 9.5, 2.7), (2, 200, 0, 7.7), (2, 200, 0, 10.8), (2, 100, 0.7, 0.6), (2, 400, 0, 20.7), (2, 500, 0.5, 6.1), (2, 1800, 17.2, 20.3), (2, 200, 0.4, 1), (2, 1300, 14.5, 12.1), (2, 600, 5.8, 0.9), (2, 700, 4.3, 5.7), (2, 1200, 1.6, 27.2), (2, 300, 9.6, 1), (2, 1100, 9.8, 2.8), (2, 1400, 31.4, 19.9), (2, 200, 2.9, 1.6), (2, 300, 6.1, 0.7), (2, 2500, 30, 12.5);

INSERT INTO sportype(SportypeId, Sporbeskrivelse)
	VALUES
	(1, 'Klassisk'), (2, 'Skøyting');

INSERT INTO spor(LoypeID, SportypeID)
	VALUES
	(1, 1), (2, 1), (2, 2);

INSERT INTO snotype(SnotypeID, Snobeskrivelse)
	VALUES
	(1, 'Nyfallen snø'), (2, 'Gammel snø'), (3, 'Våt snø');

INSERT INTO produktkategori(ProduktkategoriID, Produktkategoribeskrivelse)
	VALUES
	(1, 'Glider'), (2, 'Festevoks'), (3, 'Klister');

INSERT INTO brukerniva(BrukernivaID, Brukerniva)
	VALUES
	(1, 'Nybegynner'), (2, 'Erfaren'), (3, 'Konkurranseløper');

INSERT INTO smoring(Produktnavn, Produktkategori, Produktnummer, Produktbeskrivelse)
VALUES
('HS8 Red', 1, 'HS08-6-V', 'HS8 er en populær glidvoks for både grunnpreparering og trening. High Speed (HS) er spesielt utviklet for yngre konkurranseløpere og den ambisiøse mosjonisten. Alle voksene i denne serien har høy ytelse og god slitestyrke. Dette gjør de til et rimelig alternativ til både konkurranse og trening. HS8 er lett å smelte, og svært praktisk å arbeide med. Den passer like godt til både trening og konkurranse.'),
('HS10 Yellow', 1, 'HS10-18-V', 'HS10 er en glidvoks som er ideell under varme forhold, som de man ofte møter mot slutten av sesongen. High Speed (HS) er spesielt utviklet for yngre konkurranseløpere og den ambisiøse mosjonisten. Alle glidvoksene i denne serien har høy ytelse og god slitestyrke. Dette gjør de til et rimelig alternativ til både konkurranse og trening. HS10 er en god voks for grunnpreparering, men også en fin trenings- og konkurranse-voks. Voksen er lett å smelte, og svært enkel å arbeide med. HS10 er en relativt myk voks og vil ikke ha samme slitestyrke som en hardere glidvoks. Derfor anbefaler vi ved konkurranse og lengre turer, å smelte inn en hardere voks under og deretter legge HS10. Hvordan påføre HS10: Hastigheten på smørejernet bør være ca. 8-10 sek. på en skøyte- eller alpinski. Voksen kan varmes opp på nytt etter nedkjøling til romtemperatur (10 min.) for bedre holdbarhet. Viktig å ha et godt smørejern for å få effektiv smelting av voksen. Anbefalt smørejernstemp: 150°C. HS10 finnes både som voks og flytende produkter.'),
('PS6 Blue', 1, 'PS06-18-V', 'PS6 er en meget allsidig glidvoks. Bruksområdet strekker seg fra underlagsvoks for racingprodukter til racingvoks alene og til base-prep voks for kaldski. PS6 har god holdbarhet og gir meget god gli både på natur- og kunstsnø. PS6 kan brukes som racingvoks alene eller som underlagsvoks for toppinger.'),
('PS Polar', 1, 'PSP-18-V', 'En kald glider for ekstrem kulde, som perfekt kan brukes alene som racingvoks når luftfuktigheten er lav. Den fungerer svært godt på kunstsnø og har meget høy slitestyrke. I den varmeste delen av temperaturområdet, og ved høy luftfuktighet, vil racingprodukter lagt oppå heve ytelsen. Hastigheten på smørejernet bør være ca. 8-10 sek. på en skøyte- eller alpinski. Voksen kan varmes opp på nytt etter nedkjøling til romtemperatur (10 min.) for bedre holdbarhet. Sikles etter ca. ett minutt. Det er viktig å ha et godt smørejern for å få effektiv smelting av voksen. Anbefalt smørejernstemp: 155°C. Erstatter CH4X'),
('HS5 Turquoise', 1, 'HS05-18-V', 'HS5 er den hardeste glidvoksen i High Speed-serien. High Speed (HS) er spesielt utviklet for yngre konkurranseløpere og den ambisiøse mosjonisten. Alle voksene i denne serien har høy ytelse og god slitestyrke. Dette gjør de til et rimelig alternativ til både konkurranse og trening. HS5 er et glimrende valg under kalde forhold på grunn av overlegen slitestyrke og tørrfriksjons egenskaper. Den er et veldig godt valg til både alpint, snowboard og langrenn. Til tross for at det er en voks for kalde forhold, gjør smeltepunktet den lettere å påføre enn mange konkurrentvokser i dette området, uten at det går utover glidegenskapene. For nysnø, omdannet snø og kunstsnø.'),
('TS7 Turbo Violet', 1, 'TST07-2-V', 'Top Speed Turbo (TST) er en konkurranseglider spesielt utviklet for ullbørste, hvilket betyr du ikke trenger smørejern når du legger glideren. TST tilbyr en unik kombinasjon av vannavvisning, hindrer smuss og møkk, glid og varighet. Dette gjør TST til den kjappeste og mest avanserte neste generasjons racing glider. Den kan benyttes som topplag eller som base. TS7 Turbo Violet fungerer best på kald og tørr snø rett under frysepunktet med temperatur -2°C til -7°C.'),
('VP30 Pro Light Blue', 2, 'VP30-V', 'Festevoks for ny og nyfallen finkornet snø fra -8°C til -16°C. Gammel/delvis omdannet snø fra -12°C til -20°C. Lyseblå festevoks for tørre og kalde til ekstra kalde vinterforhold. Hvert lag legges tynt på og jevnes etterpå ut med en syntetisk kork (T12). VP-voksene er primært laget for konkurranseløpere og aktive mosjonister, men kan fint brukes av tur- og rekreasjonsløpere som ønsker det lille ekstra med hensyn til skiopplevelse.'),
('VP40 Pro Blue', 2, 'VP40-V', 'Festevoks for ny og nyfallen finkornet snø fra -4°C til -10°C. Gammel/delvis omdannet snø fra -5°C til -14°C. Blå festevoks for kalde og tørre vinterforhold. Et naturlig valg for forhold man typisk opplever midtvinters i innlandsklima. Hvert lag legges tynt på og jevnes etterpå ut med en syntetisk kork (T20). VP-voksene er primært laget for konkurranseløpere og aktive mosjonister, men kan fint brukes av tur- og rekreasjonsløpere som ønsker det lille ekstra med hensyn til skiopplevelse.'),
('VP45 Pro Blue/Violet', 2, 'VP45-V', 'Festevoks for ny og nyfallen finkornet snø fra -1°C til -5°C. Gammel/delvis omdannet snø fra -3°C til -8°C. Blåfiolett festevoks for normale vinterforhold godt under frysepunktet. Et opplagt «neste steg» dersom man opplever at VP40 ikke gir godt nok feste. Hvert lag legges tynt på og jevnes etterpå ut med en syntetisk kork (T20). VP-voksene er primært laget for konkurranseløpere og aktive mosjonister, men kan fint brukes av tur- og rekreasjonsløpere som ønsker det lille ekstra med hensyn til skiopplevelse.'),
('VP50 Pro Light Violet', 2, 'VP50-V', 'Festevoks for ny og nyfallen finkornet snø fra 0°C til -3°C. Gammel/delvis omdannet snø fra -1°C til -6°C. Lilla festevoks utviklet for forhold noen grader under frysepunktet. Gir et perfekt feste inntil du får middels blanke spor. Voksen inneholder et nytt tilsetningsstoff som gir maksimal smøreevne. Dette forbedrer voksens slippegenskaper og gir en utmerket følelse. Påfør hvert lag tynt - jevn deretter ut overflaten med en syntetisk kork (T20). VP-serien er primært designet for konkurrerende og for ambisiøse personer som ikke driver med konkurranse, men kan også brukes av turgåere som ønsker en optimal skiopplevelse.'),
('VP55 Pro Violet', 2, 'VP55-V', 'Festevoks for ny og nyfallen finkornet snø fra 1°C til -2°C. Gammel/delvis omdannet snø fra 0°C til -5°C. Mørk fiolett festevoks tilpasset fuktig, nyere snø rundt null grader samt eldre, omdannet snø like i underkant av null. Voksen inneholder et nytt additiv designet for å maksimere de vannavvisende egenskapene. Dette gir fortsatt perfekt feste, men forbedrer følelsen i glidfasen. Hvert lag legges tynt på og jevnes etterpå ut med en syntetisk kork (T20). VP-voksene er primært laget for konkurranseløpere og aktive mosjonister, men kan fint brukes av tur- og rekreasjonsløpere som ønsker det lille ekstra med hensyn til skiopplevelse.'),
('V60 Red/Silver Hardwax', 2, 'V0060-V', 'Denne voksen brukes opp til +3°C på fuktig/kram nysnø og ned til -1°C på eldre grovkornet snø. Legg på flere lag jo varmere det er for å sikre godt feste. Ny fallende snø fra +3°C til 0°C. Gammel/omdannet snø fra +1°C til -1°C. V-serien er laget for både konkurranse- og turbruk. Kvaliteten er meget høy på grunn av utvalgte, fullraffinerte vokskvaliteter, syntetiske gummityper og oljer som tilfredsstiller medisinske krav.'),
('KX55 Violet Extra Klister', 3, 'KX55-V', 'KX55 Violet Extra Klister er en allsidig racingklister designet for et bredt spekter av snøforhold fra -6°C til +4°C. Sammenlignet med den populære K22 Universal Klister, yter KX55 bedre i kaldere temperaturer og mer finkornet snø, noe som gir utmerket grep og glidebalanse. Ideell for konkurrerende skiløpere som leter etter pålitelig ytelse under varierende forhold.'),
('KN33 Nero Klister', 3, 'KN33-V', 'KN33 Nero passer perfekt på skiftende snøforhold og er meget effektivt når det gjelder å redusere risikoen for ising. Temperaturområde +1°C til -7°C. Våre Nero klistere er revolusjonerende klistere med en svart ingrediens som har gitt imponerende resultater. De samler betydelig mindre skitt fra snøen enn tradisjonelt klister. De er slitesterkt og holder seg innenfor festesonen bedre enn andre klister. NERO gir et sikkert feste over lengre tid enn tradisjonelle klistere på grunn av sine helt spesielle egenskaper.'),
('K22 Universal VM Klister', 3, 'K22-V', 'VM Universal klister, +10°C til -3°C. For grovkornet, gammel snø, varierende fra is/skare til våt snø. Stor fleksibilitet mot finkornet og kornet, tørr til fuktig snø. Brukes som sistelags klister. Kan sammenlignes med det originale VM klisteret. Benyttes ofte i World Cup. Et aktuelt klister både til racing og tur bruk. Plastskrape medfølger.'),
('K21S Universal Silver Klister', 3, 'K21S-V', 'Sølv Universal klister, +3°C til -5°C. Fleksibelt klister for variable forhold rundt null grader. God i blandingssnø (fin/grov) fra våt, nyere og mindre kornet snø til mer kornet fuktig snø. Brukes på mer finkornet snø enn K22, men går også bra på våt, kornet snø. Plastskrape medfølger.'),
('KX45N Violet Special Klister', 3, 'KX45N-V', 'KX45N Violet Special Klister fungerer best på temperatur mellom +1°C to -4°C. Som topplag fungerer den svært godt på grovkornet snø når luften går fra minus- til plussgrader. Som mellomlag anbefaler vi KX20 eller KB20 under, og som topplag klister som tåler ekstra vått føre. Plastskrape medfølger ikke.'),
('KN44 Nero Klister', 3, 'KN44-V', 'KN44 Nero passer perfekt på skiftende snøforhold og er meget effektivt når det gjelder å redusere risikoen for ising. Temperaturområde -3°C til +5°C. Nåre Nero klistere er revolusjonerende klistere med en svart ingrediens som har gitt imponerende resultater. De samler betydelig mindre skitt fra snøen enn tradisjonelt klister. De er slitesterkt og holder seg innenfor festesonen bedre enn andre klister. Nero gir et sikkert feste over lengre tid enn tradisjonelle klistere på grunn av sine helt spesielle egenskaper.');

INSERT INTO produktegenskaper(SmoringID, BrukernivaID, SnotypeID, TemperaturMinimum, TemperaturMaksimum)
VALUES
	(1, 2, 2, -4, 4), (1, 3, 2, -4, 4), -- HS8 Red, (erfaren/konkurranseløper - gammel snø (finkornet))
	(1, 2, 3, -4, 4), (1, 3, 3, -4, 4), -- HS8 Red, (erfaren/konkurranseløper - våt snø (grovkornet))
	(2, 2, 2, 0, 10), (2, 3, 2, 0, 10), -- HS10 Yellow (erfaren/konkurranseløper - gammel snø (finkornet))
	(2, 2, 3, 0, 10), (2, 3, 3, 0, 10), -- HS10 Yellow (erfaren/konkurranseløper - våt snø (grovkornet))
	(3, 2, 1, -12, -6), (3, 3, 1, -12, -6), -- PS6 Blue (erfaren/konkurranseløper - nyfallen snø)
	(3, 2, 2, -12, -6), (3, 3, 2, -12, -6), -- PS6 Blue (erfaren/konkurranseløper - gammel snø)
	(4, 2, 1, -32, -14), (4, 3, 1, -32, -14),  -- PS Polar (erfaren/konkurranseløper - nyfallen snø)
	(4, 2, 2, -32, -14), (4, 3, 2, -32, -14),  -- PS Polar (erfaren/konkurranseløper - gammel snø)
	(5, 2, 1, -18, -10), (5, 3, 1, -18, -10), -- HS5 Turqouise (erfaren/konkurranseløper - nyfallen snø)
	(5, 2, 2, -18, -10), (5, 3, 2, -18, -10), -- HS5 Turqouise (erfaren/konkurranseløper - gammel snø)
	(6, 2, 1, -8, -2), (6, 3, 1, -8, -2), -- TS7 Turbo Violet (erfaren/konkurranseløper - nyfallen snø) ...står -7C i spes., men -8 på pakka...
	(6, 2, 2, -8, -2), (6, 3, 2, -8, -2), -- TS7 Turbo Violet (erfaren/konkurranseløper - gammel snø)
	(7, 1, 1, -16, -8), (7, 2, 1, -16, -8), (7, 3, 1, -16, -8), -- VP30 Pro Light Blue (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(7, 1, 2, -20, -12), (7, 2, 2, -20, -12), (7, 3, 2, -20, -12), -- VP30 Pro Light Blue (nybegynner, erfaren, konkurranseløper - gammel snø)
	(8, 1, 1, -10, -4), (8, 2, 1, -10, -4), (8, 3, 1, -10, -4), -- VP40 Pro Blue (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(8, 1, 2, -14, -5), (8, 2, 2, -14, -5), (8, 3, 2, -14, -5), -- VP40 Pro Blue (nybegynner, erfaren, konkurranseløper - gammel snø)
	(9, 1, 1, -5, -1), (9, 2, 1, -5, -1), (9, 3, 1, -5, -1), -- VP45 Pro Blue/Violet (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(9, 1, 2, -8, -3), (9, 2, 2, -8, -3), (9, 3, 2, -8, -3), -- VP45 Pro Blue/Violet (nybegynner, erfaren, konkurranseløper - gammel snø)
	(10, 1, 1, -3, 0), (10, 2, 1, -3, 0), (10, 3, 1, -3, 0), -- VP50 Pro Light Violet (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(10, 1, 2, -6, -1), (10, 2, 2, -6, -1), (10, 3, 2, -6, -1), -- VP50 Pro Light Violet (nybegynner, erfaren, konkurranseløper - gammel snø)
	(11, 1, 1, -2, 1), (11, 2, 1, -2, 1), (11, 3, 1, -2, 1), -- VP55 Pro Violet (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(11, 1, 2, -5, 0), (11, 2, 2, -5, 0), (11, 3, 2, -5, 0), -- VP55 Pro Violet (nybegynner, erfaren, konkurranseløper - gammel snø)
	(12, 1, 1, -1, 2), (12, 2, 1, -1, 2), (12, 3, 1, -1, 2), -- VP60 Red/Silver Hardwax (nybegynner, erfaren, konkurranseløper - nyfallen snø)
	(12, 1, 2, -4, 1), (12, 2, 2, -4, 1), (12, 3, 2, -4, 1), -- VP60 Red/Silver Hardwax (nybegynner, erfaren, konkurranseløper - gammel snø)
	(13, 3, 2, -6, 4), -- KX55 Violet Extra Klister (konkurranseløper - gammel snø)
	(13, 3, 3, -6, 4), -- KX55 Violet Extra Klister (konkurranseløper - våt snø)
	(14, 3, 2, -7, 1), -- KN33 Nero Klister (konkurranseløper - gammel snø)
	(14, 3, 3, -7, 1), -- KN33 Nero Klister (konkurranseløper - våt snø)
	(15, 1, 2, -3, 10), (15, 2, 2, -3, 10), (15, 3, 2, -3, 10), -- K22 Universal VM Klister (nybegynner, erfaren, konkurranseløper - gammel snø)
	(15, 1, 3, -3, 10), (15, 2, 3, -3, 10), (15, 3, 3, -3, 10), -- K22 Universal VM Klister (nybegynner, erfaren, konkurranseløper - våt snø)
	(16, 2, 1, -5, 3), (16, 3, 1, -5, 3), -- K21S Universal Silver Klister (erfaren, konkurranseløper - nyfallen snø)
	(16, 2, 2, -5, 3), (16, 3, 2, -5, 3), -- K21S Universal Silver Klister (erfaren, konkurranseløper - gammel snø)
	(16, 2, 3, -5, 3), (16, 3, 3, -5, 3), -- K21S Universal Silver Klister (erfaren, konkurranseløper - våt snø)
	(17, 1, 2, -4, 1), (17, 2, 2, -4, 1), (17, 3, 2, -4, 1), -- KX45N Violet Special Klister (nybegynner, erfaren, konkurranseløper - gammel snø)
	(17, 1, 3, -4, 1), (17, 2, 3, -4, 1), (17, 3, 3, -4, 1), -- KX45N Violet Special Klister (nybegynner, erfaren, konkurranseløper - gammel snø)
	(18, 3, 2, -3, 5), -- KN44 Nero Klister (konkurranseløper - gammel snø)
	(18, 3, 3, -3, 5); -- KN44 Nero Klister (konkurranseløper - våt snø)

-- Registrerer dummy data for en destinasjon i form av temperatur og snøtype 

INSERT INTO loypeforhold(DestinasjonID, Tidspunkt, SnotypeID, Temperatur)
VALUES
	(1, '2025-04-17 17:21:50', 1, -4);

INSERT INTO loypeforhold(DestinasjonID, Tidspunkt, SnotypeID, Temperatur)
VALUES
	(1, '2025-04-19 00:45:09', 2, -6);

INSERT INTO loypeforhold(DestinasjonID, Tidspunkt, SnotypeID, Temperatur)
VALUES
	(2, '2025-04-21 10:35:09', 3, 2);

INSERT INTO loypeforhold(DestinasjonID, Tidspunkt, SnotypeID, Temperatur)
VALUES
	(1, '2025-04-22 17:51:03', 1, -8),
	(2, '2025-04-22 17:51:03', 1, -12);

INSERT INTO loypeforhold(DestinasjonID, Tidspunkt, SnotypeID, Temperatur)
VALUES
	(1, '2025-04-22 18:51:03', 1, -10),
	(2, '2025-04-22 22:51:03', 1, -15);
