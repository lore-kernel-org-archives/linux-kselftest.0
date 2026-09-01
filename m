Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DD368264;
	Tue,  1 Sep 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245133; cv=fail; b=TOA0Zqxg5wsXK76pXjKfcCZ3YIEyB86gZUGWxMgPdQkcz4sAfkHuPP3zgkB3MfvK8KE+Eh6YP61V7LvNOziT5Zi75bxKJok8NydtrFs+cyRYFDYW4Hcm8d1xr2jWArFG5KWM637hnhpaM5w1YKc6Dj1iiz3HmqmgcGxXZFPUMcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245133; c=relaxed/simple;
	bh=xXWNQhBladcw/TuOqlJ6LcPPJIKgQ4VI7VfWiUKvpkg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KlfqNeleT8czaC0g5qO47rFr4gSpREiaeE6pjDsDekG8Ofh5t0WMjZ8BfNfKr+wpN5XYh4CwDhIoDbW5WvaI79JC33RX6Oi45/9YgU9AX9wTt8QfJoHNPSe03W7tt6HA+rOq+03O39yKs0DqRLpRMmThZiUniSy7icGRH1oxV9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a8ZdH2Mm; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a8ZdH2Mm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJcdMWCpjTlKLDq9NSBFXwdJRjhC6Es+/cIDe79uCL5IgxMVDkqszi5KvxQVk9aup1qFbWELC1U5nq8m0VymTBM0pfZUkpGvHGsM33wSAVI+ULPFTY1Un9vZeTH7MQ95GrFSg91NDYoxQimgIdsCRrJKbdYB7UZjquTQPT1keQ071RBHFmoCdZa+4X5+oQvWmPPR2/k4h5cPZoOZhkq0ozAN778VpROcduJQLkLAN9tlIc6C6r/2wMfpAAW9S3Wezihs0k8xdy2CgGIgocEVj17cGU/upv3NeaHePUNvhXHRquWuU1eUGRIpIWxsLqqflbDLEiyxZQS8DRYHLpJSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2VSao4nC6LNZu/aUrqdtdG+B/MWtYBYUnUA+7Neek8=;
 b=dXDX5rQ2+dwO369Y8Uz2ZaelHG0yXpDQ5kpQLZSTZ00WAS78vHtoUB0ijQVqpxIblbbJyrq0RcnMgDfRIakDfS0lqJ6Hon38HYjjoy1iZq0MFNwW0yUCnE+zP9aH29nI6+J9R51iBLu//2OSyZlWn4VRL6mq5mEyTomeZZ6U23/CX3X7gK4FlZqNehsEZSc4dETKjGXDCMIvYS2c8XdfdeUZ6KGrTVLV8dGqR7XKFr0RThcSeZQscSo3/aKnT6D4Cz1tzJtXxB3a2bbj970uOCjZcqkFqCm4t2saUg1y03f8EVUXt3VrLHeq3X+srebR2er7BJxK+kkgQ2wb+pdV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2VSao4nC6LNZu/aUrqdtdG+B/MWtYBYUnUA+7Neek8=;
 b=a8ZdH2MmITMWLyk2lzPtYtO+Cf6XPVyQaMKpS34hcsM29COwCg0rRASs2Yj5+A7j6FPWpaOSJ0y5Ze8JfAh83Lug6homsFivkcOFd6WwYgc6MHG9kw2aLHchZ64i2VNaixeGqP4IPDf2svLoR/wn4e+sd5WViUHFEGJJQH7aETj4q8TeubxxE5VmiFXLkJCNfF2A+29eZg6V6/FFrv0BZ2ZJiGSQgCEZigSr6kmVtJkyChd53tuj6+v/3DGruvqzrt+Z8qY0QWTQXvzKh4Lz1HDEsLOpQJ2PVdWb9DxM+WWhTqdar8Wl27CV6bRxtd37Rsr3ozaFOGQZpC0mLHgBmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 by DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:45:26 +0000
