--
-- Add the new table for monitoring jobs
--

CREATE TABLE fac_Jobs (
	SessionID varchar(80) NOT NULL,
	Percentage int(11) NOT NULL DEFAULT "0",
	Status varchar(255) NOT NULL,
	PRIMARY KEY(SessionID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Make custom attributes unique, need to add a test for this
-- 
ALTER TABLE fac_DeviceCustomAttribute ADD UNIQUE (Label);

--
-- Add in new parameter to control whether or not to filter the cabinet listing (Disable for Performance Boost on large installs)
--

INSERT INTO fac_Config SET Parameter="PatchPanelsOnly", Value="enabled", UnitOfMeasure="Enabled/Disabled", ValType="string", DefaultVal="enabled";

--
-- Bump up the database version (uncomment below once released)
--
-- UPDATE fac_Config set Value="4.2" WHERE Parameter="Version";

--
-- Add feature "start any number on first unit"
--
ALTER TABLE fac_Cabinet ADD COLUMN StartUNum int(3) NOT NULL DEFAULT "1" AFTER CabinetHeight;
INSERT INTO fac_Config VALUES('StartUNum',1,'','int',1);
