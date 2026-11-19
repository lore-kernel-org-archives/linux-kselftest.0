Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128173;
	b=RgHZjb1oRb7IAfe6m7IXs/yEKHnewkTyZLdFLD+bp3/MIVLy8KoFkXE0paxlUiyQBKT5
	 a3HCZZ53/sCS1UjS8wm3LI+DuV5F0qfP2qcEt+ctdFnr/3dvjkq70wG3ZUP6Xx1S65IY8
	 TiyeRLQVnhPKXTGDJxJo9QVlR0D9iywKTXlYyH71i4nS2OHqFZQBZEbvBPhAUIejSvkpr
	 Bs3Ysb2K4ksdQYnErvwUvG8ew/itqTy2RkqBglIuQQ/5AI6Fn6ssE5IwL5OZMugVsVaFv
	 dTKOMOafM97lLs1RIJSdIo5yz0FWR7BQMuE1oDWBk0bxWWpsaQoOxVabvX87hMjkejA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128173;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4bNbrJCVKYDZquo/UYoJn35nfcHdgnsIAcTG+OQuWII=;
	b=UFJBgCsUR1BakMHRssam9+phKzh08KVRsTo0a7Qdf8q4/SZSLpVXFvvCBYlDZULlb/fo
	 y4uLgfcJrb4Vqfjmcri7QgmqPVhMIRgrzOQIz4n6viHDWrKnP+PETqEWAdoviTh8by1LF
	 xYMFIdwz1hFXyexvmpkBg0x1Nc6ayP+rx9yCv6vxRlUQ1zcbWpcx+jzzgsXUa5dApFcCf
	 l5/oWJtHp703QiWY0pilRO6BFHiC0RPo/tM3kB+wn7ltBqiz8tHpisZfOISHWI3ztSB9R
	 O4mEpbpsK1h+oE5FiEDT8AikwCE+wReLmPYTihw/MwQCz2bZ+PSsAx/tp8MhCsQ363g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=fKQN1TJF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.61
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011061.outbound.protection.outlook.com [52.103.14.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA56606A320;
	Thu, 19 Nov 2026 22:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA56606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=fKQN1TJF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMK4eS+Lfr3liAyN8zMpRWMWt9nUH86aYZbivjI3yEsz3lUWrUzEgMnVTFoVjStpJrw96aS2eStog8d9o3OLyphrDWIBF1iUXsD1eJHiyWAhOwU2cAYEVuGCZzaFvNyNvgcBZh1ivo3C+iU9vJYwyTf/zXF+bWUbDBGRDE+p4EhTgkFwDtSan42E2u+WPUJM8A26Ow8kX42IMTWH6k8uIg+qC3Gsk8tJc2hmtOeehJRM61GN3fpBx49nS0sxoLlMjjHn5mLS99N78PYTewx9nbx4Yz8QV50Lgn11hMkkAf/0ce3D7Em/x7kRRYBCUqj/t2HutqWzCcdytMjdAArPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bNbrJCVKYDZquo/UYoJn35nfcHdgnsIAcTG+OQuWII=;
 b=Ak2Ok8aqUPwIReIlL99fgJQY5uAXBTEPfoJtC21YpOmlnFvoGEKrEwackB5jry921jM+C1WfypBCrVr/4QGOPlyRJxkcY7QP7W1fIrtqOw2qW5P1qvXLZC0K5bci/7M6vT7Tipf5IBcxwYTn4bG6Aq40A2tcbC3Ylg8O0aN1pbxuIDSfCvE8QdSP0pEUampFwzdJ7jwpXLW89oWSZ7dQGIEHoGH0rxCYznzNSUQFakwJ38Trze+0xGjC0D19ecH04AJS855ibaNk85rh3F0NmkHRIrpou09eW5qgOCXeI+BDWHn98EbYQpzKq9nGD62pmNegfwdYNWlI9LGkkR5kHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bNbrJCVKYDZquo/UYoJn35nfcHdgnsIAcTG+OQuWII=;
 b=fKQN1TJFMsJuGerIhJG5AbMweB0qcUnBz4AaK8ibXRONm1EiZQ8lKlvLNASA2MdFhI5+iJe5j/pQhylpRvJFWOGwx4ijwbHJrY3xWu0VJ1+oColY/gRswAklODB/iT4ALaPtnNXnFNRbCLO/728qYnSkmzWJTh5AtjiX+TJOnQO/grOkY29MAHR3j+Z3p7O7J1YY7U1uPJZsotn/OXq4zPH8KqhgB1zakIxDFPRn8oTdT1EJadBiSk/6tFdJNiF1iUi0WMnrlF914RfI1Pd+ADVeMT/cma/IszbO98+mjAGoLVsg3I2mb9U0zCNPSS7GONd+QXRVSQHvAf69frN97A==
Received: from PH7PR19MB6658.namprd19.prod.outlook.com (2603:10b6:510:1ac::6)
 by IA4PR19MB342183.namprd19.prod.outlook.com (2603:10b6:207:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 22:42:50 +0000
Received: from PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32]) by PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32%4]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:42:49 +0000
From: Ilyas N <desobei@outlook.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Tamir Duberstein <tamird@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
	Kees Cook <kees@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Ilyas N <desobei@outlook.com>
