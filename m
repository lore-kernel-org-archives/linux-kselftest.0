Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCB39FCB1;
	Fri, 31 Jul 2026 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489366; cv=fail; b=mNNgNQjboRmnpHKtCDekJ4Vqi8+V2PqRPAzjqTUXP+wNAG57sT26BHIGElHVij0DH0iKU+HAsmPcOHz80PhbAluFsf6QHwrS2b9rvtZmMInEBbORT0ygI/hfrX0w9MwFWbGjdTxBdBOPjES/D7xrqAMsvbrHZLvvNAAcEhljoco=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489366; c=relaxed/simple;
	bh=TpN+Dlrn7VBOyCzHHOkevsg7F03rQRyXlAH5C0ei0u8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JijTig3mjEpfKQwEuHqmss5lojzC4/cGIK8XkdigCyEG3G0pTpDgpTA2SDiQk1WF/n7o8ep2KJhQO27NFq2nKW/NXQhwkHIeksQVh2rAxyPnreMv7M5icpscACUuUjp3nbXoa4YsoJXjvDzeiYb3RPjznUjAQeY0rPpYKr9rqP8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IK21Ri8c; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IK21Ri8c; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IK21Ri8c";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IK21Ri8c"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nRUGP4q2Xn3Gd5NZX34ZY3oeE9y9mbkl1WSB+uU81JobThtAYdLj3o4tLWQ/hrbshx5fWMNXgJCmJaDYmHuFr2fm9gpjHtQMRu7hgvjeAyBoPsuBfTmmOrKUrbq9D+ueRjl3qxZ9iq6NhEcW1nevz9vJ53UfnxztPb7kaFSWVAwupSklN110Ff4F3vj+I3TY/VYH6U/y7dPIMcywiWPJZp7sScrwDy10mm4z83y4VDFD8PQO5UjUj948Ki60jnDGlNJAUnPZPCe7XtbZhyL3bzpDMQ7IHMlONnBC2naBzt/4zo4u1emZit1L0ZXY4QadvdR+bggRtgSetUcG0/qxMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KEJI7Ht+ebGZL8Kocze9Qt2WeLgol6SxUeNevBMV68=;
 b=C03WZIbkEScVP1TUg0qH/k5ZQdzyiltn/KVEiWyJUOdSAk8Gl4yDN7SicnmER6Qjpl6O8VuYe9RlYC2e0h9nCiwt3bshnjEFELfGrS8s/xOH9UDGoSJYorWmLOJ9X77wfYJW/8Zsyn7UzBuI9a5N3/Zc12WhpQN5ivltPqxBW/V53/s19o+kpUu7zr++vdhqhRT7+UAuul+YokXlqmtVQLPvd9SeOP3iR7Tn9JmQ6du2kV1HmfLxQkB72wVEXsVLbHbGy+9SiCV2WYjbG+L2/PHNVLJN3E2WE8o96qcizR1gGY4ea39Z152Y3m5/ii2+UgzsYVlFHosjWTz6JmUNCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KEJI7Ht+ebGZL8Kocze9Qt2WeLgol6SxUeNevBMV68=;
 b=IK21Ri8cde0nEAPuOSFIlHiO3RN1PkCQJkt3yVRbBBR/zFVpiZISm3B7bbq8s/Hlon997OVyrrsk3PolhpOT41t7BqCrsPoTgGHQ4KEH3Gmozp0ChDo8e9T8TBW/DnOCKSvqroH3YytQWPwvPrGoq99BHl6pa8JcaRMBYIRl68Y=
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by PAWPR08MB11389.eurprd08.prod.outlook.com (2603:10a6:102:50f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:16:00 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::4f) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 09:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 09:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpJRbCjmkz13NqYqq4aZcF1OsrNhmNL5WLXjObmU8JPdAo0WktM5gi1fxmT7T06w8hXUcNQFFPqWeIp/qQrmF9T8MtuTJS7/sNYxitXiZqvJCRu8+Zou5qpSRLtf3FlD83tYRpgRQI751ce2l5Yc23llp0T4x6pqeMtOyRkwbo6PWfkzB4IKnzsHas6tgeEIhWmNrMlv0BmWv4FRyMB0u63JMLnYxsdisqB8+I73oR1CTR0YmtUdhGyALpnj074+OCo+c5kzS9qDcbzAQIx5V6IWRqGtOLnIvkrLgmGeXde8dTsUHZ5/vj3p6/7vUxJTmbevTuP6bN2aZfdcDxKu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KEJI7Ht+ebGZL8Kocze9Qt2WeLgol6SxUeNevBMV68=;
 b=pAhEPrBoNOgQhZQQuZEr5bXsRCM39Lq+xoXWdDkJ5/2C9Uhh+oTIx633aljZ4/0K6RqBT3IKZRZFPQLBlGEqsRMy5hhDAdTynl1kABeW6fGfeuw83wxl0V9UPuAd4X296lfkbFMxMX0Ero+rMInVNOgtqjbFg/WwsC0p/nLA228UUDDMcEt8LsQHP42uU7WGlxZf1XzZQSPv0r5Uhw6ecOWWiQHqrEDLU/j/YkiR8ulc/dLwlp8xt2H+mTkweMrfhuznwBVbkW9TsTdoXhoy4LQBq/55vBRaPU+HOByzobB1Qz1OK59GHbllDFL2oUFKEndjys5kIpO1mn5tVCM6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KEJI7Ht+ebGZL8Kocze9Qt2WeLgol6SxUeNevBMV68=;
 b=IK21Ri8cde0nEAPuOSFIlHiO3RN1PkCQJkt3yVRbBBR/zFVpiZISm3B7bbq8s/Hlon997OVyrrsk3PolhpOT41t7BqCrsPoTgGHQ4KEH3Gmozp0ChDo8e9T8TBW/DnOCKSvqroH3YytQWPwvPrGoq99BHl6pa8JcaRMBYIRl68Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by GV2PR08MB8725.eurprd08.prod.outlook.com (2603:10a6:150:b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:14:53 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:14:53 +0000
Message-ID: <8356ad87-9c1e-4068-b5ee-86e8bb669c3b@arm.com>
Date: Fri, 31 Jul 2026 14:44:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] selftests/mm: use pattern matching in .gitignore
To: SeongJae Park <sj@kernel.org>, pratmal@google.com
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosry@kernel.org,
 david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512010148.1175-1-sj@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260512010148.1175-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|GV2PR08MB8725:EE_|DB1PEPF000509E4:EE_|PAWPR08MB11389:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c3e18d-f26f-406f-903f-08deeee45607
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 Qjm1opkVGhj8uItyylJ6yiup5R7uWZS99qgiRsq8MVDMBM/8kHImwxMyj5Kq29Uy/dmDe+6p5hSm+m0VCr0irVsyQ0ew5YDlT4Ff5397GXTbTOvAljhhTH0L68SzoCB0cUJJ+KJpINZ1xpQhioDqoEHN/VsPrb8O/dvEz8NlbKA9803FlfcbwWrMFVEcosUxnzo2bWE/cLZuDxBGI0Xm8YcO9wvkfPfafnAYpQ14+SSLJwW5jbTI8ZS6wDOM6j7mD+a/jXPikT1dIlQNy3IXATrkrbIaTihX6oUdwC9p/ffuWYVa2nmWC2GAyaTtnZ3udx+ZW7Cf5+zRxLl3AWfD4eKJKEq2H5+gSjYWttJ4KeSALDzy+NAc2VCiY6sbLt32v2DlmWAj2ce7qosHVUf9AdBTOp8LjX0ZSyOmlKKeQKphM2qIdVSVYzgY7ZhKPG2WOJxFhD/SIaw6T/lT43cyI3p4Nbi/+d6AOhb5YFSisPlWiDDiNlb1bzvnZtTSav3HOMCwatAOumnTSJBCUQHQzuBMSwJQ2eM3TRrG2x4I4Q2Q/E3zY+lDAtxUjs9CrTY8cwYyDxsYXnExL3S80vGof+fphHox43r898SgWq3rMOo3bqKO+YJ40IPwo8wldKkcOhA9LIwMjLiiKaKr1m2Hdu2p4JKRhLB1/fonJxRisDc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 AlLVQUA/A7/E2ic+oasv2avRaS+gTyN0P7oho/MpOEr2NSOwB+j6veOU/MHZqi6J7MNhqMNQKbP/YnDjjdGZX6oxUGRHkelw0l7Efl8CMCr+Wpdj9EdAl7z4YxEzzhQSpxuAJuqz0+0q5i07gOsTyZ3uW0VrBfVgD5ERFoPi8vYks6ny8WS0mwrRyCBa2AMT3raJR7YOBYVQ8MAtDsMu/fgH2SLkQJC8ib+RsZA3pkcbplbNmrW4qS6v9BMdKK+v1kOd5w3YY6J63aTCcyHrxc3ThC4E17bbGJgr3JsqCPnye+X1zATVlZ4J838uBNQbpvSfSu8XjQO3ymMeRrilmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8725
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0aa2f669-3baf-4517-7b68-08deeee42e78
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|35042699022|1800799024|14060799003|13003099007|11063799006|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bLA6+a+UxZqm6VH917n2f+0xpxUzMpJLZLx1FiC+Tuw4w0odrN1Xy/fgpEO0Sb8Xd56Wg9TBZk9POsXdVDBY9vLWC/9DTfqsMOGNSEQgsZlx0mozZ3BfmJDkjEHBKHBfp+MA2gzUmjeWbmDcqVYvebd3g0P/dh9vROJajuXpi40SBY1HKkW0ZVcy+VP+4gVr/XQruGRCmWm9sXyB6abGpiIqGFACZOYNdqyoSsiSojqCKFjQP3MPFPBgKpJbuW3XSZKOqey+iJD2zDxN6l3J7OlQGvVt4j0yVk0vshHOs4HJTJXgz+qpIyMygXnBMUTJXpfFVT0fyItPsD4+SxPhE/6dMuDv1gsb3X/c6zj1AGKD++LFSWXgtgPM9kmRS/t8EmDJbePjjGMDtiIw87BAx7Z3rQWcmdv2NaMRcP07UkQ1lW1GYjDQzVtlAldkV9n4Oed3INvtsfX769k6LigheCZUXj6g8E5cV8aB6Jwmpx684OoblDvtQL2+HuUbc/PBDrJvisKTKYjiGEM8hWLfYEAzVLDhWxrRs11rWkj923Tzij7htjjKOsuvSpS8nDwm+gZu/rf+C4HDujrELc4sdIcTLNpabaoaDq52z8b3vWbSDNeT0YI8QqKtv0SZrcLSoAK6xP1Iiig2w00qenKAkktO0ajpgcBD7eahcpwkRmPi8gdYouo4Ay0m/e1uOx/dNL64/xDvYdhBGyIYwLVp3g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(35042699022)(1800799024)(14060799003)(13003099007)(11063799006)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zmCyKFW8poL60X+/INKgiijjOmdLSAN+6QlobMeQEqh5usdfKAB7roPaIqVvCxl+WsGhM7A1GWK2HWZ3M5kdVJ6C0CZWf6zQnFdcoLsdxWk1EMa+m/Ny3d0RWd4fFaJV9zl1J33N+o5ZX7MXTb/Ml9W7/199QjZwrGGCf1AWU/66wYCXvDY12sGmExAy70A7pL3d30JHbWeD8OpP1hbepCEPbVk4dDMp/6RkjN+1TdvazDBKgi4EiFSgaxwb3RPdFP9zWwwqZw00b3L6PXjLIjRgV/DsA7x6I7dUDyUj3czju5O3V0RPK61LBzfXLp8LcyUW4vqxMfKmq02rdmhsFUydCFjD54UVk8kjaVAOaQ5Ran/X/L8/Aqh8f1+jRN0PuOhwvgBMXK/9+F7iqPEt84udxrUSikRrCQ+kIpKTkQLECdlodQHTrvUjSHsiHjUJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 09:15:59.5491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c3e18d-f26f-406f-903f-08deeee45607
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11389

