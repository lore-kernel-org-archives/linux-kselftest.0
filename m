Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022084.outbound.protection.outlook.com [52.101.66.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD683932D0;
	Thu,  7 May 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143759; cv=fail; b=HPO1caZRS/njxcgpOWF7BWnnfNWEv6+cxyQrQLAxRR9A2wC7uwXCrVGnCQhHM8WpHFQpiKXfkgQd8rCfv/QHCGop2IufFiKE4RZQNYssdLO0o6V1YbEq2Sg4Ab2AfIwl+dk8cMaJggqLktVYhyA+FypZOFUMc3UxPtGAbhcexro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143759; c=relaxed/simple;
	bh=lMK/sYKUeYGh91ASi8ulClEFH/tmIWk0NTuSgqCl7K8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QUw6gTmXHEbXTeriyb9hdBwCMbgJFxCz/YqFmZRP4eB6as82vyyBUkKHkR8x2ld7bDrF977KhJYwkxXWgusQTczniNtNliTVKQrlMPM8GpfPhujc+xAnm/qMaVSG74EThKaLTOkCqXA0kCJEj2NJbniRl4JTjpTUZXeHBTOnn+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=3D4dLhQp; arc=fail smtp.client-ip=52.101.66.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="3D4dLhQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMbaP4N+wm2M9YzSApLBdRGEIVfAZ9dOlS6OJJtJPlN7uxgvx9wV6oCL1Gz9mnaHc+IxW6hVSFz68TplGCxNii8Nv7rNqWVODNbwe2A9w1XukIH827qHduAnyDYbAxEH8gbZEyKA71Aks/Hz/JTWrGtpQ/x6MerA+qHf+ilejdOZEg5KXIcYsL+YRal7IsB8rZ8ZQ8SZohCjtSBtvdUI3ykp/BRaOcqut1f870lc79QBgzoO83aHQnVkl28Z5/Aszwq6M91kpQCLaKrXArCmLP6hMzWdfOcWHzVf/4V6It1Pmi64TBQqzwWhiZV8b/FhIp2deXkUn9iQhT/2AMVprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FimrHv7wfE4vuVMDBq+E+GWU3RNUTIolft3v5DhLwgA=;
 b=ooz0qdhAXc+ZxHYROj1YPYrbFeyiir58Ub+Ph/S9UMaQQxyZOgI/aWrxgsSppHN3ByuMrJ5CDGFysSJ2bat6BZTKqhRbbTMizhmzIPmQeOO2+RYWKVhOS8i/0kkrdz11D/p2Wo0SA3vbhbKIoYlrKt1U9J2qjbtpI0deuyCTf2PRCfNnXHF34BzvEIVs5mO/3HKhoCSIVD8IR6HTonX+eHY/uVrN0ehGDCrvjgMSHaSIo7zd3S+AXoTsohiaikJVezeRHMMDIlHIJZ7BuWtdg6nbvjyJeSMj53olWrs6EdzhDFYc0f71C8YsiLxfihGKwlzmWVcxMQVsp3JqPoc1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FimrHv7wfE4vuVMDBq+E+GWU3RNUTIolft3v5DhLwgA=;
 b=3D4dLhQpvZX26Me6C8TfF4cBv/pqFtqmQY4yi9hbE5nn2+FCgR5IC+lGTDopiQRtVOLQXfU3mBpYY3XwsFvgo9izi2zgACnWY4XoC2CVZJzeDfZrZjiqo5sH8Ga355TMNGtv1GCQDcRc8Gf3joXN16fTnH59MMoCZ31iIH+xG0YT+1cCS9nDGfaRag8BF6QYsa6eX9GhqCPx9+5wymugwVXGJ8xOUFZLGPzNLE405efqUCFgotZJ17MEpada+QslXo9jb1LPaGjIGvPnjpwp0WWAgu3wzPxS9rS1TJbqLEkaTPIu971cir3iwW9GgGLua+XpVuUq9U6aiBmggPV/Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by DU4P192MB2472.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:573::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:49:09 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 08:49:09 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Florian Schmaus <florian.schmaus@codasip.com>
Subject: [PATCH] kunit: fix use-after-free in debugfs when using kunit.filter
Date: Thu,  7 May 2026 10:48:54 +0200
Message-ID: <20260507084854.233984-1-florian.schmaus@codasip.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::12) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|DU4P192MB2472:EE_
X-MS-Office365-Filtering-Correlation-Id: 147f46a0-5638-4239-26f0-08deac1580d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gK2hTo0WqxREppnC/qUC8w4oKXX0R2RLquo1vDNmUbxA0v7MgWJYVKzrn5aNj8pLB9DAWkoKkslwBKg6HXKHF0JytqQIHsoFpcDkgCYK+omWSZWlgxyvM8qrazv+26NBr0gR8vY5t7/MkqIJOPYc3ecVbOJcl52KMCTft99eVRSDBohkVo9t4qF+riR1R5dJrawszCduafCw635ruFDFgrJtcAEgPzXcy7ERXd2LriLShqQluAQUVp9Gz/qfdjhtquns8XtJFL7vLsG8I38aaXsuRSetL03/J9Nn5Tm1DpzVqeXRbjobdZCH0jLNFVowpBzv2JIkAN633sSKLxIcCrQZ0nxJy3xnFyM2plsrumW9oVF58nqd9Ql/P6ULnUaQSmDnGGp2IxUA5LH+ylb0UgrlVfQ82m5yGsbjOaDkb6wFpb30q3qLPN58nL4WnbOWNz+zIpwY26IkXQ7GMCrGlxRC/ob6L9ML6J3ssK3MrVc9JjO0lyzVJUZnDJG4cHVneFf09aI2V+YGNtEsHtqmDoB8NdrLo3PFtdmOmsCGRKooEMRS7sHjVP4diWuKVAoQ1X8ZCDPeEZ4dKKniKsVdSxfAfWD/r0EkkwiT7f/w35xjAt9rtVi12KBYnL2rv65Mqin6kF2A+Zc49ceQM9IqV+Ryva/aoU6icw/8oWDLrEGKbLHFEwXj7Wlx6J2fsNom
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DpmqMQ5wtj07WwWx4KKvUXlUR+vl3yPcNA+ISG73+dNNrqtB2A8N8dOYCtau?=
 =?us-ascii?Q?CTDdITU8rjNBj0Fte1PnD3h1qM5QRuIVTlhhTxwAnR2G+V89xiigmzkezIeq?=
 =?us-ascii?Q?KimbBUV/FiYnhAhvK2KfHG09CcaPRPOZn3OdYYo6ltGbXJBkOMRKcw7f9r4b?=
 =?us-ascii?Q?fwymXyNsa9TRkf1cE61nRkMeYUtjvxtFVrZVnvT78cAfC4vlKNAjpwCnpqRl?=
 =?us-ascii?Q?QuzjqYXyv9Chxd8WPxahNeUZBdTNPLic3SuIPymJfK5B96a5ewHkG3E7mtWG?=
 =?us-ascii?Q?+9dGizivsLRqfRp3xvRhoNsLHhlXgDGfTuOhq4O2izCtVmA284FzIPCkQK47?=
 =?us-ascii?Q?v1Q8GvI9eVXaRcnW8TzFtd3FcqSyp+H2lhQ3MqvtJQCz75pGWBcYOs4m7fFF?=
 =?us-ascii?Q?BfURVWmJ21ZHRVAtWuxD5pAniiTMjEHrpsoglEXd3rj+wotFacKYAWvv91iG?=
 =?us-ascii?Q?k769mrABLoSii7MIkbs1z6W7byi3yzat+eOgszcodIGMVc0e5NmGdaiAB0Zl?=
 =?us-ascii?Q?S3FJQ2vv4UJLjOpINblEVnIsjnu2myTwNdHWRtEwA+ADI3uEAc0HzXOsqqQM?=
 =?us-ascii?Q?2ZHzmHhlsQb95K7TVzt21hCI24XhDuHQg51mBdC8YrFtr9P8BbZZHmUnwBJf?=
 =?us-ascii?Q?7CwI7z6SNI32r/a5e0Dof5VjfeOO2P3n5SZ/oyl09GtbAJK9hBUmPKRqLnIy?=
 =?us-ascii?Q?QV3geBOtWE/kx7kT83hqgyQ4G6gqEkW3BzudSBn9REAEm9ohd5udBj064xfX?=
 =?us-ascii?Q?5eRhB+fN/UfKXeaF7RZl3JZ2wEeoD7l6WTDp43UeZq46fcJoQUS1fiwkuSXE?=
 =?us-ascii?Q?cEwtjJ2KGCbhxn67oswE7HodW9dJDjqK2lR1OF5zSow8VyMLcc4abLNcn68I?=
 =?us-ascii?Q?nCGMQn2++zApc36suGM+Yr3M2krzHjEsJldppB1nPslx6VpdHhF7EcIDeW7E?=
 =?us-ascii?Q?tgklyu+HaOJMxQU4d8QHM+7FhIxbOxTjr9DpAeI1Z0rQHpZ5L9OloXSNpniN?=
 =?us-ascii?Q?U3ikq7wOVRru8G8saJlWjg1T7H3wxU0q8gv/jiMIFXwUx+j+dvzGZlPY2nOa?=
 =?us-ascii?Q?F39G/LnCmQ66U8KvO8D0Y1Zn56/ex9kR0qOEiRv6LyUen7Zhj4qwn6uGkcCX?=
 =?us-ascii?Q?Hcni/A97AEpAvfvzLRgKDF9543g94gHyvvOYWv+mlp125wMkQBQxXtTeovaG?=
 =?us-ascii?Q?6dqfDIuSPADxt74T9bPGKyu5Okjj203QAYxskQlNYb22q/YuE29aRDrC1q3O?=
 =?us-ascii?Q?OcMB9gTQa9LjjXCP4ek2wav6At+zsR7c9QuemYrlLl1AfCBEW3M1JPjZxVkc?=
 =?us-ascii?Q?SdfjWJd4UE7B5lGLfpGZV1WTn05h8AqlKs25aB2I7fg4NAkQvawU76O50H6I?=
 =?us-ascii?Q?n0FRiwfP8MFNf/rTQqJ3QnGbHWHzzdZP9hrewNxbGzG6x9vFSJy8CZL2grdI?=
 =?us-ascii?Q?U1eCPtUcqo0N/X+qqQM6iYuYxIN1of0XPvheIYevT/qFm+m1S2Snv0nop7x5?=
 =?us-ascii?Q?4PnRuRvD7NCo1hqhQRAbdMdnPm4+2ExVxVmef3huTCdG2KVxtldzAW5Iw35z?=
 =?us-ascii?Q?JYmtlUCarnHZDG8DIjAmFh/ZL2sQxZYQ3BupeRgJEAnntBh/Hfg9b5koqm6G?=
 =?us-ascii?Q?8JCGiRYKhA9wl/5jPSnwTiTHBjHDHApzaGliT4jnSN/SLuMCsiqo65oCdv5L?=
 =?us-ascii?Q?2vVVQ94Pk8aq2IoDcuxl7AkbWJZVO/sLWthrL9ajQMOvyCVlkHmwG1TOUbld?=
 =?us-ascii?Q?SDIFHp54DxGr6AOXpvtpTdDB4M/yemar0klKGXkD5DTOMRNJ1lupnUSjW6o1?=
