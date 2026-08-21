Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC2495021;
	Fri, 21 Aug 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328728; cv=fail; b=W9wpQzGc9xzxMb6DlDhHck7Jv8T3/7ZTmx1wgDONYyYFxtTqK7WiTdJNI+pkUXnGuoutrOPXXhOb+PucWZ2CrlPNR+JpKAkPDdWy4r2xYE+PYcr1SmSJKuBcgNdBCqvtYk4u6g7z01DLJ9Epb7QM2B7mKs9LwYwi7d9uzpxbPlI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328728; c=relaxed/simple;
	bh=IEnlLYlzLByRUq/56ecLLjr1yHJ2r036vD2lTUeQ8Ag=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rnwX61hAw9h55eB8gkljNdUuW22Bmi76sQbD0NtIlllNKXi5pu2lwNbePMJrCifdwAevwoudQ108zPDpFDl8n8UkYqVs8b1Udr/qck9OgAOK/sf0ftkB1kjjwtacHKJHwV+VTRGx+67yuVS8Cyv3G46nrV8btU92n5paYvOVO9U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pyD+zyK+; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pyD+zyK+; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pyD+zyK+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pyD+zyK+"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nPGa5HycIKbTvKxKAE64qgbSRdry6MnOALuuHBpJYpqm3w04bJisDeO4g6gxC2QxtclWMltNxowzYs9PHbsq6tICeWiuoWL013JYPxZY7rmU9aVBFaKHtQ/8Q20J/4HyntBlpzPgvbETRvzKZ2QVS6a5Wt0zDkc6Vus5/cDzXogAlEZ1a5N0teefXlJsk4tbCf+L/imnXBcM1jB/YGvrarB2lfRmoqz+7YxOeHtEu07YMtnPJWznDsH3L693VBu0L8gmC4goB9EWfUf9P1KWX+IYCw+zUBsAAMM2ThWESfopiiPuzIKH/KXaLH/5MrGDrJScOr0u4vDCogL7BOkTHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kyuz2Ki/l5OY8WDIFWi2dVlQrOdtPFv4LWlt8kO5EXk=;
 b=ZDl5cAAfKTWDA8aP7zXhiR/T5y2077wzMyf7c4b2M7fl5vv/xzHXTfmkEnvFZlgVvbODjTkfYX+ms01BltJ8LG8G7iETaa2iPheKwzCknPYuA4eAzLamsqTlTYE7CdmpIxYds0hwAEdpzG4f73OdeDC/wU+HKQHYasAE1kkzj4lg4WRwr/cY9fLCFOsOLCERuOS7QLLs8TBk/2KsD3pRRLdjC3jhH+Ipk+N4o9eiZTpghbgc/NkoI7VqAmZ4MjvsKCJfADSbgQ6IokvWaAEQG+cNrOjmWc3WumGpnfnkGHRoYzXzzOI3fIyYIl1ckI6whgYBtEkvysoYhL47X4EYJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyuz2Ki/l5OY8WDIFWi2dVlQrOdtPFv4LWlt8kO5EXk=;
 b=pyD+zyK+gO9CfyRDbdiNZJNcb7GEB6Z5wRWuxokaiL7Z4YnLGI509N7SdQ7TQBhI1t0JbuzhORk104Kz3Gnuho2xFyPzv/SvEH0a1lyk9QrxwzsNPgn/IsGzoWFOLhWUj2VydwF9mKF1cpfqMkhJsGxrEP1DrLkd4YTa+6z50Qo=
