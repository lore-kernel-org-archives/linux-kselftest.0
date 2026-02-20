Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020106.outbound.protection.outlook.com [52.101.69.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DBC2F6192;
	Fri, 20 Feb 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605976; cv=fail; b=RQKodMuuRocDyzEJZNFOybxnQIMdPoEdthftK5eEzlHCiis9K6EGzNeyraFrBR4Dhyko7n9Iar42NeNmh6kW+EZQvjXkON1ZXUkPewprLYLafkeyVbpnoBvVVAkyiJudrnWEwMcpfF8zn1bKoaSvnCK0mquPQ4uEOVHXmsdj+2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605976; c=relaxed/simple;
	bh=30gJNMxnv/gyy67CLL+KWGnyQSCiXSd6y21Mj7jH9X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EWUmk431ryLD0rSi1bHNa64HS7iZhgtxviCUHti77AGd8SCr+aet2kN0Qppkcvm4x81Ax3EKvqgyB1jYcpFjXwC2DXfX3tsPiGXyiGbDa5WiPZMFllXlNHcuoMBx5IA7pLj/6FdT8l8JiwBvEbnYxKdIg2LBDbM5R7Q8R24Qhow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=NSJzqQHP; arc=fail smtp.client-ip=52.101.69.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="NSJzqQHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukAnaKjHDAUj3R2wqwCvTMt2pzYn0bsLi7dQY2yQjVigLdQm5hokJfgI2Xe0TsbHmnmPLf2+qOGzjlJ0HYzl6knkOy9VR6TEgAX3GjyNDzsLZMkCH96th2lDyB0HEwZxt5n9jq4kRpczPvugo+ml4+6OzHqVuU8JYQ3Kdy3mrH3uHsBzy6hOy3MPL0YAXDjV5VnvdzS50EEo+V9z/YWM792fQpozDEFQdt3LvA6D1d18iJ5v9fWFlh9mnUDRf/IqONYI1Yg1hc/iO3KdYI9cyWR4S6inhRgmF2cBuxdGug/95/OqVM8AB1SXvqzRFDdcqQ6Nc6dTc0sKlloWrvH06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=AnnOon0TRklySPoi43XNF2eRHJYCmWFT4pnOpNDSvM1b+aq3ng8UCTeiTehx+nYEKlWnE9/pTaClLVwhIAY/G5MlXTSz+e29J+PXvfwhMJhJiU1nzT6nF+Wn7/UTypZqQ42Lrm4zeXwFr3O4Zip2iDZ/5wg3Ij8obzNfQd3Syjcug33sqLYCZlLjyTb01GHLKPO1PU835o5LeRnntyByWUF3S3rjE/eK0AfOTeXs+l9GcWn/6/AYBm+VqmTGjYB60tXKY9JUg9tFRSypg3qjFC/7xvT+w1tsH0mYNoPqd4ZGWsC23gkI2XekEjtC0q0VkAoKwiNM15kOAB8TddPFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Db4jRs/EFk7zsEF/qDorpLvIMXChA5tbTmpkO6HO7w=;
 b=NSJzqQHP7kfGzsYpZ0CeyGvOa4IhrymnHUFvMx5/C4md0Qx1AT5U5xHwUZWiROOR/SYPe47jtUsqP7UN+lBjGjf4ZN7N6eNsLETOv27ac464iG2F4UV0xE+kuUgRZMeSuq94uJOFdlRkt+RqOraS/T/kztMaqsU2K0hUk3VHNUj7DlTMM5aBNUN9cY4nXGkwwA2kQAaVb/fqJjehDg6gF+9Uy3ey62cycMElCBkg0JMmM1+AhGIw2tryaWaVpk9BTECWDlA47caw/T4xn6U3NYwzc/ECUPAO4GKdiO7QhqNZvPbyDOpTi55kpr18ZjJrQxEBP7Z0k38UA0vHT5Nv/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB11132.eurprd08.prod.outlook.com (2603:10a6:150:1fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:46:09 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:46:09 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: Add tests for creating pidns init via setns
Date: Fri, 20 Feb 2026 17:42:28 +0100
Message-ID: <20260220164559.2465466-3-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
References: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0456.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::15) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB11132:EE_
X-MS-Office365-Filtering-Correlation-Id: b7184b27-186b-4a01-0b90-08de709f8c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USDy9e/PKHYPOfGbl8SI42C+JrnhMdfHyCgw5/OFOpBHtSN2S259inTHTMsT?=
 =?us-ascii?Q?3Av7lCZJ8fyzu6Q/3pEUAJvjcUpNPb4HSDjvNsBJX3U2JZLMaDTqy/nmdI2O?=
 =?us-ascii?Q?kCIvPRsrx6+3rXhwbfMDCJAuCiFaZnJ+p6kxIqPpyBYSqDIBqKM8abxObXIJ?=
 =?us-ascii?Q?iNmHwenKcY2CjlXFS9cr/f5peRdsdVMNIMBXH53jOY5cXcfkFA59faiQiSxx?=
 =?us-ascii?Q?jb7VreAHAJ1w2hnfmDq+Lq7C3gafl/mMu5aagHZwH/pIER5R+ZBHa3P6/Irc?=
 =?us-ascii?Q?D307OJrurHgbS3s8yN69clj9o9PicdG9ZW+ZAk3QPRR4KU16CTIkVtM7JUKn?=
 =?us-ascii?Q?FfMklGELq4GaZbuRM/pF5y4Re9pYaRHlvAR2ZXAOF1FYsnvzBzcvuQDMgvDi?=
 =?us-ascii?Q?AoWc7yHlZ/IGXxo3+qnNcZMMOroV/bY+SF8CVEmoUXJkhqf5iWGBg6P7NVRi?=
 =?us-ascii?Q?Dri5xgYe0HME6CwxhBLdY+w+DHSBn2DyW+bcoiSG8vbzUKzxWmYFupNW6UlS?=
 =?us-ascii?Q?U75L4SnDQz45tWEpXJHxUnSeibn0h5FYbBmulepP1Qv7Gd2jf9qDXawo0e5/?=
 =?us-ascii?Q?s4A0PkrBYqKDeUKu80WPhzxTZ6/DpE0XWLyiKG7dzr2UebVBIucIZlVls1tn?=
 =?us-ascii?Q?t0xsNKtqfmIy7g6zo2zrQ+pIsIz7qqYRk0LIb5BmSC2JliuuAriEYuqVOXK/?=
 =?us-ascii?Q?VrDteV+86aC0iPOuiVRdciUvXVW0JyXODLBQJk7vYvexdVW3PmdUuBfMddNL?=
 =?us-ascii?Q?sC+JGBZrpqqvotJUlyZX4ysMn7An47w9JSTqpBfq38XYxFsM2dL4Gv16sZPM?=
 =?us-ascii?Q?8bqzINuqUR3W8eoVAC49CldXnE/e9e7+t9yPr4tS2oP88dIMzKwYNTooilGD?=
 =?us-ascii?Q?xq/IdLA/H4hn70KnFUdKW2MnzwUYajwmeGOhlhY/2grZcn4j83tVEyhxm70Y?=
 =?us-ascii?Q?Xf1EccA9w6yQB44XkVjwcqlT5y8mLMmcSY9IUzD5xmr8K9/OXvR5rkrW6Ey/?=
 =?us-ascii?Q?S7ECjGQ6vKNm5jMw6NbzcJwMNTwQa6eD9N8nWzYHA27OkHHPcqigRPOSxcj8?=
 =?us-ascii?Q?OX6rtquNzjfG0dYRCFIDU95T5+cLGihoWc/XX1+H1+cqGHd3l9WhtIdKjdzE?=
 =?us-ascii?Q?FZJAadsAgnrDrLzR+AhVXkdjdpk5ixaVOGiFbAK/OgNhVdLDfSCjaQ4OQc+2?=
 =?us-ascii?Q?57lwyBkTP/gOKFFSBbo9fTmUjwsWd/sKGJOwruVygWyVURO9kvK9ZDVwl9OW?=
 =?us-ascii?Q?MCONGRGPVXijjTfxXisRw7nh2KeRjFBkFYhgLG2wPKzI2oTNEJE0nXApPs8T?=
 =?us-ascii?Q?LVRC6pukVvovVgIYxdiUedtQahJG4SNtYbw1FKhWybDPlN5WswxSQ242KoXk?=
 =?us-ascii?Q?bH6SU9uUDa/wgwTnyQYdmbb52EMTiqLOuI8JfFsp5v7YJZoWLr/lMHeHp4R6?=
 =?us-ascii?Q?RCgP4umbQkfWoKoTO5InGXgbM+1UmBe1jI20kmOTDMO43zAhQBVdIqpgf/o/?=
 =?us-ascii?Q?ObdBBjxTFgGYI2cjOeytDARd//j8QZVUSA/HxFsf2wl3FOPXQxMhTrSxODvG?=
 =?us-ascii?Q?2g+fa8ZUQLhhI+2i9X0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/RHXwB4ZYzgzDek9EbBCbAj4zlFYq1Xt7Y44TNgx7h32GN1kt24fQXz/kZ7L?=
 =?us-ascii?Q?DWRkua3xZ9idNopxefzQNMUXwddIpE/HLPrfzBzx20Q7IAvdLzqJKIY7AUvy?=
 =?us-ascii?Q?ZxLI7vWW7ptpjmicuWtI1ZZ7IrKY4IyemxA8lWtDYOmT3m8DQoJolGAzCnxB?=
 =?us-ascii?Q?gLQ9TagAogNLOhcz1Pl396rq2yToEbMiyx2oS90UJEcMeZc47sKcaHBQmMih?=
 =?us-ascii?Q?JYPK0E1vyGj45ozK4HY2r7aqjGcN3XjnXV4N3l79Hiqkw290yHHfYrvFLbt1?=
 =?us-ascii?Q?pA7l7mEGlLqHDpWQMskN1hcBW8/dswUn9Tvhh+mfdYwCTwtt/MtS2g/RZgsQ?=
 =?us-ascii?Q?I8UCHYLl+rilNWKgcGq4v9JsmwKKTnRF/aBFbxzgJDykK0FPhbMPqidOqTQf?=
 =?us-ascii?Q?HE1feM07itkdO+O0+rnC5wwYXw7pVMJA/rqWqiIWSOe/0x1U0TEsqVOPSqqB?=
 =?us-ascii?Q?oyJkz5B5gubDKYL7OVgTSp02XF7pNZu2YaXVfrUS5/K8c1ECRY7DdWkCGF/Z?=
 =?us-ascii?Q?Uc9QLmm8PIAaX8tp34PC2szynYYdURlkvboWYnLF4mB5PL7YXPgWqfYg9TvI?=
 =?us-ascii?Q?Paucwo3K4CQoOHv1sbuaPTSqXcIdQmednriD9jpRJlWRpk7+8ZlAaVmYu+tf?=
 =?us-ascii?Q?Zjo337NusfE9Vzm+9NFmK2zqVYNj0R41tI4fqcyHciOxVpMOv5Z06FVMnFec?=
 =?us-ascii?Q?+HZ9MGW9icVlJ4IvM+JljNlimkwkNBG7OB9xvUc2+8vTv5mG5XNUWwMLwzwD?=
 =?us-ascii?Q?ZARc7gCXPQYDBPIdYtS2ISfCwZ5LwEmluD1AasRzUBF/8ZM4bPG1ejkj8HUW?=
 =?us-ascii?Q?9RAeow//2mZJ5P2CbE4ZXWrlkxyh79BJTNHz3VDk0g36pEvZbcAIeKSnbeyy?=
 =?us-ascii?Q?3qkP1Kj/UF+bLHDWQai1ndOUIC4Nto0rv9BAcZQeo6ZcpzGwmtZ0CW6bJ4xV?=
 =?us-ascii?Q?vpf/dYfpcBT7wqsbu7L1DxMV4vKY/AR7Iyt3cr2f64x0v3SrsKUPLRei1Q25?=
 =?us-ascii?Q?AF6kOrUhKSSrFdP27UAl01mNHImtoEhsGZ1/wJGcnSHUJq3CwhKeU3swf5Ru?=
 =?us-ascii?Q?C0P2iTisCDG8+Qp1dy8wh+4UkBmRisctjLztKE1oTtF74Pu+bjKc0sVCE1Ao?=
 =?us-ascii?Q?amiWqyDKe13TupKaLgksJLMBvxglj5ZfmKEe/OAi2seRvuYaqHI7bl2H/QYP?=
 =?us-ascii?Q?XzszLvYTThFuCUBxLGFAp8W0Eqa07wcLtHatvP1Y+/yq91LZxDUFV3mAVus6?=
 =?us-ascii?Q?TWT1zGnlIapb2JOlUxpT+LlwQvEqZO9pea7CluyFBrWAzRh/zhUbXjNP7aCf?=
 =?us-ascii?Q?m6fZvQ4CTUKa5SdSqrpbuev/DGmZBFpfjRGajj2nJHEhmq+P+0Iu123fYRnm?=
 =?us-ascii?Q?YTaF2YEPH50A0JEbTJEIGyHy1t8/IpaN7hqrTjC64OqMvf8QBOVE96o8151g?=
 =?us-ascii?Q?x7I2eOEMk1DVjHzOvolmvq0DjLIIPXuVhgRDZjW7VQyN5Bo2fuJF9UtGSSSa?=
 =?us-ascii?Q?1S8dNbLaru6r7ooI4x4l8076dISNiMdnIlyKzKcF0FEixsZQQjmN8DUg9eoA?=
 =?us-ascii?Q?wAEZ/x9/fST3dxdxuaLd9CDLacPLHntdCb8OduWbCda+gC/3tK9zB705UFse?=
 =?us-ascii?Q?GAQFh1DUKOIvyLJhJQXgcoV5NyDpIDZEI0crRuk4kqMVtyxhhYPbd6+JHaE9?=
 =?us-ascii?Q?TDcQR3ZFy7/8TbgOSFCHKsN0uq5uNE8UCp1YU+udgfMZJCs8T3tiTUq+Mqjw?=
 =?us-ascii?Q?PlodYB/lYEcWbv6tovyIAdt+shVgJDwMgk1CsG+Oo/s9njwnqukAp7Vzadqr?=
X-MS-Exchange-AntiSpam-MessageData-1: 9XA1hDbfZu8NCBH2u8PhgtFQ1tm0UHyiXUQ=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7184b27-186b-4a01-0b90-08de709f8c7d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:46:09.3728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNMdU8qN6G8Ayke+OsKP0qWtI0NtW1jPGFHm95CW+6dVx4jwwqNLG1y6hcPC3G7UBQiBWxIPhiMTYz4Us2/9lKGIae5+WmfKlyWVTTW/B14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11132

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

