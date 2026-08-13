Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EFE361969;
	Thu, 13 Aug 2026 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608338; cv=fail; b=sAYySifXNUBKfetxGxD0/Mj84uFMgcLk2n0IPd6WW7qURBQjt/36l/a79mHXQEkQj1GzUyLzIUrdeqKhV6pQoQyDW1g+zjgKExAivJIA8QVUMHsxKrwglvgN0mlf+uGPWfglxbVyh8zGQ2AZwo6mjKuzlAbIeSkI+WfX0pk8gKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608338; c=relaxed/simple;
	bh=v38aBFqrvu7YCyusv2NsxtG+Ak6/t1dIqlCmfrgywMI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o7JbFZ6tVAbuG1kmylIhri59gPdkvWNpl6QYcutK/j0eSB2RQbgLJMCKpNp8f0/YKnhoJT+9hyM3uZdRAiE2tDu5dXbiMjb9pRNrEVlm9qfV+js+ThbaYD7zdE7OVzF+ixy0cUGmmIDDAgSMx+rCF8v3JmoUUe7tY5EISmEKlkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jrc+DVm8; arc=fail smtp.client-ip=40.107.208.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jrc+DVm8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Btqyy+TN3zIVSTsnhtqY41xTXsPR2pTUPpY2HNmPEDWuolFziTfWrErGdh4ClTsA1pTISxNEbjWrie0SLQZktRzfGoqnCQBKtQ/2O37OZmDaIst2a6YiwLkQFvuxU8N0xEZ0GP0cI/XNDVc7h51bWi0oC4Z8Li3MY+WccliE3K639E5VbgdNUw1t9YttuYggzo2Mcxom3y/P94b7FZnX27XYH46eqTo1jIIx/srfOIY5tE0feGxLgmfS6jacJp3YaXFFn3fs6IupKDUvkfFifTwQ82tAZ7dMbfpgBWBujiPc+Q4PTu9Y+sd1uH1lyLx1sVeSVDP3RSQXNWC2AJ/68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHuqtOSiK/oFJTyqxyZbFMF04zwQZrzcuGRzmJA2Wvs=;
 b=nZUhVUgY1I55o1sjd/fcnKL3DlBOP0QbpUk3ktM3GSu6ERENIqVLE2XFyG6Zp5s+fre+maSPjXUpLFePa81Ne44YPhcF+tRZx7KPRATY9QwLgdxjT8tYkXCMDQOhedEeDmbkuEZFeqI3AHiDl+ifq09yhn2wYIEwFoTUME5JOKiN3aPWXE7VMkUHpHlsZr20ZlFsnwnDO1GcqP8BtcCfje4TD/VS6xi2oZV4Wpt0hY2Oeg+9Zz/6nabt/H0v52k/utgylsrmlODNJt9A1DDKFLUV3RPD6rY41PnByuHVd/CoSUVKQINQ7ndjX1QWHBVpeqWVuqldIPxfhWGrPC0tOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHuqtOSiK/oFJTyqxyZbFMF04zwQZrzcuGRzmJA2Wvs=;
 b=jrc+DVm86jCcjNvI7yIZi684ils5WGY4481LZ9mosECaEa5k+F0g0a2kHGqdP0Wno1Ssrg1PGaRsVBYE8g3w61ZFMSu0Zvx2mn9cU/1vVUM5Q9a4l0huXhw7u2ZT8oz7K8r8G4WmmBBEbNGr+kzL045X3DPZ2/AV6ktuqpIHo1ioci+rX1H4oiIh7u7uwP5LRIqwY89mQZG3D4SVR7OV1FyNGj/8LNVQ/iyb94zB9xH6uXf9YA0EPCAADQvL3CoGmsaRQw/t5fogg0HEz6wThcp0Q5Bts35UTYriHS/CdHYm42mNnFYQ7d3ROCgCaH0nH0o6WfWhl4jiH0w8L/0S0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8SPRMB0023.namprd12.prod.outlook.com (2603:10b6:510:1cd::15)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 08:04:20 +0000
Received: from PH8SPRMB0023.namprd12.prod.outlook.com
 ([fe80::669e:f092:306a:7983]) by PH8SPRMB0023.namprd12.prod.outlook.com
 ([fe80::669e:f092:306a:7983%5]) with mapi id 15.21.0315.008; Thu, 13 Aug 2026
 08:04:20 +0000
