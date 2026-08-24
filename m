Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0E37DAD7;
	Mon, 24 Aug 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565261; cv=fail; b=bal+GvtfGoM4msdBZPZp0GpRfIMeQE1Qw/ucZRicDeyYslKlo2g6UpjTzuTYLE04EufSNA3IRGrFL/DQJa7V1HXbRzfE+J7VrVw3IsDC6IRnFxDGuusCJdUH6Jdk5SWMpbBNGkon0XiMa/BdKXh81z5SIm2wLT4yVmki7u0hVF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565261; c=relaxed/simple;
	bh=MLv9u9QwNlsnmZ3ij+eyuLV/oZN/SaFtAFdRLDZueic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWwYb7xMkoPK3sSRo/2Y0L7BMhpCTCn13rLRZS22pBJoN0mZAfgnxhGjSUlGury1TIZsghLr9z+JO11e/JlYEP/Srb7OOYi2C0Xtv3ehH5WVwixSVqDSN3I+Cw8A6JU36yJ5OYdgOpp9z1QSAS0AKTW/R2lTVP1F8GNlmX+I5B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fXozg85E; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fXozg85E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO+fCOp3P3w8+wk10MLOEsAG2RHUAOLr/hP/n+eBP7etsAKi4/mdDMtjmY97+bX0nJj+43fddQYrXem77IBAXv5IB6+or7/COuuZFtHKCKYASGXN/o3toWY+fd5Wg6M+3rg+FBMEeahKRke3Wx66CB8uSnRfw6bjQ+hgUtHnajgdGMZv2ZST/aszQdDnw+uNFoaWtmUvtpNQHuPzmMUw/zGv5qSCzRovLKztlg9Wa3CwzGNEfvUsxPHQqI/gj0bTNQH7KSPeDNoAoOdUwY+8u7iWnQXA57wOXDNIfD4lwh26McCoYk+DAqhaO+qOlZqifyXvzm3MaCZwLVFF3R2RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLv9u9QwNlsnmZ3ij+eyuLV/oZN/SaFtAFdRLDZueic=;
 b=Q9Ge/OplVGmu7uT+rUWQpPn2qzxCA599TrgqM1nH3ULkj8Sed1quiqHQ3iFZqF5kE5LFCBarBFDON19P7SyxKJGR9U6QcnhXd4W2h9rrLasN780Yo0WSNgOQ3LkwZf5CPK+dcMiA9o2BHgaQPww1A6K8TH8pBAXbAbLMZrJ3plFBr+bLAWreeYtU219DePETZT61CQLic8UvlMJXGPURxEjnH2m4zFPrQt1GjTlK9O/8si24OxFoKHBnezpO9BBriS4upscS+C4PbafnyOtRFkYdH7yui8DABjVnqkedPoRym/sQHyMe1PWZPuxd0sDmN2QxO3WOM8YfVMDAOeZvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLv9u9QwNlsnmZ3ij+eyuLV/oZN/SaFtAFdRLDZueic=;
 b=fXozg85EKnW+75XufO5Fdj7YkKfWFQTxkdmbmONlc1a2TYLM4QwleTdydFockVGruU89XkaeZATeEv4y0LDhwz4wq8UnfCv/hb8SiZtD8H3U/BYNkDNU43VGYaDKiJM/UlWD6PIe34dGp1Zotkavl6sQrvFXU/EbxjXvsQ5tLO2+TDBm/4nuCwrcigLfGlRJxQcdCyPWugJ2RThLu5NgK3ytr30XthLBfVvNWDAEJenwuntS6mrxcES6Jo1Ek1SHmfXq+CaT2iJZRuKW3QYDlyZcmzZgkZshgXVq6GdSz3UB/NGVeDaN08kuzEIxDLvOOamUIKeEbohwlGrvMBrzfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by DS7PR12MB8275.namprd12.prod.outlook.com
 (2603:10b6:8:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:54:17 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Mon, 24 Aug 2026
 09:54:17 +0000
From: KobaK <kobak@nvidia.com>
To: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Rupak Roy <rupakr@nvidia.com>,
	Mohammed Karamathulla <mohammedk@nvidia.com>
Subject: Re: [RFC PATCH 2/3] Documentation/arch/arm64: document arm_cpumod
Date: Mon, 24 Aug 2026 17:54:04 +0800
Message-ID: <20260824095405.3-2-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817220354.GA2274565-robh@kernel.org>
References: <20260817022335.3-1-kobak@nvidia.com> <20260817022335.3-3-kobak@nvidia.com> <20260817220354.GA2274565-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 07857062-48c9-4693-d916-08df01c5a93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/mM2hjSWP3PTnOTnT/j1tWx2r0zbNK3dMgEPTz5R2cfQAfZKgL/wSEy3NZLyDWIbDcwTmTm9ckqzSQAcQffITVdgVQZRK5aIVOhnblbxIihcskSZ5uGCXdGEWPd2Ui4DlCkjkmpBKw0u3VkhhR01o4BLZ+xlLX5/zDRihfi6RxrVBsV1dUKK7qp2+SFMXKgw4ZNbMYqec5COHSAbBUzFDJ0l6e5SjwhH67zMnreOSoniLPCyGSji6Tj0cNpwyajedng1O0igxn9SSTikLc0RjYUVgQCJoNZLV19x23scyODB8J7hbNk9y4mw85WEigPJ+C+Gs4c2DGeFBKC3Sp7XwNk8rRHo5piPiilXkKbTLaY8sSaBEr5qSAJu5WTXa5Q3PRPZf/FQk9XTtkuuqKEqIjmlPCVIdf9USQqsEN8qFiZlX6eayY0yEdf4FMu4NX8k8EeLBlH/Uj4PuQkdMNWCUbk/ciG0kxRaKS0jYuZ62O5A6PCRUoqvtvwPe8TDvC+Jxs3L1lmvqlCdLa6uYVlj5lFEod8D5ENzNaVwEnyp/TQebj5WoiKjOVeh8hJkI4rCKfdwbUnH5xffNLrHiEh3P+BvyumVM5z57p8ootG+4KAasjBGfNaroGrkt21B+um4BYok7Jbd8+ETu+BgVz77lTlyQatA8XN9W6vsIBDDSFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1dpZzhvb2EycGF5SmxaNUdtQTRXT24wYkQyK3pjeW1CR0toWU01Sk41a0lp?=
 =?utf-8?B?K3hiT25tZnorNzNOOHMrTUNhL0ZMeGNSclJMYXcxZDloQVdVc1JtUmlGK1Fk?=
 =?utf-8?B?L21jYVRsaVRPcmVuSUlpUldMeTJ0V3RVSzhFUTdmMm53U0dEWk90aDhvYThq?=
 =?utf-8?B?UHgvaTlxRENqckcxdldvUkpPWEIyMnlSWE1Kd201U3hkOUl6YjlOTkZ0VEpm?=
 =?utf-8?B?NkVUUW1Qalc4ZlNVTS9BbUd6R3NpaG8rVDlzaUoyR3hzd0gyOHhPTXhZN0VS?=
 =?utf-8?B?YWIralVXMlFMK0JaNDFPTlp2VE9QUEZISkhUSzRVcUgzeW5DNEdDOFVFTTY3?=
 =?utf-8?B?YkhYdUZWOUwrR0FmK1VhUjQ4bFJrVjNTOFhZN0ZCS0twNm1tV21VOXUvQ01D?=
 =?utf-8?B?S3dwVmI4dlJEOHg3dUVVVHNIYzRPak93OWRNUFlLNnFGb3J3SU5KUFlxM0gv?=
 =?utf-8?B?cGk2RkpSR214MkZKWmpkWjlSZi9OaEJRMUR4Y0ZVSkRMY0FRblhiSDNSRlNi?=
 =?utf-8?B?cGF2K2pET3BNN255V2NRSmVweHUwd2YrMXpiKytqR2FZMURhSkMrRFhxT3Nj?=
 =?utf-8?B?NTV4dVdWU282WGxMZGp1WDNkbFJCNDdFQnRkV2h5OTl6SmFCRDNVODJoRWxT?=
 =?utf-8?B?N1QxUmQ1NVN0dmNjSmFSeEgyeTN0ZUsydnZkMGdGeEpvN0hrRVJJazlvNmtW?=
 =?utf-8?B?NnVTZVQ1OEZWbmVpeUFiMWplNXkyYStxb0VkTi94Z2lIdmVTOUgwNS9PWm1j?=
 =?utf-8?B?UG5ScTAxaXNHTHlFWEU5VXgzZ1FLblpRZVlKM1ZGV2M3dWRYejZmTk5UdWhx?=
 =?utf-8?B?SDFlN0x1VEdtSDVObXRKZ0dmQWpMWVp1TzhzK0F1Z2lTalhsbUszaDVIbVRX?=
 =?utf-8?B?V2VReUIwS2cyYzBRNUowaU5Ya0hTTEV1V0VYcmtkUVNmek1zSTN3TUNlaUFs?=
 =?utf-8?B?SEdFcyt5K1RVTGVnQkJtRDBCWUJJSmFGTHRTVTN6MVRBNGRUUXMyS05wZkZz?=
 =?utf-8?B?SjdMUXpCeFhnY1BpNTlnMjQrTlFGVVlBNS9UWjd3eUhDdGlUb01sdHRROHUy?=
 =?utf-8?B?V2xMSXhmaWZaK0ZjM1hLZVhWOElSbS93V0hiemhGL1c0UkkveUp0VXorN2lN?=
 =?utf-8?B?d3ROSGJyY1JOWnJySlZ4SkFQSEx4czdreUVvVldpdjl1TldCazlQeUE0MGRx?=
 =?utf-8?B?ZlcxdXZSK1ZkTnpkNEpOdFFZd0lVQ3pQMGxYK1gwamsyT29zWEYyTTZYV2NZ?=
 =?utf-8?B?eEJaTzVMNjQrTDFRdlY2WEZYQlJCUndCY1AyTnlOWVZraVdEQ2VGMmdUazBM?=
 =?utf-8?B?Qm9GczJ0RDJEQWZjWW8wak52cnBNME5CbXMyakMzVVVXUEVSemNjV3hsODM5?=
 =?utf-8?B?UGtJU0dtL2hyc0ovQnhIRHFoRVFBQkcweDQveTRMWEY3RFlnRnRiNXlmMzd1?=
 =?utf-8?B?UWdpRG5kaFJZUTlFUlhjZWIzYXVNSmwxdWtmVzU2TUw3Z2xkbGs3VDZQOFU1?=
 =?utf-8?B?OHhRc3dNc0l0VGhLODkrZ0JWU2hQM2tLT1FTZlhQY2VzYW5hcEFRemd6U0dT?=
 =?utf-8?B?QkdsV0owRnkwUGNsVzBMUi8yQzNVS1dUZDBteTNIYWxtNE9LcTZTeGlDZlhE?=
 =?utf-8?B?WXZ2NldESmttRFhia2hnUlVGOStFcXd6b0JoTkp0SFI2Vkt3ZGhKaUtVVHhY?=
 =?utf-8?B?WGxLeW5LZzJmeXVCZkJ3U1NWc29OUXBvYUc5MCtiRUpyK3JHSW5MYXF6bGVh?=
 =?utf-8?B?dzI0aHBNNFpqZHJQWkVkZmtEUERSeUJ3c0hpREM2d3I0V3JqeXlDa05EK1pP?=
 =?utf-8?B?SFh0bWtCWlRhM0pzRGRqSnVkckFpV3lEeDgxTEdqdjdMYzlRUkIwR2hzRHVq?=
 =?utf-8?B?bE1iWThSQllpenlGbkNCWGRzd05nSXhjTnVHcTFsTnRtbXpESjk1L3ZkQXlZ?=
 =?utf-8?B?WjFYbmhzWjN6bXJZWDQreSt1S0pjYTNFeXVORlpwNXpQNW1xKzB3bk9lRE9P?=
 =?utf-8?B?WXVvcUJWSjdNR1lKdXh0MjVUeHVoS2lWV085UERaWExJd1AwOEFvL2JaNnlG?=
 =?utf-8?B?aHA4TEQ4WWYyTFB0RysvK1E1UVAxSW45bVpQK3BtSnRTTlE4Q2xuNitDK0Nm?=
 =?utf-8?B?Skc1TlErb0N2bjlDakVobWU5Q0xBZWRwRFdDK3N5M1VqdzhQTW1Rb0pFLzh2?=
 =?utf-8?B?VU50Ry9rdHY0bTRqSUM4YWlyTDJyYWtzWEtIRkdQbjdwY25xaWNUSnlKL3lY?=
 =?utf-8?B?QTV5ZUFBZHExeW43dzk4enQ0UUVMeXkra0R5eDBIQWc5OVU4OFNsWmFuRTgr?=
 =?utf-8?Q?m1AgmMVe/xaRqZQQ+C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07857062-48c9-4693-d916-08df01c5a93b
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:54:17.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YfleSe7V/w3Du50nS7ZkBF6craA1U9gXedkfpN2qViDhhpiyTnf/0fBltYR2g31WpW7LjorPBRqSR68zraAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

Hi Rob,

Thanks for the documentation feedback.

I have prepared the documentation changes: the arm64 guide no longer uses
“Current ABI” or duplicates the file descriptions, and the seven sysfs files
are now documented using the standard Documentation/ABI format.

The driver accesses IMP_CPUECTLR_EL1 (S3_0_C15_C1_4) and
IMP_CPUECTLR2_EL1 (S3_0_C15_C1_5). I am checking with our firmware team for
the kernel-visible contract that guarantees or reports EL1 access. I will not
add a speculative write-and-see-if-the-system-survives probe.

I will hold v2 pending that answer and the arm64 maintainers’ direction on
the interface.

Thanks,
Koba
