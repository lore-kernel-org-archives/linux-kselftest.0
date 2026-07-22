Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BC3E7BCF;
	Wed, 22 Jul 2026 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692805; cv=fail; b=mz4lMo/vcerIXSoOdbiR0+jvX0raDrwDIdGLNRFKlPiXFx8tu3y+mgkMGh9pPkWsdvT7R0pXR99ZKZFjAz+sSTdH148nB3mYpcQCi7pEfE8HZ/w4v24RXhjM5jXbyxi20fBFfLLSFgpnA7r3DytpbTORPKkZoMfU2Wmabj1O4GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692805; c=relaxed/simple;
	bh=gYBTHBCHyD6yMolLGXUSfpz1lZhbmyguXmHlahUquQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cl0hE1PF+dZs/GsE9qCD/XucW64vFU1OQ0FZyF7lCtwmxiX0GuNPCNJv4gZ43g6c4sSVUlcQVOPh98wrlJVDDIuqa0gPXwDDtKIKAiXHD+u8UwTuJGjdve3EFvkn7WvmI1mqiUi2M5rA+KzJLwT3PAfcAvLnzCkTvJsJJkLZ0io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mBy4VFAu; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBy4VFAu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouJC8j1ClIprJz52NZ1ExF6DoEHwIwJVypuLAGpqMsdPksfOLDQjxaEEKNU6wRU6gcPPE1BP3fBM2NihZvfzAx9auP+3kE12zS/ltSN7rAl8lp+eewZKJpWjzxvfJmxXZHtVz6hPSiNIbomlmyFd7h7n9JmlH9xl2MXPk9UoblpPMoZK6TXN5iwRiInrNwySwOLBiliZOy/Nk49noQYF3l1jaonj/wtl0AXVyhiCmQP0gSko482Dn4B487Kxq3oBJuGGIGcGxwBcJqKkId0YfBcn9hFTZ6qQ4fu4b8jZKmjRpdjfvs29o10EPOSgRmIGsjyhzV5tW6boTCUKHUozjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APnSpf22TjVgcA9dw8iyLg4mq/znI0qULc0a7w05yho=;
 b=Ya7NrbpUbv2XjdhWy7UNgDgz8ZZZOUxyck4Q4y1xpZQnuGpukvrnqeOdtfN7wYzkS6Dakis7vj0Nexq8etUiTr3/ldSow8sgvWd/P1++d8NBoPBtS4XzAObfNbgqOnVRrSEes7JVJbS0jrKekbEY45cEGuDMh3yzo3xFPdTiYuOrmzkY/m3/3pNmgyJZGA/wKbWOKUu5rpu9jZ9/iA/ttxEd5FiRmn3rr9Zj4eZzypAqTyMTCk0DSLQhSRgfVEwO3EWZgRW//gnm5SZrxD7fr1Dv5FTrQPfj950um0MsgSbsHVlhLm8YUlJxNce507gV6yn2D7p8Kfc7L0QLIEUjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APnSpf22TjVgcA9dw8iyLg4mq/znI0qULc0a7w05yho=;
 b=mBy4VFAuB3VdGs2vnsuoxf/EV5q2Xwfgye2VTSHqwfKJv88tjEROfNkM4BLiPb1KdPmOvuBtRToNAOLY5y0NqePm8/numUYTeac5bE1lRY07a57dZOtALTKgq5rQVcUaqMsg7UBwVnxGWgC204yQqKR5A8EnLiW4MejkSwN8IMoiVOk0B3MtWSbMIb7KcTAb32mY/n0XDl/WW+byCLOAjv+QALZbUqZSF9iDnN7lJwB1pIms9YZxCNYQpDLcgqsij6/yW7khq3m+N8f/a1QJLNCW5QCsw6NFqONcgVuWY4Dt0rS6imRbS9Kz13Y1umfm+JW6JIvrpgMZ4LGWA+VoCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 04:00:00 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 04:00:00 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	fenghuay@nvidia.com,
	ltrager@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v4 2/3] selftests/resctrl: Implement cl_flush() and sb() for aarch64