Subject: [PATCH] lib/prime_numbers: don't sleep under rcu_read_lock() in with_primes()
Date: Thu, 19 Nov 2026 17:42:36 -0500
Message-ID:
 <PH7PR19MB66581508E6F6733E0C36EF92AF792@PH7PR19MB6658.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0163.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::19) To PH7PR19MB6658.namprd19.prod.outlook.com
 (2603:10b6:510:1ac::6)
X-Microsoft-Original-Message-ID: <20261119224236.12058-1-desobei@outlook.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR19MB6658:EE_|IA4PR19MB342183:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc05be8-dd01-43e3-e0f6-08df468e705a
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxO86HM2Wk1jOWTAru4RkxpyYf+y4vsd/OQq7Pxv7QLqWWq84U+nxWjz/x7tdiJ/asTUJiB9f10GsUzeVAFhR0Yde3S4WaSm7P1Zmt/5ZQ3TvO5iJq47SinwKqGH9sQCPzQBLKu4hACYbWjKFal+1oHqM+yDVa7UvGmenxMx3UagweZUQfGalQgha2dr9Ylj50loKJRLidqLC2gt1Bnp6nJCIwdSgFub6ZpZflzbCqYeZOeDx0hhVIwID7ERaoEsN65qjjSPwzsIoy1HoNDsNtLKW1AKWOjWS8eCtuVGpX91CNoVUSoyG+2yZyIYYcv2qGR1fZQE6T05CQcX5Kb6krrY43sx9trOHluOGix22pnZmmyZU+vKtF/pyvW57FFrtJNuOL4DSqiP3X2hbPzlVRwFvnoAiok2IyezTz6Zhu1fkjCVOQhqrdfXsdZlECAem1rUCY1gQlmB+nHaJFsS1v7F6/nHq1LOnYJ5qFTf59C2pUixwkzl41ZsHre6cwLzIggZDn0iueV4di8omdmjzZsvDgqs7XdxuFdGDFN4XULNDbCEJFs1ujlIfnENsh4FgZY84TKjwPa5LXdNjO1zKRZw2bR1D4J3E3X4kpL9lNm0pTXtEPjUKVMS1/PCcOF2eG39kv/TeC1FhXTMWWay5qsVa5lO5yd2s8aDrD/JgpX5ltvaAN1KuFipR/cwKTB8QOIupm2lVfoAowlu277x1C4SzikPC62PofxABripAlMpI4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|23021999003|24121999003|5062599005|260925184616899003|22121099003|8060799015|19110799012|22091999003|39105399006|4140399003|5072599009|6140399003|440099028|3412199025|3430499035|40105399003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HIRmgAGQbfpqHtD28C1oohp0Ua7M2G71Z5nWwUrABf1Phfzy1gIGHHwdDGet?=
 =?us-ascii?Q?Bav4ZomKbGqXxwOi4Ab+wxomQ2X3fFYEnSnszoPC1akfJ7PRUP9mxN58X8IL?=
 =?us-ascii?Q?mjWqyB4eGNWVUYRMEmf+usPQ1oDNn10fslVnKEdlARBMxCT9P6Zu2N1vyCgt?=
 =?us-ascii?Q?nhnbi2bl3zRY4dBBZarSYb0Jq6+5byuErRNpOW7igtzAohtIMzyszoAfcGt3?=
 =?us-ascii?Q?CFnflrGwT5BYookb7+CXfC3ZfaUHGPp2lXJ0GHfyPWeysSwxHcabijZCHC+q?=
 =?us-ascii?Q?ChNFgvf9mdYHnbBPFT6cjNCc0s6uPcgw+R2nEFO8ZP9sycPLFxEquQRwtF9V?=
 =?us-ascii?Q?nRM3GwyD+UZIiLeBSaN+MK8P+8xNgwi/WTXCrx+l82+ciRJl4eNmqP8vlB6N?=
 =?us-ascii?Q?COu3r/i+DpIMaXlpUQ6974G57Ou7tq2RMx7yNmUVBah4N/aRRufBh9E6O3iN?=
 =?us-ascii?Q?MrUtmtZEzLsBA+r8MtApg9FwvKp/CuoSNNL2K1ejKSbwTxeVhHFX/lHrn3cQ?=
 =?us-ascii?Q?CNW/LJiqUt6q8o3MR1h1l3UwOaU7SNS5RvIe6CmFSTAdja7odeCH9XGl5KUp?=
 =?us-ascii?Q?tH6G12T40674CLdEGnibU4Yn2yDsohJlHK1n1FaV/lWDp/hkgYIWoEoxH3sJ?=
 =?us-ascii?Q?21tTE09idB2ClVk7x6myYhstv0lUPrIeIm7xHkO2bUDc+TnAKkD7ypc/Y9SR?=
 =?us-ascii?Q?fcfy0I3f2zP1ebmh+5hn0tJkG8V1e6aJrju7OwWGEjM1evgjvgludzRWWhBV?=
 =?us-ascii?Q?EPO3pp/ta2klt+JlcaHVOSHq9bkHp0eDZI2eP+5/sxCTMMk6CbO+IA0UOfX+?=
 =?us-ascii?Q?OtNfd22luVgTqLvo37bAsjGTIERitdSwXu6bvlOb3IvvRBsCYTy4uR4LBkUp?=
 =?us-ascii?Q?mtnjV5c3nOF4ZG16xz2lA66/5GPIQV0+3LnvFhRtXqTi0p6fCT2groSswWNf?=
 =?us-ascii?Q?QDHiz2VKshkOqCskx6UNtDQUY6ew7evd+jYo3DNrJvwUDIYWHUPsYmuDBtVs?=
 =?us-ascii?Q?u5pNGR99CaSiWItI21XRNEx/NkMzKMJW1igzziMvX0Xoo2+TSsBT6PhnMHGv?=
 =?us-ascii?Q?eYWV76yK3Drz6r4lKSUtOI6eybWaYkgQA9N0oFoSZr39XE8Wp468GIrfl0BD?=
 =?us-ascii?Q?6WwudwFKspeT?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/BliI0CMDBIDA+WI8wATua6jnO7llE7x5yqFPKgZdBHflJGzLQU7/pL33He?=
 =?us-ascii?Q?GinCoELrzxrvcmtlq1luB+/kVkXIv7SH47i11gx0G8EZRhCD7eESMN0xE/lA?=
 =?us-ascii?Q?m7m2V5GVCFKuLHcta1hoiLOOWjuyVwKNhSZQVhAiFOq6y2LWxv5JsATkHkV+?=
 =?us-ascii?Q?njFivoCjbgXJHIgzT6WrPXAviUmZog+7vN/xb1YZMWVRI5dm5iiLtkg1RDwj?=
 =?us-ascii?Q?RvV9zCkdXV5EqVgrc/7gyI67GrhN3BJtkX/zqz1Pc4UmlJ9eSb7SSkhe1lbD?=
 =?us-ascii?Q?wtZFipq+1NmXHT2KGuGb+57pI5kMjIVbePCh/uMJvaTsWw3MLPfTFM4y38rG?=
 =?us-ascii?Q?xUXSevpteywlcqvbHDg4BM9BcMpJliO0JqSim3Ca+BiwXhYxmbadjvstXnAl?=
 =?us-ascii?Q?h1DXLeR0skvMnuQsLMcrzD7ITYuSelElSo7e67pNoTsHa/MiKl5XI60OI+61?=
 =?us-ascii?Q?2ZCSlzudZuvv+EHJQF68/UA+R+tLvI1hOE77y0gXw4BvKX4kg7YYllNtwvO1?=
 =?us-ascii?Q?NWOj1AG60PqhQfjbMKYhEEOQTIkeWbqYtXXCUdaqr6sIVBDUKMaKcPxX0NQB?=
 =?us-ascii?Q?D6HhsiyOR1dZU5WpYJlIKVnCF5LOR2mHbPNeQb0XQLXgGdjbXfe6ydaA3bC/?=
 =?us-ascii?Q?zA25vKfqmIAuJank2cQi4yxRerMfiYxaD+XTgp9dvVCgal5dhA7QFzVr7QDD?=
 =?us-ascii?Q?kY2x/vMTA/YY7SWIu2M7zG4pe8YCwtq3F0pXTaVGkvYobO9Q8pteaKECyKKL?=
 =?us-ascii?Q?Bs5h8JJBXFA00WOZWLfiUOD/CmEPuvsgNbe0PVbzziSOzrjQyuYM0589DOkw?=
 =?us-ascii?Q?0Ws3ATovQs0Y/7eOAcxewa7BEZ4SQGuE/tHMFUHd4o5IzdQmpUeN3WKdyb4z?=
 =?us-ascii?Q?PLYn+Zo9X2cMJlDOmRlg+ktjgyZER9iabGNXMVlw1nkBktWSDezyv5c36xRp?=
 =?us-ascii?Q?/pgZNXtp/ga5y0+eFJ6rCdfaqGIhjCqa9RUE82+NGUK4WFwwLpRIfxwE7x4Y?=
 =?us-ascii?Q?xB6WhjnGPg8s4KPA5oNRIxxvPYBaxtm/IiZR9LQmecpKZPqBumbM1TIBbuz9?=
 =?us-ascii?Q?zrK/0AZpyXLTkqkNcCl/OitJYozqYh4+uo83G33dxteuv3ZnCIO80IaUKZeT?=
 =?us-ascii?Q?bXzcSh2z/YNiRZsnYQPFH9AlXxHua71/wmA3jAVl/I/boAfgRePH3z/GcnzX?=
 =?us-ascii?Q?IAevry8of3d2mq2Dgy9BLLpMF/z8pKe3M2uJ2fMcLIG0iCNxLDvB9wm3HUv2?=
 =?us-ascii?Q?FyGgu7Bb5mXXHLsF6dN0yg/44z0Ym/240vn0aWQs05wEgGzOWTTGkfCrxrce?=
 =?us-ascii?Q?ENPZzF3sjIeQba5TfpXHgOigNtvPpmW3IOHqpJGnHTa/h/AkfcjcmiZT7Rci?=
 =?us-ascii?Q?GadwJ6KZIRM1tvLkChIIQUmKhXYp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc05be8-dd01-43e3-e0f6-08df468e705a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6658.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:42:49.7720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB342183