Received: from AS4PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::16)
 by DU0PR08MB9680.eurprd08.prod.outlook.com (2603:10a6:10:444::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:12:04 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::6c) by AS4PR09CA0028.outlook.office365.com
 (2603:10a6:20b:5d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:12:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 21 Aug 2026 16:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLa3sYaarB4Frt/rMcwk61r9RbYN1mPkbkXxVxLE0DytiXYs/2sV44QCwHZ+sg0tW0xJjbyVs7440W+0HpLMrVseTMJ+tsz//cpsdEgSLX2Y3vf+YytkLIdfZDa2xyVFsbW2TLTA6Fwwj2qjE59fZtjFxF3rgMF5skpNp5m/T+j3uK5FT72rpAVYBHBJjyhkU+n0jJS3NaqFDkwYSJ2IyEkkuzlwz2PfDYxtlnEVbeFIkT7sDYjX0dzLXCDC7CBqWpLAx6eX3iaK7IN8tB5Pfjh7ws8rigquqT6a118/x6X6ia/2U+qh6hI6SdCMz8AD7M6GvI1IKWtsuXjZHIm8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kyuz2Ki/l5OY8WDIFWi2dVlQrOdtPFv4LWlt8kO5EXk=;
 b=xhjJQ5lwsgdCi/eDs/MxvCos7tA8TrJXSmoyM7P7/VXIVZViDiIr87fqIF7kT1WhharEh+prfAhr3woBO432TrkhqOjrTYscFNTmMi1OkjSwkxQiLcSuT7TKqe8EWQBt7VmuBxM/vYStv+TDwJp00vNlA+OPZcbcqV1Q4SrdBHGNf3RSqWdO+OyrNB5wWVpp1JEMT7TfqoMuIeha98OlKiGkgBPjFv0PdngkhSnxMvNaYlUkrbgECKibKq+TfXChjfFf4X4Zl9JWpcv1xdD6W9vcKq0u/H/4qaERr2b5b5r4g8SS4YIKmbYDRWA8XhdHqjtA4eyeB17f55PVVz0rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyuz2Ki/l5OY8WDIFWi2dVlQrOdtPFv4LWlt8kO5EXk=;
 b=pyD+zyK+gO9CfyRDbdiNZJNcb7GEB6Z5wRWuxokaiL7Z4YnLGI509N7SdQ7TQBhI1t0JbuzhORk104Kz3Gnuho2xFyPzv/SvEH0a1lyk9QrxwzsNPgn/IsGzoWFOLhWUj2VydwF9mKF1cpfqMkhJsGxrEP1DrLkd4YTa+6z50Qo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com (2603:10a6:208:df::33)
 by AS2PR08MB9737.eurprd08.prod.outlook.com (2603:10a6:20b:607::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:11:30 +0000
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3]) by AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3%6]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 16:11:30 +0000
Message-ID: <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
Date: Fri, 21 Aug 2026 17:11:28 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
To: Mark Brown <broonie@kernel.org>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
 <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To AM0PR08MB3410.eurprd08.prod.outlook.com
 (2603:10a6:208:df::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3410:EE_|AS2PR08MB9737:EE_|AM4PEPF00027A60:EE_|DU0PR08MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: a37709bb-a9b7-4067-0a75-08deff9ef03f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 1cKPjzR8tht9paQrLhSfG1Zn/5EYuUP4bxusZC0QZ2UQrYz5bIlTlFEhWVtbKEdVdF7xUlSjDohJsUWSPKVu5rleYCJo7DRaEBkujn3EwREiLuL+cOWTx9FVjF8iOc+ymQUw8PAcsAKcthGoNhtEKgrrF8yUz2bDdOfPS+teoM1YHQWwJWOrTUB1ITdWiQcM5F8u1ExUq7dRT7hofzuZoY+Ue8OFfuH2kvvKKg/jiFcPiVazEIR3c9PUKKsiYWuU//atqbsHRfRkQ2ZH8KxjRerHMtURhKV7SPleOj1efJB8N0+o/m15+Y3kCzdxoRweRql/x1zjXr6Ipfq2PN/vy+VjH1HipjI9ciW8jVNkfK821dbey7JngjpVtHRlqKQHtmm+Lo1B3/BWn3NMFvLXKu5beCBVo5rxVNOXT0rTZGHhdhEkvFGVpIJo/bjoVau3fQk+BPlnQt5sVJ5HhPsKYJxl9c6NxkioiyXrgC9c58hAWRsKYnY/veIEOyXKZZ9bvD0nuW3UDNLo8hYZq3kSssh+r+nQT1VN5T+72HfkYPZVqZvpyfPTrZoJ0DVHBBHRoPaGhkPhkJ7XpmGSAazUQElGXRumdpAMAgGB7wOsHM+/NVQ1Dt7KFOTwy61RMgd/lZgrTX0BQZ57DSDObnU3JmSm67TfiPBmT7drCEkRS6U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 SGAax5ePiKvsv8DaxQ4m9MkqSP4ngjZvPvrKpM6sT16At8dT7pgE7fPT7MkBbr6SmMPk61+AOvBs7TH8rr6Lx8V2JSIvKRfylRlJKeZpYYNFEiruiz42iZlD/bVHwvsEw7GUCd+htJao6AFwoN/op3GU6dvVEBwFyC1ayxJeqylAsA9AOhR2EE8tE5gCcUEcokFSG1J+8+A1MzKQ2lnW8l+SPBal5DBtUE8on0Vl4qVGW57keSsFBgmSfcl+wXN6EtVQmbKqzkZ1ZumHUlCKE5hyEhEBtFTdp9EDdeanit9nB3QJraCBpvore82U8ExEVgP439AzCrxFlGCwNWUTXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9737
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb14f666-3530-4393-abca-08deff9edc01
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|23010399003|376014|82310400026|14060799003|36860700016|1800799024|22082099003|18002099003|56012099006|4143699003|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EZZrrBxLWp4+SjOz5bElUtDW+QFFnFTR1/xBIraq9spoG6Doy/IuoRotdDFWbNpINB4Ng2IaOetFnLF0jt/LE7RuIPAhN+0Li33S8RQwzJ28/CSMjxxu84Ek/nzFnV1OeTzF1TTFM1BmHby5jCm+lkAnkdsFmNydNeQ0/y1OFwXD47Ug8jezSZgRfem3AO2BrmlhuTWDmiun3e8rIDd0Z4AFfs130fJNSz08yq6DMeDdayu6NZekAzfdBcTdRQi5m6fA4ocymX1U37ZHH1GZPxEeqkTpPhp2bVdWS/sLwXD/UAGG4GiFdjHtFJVmm4gA23xHaIKmCNTPEO2viLN//GUmI7V8B3RGl3br6WaI7Gn83Pdt+1dvSiGF3GiIWst3+9VILVqwZrf8xwy8qF5Z/zXI4MUWmqh9qD+fSF6Q+XRX2kOa3CgRJnMvfi/a1cqMK+NURuKtUrrEG99jOTkUOjJv1laI5nM10VIkpVEBTIcSSfpkWoRmUhWFIS6e4w2CGu0yMflTpJMyTUhtCb/aTG4eTuOh7H57yw+cVXP4ayppoAWEbe+cs9xO/Jwx/NVkCPIZQ6SNb5PdTX3c7sNHe1LOUuJyaf2sJPROgkMurzb+X63DZpng0LcWmTiBh82RwTC1eWDg8XcB6o3coHha/MRi7X/f3VQaUcDtn/vNLAs39CHvgMkEcsUoxogs0sUjfucTtKSDUM97hFP8ry8gBg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(376014)(82310400026)(14060799003)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FkS424mx6mcACVwG96eBFzwQzPqxLq7kOW1rz/ImvolPB8eWVpwjYFVk/Vqu34teeFS7xlBtkrw9G3IpOT7MT799EJEdlwi3CI+Z+a+f1Pv7VRM0HTFLXfPA/gBrw2HzYs2+v+I9o19BGVq/lT/MZJVrdjuZ1Apj258iwu5ArKwP00Hkt5PCbhyOsyLnR/HG8j/Tepft1X4DP1AYCDILEyCWFWIxiK65AnWCie5hS8g07sb9PZj+I0E2M6xcHL66Z7py5QQd6P/fltQTRK2pCHUo0rnUlGC9vF4C3NBuccNF0C9+utu87Gb/C30/mTtbIUAlb+S5BA2Q457mLF2HxFocj5209bAAg7H5BeYNyY4weym6Yl0s6kKa+ZDwq4WO3LhE7Su59DIRlmwbbSvq1BfVejruwhFx54reExIxRaMZRnL4dXLasEr9lleomu4K
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:12:03.2899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37709bb-a9b7-4067-0a75-08deff9ef03f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9680

On 21/08/2026 5:04 pm, Mark Brown wrote:
> On Fri, Aug 21, 2026 at 03:15:50PM +0100, Muhammad Usama Anjum wrote:
>> Most of the remaining MTE tests set a TAP plan and emit results without
>> first printing the TAP version header. Direct execution therefore starts
>> with a plan such as "1..20" instead of "TAP version 13".
>>
>> Print the header in every remaining MTE test that is missing it. Do so
>> before setup and prerequisite checks so early failures and whole-test
>> skips also retain the header.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>> Newly introduced. This is an output-format consistency change and does
>> not fix duplicated output or alter test execution behavior.
> 
> This should probably just be a single patch with patch 1.

My idea here is that the first patch would get backported as that's
true logs cleanup patch. (1024 lines of 1..1 are avoided with that).
This patch wouldn't get backported. Its just formatting fixing of the
output.

-- 
Thanks,
Usama
