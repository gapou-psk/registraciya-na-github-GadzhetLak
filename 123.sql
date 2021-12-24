USE transport_company;
CREATE TABLE IF NOT EXISTS `Груз` (
  `idГруз` INT NOT NULL,
  `TIP GRUZA` NVARCHAR(85) NOT NULL,
  `TONNAZh GRUZA`NVARCHAR(45) NOT NULL,
  `DATA ZAKAZA` datetime NOT NULL,
 
  PRIMARY KEY (`idГруз`))
ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS `Klienty` (
  `idtable1` INT NOT NULL,
  ` FIO` NVARCHAR(120) NOT NULL,
  `MESTO NAZNAChENIYa`NVARCHAR(120) NOT NULL,
  `NAZVANIE GRUZA`NVARCHAR(45) NOT NULL,
  `GABARITY GRUZA`NVARCHAR(45) NOT NULL,
  `TELEFON` VARCHAR(12) NOT NULL,
  `ADRES DOSTAVKI`NVARCHAR(120) NOT NULL,
  `ADRES OTPRAVKI`NVARCHAR(128) NOT NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ZAKAZY` (
  `idZAKAZY`  INT NOT NULL,
  `Transport_idTransport` INT UNSIGNED ZEROFILL NOT NULL,
  `Voditel_idVoditel` INT NOT NULL,
  `Klienty_idtable1` INT NOT NULL,
  `Груз_idГруз` INT NOT NULL,
  PRIMARY KEY (`idZAKAZY`, `Transport_idTransport`, `Voditel_idVoditel`, `Klienty_idtable1`, `Груз_idГруз`),
  INDEX `fk_ZAKAZY_Transport1_idx` (`Transport_idTransport` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Voditel1_idx` (`Voditel_idVoditel` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Klienty1_idx` (`Klienty_idtable1` ASC) VISIBLE,
  INDEX `fk_ZAKAZY_Груз1_idx` (`Груз_idГруз` ASC) VISIBLE,
  CONSTRAINT `fk_ZAKAZY_Transport1`
    FOREIGN KEY (`Transport_idTransport`)
    REFERENCES `Transport` (`idTransport`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZAKAZY_Voditel1`
    FOREIGN KEY (`Voditel_idVoditel`)
    REFERENCES `Voditel` (`idVoditel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZAKAZY_Klienty1`
    FOREIGN KEY (`Klienty_idtable1`)
    REFERENCES `Klienty` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZAKAZY_Груз1`
    FOREIGN KEY (`Груз_idГруз`)
    REFERENCES `Груз` (`idГруз`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


insert INTO `Klienty` (`idtable1`,` FIO`,`MESTO NAZNAChENIYa`,`NAZVANIE GRUZA`,`GABARITY GRUZA`,`TELEFON`,`ADRES DOSTAVKI`,`ADRES OTPRAVKI`)
VALUES
('1', N'Русаков Мечислав Мэлсович','город Одинцово',1,'12', N'78907181117',N'023324, Кемеровская область, город Раменское, проезд Косиора, 82',N' 413603, Нижегородская область, город Одинцово, шоссе Гагарина, 37'),
('2', N'Алексеев Юстин Геннадиевич','город Балаших',2,'32', N'79907454180',N'413898, Владимирская область, город Балашиха, пр. 1905 года, 88',N' 813810, Липецкая область, город Кашира, спуск Гоголя, 70'),
('3', N'Артемьев Гавриил Авксентьевич','город Подольск',3,'17', N'78903602854',N'384653, Калужская область, город Подольск, бульвар Ленина, 05',N' 874458, Орловская область, город Подольск, проезд Гагарина, 72'),
('4', N'Шарапов Мартин Всеволодович','город Павловский Посад',4,'54',N'78908377929',N'606665, Ленинградская область, город Павловский Посад, пл. Будапештсткая, 23',N'494804, Тверская область, город Лотошино, пр. Космонавтов, 83'),
('5', N'Николаев Юстин Федорович','город Шатура','5','74',N'78909690826',N'719543, Ленинградская область, город Шатура, въезд Будапештсткая, 74',N' 140436, Рязанская область, город Балашиха, спуск Сталина, 25');
 



 