The KUnit suite exit hook dumps the primes cache through with_primes(),
which calls its callback inside an RCU read-side critical section. The
callback, dump_primes(), logs with kunit_info(). With
CONFIG_KUNIT_DEBUGFS=y that also appends to the suite log, which
allocates with GFP_KERNEL and may sleep. With CONFIG_PREEMPT_RCU=y and
CONFIG_DEBUG_ATOMIC_SLEEP=y, every run of the suite reports:

  BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:322
  in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 0, expected: 0
  RCU nest depth: 1, expected: 0
  Call Trace:
  __might_resched
  __kmalloc_cache_noprof
  string_stream_vadd
  kunit_log_append
  dump_primes
  with_primes
  kunit_run_tests

All updates of the primes pointer are serialized by the mutex in
prime_numbers.c. Hold that mutex in with_primes() instead of the RCU
read lock. The pointer stays valid for the callback, and the callback
is allowed to sleep. with_primes() is only built for the KUnit test,
and the suite exit hook is its only caller.

Allocating with GFP_KERNEL under the mutex adds no new constraint on
the callers of the library. The only other place that takes the mutex
outside of module exit is expand_to_next_prime(), which does a
GFP_KERNEL allocation right before taking it.

Found by running the KUnit suites on next-20261117 with KASAN, lockdep
and CONFIG_DEBUG_ATOMIC_SLEEP enabled. The problem was found and the
patch was written with the help of an AI coding assistant (Claude Opus
5.5 and Claude Fable 5.2). Tested in x86_64 QEMU/KVM guests with 1 and
8 vCPUs, running only this suite. The splat shows up on every boot
before the patch and is gone with it, lockdep stays quiet, and the dump
is still printed and still lands in the debugfs log of the suite.

