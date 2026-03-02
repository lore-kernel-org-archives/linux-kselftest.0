Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6C38550F;
	Mon,  2 Mar 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436964; cv=fail; b=Uv8wMXmWbm8DWkdd7uvRoD1sgIQ1tO3MX/cvBJal/bWeoxFBe9IxXFnc5MlA0tg5NDwvz5LmD1AbCQ5dXezNQIk0UldQUQqXqNP7cVwZD2+lWXiLRWgbaAfiNbHC7NQo0Xu/CTUYJ1FZdeDUGDZefntDSNrmWs1z3ZZw77LRbM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436964; c=relaxed/simple;
	bh=B352yKLMDdkgwCz7CECLqJvpvALhNF7b3nEzh+r60rg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=meiO6EuyvjnyPls6a8qirSf/qEx7QBzYEq5jI73f3N797bJnBknD33qhmNA5P4h9Qxczb4Rp76QmfdJTRFnmTUjeU6DQE5ZrVnXWUMIYz9/7wI/4GO6lqGU36AruCx8dayMDWLy0wPbnHq2fHEejxf4c+yKPhQFl07mWRRKMFAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=GuqO1MCN; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="GuqO1MCN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4YCk7HbzKA/AAoFqYGD11wrJIBmJtWfHVhoUqvaUw1vqy0Iv2st0uJJaatKQtrMJTED4S/CfKPTIKX1OQ9yYIK0jMsx+3sn9Xc79YsdqI/KlvkICL05BooZIjEoELpPKnMIZjmBPdorS+8K3248P+e6/XTDjK+Ae+SH9quSxZkPmG+sdzut+ppk/tKhB7bHcW3lQI1yxxmffw8G/1CwCUO6Pe7TikTjIDPvULjdh6TcZ2Rrd7/eWQbTIBBg9BQ/F6LGPWdpBV1PElbO3OMK5PFMg18mI+2Xpco/Y+Gth1JFiCRxKa2afkNvsHqbh8qu3yK0+XpkSx/w84/WxTHGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAGckS+LRaE68IhkXqnwdaf2WOZRrtfbUPWhTCJrKMU=;
 b=b0cZ2AQf1+B6IEQSYkHXL4uQuSVdedUluB6iUO7rwNEtXlFzD5fnHwJa7r8E7QKQ98GHN/EIr8AqM3iMBWn8/3bhulrBBnAhaMiaqXA58M/tE/S4uWIOgNMBV1ANn5frHjUWQDBuTgg8jH3iLKlBj/4Xz4bAUl26PsA5hA2vmfUlYvhF5upzIdKz3EZZjBLgAqmPfz8bJy+ZaLatoLF2p1Jd/lf7oEszeMJGKg+s3VwM7u2pAXgnEFEv7K13DyUV8WRxuxM45LGrMsIAxrYbIRG4YUzre9HanqBEdZ501JtjUBysvTgJFIYEjvJonXsi1AnD2diM19wLXWAg1BVPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAGckS+LRaE68IhkXqnwdaf2WOZRrtfbUPWhTCJrKMU=;
 b=GuqO1MCNl5XxHof8N/PlAmeSL+qxut6FMA3AtYLRSYwJ1wm26GgQ/Hs8b5czbtfDqdl0xSCB8YvdwtRQEKc5BN2bGTFRWp/Q3JCHeI95tnktulIh8MmdIihdyS2a6p1N+25H5KQAwZihoiwCT7U+NDfQyLhO74xX3eDG2lP9Ehwj0JJzTbkAQS1yk1jNjBJ3HIOVy0yXMesi9fqPwd/gwDlZq03XjPkxSMcFwGo54/T+p2Ooz1VThSlcrGq7YONEUKREwrmFk9f6/H3B4kK6+0PYrgd6mn05IpxOcNs1SktQMorF2xbOUw3o5vebeDUD+VA5OFA4hjcHU0MeTcqzgw==
