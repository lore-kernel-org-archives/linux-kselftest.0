Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023114.outbound.protection.outlook.com [40.107.162.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7963B6C1C;
	Wed, 18 Mar 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836535; cv=fail; b=LvVcq2w1zAIIXqWcHrvPAs0cW55mX/TJcVfZypPalXuHtPhZJWekfvZO9zXaPkLFgC4j1I5FuAVPl7633pqZgN0zlnYfzFisytHg0IlDU645SvDbP5PjkHhzUrVfG7pAC7OxiddVOlaDZAlugd8Krssbw4M8qiLrxO/vDtPZ1w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836535; c=relaxed/simple;
	bh=DMqL76zlCz6qn+hEIcO2djxiryTGPmUteYGJiECn7cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qMy2jVUlkg3wlnsVapaZqn1uZ6M/eVRo/O8wL+quF7kr/qc/BDMAVoj7KaUl/0fT8eCuxfV4kefeVRDzVGojrTwC4jOaBuidUAA4IhsxqnnR2BXH8H5iLpV2thLBEWB3yY8ulkNmdLhxHEN3/8KVEcx5IU7mmXjj6qA7aOnar5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=Z5qZ0ZDA; arc=fail smtp.client-ip=40.107.162.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="Z5qZ0ZDA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFXJ2GVcIfZ1NvM34KYd33p7JggQtfI4632j+rN7kVyAryhsLQP8j5KLiP2C7Gn8s+i3+X5jAjVrnTGnoqQwJesEE5311Xlkm7w0lmsRIAApxXPt+5U4ySMEJY5689d3y7wsg3dHa+lLUS2kCSAcjVtN2jnuQHf+I1r2gEqvzVBf409mJCEHkB7b5m1hij1iLb606jL2fR+w3vM+WbIktFChjeT/zqYzX0PdoaFrWo+tFlRIw5TfRffUQzSdTPOgY8uNoXfLQoG2qOc6FDAWSwUIKypjQhf3RnHGiL7e5kMIEWBLhoKPLTSq5Tp16P3Q99TgLLhrG+mTdnbVN9jXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bifriNmvyQTetfDh7KYGfCCEoqK58VDRU9ZKl6odYsw=;
 b=vWpRdoid90GHWoKv+VeWaZ7BvZoYTS4xV3tT3w3ramHPZM9dXZ4jOhflxKAQGLzZor8TBUkNyQrDUMElIsNjOL5juxXBrRtHF/XGqyZxF2m1APwmD505tje1cRCQRfKSAIImUbZdXTi69SELUaOcdJwKWfXIu54m49VVdmRIqc0U+5Rk30fQx7k34V43qFOnBB6h7VH35xsmoHydCv+DWsw/W3/eC9W3LqA3CXwFDUODz+r8iz7pYvc7IdrzotQUGg10XoDoOwzIscclR2VrUg7EMyeiAYZmc6eSYWKUj21ZpOpnxGoY3OXSFtGM5LOLLQYgUgK53weOhY32589yYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bifriNmvyQTetfDh7KYGfCCEoqK58VDRU9ZKl6odYsw=;
 b=Z5qZ0ZDAJXQblQVuiA23cUUajW4mcL6FpZgRJQmN9cLvghsp4f64ese3gMlKMYyzckNoWs2IKFgH5dp/Af38Rex1d4e+JdJBO+suLx5DOdxpHi/MI7UDGl5cVV75oG9f7Fs6FIVEmtpHn7sIB1gR1qavNbET8iUJVsy26r1JNdvbghk2NDpTY5bLtMK1Jl6rdxX9qMUSLGT0SfyYiQqSSvaiIkDCgoRovcFkJeYJ5MRpl1KNrOXrH7DljgDaaozjKVAFbSfSGNJaPodHk1CgaAgc9lO/mVljZFZkoZi31O44guUK9FbLRsspFDtNqAr97GMdUt3dftpATMvyMr4z1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by DBAPR08MB5830.eurprd08.prod.outlook.com (2603:10a6:10:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 12:22:09 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:22:08 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Mateusz Guzik <mjguzik@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 1/5] pid_namespace: avoid optimization of accesses to ->child_reaper
Date: Wed, 18 Mar 2026 13:21:49 +0100
Message-ID: <20260318122157.280595-2-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
References: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::14) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|DBAPR08MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 994252f9-d9d9-477a-106d-08de84e8f983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GD2Hiisy/bkea71k+Nv90slIjNDggOsaEoKcOG+xg91AQ7d8v5tYtiFBpjbYtdphDFbdYk18r8i2XP1WPwH6c4a5WkRd2oKGDk+TpOAhfmZTi6fg4vR+umM5fiSPTu3rGFbAwqYsfYIYXRCj5KscgI+lYPOGrryJt05uzZzsa73eecKFXUiNvRE1Sdq7E8sNspaL+aKGST4B0lAnSQhqT3KBhItYZfeM33ZRpxXe8TD7RhMD2nAujzX6EIGYk+EIFZGQnabbr/WCcZTiRUtNx9L1XRDxRf97JbVkc1HKZer7kWTUur4XiNcJtcOu65A3HCv/h8lPvuJASdv2J+M+Hp37/jeAnp3vSU2px7BQr5BwreHI8oIaOn9LBmRURKTIEHo5fQdQS8rovtrR0YuAl+lkhFTnSyzbXmlb32jSUxAgqg+QpMmSPsq2RPf6hyzaq67uAK5uvFpRDZbRmcOeX6zT4ySpiMDxPg6EoLZ3RTkdxleGn9Gm3oTqZqJ27gTsZGtG8eB9rsgiErkAjzRhe7VLEoEda2B1atk+TonhA20abACpS9ZbUNqCW8XdZb85soIW71RpZ+QAVoyS7drsRpjjOjUVnwn9D01PHG9je4TiDaA8iHUN4iI6gLCPzM+XYIUkTXTLXICovJpYXKUHiwHHmeX0sf0fDGAKD+hNKGyWKVDQtoyGN87NbtbmG5DsLu0QUR/4U8qUM4wYcy9MLQKNswNBcutWlhv0LChSm9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dmlRw6pqKMDow0OUI3JoMbizGWk5IXegkXL9YlKWa0ZLEoKj1xPgFAike1m?=
 =?us-ascii?Q?M8ZEkOdVAkN9QgxblJH/dL6nuUjND2gGMPkRSLG9tQTRK/6qA0mMtDgtETqt?=
 =?us-ascii?Q?eZoDJ2EhkTD7jl2kZuzCKfrJ31fI3SOS4YkCTErVDevWI+iKsyTOC1fxCojD?=
 =?us-ascii?Q?XWEQvNwByeoTaz0tN5//5m+Yst9Ucc5MARcqgjtHuXWY4GmxCvF0RO9ca+sO?=
 =?us-ascii?Q?Zw8My9sxoFadDdhBrupAvP9xQN0SL4b0BYXj8HfhS4K1m0hMbHUdUZXTTDo7?=
 =?us-ascii?Q?aPnFC9qkpYvK8VCSDRYcGLy5PMVtan6HJ2HFev0TxT2payCgcuZJ/nPA2ZIP?=
 =?us-ascii?Q?ZlOOer3WKwn2HE52IMDn1MNPOKy6XBcXfMy6jduiEnaeQBONHiT8ygoaYR/q?=
 =?us-ascii?Q?5vwyeu2SW8zzGdoMWzkNkA4V8MxO5j7TY2oupctie5gL3gx98InkkuDjWfDZ?=
 =?us-ascii?Q?LV304wxbgAddN4+2L8ycSN1FQd2iyd/P3W6V/9VB9vkKpdqdHQV2nHOjT59n?=
 =?us-ascii?Q?4wKN5ywxdvXvqL2qriJYDABli7+ZGSOh948n9IiyzjRcN6QBVzhnh+XuyG79?=
 =?us-ascii?Q?tPNZDO44s+fRn820RKS2zHNCd3fS1UaZvOIVMlZXxeic1P0rmVwyPykYVUhE?=
 =?us-ascii?Q?K/CaTZr/o/R6q8/A8pWjIASE167Sh36CESg5zzS6TN24+DbPKnP5ru8bYGv1?=
 =?us-ascii?Q?tS3SkTbZUCQqrLuSSgaI2454bYsF5WHK+L479cAyUitENWvBC3kJn08AV+Pd?=
 =?us-ascii?Q?0AHPabpLg9yODvR4NJrIxT8l4oh/+nMuxDviu2bJTIjeoCLGztvbrJo9this?=
 =?us-ascii?Q?iIJ2EOhG/KXO7nssCg9Ox1iuRHw56ZB2rOLfVAlu9rEysSoO6yXGG1jcr8WQ?=
 =?us-ascii?Q?AkihDvs0xMqRTypQPgOcd7+B0ZWhG9W5Rn8HM3WKI5SBtOXRZvrSgCFzMi87?=
 =?us-ascii?Q?rulFIsHKHPzXPEFUudxqncTR/De5Qc6s4smMf6Nm0KokwCffP1ONo+6ayUFL?=
 =?us-ascii?Q?ttcXNZC9dd0mf0MLCIMxiZZ6ZcFMooq9mEE1H5Ees/lxmN1NzI4d3JbO8anu?=
 =?us-ascii?Q?QgIbk9sKogUoO4VIad5c+aYGyx9XtkfrGqOD7+lFYYg/jzUVeAou/h1b1ONC?=
 =?us-ascii?Q?yQznyeP8YhTja5LsrjiWaAKjgRrv9ORKg+8JoNotFn4uAqpv99ZuiiRC+hFM?=
 =?us-ascii?Q?NrG51IR7NdZ2eKKSMFjXr5vFZhYsYUrcteqrLHQwY0V84csE15TsgpRj6shw?=
 =?us-ascii?Q?qHhId38LaoqnyqwORogJcTCgTKYS2ccaCk5e+dsBw6vQxEuhScHij7dW8oD1?=
 =?us-ascii?Q?flPjkDBylOE2EDo2Bqbctvb2GB2yZPizxYzMQZfhPnGlmyqGndizU3ETwnLy?=
 =?us-ascii?Q?58nwPvIRwYSJ6HhjhK2PJLiGqQaQTrCuhbPcVnQ07pOdLRE8J56+tBXAQMN/?=
 =?us-ascii?Q?qxJe22DGrq/iKRGIsR/To5IkfFx2vA4iDP2dw4JRClnoeDjmOJpQC9FdQQ+E?=
 =?us-ascii?Q?wwIOp/SoPxe5hVHmOiCLSzCN/PWBC5eXU+PZaMWLNi7zW//mOhisQrI0j/l3?=
 =?us-ascii?Q?cWiB1ZkPMGwKIijFwGFt1Ooi/HXx/P+CuoJ8F5fXitVw0R38QDGMJppWVNPr?=
 =?us-ascii?Q?jCHEkxqkAsns+MCQNo2f7W0qk/xVwlNU78GiQWM818oe6FfkK7/ohnfSK2UL?=
 =?us-ascii?Q?ZGzj4JF1nAFgbL7hMJ+Dy0V10NZPeF6aykIaYqAqOaHbjQwXT2U4zuH1bdKm?=
 =?us-ascii?Q?KEbo1ByXarFD/ZVHjZeVisYj7M+UfpzyDUtRZ4NZ+PlMYfSEQHLazhH4tIss?=
X-MS-Exchange-AntiSpam-MessageData-1: 81tquqYt+iRGIG5GNcIxjPiPoMQuDXH+C2E=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994252f9-d9d9-477a-106d-08de84e8f983
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:22:08.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/foBjDWx5nmWiW4/hQwPf4yoyY3/1QVgYDTUM2mL5v0VPQXBHfS9mQn5mp32xx1rZv00EUHaLGAs+tQVjTKZ51EyCzO//WrVzpcbAYsqL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830

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
index ede3117fa7d4..31b714c3a791 100644
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
index bc2bf58b93b6..75c99afb7529 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2423,7 +2423,10 @@ __latent_entropy struct task_struct *copy_process(
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
index 3b96571d0fe6..386e51fcebb3 100644
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
 			/* Handle a fork failure of the first process */
@@ -219,7 +219,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
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

