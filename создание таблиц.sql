USE transport_company;
CREATE TABLE IF NOT EXISTS `груз` (
  `idГруз` INT NOT NULL,
  `TIP GRUZA` VARCHAR(85) CHARACTER SET 'utf8' NOT NULL,
  `TONNAZh GRUZA` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `DATA ZAKAZA` DATETIME NOT NULL,
  `GABARITY GRUZA` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idГруз`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `Transport` (
  `idTransport` INT UNSIGNED ZEROFILL NOT NULL,
  `TONNAZh`NVARCHAR(45) NOT NULL,
  `MARKA`NVARCHAR(45) NOT NULL,
  `GABARITY`NVARCHAR(45) NOT NULL,
  `GOSNOMER`NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTransport`),
  UNIQUE INDEX `idTransport_UNIQUE` (`idTransport` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Voditel` (
  `idVoditel` INT NOT NULL,
  `FIO`NVARCHAR(125) NOT NULL,
  `NOMER VODITELSKIKh PRAV`NVARCHAR(45) NOT NULL,
  `KATEGORIYa`NVARCHAR(45) NOT NULL,
  `Strakhovoi polis` NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVoditel`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `klienty` (
  `idtable1` INT NOT NULL,
  ` FIO` VARCHAR(190) CHARACTER SET 'utf8' NOT NULL,
  `TELEFON` VARCHAR(12) NOT NULL,
  `ИНН` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `МАРШРУТ` (
  `idМАРШРУТ` INT NOT NULL,
  `ADRES DOSTAVKI` VARCHAR(145) NOT NULL,
  `ADRES OTPRAVKI` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`idМАРШРУТ`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `zakazy` (
  `idZAKAZY` INT NOT NULL,
  `Transport_idTransport` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `Voditel_idVoditel` INT NOT NULL,
  `Klienty_idtable1` INT NOT NULL,
  `Груз_idГруз` INT NOT NULL,
  `МАРШРУТ_idМАРШРУТ` INT NOT NULL,
  PRIMARY KEY (`idZAKAZY`, `Transport_idTransport`, `Voditel_idVoditel`, `Klienty_idtable1`, `Груз_idГруз`, `МАРШРУТ_idМАРШРУТ`),
  INDEX `fk_ZAKAZY_Transport1_idx` (`Transport_idTransport` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Voditel1_idx` (`Voditel_idVoditel` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Klienty1_idx` (`Klienty_idtable1` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Груз1_idx` (`Груз_idГруз` ASC) VISIBLE,
  INDEX `fk_zakazy_МАРШРУТ1_idx` (`МАРШРУТ_idМАРШРУТ` ASC) VISIBLE,
  CONSTRAINT `fk_ZAKAZY_Klienty1`
    FOREIGN KEY (`Klienty_idtable1`)
    REFERENCES `klienty` (`idtable1`),
  CONSTRAINT `fk_ZAKAZY_Transport1`
    FOREIGN KEY (`Transport_idTransport`)
    REFERENCES `transport` (`idTransport`),
  CONSTRAINT `fk_ZAKAZY_Voditel1`
    FOREIGN KEY (`Voditel_idVoditel`)
    REFERENCES `voditel` (`idVoditel`),
  CONSTRAINT `fk_ZAKAZY_Груз1`
    FOREIGN KEY (`Груз_idГруз`)
    REFERENCES `груз` (`idГруз`),
  CONSTRAINT `fk_zakazy_МАРШРУТ1`
    FOREIGN KEY (`МАРШРУТ_idМАРШРУТ`)
    REFERENCES `МАРШРУТ` (`idМАРШРУТ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


