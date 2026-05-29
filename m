Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87530567E;
	Fri, 29 May 2026 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021459; cv=fail; b=XrcIyY7xns7kgCPgnV6R/lTmImzaTZ5LI+blhDH7LFoONFuWeiMkFofiMQ4Qk/Xki8YghMYY0BAZEVSnWsNetREggO8SFpA8416KBOhYeBTu7My7tZRfcy1VT+ff8X5+88kHfpqH598uIvnymxqperSXwrsf7WZPc0d/y+bNvnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021459; c=relaxed/simple;
	bh=AJcmhvfjkG3wrwE1QvdiFSEXm+EqWJ9hSVes5z9bfoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EjsF/gHzBsXfYyFQceUd52zFQ1ucuIEiOwrU10sQUHwurLzJVoYmGRKxrdzl3eUKcQ7usAun4DFVAN+ajDbZRHqFanowffDGZGuNN0EyUOXyXNyEGCjndvUzJf0DL9SLiIYA+eB1GkOLx37vL2I+kO9WBDuDLeChN1WYgtnH9O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uM+EqcC0; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uM+EqcC0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmD1KXwAvEqWc+r6InZfvmPD0uwIcKSLcM87Iprbp3zLimLtZgR/Zmbb/OXDySjc7wIjK3FhWVr/zERpC7oWRyBTxmYDyc8dQfLObrpF/ytk7fySWh0JG9ZD8gPtw5J+RDDPPXxkH1L3qm/27SIv46V8LGvka0XcTbrCpYEiCVQWLdlsdUMd9Z/mjjkovGZCoJHehlD7piAfPN/ze1IhMkIZQVfQi0/xn39d9LxxR44CS9Mz4qjXGEcvDNJwU/AjAdqPr9ToMvu7kc9rZ8IgqRqHZI3FRaXKyCU2zY1wN1qG5CBHDLAdAccHW5x1MJEKp/VO/3FuyReucI0q8IP90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdzn/gZN3lApMcc7eDdFwXWsmhOfvxosLhpWPJ0OR8g=;
 b=ykr5ry/TXVkNql3/6kcpUj316e1QaXGpiM8muuoToxjQ1vRe7ZggCIGSp+kkB6WKNv4MN1+EeOW32ZnI+La+QZzHrI7/a2Hxe0dSs1b8bv56AcS+ivDi4pF/8t+KL1hIdSwkE4Jw+FYIGRiR1qswJHecStSjivhJGDMA789H2y0cfpFuG/ulJ8cQpY+R86x0Rrs4TnLWbNdEdqTlcU4gAG6p2GsJbXTixe6/UEnk2J8Pp5mQ2YkvzYFvHJt39+e3N64Isuu0E7tahAGvzhkcpobr8WavnA/hmcnM8+p+0mqYL1v004Thlv+81TSH3NDo73LVH0mOncMo4lzJCg24cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdzn/gZN3lApMcc7eDdFwXWsmhOfvxosLhpWPJ0OR8g=;
 b=uM+EqcC0vHIzKW4KAYygm9ITjT6e1U1fTjA/T+C8lfnuCBEs7xDihhwAHo5wBVXksYLeoqUBj9rPW54SDcOGJbrcWDpcpYecPkVVSulx/OB8Q9xgzvBsmBxOmeA4iw2+jzriCgQjjZ0WZ1cmztIy5ZdgUuFcRF3tPtfr2x1wJHnSUWlJnl+FHNfVZcydmI922arHRjKQo3gn/FTKBkp4g1svy/j3BtvxLqUVWJdwhcJlMiceDA/4UySUjjW+hCBiwU9VTHKPx7UMLI+u5egGRRnCq3+GyfJ+W8Dx5w7P02pPywRPPL1A2VaM15HmrutzeCw7h/2t1K2ACi0wiFHDDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 02:24:13 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 02:24:13 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yu.c.chen@intel.com,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v3 2/3] selftests/resctrl: Implement cl_flush() and sb() for aarch64
