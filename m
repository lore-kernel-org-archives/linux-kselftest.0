Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E9353A70;
	Sat, 12 Sep 2026 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252035; cv=fail; b=OjcXNabF8a9HxFSRByGWz7WGb4MwIpPLyqzGetyOlMjYRdIHOClnwizVR1I7I8X1OINtL7AZaAtbwcd0FsYMMdL2zTkwyoRX57dEwE/vFT+NOk9g+iScVPJWNToVV9sauwDqQfNyIfPX4eQ0C8AOYgFbltfZjgX/gA6J3IWYrk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252035; c=relaxed/simple;
	bh=k1Ee9O2XHUJeJXdzwhx4bbjqcfbN8QBosfryMq6jCwE=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=cqk+WNPR0CqdKcEJV9uhd6lAnhGerpFB8wLugwDK9ASylH18jAOC6hrImluYVw6VXQeOV3vifh+3LmjFj6D/4O08nGIIopn4zkWo/z145h/Aub0Fpkl4oUlxJsaa0YIaghya0xsAjNWRvCn0Gc2qe7/Jg39/RPEOPsOAzlUQlzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HoD41Sjw; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HoD41Sjw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK3w/fmTyjxdz3/9ieVpAXxtZXDKyq4qy8Dt0v4pnDTa3bp/fAvISuRCk9Ye8Smp+E8Jhkd3ZvS2cHOot2SKIvi9G5XH+HZv9If9PBYeiCtJVT44+ld/zwQnO1IBN9+k16RFBee88xLUaO9sA4n0eAr1w0BY4UO/GFmpG7tgJyVZdHh4IhLsZL8DbEmJlTb3LtphxJC7SjyXSUmf8MicGTLg5C1LV7l5YXGvZZkrmQ+WLtMlxyBMHzKasdpZ3py9HjDPCA2UiiRiYYiNcB2BYQDpG2G3Io/L2MqaPkCbuGhqpUzM0ZMIpka32lP1mQS1hqa3ig9hYl/5Yz+iJSVJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGD6yDS+4MM5SbZ6GPToMPt7CM2p43Urlo0jiEQ2B8E=;
 b=f2ItI8PkF9BH2E3oQGOq2/uLRkGrCrpZAXJ16eagbtH34Nc4iJdlgfE8jExh8uY6HpiygHVPsZB8zAN+3jhPesbi6ekNntWcVwDXFexONEdXhkvgc+VLz7kbafATTvM0kutDlaU/h+y58NKdIxeCeM1H3aAwl2iNgWan88rhnLTcMH+19o4RWfreaR1syNuGVjaBYTAkeqHhccwYfSXw5mFNe+iOSIDlu9KwEHzy5/GJzQJcqjLN8hNupuus068v+cNouXVfBFy0+LN+eXac4UXKZSqPi1IR6doux5UPCQ2lzTbdNEa38fyWEluAJ+kD/C/BaWAF95TBiJd322wLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGD6yDS+4MM5SbZ6GPToMPt7CM2p43Urlo0jiEQ2B8E=;
 b=HoD41SjwYWZr17UeWzEIKOFnnDDgIHVhL+LtCmCmBk/Yyp7VpLK7JxGTivVQWS5vCiU/YTIAXslRy3ZLd/fa8Oms/cfLtT9fzw2A8bP+6nFsbNVPVnc8knDxkCgmVPM+2KPedgdo6ZTwG0KY98NTybQT7MsgOWrt7vnOANT7JJTMqZqj2XuRtPahBXeXaXGK8sy1l2CfgEcRSThuiktAFLpPixL48dMi09JCCBEWyhhN3TmRnaP6swD0RtZmgo/tE5Ln25hPoWjTpsuk/T0qWcpNFRxWE9NSm6yrHGgvUmZgSw53P/W6ifgntqqaCw7ol9iQXuG/nLbTry6Yzu3dPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 22:27:08 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 22:27:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 18:27:06 -0400
Message-Id: <DLDOWPCAV7VU.3AEHNNKUITKHC@nvidia.com>
Cc: <ljs@kernel.org>, <liam@infradead.org>, <vbabka@kernel.org>,
 <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Jaeyeon Lee" <jaeyeon.lee.dev@gmail.com>, <akpm@linux-foundation.org>,
 <shuah@kernel.org>, <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v2] selftests/mm: skip khugepaged file tests if mkfs.xfs
 is unavailable
