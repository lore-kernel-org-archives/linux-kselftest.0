Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC85434409;
	Tue, 11 Aug 2026 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448496; cv=fail; b=KgWw6BVziT4jldmEB4B9zfqFXffZjW4GZ3ED720U/weYobT5tUKKTjI00LCuTrAwjfZdmsK691xK04q6lW+lNvYtJsVaVVdcrUneKGBfHA5DPA/rTewSSiNafLQTvcz+wkRvA09tEdLWTZ3ZZXngq9XvZLW+aK0ipZMlVJ/BbG4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448496; c=relaxed/simple;
	bh=RriE3vWHTirq2v4JgGM/eYJI0JPsXooWPWvgucFC5Ek=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LfrM1Fl8M9LQAQzd2xP5KL9rPXUo+lDzqOMbyPgPr8Z+PiEhNP5iwjtL/8Cw8Es1ozQZEdPsADFEfvS5ErvMdOFpcXOvQh6Iu8bTf3/ntsC2bNNtnXidWRJ3v+Wpcz2E5j76DhS5guJBUvBiYE5JBDHRL3o8xrD0SQ0EJGfStfg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YzaxApfY; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YzaxApfY; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YzaxApfY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YzaxApfY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZMEu51GW2TN5qXdIGuA51bSL6DbBhXFhgbq1vJmYYVBqh4IH8uQQMDltCw52QBa5TQriYacBP+aMtq9nl5bVStk1nXvZihUW/OjJAlOxKmFVZUzBCuqkaorDNDLYNzyAyWSyTdVwWrlGIBE2AjG89/HIbEoxDHeUP/3hvWKTnM+szYaFouv4+48lfAfkAi+wTu6hf+QI1Q8xaUd6tD6BnKBkCZA81fHLFYpWBo2poxCgc0KNft3aYba/pv4ameM/6CQXOQljOtGzz33FlOV+V8rnPUHjOS+XDt2yDueCQ3QUtWP4W0zX9EYkvjGdN/PT2sXKvN+1swLdp9US9ux7GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUaKL+QReNhmqPgsNF4Dqp9431sbjC2WZS85Tyxj78I=;
 b=kn6REFrDs5BBw15Zwt+MlXRkfPjz2pu0gr5M2cF5HJY05Nl9bPnMNh7KXz+vppJYKn9xqakHI8Sj0M6LLcnmagNtt+lasjITIop6Vapkr2lGbM8/ge5xDDW/SV8esY2ImGyhe/mtQA1f0obE5+o++ad74rqT98GWRloCnwdTI4zoYSknv//uncykqb0zs4K3379RIA7ZiMjlAvGWIVggqqt8b32Qgt82926TWHVeWQfn5UVGsr+aC2ho/sAw3SJ9DjxSeHDp9IMIoRWt44R2gQzf4OreyNuVrjC8cj54cDddHh5wA6vLluigicLsXx3+eIsfGaDJhj0mIWp/195zmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=shutemov.name smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUaKL+QReNhmqPgsNF4Dqp9431sbjC2WZS85Tyxj78I=;
 b=YzaxApfYzsWPyaExSqmQkgBrrxUrOnzeyRm/g4kCE+5zTe4MVfvIn5RUCIYM4HUeh/g1BkUstsfKD8evlgJDuPRvZ4UKzjUqvDYEM64VP9RqelU5DYv+furc+oNzJYqNqogqHzFFvGeP3hg7j7DzM/RP8XwDHcow+SZS1BppMog=