Date: Fri, 29 May 2026 10:23:50 +0800
Message-ID: <20260529022352.8308-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260529022352.8308-1-icheng@nvidia.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0007.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::7)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fd17de-752a-409c-5a49-08debd295fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FKh2JQyiZtJu9SZBqG6noxNgv+vkNZH2dAjgG0v9voQMYBiVjZmoNaAdd+S8Bh57tSp0aq2Z1dXPKF9teUIJ75a/3vTyiHLJK+iRNn8ybZTv/7l989BWK5eF4k7JCpv2pB582q5VAq05xddB/4ONvgzZiH7IM7P35A0N8LF1oNYiUngLojqohX5+wWfmH+Bwge2C2b7nYZExb/pn8TlxkkUW14XjKlh+9teD5iRsJBxxAiC/afnXpbeUezmLJSqt4EAVcCfaEJ7GuZGDPUYQj+2dfgvdM7jlhI8b6H9u8srPOvfpJKDjQ8aoy2hx7vL6/51zdDTRTug/5yMiHfL/YagZmWuj+adLI61L2dVVQS/gti0fel3DEXAcEhybvSnupQkZyLXmXvm7DsQXruMZP2S/PTqoF2Ybf+3scQfP+QFk7j3pJ6FkhtibcUyb0tEmpRAwrFxEV3laYB9tn1dEXGCWL4dzZFuat8yOMkeBPzW+3hHFCmaqJxqbNWnwjQM9AU1844DK3Lz2h0juE3N5b0blvTlOevF5mHGl4rq6RxkLeA4jg1Bc0AGeZmb9HHnu8ck4WzGr+zM3WvYqn9dRhb4SOrXfrf+DJNc1sqi/QruTj0tWdhOeLkTh61rknWVaBgZHQb7oOeH3j65nsi/Sw/FYhXYa5U98KxQLHhrFzFxu6GDWC+p6lo7KG268OUwk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iku+FG9uz55vBB44905GyVorEyxmbhAZi8FX+/+B3ozGZJQP8mMHi1JmhKUp?=
 =?us-ascii?Q?3DhdZPLbcPNGRanHDpY78NN8tIcJs5WuJhfhSx9zrugafP6JNbFSdJBqxz6y?=
 =?us-ascii?Q?7d+e0oop/HUnFBlbtt4zDGfz+//2XQ4TrHmdmDlTtGXmlVir62IL7FRtidiE?=
 =?us-ascii?Q?ngil1lNVSLJzESfpXhwzsz4RWBAG6thu+1FHGVgt227t5gI/IrcZn73w4tOS?=
 =?us-ascii?Q?Z0gFa+48q2eCmhrd1M8JjOuktcKu22ErVitx5lQBPGNuyjVeqtw3fRk02Zqe?=
 =?us-ascii?Q?jN2g8aRhy6WC4YJnwtNDmz/HSm1/JrLudYeAy7+5k4RzNPWUJM2s104wDraM?=
 =?us-ascii?Q?YwgQXxVQni+ouIhPqZYk64PZ4mzs2mjN2IuWE3c4zRWA9F9VIOZQrT/gooM2?=
 =?us-ascii?Q?QfRWgyWttjDhD75B92H/ibL1U/EOeeJZwX2hz6HCYXPvREziluka4er7Bryx?=
 =?us-ascii?Q?nQ5N2IEE42mcsb030Vo8UPzcZusuFGyur8gsXmyfSCB+RghLvbt24wS4FjFh?=
 =?us-ascii?Q?jOUyMW3zKfZN7hmiJpFcE4SeHWSBBdLJaUUTGm5HePgoEO1ZOMegr/IV1PfP?=
 =?us-ascii?Q?UWb8/VtV0CyUX6BDycwaIBpW6IByraBipf1AwzkY4L/I6E7rXlCopYuxBMwQ?=
 =?us-ascii?Q?gJYCSY8xUfO40s5sdIiwe7k6DycNrC+PjfzgTonP9OFCPY8jLe/LOCgJWCfE?=
 =?us-ascii?Q?UnP5LPg9OV9692HutXwntBe5/XEmaHCN3LDpn5Qdb9xnXxuI7oyJlfFp+wKe?=
 =?us-ascii?Q?GjfmWGZ12/77/evPkJ3WE4DJfRIPvbYo+X1t52nPL423SChKOb8OjvgkXKzR?=
 =?us-ascii?Q?/xr4P905MZFo8TjwrKyqo1NaKFvPm5PknF+l+Ss64XFUfw8oH02tiCjVzH0D?=
 =?us-ascii?Q?GkViaSkwj69DKoBjCj6qN9UcTp57kyzm0W9nIAmPG0rRS5Fx4UvadR8xaELA?=
 =?us-ascii?Q?xWgBEjcRT9ijVsNwk/tmYOSBmyryKwZrilGpWw5FVFIQqU18zefW7GwV/HRI?=
 =?us-ascii?Q?hX4DoP105rZlFEbvLMVAEsuBRF1wU2zUv1Vb+2g7Z/GDq5wmQGQz8c2AdDuc?=
 =?us-ascii?Q?pZfnJReQSESvOBUiHebGaXj7lq1avEvltDD/G0vvJ/6isZhBImmwjKL7n3vW?=
 =?us-ascii?Q?qs9aX8rUKDti7qflVsRcoKV+lLm6FlN16KjIBcaN9iC6AR4wkYjo4Q3QceGe?=
 =?us-ascii?Q?1sR/p2Y5F2Eb4aQEwnLgVa5HAyvcdim36MBJoiFJWVA9F16YlsbUoi02Do0z?=
 =?us-ascii?Q?757vPlCbnwk6bA9uCj0Agp35YxBM34EMym9jmFLvNFNX8Oj8fCyyNlQQl7+O?=
 =?us-ascii?Q?NQZ6NS8D52mX/E8ATh/ciwK4VhHHE9MPazlajTNvxnPJLxBjy+fM0qJ5BTgr?=
 =?us-ascii?Q?j/hDMhgowZmHiT37W5K3FJd1oNUJx86ttgdGGdaXGdwJZCHSCaMhzyS/HWtM?=
 =?us-ascii?Q?oBnhQ3KoglagozAV2DYRwWNUwvKHAKlqlZlXMgrpa3k6K84gJiQevjl2H4Wm?=
 =?us-ascii?Q?ljkHOfxKKO4NIeRFwkXeFTM4pouyOQnKo/x7MkjYfVDUXyf6q8r726nGWR1w?=
 =?us-ascii?Q?+yo1OR7b/8YfoHiD/z88t7DNI1YAx2+hKvgDmxOn17R9S8EW06KKC1HVYRKZ?=
 =?us-ascii?Q?Rs/DY2d0wb1Q4gW2vZKSj5B3Gj6CRv4iyWiSCnxIzGflASNUoTl28qzoL9px?=
 =?us-ascii?Q?eZNnvIc6isP2gGFDmlQqDGSTuT3pa1UPRJacpflM0rkcr3vFnlBylEAzFidU?=
 =?us-ascii?Q?BRnDq/VNdQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fd17de-752a-409c-5a49-08debd295fb4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:24:13.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwXNSaPAat5iq2EWWcv1xPtYm0kFYFtcBhN047ylv+pZfGIbdBi3pYi8dxQci/6LG/TAFAZXKdmKQzmKvmHo8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

cl_flush() and sb() in fill_buf.c only have implementations for i386
and x86_64, so on aarch64 both compile to empty functions. mem_flush()
then walks the buffer calling a no-op cl_flush() per cache line and
finishes with a no-op sb(), leaving any caller that expects a flushed
buffer (e.g. CMT, L3_CAT) operating on unflushed state with no warning.

Add an aarch64 code block using the ARM equivalents:
* "dc civac, %0" for cl_flush()
* "dsb sy"       for sb()

Both instructions are EL0-accessible on Linux aarch64.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 19a01a52dc1a..a41d21e5a64e 100644
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
 
@@ -35,6 +38,9 @@ static void cl_flush(void *p)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("clflush (%0)\n\t"
 		     : : "r"(p) : "memory");
+#elif defined(__aarch64__)
+	asm volatile("dc civac, %0\n\t"
+		     : : "r"(p) : "memory");
 #endif
 }
 
-- 
2.43.0