X-MS-Exchange-AntiSpam-MessageData-1: XVX5ep7bnqtrlD3+6XjWNi5Pmq7fKqcfTjs=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147f46a0-5638-4239-26f0-08deac1580d0
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:49:08.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luk2thhd3SZK2SLqoX3xZsohTg76jn4L+jVWGdnRkwWiMWtVyxtUK1a9YDkC8UFGSVInemswV7GK9bv/xqlqmYZIANjWKQ1TDZ3zQxf/4mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB2472

When the kernel is booted with a kunit filter (e.g.,
kunit.filter="speed!=slow"), the kunit executor dynamically allocates
copies of the filtered test suites using kmalloc/kmemdup.

During the initial boot execution, kunit_debugfs_create_suite() creates
debugfs files (such as /sys/kernel/debug/kunit/<suite>/run) and
permanently stores a pointer to the dynamically allocated suite in the
inode's i_private field.

Previously, the executor freed this dynamically allocated suite_set
immediately after executing the boot-time tests. Because the debugfs
nodes were not destroyed, any subsequent interaction with the debugfs
`run` file from userspace triggered a use-after-free (UAF). On systems
with architectural capabilities, like CHERI RISC-V, this resulted in
an immediate fatal hardware exception due to the invalidation of the
capability tags on the reclaimed memory. On other architectures, it
resulted in silent memory corruption.