Message-ID: <fdb9ff70-07d9-4966-a893-11dd7c338e66@nvidia.com>
Date: Thu, 13 Aug 2026 11:04:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: drv-net: bump the timeout to 15min
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>
References: <20260812171302.1888667-1-kuba@kernel.org>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <20260812171302.1888667-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To PH8SPRMB0023.namprd12.prod.outlook.com
 (2603:10b6:510:1cd::15)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0023:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aba7024-2d1f-4e20-957e-08def9117ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|5023799004|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qdL6MwCp75fhd9gBiTs2FUdcrIn7EUZDu04OWP+IQd98fEFQ1+f3HlxJMbsyLymM8yQd82eDDgOJVK+yM8tTS/ownAh0MqgwdYk/bANtP298qZlQfEl0iY7+Cv6E70XKlyKzfBpWfL5B7D0oxMI8rUwhvgr5OpXZ7Szu5SHbW/TqS1e/KHOMXG6QNWZmOjCXG7Gvn+u0juVnurHRNSkCqAYud/fFxc/nCdgfa+lMTmdsGeoeu74Y7WsYN3+VpDygwfRy/zWOmlwuXVNQed5RrunLDiA4H9XDWUPRfMxJ7eKK4IDnQrrZ2ikq4jP7VUHTLVIcrnWPhhJdiHrT18kmK0cZtFfNkfGpXFb7zOlHPbgSwKidCvyJ6IB8QO3w9LED7Xugle5KymZ4jna3kjIBunCJtJ29n31ynoNn6oLDgr9WTvHi8H736fHRkPcObA3buOi0PgseCpRHwQQHZdmCzL72Y67xf66WNRF23eNFlDrmUI56OCw7+QxQkW49qtItvpPYcNTxyK8j3qUVFDqvUrWbRpNVZhb2un8GSql7Ej9BS7XIBzYcmz3lFLNVMuh7GSxhoyz2bLqOViWSe3GWkONCP8BV8dpo0+Ga0EZ3+TTYBbOTdxpNGiRCZWAixggnmwQSTzqV3SDU4wDUcaqpYd8+zbD4blJ0U3UdgJLoLek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmk4b1N4RTB5NUZVaWV0d3ZSb3VuSWdsK0JlMGs2dXo2aWZ3ajRCc1hUbU5Y?=
 =?utf-8?B?QlBTNENBZ1hJWDZZWW9BYXR4L0R3R0FwK0xiS2dmNEhPY2haK3c1clpQSmFY?=
 =?utf-8?B?bFhORkRtV2tzOFExbXJDYTN1U0lGdkMzakNpVXBIVUhycDhQa08vZTRrcUQ0?=
 =?utf-8?B?UVVXakdzMGV2dmpNNkQwcUlTeDVzcDNuM2ZvVm5aY2NSclM0Ui9KRkR2SERq?=
 =?utf-8?B?eTVQYktISll3YkFqOS9mNC9sWm05SDNSMm1xWWxxZ0RySlhIUWNsMmVhajJa?=
 =?utf-8?B?YVlwTDhVeTl0RTFrVENqM2VibTFudkZYeHdPd2EyQXYzRUhNMDd5MFNyREFG?=
 =?utf-8?B?OW9tejlZTFloR01QUzE5N2JpZVdLK29mQnZHckErNXhGSFRLejdzSlpmK2F0?=
 =?utf-8?B?Y0ppNUF5MDgxb3NDWisrR1VvY1pENm43ZmYwVktQbFVObm8zQ0wvd3ZVNTNU?=
 =?utf-8?B?UWMyNzVzOGpaaEZWTE9ZSlhIaTN4NVFudDU0NTVXM2s3WXFyazMrZllaTTlZ?=
 =?utf-8?B?cHVFNk52Y0FMcGNVa1loWEZDeVJyR1hoQVhSNXA0WVZmRm9OMWJRcHJCTUgx?=
 =?utf-8?B?UCtwY3lUTHVvL1ZaUnNHUjFMMElNQ1plOEtmVFBnWDVveEs0VzNLbWpvVFFa?=
 =?utf-8?B?MTBIeUp2QXhRbmxLUVdneVk3YS85TU14UVRUSXIvTnd0U1NvSVZBaVRxam5B?=
 =?utf-8?B?QlRyeGxHd0E4SzdtU0daYTZUbG1Sa1BCUnVTcy94M2dqejc2bGk0U2N2aEh0?=
 =?utf-8?B?ejZYV0xCVGtmbEl3OVR0OERkVmJCTFAxQU51TENEYlZLZ1h4dVE5MHJRcFAv?=
 =?utf-8?B?cWoyOWlkV3A4Q2xja2s2aVlNTDBDR0g4SUk3dTQwWVg5K1FTRHVHaXkyQkMz?=
 =?utf-8?B?WVZRc1VwVEgzM3NoNWIvQjJ6QXgvbnpuZStBMXJGVjdxK3Ywd2ZyTWxoeDhn?=
 =?utf-8?B?dnlHdVJ6QzZodnJXeDV5djlnTnZOcGtpTGRValVaZ0V1M0wwQWc5VE5SUkc1?=
 =?utf-8?B?emNUTjJvZ041MVVJVTlrc0gxeE02bllOZjQ2c1orQkFSZ1FaNVVVanNHZERY?=
 =?utf-8?B?MEEvNTZSdWtTcEd5VStpRVBCcHNHR0xqUit2RkxLeVJaMFA3a3pWemhBcWh6?=
 =?utf-8?B?ckx2L29mMG1paVZ0c2JXTXFKR2o1azM1dHB5QkVETFZlV0dwU0RPR3NnYjdt?=
 =?utf-8?B?bUswZk5PVE9xd2lNdndLa1VKL2cxVW1TTTcrWUxNTk1XckNYaTBkMGhZcVhE?=
 =?utf-8?B?Uk5ZRW54NmFPbmhnWDhqcm5RS08rTmRLc08rZVpHSGZybkxqRjNMOWxHWHpm?=
 =?utf-8?B?eENUWW9ZTDcyYWhYc1dQeFpnRUpvdFlQSEZVRXNsOUk0TEp1OTZLa0ZhSWlL?=
 =?utf-8?B?SkV0UWxka1QzVmJUdXFRc0JNV3cxdXNCYVhlMWNaZGd6NGRDYnhxK0dOdm1L?=
 =?utf-8?B?Y1ZyN3RjTHJOWDRpWGJUUFBXU2lpV3MrNVJWWmIycWFyVHVhNUJaeXFpc1Zw?=
 =?utf-8?B?RlY1eENzODNqbGMya0QvL3pvdXNaNGtoQ0FnSFA0cEEwUHFQSFVHeDFteElT?=
 =?utf-8?B?VGNwdWN2YTZZcXZOdk5QQnNjVC9oTG52WFBJOUtDUUdiTGt3UFJyT3ZNNzRm?=
 =?utf-8?B?N3MzTDFZaWEzKzFjSEtwR2RIQ3lKQTJmRmEyZGUvMERWWTM3NFRmUGFLay9s?=
 =?utf-8?B?bWsyQzlsYVlwblVUY0dGNjdjWUpqZ1FScWVETW1zYTA0TURkcFljeFBSck9G?=
 =?utf-8?B?ZmoxK2tOVGp0M3c4TWxSYk5xdWRVU1VMY2pINFdRK1Q0K1l0SnprM0l0bm9x?=
 =?utf-8?B?R2pPZ0p1ZnJwZzIyV0tHa05TY1dpTEdsY3cvU1ppMld5azBDanNyaktuSE1t?=
 =?utf-8?B?VzdCSXNZclUwNTFONFNQSXcyYXIvVDlEVFJqWFdqanY2MTNJbHJGeTkwYm1m?=
 =?utf-8?B?UEJtZjlEVDkrdHRGZ3g2UmtsT1JBRE1telVVR1VvZzBZTzc2Y1c3WllZVE9T?=
 =?utf-8?B?RGI3N3JSUWg1RnN4NzNKeVZBZUJNOEhOSjdLdmljb3FwczN0L1NPa0ZwYk4x?=
 =?utf-8?B?K1FoUXhFUHo0dUorNXBlN3JlKzRNZElJdXlBNG5XUmNUNTlGZFQyWTErMkNv?=
 =?utf-8?B?RVNBdjBmVUREMW1hMExIVnF1dVN0dGpzc1hXN25ucDJuVlZhODJ4ek5NdmJM?=
 =?utf-8?B?L3hYRDF5RnVEMW9jeXVMQ2JqT1Q2WFFkc0FQMUVpdkx1dGt1SUREdk44K3I0?=
 =?utf-8?B?bVhNVGduNHY3MktsNU1kcisvbnlNUkNMQnVhalBqUDhhZERTWjBCQWhyQ3ZN?=
 =?utf-8?Q?YCEyD67U48Il9PqJVC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aba7024-2d1f-4e20-957e-08def9117ae7
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:04:20.7017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jvyUHK/lloxhq6EJL7g4bZarMcaZFk4MyzIKcGuhqBlzfiOD2yLa5KzlqmS+5jB0JqQYmbAa/KPsD7y8tFTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655