Date: Wed, 22 Jul 2026 11:59:42 +0800
Message-ID: <20260722035943.32337-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722035943.32337-1-icheng@nvidia.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e63d615-5d60-4d4f-09ba-08dee7a5b345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EPlP06hhRHNIQNqfUTkKYim7dMvZTMu3qh4oQBbY2SHEz6oSH8/ARBL9G1mMTBvcyjcZbfTsIqN12llooMrJ+ncIWpCo0esXEZFXJr13WHttMz8ioRFDkNRvBZ/Qcf11yDZPXd8muVUOfkpAJeZx+KjaTcBpYocDGrp39gm81TIOtMWgRGhY6btnCiVu8WzuTahDTFYwn8tNZcg/Z3ofK4KK7qf8/HXI/ff/z2teKLHxbt8T4stxrFvL54kuNIzFM/CngDwyYz5Q4iL5WiLGOE57PbZA41hXa5hZhqm7JajoDnHWTgBjbxx8WrePXTSdmFCVeclwlVTJ4cAtEB5cNUhQwJ3J1i5SKCDV+IibPKeIbj02t8xw2VBLEvSiEwqVCDwIqZPWEdqhquhFAv1Ld+Qim9bEv0NFLveMSYg5SIkFlhBedcM2dOyuqII7XMdVw+7/QT3gRo/ijdUFiKhybf5BU9w4lPe2aBYy9tyGUtIC4nMQ5DoTXId/EEk5NCLr6of9UH6a2UZfBWfMihX7SOzO0ZrdKA0wE52hvNAk7IiIwFi8ec6lA0H+x5Ojd/6YTui5KugGMepFPXQZ614cICqGQcRGX4sfE0NpzFiPZg9rmRfao2pUwTT8jkECNFwRbCUIJH3q4u0Etee7UEZF6wiD84CmQrAGhc6BetkOr0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XoCCJDGPP5MZ2MyJJsCumtRxs3xSZZX3S+VmreDLclfxQYxay3WnXIYREJbN?=
 =?us-ascii?Q?/dyJH2wh3/bc0kX0qo62NzTuhyPhRBz5UXFNig+LQcQTbofd5G8H/GNULWiS?=
 =?us-ascii?Q?XB7PZN0lshBYoWjIvH6K8/1bMS6pwnrqhEEEsj8fYbnwgYVOsf985THAFgGo?=
 =?us-ascii?Q?WpkA93I5kseTF7nONTmeOLR5LYzI6/rFpxiP33xZJS9Pdy+XE3ehae6QtpQY?=
 =?us-ascii?Q?3Rk5l93WUqeGyf/xnNSDYWvX1bBzcTNGXthxIZiow3Mmjle0rlBHGvFCDoAE?=
 =?us-ascii?Q?EIl+W3OhPPJp0k5vv1VefEErdCkwn0gNzsVhzUqUWOm/59qPC9BMieZSQFze?=
 =?us-ascii?Q?lxMPLyfdNF9chfAo1u99gP+C0Myn6m03jHa5VAH9hA3HB7jfnl3qojjUhGCB?=
 =?us-ascii?Q?GOWuLDatqZuGKhgxscYwT4Sfw5tCX6sb41lXhisnVAP030vBHd6Q5ozjaIaS?=
 =?us-ascii?Q?wVxVWwR9/qE9hE2/6X4pnTZQ4ECwlszX3rm1rGHW6n/iyPkawGiuWby0Fkxx?=
 =?us-ascii?Q?PJn3GrrLvIvqQ5NsO+cy6cF+M7nrI4qFOY8dw7R/afhf7h+OYzy/7kjhUjaE?=
 =?us-ascii?Q?UODcPEzBC+9uvB6DzBA3FK/RUHNq8fZyJPdY+P6U5lMFFwQXgMXEcrA1I7Eq?=
 =?us-ascii?Q?oqjEYS14FmKeod/MTFXFvTsC9rpGKIOGyZ5b9wLX5EEbtYfBExF7T+Q5p0YE?=
 =?us-ascii?Q?E6u80nmWpz5Wer766A4YVbjyFmu+buuu5cWUKshWsqNQhkRgC0L08+dU1F5n?=
 =?us-ascii?Q?rHMlQizh9/ns2PsN0jB7I1CJItPOChvkABtqTkTkFTl1A9TfJJ5DNfz2ElvH?=
 =?us-ascii?Q?kLwbzwCk6xQ/ctp7+763H4IkUgL+D/zzU2BuKwHNFhMDRo+zSfam3DCqjsAi?=
 =?us-ascii?Q?uk/NjjfsvIJO4gSu0kcF+jTmvUtR+Kdxz8KMB5CYrtlKhqz3TBE4LkVxypMy?=
 =?us-ascii?Q?RSzYFFsEDlP7RaWUN2vid6WkS1GyWBxETGOrdVBF4XJs2dptwojIJO+iXchm?=
 =?us-ascii?Q?zamxTgxNFPzJaGgQjyROhw2/L45wYktpREE8tcF9ehKf5jMpDsPUfqT3pcAd?=
 =?us-ascii?Q?p6AZdrF/GX2/wqqG0LIMQGrzMSqBmmCUln5hpylJrzKE6oJzoT8M6mggJdbK?=
 =?us-ascii?Q?2u6GlZJv49SG4YxEnkzTPpIXX5BeiKR8bTRD1rkOlXiCoVfY+MbrzMvbt7Lj?=
 =?us-ascii?Q?f3O3kEWnF7vmzBbJVG0qePrNrX++p6LRDjLUUcC6/ahBw25T6u6pUnK3d+I6?=
 =?us-ascii?Q?EUUbv4S9RR9cqEpO+j10VpoM5X8lZ+I5Sj4VThMM20CVJp1PbIjrF317IYjH?=
 =?us-ascii?Q?VzJdTTUW7cSkS5EHyKnAstR1F7XTNBcwP/o7xx/396Bu8CKckeKqkG0IIyVp?=
 =?us-ascii?Q?RRMPamjxllIomm6Kzd/6L59/6qHSY0nRIaV1cvZ65IaxQNUmQSb1Gx1TLBj1?=
 =?us-ascii?Q?gGaat+Z+VivMRXAXWFZgklrOopkpiM7owI9kZ1Vm+PM5USz25fy95deDbZQw?=
 =?us-ascii?Q?5/jXXLk28Ly/6B6ML8PlSZG2z15qknYrF+wzo62RZJiRzAcdIRWsv1iInVdd?=
 =?us-ascii?Q?K0Rg2L4gh67t2FxkfSQHD8W8wvnEUrD7/iPVxwsP+Cl+2FqMXQAyppE2+N1v?=
 =?us-ascii?Q?ieILIX3i9eT2sbhv43wSth/iF1xl33usjd/Nkg2n/DlcunTeZWe3sMXiItwW?=
 =?us-ascii?Q?fqzGOMWdG6zwiQBZy16Sc90mxzQo7qU3X2me5bSMiAKaZWcmKu3Bs405f7FV?=
 =?us-ascii?Q?Gy+X0TE6Xw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e63d615-5d60-4d4f-09ba-08dee7a5b345
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 03:59:59.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZM+F7s1o3CQ41gQz/aQJVZ9Az2uQjxj8KxPCzcVLewKwhx13vATpnxDhAngJKyOGsu+B9kEvciVE+ZLB/OXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

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
Changes since v3:
  - cl_flush(): replace "dc civac" with a dirty store. dc civac only
    cleans to the Point of Coherency, so it does not reach the SLC
    where MPAM cache portions are enforced. Rely on LRU eviction from
    mem_flush()'s full-buffer sweep instead.

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

