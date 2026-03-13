Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20666377014;
	Fri, 13 Mar 2026 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400249; cv=fail; b=ZYoon6DKHsaTZY30+pSSZM12kCmG8MSlfxSDy/GmXLtUKP7mbqP9szy01LUJU9FoIq2AhZIOqwcrHIip071uKu7esxO8m0uPKDNU4fn/RVtIBBq7JZkXjDnySs5LgYooDWhrrZHMWM7tNsag/TW74eUXiFmc9RZK1hE0lHQKwTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400249; c=relaxed/simple;
	bh=30gJNMxnv/gyy67CLL+KWGnyQSCiXSd6y21Mj7jH9X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u0kLVOtttTzun/8Hcwjdc05zJ0cDisxkTaiaZ4yBwbDFfIPjLF4fzXDFO1qkLwVM4AvSyXYvu+P8Mng/fU4M6rhezUCiI60DVCsIgPBCH7Q7xYZ8uRgMw6zfDOebiF3TI0cLY5irF8IfqasesDRvYjYwI6vr+Ctb6QPfvAsAEPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=BShAm6i3; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="BShAm6i3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0Ad6FUhr7bZ5vWOLd2NX/VMutaZt+usiPqedoM1M966ZbC63e1sLvu2ILfoclJVPMLmLNgt3MCCluAyKX+7w9Trs/af1qtSz41wBuLSoaHz3HY0iuH3NWT6s0GcN74B/x37HlLB9oQvTB5cWB8fuBBXslmxICeAlL7SqlxQ1v/+w0VjSoQybYoLEpea9C5OFVh6nEXvqx673iutd1gZ6XDEQ+YVS4iRt8rQUrcBNPhhT0UrfRLscRIEL8DMe+0cBtDPYARoG+O2fsxeWcS0RZfQ9LpamNQzimku6n+2+E3e/5hQ/zSRiMOOtN9fMd7D0SW5r/ycg9bfBWyhtC63Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=kkO3HArfZtb2SbqU2GXG+3WexA3chHVmjS+SD3bO+fmGMjvqoxBZs/WuAF2RbAJibPnQmL02/UYJk2C/yUy9cBH1GGoXgSFXLNTi4mRH0Ix4VtadBwY9/OUyoN96+3C2dv2Uaay3T1pCPtCQIc431q1S9cI0IKbpIyoHSEpxMfz1Ik08D77CatKHvxo+fxAWcb9lleVZCS8tgE5bJXfRrQ4wHZHd0zYdEmu1YFJR57dpd0dLd0V1DnDQLUD+zimmO2Ld6JhxhF2mjLf9i7DNgp9Cxq1cWoSZqhnjlaKnbpDk1d9O5wINxYEyNwYfsJx5pH2gSSwfrScnuGs7G5LiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=BShAm6i3dh1nt/Yn48UBWjIEWQOu2izPE1AkjSGCU6hfPI0Tb4Cmn4thMNrwmbU1fdb8tm17HyiHgAER0lmyFiqbjQfWx+B469JJ03bf2BNmk6spSLVe8nJPcoU4f/A93Wm/cdN6CrGSPgLNRNDhYPKk0WL9EYP9M7aKLiCzkkI0g31/sRIWpVw6fbxzjPKryyE+JkHRCkDFQzFq+S47HCNjiiJX7GvrkMG0Ymu2Y8rIAa30zQMNECGVr8gLcGx0AIlb+d69usjBMcr6V1VsPJHC6I41R4vNOgoTKcMPRpXRGuXA9lMYUtDjnM+/LawPLMSZTS6APFBa7fXRdWBx0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8)
 by DB9PR08MB11361.eurprd08.prod.outlook.com (2603:10a6:10:60e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:10:34 +0000
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a]) by PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a%5]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 11:10:34 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
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
Subject: [PATCH v5 4/4] selftests: Add tests for creating pidns init via setns
Date: Fri, 13 Mar 2026 12:09:42 +0100
Message-ID: <20260313111014.2068913-5-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To PAWPR08MB9008.eurprd08.prod.outlook.com
 (2603:10a6:102:341::8)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR08MB9008:EE_|DB9PR08MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: d33a0ab3-6e07-457c-ac36-08de80f12612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZbcAxqgJahmOW4xD4y8iXWQmOnwCipUhO4WXbr+gLdqD0i9vsZ2jgHdJvWNbpvm/6M+tlpQ5qS/xlnHNP0P3rHl/pQ7ccjnqjHv7nOsCnWmzpMIekt1HPHPnDdXSxdA4WboFvPFoSWdECb02sfDA/MKwq8MXEDCDwb6uQRSv9m6O8k/TBPRbVlBD2LCXBBRQz1PApuijYm9Te2o/owCJJ9xzzPuiF3IP8Ogb66NbWoz/YEZuLNgYuLGvGUrUo+lpDFeM0ML0QX+16Ftk+MBQ/ycVxBAvDT8rFPiXg3wrS0tePwgvKYU75x01IUeiBe2yUWhpjLb4u1/1f+pScmF/nx5MBIdyKADNwgqECstmlkuzt8YEl2YXlMzZKwiuoa6MdDIl6LCtI1LVeeYtZwH4SpobGeihIWdSlXqgGhL0ddH7mVXvzL6YwYhQ9gsezqcNQ+VeBfk+h6HxBCsZbDYj9/3sm2XfC+b4jHvDBjIOAW2NFvcW1FjGp1ClqMlGkyUCnIAyDV915r95XEvY/w+0bfRZYzmWiL2r/NSflGdH1LtfqatBDE86n3t2YvXGhyQD2BlVHNypVuYhwCPe1XKwKsWRycP6MsqUe6gNwDT9pGwDn2aKA+DivkwsqUNig0Avld9k3c+5KT9vsx+49wKc03pZXP/Ioli2kkDXbdR9R1cGjhSwPZiBnAOU4YDa/aa3FnRUkU3QGy982+eJCZ/FyqNKCLCZycB1YbnNZ3sshNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9008.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRo4eYJS3RdiPplOinkYwAAwK0FQO9QawrOZKaySL2j1UdtynDT5h71H0AI2?=
 =?us-ascii?Q?6fJylgg3OIpyGpfTRd9uqcZVgEq2ZuiI9PcV1TIuSVgLN1e6epqWDyY9+LN4?=
 =?us-ascii?Q?rwTIHYF9cqJYqjytxz02WT7B1uYZDhWZm7aDtUpqJ2qYCaf+XT+4YIVPbLSk?=
 =?us-ascii?Q?/1L1wPKsLquh9TLOF5AvVyMAj8PwFddRVbAKgAFNe8qVkb4k5B8V8e3A/WOB?=
 =?us-ascii?Q?6cIKC15S0zajgbIcKVxCJ9tvYMCk0d0AdTYaDB1IO+m4SBaFjVZPLgzhcW5m?=
 =?us-ascii?Q?i4AxzFU+9S7cLg7a16EGWvQWsFPIOD1Z5GK2xUKdDIv6sKbmD8KL8ntyq/bw?=
 =?us-ascii?Q?+igzAoyLe4GMxNF1IpL9xDGfg4k5pZcxfq4idujNBRCP+ygxg76fh1SmJHNS?=
 =?us-ascii?Q?hQDEaPB1NBkF10xtge8fxsWS6BSOpAuxty0rFcffhyFAth/Ms5IYvCsdUh6M?=
 =?us-ascii?Q?Hl1ujneFZjjsDk24ewYubVNObB0lM52pDxF2om1q9iyGqRg5bDrChMyMbs4G?=
 =?us-ascii?Q?DP1Upxf3AztnURRoFtJVWRZoXubvvh/D/47spqoqPQpE/WSN2y9nOnb0wFKM?=
 =?us-ascii?Q?AsAXf/QxEwbG9AvS91qbLP+n+AiHUiQJTea39n0mN7bULi2FH67m9Rcj7nEZ?=
 =?us-ascii?Q?C/KTsHROc+9k/V2ofKnjVLesneGi/YX2WmG5ILsyNB/Bs72VSxTS5SZG8m2Q?=
 =?us-ascii?Q?Zi12Rl526N23boiyRTTxPAJoKYoMy7ysJUQRHamdoPXBakLCth+7UNF80p9B?=
 =?us-ascii?Q?x8Dijh/Kq+iuPG3UJhu95cd6plTXah2NrlzHet1rR0Xl4V+6bAvgWq3oKuhP?=
 =?us-ascii?Q?1rb3McxgNoV3/MpDIFjLyEPOEIYsSKnY8BGmVldjSx5d6YfVX1UNGwjWY8Yp?=
 =?us-ascii?Q?5TRm8rJY375n7DLwikl1anuwsx0U/4SxJ+TG0YflTQQkg23+MddxUbH2QnFK?=
 =?us-ascii?Q?U8gAShzuemiSvXanA2AeXmTDrwouTOEiNoSISjgU9wLPxihqfZWZjUCjQ9FK?=
 =?us-ascii?Q?KzOhrZJQ2TPi6hgG5cAPcOZdZeEd49Xgq2YHMHi8NgE2eZ2Jbmd/YHZjug4p?=
 =?us-ascii?Q?9OotoNzDsK8KtvLsb6+bxgeiK/QosN/mz/1Bb6G/c+nko9WkT5duRLdXiryR?=
 =?us-ascii?Q?Z8mDhtVhEJnV2j9VdP8QLNKNpy51TOpm6puwi0yEwRZ0UZqMFPp0XsnMysZF?=
 =?us-ascii?Q?61G2iBW7aHWesxZQK2/NHEKYCTdD8JA1NxpB6kx1NjEZmNH1vL3Xxw/dsmBs?=
 =?us-ascii?Q?RoxnwV38iV8VN33Chrby2xTsVC13cjFW4BlYjhGDI3yxLanwAcWYm8eVwZo1?=
 =?us-ascii?Q?WFs6WS9coBbAszF2AKVjvJQcC9FPlWdvp8mzN9ne4lUAKa9CU/zPOC84Hn0Q?=
 =?us-ascii?Q?I+9gf+dFwUMye9GFHSKOVOySEMw8mT7cevfJUsoA4ZtQSTFCPp9rC+N7O2+x?=
 =?us-ascii?Q?bpf4U/zZ8uJ7ToPsXL75UpIQIjZlfG6sKLiYFRqodXaYHo4tZD2+cAAbBBDl?=
 =?us-ascii?Q?ylp43MVGcCAG5duXVIIF+OjDhxK39Iq0b4vTLyfgxcbvzAj4IjAeCjSTNR/+?=
 =?us-ascii?Q?2q0Gnb2fkXhhLcgW+N8B7MSCn0SN+idf+5v9HQpTzznFCqRMkSp49+3/cg8S?=
 =?us-ascii?Q?9FYWG66XxKY5S7oHHZucHVTZUmy3RGRimjuydy1dJysI7Y7Spbz6tkZDfFGj?=
 =?us-ascii?Q?UHayrmEhFlP0MgoWWF3YfYFJoMp/rMY4xnx849fxQi6+m066ZVuEYRiNRQlc?=
 =?us-ascii?Q?/mwX0U0/mo9FURQ5kzvQ5gBODvPfyx69PtzhaN6uW613ZZcus4kH0/KUubWK?=
X-MS-Exchange-AntiSpam-MessageData-1: ZsuRVzQ0sRZV0wnxiA01F/Vp/0R8tpCBOFA=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33a0ab3-6e07-457c-ac36-08de80f12612
X-MS-Exchange-CrossTenant-AuthSource: PAWPR08MB9008.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:10:34.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAoYhDeiAbqAX9iQyrP7ESRq1duOoc2RKNXCJ+gbELN0rrRazGK64ItCzYcAsoZDQwDFmMoNiIINiAbyhYk6/4CwJIUkbsZKHnVKtZeaOJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11361

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