On 12/08/2026 20:13, Jakub Kicinski wrote:
> The GRO test takes extra time on NICs which support HW-GRO and LRO
> (as it also runs the test cases against the NIC implementation).
> gro.py takes 6min on bnxt and 10min on mlx5 with debug kernel builds.

10m works for xdp.py but it seems that it isn't enough for gro.py :(

    # ok 265 gro.test.lro_ipip_ip_ecn
    not ok 1 selftests: drivers/net: gro.py # exit=130
    # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

    NIPA RUNNER TIMEOUT 600 sec (graceful stop)

https://netdev.bots.linux.dev/logs/hwksft/CX7-dbg/results/776322/test-outputs/0-gro-py/stdout

> The delta between drivers is to some extent due to their defaults
> (mlx5 sillily defaults to queue-per-thread, while bnxt follows
> netif_get_num_default_rss_queues()).
> 
> At the end of the day the defaults don't matter much - on larger
> machines all drivers will create more queues. We should bump
> the timeout. Let's give ourselves a 50% margin over mlx5's needs
> and set the timeout to 15min.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: noren@nvidia.com
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/settings | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/settings b/tools/testing/selftests/drivers/net/settings
> index eef533824a3c..e2206265f67c 100644
> --- a/tools/testing/selftests/drivers/net/settings
> +++ b/tools/testing/selftests/drivers/net/settings
> @@ -1 +1 @@
> -timeout=360
> +timeout=900

