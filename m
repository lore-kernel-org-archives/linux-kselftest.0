Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D37404E;
	Tue, 28 Apr 2026 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407458; cv=fail; b=ewnjMS9oMAc3M4jfy7bHazWUsVZEOY7eg8BT8Tec8O47+CvkVisonr3cCfQ+RQJ1cM8bS3OJbdFlPJXFACayeRMYIaUCND+KZ9amvcOCbbVgkhJLc4ibtYEuIxurgEXH+Tqew5TrfUVMYJ300WY0Bgy5CkBJdgLkO4yfkmxKBkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407458; c=relaxed/simple;
	bh=ij/sHGKFfPciYqdMlTUnvE0x/XQIWdvuSzFDnXK8xik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qIqe8lv5t69qfnoXs2cmO00RKZvaKBf3H0jGDw7qvjtmHujqtul5nU34rq9I4XAr2hs4+o+Joi4wbhvlWBhST9/jBkLTMg7qfWJqBeeh8ZGTsVhpF4T6+8Ec50efcML6bL+EAUdu+0nbDf2B5E5YdSp23/9Y/1A+CQSPH6vvyfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WqIVrAKw; arc=fail smtp.client-ip=52.101.43.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WqIVrAKw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW/9P+h+lWOjykKdVbM+oXU3iKxBS+8gYmmgxvR9ZtJcRzmqWfz9A8oaT701eEMcuQuhmcs5B2ft15utIzALMEUHEqcyTUAXekRxU2cyBm6BkT2rh9yCMJ33zxGHTmSyvEyAcoUYaMaRRa93Pb8DG0DM81mg9TKbIQt+QNvdakUxRt+cmBHZGPTn3sVkESKZuGr14eh+9PmQTcuA0ajUn+0an7MHihOUF/aYEfQb8+MKfNrQ34wKjs59h1C29LzgYaOE2+fFe4px6XMt78iKz4yJD/Wb0k8tawZvDdDda9Vguv9yEvDWu0NXER9Lf5iVRBaivuOublTIG+Klj0o10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKfvZWK1XQwgYWk5lLH/ADH7bVLKioZdPJgtWT+JOro=;
 b=FN+prA+g4E1O2GLmoADhIQMbgvU4NnJn7MkLaLcSL48ABIZXQHUAVZLIjxkPyocOqGI/jmv6MArjxPu+yeiZGlu3z2bnEvofPH2aV2EhijU9xCh/SnYmauNSwfzes24vCRTdS2Tda60CNcwS5uBawGfcXfyfwh6CIvh24NN70u8J1/l2KsZmDdrTAdFjQUPt8Yf690nJdKonvhW6uXYSorwoD3xeBQRU+/IW3N86SjfoMIVWFIWG/9IGoMTbQcKOGH8n/OU4rJMAZFC7Qb93s0dW+UbfSLWkI8dq6VDgkLb5SSPoi99oe11ZKRZETuO62xPniVOTf3vPh3lzjCyQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKfvZWK1XQwgYWk5lLH/ADH7bVLKioZdPJgtWT+JOro=;
 b=WqIVrAKw5xZ6atV2BQmxf6OmQd3DDbDApp0paE0q792u1mNfYJMLUdDwvoMHJDQ6e2HdebTYBhfS3B/3ChRYFEK8t9rfZK6AYRkQsvcsOomSXaZnVzWhP48GN7N947Y/wKbhs2S91oF21D7HcNHgVUzjve3Xnw9nZrwyJl9+i59vh7nY3FuKGIYAk52FawzSf2GHuDpO7B1Mrg8NJcZAF+uEVQjTLeIdjhZHz9eF//C8anr2vvfktV3YEAKy6cbiIIOnpOIJ3fmo3PKriviPM0r+/Pdv91eecf+ds8SCXLJaPuePBdp8z6UKVWMCJQGNJst+xHsTNrv+7rDh47Msqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.16; Tue, 28 Apr 2026 20:17:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 20:17:29 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Vineet Agarwal <agarwal.vineet2006@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] selftests/mm: khugepaged: initialize file contents via
 mmap
