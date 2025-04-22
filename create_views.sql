-- smoringoversikt: Henter alle smøringer

CREATE VIEW smoringoversikt AS
SELECT s.SmoringID,
    s.Produktnavn,
    pk.Produktkategoribeskrivelse AS Produktkategori,
    MIN(pe.TemperaturMinimum) AS TemperaturMinimum,
    MAX(pe.TemperaturMaksimum) AS TemperaturMaksimum,
    GROUP_CONCAT(DISTINCT sn.Snobeskrivelse SEPARATOR ', ') AS SnoTyper,
    GROUP_CONCAT(DISTINCT bn.Brukerniva SEPARATOR ', ') AS Brukernivaaer
FROM smoring s
JOIN produktkategori pk ON s.Produktkategori = pk.ProduktkategoriID
JOIN produktegenskaper pe ON s.SmoringID = pe.SmoringID
JOIN snotype sn ON pe.SnotypeID = sn.SnotypeID
JOIN brukerniva bn ON pe.BrukernivaID = bn.BrukernivaID
GROUP BY s.SmoringID, s.Produktnavn, pk.Produktkategoribeskrivelse, s.Produktnummer, s.Produktbeskrivelse;

-- destinasjonoversikt: Henter alle registrerte løypeforhold per destinasjon

CREATE VIEW destinasjonoversikt AS
SELECT d.DestinasjonID,
       d.Navn AS DestinasjonNavn,
       lf.Tidspunkt,
       lf.Temperatur,
       sn.Snobeskrivelse AS Snotype
FROM destinasjon d
LEFT JOIN loypeforhold lf ON d.DestinasjonID = lf.DestinasjonID
LEFT JOIN snotype sn ON lf.SnotypeID = sn.SnotypeID;

-- loypeoversikt: Henter og aggregerer data for hver løype (altså segmentene: lengde, stigning, høydetap)

CREATE VIEW loypeoversikt AS
SELECT 
    d.Navn AS Destinasjon,
    l.Navn AS Loype,
    COALESCE(sporinfo.Sportype, 'Ingen spor') AS Sportype,
    COALESCE(ROUND(seginfo.TotalLengde / 1000, 1), 0) AS LengdeKm,
    COALESCE(ROUND(seginfo.TotalStigning, 1), 0) AS StigningMeter,
    COALESCE(ROUND(seginfo.TotalHoydetap, 1), 0) AS HoydetapMeter
FROM loype l
JOIN destinasjon d ON l.DestinasjonID = d.DestinasjonID

LEFT JOIN (
    -- Samler alle sporbeskrivelser for hver løype
    SELECT sp.LoypeID, 
           GROUP_CONCAT(DISTINCT st.Sporbeskrivelse ORDER BY st.Sporbeskrivelse SEPARATOR ', ') AS Sportype
    FROM spor sp
    JOIN sportype st ON sp.SportypeID = st.SportypeID
    GROUP BY sp.LoypeID
) sporinfo ON l.LoypeID = sporinfo.LoypeID

LEFT JOIN (
    -- Beregner total lengde, stigning og høydeendring for hver løype
    SELECT LoypeID, 
           SUM(Lengde) AS TotalLengde, 
           SUM(Stigning) AS TotalStigning, 
           SUM(Hoydetap) AS TotalHoydetap
    FROM segment
    GROUP BY LoypeID
) seginfo ON l.LoypeID = seginfo.LoypeID;

-- alternativsmoring: Henter alle alternative smøringer per egnet løypeforhold per smøring

CREATE VIEW alternativsmoring AS
SELECT s1.Produktnavn AS OriginalSmoring,
    CONCAT(s1.TemperaturMinimum, '°C til ', s1.TemperaturMaksimum, '°C, ', s1.SnoTyper) AS OriginalLoypeforhold,
    s2.Produktnavn AS AnbefaltAlternativ,
    CONCAT(s2.TemperaturMinimum, '°C til ', s2.TemperaturMaksimum, '°C, ', s2.SnoTyper ) AS AlternativLoypeforhold,
    s2.Produktkategori,
    s2.Brukernivaaer,
    ABS(s1.TemperaturMinimum - s2.TemperaturMinimum) 
    + ABS(s1.TemperaturMaksimum - s2.TemperaturMaksimum) AS TemperaturAvvik
FROM smoringoversikt s1
JOIN smoringoversikt s2 
ON s2.Snotyper LIKE CONCAT('%', s1.Snotyper, '%')  
AND s1.TemperaturMinimum <= s2.TemperaturMaksimum  
AND s1.TemperaturMaksimum >= s2.TemperaturMinimum  
AND s1.Produktnavn <> s2.Produktnavn
ORDER BY OriginalSmoring, TemperaturAvvik ASC;

-- alternativsmoring_loypeforhold: henter alle løypeforhold per smøring, og viser de respektive alternativene

CREATE VIEW alternativsmoring_loypeforhold AS
SELECT 
    s.Produktnavn AS Smoring,

    -- Kombinerer snøtype og temperaturintervall
    CONCAT(sn.Snobeskrivelse, ' (', pe.TemperaturMinimum, '°C - ', pe.TemperaturMaksimum, '°C)') AS Loypeforhold,  

    -- Samler alternative smøringer i én kolonne per loypeforhold
    GROUP_CONCAT(DISTINCT alt.Produktnavn ORDER BY alt.Produktnavn SEPARATOR ', ') AS AlternativeSmoringer
FROM produktegenskaper pe
JOIN snotype sn ON pe.SnotypeID = sn.SnotypeID
JOIN smoring s ON s.SmoringID = pe.SmoringID

-- Finner alternative smøringer som matcher samme snøtype og temperaturintervall
JOIN produktegenskaper altpe 
    ON altpe.SnotypeID = pe.SnotypeID
    AND altpe.TemperaturMinimum <= pe.TemperaturMaksimum
    AND altpe.TemperaturMaksimum >= pe.TemperaturMinimum
    AND altpe.SmoringID <> s.SmoringID

JOIN smoring alt ON alt.SmoringID = altpe.SmoringID

GROUP BY s.Produktnavn, pe.TemperaturMinimum, pe.TemperaturMaksimum, sn.Snobeskrivelse;

-- anbefaltsmoring_destinasjon: henter ut siste registrerte data per destinasjon (temperatur/snøtype)

CREATE VIEW anbefaltsmoring_destinasjon AS
SELECT d.DestinasjonID,
       d.DestinasjonNavn,
       d.Tidspunkt,
       d.Temperatur,
       d.Snotype,
       COALESCE(s.Produktnavn, 'Ingen anbefalt smøring') AS AnbefaltSmoring,
       s.Produktkategori,
       s.TemperaturMinimum,
       s.TemperaturMaksimum,
       s.Snotyper,
       s.Brukernivaaer
FROM destinasjonoversikt d
JOIN (
    -- Henter siste registrerte tidspunkt per destinasjon
    SELECT DestinasjonID, MAX(Tidspunkt) AS SisteTidspunkt
    FROM destinasjonoversikt
    GROUP BY DestinasjonID
) st ON d.DestinasjonID = st.DestinasjonID AND d.Tidspunkt = st.SisteTidspunkt
LEFT JOIN smoringoversikt s 
ON s.Snotyper LIKE CONCAT('%', d.Snotype, '%')  
AND d.Temperatur BETWEEN s.TemperaturMinimum AND s.TemperaturMaksimum;