Hi Pratyush and SeongJae!

On 5/12/26 6:31 AM, SeongJae Park wrote:
> On Mon, 11 May 2026 17:34:09 +0000 pratmal@google.com wrote:
> 
>> From: Pratyush Mallick <pratmal@google.com>
>>
>> The current selftests/mm/.gitignore hardcodes each generated test binary
>> by name, which requires manual updates every time a new test is added.
>>
>> This series switches to a pattern-matching approach (similar to KVM
>> selftests), ignoring everything by default and allowing specific source
>> extensions. To accommodate this without tracking generated headers,
>> local_config.h is renamed to local_config.h_gen.
>>
>> Changelog since v2:
>> - Split the changes into two separate patches (header rename and
>>   .gitignore update)
>> - Added Suggested-by for David Hildenbrand for the header rename approach.
>> - Dropped David's and Yosry's Reviewed-by tags.
>> - Kept Lorenzo Stoakes's Reviewed-by and added Mike Rapoport's Acked-by.
>>
>> Changelog since v1 (RFC):
>> - Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
>> - Updated Makefile, check_config.sh, and affected .c files for the rename.
>> - Removed *.mod.c as it was unnecessary.
> 
> Adding previous revision links together [1] would be helpful for people who
> willing to see details of previous discussions.
> 
>>
>> Pratyush Mallick (2):
>>   selftests/mm: use pattern matching in .gitignore
>>   selftests/mm: rename local_config.h to local_config.h_gen
> 
> So, after applying the first patch, we may show local_config.h unexpectedly
> shown on 'git status' output?  Maybe too trivial thing, but I'm wondering if we
> already considered doing the renaming first.

Just a gentle ping on this patchset, since it has been some time since
the last discussion :).

Would it make sense to reorder the patches as SeongJae suggested and
respin? Pratyush, if you don't have time to send a v4, I would be happy
to prepare and send it. Please let me know if you'd like me to.

> 
> [1] https://docs.kernel.org/process/submitting-patches.html#commentary
> 
> 
> Thanks,
> SJ
> 
> [...]
> 

Thanks,
Sarthak

