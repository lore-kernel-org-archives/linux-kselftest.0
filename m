Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4EA33BBCB;
	Wed, 20 May 2026 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260097; cv=fail; b=cDLodrIVfi/1QQ7+9b/QjzY3XlL7pLYPLZFiaug2UMp6XDl9A0Kw0j1SmfoBjDwKN0kTlq49OiEcZf3dtOeUSpjjMoe7p5UmRYnB8QnNYtJ5XMdGbGOhQ5BQzZ3B1kCHg/Msijj9Ahpect9R5WiamgZnn+bz1QvBiCEPcHAzXX0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260097; c=relaxed/simple;
	bh=vDyTVNgQ6xDAK0s06gQFrol9le/1uKRiN8DXWhA3rvI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gn8TEqASrXY8W5XiR/QMizymmlxoWV2hL5qxiMfMifJdNQAUT8ItkowBqvtsx5Emv+CA5dD/DnLq0JIOXbRKtGW6Yy6rRzOHAOYhoAzrKs7hja74+yRgJLydhrn7Rkpsy/sfZ961AJP4Uri0HBzSlYF0f4YrgIfLL45RZQ0vHSs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J2QcjJcX; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J2QcjJcX; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J2QcjJcX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J2QcjJcX"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=GVPRNqhQbGNfdfP2j3XK4adMJxTibCp5uoBwOIuDw0qTI1NC7eQci1nywOtObmbRtjkyWW/PMCFH6q+tm89dbT1eqs3Jr/dKrP9aSMvJIcluJg9/nxGadoq7qwxN4i5z3cOdi+o3MX0IMPXdiJXMTRim8h5wgxQGCl8BLD2T2UpvftoxeLWg4CXRmMvSLcjzaa4ww41KbcOM3yecvOcYK0lzzZEJpFSDRjpcdRMedaGPcr8feK4CY9GGzCf6ZEuVaAccf4GNJ+yVwpo3PMhhoPnkSKdUA+Ny9MxOT2OnYVAA4YEN3h82FFRDfOFe4eg80pWOSVEhb6j3b9aJsLeACg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21hqulZT+NaiPP3G0TQaMR95+1QM7Pg6aERpW2ooT1A=;
 b=kGDQNvpCAyG0KD8kkdqGHrO8UAt2upIQZXxkFPNYsKUxDtKs6mKQ3It8ZxiPvw4zLCxwYPEaqhuEojAAGWLJ4l0o4MKewgA5nCOPJVJ6cV5en+nfCjUXtOPwbyFWAZ3cG1aQp/P2Ymze17QMxEen6ja2JNFSeFpRyfwJpXJ8ltAFyrMN0sxB35V5WSTOe1NeCuEGuHQeBcI07jFUdhmOatfvYByL7SCTFdCY6PzxkBGABi4AFw44TxHnxbdz7mYHZRag85DvckmHYeG96c5GWac2qXjhvhMVIDIuMvKddtOWkVNvFk69NUke2DG9Uup8Eibuc3tFav/cQY5M3p4gQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21hqulZT+NaiPP3G0TQaMR95+1QM7Pg6aERpW2ooT1A=;
 b=J2QcjJcXkjaASN2qnArs+NnYqreLn5KYhTFSBgyQ8sAG7U/5ik/lBkNTyNfFw6NVJN409Uyct880FKPCxzgaeWp/00xIZc4kstUM/fu7XLO7hLfijTyZr/ZC0CKb3vTWB/5TLn4lswhaY+oli//KNELtcORAvEQadfIIPJOHtoQ=
