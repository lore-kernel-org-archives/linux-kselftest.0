Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F7372B3B;
	Fri, 13 Mar 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400239; cv=fail; b=lpF5Wx9bLWyMyv2mHLN8jQAmgPRhH6zO0QCQk3+qWD5GDhxiuTDcIhsyOxZg2cfUIqOzAMpBR8ANz78G86bJ5CT/qDmkPaROyaohGOR4AcLTHveJDPNITdq02YmJ9antR9Z0QZUXCHkDSAB7PL8IkRIpIwS/3VUBSVIbQyBB4cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400239; c=relaxed/simple;
	bh=8lgFGHm5K5qKvcaXFpekKOms98WYLsCY3PwdfSG68OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ERbWJie6LaTdM5ZyuO8liYtuy9NlcEDAXg4WiKv/rwNqiLNXlH5XSvVaNsFwbMnv/fU35KfZJy69nsgTP8KmMb5XN7HStrHPoV4dtSDh1R/nSM1X5yx9orKUbVOpI8c2dxSdo6KiIg7lKflcrvadodu3eXPY+d6srlVFb+5qxis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=fTyGP3Ws; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="fTyGP3Ws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq1kKxu7gYFd0r7V/WWDUhZnvwIP3vivSTTcbsHGDbYVYSAOW11fDoZ/nubZrDl1v5d5EBSBHz8pOpmZR7CrYLCXxlrig2WD4JXiEfCpSNcU+RTU1ewytVW8VozXP35PbiOJ5DnsOlhFBA6501qWBkeCi3HDtd1GjW/Qbk7V52t2lvP/u85/OACyHcdBJitaXinNNL6W0yVIC7/dzBEgr+Mev5+IqRrhx7zKQ0xjQQ0lP+dVt8MhCta40ZEzgmTrRd1DDOdWA6Gim7nVxWmyFyjz7Nqo6bMgJsTzCko6614jARg/1zf0SJr0G+zd5/xQRvtNaVA25MoBP0qQA/IYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuJ5oXIQCLPdeIoXrzdBNFWvkjO7nuUndgRMSZAk6IM=;
 b=jqCcM4ovxmAvtvj30E6zlGBkN0Z28Z1sbGgfd5bMFRXPZz8w1OdEt4Ws4XVHedmtdncKXgVMi4LFixoandSMwP01AGLVlinfTFKe+M+CJQ10pSZ38uziGLhjcPA3H/QpX469xk/i+YPUv8ZjkyIdT72afJvuT+RG6iK02E+Mpf+A6WTID+6ZQPTabkwKXBZ5JNM0ObTqzqsqpVpumKGhxO57rXA2yWV5eVE9wxONt8wX7AwW0cKM2G5v2yGxi4QS+wmoynJ3jLs7HWhDDJtyucuTnnpf2h1TP1fI66+0063cBYsj5Nuk6SQvYljJLEn+0pKUNOh4YFEJqvRGMX7Pmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuJ5oXIQCLPdeIoXrzdBNFWvkjO7nuUndgRMSZAk6IM=;
 b=fTyGP3Ws8wudi3/KEKp6CI8mVfvLU+xHIQD75nZLOwBOs6GTRCN/PUHnNPaCuAwZ9LXQRmrfdo22tbM1sXdBQIrl0oSP8zvyxuFF/4u8oT1yMyY0h7S/A1qUfYcaAWTWlsR4TpZsOeNwMnRS9jE7pEmu+sdOkOJteC1Z/UdzluCKWLPluFnJ4h9ILPGPst5uq0bafIBe2L1EMR8gfibYniqz0ma7MTzfkC+clR/RhR9r1RuqnZvJNqg1chn+ahjuIlwFQIz4iaFR42l1Um2ng00c9flE4xnAe3iMNHN3kc+2Sdw/8/AFD7ovRYjAwp+ThYkcBscimoxsdol81e1ctg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8)
 by DB9PR08MB11361.eurprd08.prod.outlook.com (2603:10a6:10:60e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:10:33 +0000
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
Subject: [PATCH v5 2/4] pid: check init is created first after idr alloc
Date: Fri, 13 Mar 2026 12:09:40 +0100
Message-ID: <20260313111014.2068913-3-ptikhomirov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 263ac218-bd85-4e14-aa6f-08de80f124ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L+G/sJSuJleetwjB2VYKtovp+PaqwstJAuPDJaqbpOcmWwKWlrAs/gsz4w5bFiX/KW5WxSmRKNCmUeoI70crpLFcm8aPhoXQax1cs5PSeIahY4IwdSnSQQ1tq8YuFBf+fqV9MEzgtfCHGZge6bdGd5pR9VlibAKRxy0Mp0WFOy4zrqKKZlFMdnvNCdF+23JDj9TSwL4uE0S1/3fgIJPN37i8cqP3HBEOH11dz3zrL0KKpl2jiSrhNr75cbYQkT8sBB1mcnTMyT9wmsj2aKqZq9ag7M0qeqCHPHynUo3sAe9fKgkSs314W6C9VUgm/ZYALdN6CrYlSCW5pP9+w9L09XNWQ1DCx13ge6ivS67TUHvhhuJfZ/uur071UvRC1KBV/m2ZDS6Wnlmf7g9rcVUMSgQ2oI3Hs6JT3krrRvT4bLF+LyWEAPavojk37fZh7LEdzIZGJEU6NYKrw6V6pTmTxbpgQQ/rvO1CknvFYX7t5UppqI5mhYn1VGKW1aCUKLYq2+8+32uQmRQV0bl1TwHjVWqvHTJ0tDWfPXCDvpLbyfGoO0yU902SX1TWX7VAfswPRmBAnzzV1xD6gQzUOweAs+2mznLuIw6h56975qBZ0ZkYgELyeJs7BmbOy65Y1iX+5ZZU1t55mI65eSa/lJ/fPb/osCsMXALfBNP1wRAUiggq/Hx8Eg4bzJ/aIXM+/q95ps+E7yD5/Q4jqovoFo0wj2xIRV1N3H+gnbfBeHaMAVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9008.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jaNQDVOP8vYBWWKkpiGp6AQ7KrPC/uRVX3c4qOIAZHZ4q9oq6Y8zZE1zT46a?=
 =?us-ascii?Q?xSEv+WoQa4Gnk4cW+14bDalZrmI1tF0m5D5785gVfUAloEzkVcZszuadu/JE?=
 =?us-ascii?Q?vlGbOsobP+aMNE+KKWWwJ8tENtojwAi3gL5IwJeZjMBLDM0cRZFQAjjWQ++0?=
 =?us-ascii?Q?wHe13yf6U5R1bbh8AbHFznwJXX5eVmY5yXOWoRJROTJ/AVSKovcmdbaYON9E?=
 =?us-ascii?Q?kPYCZKAes0YqQBwY18Jkg8jhZy6zhWdduQM1jikL4McpYvkFT7SxjN9s90kt?=
 =?us-ascii?Q?FS4GdMWOlaRanlqyK/YUG5m9Ckq/3lFiqDKs0GZq9xBHOwkh4NTECrioG3pJ?=
 =?us-ascii?Q?l0IZkZ+B5XARpID5aG9AB+aaJBwzNtMeWilr1O2ZzOSwMZMc3VlirwTZ9zBy?=
 =?us-ascii?Q?hbSB4QD+NojSDXQ7ycOFPrfjPKzhDW8pimKR0223MysDotPRWtrRjvMSQnfv?=
 =?us-ascii?Q?9CK7xXZNi5EC6zhr5QiirfPL4qjCLl5UE1n6Vk9eGGk9qDnQyTtoU3ZB7ofx?=
 =?us-ascii?Q?ZRx515WqFIDCdPzuvbMvNTAEpqcS7mnRVUwJA6GNVyxY/LIt4A3ftoDJlcgW?=
 =?us-ascii?Q?1LBRPjAkDuRsLbd7t/d/hCVXHVA3IlZfxsjh3DfXDMK7QgtI46LWK7ZZpYxC?=
 =?us-ascii?Q?lAA+fVcfBMCBY447UfN3f7RArZc7G0qVGbRkRXCiRAyvglVsQRNGo+z5JBw0?=
 =?us-ascii?Q?vVCNCpY/2VpmX3QlRkBmplBeq2mqNVgNFGv2o630Btc/wCdOkPolpHFH6lYR?=
 =?us-ascii?Q?6xjEU04tDxhOHfy5kf/TyPgPIgyYFoHsDtXcH76na/n4cTkUOK6UhEU1enUC?=
 =?us-ascii?Q?LCUTz/+S86VTv4NZYgm3VPZIhxoNgRv5FIytJ7Snnh8hSRtJfl28v1sd8kFw?=
 =?us-ascii?Q?yacwM5A6wLy3HJY+FCfajYOHsKY5cT9exOIPY8CtOoiw29jj9CnABcvPkN61?=
 =?us-ascii?Q?xxehYVZvIv9kLV68zDdHqoqb9Zsczm40D6JaPm1uYqc2SaYwuYo1U+U7QGas?=
 =?us-ascii?Q?/JbRcAnYiqOufgzjbaEDENHXhF64txCEORp62sK4t70zRsiDOsR79anrHQAi?=
 =?us-ascii?Q?FeEk7mDVRV1TO3kzaH2guHtRdI6g9xrM70CcEALpqrDVhh0s2FItTfecRSfy?=
 =?us-ascii?Q?RRjEsRmzCIy1RLdIWy6oIbgyg6kFqOaHH7aOhKwZ9/P4LcBjnBT+wJvx4Is5?=
 =?us-ascii?Q?1sBdHUB2vw4oT7yzZnRt2oQdVLs3QaEyyaBopXGJKmHrEHjh7jFHThGV+V7r?=
 =?us-ascii?Q?oYjkZucdrWp8yMenXSfih2hJaQW86FfkObIl8C8cAivxy8QEQyLpCX0j/JAl?=
 =?us-ascii?Q?yHrsZn5GRcxX3kGPn4/Nmbd/dXTZh48jmh57mfvutcN+ZKk+K1iUmqYm5OOJ?=
 =?us-ascii?Q?LnkRMejuSd9MYEbt20j3NwlLzZRnoVwaMvg4ZMgiU3qUXSSzUxVbY3kKjRVr?=
 =?us-ascii?Q?1JK3xHJoGMlDC6uXlpyO4Q2u3DCdg9MQg9n4l6EAFoeWC85TcDOrhnanO7/k?=
 =?us-ascii?Q?chhXI1jeGLzvV8gj0my7pFtfKmEjZJTuiwks/95C8q+OBhV78ihuH60Mqlew?=
 =?us-ascii?Q?ySiJeQc6qut0XcribAMG9dKnCHqFXoa7c2+qfSTQ6FQcunisnsnkkLSwuPf9?=
 =?us-ascii?Q?z1N9A77Kv81kWbW0j5Fiq2pQqpI/UE/jEbq79jtUSkSOR05o9EIMH+Rt1bQC?=
 =?us-ascii?Q?ZH85MuIJ4i8+uuTYWyW9xYO1LG1olNVVWp0V/HaVlnqLBrUP6u5qHQvLndRC?=
 =?us-ascii?Q?PiPmDY/2hNANcaBx4nC4hDX0JtVnWiBM8ujxlCKl3jzgiIoDS5o6PtDVM0AT?=
X-MS-Exchange-AntiSpam-MessageData-1: 9ANRWkPqXqv595zjxfpWm2f2Dwe/OMyZeMI=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263ac218-bd85-4e14-aa6f-08de80f124ec
X-MS-Exchange-CrossTenant-AuthSource: PAWPR08MB9008.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:10:32.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxzZZTWbIbCK+fIAxKkLgNNylEG19dYy79fngDCs6fczuf9gBqyTW3/CqDfufkVcSHXmJ4lumEuJdQmjHIUCNr08cLKlMA3+wUzkanVo/1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11361

This moves the condition (tid != 1 && !tmp->child_reaper) to after idr
alloc, so it not only covers that first process in pid namespace has pid
1 in case of clone3(set_tid) requesting wrong pid, but also if idr
itself gives wrong pid for some reason.

This could've been the case before this patch, when creating first
process the alloc_pid()->pidfs_add_pid() code path fails, so that the
idr->idr_next is non zero anymore and next process calling to
alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Though thanks
to PIDNS_ADDING logic, free_pid() disables further pid allocation in
this case and it does not lead to any real problem.

Note: This is also a preparation for the next patch in the series, which
will introduce an ability of creating init from the task different to
the task which had created the pid namespace. Needed to make sure that
init is always first, even in this new case.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
--
v3: Split from main commit. Merge two checks of ->child_reaper into one.
v4: Update commit message about PIDNS_ADDING.
v5: Add Andrei's review tag.
---
 kernel/pid.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index bb2bb6c16498..fd5c2d4aa349 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -214,12 +214,6 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 			retval = -EINVAL;
 			if (tid < 1 || tid >= pid_max[ns->level - i])
 				goto out_abort;
-			/*
-			 * Also fail if a PID != 1 is requested and
-			 * no PID 1 exists.
-			 */
-			if (tid != 1 && !READ_ONCE(tmp->child_reaper))
-				goto out_abort;
 			retval = -EPERM;
 			if (!checkpoint_restore_ns_capable(tmp->user_ns))
 				goto out_abort;
@@ -299,9 +293,18 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 
 		pid->numbers[i].nr = nr;
 		pid->numbers[i].ns = tmp;
-		tmp = tmp->parent;
 		i--;
 		retried_preload = false;
+
+		/*
+		 * PID 1 (init) must be created first.
+		 */
+		if (!READ_ONCE(tmp->child_reaper) && nr != 1) {
+			retval = -EINVAL;
+			goto out_free;
+		}
+
+		tmp = tmp->parent;
 	}
 
 	/*
-- 
2.53.0