Date: Tue, 28 Apr 2026 16:17:26 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <0FA813EA-5EFA-482F-B8BF-FE65D4169C44@nvidia.com>
In-Reply-To: <95714cec-205e-4b56-b8ff-9afaf9408020@kernel.org>
References: <20260428133138.88802-1-agarwal.vineet2006@gmail.com>
 <583F8EE1-5C49-4250-A24B-0D73372E3864@nvidia.com>
 <95714cec-205e-4b56-b8ff-9afaf9408020@kernel.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:208:234::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8d47d4-100e-46c8-eb80-08dea5632c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RDY5RJbYGBWDHD21qYSvRDdE0ziMStul4KP2YGvHYlDRMX57/jf2AzP4k86Ogw6ST3jTRXXdkLDq/IfRkwi50zQsodNt6qiWXGTbVpBPr6E9UYhE1IW/hmHCrasFvyMqWfKYoVhNmJJA3RHiQB/T3QQf4X98VM2PvDNB7rAUd/nCfdStDQJGb4nL4CDhs5Q7i/bJ50et2H1+Ulv2ELWj09lDKosfwATdz17xbzAgxIPEiOoPEFid04bNkozr2Me2xeDiNJJbnQoWD+6KhNhpQvM+gJqDl52aIPR1Xqg4CLAXkoW1Iz7zaIseTQcMTWwAOR8LDUrsfEzoeGEo5R8ZAt+2YdE8UBEu+dqysn9g+ejzf4c0aX0yyHEJKmtepmZ+qMp5fj1ZFIhHlI91FdeZe2EJcb0N1Nzvp6vQ8vBUFDbjLxTlRyTa9JE/WE/+KbKr9sHWjYnMpw5iAja7A3GLXMWQSqJuQpgXukUeG5Vtcuc02GLspks8IaqGOJ/Rax8Ykl5OWq+PVe718241uhANmku/0/60o9lCPf/bBOKgtS5fnr/uiw4VgJxZ+YH1xgzHDBipnYBh2qa8lgVHKySM2C6uLu/a+nd53a9rOpvNABFKUTeLnFgrX8p2E8LYbuBsda997MXjnaVOkBlv6eSLZzwUIN0IXNt3yEjnDrEB0cPNGCahXsOvXnlqhxtCGGOI7IPX/5MnxDWTGcikY1rw2DKN/rxAA9NoQ5bMAsG5jWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A3oinu7aGuz20nOruPrwlfiTpXJhgKoguuxJCmXn29feRwVZuhb9BRMv6o+R?=
 =?us-ascii?Q?8E+245B+M+Rq3hmdh3SL+61x0f+sp/DXomkWPrSMareMhot5js3JRWBPvax4?=
 =?us-ascii?Q?ztO7+/jmwsC76EgXdYIKYt4rTfUp8TSbUKSqCXbsKBYvxrg8fCM5lGlC3A6c?=
 =?us-ascii?Q?bBOiHo5tJj41TyifoPUrwysqMmTmp0tCDxhLh0V2hqWlxF4ZILH6syNEub6Y?=
 =?us-ascii?Q?lYXSxR6jI5xlaUk8R2RBhV3muuVAZZxFnySmzHw4NcFXie0uGQZt0hyOmUVf?=
 =?us-ascii?Q?E/rawVX3ETJr7VZaS1FsGEKFqf5XAXFvppIO/dbGyPyK3bt87Q1fovee0eLX?=
 =?us-ascii?Q?yJrq+xU5DrJXJaeAVWz7j95epL1bsTbewLeVQkOC9FTb2ntr+aGSaqHAcklm?=
 =?us-ascii?Q?JHzNgLuseiU+ZwZ6H2IK9a7EWac4vq1a4vax4IvHiKpsWCbWb7CLRndr/Kar?=
 =?us-ascii?Q?FnkXGTdaPHq5vfHK+pG5U4PdxiO2F84RWAO+enpeOcWdtauQ8fimoXM9IWzH?=
 =?us-ascii?Q?9k3kyW9swMK9ZpUbfPw9JFuQ1PegyMY/WY0tb8MVlMtqdTqcZXi3J+gTlYQq?=
 =?us-ascii?Q?5aJWRj+wBqWmkAtB9z/x5Pa7++133xwG74our7FE8Swyk7Qflmbls6OdehNq?=
 =?us-ascii?Q?P4jPWJSkrCwsrhXIbxFz4EStAvlbcYiehlEKnwfHeDWBpzbyBk8ewGRiGmBi?=
 =?us-ascii?Q?fJRFbqbbiNEnsge06MqOCdIFOTP5ADv1C1strubygWupD7LkmKM1REXNSnRi?=
 =?us-ascii?Q?7NNrKpoxUsc/OBSe7IjXozuGD/tFab+YD2qloY0revF/dHrGJmVhwo+Mjqai?=
 =?us-ascii?Q?Qd3h+n447zgok7QDzqc1+xEcY/q/Dm8iGksCsmuxmyQlxQfoBofv4aA2RgMe?=
 =?us-ascii?Q?OpDD8vtDLBJKkU0KDSj4GDvPXzOlnBYU3JtTDVX20SzU6bmhmq3+01nNNwok?=
 =?us-ascii?Q?AGWKSzJDxJTtgcUUP4KX6Mv3rljCtdUUc0NH66ZbOTC8xn7Yubx6vvnK43W+?=
 =?us-ascii?Q?cG+n3ECQDc8OWM2GM2HCoAy/NO5WwGK1nbdHAmmiSMwteN+QUW+O7o8Ag/BM?=
 =?us-ascii?Q?o0MuBUKv1YgKah0YLf/jDasTn8MfxdEXWH1PKgkDEjG+DHeSPjQO6KcnsDiO?=
 =?us-ascii?Q?5cuV+Atzx0+sTqek5P6YfiwnOm3aR/PazZIhvHpL/D5bYwaacykMzkiRSKLs?=
 =?us-ascii?Q?Zjbtv+KiN6pO4HaTP9nkwL2Pk+9EG2UJFxi7sZ5kZKTvTSzEEjULtF9fKKiG?=
 =?us-ascii?Q?eYDFFKKNgvJzLKGzW8s4XczjbDm5csAqgj3y00c7vDHE70FkvCqN7ppo7OXz?=
 =?us-ascii?Q?RrzTKklfSyWYsKk4n6XkBR1LS51V8qEQrEU+yE9y9W+15XS/KNTDtfBXIJG+?=
 =?us-ascii?Q?/arqGMgh/8VXG9+vajQrcL06ZVl/gLkzNDsnigQm5wSHnavm5LulTOf4suli?=
 =?us-ascii?Q?zjVs6TznFxniV4VxF0grG9MZowVm4VRGNYGnEQWpI5ApweBYnXOs4yKaOgho?=
 =?us-ascii?Q?ztOfROGJIjVf88kCWtIooLyxtrDSJ7JKnEgXoeinQWDQgqqbG/xf5App41jl?=
 =?us-ascii?Q?diZt5UoqrbCg718pSXzNH0Sd+JDqL1yD/SNxZzesBx6X/mWNh+IZzR4wHBlE?=
 =?us-ascii?Q?pnVYdgIJH4jyb3fEbDqCS3T4aQWBrvG6GsNHD4/6SGkWc3kNWyKe6ydzWzNm?=
 =?us-ascii?Q?V6Ph2iBqfp8fuC4n8y+MJI88ZzMyb8W0xU7qKQ6D6CCF2gCD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8d47d4-100e-46c8-eb80-08dea5632c18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:17:29.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tmFDmBTT+7LNqdoVDhzFUDPdtklYGPJBOBNi5sjE8GiiYwNxGFvjpsdy3+ombj4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417

