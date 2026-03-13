Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C6372EFF;
	Fri, 13 Mar 2026 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400237; cv=fail; b=RPhvr9VgC00aFTNATLKCsAzHZVeGGSnuQBgSBAREz2nrugRF8XTD2qmNyolhaGgAY83iKW2GFyRyLe8JLyrFqDVvE3+2BxC4HjgPJImG4mbXZq1PqgdiVyjESMZLa6ASiBUz/3pfS8qyt2ScYaeIEPQHXn6shvLZCaUFoWM7Y2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400237; c=relaxed/simple;
	bh=UqYOyCFaTfm8F78frB9Vi3xC16qCe9eGT+0UB0X1hfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJqCVOT8CFIVBVHjHeMDRRgm5yQQ7+DX/W0tVTX8DuMUnZTCOlhN9TEawUbACwZQUdQaayw+6/R1b4ZFKiU4zlqur7n2Q4nBqz9fMSYJdtiIPaio1RKHbM1kz+gb703cDs2opw5xbbUllkSP+Htg0o3oIGCimes0kOR7+EMVNZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=kUloM4or; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="kUloM4or"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqYL7P8ogVVUNpCuMiWGZ6KbaqpdJq7hzN9tU5p0CSd5+0BOqHdEjYDsuSBz7irR6hsVjP48ELcBVE3mjROzQguQIkS2c8pwMDhqz9wfTRd/PSI4F6LvOKgvDNcJ0Wl2d6hV2AA1r1+nciu55xU7Y4csX+gWu2xzuVnztnRzq3DIzggiMvSCBVTczRUHg1ddRME2RmkXbnuTKN0kvSOyZaXpYWJMecj2GoO5GVthL6vy49wm9LAmZohupz36x2z1gDwL20CJoNx8qKyxL/VZz6M01NvR1GFzdZFUPWUCF7SJg+yXTF5LLCgXl4F32PV2E7B7DyYKhun0BSjXZIIQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1o3xBsj7q4cpla9Ocgs6Kp0/biHrZZ6yne4uA2YsRs=;
 b=hBGzSVcBrG7Av7cszHhYZeQPYGXT/D4JQC31huFLwDUjBF4Nxnah3s0vjWyO25la58EADR/4rGE0JK91OMzdpfL1UdD8O1j61xjUez2CUzDBdC/5Tb8bp4lN+eN8Av8B5r6EJsFA+wZqZcBUwkrMYVU4S+GvAScPPjLMU3+I5El13tiX11Tr+aEwRdlAIf+mvhT5i3kzHc8b1dfyL+57iQGQtjZwGhyP/CL5KYHdQz3ieeKNPaha1vrK1vccAwLKQooU/9X0tbuabhQj029KicpRFAqmeLW8BCU0B92IlnKHhQHGaGKAdkQLRtfXf1pV132vHvdiszPQ2u4ttRglKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1o3xBsj7q4cpla9Ocgs6Kp0/biHrZZ6yne4uA2YsRs=;
 b=kUloM4orDiiGZVLYPhByCvhnUDdN/vcd1A28xV2m+xLEdEh5LfiAWcO2BlUTvixvmcEHMbvu3sRtVsG4NcTKp8rBEXXJW0Ib/Ib+1I0CY7+6QEDVYc1iRZaAkYxoJZz5/8fmwpRlaZbzDdFCxjCRYTxzA5UNyouxp6B5LsZFAXGk8sulg+N+2+L0/Hx5vgXdSJogtHRIxPhz5BzVMo8m/KNbST3aYVLGhXeZX518Jk7QiVjN6ALWtAIgm2CBdraXd98+YMYjRVCq12yN0Haa59TRT+hmuIkIGuXENNjT/UqM9LvYT7GEzXoCtHRW+wQ0A0NMmERdw2o4Iv6pRPemIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8)
 by DB9PR08MB11361.eurprd08.prod.outlook.com (2603:10a6:10:60e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:10:32 +0000
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a]) by PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a%5]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 11:10:32 +0000
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
Subject: [PATCH v5 1/4] pid_namespace: avoid optimization of accesses to ->child_reaper
Date: Fri, 13 Mar 2026 12:09:39 +0100
Message-ID: <20260313111014.2068913-2-ptikhomirov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4424544e-d550-4caa-6070-08de80f1245b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0QAIGY0h91XXjqZNGMqhbdcvb87eR1ixPEnghR5dR6/hoZyFtWXxEk7xcpOn1+vYISYY6SEs+F7hrTw2PzhypVsbEIz5flnW+r9j96IjpUV1a2iDuizo7/Kv4uv0MNi0PHXvFmxRF6zm8rBReNu4tAs/6TptSbZKU8YKlJZp4JiF1DESI95FAzbg7ASFyVHOvyT/f2CTyIPzE/5VL/HA7sB0uV+Vluyopbt6+vA9EmzD4mmkibyHasf5rA9p/eSXBB3wM91oAGtQV1aSH/DeFQnX7UHb1FlVJ6na63WHXW5XubWzxrNM9HGLiEDxa/nstSVNfSDRJHOrfqXYjB/IpY1UDZm4ahJMFDSPYjX4uDlFgq/LqP8EUKronUEb+IjRnl3N/20R8AO4Yip9NLVXrRL10Z4dGrm+t5WI8Lj4hCoGh9eQvbfJ7mkhU3lxFw3i3vR8G/VMuFdXYoh0Mis2RmY6KnQ9+wggXEyrH42F+k6oIxVOPrgyNZm+RI6sSH5Ws6hAEY68Qa0Ohb3zsQOOL/6lQKA1PUqvo/IQMgrKbvZLI1lZRomC+VEOEauriWeU21htobOZf2YJ4HYkodmV+SOW+E9B9imuhbjVpDsgUckepkVYsRuFpWEkQH83cjeGH3L5q5dINvFi9NkVZaYW1088/T2tt2LYbTNPNNm1G5Pqlr6v6Humr2q2q6CfbYRa41F8BAsoX7+jqQn43pS+b54FhpSFDnF3ysv/lTPlS/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9008.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xHLHYquRvnF+503QbCItN2SpNhrhXGS4NZgd1WjeuORCAtgmkypyAK3GExp?=
 =?us-ascii?Q?1Tk9tkry5Vu9e9jvboe3oXDIrmOmAbVkxbbXaFdUhCot5tWflKGvOuhTe3Yo?=
 =?us-ascii?Q?j/nrpmqKQP344r8qRU3xARFZSBFDCSFWrVYvk07xdOt+4ArEnN+FYSy0a+Pc?=
 =?us-ascii?Q?XQmuQk7WE2v22cVyCObhTZoparR43JbodU1Y/Jrtm0TruF8BusOBxP2zpv9w?=
 =?us-ascii?Q?naxwrm2tsMUCB8lgRtsBxihW8V9+IX+ei8k+nNwot4kHtgMGLzql4Pj2EcvI?=
 =?us-ascii?Q?9PSV0b2Slv9tZUfTASYZHhi4QEHktFOmJ9hzQ86ZaA/9Tk3D2au2UttOCuy7?=
 =?us-ascii?Q?HunRDZbQXucMvjgF7CZFCWGi8KvMyqZs00u30QVGYUuMPuxWort0pd3Ayl39?=
 =?us-ascii?Q?FOnP1wr5dTDzGtU7K/hSorqozy8pvdet/Nnv7BY9WKqeAXkP38ZHUZcFAPGP?=
 =?us-ascii?Q?Et8tcs3JBv3ImVyjUU5Mkm5ARAbuUgDozu3aY05rh/q//WDYTfNykIQw63t9?=
 =?us-ascii?Q?pkO9T1A6srjy2i9CAuDo7AG4Z0DHGt7vmiv+R63CAwtMpqGBUz73YMyKH14o?=
 =?us-ascii?Q?0Y4P697Cn/WIWCT7v8AIKcMCAK3S7iAxr2AsDYIYFPULJji4eTGPNmLXS8T2?=
 =?us-ascii?Q?1Pvof6wtxfKCsJ0lkGFj6rDk3pjQF3XmvDxRIesqNNT2UlNkSBTj2ohq2KSd?=
 =?us-ascii?Q?fPJ92KKAIYblwgIu8VpbEEnmHjM3fnQ83UswSTMTm3W/Cka1Iw+JJc/P+Xri?=
 =?us-ascii?Q?gSl+BTCpfVvwGHzs84w6zQjbzaQLEp4lXprTT/RUNE6h3rxuzIX2r0MhixSt?=
 =?us-ascii?Q?sc0NMliyWCSb95XR8e5sN6T3mlZL6TvILmkr61tNQotpgXyM6t/qZrsyPaCG?=
 =?us-ascii?Q?a6SlfCA2WgVrw5Kke7ZNhpJT7wtNqW/5eytvrEn0R+6746WLC4UKsKw9AdUn?=
 =?us-ascii?Q?gCxhKDlZ4AOshn2NCNNPloX8XlZdmlwO9UVwzOYgS69QQob6TBQm055t7HBD?=
 =?us-ascii?Q?YAjrPE7Dl1bHQWudef3nfcnGr0dDVOA2jzeOm4s7AWgQXS+tpHmSHq4YzU0n?=
 =?us-ascii?Q?CfrIb74m1RZRhRbfaO75YcbZ3XJ7L8YhPfbMl+Gv2NI39hLC7wNUal/InNHk?=
 =?us-ascii?Q?iWZCAWcjZSbh51r+sniEkBhM0PJtmGQ1mL/+KK+/jZgUoJAJNQGHyLBqMUaM?=
 =?us-ascii?Q?xAkCVF5jFT1rvn0x75/KrKST8kUJCO5RUhOGYOkJ6kIghLjU+oXKPu/MV4Bm?=
 =?us-ascii?Q?XVs7J59GGc8iDlwrMT58mSq5lopdXmrv4SepVQ5MV1ORiouJ2DGiD8s7Qdxz?=
 =?us-ascii?Q?zRur/wIbAlMAnj16eq61e0KgOVyWdQqtJfUqwElsVh+qtOfOEDOokh0l9zHV?=
 =?us-ascii?Q?16oEeklsBrOSqV5VcDZnmxZhlWdP81nz6PCByMzV9BKeqhwDQ2g4jvDIrvFk?=
 =?us-ascii?Q?4JR9CtGR785F7vwm5eQ+f1rub+OGplAv6Ao0dS46/2aPcU9GrBoGmeygmxQy?=
 =?us-ascii?Q?AiKa8Z6B3ReQdQi0fnZ5Y8Sa9aHmv6e83xu2xbdtimZyPPf6m2b3LsV+7GyQ?=
 =?us-ascii?Q?iOa/AaNE52gn3+ybSb94uZssGc2Don/x9RArBNrYqeubiHiXxeLLEEI9HmMY?=
 =?us-ascii?Q?32bmzLvGqBbD0zxSJw+z9JpV6tR/jAhCXqnqhLnSBemkWHiN9OIJ8UPBkvaX?=
 =?us-ascii?Q?/iBhodTgsTuy8mnXcr6DbosGl7sjHvWbvqav1LqsId1xY1C4XiG8KfQYMumb?=
 =?us-ascii?Q?z60S8+oh52Q64pJAnKHR/NT+jD4mWa4lSO2lSE98LsCO0NSSpefZOnxrR80y?=
