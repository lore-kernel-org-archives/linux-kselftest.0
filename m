Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496583A3804;
	Tue, 14 Apr 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166818; cv=fail; b=KtMLBrG2ONaFxf5RMS6L5wjvn1LIvQbOeFYZf5OhVYf+LpRBhBGP0iK3SRyH5uN+64+MeCMdt0NJE/N9RmOugh2krd1RlgUBtirIl9OrH+tJobpbf9y3p922YNUdcdVEgwFoACODob9tKDnUPFKGWVp3kbKFzY67QjgFEzoLNaI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166818; c=relaxed/simple;
	bh=eLwQiewqJtAZ4Bmq8SZfC3it4vDy0yrSxzGZHatIwQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JcW0N2UY2uNrwxYWCzZSpUwcl2zlJT1g0/hGEmdpt881NmA6lpWvJgbdM12awi8pw55UvHEQhb2XNzPnTx5NRpWKynblS22kav8kh+ssqXPIlw4d36LHLiwOGnajTryDV87g/LYMcCwukNYocxGlzoqq8dsr7es0UAOCPD5VCbQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jRvtdIoT; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jRvtdIoT; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jRvtdIoT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jRvtdIoT"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OR+lk6folnKS6ntvEwDNSAusYOeRHmlfbBsSGgSmE7k9RoMpMHMaHSA2X7SXPBpXqXHzqbHJc/yrUSWTLb4VUs3uZIeiIJ0vH+3Tv4nH1S73TgCN1OGaIR3AP7S+tVDsjGr6pXQWOvBsFMGzGyl+3suIk62kzUQIx1fgD1kG5OYBlKXbGGAOa+x5H3cox+sBWnXBQcnVD9kcq+MfHm21LpjTw2TVdYvjezKuIzjK/fRE16kUsdKn3wpYLcbzugwO+uGIEhcIdWGZrXRulHY3ZpjW//VaOozadnTYc0MkKeCjBWesWr3HafcsgqbfBR8vXjGNfVHOC3h530T3djMVmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHxZNhldlLNXEJfGdhWMB8rtld38eJtIfX5ODfX6i44=;
 b=LmOENPPNXm9ykvfGEmUoYxm/mc9Eaw/De08aBzJz+28kQmKu6QpCImMhcyYIRaOpSKqZ8w8k+dZGz9kRQj7AmxEv4hEs00av9i/P1ykalLfHEZZnnaRhKpKSfp+gVAPS79CoMac0m4a90wnzaaJqa0UxW31pTvL3VwEVYJsyLDto6HLYzyXLrTEglXDiKS/9LbJkHRh6HioMeN0QGdQpW2XKz7YVOMA+09JpKOPftJiH02Af0W/XltxcBA1xjLGWGegQ3vApwhERLnfUO7eHkwweyqC2oZF/xLADDRL9jsEdYMeb6CnTqlH2APNTLpqJXCm9N0m6FXhBHNlkKYhXcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHxZNhldlLNXEJfGdhWMB8rtld38eJtIfX5ODfX6i44=;
 b=jRvtdIoTYhkSXMQpCvl8K8e5q6GiYSnjbFeC5P+tECLRMoSeVDPsN4RNrO7xFeiCo0aOxonG29I0LoroZnLuVsh+j0Z1uXXmUQth7/0Fj5MpB1sL8HVxhVWmjJwiWWb0vZ0iN4LQmWxwl7NFhXHDLOWDhTysuoHb4uW4qzba3Go=