Fix this UAF by properly coupling the lifetime of the filtered suite
memory allocation to the lifetime of the kunit subsystem and its
associated VFS nodes. Ownership of the boot-time suite_set is now
transferred to a global tracker ('kunit_boot_suites'), and the memory
is cleanly released in kunit_exit() during module teardown.

Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 include/kunit/test.h |  1 +
 lib/kunit/executor.c | 19 ++++++++++++++++---
 lib/kunit/test.c     |  1 +
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 9cd1594ab697..ce0573e196ce 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -613,6 +613,7 @@ unsigned long kunit_vm_mmap(struct kunit *test, struct file *file,
 			    unsigned long offset);
 
 void kunit_cleanup(struct kunit *test);
+void kunit_free_boot_suites(void);
 
 void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt, ...);
 
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 1fef217de11d..b0f8a41d61d3 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -15,6 +15,16 @@ extern struct kunit_suite * const __kunit_suites_end[];
 extern struct kunit_suite * const __kunit_init_suites_start[];
 extern struct kunit_suite * const __kunit_init_suites_end[];
 
+static struct kunit_suite_set kunit_boot_suites;
+
+void kunit_free_boot_suites(void)
+{
+	if (kunit_boot_suites.start) {
+		kunit_free_suite_set(kunit_boot_suites);
+		kunit_boot_suites = (struct kunit_suite_set){ NULL, NULL };
+	}
+}
+
 static char *action_param;
 
 module_param_named(action, action_param, charp, 0400);
@@ -411,9 +421,12 @@ int kunit_run_all_tests(void)
 		pr_err("kunit executor: unknown action '%s'\n", action_param);
 
 free_out:
-	if (filter_glob_param || filter_param)
-		kunit_free_suite_set(suite_set);
-	else if (init_num_suites > 0)
+	if (filter_glob_param || filter_param) {
+		if (err)
+			kunit_free_suite_set(suite_set);
+		else
+			kunit_boot_suites = suite_set;
+	} else if (init_num_suites > 0)
 		/* Don't use kunit_free_suite_set because suites aren't individually allocated */
 		kfree(suite_set.start);
 
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 41e1c89799b6..99773e000e1b 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -1075,6 +1075,7 @@ static void __exit kunit_exit(void)
 	kunit_bus_shutdown();
 
 	kunit_debugfs_cleanup();
+	kunit_free_boot_suites();
 }
 module_exit(kunit_exit);
 
-- 
2.53.0