Fixes: 313b38a6ecb4 ("lib/prime_numbers: convert self-test to KUnit")
Signed-off-by: Ilyas N <desobei@outlook.com>
---
 lib/math/prime_numbers.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/math/prime_numbers.c b/lib/math/prime_numbers.c
index 95a6f7960db9..2b28bbec8384 100644
--- a/lib/math/prime_numbers.c
+++ b/lib/math/prime_numbers.c
@@ -59,14 +59,15 @@ static const struct primes __rcu *primes = RCU_INITIALIZER(&small_primes);
 
 #if IS_ENABLED(CONFIG_PRIME_NUMBERS_KUNIT_TEST)
 /*
- * Calls the callback under RCU lock. The callback must not retain
- * the primes pointer.
+ * Calls the callback with the lock held, so that the primes cannot be
+ * replaced under it and the callback is allowed to sleep. The callback
+ * must not retain the primes pointer.
  */
 void with_primes(void *ctx, primes_fn fn)
 {
-	rcu_read_lock();
-	fn(ctx, rcu_dereference(primes));
-	rcu_read_unlock();
+	mutex_lock(&lock);
+	fn(ctx, rcu_dereference_protected(primes, lockdep_is_held(&lock)));
+	mutex_unlock(&lock);
 }
 EXPORT_SYMBOL(with_primes);
 
-- 
2.53.0

