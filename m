Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581B371049;
	Mon, 12 Oct 2026 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791270; cv=fail; b=t/gaPcQ5iAk6XN/tNbUwrVZNg4vOrWQDxuK8BLpZ+y9vIvar3h/u25YpG2cxtUogn3LtV459Qmsw56XASx9y1LYKtu+RNIfkL4LiZI+uG4pbzGDwlmzKw0L2KSNAR/YVuCIScuGxLwwuCW6w8NluICKLt1MYmE6hRmyBZoTWcvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791270; c=relaxed/simple;
	bh=Np2wp8cbr86KAfvytWZ+ZNwKwPqSHxGI493sVazr59s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N7xMcJQVZbmZgY6gz9j+bhITpPK686SsLOnoQdW2Y6DfBnzZGbAvjOwqiy5KMh5QUIZGxydC4svf9wb5XvfruUl9i6krAtQCyYncEJhukQB/F9WUjIMNMyXALSooAUf3bWvyfImb8mpuVTPCm4jKr1rvDQseFUknufyzzDpMG2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d1Tt025W; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d1Tt025W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjkwiMt5aHMQX181H6TuOjSkrAI/f3cP8LjEo7wECQWOPXyRzWAz80NFUbIJSdlVmUKC+v04W+JA0YdjvAtfcQ1yLluP6Plsuxd+wIBLpWSgsYmYfS1wXLn2R6V+hVgfN30DMHx0oBMV1+EYfaumg4zv8QDLACr92YrIORNegHU2IpDj1Jb7ue+E+s1A4eMGrdod4mBnAibajThOH36R3K3YJGfrt0uI9MXrMAAAwYoInIJ2xK6d/NMF2V9ypyJe/8blSvwXBijQd90EIA1WAVNAd6wKya3PCMsMgltqNPkUBUC2OvEzRtrXWWJ8qf+zQ9Jy1Zws9vTsfJtjRzOCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkGYpXExzQCU6JpYeL+khbPWGQlfUR4nHQdWboEWgKw=;
 b=wdUZGJRYVCXkdwRZNW8r7JBj59E2A3MyjYD/vyZoTx1AwRW96vUFKTmHqxcaacfwZXuUCEkPYL72gH4Us44YFvCa6bV4Glk5KrcxxKykh5Olbf+xJmARz+15yYs8U25asHhkJOqxfXerZv1An8LeAVoKxqdrtVzvd/nGDtbNd4SC4aEFRoL7EYkM51eapCIkIHuw5OMa8Pw33PIpbKUQpQ4lcJeZV1n36HY1QciRT2pUMLca5jOfoA15U9cdyhccRfPbyvIZx1W3UGc+Jm4XOc5J4w1iMnAoDfGGmbFBAs343z326Oe3o2LShEiT/wjH9mOT1BsSC4eDE+nujC6FMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkGYpXExzQCU6JpYeL+khbPWGQlfUR4nHQdWboEWgKw=;
 b=d1Tt025Wb4lMFWOzFGPqrj+b5EIsDpS8coVBkW9CMEJzn5+35qa6aopoN0ORJqWfRKklsH6wyPb5cWUqkKTsy/MTwloMer9asc/k8WiXMx98kw6vgRdIL8e5GPvXMlj9NBFuxFr8zw4R6yZsvr/FP2a/ZEEfmXr67CuL8U/Es3XFwY+NzprObeCiJs6cgO8OkBlL3VKFDo3FQ4LxVjUFYSBb4icKVC/MCAfQkjv8pAZpTHStAc3oDhSMRGhcOo1zEZ5yBJQcW1yFAaAFNAdsqyYQhDYTaVspU5zHoPu/6VmJ+KOfp6AzYlar6GuBKlDyZ5D2W19e15VuBU5XBWKoig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:47:45 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:47:45 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	shuah@kernel.org,
	fenghuay@nvidia.com
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb() for aarch64
Date: Mon, 12 Oct 2026 15:47:28 +0800
Message-ID: <20261012074729.40042-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012074729.40042-1-icheng@nvidia.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a6237-45da-411c-09a9-08df28351a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/E1b/UGHKA6+5a+d4hAF8OT8BUZGNwuAGb4KnzriDKUjxDcbPZflO8w39FJGklIkScdw9JiLa2c9LC9zn4Lcz93k6DYKylzrQ+ISiwcjwcVj5EufK5w7fbu3+cu3xg98E+Z9owuZCl7UgUtEauEYazc3UNStebofKBysWO6vpwfKuI18obDIlvHuneeTe+mcHHK22xcApvrZyvk9fpTy6uNQnnVXI08KFxEsPz9AK+qe9MBBNCwl2682Y0YqFHQ+o54YSPP1k4e3IZFgXGOSVSCGpUK1zV5dTTkxCttcjm4CSoGgfGr8Vth8oq4sewWO6KGx15MVstFv3PmiN57VgYa/cvHtV1tlrpSJAw1c9365+gVjYywhb69zmsLgNcBKb1daBpyR+r0ebGBTQSI2G3z5gw62GiCCuNyb9VQi+1o2yTKk1qRCtvdFrGB3ifZU/vyX0cyQ6eX8cAOhML0ITyMH6D3qNMa02avZKY+12bRaqxVm/ifFnP2orgLRyo6qouPK6A1x8Hmpw990SrowA6l/k4jN7EK9mybN106RzUZjulTGQZ8hCQTEPm1B9Fe11iTtNAPjiI3bqUtvYexEHVV42DX4cGBnL/+2EiDxbNDl30FTSuPIGHdhhGH653gMmUBYpHFdg4IFNwbcMAr1y7bX80icuPsJ7qXfftSo8Qk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C88IQwCWmLwYDTcjXhsC+3wJMyllGSzLHfEJuUMrFj0TVcBJ0/9nTAyy1i+I?=
 =?us-ascii?Q?Uj29aFmGS/QO8ZfAD9MKTKmryodCRV+GWky0PSyvWLl36dXn6t2IWP5VvTWJ?=
 =?us-ascii?Q?j4GfGqY3zl/Nz4HLIEGKQhdwaSN52B6bQ0DKl3Z1Feu1rpFHlxUetbo5aV8f?=
 =?us-ascii?Q?q3JIr9frN+TMG2118Knkdqiuc63RSaH82QqsqZ66DDMSG0SJeO9nieoKvcN9?=
 =?us-ascii?Q?7uD34f8viPtGRlZoUlMWzJeKi/F1mD3HCjs8dahu1tIzBBzSniJo6kaAsdWr?=
 =?us-ascii?Q?0/uXCzUIVRVhI1Bb//aU9A4TLmURoXB9x3BhP/vEQypmhXjgPv0IUfhwDoG/?=
 =?us-ascii?Q?dyxw+zFDZ8ygFd8KbTkcf6N+BYs1+pqe1oDr5q/alx72+aNqkjj1cn8tNtjI?=
 =?us-ascii?Q?+FunlHahIsXLTldRnH5788bT/gtgKD+l9qngCi1b3Hc1JMdD+ho50dtNDVYr?=
 =?us-ascii?Q?X9Va2G8G6wrzYX/tf1XNrZ3mROUOo99LvKx7omlfeDBNng2bjGtnXIL5WM/o?=
 =?us-ascii?Q?DYt6YnENVGTshFDKae7h+V1IGI/uhvdAVBPXj9fUA2UwfWJpnhS9Mo25EAD5?=
 =?us-ascii?Q?JSRkAzTpblJJupBG1gwPQ3VEsbSJNlf++qzwhq9lJa7Nj2Vr/JqrG2fqdcJa?=
 =?us-ascii?Q?9h6xU2L6L6OwK1rMFNdAreMKE2RAH/4Xf/LT3jehkhPpBdLeVdjv3IO67E4w?=
 =?us-ascii?Q?U3M1SKuBrqvfOlAVAFZN1XiJYn2SR4jxvkNHlRN89KRZ13HZZ6gQ+GILlhfV?=
 =?us-ascii?Q?viz8D5NshlAHmt798dWjMEgruZTc3WUqSs9cPo6CvR0MMqArLXtvD1aBc01J?=
 =?us-ascii?Q?QSMryM2g4kDLhu5j33O2KvlHJmaGCIVDWZPUGTHmBkdFSqMePKaX+KtIJdgT?=
 =?us-ascii?Q?M0hED/5aTpDqbrTO9A6IwCQsUQy2w1cbNRr06Eb6NfZjfJnppm+7LToCae8s?=
 =?us-ascii?Q?ASBApJaJMc65ItQXq8sAzk0dUnplx5HKBsoMlMR22Q86yfSj2c2alBf1nEQu?=
 =?us-ascii?Q?m6Y1b1atEigZUAjRBk+ZM/l4zxd3nwx+KF8l2gZ5FWZ6WhMsNt55TqMrR/iS?=
 =?us-ascii?Q?EklxKT2/LQlKvDXQ3v+gx6+wSvl4BBZ14D0KFithvz36VxAqRQ2S8DNuqf+R?=
 =?us-ascii?Q?gF/MKce7+sGxtmD60K1dnoM1iHu349whAtUbslKn1wopLlhPS9rojl15vCgb?=
 =?us-ascii?Q?Ar33NDOqTbj+D0+7Vt97hbCB4vl9Z9sVW8TNWaKHYOX0hbszQITHjVXSAfxW?=
 =?us-ascii?Q?237jw2Ez7uaIJxtEaRKz+y4xHe3rzGy9DkuxK4hpWvjQYfg6GM3pCaToy+hA?=
 =?us-ascii?Q?4vJ4IQhvAZQTdF0a3Rt8l8JUrHMgbeR2sq1re9jCZdb0G8WlGGIjeG1ca/ii?=
 =?us-ascii?Q?QlERAE2d20fDQjl9SY8Pfbf41M33UTM+MLEyI/+Am55XzJJdAgNz3m3hDVac?=
 =?us-ascii?Q?8QZ7PaHSZ0rz/2bxpInrCNAUWB33pbZQkGOBXGe22m6Riu9zj5BkwCgfwEMQ?=
 =?us-ascii?Q?FTZ/9m4I4NKvJYTTjVvO/K5+Kf03LNHFVdCDwfOIGQ2u3TQnOfQxPLtfE/q9?=
 =?us-ascii?Q?brX/uRPca02SpZs+/csrLRDUbJJCQFTgkv+tt38NgTfOdjixvs4JCf53CzMW?=
 =?us-ascii?Q?q2QkgQNzmtE7M281b9JGUPqq+VB2o8EHr9jgZEz1wLBLYpDz9B1Q1qMaiqk7?=
 =?us-ascii?Q?wOlmNmkUydVOQkDt0blQEgo4Rg+b9Dj8zviQliETvc6Q2RaxpcKcW5PdwRns?=
 =?us-ascii?Q?WJ8mVCaJ9A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a6237-45da-411c-09a9-08df28351a4e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:47:45.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OJ2lzIb1E8JCmU3thBkMyCopjvga2/pgY75NCz5j50eR/1QReM8Pq44O97agJ4DqOrejT98K8wF+VZLj3no2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700

cl_flush() and sb() compile to empty functions on aarch64, making
mem_flush() a silent no-op and leaving CMT/CAT tests operating on
unflushed state.

Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
loads and stores.

For cl_flush(), "dc civac" only reaches the Point of Coherency, on
ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
platforms. Instead, dirty each cacheline with a store so that
mem_flush's full-buffer sweep evicts lines from the SLC via LRU
pressure.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index b9fa7968cd6e..eae0262fe265 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -27,6 +27,9 @@ static void sb(void)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("sfence\n\t"
 		     : : : "memory");
+#elif defined(__aarch64__)
+	asm volatile("dsb sy\n\t"
+		     : : : "memory");
 #endif
 }
 
@@ -35,6 +38,14 @@ static void cl_flush(void *p)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("clflush (%0)\n\t"
 		     : : "r"(p) : "memory");
+#elif defined(__aarch64__)
+	/*
+	 * Dirty the cache line with a store. As mem_flush() sweeps
+	 * the full test buffer (sized larger than the SLC), cache pressure
+	 * evicts lines from the SLC via LRU replacement.
+	 */
+	asm volatile("strb wzr, [%0]\n\t"
+		     : : "r"(p) : "memory");
 #endif
 }
 
-- 
2.43.0