Received: from AS4P190CA0060.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::13)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:41:28 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::73) by AS4P190CA0060.outlook.office365.com
 (2603:10a6:20b:656::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 11:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 11:41:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTNhLDdJ0zxuXHstKq4823vXLhjCxkM8ZHVV6YU3qNRQphx+8JYL22PNAYJuLheE4N822023VRxWT2+j3X+nCwucxOa7Jdz3WQZy4F+BMRRcMk7ono13/wOH+ctM0ZggXWelK7eu8G6xg3sRq1VBxXZjwNTyuCg8l+zSfEfuvPGvGMxM5H86zUE4JQuNq1chEApPviqhsxNRlfCgOo/F/HhvA/B96EWTBs62IADRK8NrVcayletsABQIXDQGzTmfFcWB1LU9wuT6vQEP5gWgvGR2YKlVXwqyXD0cLwmt9Eo/iTec6YiaOe39Mz3PdomvU0gv9Ms5Ko68QXlK1+lx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUaKL+QReNhmqPgsNF4Dqp9431sbjC2WZS85Tyxj78I=;
 b=FF5UtskSbhCSnxV1ICUHMXVqTPkNADTevq60abisc18NZNJ+WWpHtS/kjRyXRxB0yHoE9AVX9We922mfdtZKMrqnK8wMP0LMqCnHwR48eLG0Cy3cbsMFCS32Jxf7p9nFNbuqRlbnA5Mn4MoM0RXLzVyP49Vs2OEX5H/S5kfwFB5UbBQFCNuwM+nM3dZEDC6Ol48yx9mkvOO22E+cSqonHxNs4KcPRDK6VDh+OC6Mj0N/xxYbdgNhQeAUaM2ZU9YaZBlrQ1bLmiLXz0xs3PrgY2hLxBS64iCUfGpWQCAAo9AMjuDdN/GqaVCGJg2J3YVwPhE/R3PPFBa8gImX39gwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUaKL+QReNhmqPgsNF4Dqp9431sbjC2WZS85Tyxj78I=;
 b=YzaxApfYzsWPyaExSqmQkgBrrxUrOnzeyRm/g4kCE+5zTe4MVfvIn5RUCIYM4HUeh/g1BkUstsfKD8evlgJDuPRvZ4UKzjUqvDYEM64VP9RqelU5DYv+furc+oNzJYqNqogqHzFFvGeP3hg7j7DzM/RP8XwDHcow+SZS1BppMog=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by DU0PR08MB7639.eurprd08.prod.outlook.com (2603:10a6:10:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:40:54 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:40:53 +0000
Message-ID: <e1364571-376a-40c1-937c-40f68b06b09d@arm.com>
Date: Tue, 11 Aug 2026 12:40:51 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev,
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com,
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev,
 vbabka@kernel.org, ziy@nvidia.com, agordeev@linux.ibm.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kas@kernel.org
Subject: Re: [PATCH v2 00/17] selftests/mm: improve khugepaged coverage
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, nico.pache@linux.dev
References: <20260807113647.3744609-1-kirill@shutemov.name>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|DU0PR08MB7639:EE_|AM3PEPF00009BA2:EE_|AS8PR08MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 169e4b3e-b64c-446d-eca0-08def79d7b47
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 FVvriFX0pDvCv3KK4WDh+kt7fc5guXQqE9IImJ4Rzy1sDUuQ8MFoDg0nZcSIzwC3dxqAw2a9hbIWGylhCC7lVbiEIhTmuRCUFA1gOs6yR7ot8v6IoOEidTW6X96O7dbW4Yo3chq2uAQNKGaYFp83YOJ7pb9lv7o70NTiqoy9p21HGY104N1tPJEhPgvTSAyF3w22Te2ydA84DR5fSbBIT4B1GPr+eSj6+ilV6MPt2C6XMgMHEgcEAR8S4KzZZnn+2Qggv7aT76P/Svmic7l5w2DfJwJWH8b1xvYsIVoE9z3CkloCTo+yfRBV5fgS5EkrGaQybEQGXrfKtbkPTa62pNX3RHGcrijyI9q9dxFQgiPSAZ6Y9JTj3al6csrP/5IPnMYBJMvmUU3ytr7Gu/sTC17ejlqwVXI6s++suCPUYgSmSAbGtzzN90Q4CI7jaRPrjqxtcSVu+Nd1B8aVAleoBXJmt+k9wclO2RxfLrrn7gKV45W3yN0H8RR0CNOnCIlyfQQte1xTyV+GE9nwVXrpnyBNKOolNc/uL27mF1fYn+YmnR+fP+jIYVB68GYHyXEJX4zlN3O+A4eGeO1SDvMIqCiIWjpVtvRcvkGzlxF9KjRFmdmwEJPytt1enX/o2SAnFLZ5+P83a57jVgzQZLYkYUcP10NmJnEEK3vLzzS4yJg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 W0KCmwcwIoLydYqrUGZccqWym208SAx9oeEi5PkzDgbE1AnzXgU0Cb6N+2fuLPyzbyb+E6Ak6gERJ5ykk/O6UMqUs8LHJg/de/fEkptz3BU0aS2ooTKRvRbYqrVsn53b8myt5CtsQ4BMwLyzXDmmIZPjUrWfmc5RnYiVFuS51v+KgETEiI7bxcxjhmM42yOhkP5hspVb/O3oKSsBtzOwUZ2yW6GeHc/TuLBHRoLAgr5LJRn4ndtJhZ7lpyBl3HW6ghLATORabcBrwsouEJpaK7GiGsBdQj21VD1SneWVhvBhxDWErMav2QHnCCbctxWz8fmxrR2KfM9F+tUZE+bUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7639
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06b7a6ee-e7eb-4c06-5168-08def79d664f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|35042699022|36860700016|14060799003|1800799024|82310400026|13003099007|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QtpXuJp9ywRXyULDtlsbFiAE+Jl8P1lMN7EN+4nqINvDcQAKCSfmYTsjiBhIkF30EIqx8VC19OK5xgilC/dbzRH/yOj4Ibj3NOGLMCwaYv7NjIVE9KBESaeixBSiXummza4MYfgGq7kPpgwdEP0afbRkmrF5s8lPNCOVeYIx2ZUspDXUfUlwyCJikZoX06rK8R9Ue0BirS3WqOgVzr2Hd/ItKVzS9zkc3Vp8EIDhF4z14eGF6gEsFKDgJ/yNQk7a5NbkWe/zsJeryA61qvvsjGyoryBQgTJUWEPLm+JyM4BiEFn+QiT7v2BKmTC7M4/uWk7Cvzw1Hr1K6Q2Sh7RmoYpNU2+UpDkSLMVMWOHDMegSjIFbN/C5J0HGHPGFRYcOGyTAu4VBu3gu7A0nrkmK4wsuSNEqlY/73h2/YCkV4CXMtS5gMeCD8OjKZdnr4CgLuwdr+yS3p0nBrqH80RaO2OtPxn0k4XdtzaAEqjCTD1hbk5AaH3+NUChiaOspi9MmjtW+N8Nrxms1PaSo+tets2KeiNEnTtLWNmpqqhS5UsTvKgKlbNsd7czxcfzI7q1m2IEZOTQ/tA9u/z/mLLHhzhHxz1LCFhllChcUzUkYPDYwj75ja6xTSiz/0rw3ZO70ePnbsvsrNx8Id/MvdkpjWBm8mC5vRhFHnLyBWr/wRKsyeouhUTqqgdn9t9acyaXDiHg0lM50QzPNAOCZrxF99g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(35042699022)(36860700016)(14060799003)(1800799024)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kzWOR+/tTLHICH2+DbyRg6NYPW+7EagjdtI0rFYLa14cjyr8JSMYkR2O3KC308tT15L15UUxXGUhq1wHsPvmeO55GKFK2k0pPVGzqg9WYmqmVUrF8WftR7OZVC+0Nve438t1GPE8lQMiP30F53Y1De5+J/kKkPQbxNu+h0ErNxpPaGhk53mYbfUBahePE0DRgscST+MXxtXKCBLYYPzS6YQYSyuImJlAZu0HWhyIKZicMMI4v1fYDZyTCwow8N961QO/elXSRq/B7eY/xYzXdBPeEKPh+OW+tmlgxpEJJRhNn5UOGEB7iRgKseDFEjiviJsqUd93VqFOLT9dQtrG59t693ROh2eNGl0XRjg0VGJoVwmSKkUCPYo3kB+pl1c9Lk4tJX7XGw7K77SlK/QicPmJdIeVTVWLqUFGQVfOm14BuuXb3il9WjrZDZbHfD/+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:41:28.2456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169e4b3e-b64c-446d-eca0-08def79d7b47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

On 07/08/2026 12:36 pm, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> mTHP collapse went in for 7.2 with no functional selftest coverage. Every
> khugepaged collapse case is PMD-shaped, down to the detection: it reads
> smaps AnonHugePages, which cannot see anything below the PMD order.
> 
> I am also reworking khugepaged's collapse mechanism, and that wants a suite
> worth trusting before the mechanism changes underneath it. Nothing here
> depends on the rework: everything passes on an unmodified kernel and
> documents what khugepaged already does.
> 
> This version sits on top of Baolin's anon mTHP collapse selftests [1], now
> in mm-new. His mthp_khugepaged context and per-order detection are what the
> new cases need, so they go in there rather than bringing their own.
> 
> Four existing cases fail on the environment rather than on the kernel:
> 
>  - The collapse wait is a fixed three seconds, whatever a huge page costs
>    to build. Scale it with the PMD size.
> 
>  - collapse_compound_extreme wants a 512M folio from the fault path. Skip
>    it where the PMD is that large.
> 
>  - The page cache caps folio order below the PMD order where a PMD is 512M,
>    so nothing can hold a PMD-sized page cache folio. Skip the shmem and
>    file cases there.
> 
>  - The swap cases ask a best-effort MADV_PAGEOUT for an exact swap count.
>    Ask again before calling it a failure.
> 
> This is why the suite now runs on arm64 with 64K pages.
> 
> Then the new coverage:
> 
>  - Folio-order helpers in vm_util, and folio_order_check to validate them
>    against the kernel before any collapse test trusts them.
> 
>  - Four order-parameterized anon collapse cases, plus mixed sources by
>    source order, at every supported order by default.
> 
>  - A shared-source write race: a co-sharer writing throughout a collapse
>    and the collapsing side must not see each other's pages.
> 
>  - khugepaged_full_pass(), which steps the daemon one scan at a time
>    through the sysfs wake path, and khugepaged_sync_check to hold it to
>    exactly one attributed collapse per step.
> 
>  - khugepaged_race, racing faults, MADV_DONTNEED, pins, fork and mremap
>    against collapse, checked by content and by KASAN and lockdep.
> 
> Tested on mm-new (8086604be973), with KASAN, lockdep, DEBUG_VM and
> page_table_check, in 16G guests:
> 
>   x86-64 4K     190 pass, 1 skip, 0 fail
>   arm64 64K     228 pass, 5 skip, 0 fail
> 
> The skips are structural: mixed sources declines at the smallest order, and
> at 64K collapse_compound_extreme and the shmem components skip as above.
I've tested them on arm64 vm and more tests are passing instead of getting
skipped. Hence:

Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> 
> Changes since v1:
> 
>  - Rebased onto [1] (Baolin Wang), which this overlapped and which is in
>    mm-new now, so this applies on top of it. This series' own -o mode is
>    gone in favour of his context.
>  - A plain ./khugepaged and ./khugepaged_race now run everything they can:
>    every supported order, and every mode, occupancy and pressure axis.  The
>    options only narrow that down (Mike Rapoport).
>  - The fixes to existing cases come first, then the infrastructure and the
>    new tests, each next to what it validates (Mike Rapoport).
>  - The completion barrier helper comes before the tests that use it, so no
>    case carries a throwaway implementation of it (Mike Rapoport).
>  - Changelogs and comments rewritten to be read rather than parsed
>    (Mike Rapoport).
>  - One new patch: retry the swapout, which is what made
>    collapse_max_ptes_swap flaky at 64K.
>  - Dropped the swap-skip patch, an equivalent has landed
>    (Alexander Gordeev).
>  - Review fixes: masked failures, system state left behind on bail-out
>    paths, arguments taken on trust (Sashiko).
> 
> [1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com
> 
> Kiryl Shutsemau (Meta) (17):
>   selftests/mm: skip collapse_compound_extreme where the PMD is too
>     large
>   selftests/mm: scale khugepaged's collapse wait with the PMD size
>   selftests/mm: skip khugepaged page cache cases without a PMD folio
>   selftests/mm: retry the swapout the khugepaged swap cases rely on
>   selftests/mm: move is_backed_by_folio() into vm_util
>   selftests/mm: add folio-order check for address ranges
>   selftests/mm: add folio-order detection self-check
>   selftests/mm: add khugepaged completion barrier helper
>   selftests/mm: add order-parameterized khugepaged collapse cases
>   selftests/mm: parameterize the mixed-source collapse case by source
>     order
>   selftests/mm: cover a shared-source collapse write race
>   selftests/mm: run every supported collapse order by default
>   selftests/mm: verify synchronous khugepaged driving is attributable
>   selftests/mm: add khugepaged race harness
>   selftests/mm: race collapse of windows with holes
>   selftests/mm: add memory-pressure threads to the khugepaged race
>     harness
>   selftests/mm: zap whole PTE tables in the khugepaged race harness
> 
>  tools/testing/selftests/mm/Makefile           |   3 +
>  .../testing/selftests/mm/folio_order_check.c  | 137 +++++
>  tools/testing/selftests/mm/hmm-tests.c        |   1 -
>  .../testing/selftests/mm/hugepage_settings.c  |  72 ++-
>  .../testing/selftests/mm/hugepage_settings.h  |   3 +
>  tools/testing/selftests/mm/khugepaged.c       | 466 +++++++++++++-
>  tools/testing/selftests/mm/khugepaged_race.c  | 571 ++++++++++++++++++
>  .../selftests/mm/khugepaged_sync_check.c      | 217 +++++++
>  tools/testing/selftests/mm/run_vmtests.sh     |   8 +-
>  .../selftests/mm/split_huge_page_test.c       |  62 --
>  tools/testing/selftests/mm/vm_util.c          | 145 +++++
>  tools/testing/selftests/mm/vm_util.h          |  10 +
>  12 files changed, 1599 insertions(+), 96 deletions(-)
>  create mode 100644 tools/testing/selftests/mm/folio_order_check.c
>  create mode 100644 tools/testing/selftests/mm/khugepaged_race.c
>  create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c
> 
> 
> base-commit: 8086604be9733378461a5534c39cb72635226b23

-- 
Thanks,
Usama

