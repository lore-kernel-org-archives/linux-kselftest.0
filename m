Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794730378;
	b=0eobj4h7Z8gNbPWwTLGA6eo4DsukktPFfBkqQXT2/c6eogA/GDK0Wy7rEZ5skCIdOEoz
	 7c1/nuIuLdx6MA/gLN4IQe2T76MdsrPMPddbKqJyE431PHo+ISQ4oosGyobDRfmDi24VN
	 JHY80zABpLYubpomn7jFRhiIT2fiv356YaYfzmtUE63cJ/0CibDpDeVfxKtk6jKUpJ0Mv
	 q/YwNx4W5oWFM0uOysixLLpEOKYK5XINT7ZwD63ATgu4l9OVZnjlYQHff4YL7wLgEW/GI
	 n5xOQqqt5LNVvfCf4iiL9yZsGUPNPqtuxfxwjHH9b9O/pT8MIqcx1zhh7AqQ6MJBUfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730378;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SA+EhCT/QH0S+d0cL496EXODgDpNvauWR6TfuyxPrPY=;
	b=TpTU/q1ZwHxdLkH97w4xgp+Db9e8Tciw2bSlegOGUKVVElKEsn7+h+exV1TbDo0L+Vbx
	 Nnzrd0hXpbveyLm64y291kDdRQ5AiQloB0PjAZPT/OOosIEKmP0HXKDT+Q0uCXeq+S7fu
	 zPiGqAAgT+42dQfJmnyWL6dqSq90NCcGDWK/FZDnCg8q9JGVlksEFEUTQqtTOyh0qPK02
	 6Vh+oBUl36ZyS9hsB7XX1eVBfR209WuALAGnxVKA4gnz/Kizb3qLxHOumrsOoHEebeE9O
	 UNk3OCzfV1ZSgYKJmog6SLdR2347CpkBK3Px3yZ2YcPYlOTuFhrYUpgaybqrfoBVtRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jMhu38iJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.26
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214F606A31D;
	Sun, 15 Nov 2026 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C214F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jMhu38iJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKYduz65Np/dWoH28zjJpETVu5HS93+xVCCUFpsDRIlsETK8/eWb3WlAHdLX0kxjAYmIuWqbscuQ5fZ1uxgUrleQYBeJ1PCqK4TLmUfqGyZF63LEE73TZcqamQVDd8873/BMYUHToV/RnFg3ew7Pt0BkfZ/w+TYOTStuSxgT4Kv13FaKMerqcfhnESvghRgcZU/EYk+BSfp/vO4OSGvTTaxUdq8NYdT+ofOSlA+ws4x3uf74giKOnYVt/cfO+Huo410mPTU9TrBpAS2V93s5crs9yGuOYOGzVbEjc0PqkcC2Emw62P5gefnYLtugQ/1I5otm+cGqTBmSOluD4KIU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA+EhCT/QH0S+d0cL496EXODgDpNvauWR6TfuyxPrPY=;
 b=KJJTuqOoErluC09tM+wfYfx96TRFHfkIl73oegKqBLF1B6b0zJLeSNLMDWPBAq3zW/CbPtyysml9aXYEAQBIs5MfySWBln9GaYtx8rYqIz2eFfxwwQ5/KoFFiTc4wd4W7NB9CoxySV04MniS3btVT9dBmPqEl4ys3NPPE766B1mzhqsBP+SEn/Jr3J7C2cCAB/ADBLktZKnkz2tZXpL36KoRIagYFCtgKp9eGwMidHPFgAnleR+XS6H927A1jZcU+Yf411dGELxgzTPlR5+/T1MbjO8o+4KViHKiCitIXn+D1XbWxa4Pe3aOp36xw2tCuXh1lZQF3jHPyB9b8MIW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA+EhCT/QH0S+d0cL496EXODgDpNvauWR6TfuyxPrPY=;
 b=jMhu38iJijgfRFVwO5i/LaBR3JfkOrHJ05/tnpJRcK+qSQggJuvFganbMy2nqv63/zeBPSjiZ8bn7HiRDJlBtdejtcXP9sdLdk+AjU1SpdeBCj+pyQvQkrGRilerBYJ5I6SopYxaG36ho6vT2Yn0ovVjEhLBpUKJKokHdsamCm16ta2A9Mx30Z0ugURuIsgjaNCl8xsvrUU1gtDeMztCt5zXmHmYy7kFIZMGQVgoREDkA4GXdAXF6lMoP4IW2XaTlZKgCZHyfwfFGt5EhgXI55iHNc7H6YfGD2kiTaQL79cPpZ7TNnIjWUpTk82OXVq/fQLQ4Konv6OHiZCdsRbbXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sun, 15 Nov
 2026 08:12:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 08:12:53 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org,
	ben.horgan@arm.com,
	fenghuay@nvidia.com
