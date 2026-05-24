Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021091.outbound.protection.outlook.com [52.101.70.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E3249E5;
	Sun, 24 May 2026 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642157; cv=fail; b=QspC92wcN7ozpIPGE2zehkekTBcdcYC9hgOtMA7bb5PnZcRqvIgJcAacUuNeO4YziGK7zinUu3bkDZB34QFvliGMuxOlRdMBjg+4VcSA7kihLwi1u6xGh/lHUID9PCp0XKjvDSgjtqjHKiymTZ1Mh4RaV8Ck28HAcjQzZm2Kenc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642157; c=relaxed/simple;
	bh=cCnnNTsTKIe/nmQVYRAqHz0TMShZGLInZqFLEqN6Sbk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Iq1sOfQvPJY6RJdGVitfbJEBCHVx7yzOB4hZ5i4WQzXE3utPZ2p43fhekkrJXSyR2COeEU68Hh/coJ1UkS9iZLVV6UBa6riJQBx+LNxYs8SB5cAP6i+L9OZST43qERpMgn0Wk1XR4P4TQ7NorkvaEtBlmNNo5H0l5Pz6ZI1nMFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=YyJJwd2n; arc=fail smtp.client-ip=52.101.70.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="YyJJwd2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcBqxoltdxhfYq/IbGWRDT75RycdyqB6eeLb9nW3Dr9nWb06+kcRkCjl4qF343sWeCrYU/CADtiRfUSC9SYFeZtS9WpoY31y06Tsnut8hoWGHzY83UOH9hpJyO6v2bIJOioYn8zf+b8A7zHjscTt8EQ+qIs8ohNeMufJfFfp5n+y8G1rcaTVXcbffvFM+LM8sL+YiyxvB7rW6sreV44y4EXzIMzYNSxM3C//KwWMmT9S4Lcv8Jx4/07OCCe9rk/DFpT9IHGHj5YhYWNkWF+7CT+9yl86xx8jSaIvpB9D7GzFcwXW85gqwxzltRzUJb5ZbGC+uzJdUoOdm0X6wMyfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1iJ3op3/5vFIHCTI5mk4I0ZmFgtlK0rUXH5adZsObE=;
 b=RYs99I1ZdHbnssx1+j4qk8YoovP37crczPFI+VbyR4hwDtMGEHnBG5l8IElir22iFCG2stolgxPO802qHXYi2jC535BRUKo0b1qSYxUKyu8um3/bU/ziQ/Dvv4jaEnUCucMurEX/9mv97bEK/L8x9SCMi0ImHsDYHijHlDFgUS1LeNAJv2IaSiNXBe1GSzDH8hlviCAdCY6xT3IJXFVTRcyh1mIGITb8aAldNRgv4IOHYwuCGGAusGqUE/VkDCXAS8aQ6gZcf2N4FkyTVsVCc+WzvPhq0EN+QYDcxR+rB3m9g33gvuD7bHal4VA3rQ9CCg7jOlae6ZdJ5m3GaXOk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1iJ3op3/5vFIHCTI5mk4I0ZmFgtlK0rUXH5adZsObE=;
 b=YyJJwd2nhWVazn6Jidgox8DvEhTPp+CDTpBUyOJb2ZlNJp5epvCqI19HNbDmONqk31qd0nCwkuTp/Q8gkp5NXWUERmteTL5bO2IQiZ5QPa3OzOcQJxKT8+sBiDljHJMTEU3Wz/j8hsD4TWn+awISA57z1ZkWQY6vGEXcnTw79F3rVNWaipOqUkGFsoH1SEApUSZAKcvYTN4j8CRzcsX8eWrpvKDm4IiAVmD5BHQHhnOcuBD57LKhB/8HjPxCZgSoOoU0UQOIQdjuoHqJEFDe61x49xv4kVx9R1m1O4V4iIir1Q7FhEQnQrIYv6Jr8WcDT53aZ+jcHU0GPJSkhAi9jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB7843.eurprd08.prod.outlook.com (2603:10a6:10:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 17:02:33 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 17:02:32 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elver@google.com,
	eva.kurchatova@virtuozzo.com
Subject: [PATCH 0/2] selftests/perf_events: fix test fail with optimizations
Date: Sun, 24 May 2026 19:58:55 +0300
Message-ID: <20260524170209.37874-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DB9PR08MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: a9186ff8-cde1-404b-3a5a-08deb9b63f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t21pCXvyzWElJbiNkAPuYzsdmda0UdtS3AVg6xf66Ox0UXszMCRpbuSXp6MOX60Gxd9kYDH5zUgxZuAXov1Yx1r3AJQc5vR39Yw2pgzgrukP8TL/TRsI10cw+pWkoqNX1+JwEzCnAl/caF8kMIEt55rbH+Rgv4ZUXjvOL8TSf+WTv1onOsqkSHTWl0N2JrAUVKXCbz4dqbAiKO2PhvPNXq1EBlVNQoOvBP3ihHfQ9dIB7DktpPsebZ8JcFwrCEDjsvkEhLeGlQE3bAzjnjlPU+QQiHTM5csHr/LoPS9EdplkMUMV589L6UOB5aAHOhlIvniYUx78YLaBUZWPhBY8qxUbixWoxvA0hjMFZVOon385gvWtfb8NFSgD0qUSFe2D/zNpGGzR35+cClb6V1zp4Qm1v3MvzFMQnXvyc3bdBl5BOGuC1P5T2zW2vk3OrDoje/AYWoTjWT9jvdKIw0LkusRPLOOjKPUYZiN+R5mOEITla+958LRdsWnhsO63FwL+tGzLhAMNgErzXg9QoVedK/umNxXX+3cisRX4Ht50NGhneoEL4Y7Mk3mClojGU5EDd8etbDH1J2mALXjNzbE7U4yW/tEu/gldpGhJZ9fB0abhh3llHRHX5vulo6ys6Hu1HUXMyXE+3OvuSCKJ2xsVgZMHEB+DOUCq/YZJwnNay+o2BXT/zrSzwwuPwt2I3klQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OaLJ6NsO88aFKOO05IHE0YRJHzhPqTWac8dRgUJLY0nC0BZaLPfU7YzH8Kyu?=
 =?us-ascii?Q?0I1bkFXZzy/sqCJhncKMiXfUYEGUwpdEfgl/sjVDZYycK1VhbqM7icJ5Sj5U?=
 =?us-ascii?Q?fhBXHI+gm8iE+B7tJ5kEFuhdeRA/PnVf2cGHPq/rdrGWKO1qV560OyPBtWaj?=
 =?us-ascii?Q?FWE+vjFwFL2e92c6filrpzagBFtUcdugspiVgWLlly7Sp0CVBe92yUakf6lE?=
 =?us-ascii?Q?FugEUwWTuYXht1OGTb+DBnNgeEoXjIFEvvU7W22sd+LHVJvG8/aDIxxwOaGV?=
 =?us-ascii?Q?kD9zMCd6EYs7S3YXlfn+F5SSV533aktLZ+5ejQqHPyLq4x46q6Umj7facX6p?=
 =?us-ascii?Q?jEKfHAZSf8imv5oymyER++U6uvgZs/nZSjxK9mLrK2ab+dSgrtZ/HNIuK2F3?=
 =?us-ascii?Q?G4OC0dfPGDuxr92MU+3uMa7dXDhiFYyTYSAIyJ2kcwwnb6b4WQlPHA7idNSc?=
 =?us-ascii?Q?AuRqaLLxhzeweMMSeezLxHrSzG6SCkXWmAYH/NkPPs2ZZwOnQgGibIg0QajP?=
 =?us-ascii?Q?OPzAiGG8jfgCcqOad7u3OblE/k0aWXR2o+wu/JSXHj1OOyFhIysAvbmW/5wA?=
 =?us-ascii?Q?U7sYGC1Qw6KpEnLTn8Ibqc/X4xmmvjT9kGLb2I9iqUxU1eukAFSIwcWBsNZ2?=
 =?us-ascii?Q?27yKGtd75HOViNA7xndgql86PdFwP3l6VtdBCdU0YnLoVLPErCaNJO2s2ZYz?=
 =?us-ascii?Q?hn7GjwlV5EJ1/a7bV38nTC81SbAySjvQsjzHRZftylmC954jOeJTtmkCI87V?=
 =?us-ascii?Q?gQgwVFUVpQAsMGzq8stmukse54P3MqETTgIfRfXSmAM42CVySrKKk0OvXfME?=
 =?us-ascii?Q?LMtVIWkcLzaD7JN2GYbw/+tx7Clunlu8bG4FePdHflUGDjsbMUcKiiJDj1Ve?=
 =?us-ascii?Q?iWwknq6J7bm7Dpx9RqqUduVHENSA6zaKfP0j7WqJFHqMQKBoVhc929YDLRsT?=
 =?us-ascii?Q?7mqwf64ksGK8lp2T0/GOmvnOG5r1ha+J7c4ou+CQ/jFezPKB5IShXAGrjpXY?=
 =?us-ascii?Q?Nhqum52jkdPU0XgRxj1B0B1oXbFyeUHAMt7uXXfvr68E/rebtSuho9LDi8Eg?=
 =?us-ascii?Q?PUVdbehG2LqBusne0fwXhU5X1zRIAYlSKeLypayNwcA6s8jbN80eZa4DyTpk?=
 =?us-ascii?Q?OJIvR2zSp752F+QhI0+P009gh18+3B92l4jfQvIZ4LbkoE5VBbXJaxKh/eMx?=
 =?us-ascii?Q?mUavfAeCZCzc/zIsUtO7Zq21tBOclyorJw55XUtMKb9EA4SNiQ+FlunTt+Qv?=
 =?us-ascii?Q?yRS/ylwW8VcQKNemfjOv3qv0vVoF3nDrfOaPVwexu8+6FfkfJNp9ErqozrRw?=
 =?us-ascii?Q?3rlU3k9UBvxRLtXOmN7UzPZaG+DxGgsnjm5MJ48+dCt/6UNHfCjQlxQ+4ypo?=
 =?us-ascii?Q?eue9FY3Vl2T1rCUlbNVS1RErujzbb6IceKOnlS4nuQgMZK5GZ+UbBcgphJdS?=
 =?us-ascii?Q?xoHA8AiUMUo9xGt4esYTGMrXERAk20M+ATzTKIT0UYI4W5XW/2Ac0RjUTiSY?=
 =?us-ascii?Q?jH0+QjepsNwUiDBUJtZyS5fXuujkrcbdhPYBY0JZpA87fx0JJmRtpWdDuKMC?=
 =?us-ascii?Q?VkMfE0FCPISBrcyTMUPVfuZtAAc/Wbqk0A6p2kPfPui2OQ8B7zOfIU3ZvXCI?=
 =?us-ascii?Q?oS2lqhJHuHwvVG3hdg2nagsFuyvNLV6angfpercAm7OER9fbDI4T3S8ackAT?=
 =?us-ascii?Q?NI/5gLNTcmkWJhN5xWKTGdJ9Av7MT/x5X3sp/ISkRDcPjW7QehRw/RtcwSVP?=
 =?us-ascii?Q?ZFkC4HfbT9OoOdAtquhDfUNuoUSk98Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9186ff8-cde1-404b-3a5a-08deb9b63f28
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 17:02:32.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtPeV9p0zpJI4is4+eQDJVyv1qJpP7LWb8lYfWlG8w412C3ms2xIp6BQpNefSOPTpOd8D2aivUe5D9rOxME0tkFuMDYqmUCjVN0uCf/1oZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843

This patchset fixes incorrect atomics and volatile usage, which caused
test failures when compiler optimizations were enabled previously.

Eva Kurchatova (2):
  selftests/perf_events: fix sigtrap_threads tests fail with -O2
  selftests/perf_events: replace volatile with READ_ONCE/WRITE_ONCE

 .../selftests/perf_events/sigtrap_threads.c   | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

-- 
2.54.0

