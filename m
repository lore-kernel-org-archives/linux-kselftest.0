Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A31271450;
	Mon, 17 Aug 2026 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786933298; cv=fail; b=bAfnrcvyJvn8mqr7UbxkaFCAfRZyUMbdr8rxQf/aiUReLJnDxqAsNljEMLx1KXWFx2UQp7l/EaJSsnUNf3LNhcxkCt8t4BGnFRX13Oi10bG2sQWQZ9GmUkUUMTH1A9nVjq2b1qCN1ku4ySPH9ndh2/9T3sr0ElJNlIoWHHU5inI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786933298; c=relaxed/simple;
	bh=vGRa17i7X7KMBgfEZP2D/vKOF8wWtEL/TlbATtdr9xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VtUr39u2EHUyaByX0vGxCk88P3/UDyaYkuAYBD2+k63GSEieQu1b9/kn3UGF4yREAnLS6oGnavdmrMflby9jOmGmFhhEOosftwH4DKi7WQvaA7wydWOZxvsTO9Tznp6X7NRFfWjSuK6UPHVZhBqFCIgh0Ns7R3gzTVrHFXMmJnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=drsnkK81; arc=fail smtp.client-ip=40.93.198.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="drsnkK81"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsGb5Q2YxlE3CyHDkJCb/l/SNUCd7El17/2ZyGEipTwDA6znzp4eY3oFZH8m2DifuUKMKKeY/cr586pEbKcknwR5X8zcP61LstjCCbFIjTwMP33LKHKKOcDl01bBRj4PTLiNykYgs3HMpw2y4lluleh3QRdlw194WLi9VxEEbhJYKzBXUficO24lX6HN6wP5d+Fzd+FkLcibwWRTlnU717hYRyQNRRHEgUTF5FT6JsmUvzHLdeXf8cjvS6vcckZzZ6kz3kckab5rYvzq3GPzGL2DMO4iN01H+Wv88RwhDqpRM4lBVHbF3tliHGcoB43PvgSErmh3iWQ9l7Fuzv4YDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkLyOjuFXoSog4wa8qTLt+EA1gJPhjPj7PkIMVeVaXY=;
 b=G7IhZPXCviEGLobOLuY1oJ+x9da9d6qy3pwXQfbPHJ16z7VwO7ebOJa/hR+1S7CQrsfldFAysKI9/lBKFi4TxALLFyFefj/vkJkiU+XLzdNmHqGlfgwx0F5lz/UtEck2zffroEz0/l9IT3uNWT2UH2iwVLHGOW2yinHJy4G91EX/WIEHa+4jpEzL633b4VMNXc6xB0VsmKitKLpCqHPPwfSjZ2qBzCJzQw3p+dwAIEIx2iRmgILPiYBLWakRUE1h7FvWiScMmOcZEAfq3Wma3ndk8XbcAtIjiovQ7zHeIpejUkef6z/qEXD7qqmpWMkLwzfNBNyO9CUgOVb2lXGAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkLyOjuFXoSog4wa8qTLt+EA1gJPhjPj7PkIMVeVaXY=;
 b=drsnkK81I8kfRrS3YErNgVshkZO00lQt5ZDGE0Ds3gBkTrHujESN0qIqOwJYydg41MtbLIpMKW1dBEA6J98Wrprrg8Mgtgk68+HZwsGTbZHlEJSDBDbcZJaAR5Q/TD1On2yzxILhlrfpKHVnZGo0WdQJQL6TpbCbMOaN7KCyNPL/qFRr4rzGZoC3L8VyA570NlBHePlvneRtZXobcdIIswbVrSd/izcW7+pVVSffrVTuFavv7jFDYMPXfkT04AbrC/4TkP3faHboOwqnVWdw/+zz3ZhUi+5Q++WWDLrNfclajQEd0DehhIlvB9yJgA61MOsU1nnz/zLJz5RnB9VMZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by PH8PR12MB7304.namprd12.prod.outlook.com
 (2603:10b6:510:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:21:32 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:21:32 +0000
From: KobaK <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: Re: [RFC PATCH v6 0/3] arm64: expose CPU prefetch and cache modulation controls
Date: Mon, 17 Aug 2026 10:21:26 +0800
Message-ID: <20260817022126.3-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817014943.10-1-kobak@nvidia.com>
References: <20260817014943.10-1-kobak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 657a29f3-f2ac-44ca-1dd6-08defc0640f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mVK0/WVl0IVW/WqHGKy+fK8u3b1D4WX4M1/YcMJ/HcDVO4cZr4KOY+t1hMJ9gjc2dWtoBl7zqvnH/rRqTrqmTD64DjdoAhk2A/lL6KDOQdheotcRQeCJJuebdzipJcz6hy2R9/3RyUM7P/znJco0Eb8AQK9bBOFAuqZAJbLubqxHJXi9lBOb9SEr741OpZqyaqayK9L8KkO9lfrhWOSXyoWKekW60RaoIPjr7HcZ5PFlWiioDWXgwG8dp8ux+HgqC2G+9GYjtzMjaTWk7RcQ7cfZTMGNURsFakfnw/vNSCJ/StBpFQqGxzwTCkSwe+im0Q8ViIUoPPqvj69Se6T5kPN36Ibm3oGTnrkG28EaAImyU6x0PHRYbHhenOkgpELEWnV9k+wiNV6Y0HY8l8Xm9UyWAhy0mDTJ8TxG6qpErR5pHB8zN5CYJhJ1CAwAeqmzMFKwynEleBEyc34LHbBsMjmL8+sE4iaHm+dCpsCKAVvMJGHANTemcFNhiktzfsByuAivIPY2nMyJEbfR/E7A3JG372tk+Dr3KXveECUEY83TfmPor22yaoH4zfZCsLni7hYlRz6js0pan+aBc2a4O2huowbWXen7h1lyqx7nBz9nCTn+tvCjA9BaamSTwX2cjQIM05leW3tr1HIfuHm3dw7Esk0Eg9AZdEMxJVe5npE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LbvPcK4L/pgWBUQG0+a9QUje5uwDXCnPB70vryQmXNpa65N135UbKE87o9Ee?=
 =?us-ascii?Q?Yj0Sp+OjrDGfhCrut/bDFfdaWshzxpPoTpKGbYXVf5CvxjKiWpgCzStRjCgC?=
 =?us-ascii?Q?P2xQugTfJMNbmEC1neywbbN4dwOFdUBqZa3Iybi1/vONIYPgl0cLcCcpw3mE?=
 =?us-ascii?Q?Xno/Ia+dkEe1cEGL3vTc9PK7029Z0pIAfcGlch91ifvCR9ldTu0c1hKQ8nbh?=
 =?us-ascii?Q?28YuL+6sMmkIepfBCv4uqIRcvB4zxssKBUxBL1M4usnsngn9mdjvTVF67Kxl?=
 =?us-ascii?Q?IQfJSnPWCS3F5E3cBw/8prR6jXOvzB/gC/LQPWUrtMXiQ0FUjpKOQuxAUWUf?=
 =?us-ascii?Q?5QJFnJPkb/bDml363+Gm/mDKp3hSE2nGV3BN5O/bgACLZ1Xe2pvibc3oeT36?=
 =?us-ascii?Q?/0WCDS99ZnMn39nwNfjAZ5NTozgwFYJyla/Zqc0ACYp97vlOIKvofF8IuRxi?=
 =?us-ascii?Q?CxZ3jWLE33rVqkt8FMblSP/8FYz2jtwp43k22QPQw8NYaVwG3yYMh2SiCs7Q?=
 =?us-ascii?Q?9bNPsaqSg+bE9jc3fPKCIoPmddaUlc95lAGtnPVh7zncKF2YKewXnMVHs4z6?=
 =?us-ascii?Q?S7vyj7I1HZHh/dzL7XA9Yo1nr6R39fdasgZqKwoVqLLjSIBcvWOA/1VuHeow?=
 =?us-ascii?Q?zX12gqnN3uMBWAWFk7lJXqYKaAmdyrZoyNq/SfMdU5ISH7ls4uUn3plT1sp3?=
 =?us-ascii?Q?7DctRVYvuHAt8m2X9FqVDeLGCKQbv4YNGbU/MpzccNqQTVw4jh9fvNm47Reh?=
 =?us-ascii?Q?alfbUUSBV0UZVefs5eXBvu0x1x0F2jhg0We4expwZi24kJQRWo5WAACgGA0m?=
 =?us-ascii?Q?nANa3DB5J0p2l1Hv0hcmdJeFzM0eWrt7O/sygLKjPi339SOM12xdmFeBRX5S?=
 =?us-ascii?Q?VHoxF2aNDj8Oje0Ycj6wWyUo/aVyq15nUBx6ZmVG4kg9h6WdVGmfKEY6KW6T?=
 =?us-ascii?Q?uxhUNIlr2USpJ72Aw3JTmkLV+DuR/wXNYaHfBwY+PEEbF/rfJ2ARM9dM5rIW?=
 =?us-ascii?Q?vNBVThitsCjPVrN22CBAImfIWvjtUgAlC6h6o1FQz3/dNFuPOi9Yl1DYg5EL?=
 =?us-ascii?Q?8/mXcA7YN2VKoW3/LxKv9nfjAo6EcUqkW9yjld3uMLts1L+r4DV06m1hqwU8?=
 =?us-ascii?Q?kc3k2wF3gzJKv4SaDZ16rbSElaAO0WrVDeUdMiz+f2yFPZuVqPDGRZkP6ebB?=
 =?us-ascii?Q?fnEAatOj0GvfvnY1Cy5yWwK8cF2Y0FejWMfrneLjRIckNUv3NF9Ar1RadTV7?=
 =?us-ascii?Q?/G1BjC+8wJWs3FWrBY5Skay3/XnC4HP8yWfnaUNdkomfnBY+8lF2qRUeM4hY?=
 =?us-ascii?Q?Grr9rum6FgRxoftKvCzhYWZwvyuhb1hRmavizXMRBH7QcGGjsf85zCF6Ew30?=
 =?us-ascii?Q?9V05m8ZzwDO50OonlJJlm6Hp7VZvWACbjJW//OFtadSpCIUcpmxsibRBgQEr?=
 =?us-ascii?Q?tY3XMgKXIgl5f97HFbuSnOcT4NpxCBEpnk6rzpTh/ifstQntwsuAHYXkWOQ4?=
 =?us-ascii?Q?B9O9ICPRdTBeQOSlS0qSgNxDKSxRreycp3lbyhcHHJwSbqki7kvlBN8Qecar?=
 =?us-ascii?Q?QU5+/uk1BB5P0YFYrDAc82FUlv+E7+Qes/6Hw9vXVLyJ9xkzMYqtlruz8XdL?=
 =?us-ascii?Q?Amb+CiqMJLm8UWCgMDYaBYzGncQBikm5ICO9Z+mUL+kAfouqqCrVM0DUrDXJ?=
 =?us-ascii?Q?THwxRbnZQJ2a6O+qm4YNQj9IkNuL0vbKEY5Hqq7yg3LQh5rsyrSx9PvZcFVp?=
 =?us-ascii?Q?vdZX+9jHpg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657a29f3-f2ac-44ca-1dd6-08defc0640f0
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:21:32.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QmqLYGatN6ggnD/l6T6m9e8rud7sZ9CiKVZR/MT0DtBQoV0QC6u5mJdmPROUGSHsxGdRMvhs6GelBgnSynLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

From: Koba Ko <kobak@nvidia.com>

Please ignore this series. I used the wrong version tag in the subject.
I will resend it with the corrected subject.

-- 
Koba Ko