X-MS-Exchange-AntiSpam-MessageData-1: KygUmPywrYe25qIUNULSCxNjt0sWeJh5A58=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4424544e-d550-4caa-6070-08de80f1245b
X-MS-Exchange-CrossTenant-AuthSource: PAWPR08MB9008.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:10:31.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhwuRf0xpvQQIXY6XwSBKBDeI+3gfxJko0dLRvLk2IsUwaKAskzAFSJdbDGBapOraRnWdJGyPNBR54UpY3c4dMglae3x0NgpcW/qXh4bwKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11361

To avoid potential problems related to cpu/compiler optimizations around
->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
everywhere we write it and use READ_ONCE where we read it without
explicit lock. Note: It also pairs with existing READ_ONCE with no lock
in nsfs_fh_to_dentry().

Also let's add ASSERT_EXCLUSIVE_WRITER before write to identify to KCSAN
that we don't expect any concurrent ->child_reaper modifications, and
those must be detected.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
--
v3: Split from main commit. Add ASSERT_EXCLUSIVE_WRITER.
v5: Add one more READ_ONCE for access without lock in free_pid().
---
 kernel/exit.c | 3 ++-
 kernel/fork.c | 5 ++++-
 kernel/pid.c  | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 1f32023d0dbe..25e9cb6de7e7 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -608,7 +608,8 @@ static struct task_struct *find_child_reaper(struct task_struct *father,
 
 	reaper = find_alive_thread(father);
 	if (reaper) {
-		pid_ns->child_reaper = reaper;
+		ASSERT_EXCLUSIVE_WRITER(pid_ns->child_reaper);
+		WRITE_ONCE(pid_ns->child_reaper, reaper);
 		return reaper;
 	}
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 7d369a8a2ad0..19a75a041e6a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2428,7 +2428,10 @@ __latent_entropy struct task_struct *copy_process(
 			init_task_pid(p, PIDTYPE_SID, task_session(current));
 
 			if (is_child_reaper(pid)) {
-				ns_of_pid(pid)->child_reaper = p;
+				struct pid_namespace *ns = ns_of_pid(pid);
+
+				ASSERT_EXCLUSIVE_WRITER(ns->child_reaper);
+				WRITE_ONCE(ns->child_reaper, p);
 				p->signal->flags |= SIGNAL_UNKILLABLE;
 			}
 			p->signal->shared_pending.signal = delayed.signal;
diff --git a/kernel/pid.c b/kernel/pid.c
index 2f1dbcbc2349..bb2bb6c16498 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -128,7 +128,7 @@ void free_pid(struct pid *pid)
 			 * is the reaper wake up the reaper.  The reaper
 			 * may be sleeping in zap_pid_ns_processes().
 			 */
-			wake_up_process(ns->child_reaper);
+			wake_up_process(READ_ONCE(ns->child_reaper));
 			break;
 		case PIDNS_ADDING:
 			/* Only possible if the 1st fork fails */
@@ -218,7 +218,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 			 * Also fail if a PID != 1 is requested and
 			 * no PID 1 exists.
 			 */
-			if (tid != 1 && !tmp->child_reaper)
+			if (tid != 1 && !READ_ONCE(tmp->child_reaper))
 				goto out_abort;
 			retval = -EPERM;
 			if (!checkpoint_restore_ns_capable(tmp->user_ns))
-- 
2.53.0