Received: from CWLP123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::32)
 by PAXPR08MB6479.eurprd08.prod.outlook.com (2603:10a6:102:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 14 Apr
 2026 11:40:05 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:401:58:cafe::8e) by CWLP123CA0044.outlook.office365.com
 (2603:10a6:401:58::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 11:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 11:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPt/Yv3wv8R2gUCAsnMpFT3bQX7OSRjU5rpjit/WHRSsI4osv7duV6+ThSbJ7Utz2I2lfglLdyQ8FGgMtV9pGL5FsxfAheq7XlEUxhyC2xKbThxDoWYeOcY4s8pgiqwKL0UjPAyYqCsSWhYsOK5a4+6FHYOlKswM0XzjTJZQKg5y3xgwOmjHjBsdhAX/47I2iq1xlo20xwnCT1UhnQltsqot3gMFFIaoqMEcXCR30hBp4Ziz+1TwxMewxqTK+MbG1epPDyqDH8WbzGvf2JqatSr9i8yyIRVpJzpgKjV9xrwycwidkPElIiJXv8seDxZeLn7V886GCsygVO6X7YLuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHxZNhldlLNXEJfGdhWMB8rtld38eJtIfX5ODfX6i44=;
 b=Ebsc31H/3MsH1DM+QvI9OLCXc2W2ltTg/A7CM6YRXcoLG4xdvUgaP2OUOBZ5OAWZ3YdfjY6rN82QlTf7N70zQsbBx/dMSf5uB/FM1Y29bNDeKCpwcJ3NC8I36zGrAiuwIsIJzHhJz9aGOs5XG+5YX8OMDVH//MPvM4IvFTfZs86M0vGz4j0eXIxJRTb/WV6w6jTueBrpRq4a0YIwYlVBfrktWSvMYeLJyUKRApBhRhg9CgKGGIPV5dc8Hv7eKDIQL9413o+JYJZ04udPJMIotERquFifABeHjTi2x5BT8fKqnrxb876C9iI4GXl9a8FayEF/zyHzXQQ4uer3BPJt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHxZNhldlLNXEJfGdhWMB8rtld38eJtIfX5ODfX6i44=;
 b=jRvtdIoTYhkSXMQpCvl8K8e5q6GiYSnjbFeC5P+tECLRMoSeVDPsN4RNrO7xFeiCo0aOxonG29I0LoroZnLuVsh+j0Z1uXXmUQth7/0Fj5MpB1sL8HVxhVWmjJwiWWb0vZ0iN4LQmWxwl7NFhXHDLOWDhTysuoHb4uW4qzba3Go=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AM8PR08MB6356.eurprd08.prod.outlook.com (2603:10a6:20b:36b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 11:38:59 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 11:38:59 +0000
Message-ID: <b6d95c9a-e12b-497f-9017-93b184d8622f@arm.com>
Date: Tue, 14 Apr 2026 17:08:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@kernel.org,
 shuah@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20260410143031.148173-1-dev.jain@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260410143031.148173-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AM8PR08MB6356:EE_|AM2PEPF0001C710:EE_|PAXPR08MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: c4293d47-1be0-441b-4cc4-08de9a1a92b3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 Xcs2mY+nqNvtRZhA/3NpKSAO50QczOE1K1s1vD1Ar0xe0Wf5F0dbNBo7J0XmZR9bAuVd0+5kZlWXZ/QoCXoxHrMDZSSB4n6+CVnCS9DqVja+sReyrXO47Ek338dqlKwb/S9f3y+brUgSrrslCKt03ALaDVDgDPbLmR51boUBBFaEUP/sLWlpGEB/Bvo+kJOswTWkp+lBJVNBuhiZNi837aI72JT/+kbJKnQvuPF9FpZzlFrHpO4RMimXeQU3/CK367M0Dj48y2kFg2SHIOUPNjZ8gTBA82tHiqS9/GKLEBIYXrBWZcs98SIGw4pvHQScJE5K4kWgbZlt8yfVw4YUZANhyPYzcXQPuejYAwG3vQgl013+ZCemRYDI5Txsgi53xqUnJlNVroy1TmkdkYL14/SDfDqJX6Cu5EB/wSQt+6hkyDjQ/clHdKF23rJcj6yfYNRt4JU2fFEDwwq18f033mH8d17uhe8Ux2ED+/N39/0FGPTjeco6UZJPb3J1UNAWnzqmhRpR1k1NXHRxD33+Y1EwRIxLSwiiATCt2lfHn/NFwz1o8GdyYjA9v/YGgreikW90W4GHwAfTnwSjEtCrHftS9l6OwNuXKTe/hX6nbAccnayAU5+jjl+L5YWKQBeL/0QFunvFNbtZ6zcjBtm+psScSK1qY8q/0Dwmwg0nzcJ66QUw0XBz7DuH+PIBYJGVrx+JX9O8ZG9eskEigasN6J4S9B3tt5uTcyAfQtH8M2k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Gyzwp38j4IUPC7VACzdH7bH5Bvz/O/XKfDKJKZtJAqqsJsZ/xvqzgLaIgzgiYJ6ASb1mo6EB5spExCf3eMiAGPH30OsEftYtffVWN7SrxTSl3n/ikYvHtRpwxlosyER+xYdTGoaqPec2avJE3bMpFZ1bGPeAoAF+nFFeGcywP8+OPzgmpLqC3HcvtcMT6E9qfH5WEaSzIcs/6+OEbCzfaodBrMplI7dzMuLCRI1AWh8MpRxd3S0TfVCqVVz+7VSA4z0uwTfwcDS8014jZLzLacsnUyv0pA2k6m4lOsfA75vxTpaGeeQT/tGWhZy1/b5DR292DTv9qFlMKHrwSK+vUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6356
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c606fe89-b2d9-4ddd-4931-08de9a1a6ae9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|7416014|376014|1800799024|82310400026|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FgltFu2f+D00QbqXuVaIdPEa/MMNF9zfpSpvC4cLWIUndmn5DcQJ2EdrfEiQywUK6aHV+ZlMS5L30eIATLNPRMk2jUvPEITymkgzqe/XpSemScPH3xiNclJuPaPtg+8fPlAS3EVMi9WT4CudsBjo/0cW3Kx3ApcOCf6EqztqkkcFyu/74R3Qk70GLhJKkhRyEl/6Uwu7NNWdIGLUyDjuSRgAxQbCXDo4wirYExUu1Q1UEGBgJkduRk4cIRU5Lzj2q22g4gHBsz/9LCu9Fy+TopfmCcZ5u1N2OgLX40LDhkwWbqvUwPsK+32/oKl3KlScYo6ZEc65lD+1IvhoMprhXg+4PgSutX44R/UeVkkkrTjSFiqBaNT3nKcufseKcPb5/t5h/G5Y+W7auaGXXHMWtJ60M0iZOyplfZ0tZY4UttjmmCUpYwABmKbPT3kIGtQvp201DrSwbr1PJqLSuCRUMeouNMd7GkTasCFqwNtzHxfIDHbABRPMk2l4tG7x77aqH7ZR8xFAseGV+YTYIj+CUg15aTJvi1PfxkPpHNfgp7H/cMldWhqTqWgyYE852xzfDtiOLu5JTY38ggZM+e5QaAuoTDU4nY1UxclkuX9OjzUIYdp7d+1EdTupRU5NAw3NRjDMxV9/FXNRqGSFhlsQNAutYZZ9Sou7LlL4335eSCPs7Uhylnym8gr15wMjGNxLcS1GBQGJSJx+3QXkySgSxnPPqkicruYc6LKDozkxcA59NovwZoJeG8pJOpq+RTxpU8dWhq3hN5B/XuzABzmhMQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qwMIVNytiOlRucSGIcv9ACtvsMKTK3yJopJjIdBz0XvqA/kprb7H7VPZFVmKnTh8kTdvTQauYxlJPHxFX4XnYaDSkXcrmMq1B+zgUV+NbpDcmTVyFjTblFYpSa1VzjDvlOVavIoraT+rUG4V0MgOQgtrnET1i6ed0D+lbJ+yiXrNhkm7N9U7O773or7IpAvEJuxiSKGLP/L7dLF1YvoahF6xw0p6DZsbXbML+Ag53eurlRCHjU6Y8Ntk1kbCFiqAJC9DZBWt3LM7ZyIlfEkftwzLhftZJmZ9m5Ulb/u8gWr/8XvxiMxV/aP/WK7I/3jNziziMzZEDJbBCY7MM6HwJJhISzKazHBoK1OOM1XRVXEi9GEivui62plMemR0lHuxCLLngUvAbz/3yZz12QTCgnrrv6aXC7wwKfx6UXy3iuBW6ZbkTJ5lTS4fHA7l3bpp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:40:05.3243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4293d47-1be0-441b-4cc4-08de9a1a92b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6479


On 4/10/26 8:00 PM, Dev Jain wrote:
> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> mremap tests") validated remapped contents byte-by-byte and printed a
> mismatch index in case the bytes streams are not equal. That made
> validation expensive in both cases: for "no mismatch" (the common case when
> mremap is not buggy), it still walked all bytes in C; for "mismatch", it
> broke out of the loop after printing the mismatch index.
>
> Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> execution time from minutes to seconds using chunkwise memcmp") tried to
> optimize both cases by using chunk-wise memcmp() and only scanning bytes
> within a range which has been determined by memcmp as mismatching.
>
> But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
> unconditionally. This makes the speed of checking the mismatch index
> suboptimal.
>
> The mismatch index does not provide useful debugging value here: if
> validation fails, we know mremap behavior is wrong, and the specific byte
> offset does not make root-causing easier.
>
> So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
> scanning and just compare the two byte streams with memcmp().
>
> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

I have tested this patch with

./mremap_test -t 0

and the selftest results are unchanged.
  
I did not observe any significant change in execution time across
multiple runs.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
> Sorry for sending two patchsets the same day - the problem was made known
> to me today, and I couldn't help myself but fix it immediately, imagine
> my embarrassment when I found out that I made a typo in the binary search
> code which I had been writing consistently throughout college :)
>
> Applies on mm-unstable.
>
>   tools/testing/selftests/mm/mremap_test.c | 109 +++--------------------
>   1 file changed, 10 insertions(+), 99 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
> index 308576437228c..131d9d6db8679 100644
> --- a/tools/testing/selftests/mm/mremap_test.c
> +++ b/tools/testing/selftests/mm/mremap_test.c
> @@ -76,27 +76,6 @@ enum {
>   	.expect_failure = should_fail				\
>   }
>   
> -/* compute square root using binary search */
> -static unsigned long get_sqrt(unsigned long val)
> -{
> -	unsigned long low = 1;
> -
> -	/* assuming rand_size is less than 1TB */
> -	unsigned long high = (1UL << 20);
> -
> -	while (low <= high) {
> -		unsigned long mid = low + (high - low) / 2;
> -		unsigned long temp = mid * mid;
> -
> -		if (temp == val)
> -			return mid;
> -		if (temp < val)
> -			low = mid + 1;
> -		high = mid - 1;
> -	}
> -	return low;
> -}
> -
>   /*
>    * Returns false if the requested remap region overlaps with an
>    * existing mapping (e.g text, stack) else returns true.
> @@ -995,11 +974,9 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
>   			      char *rand_addr)
>   {
>   	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
> -	unsigned long long t, d;
>   	struct timespec t_start = {0, 0}, t_end = {0, 0};
>   	long long  start_ns, end_ns, align_mask, ret, offset;
>   	unsigned long long threshold;
> -	unsigned long num_chunks;
>   
>   	if (threshold_mb == VALIDATION_NO_THRESHOLD)
>   		threshold = c.region_size;
> @@ -1068,87 +1045,21 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
>   		goto clean_up_dest_preamble;
>   	}
>   
> -	/*
> -	 * Verify byte pattern after remapping. Employ an algorithm with a
> -	 * square root time complexity in threshold: divide the range into
> -	 * chunks, if memcmp() returns non-zero, only then perform an
> -	 * iteration in that chunk to find the mismatch index.
> -	 */
> -	num_chunks = get_sqrt(threshold);
> -	for (unsigned long i = 0; i < num_chunks; ++i) {
> -		size_t chunk_size = threshold / num_chunks;
> -		unsigned long shift = i * chunk_size;
> -
> -		if (!memcmp(dest_addr + shift, rand_addr + shift, chunk_size))
> -			continue;
> -
> -		/* brute force iteration only over mismatch segment */
> -		for (t = shift; t < shift + chunk_size; ++t) {
> -			if (((char *) dest_addr)[t] != rand_addr[t]) {
> -				ksft_print_msg("Data after remap doesn't match at offset %llu\n",
> -						t);
> -				ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[t] & 0xff,
> -						((char *) dest_addr)[t] & 0xff);
> -				ret = -1;
> -				goto clean_up_dest;
> -			}
> -		}
> -	}
> -
> -	/*
> -	 * if threshold is not divisible by num_chunks, then check the
> -	 * last chunk
> -	 */
> -	for (t = num_chunks * (threshold / num_chunks); t < threshold; ++t) {
> -		if (((char *) dest_addr)[t] != rand_addr[t]) {
> -			ksft_print_msg("Data after remap doesn't match at offset %llu\n",
> -					t);
> -			ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[t] & 0xff,
> -					((char *) dest_addr)[t] & 0xff);
> -			ret = -1;
> -			goto clean_up_dest;
> -		}
> +	/* Verify byte pattern after remapping */
> +	if (memcmp(dest_addr, rand_addr, threshold)) {
> +		ksft_print_msg("Data after remap doesn't match\n");
> +		ret = -1;
> +		goto clean_up_dest;
>   	}
>   
>   	/* Verify the dest preamble byte pattern after remapping */
> -	if (!c.dest_preamble_size)
> -		goto no_preamble;
> -
> -	num_chunks = get_sqrt(c.dest_preamble_size);
> -
> -	for (unsigned long i = 0; i < num_chunks; ++i) {
> -		size_t chunk_size = c.dest_preamble_size / num_chunks;
> -		unsigned long shift = i * chunk_size;
> -
> -		if (!memcmp(dest_preamble_addr + shift, rand_addr + shift,
> -			    chunk_size))
> -			continue;
> -
> -		/* brute force iteration only over mismatched segment */
> -		for (d = shift; d < shift + chunk_size; ++d) {
> -			if (((char *) dest_preamble_addr)[d] != rand_addr[d]) {
> -				ksft_print_msg("Preamble data after remap doesn't match at offset %llu\n",
> -						d);
> -				ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[d] & 0xff,
> -						((char *) dest_preamble_addr)[d] & 0xff);
> -				ret = -1;
> -				goto clean_up_dest;
> -			}
> -		}
> -	}
> -
> -	for (d = num_chunks * (c.dest_preamble_size / num_chunks); d < c.dest_preamble_size; ++d) {
> -		if (((char *) dest_preamble_addr)[d] != rand_addr[d]) {
> -			ksft_print_msg("Preamble data after remap doesn't match at offset %llu\n",
> -					d);
> -			ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[d] & 0xff,
> -					((char *) dest_preamble_addr)[d] & 0xff);
> -			ret = -1;
> -			goto clean_up_dest;
> -		}
> +	if (c.dest_preamble_size &&
> +	    memcmp(dest_preamble_addr, rand_addr, c.dest_preamble_size)) {
> +		ksft_print_msg("Preamble data after remap doesn't match\n");
> +		ret = -1;
> +		goto clean_up_dest;
>   	}
>   
> -no_preamble:
>   	start_ns = t_start.tv_sec * NS_PER_SEC + t_start.tv_nsec;
>   	end_ns = t_end.tv_sec * NS_PER_SEC + t_end.tv_nsec;
>   	ret = end_ns - start_ns;
