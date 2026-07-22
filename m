Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AC368957;
	Wed, 22 Jul 2026 02:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686428; cv=fail; b=XNgoMXe3MlnfKYbl37vJjd3zWjUuZ5VQHyiAS9XjPPdixfRX420VMWC19A7TAyx05EbvD0LIhc4mZYiB1EWFZQcZZB9Lu3nqy31qlQKx2c+eBGT3Fh8joYPVOYmXBiZS1Rj83piWBfb1MV8ito12+r9FStL/ZQhy7yqtil7tTd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686428; c=relaxed/simple;
	bh=E2iN5bf86ahRJVmRv3fShnrf8zrBRSJ/VWMUD9rCeW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0EqQBg9x3rXDCJGbSoBvQ+2qOu03iMAxHMxlsYs1FTnDgoyQpbL5j9zgT6U5+cJ3q7u8u8IRxOsJH5de52RueC3pvcI9GODAVRRCdmI7V9PrykxzMl33mxR08LkN0JXmUA9fpqTjtjgkWJ6KBB2P+MtRs1O1zdzBzsTgga89DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TDAiQHfx; arc=fail smtp.client-ip=52.101.53.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TDAiQHfx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLWA4xNjEbTriq4j6nBpSg2yzzQxclJUjRYnFLYR2cym4UnzGK1RPrA4B7HMzwzAX65oLY8JwFUOV/5+SDZF1RCmUuKwSdgUkbDoNOqRvWZjV/SCZYow7omNbIb7Lhzk7oxUQWVQTrHVIiqYTzIgMTZ2akbdCj+MjjSHx/VtEGxzhP++dnR9Mp2PR2lOWjql/ieqEIqJJ23QdyvnLLF/pt8b5MmNxTofyHu1TjCjumcFg8nWUVq8/ChxgAiimSIxDYUmfFNvEm9lB8J9hipDsyUzGXh6w8ZR42oREgVx9nPmkILkfZly27TxK9lHQ+kxlSEchtCJhNb7f9I7A08hGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KccohgbGezuecjfZNzfTsKmueulNEvE1VJVdIlhamxY=;
 b=W1p5nne6sLXaHfuBDeRnJIzx8lLz4GeZz68qxysc09oB+LO9XvZSWk9JeNIK2x2Pd8okMcycOs+Q0pJ2T4hOhHJlrVoF04DTCt1o9/Fh3Z0Cebh+Q3h+D/E/iQD0pLAk4bctzA4knHAOoHNvTZO6YTHiFmo/h7aRfIeqVHB/q+0uoPJCX7PPZXyfpPabI0uE/bjBPAYSYlkW+d15DxkqDDuJC4OzVV3Dv/itPMGkFoGT4SnPyuO+f5m4Vo3ZzAN5ZaIIUp6kO5b8k7ThOOQi3E/EWVSIVr6EOOwCgKHRYcJo9T9aJPRBtmdyWSGEF7ZkXSowkuTS9kbZVRjXoyMWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KccohgbGezuecjfZNzfTsKmueulNEvE1VJVdIlhamxY=;
 b=TDAiQHfxQ655SuAfOM34HTa2weOcgzOx7jlH1rwZFX6ms+WHf1DVo/dbcb7fDUPT9ZrdwbgfUaF/bbZm6wr5oWfulrv97ampCcXgTwqpic/eZoceGBwFnW/goRc+7vBlG5dY0RzsiNqUivwE5GVJP0YVXgCRGELsfY200PWSvHXrA/t/xYmOlymiwGcb4qj02Sipj7aShxMIr6Cn3QBzJlxN9zWAe0nH7NCFC8b4Gy6AQIIk/LNHiR3e1pZ/nQFQR3zwCg1veWoEBfSoVpCyhQmBeTplXq/FzI719BpdEctfYiOPeInu/RHNq9KphFkJeGdZHG1QiTRkxi3Eyr0NuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:41 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:40 +0000
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
Subject: [PATCH 4/5] selftests/resctrl: Gate the MBA test on features, not CPU vendor
Date: Wed, 22 Jul 2026 10:13:02 +0800
Message-ID: <20260722021303.9471-5-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: fe083fea-2016-4580-13f8-08dee796d904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|5023799004|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IwflLwxQ/sgwITDXAteGHU3vVGJU4Nr5VzA/i5F4p+hVG5t/U7kapw2vL1LpQZOrGXd5/DUMgvfjPaSYQokSOELygWWD6am/BXKIWY4MTq76dwTK0Y2yvQpivmrRwsBWp+waUoHk39AQQa92O+AUWBs7IoXo9yWx7pp48Lr+G4gk96PDgQxay4kYzGxbzRE/ms2tMFPNnaw6i4yp+3Ohzugca6Wqjtwlk+fN40P/zL2nJUkra6DggEQFcgJ1jju2I96tgLwDvk6aGh3LR6fRrpHkUqjNWxMYEz3Zhtjy9P8NeyMWfBnhnqTBGP99k2KQ7PJKn4lvDWminGWrVTyW+0AaH65qwyamBlv0Yp3G/Aoxu8cgNHznS+bS612zrLX8T/o1Kws/g2CNNozbi06+ZSRrD3exjPHFaMuja0oD2pnVwBK7mswzjdo488IDDLncIq0BenyVdVY6sHUXEy0MhEzb7dn8r3uEVxqTxB4x8ozAKFYkBnUavqUvShsB26xpjcw9EKh0MgH+my04gzSHwoZWc6hnDeMNlXAunp0L5jCbrMvjYqWMtxNmi/xOPa3eCC9KV6RVIWX6vS60kxlbza63JmvmFpeTQDN0P4UuyeeyB7k8W/8yJjYHXzss0+enpSwzG9pDWJm6JGKwqsOV6I3QN8pP/mG7sWEiwAOB42c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(5023799004)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wcIHqjTjTHTMBW15whxm02gvYjHhzDLNxdzcoXfoDsURhgrbxYLQ4psZBg+i?=
 =?us-ascii?Q?8kKFBlkoo2GeAcKZYeg6ptWu9+LObhkde1ln6YHNbiOvdGEFcsC69E/EZRTQ?=
 =?us-ascii?Q?ffMwMqFVnKiNBLR4Y3naUtYjJoAxupVVDqBUEdrqYlWFq5vE7oQF91bhowN1?=
 =?us-ascii?Q?lZLM0Hhw+jSgI4+jGk4JfI16EgB1i8VedSY4x2q0IBZodkRT0bcOG3XOzMj6?=
 =?us-ascii?Q?O0jNHQEkVHcYU1+jMWw6spaXVpmqi/8JGE6moJT4P0tVISjdg1kMRc0AqlCT?=
 =?us-ascii?Q?xcpknMBAaHqQyRRzbOP0kWlqfnf4yVNp1BAsrqQuR7od8ZE6Nw4l/DStbO98?=
 =?us-ascii?Q?na+4VKT4gq1yaqyqlI9b1ult737R643iVdiSg80jeETH3kVNDJbfQfyn83Re?=
 =?us-ascii?Q?Wp/LktaHQkSSwq+JSNxhO+HvanL74wRAvj/QUvtnTD7ad8G6LIESjKlqL1xd?=
 =?us-ascii?Q?MG9B4qTFJqHSsvZswfFKrLgPL5IXV3P6UrLEyAufuBWa1h2uwEGsE3pVESU+?=
 =?us-ascii?Q?bYav4U3Q5C1Ww5epAF04wEudzoc5km8mHLC0V3nOM26N0stbIKUNLdaZhZj3?=
 =?us-ascii?Q?9UBTw5IhcIDhYWNoRauyWVBpsiIZ7pHdS73W4btDAMtQPNTZIkXX4Jo3SckH?=
 =?us-ascii?Q?Km7E/7KFRhE/IkQVDRKzRLMJRAJySt+ur+UYIx0RhkxjvgzEgv/hmfkEgacB?=
 =?us-ascii?Q?OG1vAA9Hgf+rweFfiYOaDQrblmFOrnsiLw2Dr1Uc/KY8JVkvqH45434JAlsw?=
 =?us-ascii?Q?NCkOjsk2p5upikz1jvGiD11ZUhG9DOahwYZW+LhPzEv23QeLNJ71N77dizuB?=
 =?us-ascii?Q?Bo35SSIXqyuV+aEHKjhi7mf09BqZjk9oOG8Xr/GGOMvWwl0vVhZKrY8uKkVa?=
 =?us-ascii?Q?KJwVIVN368wG6B6FedWc6z3Pt4Nc8qFeWfD3KCANG5a61huNexOp0p1099lt?=
 =?us-ascii?Q?ytNAmBpTIhBTQqL06LPiFNe21zIm9pfaWgQnNfm5TokhVmUZk9DEgy1RQ+TG?=
 =?us-ascii?Q?EwNG3bOA1AWsoN5P8azaHY+Trh22qte8RjLZrj151lBhuE5JjCXzUyK5EnZx?=
 =?us-ascii?Q?/Rd+TFFvZ9sSaCbyQJ4zu15Sdbz6Z9z7HU56Md273KEBeoDG9YpL+VPuDuiq?=
 =?us-ascii?Q?7bfK2wu2kzvCgvLXc5ardlaXk+bpHcWniZgqPueApB/p8/iUmjJOR5yXZQwu?=
 =?us-ascii?Q?Yt7dhZql6X2E07Va8Z4fFNmQPNVoPartTkf4B0Ib8HB8oC98VlgjRCky8yXs?=
 =?us-ascii?Q?6lraWLbqu2uvw19nR4sTMgLJifTuaYxd8pTWLvM0wk0YDQLuG6YgDrkJSx1D?=
 =?us-ascii?Q?kpmbj9oOaVchLc5PXy/d9Ct1PkwI0k+8m5LymKSVGttW9ptWiAWvTzHcRuRh?=
 =?us-ascii?Q?IUebOlTYgpzZhC8nJL6oCL8nWwzMlEelYGulCzVhpIAHNd0hXM+OXboKsDJj?=
 =?us-ascii?Q?jPCA8Icx1fjPXCAp1NmnKu/f2r3siI9GxZU7BkZG3MIJhR649DorZqt5UfHV?=
 =?us-ascii?Q?MWdxRLyTLaZFSR1R2XuSqKP9FGnoOCN39GNc3KHUGYr1ET84iIQe1FxCXKGL?=
 =?us-ascii?Q?IXnxOnbc48wi3WwxRTMeowNYJ7HfaP+hqbl3CixKbdEOgP3/QYg9NuxIPQjj?=
 =?us-ascii?Q?iEBixuQESEMTFtCC1G969uchi2OJcroUnA782JAaM6x0DiBuMxopPWFMOXxB?=
 =?us-ascii?Q?HijqPdMu1wKnepASTM38b3ZKyHwJkGzKxdd4I4OdlraAXNqk/ZtDxs0j/uV9?=
 =?us-ascii?Q?fhGKdYl6oQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe083fea-2016-4580-13f8-08dee796d904
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:40.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XKqHIap/clbRVB2opIoGo47onQMCSDASKEeAwJ6bVrQrpvsVXKo8tkV/4cj0TXGLAia0WzTV7bO3sAnN3DCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The MBA test is skipped on every CPU that does not report
"GenuineIntel", although everything the test needs is discoverable at
runtime: an MB resource with a bandwidth monitor in resctrl, and a
reference PMU backend to validate against. The vendor gate also can
never match on architectures whose /proc/cpuinfo has no vendor_id
line at all, such as arm64.

Drop .vendor_specific from the MBA test and rely on the feature
check. On systems where any required piece is missing - including
architectures for which no reference bandwidth backend exists yet -
the test reports SKIP exactly as it did under the vendor gate.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/mba_test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 6c85107c32ee..22a887a1b4f8 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -208,6 +208,12 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 	return ret;
 }
 
+/*
+ * The MBA test runs wherever resctrl exposes an MB resource, a memory-bandwidth
+ * monitor (x86 local bytes under L3_MON or MPAM total bytes under MB_MON), and
+ * an independent reference-bandwidth PMU exists to
+ * validate against. It is not gated on CPU vendor.
+ */
 static bool mba_feature_check(const struct resctrl_test *test)
 {
 	return test_resource_feature_check(test) &&
@@ -219,7 +225,6 @@ static bool mba_feature_check(const struct resctrl_test *test)
 struct resctrl_test mba_test = {
 	.name = "MBA",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
 	.feature_check = mba_feature_check,
 	.run_test = mba_run_test,
 	.cleanup = mba_test_cleanup,
-- 
2.43.0