Cc: x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6] selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
Date: Sun, 15 Nov 2026 16:12:45 +0800
Message-ID: <20261115081245.8622-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcbf954-6cdd-4da4-87a5-08df42f03f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|18002099003|261102123227099003|56012099006|261026140227099003|261021121427099003|261022115727099003|261026121527099003|261028144727099003|10067099003|261021123027099003|261022075727099003|261009223027099003|11063799006|261022105027099003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	VCcr0al8sMwQoSxSzBAJLuG4vtF4J321URhyjsvFEsz2ozXf0KICiQmL6wP2ewS7Pep+n1+5Yzd7e+4kayPwdJz198EjfHoWAB3XigCMF+9fOYgAroC8eKgwZPnDHRtIltY53UK6omDUz00MOOJEJEjNRCXENTKSIUQDB+ZYG2Fw0Hwf2OeU48tBi1CPIuRIAqU6+TnMlPi5n0WNeRjCuP2r2ad7vsDhiKBSBE0N6ACkQxW0IQbCZctgmvzg5r0xO5Y9ZJ+TODn2fNGJ2scQVks20FjHA8WjXXB+mdLG/hDIEB7A8PQqx/4edzDq2K0T7DBW0qjBZ6YvAZV4/nAS4gqJd0OLkOgnAvYFsWni0coqAsNDquAe0Y/BZXIlaHEIbo79izJ79GcaJHAXY0Z3HpMEJWwfjy/gK9O9lzCMeuTEf+Q23NxRiKfoNrCN64BPEIqwIOMbaMnVz7YZ+COGdtqea1fMDFWVQLLuBzQ5K9fMfUkqBNumG1c7ZZVVfxggwTofIZZ6pmKu+TdpNcnlg9YRCe4WwgcLS7btWHPhAhBc+ZBudIsiIxpJs7OapEaK4JCc69sBa4DvxMfVxXFH/01UQp5VpKYrB1k5zCwZSl+RmnjfxUHWoo53RqhJHQmsPGQb4bFTFpTstI743Bq2ZveNlF7d+qX9OAOBvGMflAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(18002099003)(261102123227099003)(56012099006)(261026140227099003)(261021121427099003)(261022115727099003)(261026121527099003)(261028144727099003)(10067099003)(261021123027099003)(261022075727099003)(261009223027099003)(11063799006)(261022105027099003)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckRnMitMMEhVS25VNmpheVc2QUxYcm1PV2ZuUE9pbXEyeWFFR2h5T3lhUHl1?=
 =?utf-8?B?bWJEQ3FTMlFZM1pheVNSZVd5TnhXQjAvakgzOXFFeUtENEt0Ri9MRkh0K2tE?=
 =?utf-8?B?YVUvdXB3T0t1TmsrK1UyYVdxelhldHFjRGxpYllJZ24rMkRXNTRoQnFsaDdl?=
 =?utf-8?B?Ry9TclUyeE9Sd2JVZmNWVHV1U3pJUnJtbmlyLzIwRktpMGRRWGo2Y2RXNTJQ?=
 =?utf-8?B?ZVk1eU1SUnZoSzNJcVN3T3R4MGxDS3hYQndwTzJEOGpBeU44VDk3THM1QS9E?=
 =?utf-8?B?R1JYbnNxNHUxSW92ZkNHc0Nwc1NtODU5bjhNVC80RDc5VEZYYkx1SDJ4MTk0?=
 =?utf-8?B?Y2JMdzdqcjFNRGxsclQyMHo1dVByZldBbVlGcXJxUjZXYkZDRUdkTVNDQVBa?=
 =?utf-8?B?M1hlRnFFY2VvM2dkM2tRSlNwZkh2Z0hWTDNieUdiT01kcXlUeGJ1NFdrL2Fo?=
 =?utf-8?B?akx3SVRuSThXZU5nOVdOdjRLSlVZWm1UK0MwK1I0TzJjWUVLZ1g5ZU5VZXo3?=
 =?utf-8?B?dkZzcHNZOW1sY1JXWEVTZTJuZlhDWW9GRDQ4TCtpaWQ1VndSb3lIVTFaSDF4?=
 =?utf-8?B?NWdFanQxQnZVbUdaU0lTRVRNa3JzdU9rWWNaUzFubjF5YUh5dXRRRGNBd0J5?=
 =?utf-8?B?Und5cGhyTmduWmFma1RKQ2RucllTQnQyNzQ1R1RPNjNYbmdoeCt0YS9WVDZ5?=
 =?utf-8?B?YzdVVG1Td3p2QythV3RCajBYVFFBRWJXK0F2MUtPdHh5UitiY2JZMUpMek5Q?=
 =?utf-8?B?bFkwRENRNGpaN2Q5NnBOUXRteVNDelhEc01BN1Vsc1lIUTFRUlFZTW1vcVIy?=
 =?utf-8?B?cEI1RC9URE80MnJySWZzMDRVZGtvRThLUzVMT3h2bStrZzVjSUhic3hRcWZi?=
 =?utf-8?B?NmRJZVl0LzRmajdjazhDejBwdUlBdDg3SE9BNHI4dy82ems3Z1RNZ09XSGVK?=
 =?utf-8?B?dEdQWXpFR2xndllEMjFCeDRsWEhNdVJZL0R2a3JOb2hRdVcvYm5EM1FiZGsv?=
 =?utf-8?B?Y0lubUp3bzhmTW83bEhkc3F6Tk9WM0c1WEhtVTJ1TDFTTmd6ekFvcHoyRnU0?=
 =?utf-8?B?ai9aTHBhNnN5Y0RBVllaQjBiNzVYb0sybXNWQTlmbWN1REVYSkZ6TzlUSmc0?=
 =?utf-8?B?OGVjL3YxYzhPZm1PL2RwakVHV3gxZURjbHNmNFJ5STRDUkM2Z2djSDNKME9u?=
 =?utf-8?B?dkgwa2FobnJSWms0TEVELzkyeHJWakhicEIyR1oxZW1xVmVLYk9WQzJVMTQw?=
 =?utf-8?B?cnpPait5aEFrSUZsczd6REFqdzBVSDU1TzcxMnpHd2trWFgrNDhhL1kyVGF0?=
 =?utf-8?B?UC82dU9wdll1S25ZU3BwVEIyeGNiMFdEQzNkeWFXSXRPV1AzczRYd1lRdDFh?=
 =?utf-8?B?V3A4VUdzcVdWbDlsTjB5Q0JTakN2akpsMWNjOU5JRS9WMmdHYlh4bSt5NWww?=
 =?utf-8?B?VG1OVmVmQUVaTDFxQSs1WXNRbHR3aXBlNE5PRGl4UzNiQzFFWEJJelJrUW1r?=
 =?utf-8?B?NGp1U0NmTWpLS1lzM1ZXR2luM0dmUWhZMSt2d0RQQi90R2U5V2lIbG9mUEMy?=
 =?utf-8?B?MEU2R0ZMZjc1amFpUHpuRzZTZjJvNVZzcXlyd1hrQnpBMVVqTnAvcm4reUM5?=
 =?utf-8?B?U0hhNFRKSXNjclF6cXMyQktXVS9YQ0NzT0Y1UGlEK2l0eUdYVVZVZG14Wjc4?=
 =?utf-8?B?dnhseEZ5ZVVaT29oNzlwbEZCbGRQZnFrWFNXZ3BBUCtYb2VXSVlsTGRBOFBv?=
 =?utf-8?B?TjNuSVZrVlp1VGFYbzNCZDJRZExlVDNXdkVlMDVvclBFbXFManA0N3d0eHhL?=
 =?utf-8?B?ZWxMejdPYjQrSmlJeDJBbE1IRG40M0NZM0xncjZldE1RU0htdkw0djBKVnpa?=
 =?utf-8?B?Ky9PTEhlblprUnBXdEx0MDJvdjBNenFMU0VOSXFvdWhiMkVlNHYrVVZFK1Vr?=
 =?utf-8?B?NGl4MDNSUVgzbzVMUVF6d09iWFRGRzcvSDZleWJaT0hFdDBDZEJicEJwZXVB?=
 =?utf-8?B?UkZtT0ZybSszZGpwZHYvdmlSQ09GaFlGekVoMVFQNitZNThNeVBTdGE5Znl4?=
 =?utf-8?B?ci90QXVpZ1I1NGZLeUJPa1VxTG84Tm5ySmZNeGkvWml1cnpNeEVBUEladWg1?=
 =?utf-8?B?MG1RQmd3VjVsOVhRTUZwYlNHaVp3a1M3Nk5CZVFrK00vcFdlekttZC9JbHRL?=
 =?utf-8?B?MWlsd01MeVlxN3RCaHd0V0lmMUVaYzgxcmJtdlEvRjVSYTBnUzJ1ZVJBem1i?=
 =?utf-8?B?OWh1dEYxUXNMVUxDU1hISTZNVzB2TDVyL2QwUjRJVXg2Slk2dDZ0MXR2VmZI?=
 =?utf-8?B?WndCZHZjS1c1SnFlSVNhb0hGQTA2NDU2bGJPQVZVSHdJTmR0anNBZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcbf954-6cdd-4da4-87a5-08df42f03f2d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 08:12:53.3486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/fQVzDTCzVx6LSP0WXgiZnbShWvblTdGOjT1tB6o7c3UpX/O0XeD+CxguIzkB74sVjC7vx+GbsCfYPY4AwJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