Received: from TYWPR01MB9923.jpnprd01.prod.outlook.com (2603:1096:400:237::10)
 by TYRPR01MB14014.jpnprd01.prod.outlook.com (2603:1096:405:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:35:59 +0000
Received: from TYWPR01MB9923.jpnprd01.prod.outlook.com
 ([fe80::245:b736:f3ad:80c5]) by TYWPR01MB9923.jpnprd01.prod.outlook.com
 ([fe80::245:b736:f3ad:80c5%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:35:59 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Reinette Chatre <reinette.chatre@intel.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>, "ben.horgan@arm.com" <ben.horgan@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "shuah@kernel.org"
	<shuah@kernel.org>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 3/5] kselftests/resctrl: remove unnecessary
 exclude_idle
Thread-Topic: [RFC PATCH 3/5] kselftests/resctrl: remove unnecessary
 exclude_idle
Thread-Index: AQHcjCGwOW0s0hiQEUyJd8WdcvzeVrWHVCaAgBO9JUU=
Date: Mon, 2 Mar 2026 07:35:58 +0000
Message-ID:
 <TYWPR01MB99238EF3E9F54CB72C4C2FEE8B7EA@TYWPR01MB9923.jpnprd01.prod.outlook.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-4-tan.shaopeng@fujitsu.com>
 <ef8a9e9e-0d44-4246-ac74-0369b78f39fa@intel.com>
In-Reply-To: <ef8a9e9e-0d44-4246-ac74-0369b78f39fa@intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-02T07:35:58.109Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9923:EE_|TYRPR01MB14014:EE_
x-ms-office365-filtering-correlation-id: 01bc6afd-617a-4477-98c4-08de782e5903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|1580799027;
x-microsoft-antispam-message-info:
 yfuz3VvGP8MEI/H4h52MHB4GptWv9xZZnn/sTGohaFPj3VratjA1sozKW5cBGGEKwPnKvuEgXXb3b2rLCh6ArLvZUKwuJPXwsDhPAb1QZ42eN2VW5XE8nUPmoFITc/369DFM6ZNzvQYfa4ULfAzMsG/mdY+Dj8IQUDNIgdiGGQMMsXxNA6sMdQdQYy0miuBpeJrpGy1bEQdluYKoGFjbfRCkB+SdIp5i6M/8fA20Grhf9esNjp6MveLX1nEd2br3RwkJKpEvbm7+Gt0RQxN9+iUyAZ7m+zg0CJKx5SoSwdgLLcQhMJ/dh3EgLjgiqXek5DM0wEOOHL83hvxTdTvqHoAHuMgzqiK6zHSFU8H9nxF5QJ9axXQIjgvfoG5kskuGHWb8qDu3Fb4aXexE2f3f0DB0m4wY3S54kkD3Qxm+w+SxZXQbuwdURUc9lDB/EUed9kRomAalBi+MTrbiyn9xpbLtubN3uK/auc0mwbOr+jRGKvCbKkwk9X58+nFTqCzY8vJcRwkWte2z3td3EM35wrXh1mdYN5H6JSkuOOOho6osSNj1ZDSapGi/7lAqu3IKy/ISMl4fx2c1R7s0SDcBPirx3Pyi6UzqVedO15M5ZCnAXeu05RmDoDyBQJ9lqXIRbhukR2WpMg2vtWINzg4GE+2p20ACge9GR7C/ooYP2Y45v/kZ1Pt7oVWnfZw3T/1VpS1AunFdhVDQIktO2C9OhnaFDDhELQeegOtjdtv+qy5BCQDMBPTTe1Teq55aZTenMM68raxgNpWVBjucJ1ITkDZmi8IrkEf7aYIg4lg4JWiS7uZd/QqC/gCi7GMC42L8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9923.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?MmdkNVBPdUR5RWFTQUZvR2pkZ0tCcEpnaTlRcjBUMU9QRkl2RGhkY0ZP?=
 =?iso-2022-jp?B?Wm1MaENLS3NZeDFiOW4rUnFvcmFpaEp2K3Z2U2I2SzgwWVhmdy9nZVY1?=
 =?iso-2022-jp?B?L2pRTlZDTVJsNWZOT3lUbHN1cEYrT1dlV25SOE84cXFDUXJ1V2c2MTF1?=
 =?iso-2022-jp?B?WTlEMURSeGU2SUY3TFZSNm90bWZ1NkJYeFcyNktMenh6NVB2TzJTSWFL?=
 =?iso-2022-jp?B?Uk1JQmt2VXhEdEJFa3JMTVh6WmhSbUFhUzR6WlhQaHpDNDU1NWRraVp4?=
 =?iso-2022-jp?B?TGVqbkVDamkxQng0Q2YxTEY2M3FCOU54OEwwd1QzQkdjSGlNQUdZTFIw?=
 =?iso-2022-jp?B?VVBtZFNtUWJqTGx4bVhZUXI2U0NqVkN4bVNzUUhNZzBMOW9vMnV6L21H?=
 =?iso-2022-jp?B?NVBXZmJpV3FDZysyeWpnOGIybjZtYVBGOWZaeTFFbUpJeS9raE9WSThF?=
 =?iso-2022-jp?B?SlY1aXYrZktyN1VCcHR3K0VCZUVSWi8yOTFBbkp5V2w4OGpRcGFVVWg2?=
 =?iso-2022-jp?B?NVE3TkttQmc2aFRoakwySEpnaTVaandSbk9GL2xTb2lkL2phdDRTVEFS?=
 =?iso-2022-jp?B?RGZTN2cyMEd0K0p1RnJTSjdxc2JBQzFySGpxbGE3R1lWT2xDaENCaklu?=
 =?iso-2022-jp?B?NHF5bS9PRFhqOWUrK2tnUVFsS2VGQlBmSUp2cEdXc0YvazhDb2NjM3BD?=
 =?iso-2022-jp?B?Ui9RV1pWM1BKdXFBRzhpZVJ2R29EQXZ1bmJTdmM5eGl4WlB3c0FXS2Jh?=
 =?iso-2022-jp?B?RWdFcnFJK3VyYyt4bUcrOTA1cENKQk90YVJub3ZtU3NkdzRUakVOY1d6?=
 =?iso-2022-jp?B?N2pqdzZYVVVwWEFGdmJhdzFCMlZYSTdXTjFGV0pyU2t3UnBvL05RRWRv?=
 =?iso-2022-jp?B?M0RLTGdxaWVGdVRISGJVaE5Rb0ZFbzJwZDNNTE8xVzIrSVV2ZW0xbVNH?=
 =?iso-2022-jp?B?dDczMi9PVGNrZmRrNW83SEFySkJNS2cwZ3RJQks3ME1oMnJKT2lsbFJM?=
 =?iso-2022-jp?B?ZkY3c2RqU0daUndSRnRoQjNPVnpUdEZxemxsdEw5RFFoZHBnbzV1L0ZQ?=
 =?iso-2022-jp?B?VlM5bk95RC9qejRHbkxJdWNTL2taQ0Zub3Q0M0NmQ3lHZzcyNXlXR051?=
 =?iso-2022-jp?B?OHRJemNDVFlZOGQyQm9iczNpTFdLajZYalRod2tId1FDNi9WekNnejBL?=
 =?iso-2022-jp?B?ZkdCdXBUTWFUbTZzU1Q4bXhLbk8xY1pGQ1pSMzYyeE81ekYrTUtvajlN?=
 =?iso-2022-jp?B?Q1lmSzN3YlBab01raC9PYm9EL1VRbHRCZnRESEd3QzZCTVJLbWs1bjBo?=
 =?iso-2022-jp?B?SG1DNTk3UFJrNGdFcEtSb1U5cGdDbGo5OUtmV280eXZ1bEVhRkh2TDI2?=
 =?iso-2022-jp?B?OUJNWFlLc2FRWXNwWm5PNnBWdEo3cmdRZVQwT0wvRVhCK2Q3N3Q1eWMz?=
 =?iso-2022-jp?B?QUxjTDFTdENwOW5nTENsdU1rNDlrdjl0ME4vbW5BdDQzWURZY3BIYjNz?=
 =?iso-2022-jp?B?SjhmN21FeFFwa1NmV29TeUJEVHB1KzFqRlE3cmRzVnNGSEV5M2hDZ0lx?=
 =?iso-2022-jp?B?Unl0Sktid3hhUUt2bUYrMjRJaHc2RmlwWW5SNnlqR1dCd1NxNzNKS1M5?=
 =?iso-2022-jp?B?R3NpUHB5clpqU1pzQ2hjK0xrbVpaZnhmQWx5emtJY0xicm5ySzUrcUFS?=
 =?iso-2022-jp?B?S3pGZEd3MjZFVTB3Wm82dm9HNGNwMEVBY3RHVVFaTE4vQlBFRGlEL3Fn?=
 =?iso-2022-jp?B?Ukt4RnA3K09IOXN0NEVaUFRJOXgxOW55bHU3cWxqcU9oZlVEZDFVSlJJ?=
 =?iso-2022-jp?B?aDNyb3JadE9ETXZFbnhzOXhqWUcvQWdxYkU4MzBNT0VmNUJhZjVNb0xx?=
 =?iso-2022-jp?B?SVNaRWRkdlFqTFNzVDJqYyt3Z0V5UlhGaStlYlE0a2lBQkxnK0tITzlQ?=
 =?iso-2022-jp?B?Q1FTTEplVTkxN1EvSnFvZDFmaTRLYkJ5ZGpxMGI1Z0EveHFySVF0VURV?=
 =?iso-2022-jp?B?RUczODZDN3NHR21WYWNNS2JzSmpTRVI5M3hYMDFROFpWcUtlaGlPYWRL?=
 =?iso-2022-jp?B?VkQraWE3RFRpb08ydE9SMHFxcGhiNEwrMCtzaUlhOURrOEpjSmJvYW9j?=
 =?iso-2022-jp?B?aW0wbGVqZHcwQkRjZUdTQlZzeWZmV2pOVlBZbzdsN2FWZVd6Tk9pRk5k?=
 =?iso-2022-jp?B?SUtSeG9qQ3dqY1l2dHA5M3YxS25iY0grREpuRHlYMHVLZWozOTNyckxD?=
 =?iso-2022-jp?B?V3BzRnErU2pvLzBPbHBDeFdHc2Z1N0pHdXNLcGRPNlFrOW5BSHlLeGVh?=
 =?iso-2022-jp?B?ejVzdjQ3SVBwSnBwYVUvR2p4bUc4TDdwaU5ZUnpzTDZlZFRsRnhYZmd4?=
 =?iso-2022-jp?B?ZHVWN1V3c2ZkRVlBajBSZTZvTEY5T1E4K2V0VmxEb3NBbjBicUxxdzRr?=
 =?iso-2022-jp?B?WUllZkFtMW5FUjBBTWUyNUI0WDltWHRiOUFVaExGYjBSTVNPQUR0NEFo?=
 =?iso-2022-jp?B?alBjZHBqUWpROGIyeURXWk1EQnB0djlwU3dsQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9923.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bc6afd-617a-4477-98c4-08de782e5903
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:35:58.9828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEI0diTOohrCw8W5+xsdjt2SABQiUs5IW7v3RBDuTyRkTh1zD3BOcqaGp0iMYDuo4ax8i2pQJ3nhBIBlxKQY0bjn4gs43+IopDCoY/fKEV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14014

Hello Reinette,=0A=
 =0A=
Thank you for your comments.=0A=
 =0A=
> Just to confirm, does "not supported on Arm" imply that perf_event_open()=
 fails when=0A=
> exclude_idle is 1? Thus encountering:=0A=
>         EPERM  Returned  on  many  (but  not  all)  architectures when an=
 unsupported=0A=
>                 exclude_hv, exclude_idle, exclude_user, or exclude_kernel=
 setting is=0A=
>                 specified.=0A=
=0A=
perf_event_open() fails and returns EOPNOTSUPP.=0A=
=0A=
perf_event_open({type=3DPERF_TYPE_RAW, size=3D0x88 /* PERF_ATTR_SIZE_??? */=
, config=3D0x3, sample_period=3D0, sample_type=3DPERF_SAMPLE_IDENTIFIER, re=
ad_format=3DPERF_FORMAT_GROUP, disabled=3D1, inherit=3D1, exclude_kernel=3D=
1, exclude_hv=3D1, exclude_idle=3D1, precise_ip=3D0 /* arbitrary skid */, e=
xclude_guest=3D1, exclude_callchain_kernel=3D1, ...}, 14260, 1, -1, PERF_FL=
AG_FD_CLOEXEC) =3D -1 EOPNOTSUPP=0A=
=0A=
Other suggestions will be addressed in the next patch series. Thank you.=0A=
 =0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