Received: from CWLP123CA0179.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::18)
 by DU0PR08MB7591.eurprd08.prod.outlook.com (2603:10a6:10:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 06:54:48 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::cc) by CWLP123CA0179.outlook.office365.com
 (2603:10a6:400:19b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 06:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 06:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLCTvpfOE+N/1o/1tLZS52a4hNI9cnYck1rGzQ8D+ZvFUHkOh2fHZ5PerkcvnYn+R14RXG6q4867SCUaCKPyaksQiHt7xZi3QGVQ6qlzY4nJFtIwn4qilx1exRnK4/ks7EKiqv8lAgt3PLH00srXzcUjiv19RzDzKZYmk9nXVcWOK/4gut53iCV2FI+V151o8d/oP3PLtRQgYaHR3HRPns28W5AzMXMkmPf7HVmwvBbb+JzybGMQO/F/gzSHUqAVWzhBkj6MexH4KB8xcoUkwKEedtcEH8S1Rxxp3wxQZhf4xUea7+8WrKDWutIvfqRkw24XhN6p4BSwVP2M9LArHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21hqulZT+NaiPP3G0TQaMR95+1QM7Pg6aERpW2ooT1A=;
 b=ZKbTk6hQ5q3Sw92MhfHZyYPUyuB7td6/KYPeLfJaSFYsxvmAv9higi17+VtkNR1wb2U+anOIsBWuCXEOc/9fBBdeegBoDWIABPn2we4/ZXUI6vVCf2tS2hc/lbgBfc0V3vUJXUmhbIqbNBIEHOFesItSa3L0JBOxTBvYNOm08WlV9aI19HDQ+u5wWkUisrHBRWX6shRR3ROR4YJbzoPMdaqHhp2CypyzpvnvCQg3M1O/GKMbXvPyEnX6MflnlVah4qpo2TazU9tQIKNX8dEYLjlO96F6QO2yJ+Q5OhjGwcYyX8H4loRauDfdfoexIR+6v9QEGw4CfbS35iJODY9jyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21hqulZT+NaiPP3G0TQaMR95+1QM7Pg6aERpW2ooT1A=;
 b=J2QcjJcXkjaASN2qnArs+NnYqreLn5KYhTFSBgyQ8sAG7U/5ik/lBkNTyNfFw6NVJN409Uyct880FKPCxzgaeWp/00xIZc4kstUM/fu7XLO7hLfijTyZr/ZC0CKb3vTWB/5TLn4lswhaY+oli//KNELtcORAvEQadfIIPJOHtoQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by VI0PR08MB10760.eurprd08.prod.outlook.com (2603:10a6:800:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 06:53:44 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 06:53:43 +0000
Message-ID: <03c9c5a1-f148-432f-82be-7e9c337fc50f@arm.com>
Date: Wed, 20 May 2026 12:23:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests/mm: separate GUP microbenchmarking from
 functional testing
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
 <20260519112049.a85f34eb5f2af83e11ffc777@linux-foundation.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260519112049.a85f34eb5f2af83e11ffc777@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|VI0PR08MB10760:EE_|AMS1EPF00000040:EE_|DU0PR08MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ed0bf5-d160-41b2-52d4-08deb63caed3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|3023799007|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 B3mzHtaOU3weSe5++erMRCOcApxTHanii/oiIf/3ieUbDQG3flUXXy2yq+oB9MXo0QsZqbTwx1hPo8ff8MAb6BB2YXRJAZOfdC960sRKZILO1ku0IQaUDsAqIcnxgqChqZmxBz5CsHi1Ta0n+vlqMowMODLwZdaRpsYgMS+aTR2RerIkRAOqy1bO8jX3V/W/+ZMXuCpHa7TdqV4QK2VUTPVdGmV4+kpVr9zRqrjsO9of7+Pa3RcSmR52PGVX8ftamWYdYYZfQqGeP3lYMa9qrUPnSqSaBVI4vFsV37sbAB1IoJVgNzhVnF5q/UWBvt9dtNCaYW7YJ7UOVjl1e5ObGOzmVrixlB9+HUg3ouyW7vrMpvHnAHiEKFMSNveNKq2DacgVfE7h3DeAuSNfp1VsdcH27RE50zE6+2VkBQ+/NM57Te7SxJyLh/gD0VYIbOB+WI3w+7M9rxoLHhboHjOO+aG8xBGK57al+Gs9Tg4VByIzXCz3awLOldu9aLpc0nhvPXlvsG6P1McXWVlB5eCmG66yE8YZWPfyp3i74yI+3reIAswDP4XTWAUsCuO9lO5p3jF+Y2v9OiiipemRdRztqn4L9hCmncyydDfSgAw9C/rISD5awXfiZJadAChtCI4l3uFtc6c02adjY18I6WYdsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(3023799007)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 EalEGWOSpLz7PcG3miLzEaFZVUDPNFQQaEQ+7ih3fl/MEwTucf/SeozaLcKyDpaC670z5xe/DaZmqLYjjrbAO+rRNHwG0VPcUQeUjZewnZVxjJNXzF+b0N6qouP0AWY0zYkUBEboN8y73zV2gdy+kqZNTCjvhGaBJAei8NNu0lRCWFHB25LLprm/ZBHC8zw3n0eVPX3uM+jMmnd0juDBx3LRSEDCkP2fruv27dW8PDHeYdcxBCUxXjeR9uK7a6mOJWZ5udNLfe3k5KyexZBrbzqHrq91qOvFlnlLgk15DkAIPj8kOtFJxm4YBULxnORPxta+e6YjZnPzIOUzBR4+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10760
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a39ca499-351e-4fff-8e9b-08deb63c87c9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|14060799003|36860700016|82310400026|35042699022|4143699003|11063799006|3023799007|5023799004|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lLWh1aHb7m05TfQlBLJa4Pu0r0drigikWl/l1uBl2TyfVPN3fLX7fi8ZjxPm8/rJ2Y3lJ9FvxQSQMMyhZ2imM5aatHXT13BmE7dqJd54Frv4D/jSWU9bXxH2gvG56EUz/WjLknoMaMXJVKhyE97IGwsNfBCiXQDOdLx+vylCzn44KC0Yx15Pq4W/ne7fK2+5RW+epU5EDIt6SM2V45VhFIiZJRIxLfpvOqLDepv8ZBZ/gYv4NgH2fmztO9dFc2cMWWJf4UQf+J+ouCuOwUW5TKyBuSFxCIlnmGxDpq9iZYlgIED8QheMG1jILcwFoicfG0poI6CQobfmzkvZDnMg7nc3CuI1E4I0kTqIVAHKeiZFlzRZW4DG1KoqMQFgcCUn6TvBGBEmziwuxaLdQkUCgvg5B6cIR9pmjgJoYMeR7kGlRHJzr4DmVrti49/rs8KtW290GjhDx9BVD0yE6tm8l/jp8f+wJKNGGd5k8lV6nVKXzJ1VIuDU9fMLrvPAmiw4njGCjOnJJfRCu00CXZZi7pmi8JAW4AafPY1kynA6TYtJKEYhJgKhLdC7DH7ga/GcbNYZx7NwzbKpIGF/t3434dvbYelbZRaJ+qf/2u0D5bY2Xj/8XXdhcpq2A77jxRL9tAORMV7W/YECHLnZUHIS+eg1T93EVoau3AyVdmwnICE=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(14060799003)(36860700016)(82310400026)(35042699022)(4143699003)(11063799006)(3023799007)(5023799004)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sh2612C0mGGJAAuUV10umz8jTeFu9EJM5uN4Nv4Qhm4L05BAgjvUcHEL5d7cg/gI+JXAYcUiSgrFNs2aglAB36ZuyoKiII9DRF3uakpBx9Mh5uFLVNXKh8f23SJDBrBP4TJjB3wXUyRu22B2aQgjBUsw0Vq6cqvyhUhJz/z3FjxHtKbh6Au/GdQXQ6QR3dUBGycXaJbLockqIpQAHYTPzVjpaZwMV8YJJybkKtOyYzpVvL20/StjJR7E4WdxZOkeJGOIpvW/TEuqZh/G2tVU8Ekedr9DsOJf4UdAAlLB0SzLohYMQ0XsTNcn6qEbd3w7j1hGCOxAv6SdybshAZ3Z8W4eYlRpWPhCJQpXf9v2Ht+Z1ugsRPltpr0seOxJr5HV45G0NXmJmDF65RInEhYjBHD3jF75kYMBnbA+RPJyKOFq0dOHh4lGT5iCIPkdjHGn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:54:47.9654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ed0bf5-d160-41b2-52d4-08deb63caed3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7591

Hi Andrew!

On 5/19/26 11:50 PM, Andrew Morton wrote:
> On Tue, 19 May 2026 17:35:04 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> 
>> gup_test.c currently serves two distinct purposes: microbenchmarking
>> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
>> functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
>> DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
>> tests cannot be run or reported individually, and run_vmtests.sh must
>> invoke the binary multiple times with different flag combinations to
>> cover all configurations. This patch series separates the two concerns:
>> tools/mm/gup_bench for benchmarking and tools/testing/selftests/mm/gup_test
>> for functional testing.
>>
>> Patch 1 adds tools/mm/gup_bench.c, a standalone microbenchmark for
>> GUP_FAST, PIN_FAST and PIN_LONGTERM via the CONFIG_GUP_TEST debugfs
>> interface. It runs the same matrix of configurations as the old
>> run_gup_matrix() shell function (all three commands, read/write,
>> private/shared, four page counts, THP on/off, hugetlb), but as a
>> standalone C program under tools/mm with no dependency on kselftest.
>>
>> Patch 2 rewrites gup_test.c as a kselftest harness-based selftest. It
>> covers all five GUP kernel functions (get_user_pages, get_user_pages_fast,
>> pin_user_pages, pin_user_pages_fast, pin_user_pages with FOLL_LONGTERM)
>> plus DUMP_USER_PAGES_TEST, across 12 mapping configurations (THP on,
>> THP off and hugetlb, each across private/shared and read/write variants)
>> and four batch sizes (1, 512, 123, all pages). Results are reported as
>> standard TAP output with no command-line arguments required.
> 
> Thanks.  AI review asked a few things which seem fairly minor to me,
> but probably legitimate:
> 	https://sashiko.dev/#/patchset/20260519120506.184512-1-sarthak.sharma@arm.com

Thanks for pointing it out. I'll address the review comments and send a v3.