On 28 Apr 2026, at 16:07, David Hildenbrand (Arm) wrote:

> On 4/28/26 21:56, Zi Yan wrote:
>> On 28 Apr 2026, at 9:31, Vineet Agarwal wrote:
>>
>>> file_setup_area() currently allocates anonymous memory, fills it,
>>> and writes it into the backing file used for collapse testing.
>>>
>>> Instead of copying data through write(), resize the file with
>>> ftruncate(), map it directly with MAP_SHARED, and initialize the
>>> mapped area in place.
>>>
>>> This simplifies the setup path and avoids the need for explicit
>>> partial write handling.
>>>
>>> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
>>>
>>> v3 -> v4:
>>>   - Restore unrelated blank line removal
>>>   - Restore original close()/munmap() ordering
>>> ---
>>>  tools/testing/selftests/mm/khugepaged.c | 14 ++++++++++++--
>>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> This patch breaks the khugepaged test for READ_ONLY_THP_FOR_FS.
>>
>> When I ran sudo ./khugepaged all:file ~/ on ext4,
>>
>> collapse_max_ptes_none (khugepaged:file) fails.
>
> madvise() still works? Is it maybe because of dirty folios? (but that s=
hould
> also be the case on write ...)

I asked codex instead.

Basically, mmap(MMAP_SHARED) makes the written folio dirty and the folio
survives the later drop_caches. Adding msync() fixes the issue.

The patch below fixes the issue.

=46rom fdf796e52a94b7e21614c8cfb6cc947146221d28 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Tue, 28 Apr 2026 16:12:08 -0400
Subject: [PATCH] flush dirty folio so that drop_caches can work

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 tools/testing/selftests/mm/khugepaged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/self=
tests/mm/khugepaged.c
index 87ca031cb7225..ac645d96285da 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -399,6 +399,7 @@ static void *file_setup_area_common(int nr_hpages, bo=
ol read_only)
 		exit(EXIT_FAILURE);
 	}
 	fill_memory(p, 0, size);
+	msync(p, size, MS_SYNC);
 	close(fd);
 	munmap(p, size);
 	success("OK");
-- =

2.53.0




Best Regards,
Yan, Zi
