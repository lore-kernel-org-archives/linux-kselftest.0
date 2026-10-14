Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36F2F6577;
	Wed, 14 Oct 2026 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958679; cv=fail; b=sy2K63fdsBvomKVeBnPtr2m06mYpsdhoF3WUIskh7xMdOXhI7NhHW1fzzujuu1G5/FOUKKYItnnCHLEi90XMUmE1Czn+Ajc+ohxgmRgvX64yopo/HJFZ20EgAv/PdhSzb1BSTkTlQka76qvQ/7dbmPgKywcElc6k/XxifO15HIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958679; c=relaxed/simple;
	bh=zNUfU87BDN0K8qz/vGfNpkOpDShGW1dFfHTpKzvZe1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTr/A0AYZpNVmAfEU7meZQyttQI5Qgm1JNzGFabZISRhI/P0F0tBUiZi1Uzb+J4O6x1UgKqT1fsLP6cVhcHw8OTT4uvRIESO8T1O1IvxJ7Urv/C8C2i2o87RhcHhsW46lImq+nTV7v8ztxipCpRgVKwpGDNPgmzzB7PgiHWY/VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ayWrHAAh; arc=fail smtp.client-ip=52.101.48.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ayWrHAAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiDQvgmzfAHaOGoiGvodURHwJOIfjBwpdu9Kdzxb2qxRmQDGsfziEpyVE8WN4714npiHkrvcMQO2c7FV7H39TmDN8idKPbW3ivXyYeWlDCD0YbHTNUJtI8MUEnub8jypL/PG9IZqbEm5UN+fsWANjoWSproTZw40m/mb73SYxjnaoROmvzvJvEIj9fi5x80oTMVk4z6sIs3Vddb6lMePjQlRLI2Dy+uQOTR7X0LCJV05SlCeiuKiUDrU+lrV8IMYO7YiZsFbAEX7K8lggDAhTtw/XgZDaXa5pr/XWwf+F4pdioJxCZ0xqb8fK3+fwrlWrfaozJkRzRuNyOGL3Kmi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNUfU87BDN0K8qz/vGfNpkOpDShGW1dFfHTpKzvZe1Q=;
 b=VjvK+YvNFvnpVJCa6rUh+9gVVweso2bbTDLDK5RG0efG4COLTHB3I4j3k0BkDN0nGLdUOLWMVucKJW/UiFtiz/NM//vOfvSFB8X95xZcoqGYHsuFVlDFnXtwTqvek3jvFdAjcMLxrOBpwiERfKs01SOE4WG+H26TIGivsksqvwa0Eixq4clu20WLFrVDEYIYca5CuHY6Cc7qhqOCwDG5r0HbXdiB0XnWJeaUw6kBGZHlTkALWG0Y5VkED2LCfTBbqTSSC/RukFB3np5BAtUyMFP4ZpX4O2t9xNUmq/PuB2OgGJWMc/7vblTokiCt8c940vRr4+UwNhmjVS0EIQ27Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNUfU87BDN0K8qz/vGfNpkOpDShGW1dFfHTpKzvZe1Q=;
 b=ayWrHAAhJtMWInQGZHtzN7UE4eUkwSB4C/I+QURVs8u5DXkRBn2cZfEkNcVC9+vvTnMa+yBuNI9Vu8Uly0o4w8+o79ZP5zoEq8rPNiHXAHKZlYX2vyndpdqmE9JSMUqz6pzuF7m10IFwOvNAmKQf396PUHKzips8IYkgcLT1n2VJv6vtuZPyuNEKsSEHb6E1bw4ZW/6lDoZrGvF1d8hQtVtULju1UvSJ1u56LNpCV1fwDiNEi8aLpcRonUVlSn4X8ZUJAAF/0vMgvRO9vIO8fa33aiht0uEM7VFPSIQNGwPeDZsTM5los+E8nahl8bWIBMebfTVMznQ1FmuVDsJIyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by SA3PR12MB7832.namprd12.prod.outlook.com
 (2603:10b6:806:31f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 06:17:50 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 06:17:50 +0000
From: Koba Ko <kobak@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	robh@kernel.org,
	leitao@debian.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	tdave@nvidia.com,
	kaihengf@nvidia.com,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation sysfs interface
Date: Wed, 14 Oct 2026 14:17:45 +0800
Message-ID: <20261014061745.40032-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aru9Rf7BzW3-vcm0@willie-the-truck>
References: <20260825181701.3-1-kobak@nvidia.com> <20260825181701.3-2-kobak@nvidia.com> <aru9Rf7BzW3-vcm0@willie-the-truck>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TP0P295CA0026.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::7)
 To CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6c79c4-7733-42b6-d9c2-08df29badf8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	E5Araus8nE+rEtrcvPvl/eOGUl2/gyd4FN4L1m5z4L3HZ4Lyx991PH4hAYhHVUmgvL9DQr8nZx45NxrwuZ1n6WidSIUZ2lTs24rYLkMoEU8GJMQqj9I6NVi2xLuXdbg9J9EOu3yAIDaDdJbVt8J5VGpXK7isIhf267UFYHaklCqXBChPJ9A+WfMBRT6IQnvQpkU435qmA2aLdwmRoCePvr3B7N1c83avjpB0tOuZF8vqV/I3pdT1cm7LN5NQgu+d+niNXmbSZsluvlRSq0ZHYUSzuWUJLAnAzyfWre5+jppPXQRZ4dqfOQcPNqgNhip03t+P3nppGmqqpY9MzsbGSXSLVX2luaDLqLkPIZbDnbhXwhhA1CBq/zdrQdfz73Ss5xEhoWcDe1eBqBmJd4hR8WM0JpBTAWIlrjQpMSKAVc8hIzSH+xZqjq6/C5dVGJpfUTi90YKgS0olafe8ifi//1+DJRmdIEijDX2rxYLG1mIJ7HgN4V6GEyZ6FrkQpSoOEbdce3tTF5zKJSRPLvvcQ5pTHuXdq5Vq2Epiy3QdUeKz2fJLtyP31YI2TJDUKzrN3kjx8jTJGDQleqfTl5Ddl+Vc5l8pF18SXBxTIeMuMf6A35fkUKGcvXvfO5DgwBDP8/9IwmV9jh9Qjkgm1b67ihCIEA2iXanX66ofA5E3Acc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iD6jvjpJIKumX2kyiAdRxzQT58pV3E2LPnx0Oiw0jlHA1cUiXswDWTfDjr6L?=
 =?us-ascii?Q?l+PuVUcvc/514G8ZD5Zzq7adhiiJRzNqAxkHY3jeyjygxfI4X27HoP5jraZ/?=
 =?us-ascii?Q?SnFEzMLTiY/W3iw5STfgfTYTrjZ+r5evZQY6o9c0oYoxtL0mwxVd8WH1P1ro?=
 =?us-ascii?Q?ZZS98tZVT+G0Dm+VNle6Qza6jK7TkytT+NTW1N+tBWi0u31VBxgaOiZYLwYx?=
 =?us-ascii?Q?nLWb1FMLObhL47Y7tCAmr64yhIatklPcyN6ur7hsrdT6x2jI8TPIaqekx5Oj?=
 =?us-ascii?Q?XZEUd44mRjXSBtNt9aDHsKduYSv2FWjPC6uF6LaZdQBtTePjyIiVGGDZ9Nug?=
 =?us-ascii?Q?GRmUapw4YuYY44E41POJk5AUI4QA5bWv7o+2q1+dhkQr1XGbzcJu3QhMMPcu?=
 =?us-ascii?Q?o5yolQjS4rxPl/gOtdIeiIM1l/o8++OOmRz7GshcDXWZb/5dgK0fvqa5RJUN?=
 =?us-ascii?Q?cbURbEntm91hRECsCjX6AQrjle+tQ6jJumItEJ+Har4GdJkZeolEKQC0xip+?=
 =?us-ascii?Q?zyGAZB1WLFmGXMm7PzyZl3L9XojQqpUnamtp42bYrPMHT1wtTPvogV/dzmLs?=
 =?us-ascii?Q?nuvfzhpgW4D/MSF5gaFnHajdDQYuvaoGnuWrlTPzMjbd8+ABlh+v2Z5qUIIG?=
 =?us-ascii?Q?XN/WhkArkS+7ZRZbIzsqFnsZg3qy042LELPibQG+z2xq600lbQ2CuyZBb523?=
 =?us-ascii?Q?bNo2a79NueCk764lzGiqxD8BNqh6Phivmfw3z/eaqE5vWfVF8B9WE+wCqPSt?=
 =?us-ascii?Q?NCSHpAUnY+7GADj1xdh5XyAn2eeKT1rgD3VlxJ9jUq5S1ZVJ/vdoDXu/OHOw?=
 =?us-ascii?Q?vPzyLK0vhGt7ATWJfVLbXb5GGKjwt6/UtKFPXmKueQAYTzPgRhg/LRNAIIln?=
 =?us-ascii?Q?hpV9cDFRQXEm8HpGNMcDr3SAAPtwxS6cwKaVOwsgDCMtrkfdwypxdALs7Ipl?=
 =?us-ascii?Q?xDPX7NZiVDjd5UHlheeCgeoG+TmZH3CR5uanZ/akHQavnebUnyHg5CQvDrzR?=
 =?us-ascii?Q?utc+MbgVzjJHGMImeH3xV6PmaS63A3XgQDaR7xUAGGJxch8KfU0HGgZThtKe?=
 =?us-ascii?Q?G+upRN6J7iUPjO3/ne/wQCrWrvoTek0oSbUa6RmIcUysWnEmmt0hvZ06CiT8?=
 =?us-ascii?Q?rT0yeZtjUooixNwr3HsWHyeMGDURJA5nXxNTI3gzjRHza2L7WQZ75c6zrIWS?=
 =?us-ascii?Q?TgJgfz6PbjqBLpbCLtoySbtHLIhGh6bzuGMKQbzsTcKcDleIJ7RXEQMUtR5c?=
 =?us-ascii?Q?IzfNfd/c60oP5QVkBxkdsgdcSSV658hAf58GB52uBIl6Qaic/Bfo2qbbdaa0?=
 =?us-ascii?Q?qKuZdex214vxfjS5pF08iVpGzdcBLxMZet/qZwl4geLowcKI8kHhtqnLz3dw?=
 =?us-ascii?Q?jaEO1oTPQnUv42FhQl8Qr5hhs5BnEG/fZ7ttVzGNaIBZ6vaaCEDXxthszAu3?=
 =?us-ascii?Q?rIAnyJ0QkC/dYWGuLTevUptaSP+sdwXa2cDVuglyYzhur+ZY49Uzp21CmrxZ?=
 =?us-ascii?Q?5hhWmanSgqsvBkyeRm7PP6A2ZbU2QvneDxRNgc6ZE1JfAbgPeKh0DGRpfsYV?=
 =?us-ascii?Q?8Wy2Lf1ZMA6bEEEwPZBowQbU5LDLI6qT0uhPM/G6MHtNmcUCbj+3+In0eHEs?=
 =?us-ascii?Q?NTelEHv4q+oQOv72RQuCooO2Lpi/89PpXn6MbGAamcU2qdMmL1iYzWSnjiEA?=
 =?us-ascii?Q?GIqMLcYMqOL58+szYkk7asPCWyXc7SlOm34zWRXePf3NFsgP84VcRmNAxmo5?=
 =?us-ascii?Q?S8kVe8tdhw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6c79c4-7733-42b6-d9c2-08df29badf8d
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 06:17:50.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlpkX5kPp2Kq/DsiOcsAfxnFy9xQlKQdeI9uF9zr3EUc1xBlM8nYpN1LHGmmhkviG5Xr9d9M17Q9M2Izpp4TLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832

Hi Will,=0D
=0D
Thanks for the feedback. I understand that your concern is about exposing=
=0D
implementation-defined registers to userspace, not simply choosing sysfs=0D
versus debugfs. I'm not planning to submit v3.=0D
=0D
For controlled performance characterization, is there an existing kernel=0D
mechanism or a different design you would recommend? Or do you think these=
=0D
experimental controls are better kept out of tree?=0D
=0D
Thanks,=0D
Koba=0D