X-Mailer: aerc 0.22.0
References: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>
In-Reply-To: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>
X-ClientProxiedBy: YQZPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d00d5b-3b5e-4270-3c56-08df111cfafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JGiHm/gibdpCQ1GOpTzPEvRChoAwPIbvoie9VtoYq2SYsSmN2dY3YftArUMwbDoD5qbCDwAX+UYD9YIpbHlGlxTyduR/9VTjPvZ+8S+L0lNOOrl/Es+F2xnKz2XWrLedj6epL03d6OE+iU89fdAm4XgSFWRaJVbb8zl525vGfRF1fqV3mTw00CLRwGKoHqiG6JA8iSlevgXVaE+GuNA170/Y9nM9gDaIUbjaGJl3QoNawC1cr4aQWSjHP0MngHIBVr4bzUPWPGwWInorsYfYkWRx5Tvr9KA0kAruKPJPOcrvtYrJdtm45ryo14t2smki/91YFAyxrMereah0Ws7tnW3latUUSckxfCkHGLdadllPShyznCThzDH43m5s/y9MJ5pw+IweeVrpc9eTRmXUrEQOxpxCRxY1g68FWb5kO+EdEb3HEqvtKmcLSTxiJW/SVgh0NPcrIkW0oBoQ14BGU/iYocwoympTRjfGVdMQm9eaZ2h+qT0wXKzfaru7Fk0bYfDNv1qQa8gUdW6QIxrbmFeCs0x5snPfIk9UlnjCqOdtRbSdxESXF0a3DQsvJz3k9QLdrfiunJzs/59ErA+2qLCRBAL+O6W1S1Ng6NxZITpk2DRkA0/gG72e8aOHgtiXYTdfs9L/P+y6/qxg0z0LAzqxQC7D0HIAmym7MWG3gsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEVUZERJZzJETkNCemlHTWowTFh1MS9lbmwwS1piVnFZeGpKSURUV1NxZjZx?=
 =?utf-8?B?ZjhlME51MlVlcHVhbGNCNEhtY3JONEZwYmlKVEpaZ3BFZVpiSUpNL3VpdlZv?=
 =?utf-8?B?RXByU0VxbDkvMGVXQUU0Ri9YOTFGaXlHYmJxUTE1Z2hkdzNnNFptc1FjcGRT?=
 =?utf-8?B?V2lWc2xFUlhUaWNaYWFJTzBJdkx2eTlENFdvZ2p2d1VyZHRjejgvSm9iZ3Zs?=
 =?utf-8?B?OXpQTXI4N3U3Z0pkUnl6eW54Zk8yU080QUYvM2l0aitDSmIzc3pwb0lBVVR0?=
 =?utf-8?B?amFERHU2Ymh2K0Njb0xOZjJxZGcwNi94ekRzUHFJN3ZFQkF2MHdCNU5md1dx?=
 =?utf-8?B?Z21EZ0Q2dDU5YkhlWExsUmsxZ1oxaXRVS053bUpBbDlNMlp4SGZRenoyMmZZ?=
 =?utf-8?B?YjVuWXdwdmdLOURFdE4xb0JSV2drWkEzZlVwTzdQSHhvdGJYTnlPUDY0S2Qz?=
 =?utf-8?B?ZWp6Q0RieUhOcFgyRlQ5V3l4MXZmaWlLOTF1cjAxc2tncjNiSUhlc3g5NVhV?=
 =?utf-8?B?NUNOSDBRcG91Q28va2pWdnhlbnJ2Yy93Y0lxZUFUZVdUWVFzUndCTldnOEFO?=
 =?utf-8?B?V2ZkTXMxM1I3Z3dESmNlNEZqQm0yTjhocEVKeUlvd00yem5manBSNmVZbzJW?=
 =?utf-8?B?WGtWMitHbU9OQXJqVlNCeU5XRENRR3ZwdFVrSEdtekgyUnVGTGZsckJvWGlv?=
 =?utf-8?B?TEtLdlRpS0VwMnJyMkVZNjdlaWplMEhDbFJrWWp1WG5IbE5RUmorVk9ldDJY?=
 =?utf-8?B?UVF3b3MvUGErcXRCSGptZDJKYS9MMzY0a293ZzhMYXhuZkQvbWJhK3NzcWwy?=
 =?utf-8?B?WG5RM2s5LzBYcDU0VEhmOE1TZDQ0N2xkZEVFakRwWGc3VE5RdGhaSDRZZzdk?=
 =?utf-8?B?YjRBNmJsMElJR3NUdDdYMGp0ai85MDhwcXRQa25sRFJpTTMzNG1mWURzS2o1?=
 =?utf-8?B?UitrRDlwTmx6NjNXbGMrRFpWdkZlU1pFakVLM3B1NTNTTElIemtNWlhFdmc5?=
 =?utf-8?B?VXBTd2VaNDNscVdEYWpMVHpjYWp1NWRNK0FwUGtiamdZN2gvdTU3RURjVnFF?=
 =?utf-8?B?U3drSkdQSmMyVC83RW5iaVA5Q0NneTVoVW1ENEtxbnhnN29pdElCSzVzSi9Y?=
 =?utf-8?B?ZmFETDJIajNHOVRmbFBibWNqYmRMcEtSaTBwNzgvUi9Pdm9sUkxCTFpweGcr?=
 =?utf-8?B?aktRT2VTNm9JU1VWa1Y0MDV1M0lSRTZ0UEY2eDJvcHZxWWhKd3ppQ1RTdTNn?=
 =?utf-8?B?OUhzR29iWHRoekcrNDU3L3FBZGJnM1hiTEE2bGQ1OWNiTXpyQXV6MFdWN1Bq?=
 =?utf-8?B?cmxsWmRVRmtGaCtzeWpFQVdVdTBRM3Rwd0lrd0NiTTI3M21LQTJ5MXk4T3hz?=
 =?utf-8?B?ZlVyTFZYMWxteVNMNTV4ZEhwSmdZVUNxY1lGQ05zQlk0TEppRTJGaWUrWXA4?=
 =?utf-8?B?SUk3b05SQlJKbU9vTlFISWJDR3BpTzEyREpVemRmQnYrM0daa2hyT0Nia0Rk?=
 =?utf-8?B?aEdkYURFZ0NXOTNVbW5xS1NEOFI3Qmkya1RYcXU2SDZlSWI4RHdFQU51Q1ZT?=
 =?utf-8?B?NHdicHpzSW9mL2dpb3BhZ2I4cUdmOUZva2RHNXV2bnYzY2xyclRvcmxPSXBu?=
 =?utf-8?B?UVZoazNCV0lHMks1M3M1S09CbkxHMCtOU3F4UkRuelJTNFVUNkJFeHhxWWxs?=
 =?utf-8?B?My9PQmJIK2FRbVdFYkJTbE9nZDFPcCtJOTRSWElNM2FoZzV2QXB1ZHJLT2h5?=
 =?utf-8?B?TGFNU0Y0aHdOSHE4WWVhSHdGTTZpdU9YSVZOblEvZUFIOHBhQlpMS1Y3dkx1?=
 =?utf-8?B?TDZiRjh4Y20xQ0pEckFFYUJMMUR5eFFQeVJDTzBoY21ybHdBc2JGQXFaWjJR?=
 =?utf-8?B?aloxVG1SNHljNUtlNS9BUUdYNFZWWnFvRzcxeHZGWUIzYkNHa1BqaWZnWFZM?=
 =?utf-8?B?ejVSODJ3T0lleXZRc1FOVGFoKzEzZEQ4T2tGNmZCai9sVEZzZFhaYWhFV0hC?=
 =?utf-8?B?dDVNeXN1S2l2WVp4aEdvM2k5WjZTTDVURUdZQUQ2VWlHNDB6RGQ2TDZab3Jy?=
 =?utf-8?B?UjZ0cGNMdy9TU3U3NXZBNkVHeDduUEozalV1dktoZ1FTaEh1M0p1bHpHclFu?=
 =?utf-8?B?V0lhcGFwVXE1NDcxYmVTSmdyWXlYdXFRMXhUSEs5R05jVDdCc3lSWEZ0ZTFJ?=
 =?utf-8?B?NktTUmp0bGxCWXA5YXZJWUVEcDErVmU1Rmk2QkNWblM5dXp2cU5ld0hUbVZk?=
 =?utf-8?B?aEp4b3ZTNkE4KzFyRUJiQ1RZNmZaZHFsRGtFUmZMM2NndlIxc3NqVUxETEtQ?=
 =?utf-8?Q?En/LmTBYUwAjONO7uD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d00d5b-3b5e-4270-3c56-08df111cfafc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:27:07.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4j59FFgoVfKxYlqT2Nwgve+MpUzbtHIA0kI0ukB3Ly8Gz2vhKHnoZpzeuAk/pgYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

On Sat Sep 12, 2026 at 4:29 PM EDT, Jaeyeon Lee wrote:
> The XFS setup for ./khugepaged all:file checks that the kernel supports
> XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=3Dy and
> xfsprogs is missing, mkfs.xfs and mount both fail, but
> SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
> The test then runs against plain tmpfs and six subtests fail.
>
> The script already has a skip path for this test, but it never runs
> because the path variable is always set. Assign
> SPLIT_HUGE_PAGE_TEST_XFS_PATH only once mkfs.xfs and mount have both
> succeeded, and remove the image and directory otherwise.
>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
> ---
> Changes in v2:
> - Attempt mkfs.xfs and mount and fall back if either fails, rather than
>   only checking whether mkfs.xfs exists (Zi Yan)
> - Fix Assisted-by tag format
>
> v1: https://lore.kernel.org/linux-mm/20260911124517.63714-1-jaeyeon.lee.d=
ev@gmail.com/
>
>  tools/testing/selftests/mm/run_vmtests.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>

LGTM. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

