CREATE TABLE destinasjon(
	DestinasjonID INT AUTO_INCREMENT PRIMARY KEY,
	Navn VARCHAR(50) NOT NULL
);

CREATE TABLE loype(
	LoypeID INT AUTO_INCREMENT PRIMARY KEY,
	DestinasjonID INT NOT NULL,
	Navn VARCHAR(50) NOT NULL,
	FOREIGN KEY (DestinasjonID) REFERENCES destinasjon(DestinasjonID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE segment(
	SegmentID INT AUTO_INCREMENT PRIMARY KEY,
	LoypeID INT NOT NULL,
	Lengde FLOAT NOT NULL,
	Stigning FLOAT NOT NULL,
	Hoydetap FLOAT NOT NULL,
	FOREIGN KEY (LoypeID) REFERENCES loype(LoypeID) ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (Lengde > 0),
	CHECK (Stigning >= 0),
	CHECK (Hoydetap >= 0)
);

CREATE TABLE sportype(
	SportypeID INT PRIMARY KEY,
	Sporbeskrivelse VARCHAR(50) NOT NULL
);

CREATE TABLE spor(
	SporID INT AUTO_INCREMENT PRIMARY KEY,
	LoypeID INT NOT NULL,
	SportypeID INT NOT NULL,
	FOREIGN KEY (LoypeID) REFERENCES loype(LoypeID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (SportypeID) REFERENCES sportype(SportypeID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE snotype(
	SnotypeID INT PRIMARY KEY,
	Snobeskrivelse VARCHAR(20) NOT NULL
);

CREATE TABLE loypeforhold(
	DestinasjonID INT NOT NULL,
	Tidspunkt DATETIME NOT NULL,
	Temperatur FLOAT,
	SnotypeID INT,
	PRIMARY KEY (DestinasjonID, Tidspunkt),
	FOREIGN KEY (DestinasjonID) REFERENCES destinasjon(DestinasjonID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (SnotypeID) REFERENCES snotype(SnotypeID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE INDEX idx_snotype ON loypeforhold(SnotypeID);
CREATE INDEX idx_temperatur_loype ON loypeforhold(Temperatur);

CREATE TABLE produktkategori(
	ProduktkategoriID INT PRIMARY KEY,
	Produktkategoribeskrivelse VARCHAR(20) NOT NULL
);

CREATE TABLE brukerniva(
	BrukernivaID INT PRIMARY KEY,
	Brukerniva VARCHAR (20) NOT NULL
);

CREATE TABLE smoring(
	SmoringID INT AUTO_INCREMENT PRIMARY KEY,
	Produktnavn VARCHAR(50) NOT NULL,
	Produktkategori INT,
	Produktnummer VARCHAR(10),
	Produktbeskrivelse TEXT,
	FOREIGN KEY (Produktkategori) REFERENCES produktkategori(ProduktkategoriID) ON DELETE RESTRICT,
	UNIQUE(Produktnummer)
);

CREATE TABLE produktegenskaper(
	EgenskaperID INT AUTO_INCREMENT PRIMARY KEY,
	SmoringID INT NOT NULL,
	BrukernivaID INT NOT NULL,
	SnotypeID INT NOT NULL,
	TemperaturMinimum FLOAT,
	TemperaturMaksimum FLOAT,
	FOREIGN KEY (SmoringID) REFERENCES smoring(SmoringID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (BrukernivaID) REFERENCES brukerniva(BrukernivaID) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (SnotypeID) REFERENCES snotype(SnotypeID) ON DELETE RESTRICT ON UPDATE CASCADE,
	CHECK (TemperaturMinimum <= TemperaturMaksimum),
	CHECK (TemperaturMinimum BETWEEN -35 AND 10 AND TemperaturMaksimum BETWEEN -35 AND 10),
	UNIQUE(SmoringID, SnotypeID, BrukernivaID)
);

CREATE INDEX idx_temperatur ON produktegenskaper(TemperaturMinimum, TemperaturMaksimum);
