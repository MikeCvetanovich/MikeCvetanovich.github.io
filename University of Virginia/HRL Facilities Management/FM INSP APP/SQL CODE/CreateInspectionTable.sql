USE [HRLFM]
GO


CREATE TABLE hrlfm.insp.Inspection
(
	Insp_KEY INT PRIMARY KEY IDENTITY (1,1),
	Insp_SortOrder INT NOT NULL,
	Insp_Visible BINARY NOT NULL,
	Insp_CreateDate DATETIME NOT NULL,
	Insp_ModifiedDate TIMESTAMP NULL,
	Insp_Status BINARY NOT NULL,
	Instp_StartTime DATETIME NOT NULL,
	Insp_Results VARCHAR (50) NOT NULL,
	Insp_ReasonType VARCHAR (50) NOT NULL,
	StRz_KEY INT NOT NULL,
	FOREIGN KEY (StRz_KEY) REFERENCES insp.StarRezBldgList (StRz_KEY)


	
);