Received: from MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587]) by MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:45:26 +0000
Message-ID: <4804ad0f-ff5d-4b74-8285-9595c0c6732d@nvidia.com>
Date: Tue, 1 Sep 2026 09:45:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] selftests: drv-net: split up gro.py
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, petrm@nvidia.com, linux-kselftest@vger.kernel.org
References: <20260831163734.1121891-1-kuba@kernel.org>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <20260831163734.1121891-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To MW4PR12MB6802.namprd12.prod.outlook.com
 (2603:10b6:303:20f::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6802:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 11071d9d-4b02-427a-6e9b-08df07f49af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7mV8Q9k7aN0RhEVfUBA3p5xbYgyUYB8DmBn95sdIXAfAPgd5yj6KrQmlVtFX0thObUHaO1mQRQiRATqPG8/vacWg1vPlRm5qt/+Htj0FeHTyR7qMYvyhMg3cQ0jKVbXmSu0Gz0VqHgQHnUUN/FUVPv/f5JzDk6acujtiU51u/56ixYGgNzwR5lf9v6eHGMlI/pPaYpFvY///noODEfYkiqOydmiLp/Thz77ei+8xkqQ5fTReRxWS0UwH+mqTlXG3gysGJGNx+wkY4nPIMr/F3AzmbX3Gqa60ZNJo1aMQO1UBSJg1GnzYn+AzXXD7PauWlgHhS6KuMUGOtGWLZS/WLfwTqlczcO/WQUjxmm/wNlco6G/E7Sn/CcNx7kmWHbtqc+mPZcurYS9wxwvKEs+7F6ZwBDqFick7DwS04+HBbVCbgAcoL4jbsOETeipfN4wGcWMB1oPW9KjTDKELfcE129LdnJX4qrFO7TDxpXet7RU4p3qJNjiiTStONrLxm4YB/hN1cn6WfuVFAr7JLZdfc2wiVLc94uJev7lt/PoyAgZFm3ZRetXORdW/KI2XmDSmjHFveoxIof5I/yg525Kh2Q7FCForDsBI8H+G2SNdn2pvquKYAS2HGcM97JfuoMCP5vfqbOF2LrOFebUxanH0jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emNVMHI4YjNXRlNoUW95ZkJyWnl1RjlidzNOTDAxdDkwcmh1eXU3N2FMY0tt?=
 =?utf-8?B?Rzk1czNYTldUekFyLyt3MUxrbWdtaE45NDlKSllpZWNwbzJ0TGhEL0I4cE5n?=
 =?utf-8?B?S0V2YUJYcSt6WmRLd1ZnMk9jRGMzb2o4WU9aNHVLbHU5V3hUek1EQ2pwZStD?=
 =?utf-8?B?UXR6bHB3eTYyWTc5MkNHN2xndkx3QzZtZjU0ZENxVmV1b0pVcytHbHN5aEZ6?=
 =?utf-8?B?RTRGQ1RRS3VZYm9kUUxSVkxKTGlIdG4xY1A5VVJBc1pGQmZUUWZBalA3SXB3?=
 =?utf-8?B?K3RtUDJSM3UzRk8zd3dGR3BRckpJSWxyWkc5SXpzc1oxS09SMDdRN0JXU2hU?=
 =?utf-8?B?T3IxUzJucVN3blZkL0FHYVVPU2VSdlhxdE4yam1Ea29iYjRuZlhLby9oOFYr?=
 =?utf-8?B?VG5OcEx5V09YYWRUYzFNWEFXdWZjZ0YxMzU3SEgraEgrSmE0Znpsd3YxZHdw?=
 =?utf-8?B?YkhtSXNVdDE5Nmx3NEl0bVlwN0FFV05vbGtIVk9ZbHRwZXBBYUpTektuWnU5?=
 =?utf-8?B?Mm0yR0NSV1N1L2NuUk5kQU9PUU5BTS91anJmN2FRYXRtQXVvYTgzb2x2Qkxq?=
 =?utf-8?B?a1g2YWNDSWdiMTNHNXRFYkJNblNNTFN0eDNzanN4Z2RQV0NTMkkva3V6Y0ZD?=
 =?utf-8?B?S1VJK1oyM1lwdGNvaVl5OWl1bVZkTWJEZW42Q1lVREIwblVxOWgxUUxxbkhh?=
 =?utf-8?B?V3gvMk5qN3FOaExhOTFaRFBjajd2SmtmaUlUN2R1VEtIbUR4NnVjS2J4TW42?=
 =?utf-8?B?SC9oelRMTGdNTXJvUU9MRXBXZGxPc0NrUW51WmpSYkJmUkVNU1dmRjZOc0lu?=
 =?utf-8?B?YW5GMUc2OTErU29TTHpjaDFPZ2xrS3ZGemRoNXUreFlOblllNU9uRnFOM0Ix?=
 =?utf-8?B?KzVPcGQxZWF1NHBXUlNXMjltQnlXdzdNN3BxYWlsQUtDeDcvRWxiNEtkQTJW?=
 =?utf-8?B?bWdrZVNZdlpUTWdDUk9qQ3NQN0M5UHFTYzNreTU5dG02VUs2M1A0QkRmQU1F?=
 =?utf-8?B?YmRoNi9jdzJJMWtFQm04azZvM1FDWVlqdjFaQjZpbFRNL3c5OVc4cTJMc1Y4?=
 =?utf-8?B?NVg1bjRLT1lSVGZHVmM4ZFdpS3RQa3VxVnQyR2RKTmVjdzdlaGhVN3JZcjQ3?=
 =?utf-8?B?MUlRd0lraCtnN25Rc1hpaW9zV00rMU5CTTQ0ZlhRSGMza1FuU3hQZzZmaThD?=
 =?utf-8?B?OE11RjlrOUVPeGVJdUNlMVh1a3JOWmdQblhBWUU5YmxBKzczb0U0ZkQ1T1pM?=
 =?utf-8?B?cGZPb3l0dDhaelQ0blRKcnZWVStXd05XbTduSUJjbWFpcSswUWJzaXo3UWRq?=
 =?utf-8?B?cjljVG9PN0F4cjhQeUlxZ2U2MGdWQmJzUE94bVdraWJIRUtkNldCYW9XY3Rm?=
 =?utf-8?B?SURpL3oxbUFRdEV2V2lJSldnaVU4eTlwK25RR2NXM1ZLT0VOMVovR2FDSURj?=
 =?utf-8?B?NFdWbXdoRXR4QzFGRklpcHNaZFVmOHNDZmJaclN1L254STFzTjdkbEJUVGJu?=
 =?utf-8?B?TE1wT1Bqc2R4SU9zTFVsNjd3M2FUbTNyNTNKNmNDNzg2djlnRVBnclo4R25J?=
 =?utf-8?B?NlpPd095MW5mcVJYVG4ySEdQS0FUMEVKbHVmbUtpT1Z5QUVCRDZwb2ZDSUVK?=
 =?utf-8?B?c2RkWkx0QzVIRC90TkdKKzBzZHF6Q3V1d3ZEa1R5elJJdjc2ZjMvTDdPa3Q3?=
 =?utf-8?B?Rm5oam8rMytpOTFFaHY2L1RJKzBubC9ENjJabHlNbk10ZlNiY1llSCs4UVVW?=
 =?utf-8?B?QkJ2UDBVYm1kNCsrajBPdTRRYXhXZmVZaGNXVHZlY05QOEYzbDVrZWpJZjdx?=
 =?utf-8?B?SGRiTUttNDhhWk0veklyK2Q0d2NKR214UkNRUjVEekI1VFR2TUxrQ3RCQTVP?=
 =?utf-8?B?RGhFblFqT0dJekRxb29scG9JTTdPL2J6cnBMSkdPRjBabld6Unk4aE4vSVE2?=
 =?utf-8?B?WXFLWEUvZnQ3SngyWmJjNU54T2xlZUkwQ041TmppRk9pM2dBdEhCSWJpNGpR?=
 =?utf-8?B?akNybER0dllmaWVUc2RHVis2ZE9NQUEwZldGYXVCZys5U2RSNGl0MVJSRnd3?=
 =?utf-8?B?TXF5MkVhKzBiVXY0dzIyZHNoaTNVNWlJblNsRlA0Z0dtZ3VYSWZjaXZrQndU?=
 =?utf-8?B?MW9Sanc3RW9iakhoQ2JSbUlRMEtGa2JCbENtMUdHNDNSSXFTUlV3b0EvQ0hu?=
 =?utf-8?B?cGJ6L05SOEIxOWthUFNZYTliZlQ4czloRE0vNms1bTI2b3JFdzg5WHVpYzlW?=
 =?utf-8?B?RVA3RDFnMjl2Y2xUVUVWQXdjcFlPL1NLQzlqZDFJVGU1MTNzWlFYRnJnYklF?=
 =?utf-8?B?UzZzVHNRaTFMcjc4NFN1ZEFQSWl4WW04dDJlakp6eHdPbWlRZ1hHZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11071d9d-4b02-427a-6e9b-08df07f49af9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:45:26.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Owfm7q34lR+LwdX2+ogMS2SiGixb05/yUWzTg9AajH2bmsL++wNNVMC8dV9gqdJBnyrXTttOXT9EVGSoD+42A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291

On 31/08/2026 19:37, Jakub Kicinski wrote:
> gro.py runs its full set of cases three times over - against SW GRO,
> HW GRO and LRO. It's our test with the longest runtime. The 318 cases
> take 12m30s on mlx5 with a debug kernel.
> 
> We will likely add more subcases here as the time goes on, so it's
> time to start splitting it up. Long runtime wastes time on retries
> (if any of the 300+ cases fails we try to check if it's a real failure
> or flake an re-run the whole thing). It also forces us to increase
> timeout for the whole test suite.
> 
> Jakub Kicinski (3):
>   selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
>   selftests: drv-net: split gro.py into one test per coalescing mode
>   selftests: drv-net: bump the timeout to 15min
> 
>  tools/testing/selftests/drivers/net/Makefile  |  9 ++-
>  .../testing/selftests/drivers/net/hw/Makefile |  2 +-
>  tools/testing/selftests/drivers/net/gro_hw.py | 14 ++++
>  .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
>  .../testing/selftests/drivers/net/gro_lro.py  | 15 ++++
>  tools/testing/selftests/drivers/net/gro_sw.py | 14 ++++
>  .../net/hw/{gro_hw.py => gro_stats.py}        |  0
>  .../selftests/drivers/net/pppoe_gro.py        | 46 +++++++++++++
>  tools/testing/selftests/drivers/net/settings  |  2 +-
>  .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
>  10 files changed, 131 insertions(+), 41 deletions(-)
>  create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
>  rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
>  mode change 100755 => 100644
>  create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
>  create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
>  rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)
>  create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py
> 

For the series:
Reviewed-by: Nimrod Oren <noren@nvidia.com>