and arch_supports_noncont_cat() falls through to "return false".
L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.

Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
add it to the AMD/Hygon always-supports early-out in
arch_supports_noncont_cat().

aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
mandates non-contiguous CPBM uniformly, so per-implementer handling is
not needed here.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 0a417267dd74..7501ecef52f9 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/*
+	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
+	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
+	 * IHI0099.
+	 */
+	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
+	    vendor_id == ARCH_ARM)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index a7556cdae0de..03b4500c1f7f 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -41,6 +41,7 @@
 #define ARCH_INTEL	BIT(0)
 #define ARCH_AMD	BIT(1)
 #define ARCH_HYGON	BIT(2)
+#define ARCH_ARM	BIT(3)
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..02894ea79bba 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -23,6 +23,15 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l2_noncont_cat_test,
 };
 
+static bool detect_aarch64(void)
+{
+#if defined(__aarch64__)
+	return true;
+#else
+	return false;
+#endif
+}
+
 static unsigned int detect_vendor(void)
 {
 	static unsigned int vendor_id;
@@ -34,6 +43,18 @@ static unsigned int detect_vendor(void)
 	if (initialized)
 		return vendor_id;
 
+	if (detect_aarch64()) {
+		/*
+		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
+		 * MPAM-capable ARM implementations follow ARM IHI0099;
+		 * treat all aarch64 builds as a single vendor for the
+		 * purposes of resctrl selftests.
+		 */
+		vendor_id = ARCH_ARM;
+		initialized = true;
+		return vendor_id;
+	}
+
 	inf = fopen("/proc/cpuinfo", "r");
 	if (!inf) {
 		vendor_id = 0;

base-commit: 30af56a227e27b892d34bc44c23298b5274913e3
-- 
2.43.0

