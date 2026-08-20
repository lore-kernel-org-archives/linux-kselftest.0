Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013066.outbound.protection.outlook.com [52.101.83.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675063101A5;
	Thu, 20 Aug 2026 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212874; cv=fail; b=SyH6JttHhFenQGpRz39HW3qmpPYL72XFzpZfHFahBCapkOPRCJYMj0AnDC1OX1YgtlBcWvt8jurAUxJS7XPQ8KX7aeGSB4UlAngUR5Y6FcqVc94djvi8P+g8HoVsZFJTyrctXoJyhmGbLHBzE/UIZjRCK8O27NltTo4vNQvS/8o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212874; c=relaxed/simple;
	bh=FTIVvKGt2ON/70bdJU/W8Tapdwz8U+BNpS2wlTDSbrg=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XZVPK8bifkKOC85QKLIhqQnXR+IHtMxrcox+7kMMyuf6nkwf6HrBLNPi+wHfD2s9b02C9QvkXg15WnfC/ALxW0ql+Khg4bw0pgbDy5fm4s2NDn4iyMyaFRzqUzSlklbnhAe5vZkTMYPe20HZpZMBXnuqDt3a96KSw/6dFtZJf+E=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ojxc+OF2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ojxc+OF2; arc=fail smtp.client-ip=52.101.83.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ojxc+OF2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ojxc+OF2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OgG8doSKkE64WBKFGkOQpKP5/TPawyGMXTWfGG12V/mHyVPXVskWsKu8iThekN7tbdJ7dV2iJyqcVGtbS+psCe6ul9zaeDxSFUoApM16Ph8RlKA6n91f4B9NQM133PWyXwwWRXoYVH82/0mod6G//v/lMne1mk0zlsW1IGEP8N4xgUW1+u8+wGaRbImXQBNaSYoc+PtB3d3uB1ngkXsvYnOr9EkfuOWYxpA589MgoQcUf2hs+MuEgiPb/aHA1s9g+rbWAHHTzNPXsWA9BIfCRLieUmaw6kfS4ZIgwWcnuX2Sxi9zbuIxSY2c0EaEsli8sAzc4UNqcEGh30rhIlvdOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki7Omu9X3X0UT3JAF/Wl8JtuisJO/fgUEm6RqGId8xY=;
 b=nAf06xnqLJSoos71gbstAfQ/VlIBAMgRGHqDFqNnJPgofNQI4aMLH1VqiD/cCYZC9rvhetuHzQOEJp5tIAbAAHF5b9phrX1+W1+KP7Z+9gP5PQxcE4pxXlWHuIXAD+M2yhzoyuloPur9VcxPTjMPxN0xoeeDaBjyJyAqiizze+rQKNmXxXoqDcOe3FG4gwEqx3am0KtVfeac2udh+UmfEKpjXX+oOCwqtFb0hfYwKhZYwRbEo/8VoRtb9Y65qZrsdDTdqH6iOADgyVgwK8PgFtcaRAsPfD1f583+0koLci7cocpvHHAZTsdZal2fM5JGA/jlIvyb2SlXkfkkAPrbpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kylinos.cn smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki7Omu9X3X0UT3JAF/Wl8JtuisJO/fgUEm6RqGId8xY=;
 b=ojxc+OF2twDQcpB4qK2nnvh8WPkaj8lwdmx2+ReavAt3F4TlPidJeHpHCWqkQ92qCvX9lYc2T1pUE9tjq6vnS/aB8TMwv9Lf1wXQkQbUw0FqWRmOaxmJxJUaJpWHEQZnFf0kSijiyX3RPc+ANod/S4zVOQXeBPfEmZpyTVcdLF8=
Received: from AM9P250CA0015.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::20)
 by DB9PR08MB8697.eurprd08.prod.outlook.com (2603:10a6:10:3d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:01:05 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:20b:21c:cafe::c) by AM9P250CA0015.outlook.office365.com
 (2603:10a6:20b:21c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 08:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 20 Aug 2026 08:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF/mPu3QvBbAyJMmyWc/feq3hHtYtzLNUX6ux9J59NPM6jOxNNTtdlEcShugjLtjCd0gGOngKJNPNQCW1fRtFDcJ8f+A4XyQw+OLI9CKTwpcIxWSQRDc/MbXGBvLKcxScLCJjO0rwW5BgWXqziIqiYuACjVGjhxmGNVNbBz2Z/OBltLTGP8/UiuQFxPFXZoby33530mhj74gQydoki77wM0tc8N2g6UQoy/kwpvfoHKkKd+gI3+YGorLTJIERASTbnBI0QInXbSKKxutAoSrp42ZbioSJgckAhBsAVfRNrFWD5lA2E5AjsHVLA9v1miOkX5KyyXGfIJr0XBmLgWG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki7Omu9X3X0UT3JAF/Wl8JtuisJO/fgUEm6RqGId8xY=;
 b=tKTVnNSpTQvFSkcOxWpufJ5e+VZVquN7ebzd2yHDW4R8a2ougKwOmiDHPnVTCDRWKK26XVcgrQ5ZMgAkbBoixfvok3qjKMyo/ChRlCjib/oWMsY6nevbQhbdqGN1eIS5S+LwPmFCC2UGLBwfv49cSAa8cip+hTfw/6Vz1NAJ2tGuuOUATiWrixZAukpNIRAMinavmZn/aDKyXoMky8f8eNY3VvbzhlPTIIAhyY5dwDrGkcHGEBqyMk9pp7IZreCORempJJUyuvtzyMInPREzTxS+3lq/REM8gELVmGJABjVrQVtIDfw//GMATfCjYJdkHcjmWVvYyH6xkvAQn4UZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki7Omu9X3X0UT3JAF/Wl8JtuisJO/fgUEm6RqGId8xY=;
 b=ojxc+OF2twDQcpB4qK2nnvh8WPkaj8lwdmx2+ReavAt3F4TlPidJeHpHCWqkQ92qCvX9lYc2T1pUE9tjq6vnS/aB8TMwv9Lf1wXQkQbUw0FqWRmOaxmJxJUaJpWHEQZnFf0kSijiyX3RPc+ANod/S4zVOQXeBPfEmZpyTVcdLF8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by DU0PR08MB9324.eurprd08.prod.outlook.com (2603:10a6:10:41f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:00:29 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0315.016; Thu, 20 Aug 2026
 08:00:28 +0000
Message-ID: <5bd21a82-3ee3-44a1-a94c-f567ff36a2e5@arm.com>
Date: Thu, 20 Aug 2026 09:00:27 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, shuah@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, peterx@redhat.com, sarthak.sharma@arm.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
To: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260820061426.356869-1-husong@kylinos.cn>
 <20260820061426.356869-3-husong@kylinos.cn>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260820061426.356869-3-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|DU0PR08MB9324:EE_|DU6PEPF0000B620:EE_|DB9PR08MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e4342d-1b42-4129-b898-08defe912e94
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|56012099006|6133799003|4143699003|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 FN5nUmjJIgLjgYSGGB3ovv2Cel532sl+BPhOxwpbxQu+bLDxfrGHNTFJoK2hK7/G4VP529z3OoyvZqhMV89EwgjL0KTa6eYSjeg8uLV2FCiDFhPllHdj7dZLh9qdnDu62dtbv7RItVHa07MmQBdo6uekZbjoITctvA8XQ0F9GLEoEN5j6zxqP7xZ0W+vJ8W+PfKiR0b5Sw6967DuuRUpMp87IZ4IYtPHX/U8h4bpoqArqG/S0OUAwLu0VDE1uaUAPrkjiMYF777G/SY9+6ZDYzW5VqLZqI3YVKPHkIik1XvjtKV7H94ojrQ28XUskqr1PhGG4w8VAPgNRrh5NNVJ1b/u6IBmwIOHsHjGUprwdE3LClu7muYMWc5tKuuYJ/sMa9QtS567MpQPoAENorCubLkmL+YDVWUITEzkUIF0LgwHKQynLqZ50zNQUm8ae0//7Wwj2uAh9UN9UW6FqmbaYj2eU+LPvefidyvAxDKy4E0DIUUOjYPlCo6qfZZXYuK3wVYD74vR/pS12M603frB8NfurMbKWvNYkORlPHYvW2FzwHKRAf+6TJG8gb8IrOHjFUMt5js9uXp9k9Rpgj3xH5Q/ucDO0ogoYoB4l/sQlZAmvN7hiEYMEhRjU/4jgRDWj7dxeiPfqGCUbgEa2C+nZ/SWtusmDcg4HR9nxFwuTJg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 DIE6ZL8Hz9rmYOqG/6Q77Md7qzqi4Oy1TDwYxFWoukwZSkStx+x+kzeplzh8KT7lzV+7l/8lCKXSCB6Yhq5A6oOKm8dnloK7+CR/lLUVq7ZoPfxwVX8QDyEA9lnJGZf8K5B/15nGjiqV3hN2rX3mdBNFaZVb95lMyn38srCRbmPE1cf8fc4bdAGZ8eepsaagT+1+BnkBp7XLy8QWRYWjblgZYcY8dWRW/5kqliPHDDrnpiEXAkGbu/kWmxoxcJHA0bcrTAtYDT7cbbIcheSCDuyggQv92VeUj4tK6UIb+llZIAJr9MlhbjmiDSnwTaV8Vo2MTUNZkgn8UCWLI+wABQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9324
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44e7fa73-06f5-49ab-0fc6-08defe911989
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|14060799003|35042699022|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KJfzLvX/oglYHFCUUspPeyH6spFSNdoFmtlEIwTRP0eFKTHP7XSI1kExuEOlpv2R12NIGjxn43Lle02rqWWoU2HMHipzxhFVP6pkW3AklAm+RMzE5npFoLnsWh+rdHRRJ7ajX0VfYr8JhZy+fJmfilEfYsjy/Y49aWPbWYDFog7W6gXCJDVDS834VbIkXqPaol8VZ57zDW20KyCg3ojSdl4zmvkc3t8hthwIqO6DtU+296PdCcGqYfH2b1ehoujNQcE18wO/yU9Bv9w0Td1UZaBiGC3i2RfP9si/oxQDP8gZNiD+xFIKhevjvpyrz6tgZO7V5og9TTHSKz59f83X9CcCdYiaMZtPK2UaFkHSQ8LjnHN7Svb0hnjrSkBV80LsITNOf8DF+Mplqg4BRFBAQJE2jev13rPGxCNQbrR0aLyNZQcZekt4sudfQLfFdjLlv0xBmkJ+GAyJ1S9N8hzuewrpWaVKorfsh0auIGdMc8Xs9OiKuZRyHtzkwVIOnkFaEZWJgyI4a+XseBdZK7uPLdlwYxlKZqQYdsgUwAfYpRDVM3dsCsOZu0f/UjWGdMAi5TZ06yOiGoVzhMO24b3cl9OEBlVlKXROPJtZ4IZb373C8sNujBEVph13tTVJs7wMyxZV0JQwYh+r6vrJG5XKa8ShamWvPRpXcJ7NJrh5rjKRNi0QRFTohsw3LWGOlkF3O0mjQk2NAODNYqg/y82w0A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(14060799003)(35042699022)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YJg5FhQz4RcerJT6Gk1JY34JbClH9UtGStrfBBBcMj4UQE6V3vaLMT5MAu9J8J01cpXKMOPzagEKT4Uumksc6M0yas9nu93Jz/XGlLCfWWA2nL20zNuZHBO+DZukwAFNNkk9NizbXRIMN4LKGc/5QOTuareja6S/Mzfa0MPLrIvy3HxsxGkUMs2KTWaUaTYTsi0wd+WeYYvwe11zDWdxnH1ZXa4Z6MdrX5UdnCf28ZYNgAuuzDBagX4XgFy6PJ3yg90TsL1tvjoBKz/drXPr2Jd/wn/upDZvQh+f8yZMkCV97+QdSUkJiMYyKd4GAUNdniwzPMOWx0w1Mrdn/VJxZSELAdRXvIkKplW5aLGp3gvIIuUXCh3LoWWr01NYeIvTHKlQ0bcrSfTIWYDjAX1hbk14+MooCKCTY7d2WTLIz89ogfZ38dUm1Uz7mepcDlUt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:01:03.7264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e4342d-1b42-4129-b898-08defe912e94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8697

Hi Song,

Thank you for working on it.

On 20/08/2026 7:14 am, Song Hu wrote:
> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
> TAP line, so its output is not valid KTAP.  Add the header and switch
> the skip to ksft_exit_skip().
> 
> Also fix two more KTAP compliance issues spotted in review:
> 
> - get_mmap_min_addr() calls strerror(errno) after fclose(), which may
>   clobber errno; save errno before fclose() instead.
> 
> - Some ksft_*() messages embed "\n\t", so the text after each embedded
>   newline is printed without the "# " prefix.  Split those into separate
>   messages.
> 
> And cache mmap_min_addr in main() before ksft_set_plan(), so that the
> skip paths in get_mmap_min_addr() are taken before the plan is set; a
> skip after the plan leaves the run with fewer tests than planned.
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  tools/testing/selftests/mm/mremap_test.c | 43 ++++++++++++++----------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
> index 131d9d6db867..ab5420f2e875 100644
> --- a/tools/testing/selftests/mm/mremap_test.c
> +++ b/tools/testing/selftests/mm/mremap_test.c
> @@ -111,18 +111,17 @@ static unsigned long long get_mmap_min_addr(void)
>  		return addr;

	static unsigned long long addr;

	if (addr)
		return addr;
I was looking at this function. Why would you define static variable when global
variable can work. It is pre-existing problem.

>  
>  	fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
> -	if (fp == NULL) {
> -		ksft_print_msg("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
> -			strerror(errno));
> -		exit(KSFT_SKIP);
> -	}
> +	if (!fp)
> +		ksft_exit_skip("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
> +			       strerror(errno));
>  
>  	n_matched = fscanf(fp, "%llu", &addr);
>  	if (n_matched != 1) {
> -		ksft_print_msg("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
> -			strerror(errno));
> +		int err = errno;
> +
>  		fclose(fp);
> -		exit(KSFT_SKIP);
> +		ksft_exit_skip("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
> +			       strerror(err));
>  	}
I like this patch now execution wise. As an improvement after this patch
addr can be moved as global variable mmap_min_addr and thus get_mmap_min_addr()
would be called only once.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

>  
>  	fclose(fp);
> @@ -1164,10 +1163,11 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>  					    rand_addr);
>  
>  	if (remap_time < 0) {
> -		if (test_case.expect_failure)
> -			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
> -					      test_case.name);
> -		else {
> +		if (test_case.expect_failure) {
> +			ksft_print_msg("%s: expected mremap failure\n",
> +				       test_case.name);
> +			ksft_test_result_xfail("%s\n", test_case.name);
> +		} else {
>  			ksft_test_result_fail("%s\n", test_case.name);
>  			*failures += 1;
>  		}
> @@ -1177,11 +1177,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>  		 * was faulted in.
>  		 */
>  		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
> -		    test_case.config.region_size <= threshold_mb * _1MB)
> -			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
> -					      test_case.name, remap_time);
> -		else
> +		    test_case.config.region_size <= threshold_mb * _1MB) {
> +			ksft_print_msg("%s: mremap time: %12lldns\n",
> +				       test_case.name, remap_time);
>  			ksft_test_result_pass("%s\n", test_case.name);
> +		} else {
> +			ksft_test_result_pass("%s\n", test_case.name);
> +		}
>  	}
>  }
>  
> @@ -1250,13 +1252,18 @@ int main(int argc, char **argv)
>  	time_t t;
>  	FILE *maps_fp;
>  
> +	ksft_print_header();
> +
> +	get_mmap_min_addr();
> +
>  	pattern_seed = (unsigned int) time(&t);
>  
>  	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
>  		exit(EXIT_FAILURE);
>  
> -	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
> -		       threshold_mb, pattern_seed);
> +	ksft_print_msg("Test configs:\n");
> +	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
> +	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
>  
>  	/*
>  	 * set preallocated random array according to test configs; see the

-- 
Thanks,
Usama

