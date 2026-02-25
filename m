Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022132.outbound.protection.outlook.com [52.101.66.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF63B95F2;
	Wed, 25 Feb 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026385; cv=fail; b=hPClvyo2B/cCVchrMeKwcaKPXU6BIoYgmas2MK5MRniT0unG8ViigVMCQaScZSdVVeFd/j56E3Ao6UEhVATafTFdRBGOm+TznQ+hI/anFxpQVhNJC4fVxltN/nKPRNeLqm6rkGeK6VgJvKg85qJEo8LmKdYfCXloKRo2mqG9cHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026385; c=relaxed/simple;
	bh=30gJNMxnv/gyy67CLL+KWGnyQSCiXSd6y21Mj7jH9X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hAQaLud4stAF3W8LzgSDACczFX5FVm5rrsjMZOTyCVbXD/tDAbAQ6WWzQQv5F1h9F8YJ6rFasWQ+wPtiVIuuCuyCB6tfRPs4uSdWyPot2Vu90rw8hB39KKHbL+K8HTUR2NB3FzMfQ8EHeiwxDJ55aZsP/rh0fl7PDGpPJkKBpAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=ST6S3UC7; arc=fail smtp.client-ip=52.101.66.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="ST6S3UC7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBFUTgqmBzWqY0TKBZocq4hvtKn2S2RShZCOBSk/RR2bVsWDEIWR4SdnJS76TMBcyKCulVBE4lhibfXaUnRsFZJ+Lze73/z8cJJlz9lUwsZdfNAe+O16BiwgFoKLJU9hipKAB05U3GPWKAf4FFhNLR2+1IS6ZvXrxjGqP8M2D62vqStPVgvgcR3e1bbHF+adI5OEbxG7FrnK0Eu+ENk1JyZKaRkoNTQwAhf4nBlBUsCKUFd3rvAxvBTfmdMLdqEqzmiuGj36oEtFIeEUT/6s9dLgZzGuPcEewK3g/bZcu4dZiGW9LpAlJpxYChkqRkjTYSHJD3i2ybxiL32YIS6WOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=U4+xPExvspCfgj8XcQowFEh/9YUyPJW+T6G/Anv8RetElBIjuG8Op8UTvdrp7e+B5Y+DAUBqSVo5naOBbaRHar4tKLncrS/3zPv+qauQBy1C2d+98aed9q+5xeZrsXyYV1m5GFSpqhLlh0YSx1uOsO57VGXedlcE3saBNVHyKe/q2mh5Ll1bGMlQcPohXzB2D7qNe8kQJRwgDOLLmZhv+7g/MlHQ/itfccvEoEBhrHKmnl/dRuXo7yz59sZwzKq/rXMWPhW+a/atOSJiUjZ99WBo1ayMbJVGQ5BMHYhdGpdUoaQUAITE5WprRaJVCP4fJZ/Cr8VbxudEal4SGGCybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=ST6S3UC78u+dRr8VyPaYEmvJtcSEX2ugLUtyqiEgGbHS1YqIx1v4Bt4YZ5iFOCx5hQ81JD0pxDj6K4d3QVp7y4yhPFXmL8QRBfeMkNtuNlpps2BPyHHj2GdCa7xLTAlSyrcX0/8bQPbHp6rf3o0C7i65FTXZigNh6CDlr96cUayP285aoHP2ih4bugkjz6GHlEP8CaMI4F0l2mTLjOlp7YEbvqXOTG4r0nO5v3nABYA0KC6UuihUjE1sLi80dBXR9LFNCqqHA3bKLs8dsAh79J0U8LBtn9Auwn93VKG/S7dTf4Rr/C1Zp5Up0kn0L+kd2PXQrFX08pnAuOnyNWv67A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:32:58 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:32:57 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 4/4] selftests: Add tests for creating pidns init via setns
Date: Wed, 25 Feb 2026 14:32:26 +0100
Message-ID: <20260225133229.550302-5-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|AM7PR08MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: 10cfc55d-e414-4ac5-38be-08de74726388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	iPWfrMPTT1gLhCLXj86IDp2K/qgNZPv5RHn5LmAGrcuFhI3gl7WypeCXJW0RnCgh833CMJbDX0V4/sMw62DkhCTZtxkXlXaQr2CLZOiJTl24EmrgHjTVrs/W2WSMemR8TI8fbPtSs2gx/2gs8yD1bmMQoKg1gdHNRUihp34TJg73NAlKF2Rau+X37wXl+wGFPVPIWLrAKElPsZimBLmHCLYILoL2W0i/65dak4+KgbVOKnOXh2MONFaX/Y6adMqPlF+FclC9SXRWV9S+c3kUVqM9RCc7lJhi4TFKkyJklNh/WAEbPwsiIHlEdxsfEEAib8wtkfTn8d+1AsnqTFbasP0ZpmRGIdjsjvjPNd7LLOr19OLxfOfPMsLlN4+C80DM043dby6fes7wsOtlgW8kjHmzfCyheBh3LVJWwlb6vc5BSU5ZYPdWHFY2tDIIl3JNQnA4PkttmPbcXmMNg3hf96tB8K6VGD36OtDrJaLF+kBRj3DE2/k6lLsHYTHMEP4ZJu1bYobBVkd1uRo1GkHq5xprAoUVbSRfduvOhhoC6our87AttK8IjMun/3za5O7TqOfOBKZrA06zZw+qa8NwZXhuE88UyRZ6WWl6NfDJqE9ZZVZqT4AcHTRamqP05v1GvbRBYKMTdwCRpP9ohnXpTXjcRauvEse2FTTqPoxyfa5UDIa0m2frdoObHb7/CZEAimYCJ7TpcA3uOJGoOgdtHQDPHq9JZ9Zuo6IegHGGPdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7WBBvU4AkNuaKkW1iCQNH0W+5a9ID0RxSOlQxl5R99/O9DztKIWhUWDsMEc4?=
 =?us-ascii?Q?DOYMRepJLIrLa4izw1uzsYYqylui3X4hNUVHEnwtI2bG0nzYVu4Bc/btnFk7?=
 =?us-ascii?Q?lMqZH0xllLiyehbtTBal8SRZZSdmWNe4Yu9jihG/wRfdz07Kfis3tQwxidjY?=
 =?us-ascii?Q?lscpWp68ZxvR0R96pS7KY7DG0c90wJXAnuV5lQ89F0YXNsG0i8JCL4OwmlbO?=
 =?us-ascii?Q?+jhxYWMc+04uUSZbsBHHB0Bh/9Oj5NCzDTze4Novgm9boe1kDcjnXX+gvVgH?=
 =?us-ascii?Q?sUTbdBAxx+XFnyuW72MzgjLJ3EvJWuPGhQvSXoDsB5qY35kqCeh88k7vOtlQ?=
 =?us-ascii?Q?5SnWlTAHwNyZtRdqQ2SgwOGRU8Vk9RnVJSfy/VH2QOzgdPYF3VOOSkbgqU9c?=
 =?us-ascii?Q?i9Ur9OnocEGlD1Bio5b+/ErTX3Jy/enM8DgDZWDypoCtO8bEh2gj/OdKdye6?=
 =?us-ascii?Q?eysdY3wMTjWP+juj/5E9qJ5cE3mXbIrvlbAZWXNkk/yuza6TIRB5ptz2GZA7?=
 =?us-ascii?Q?Q8tVOQGz3T9E+q1oUxuayqEsofksx+uCTCWp0KWR69fetgWhINUaQFJHSRJl?=
 =?us-ascii?Q?GR+71VXjkT5FyeYS9YcaHzBvcnEQkS29s1UUjFadmDJ7NxFYr580BIlWLGfs?=
 =?us-ascii?Q?Hw5n7eCxZU3Rl8uuR3ggVRNE6NTHHZNGmep2iw0lRTjH51lr9mGdTj9hwHc5?=
 =?us-ascii?Q?cnZEi8b/m3T+AOIOL3DGuC+EGJ3AFxY+OKeP5hkCXTKy0B/jVW/B7/PR5HdA?=
 =?us-ascii?Q?RMBqsStM88UcMcfc4EGt4eJqrKBAsps7ZnDfWYlkqFLL/LewSt+pNFOWUXmj?=
 =?us-ascii?Q?JNyHU5EgGWOqskVZUOisF/jSaJ1bKAAYkySU4+ZpslZks1gzfa2QEp21Ykh2?=
 =?us-ascii?Q?vMgC/NwQ4NMfQ97y3NqS51iu/k50kUte2sI5MKaSWXv5Td0Mdv0TEkfpu8DS?=
 =?us-ascii?Q?YuYtp4QMV8ekm2xiUhR8qyK72nbM1jEkqA/b9k4CSqMujP9PfP2nXe8XDC3Q?=
 =?us-ascii?Q?cAdujUsmYyfyy+JPTzIOUFcUKWvE7W1cxKbrmjEoPhjthSqpK91EiJaksm/E?=
 =?us-ascii?Q?KoqySmpgULv/PjxDK2E3/O1uRyj3/LKkUauXzL8PbO2g1Jj+sXWX39DGDrXZ?=
 =?us-ascii?Q?c/cplSfmi8UY6zDIhzaTys43CDtElI4BvJL9tpIQHNZpGp7N+FplZEioc8Oy?=
 =?us-ascii?Q?5DEQnNzVmQoSwHhgboPsG/DiG6KfhPWBObIJBDo8wy/UhSWGNYC8Dz7b4J9O?=
 =?us-ascii?Q?WygYdxT4zKLXhxcmciYSNEqI4QCmAeZ4RkJWx4dCZ2nz8wsHo62oIrSPFWcG?=
 =?us-ascii?Q?mDY/WthMQ36xM4n1ZaGz4AkCIBQRAdTfeXKV252HKoT9opL4yp2s72FNjexW?=
 =?us-ascii?Q?4AAXFYRxhOM0drsz4ZyKb1uAZiBVimkJVIiMbDrS9jsgbxmD1B+ovTIdokL8?=
 =?us-ascii?Q?5y3rWqGMCkPH3aRzhDb4byMXJLPlMuZYrGr3ib+GCdsIm95IiHMV7+jz+bZn?=
 =?us-ascii?Q?zji4y17E6LbG0mKvgu6YeLAV9NN42AIGgA8KI4PMHApuGQZtGSaqFC5kDZv8?=
 =?us-ascii?Q?h/JJFHglX3A0ULqltDQ32hyUjAOxfz6N2UROlQMtA1czK99ay3mwNRuXsvR9?=
 =?us-ascii?Q?000MThIruIunW7+F+oRuyztQ5g1bnfYblIM9MIOx6WrFZt+I2JuTRWe1rihj?=
 =?us-ascii?Q?8cYPUaZOe0eGSqXQeegOgm8WeZk3CHZgSQmIKx5S/lNuAMrHK+FwvoNXgH9z?=
 =?us-ascii?Q?PF1wyV4ni/5BN16EvqXzS3U/QcC/PRmXgKVWv8o7uFxTSyV027HoTb+pQAnd?=
X-MS-Exchange-AntiSpam-MessageData-1: fDEKQg07hYbYPeLcXwsLGORLC8N75j4mwlc=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cfc55d-e414-4ac5-38be-08de74726388
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:32:57.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8UdsdE8EBaoUbaNcaI6rnZWxXrcoC1588S7XNaJgCrSzyb1pLy2PcFM2w2dJG8TXVMYOpyTl8VSgdvchQ0MZT0oK+/EgiRiCXrZWtZcqJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384

First testcase "pidns_init_via_setns" checks that a process can become
Pid 1 (init) in a new Pid namespace created via unshare() and joined via
setns().

Second testcase "pidns_init_via_setns_set_tid" checks that during this
process we can use clone3() + set_tid and set the pid in both the new
and old pid namespaces (owned by different user namespaces).

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
---
 .../selftests/pid_namespace/.gitignore        |   1 +
 .../testing/selftests/pid_namespace/Makefile  |   2 +-
 .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
 3 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c

diff --git a/tools/testing/selftests/pid_namespace/.gitignore b/tools/testing/selftests/pid_namespace/.gitignore
index 5118f0f3edf4..c647c6eb3367 100644
--- a/tools/testing/selftests/pid_namespace/.gitignore
+++ b/tools/testing/selftests/pid_namespace/.gitignore
@@ -1,2 +1,3 @@
 pid_max
+pidns_init_via_setns
 regression_enomem
diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
index b972f55d07ae..b01a924ac04b 100644
--- a/tools/testing/selftests/pid_namespace/Makefile
+++ b/tools/testing/selftests/pid_namespace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -g $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS = regression_enomem pid_max
+TEST_GEN_PROGS = regression_enomem pid_max pidns_init_via_setns
 
 LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
 
diff --git a/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
new file mode 100644
index 000000000000..7e4c610291d3
--- /dev/null
+++ b/tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sched.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+#include "../pidfd/pidfd.h"
+
+/*
+ * Test that a process can become PID 1 (init) in a new PID namespace
+ * created via unshare() and joined via setns().
+ *
+ * Flow:
+ *  1. Parent creates a pipe for synchronization.
+ *  2. Parent forks a child.
+ *  3. Parent calls unshare(CLONE_NEWPID) to create a new PID namespace.
+ *  4. Parent signals the child via the pipe.
+ *  5. Child opens parent's /proc/<ppid>/ns/pid_for_children and calls
+ *     setns(fd, CLONE_NEWPID) to join the new namespace.
+ *  6. Child forks a grandchild.
+ *  7. Grandchild verifies getpid() == 1.
+ */
+TEST(pidns_init_via_setns)
+{
+	pid_t child, parent_pid;
+	int pipe_fd[2];
+	char buf;
+
+	parent_pid = getpid();
+
+	ASSERT_EQ(0, pipe(pipe_fd));
+
+	child = fork();
+	ASSERT_GE(child, 0);
+
+	if (child == 0) {
+		char path[256];
+		int nsfd;
+		pid_t grandchild;
+
+		close(pipe_fd[1]);
+
+		/* Wait for parent to complete unshare */
+		ASSERT_EQ(1, read_nointr(pipe_fd[0], &buf, 1));
+		close(pipe_fd[0]);
+
+		snprintf(path, sizeof(path),
+			 "/proc/%d/ns/pid_for_children", parent_pid);
+		nsfd = open(path, O_RDONLY);
+		ASSERT_GE(nsfd, 0);
+
+		ASSERT_EQ(0, setns(nsfd, CLONE_NEWPID));
+		close(nsfd);
+
+		grandchild = fork();
+		ASSERT_GE(grandchild, 0);
+
+		if (grandchild == 0) {
+			/* Should be init (PID 1) in the new namespace */
+			if (getpid() != 1)
+				_exit(1);
+			_exit(0);
+		}
+
+		ASSERT_EQ(0, wait_for_pid(grandchild));
+		_exit(0);
+	}
+
+	close(pipe_fd[0]);
+
+	if (geteuid())
+		ASSERT_EQ(0, unshare(CLONE_NEWUSER));
+
+	ASSERT_EQ(0, unshare(CLONE_NEWPID));
+
+	/* Signal child that the new PID namespace is ready */
+	buf = 0;
+	ASSERT_EQ(1, write_nointr(pipe_fd[1], &buf, 1));
+	close(pipe_fd[1]);
+
+	ASSERT_EQ(0, wait_for_pid(child));
+}
+
+/*
+ * Similar to pidns_init_via_setns, but:
+ *  1. Parent enters a new PID namespace right from the start to be able to
+ *     later freely use pid 1001 in it.
+ *  2. After forking child, parent also calls unshare(CLONE_NEWUSER)
+ *     before unshare(CLONE_NEWPID) so that new old and new pid namespaces have
+ *     different user namespace owners.
+ *  3. Child uses clone3() with set_tid={1, 1001} instead of fork() and
+ *     grandchild checks that it gets desired pids .
+ *
+ * Flow:
+ *  1. Test process creates a new PID namespace and forks a wrapper
+ *     (PID 1 in the outer namespace).
+ *  2. Wrapper forks a child.
+ *  3. Wrapper calls unshare(CLONE_NEWUSER) + unshare(CLONE_NEWPID)
+ *     to create an inner PID namespace.
+ *  4. Wrapper signals the child via pipe.
+ *  5. Child opens wrapper's /proc/<pid>/ns/pid_for_children and calls
+ *     setns(fd, CLONE_NEWPID) to join the inner namespace.
+ *  6. Child calls clone3() with set_tid={1, 1001}.
+ *  7. Grandchild verifies its NSpid ends with "1001 1".
+ */
+
+pid_t set_tid[] = {1, 1001};
+
+static int pidns_init_via_setns_set_tid_grandchild(struct __test_metadata *_metadata)
+{
+	char *line = NULL;
+	size_t len = 0;
+	int found = 0;
+	FILE *gf;
+
+	gf = fopen("/proc/self/status", "r");
+	ASSERT_NE(gf, NULL);
+
+	while (getline(&line, &len, gf) != -1) {
+		if (strncmp(line, "NSpid:", 6) != 0)
+			continue;
+
+		for (int i = 0; i < 2; i++) {
+			char *last = strrchr(line, '\t');
+			pid_t pid;
+
+			ASSERT_NE(last, NULL);
+			ASSERT_EQ(sscanf(last, "%d", &pid), 1);
+			ASSERT_EQ(pid, set_tid[i]);
+			*last = '\0';
+		}
+
+		found = true;
+		break;
+	}
+
+	free(line);
+	fclose(gf);
+	ASSERT_TRUE(found);
+	return 0;
+}
+
+static int pidns_init_via_setns_set_tid_child(struct __test_metadata *_metadata,
+					      pid_t parent_pid, int pipe_fd[2])
+{
+	struct __clone_args args = {
+		.exit_signal	= SIGCHLD,
+		.set_tid	= ptr_to_u64(set_tid),
+		.set_tid_size	= 2,
+	};
+	pid_t grandchild;
+	char path[256];
+	char buf;
+	int nsfd;
+
+	close(pipe_fd[1]);
+
+	ASSERT_EQ(1, read_nointr(pipe_fd[0], &buf, 1));
+	close(pipe_fd[0]);
+
+	snprintf(path, sizeof(path),
+		 "/proc/%d/ns/pid_for_children", parent_pid);
+	nsfd = open(path, O_RDONLY);
+	ASSERT_GE(nsfd, 0);
+
+	ASSERT_EQ(0, setns(nsfd, CLONE_NEWPID));
+	close(nsfd);
+
+	grandchild = sys_clone3(&args, sizeof(args));
+	ASSERT_GE(grandchild, 0);
+
+	if (grandchild == 0)
+		_exit(pidns_init_via_setns_set_tid_grandchild(_metadata));
+
+	ASSERT_EQ(0, wait_for_pid(grandchild));
+	return 0;
+}
+
+static int pidns_init_via_setns_set_tid_wrapper(struct __test_metadata *_metadata)
+{
+	int pipe_fd[2];
+	pid_t child, parent_pid;
+	char buf;
+	FILE *f;
+
+	/*
+	 * We are PID 1 inside the new namespace, but /proc is
+	 * mounted from the host.  Read our host-visible PID so
+	 * the child can reach our pid_for_children via /proc.
+	 */
+	f = fopen("/proc/self/stat", "r");
+	ASSERT_NE(f, NULL);
+	ASSERT_EQ(fscanf(f, "%d", &parent_pid), 1);
+	ASSERT_EQ(0, pipe(pipe_fd));
+
+	child = fork();
+	ASSERT_GE(child, 0);
+
+	if (child == 0)
+		_exit(pidns_init_via_setns_set_tid_child(_metadata, parent_pid, pipe_fd));
+
+	close(pipe_fd[0]);
+
+	ASSERT_EQ(0, unshare(CLONE_NEWUSER));
+	ASSERT_EQ(0, unshare(CLONE_NEWPID));
+
+	buf = 0;
+	ASSERT_EQ(1, write_nointr(pipe_fd[1], &buf, 1));
+	close(pipe_fd[1]);
+
+	ASSERT_EQ(0, wait_for_pid(child));
+
+	fclose(f);
+	return 0;
+}
+
+TEST(pidns_init_via_setns_set_tid)
+{
+	pid_t wrapper;
+
+	if (geteuid())
+		ASSERT_EQ(0, unshare(CLONE_NEWUSER));
+
+	ASSERT_EQ(0, unshare(CLONE_NEWPID));
+
+	wrapper = fork();
+	ASSERT_GE(wrapper, 0);
+
+	if (wrapper == 0)
+		_exit(pidns_init_via_setns_set_tid_wrapper(_metadata));
+
+	ASSERT_EQ(0, wait_for_pid(wrapper));
+}
+
+TEST_HARNESS_MAIN
-- 
2.53.0

