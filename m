Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793803454;
	b=Vznq7jgRO+UzkKUXceCGITCxssFuaS3qnnhXe/CSL0OeLj5xCpCCuiBskYprsicNOxMn
	 1Dn/ua6LAZu41fUknzZcMI/oP7EbCjdAdAfNGuO0J+zzIyZ1aWGYdHJOz+W2yZZT9yrrM
	 B2ebxe0TaoC3xsyFzUAS2kZc+3kKOjOyNd7puoCkbE+27nMEC21TQ9dQDJu6D72Abjfcy
	 w+bKaKgBKvwxlZcGuz/dmck3my/FL4xyXFY4M1NIVSTJ3ZHjaEsy0dbjwXTx+0JGALwsA
	 BhHWVm49WgRyPQsgudwLc6TWPY1vAoRdBGcHeTumtj8BVqIuIV8mMpXE95GBPVm0ANA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803454;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=U3It1qhKMlX9vkVTH5FEDwaZbMgweZF/zJfe4pxqi9o=;
	b=yxxgLxUc+WE/VwG1KNbumIVZr6ng6makhkYVyPInlS6XpHy9wN2CGewe8d4MI7ez0miW
	 Fue5LtiO8RqWoLc3+Og4pXbHojjTFuKTns7ysaloTjW8oNeTT7cPQLxLZ4+Dt1rqo7/T9
	 RYSuIp3G02/lJuiWxYfmFlPaqjYji/AdYPGAcCo5QVEmYmS6G83VtGTtHX3i1jCwDhY8I
	 dEt2C+gvB3Zm4FF63sOCB3IK7Nh6ZvfozE4fSjaHxknGzBFMSn6mzq2SYGpaVevWNS4WP
	 ity8esGmmeTGyTRUAg/BferWMV7k2arCGUv222G6bxiYwG6GmMOeBO5Vugddd5GuA7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ff0B9iNi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9BC606A31B;
	Wed,  4 Nov 2026 14:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ff0B9iNi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLQjJUajl4gKgfTcOUCzITfCbxsTgGlOlqhNSzsUGEsF0Jb0cqZwGjzLSa3gzSvpzBJxVyQ38irIP86speId3RT1DYS/mrcJ47Q79olrWchwWxKI6ZxWO6s3nxO6LPR05fbJjM9sHZs3c4Ex5swtYOnWLNOHgf0qLFg7ARxj1bP/aIqAhzrvFScinog2T6OtIdZCSvYdiWxFpCiBzNjHlgmJjG3K7BAGs/ELbIj39vX5sPBWfVoflQPBauPK4sgLpvTNBJZZOCQR6wbPowLoS1E+o2Yuic/oN5jNL3S+QkmP/v+Y4DnQkz2UIe8prml1Pbs1cnUMn8NUbUCUOmtMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3It1qhKMlX9vkVTH5FEDwaZbMgweZF/zJfe4pxqi9o=;
 b=cDLxqR0XYs0d4m/VtZL2y65enFgb13DC08E0Pd+36/4/bsgJz6ZsFYkRErckK+ed4B7+m3wlZrCkWKEsRlHmuqFHOjRI9S3d8/LKiz2WaLMPC85gKF8ODvuQopIaXhBPnyg1MCEcnDAqufWN2ytZi5aXvBUH2n8ssFX/cEtnnXNKesQcQY6BO2eERtFD7F8fm2myoJJxq6Jj1txJMIyRxoTFstuYaMWDYp7jO3cc6FcN8wL3OzXlZFMA/JtAfoM+cKAW+tJG+iNe5Z4hgmtvDvr2x/yWwYNyDO2xh+FUR7G0BxyYLakZ3BhClMD5ZrEYpn8ht06oruIpRPEadE34sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3It1qhKMlX9vkVTH5FEDwaZbMgweZF/zJfe4pxqi9o=;
 b=ff0B9iNiU3if2CymR7tvc+VytM/eRWI07gBDk9sDe//wzIz0qokJiegtZl8HkiuGpC66UB8oN42B5XZOZn6fEwO5+X4DHY+yuNrOKAfPg4TPrV/1XqfqdGlKo8sUVfkTJ+6No+P9bS3SYCMPl9m0zftCz3cNwZILfZgzCyO8Tjl17Y2NoVeZWX/lTX6eqaUFaKdk0NvLopm6ralyk/kZ/5XW1mQi5B1/MiFRmFVbn2tlVTiCx67O1UaUQ/092RvDLUhvzTRiqRK+FOYvJAr+8aLQyr1U/Nq2sfzRkItdN/OF327n1lisAMOlShVQWMk4tEQrxQnEXoy4WI3mroiwMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22) by CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:43:58 +0000
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205]) by CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:43:58 +0000
Message-ID: <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>
Date: Wed, 4 Nov 2026 15:43:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 sdf@fomichev.me, almasrymina@google.com, bobbyeshleman@meta.com,
 asml.silence@gmail.com, razor@blackwall.org, daniel@iogearbox.net,
 leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-8-sdf@fomichev.me>
Content-Language: en-US
From: Dragos Tatulea <dtatulea@nvidia.com>
In-Reply-To: <20261103235152.1904727-8-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22)
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
X-MS-TrafficTypeDiagnostic: CHAPR12MB999248:EE_|CY8PR12MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 616d4930-d87d-439a-2a4b-08df3a820ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006|261102123227099003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	vTom1vmdp0BRvbn6f9kvbLs7QMgCmuOq6nn6T94Y6TFSSv2VU2jHY1R2BhD1iGxzq6pj8Yu6uKtZWRVuFVHxjhmXzkGrAqaZy4pWMovzemX4EmF/5f+Kgl5fpXyvPW8g81HKNjAcDwkqx+1ZU3tiMxo6nuNHPYDV1LnL5GeOj9/hPoybnx7lVHGdkdWEy6Nxt6ANKVuMPHekTXppcoP8V6ng278p0RPx2lK63QCvLYODjqtjBq3O1+LVU6Gsh8sqzj8+Ia6P6eUywdq58/VYoAEu7M0v3l+RJT7zlgBQTg0ib5zYPS9xGHjTd/hS0dnHEM8NWI3SdlxTDBYjr+5RjTtEUKKnBq7///cPcgxSsy2adNUekuh/OI6Gx/kGPpsdtya9DwMs9W2Ydjxno1R4Eg1XC8AhkWo2s1uH2mJZ0UpbFAg0fFSSSqYPCOT1rwmeCKtTB9bP8jUyRfRTYdcIArRYRhx2CtF6cX+EIEJ+B1/sxT7x8aKON6pO1TmAAN3azXD02d5+ipKUvnYfduK/iG8LHRKvyQn4iQr+bYo+lNA6gE283xMr646tNRJfW3dapQ+AV4lC9lbFpawJdOXNHq1hB0B8Sab8pnGzMYphY3GPZLOX6Fw9SY5mM/NCPqMi1Ikje5/FYPhYTcMrUmDjhoviDA/R50HO/72gy9IpIMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261102123227099003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkpDcnk3cnpVSDY2R09VK3QySEhsVWNMU2YycndWNkN0Y2x0cWdQOVF4T25K?=
 =?utf-8?B?TEMrS2l6aGM5NGVBT01HcDBlamJobExHaXkwdGYwTEZkd3RQZkNvVnFoZTBj?=
 =?utf-8?B?OEZTaVFRRDZ3eHVBMmVJcCsvNUlUb2tQNjdsdjNYMXAxRWd1YnlIRlM0dFE2?=
 =?utf-8?B?WksrbGdpaFVBaDZnQVJTRjVnNDRHQVB4ekw3N0h4QjZNaWJhRkh5d3dOd1Ur?=
 =?utf-8?B?WTVHR1BGWXBnc0l5d1hUOGRhNi9aUzkzY0UrazdWNG94TlVoUytoQzFxbzM2?=
 =?utf-8?B?Mlk0N1lOMjNyMytBZzMzNUV5c0NCaVA2b2dhZ21NdFlqOW44ZDVwZmxaU0I3?=
 =?utf-8?B?VVRYVUpEN3VZUUNHMEtPNWhjR2hnN2ttUDVBVWhMblh1cEpNbjRuYnlhWGZW?=
 =?utf-8?B?WWNmSmVzM0xMbzNnMTh2K1N5RVZHeGJ5MmVEUWQ3WHJ0N1RJUGE4Q2dVb3pu?=
 =?utf-8?B?NE9abGwwdE56cTFUbFRsNzUvdVBVVjYrcGlEc0xDMDh3dEFvc0xWNzlBRHRV?=
 =?utf-8?B?eGVSZHBqMzFzM0xFNVJkaDJNdnpFZElpeDQyaWRCNGkvbTBCSFZLa0xLcWM2?=
 =?utf-8?B?S214SFpnQXVSdXBDMC9PRStaU1JlR1FaZGdpbGNzUUI0S2JqeS9tcXZuVnZL?=
 =?utf-8?B?WGphMG5SOHZ5TlhYK3krRGdvdFRpTFF0VzVqWmRJU1pnOUNNRHBpclkrYzgx?=
 =?utf-8?B?R0x4WERNdTBoM01adE03em90aENCTUUybWk4eE8xRThaSGlBaFh3T29ISzFP?=
 =?utf-8?B?NGp0Y3dId3Rubm1sTTZxdzM5WUdqQUhPWGpSREtuQzcvYlJKL21Mbmd2elNY?=
 =?utf-8?B?NUhYZ3BTdkFVZlBabVhMUXp0UUtBQkFtRXVhOXQ4N3J1VWhReGpYZHNndnJH?=
 =?utf-8?B?R3F5TnNmMnR4akNWMUVQRXpPd2NxUVVacDZ5T3VRRytWMU9UbzA4WTY0ZDE2?=
 =?utf-8?B?cWdNejVZSktUeUt5Njd0MkFoMUIxazRPQTRtL1RjR1BnLzFLNHRSbUluY2ZY?=
 =?utf-8?B?VEdqNFJleE54K0ZtQjF5bkFXNkkyYkVTWGxqMnhPa3RFMGg1MGZJRXlGQ2tN?=
 =?utf-8?B?SkFxb2FXaHJPNTZhc0xhUHNlcWRYckxxbFJmWUNVSVdyZWU3M1JrMGJuVTlE?=
 =?utf-8?B?a3l6Z051ZFcydWI3R05aUWV4ckZYVGtTcDBUbUNFV0tXU3Ircm1RRENRMGQ4?=
 =?utf-8?B?TEVLVGcrelZJRFI4dDdJNjhybEg5VVlSY3crWS92WjRYYmlGYzhVVHY2Nklv?=
 =?utf-8?B?K3lpYzdmNG5pZ0FPZVJtdWpHUkVGa0tqT3kvN0Z3NlhMU3Y0cUJpSmQzbFBo?=
 =?utf-8?B?V3FEWFNaWVprWldrQlN5N1pTKzh5L3B0aE1Oc0RjWExLaU1wT2Y0SEZiUnVk?=
 =?utf-8?B?aXdvdDE2VXRVQjZtV0JUN3E0anhMQkhPZUwwWlRLMWlFRmd1WmFHdDN0YjRJ?=
 =?utf-8?B?Rjc2ZS9WMmVPVWRFbmYxOGt1Y3p4VkFOOTQ1UE1jWm9kcW80NUhmREkzdStY?=
 =?utf-8?B?M1p2R2FzaUV5YWo2Q1ZyUFhCUFlJUExXb1dXR0MrMHU0Si9vQ2U2azdFcTRF?=
 =?utf-8?B?RHhUbFo2ajg2cHpmak1jOFp2NjdnMzRFUmR1NGN3c3RPSms3bU1Kd1FWbGZn?=
 =?utf-8?B?Y3FEaE1wRGdDT0d3OXo5RU1Oa0lHZ3BzQ0UzYkx2dThvOFZsaDVLM1JqSnUr?=
 =?utf-8?B?UEU2VHNvTGV1QW1TN3p5SWJWeG14NlVhcGFMbElZRmhLbExIZ2gxaldOMFVJ?=
 =?utf-8?B?TGFLZ3FlSzBISVV3Q25PVVVKc3lvNEdjZldDdjU5TEtjRmVOSnQzWjA2Y3p0?=
 =?utf-8?B?ckVmVGt3QkNuWThhTEZPNFIvaXJxN0VIWk5Eb1k1M1lCaTAyQWtkZFZoSmZN?=
 =?utf-8?B?UGZuOFRZa2Q2eVY4dUo1aHR4M1JZM0FCZXlLNkhFZzlLdlY5RytGYWphM3FS?=
 =?utf-8?B?bkJzRThlOFIrQ2xMUUpTeWtFaWtWUERWb21XSkp0eEhEYTNIVTErNzRaTkxM?=
 =?utf-8?B?N3AvQTM1YklKOGFNU2xRdXlkQ1JPRjJFRTFmbEZxZm1NUmhWV2JWbGNqeHpj?=
 =?utf-8?B?RFI0bkNhc2o1OXBsdXpqbHM3VTlFc1daWjFGNXlHK1BGQjFsbDBtS3BiZkN3?=
 =?utf-8?B?MlpISmJsc1RYbW8rOG9OMi83NUVnUkNCbFdkK3pPRlZXcGd2MWhPSlB4QmxV?=
 =?utf-8?B?ekdJZzJrUXZ2RkZTNmJBWjVIWHkzVWRQUCswd3BKMHBxNWpuazNvVXhNV2sy?=
 =?utf-8?B?Q0tjby9rWnlQZkZ6YVAyOG1ZcGhzaDlRVTZObTVDM1NaeWJOY1poeUNFZStN?=
 =?utf-8?B?QS9ONTZTRWVzcXRaSjNMOFlDZzhPQ3kxUElTWnpLT052NlRxUW0zZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616d4930-d87d-439a-2a4b-08df3a820ee7
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:43:58.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg7kkDPsy5Tmg3rf7CgJPXdQjvvJQ+5Peyzhie+51LClV+sv2zva9MP0QF2WwLeUM3q6MUFqbbjKuMJCm9RI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7705

On 04.11.26 00:51, Stanislav Fomichev wrote:
> TX net_iovs are now sized from the dmabuf layout, but the TX tests
> use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> buffer from it, so that frags end at and continue past the 2MB net_iov
> boundary. The payload has a 7 byte period to catch offset errors.
>
Why not add a test with a BIG TCP GSO test as well?

Nice improvement btw. FWIW for the series:
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Thanks,
Dragos
