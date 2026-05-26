Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD4C14A;
	Tue, 26 May 2026 02:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763384; cv=fail; b=bLL7ZUb5xVw8iOiXkoxuZ5yVNPoHkp4KkNFCbRnTJUceug9I1fERzCsHLB5jWG/2a1TFMFoUdliYQmRcs2z5U0f5O39qityCImh4nxJAk0dTE0UxhSPw8gdmY92D7fUu5br4bcWZejPAsZ3D4uybd/7+wasPOdiKhfb7DiQnEc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763384; c=relaxed/simple;
	bh=AMMJuXH3hmbmxlZUV6EstzgFziSIIN1bS9+sDcPT6aE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o0IrNuxbbOigLM1+Wg5ErVxH3ZYqcbBT/D9haDnyF/mUo+0uagYWS/e6+jp/jFXSyio8AGL4USpbgXioJMo1zqES1JxB02mrBBtJ9NSwshQy//PLy/xFuNsy5fqJ3x7pLRXsd6A+65aqdhVOJOHuWpfF+3KukukJN9aF9xVA6dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f9aHDKSL; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f9aHDKSL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edWM+0VdGVfpCUeRGEM1RKR4NLIu0eCYYOi3AMjahEcheY3c7fG55lIVgjDql88+0QyjSP0UkWVJTPLsl1Zq4rAk3GtGk47SiwIJvQkxPWwK3sdqCUU4WJSutrn0yWGIG/P9+ncxQCal/+7YUNclQ3CkUxM8lrn52RNs9G40szQW9ha5HKjcRDxh30No/9joo76dI1s19RBdx1WyeKAW8KHEYKk2/IwkmEW4e6KcWu++Ozhk2fcpgyaOnez4TTyoJyykXHkC+Ty4yHep4fQYsni2Qxww8FeMRPMBDjTm/WmuKrZkvRg3KO90Gaek1pyY0/PGCZ6ZS406DJs/DDIJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuR2fXwjWOREleAbldjpb7g95TuWFPphlY/B7meKUGw=;
 b=kWuu+iO4QoCNPekWnk5pRe5rL3V7icSMt2Jwyz8F2Yxc/xWjiFFuH8QxOYsJZj35sjypSD4yBMSNLBKRSozqbk61MJk9IvEX+5yplBd6WbScYuy/DnjGUjE8ieDhdxkY/TXmey2aJvB0Ata8es6viF6DsW7z6JHDKKAAr3U4UmnGWhm3WrzCSLBaNyGb6gF6nrV+lzaE8x8kNrEE23CKVU7vyROS2T6qPw5YmoPDkLOUYjH8N4PPKMGTsb67n2Vxb08WMxWFxHK7AYGJsstyKhf0xTucwIHYhNymqCD0brLq/DPY1ZoDkzxtvD/PTqUDyQp5qOFyILICZGyOWi43yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuR2fXwjWOREleAbldjpb7g95TuWFPphlY/B7meKUGw=;
 b=f9aHDKSLvWBD0zVIns4c4JTLLhlljct8ZWTkquG1d3o8lJ5ks+cvDCWt/mRXaJM9QJ9yB73lb8VxmWWy5GTigzMAHNWeAs4oFtoiUp2/uRE2nZyw90byHcN+SPHFQoIiRY8wQn9BmZfaGXuRMYIFbuk6VGN2GFqxL28VcuN8dJQs8TYlrDYGF5ZcGXFWpXzoNF4K7QsG20LhyZDuAzD9aqV11e5oJBpmp9/6gMaAAgojUHUXUjlQa5D9vW4Q51YGIT8DXlGuGbdztUbmPV0fXDI6FI8YldfiI7gsl1KdQPoUvsxmh/pqD9TJfVigF8lLkzFIXdAcc8rfbIIBg1Ce4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 02:42:58 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:42:58 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com
Cc: reinette.chatre@intel.com,
	shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH] selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
Date: Tue, 26 May 2026 10:42:51 +0800
Message-ID: <20260526024251.7895-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: d78b48a3-fcad-4635-cbad-08debad07f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|6133799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	k0B9gag77wdzvxd8f/VTOYE1pKXbZGPVDEFmWby5VxghDVDHhUD1RCHAYB0nYMQ9+BIGUaDyCaqwZ+nKqFtS7P6iT4LTBfiAFNyX48In2Fzc6UrroeMglztfQAjDr0Ho3iCkSSVsruT5zd3w2rJnNd5/glqAp8SivhApRFfueDpmuepSGwI1INmzTQveYfXr7g7jDZTABFzxHXzwDjP03IM4gkV5HMDF3w555hs7xYOvtAY92I5GXHlYlrLrVBoeHiNOAzvZ6HOUrhF1LY9EoE7CKIerpDiP5f+cuDlfHgZNKlHvUIts++qR4Y+8VaqN81Ma6ywf9xaN+xr4+htUzSsbrwfi8o061YMVJSP0Y9l826qB4Qeqw9CxdV5iGaYnbsl/OTJJvt55U66jvxk5pPJ1KC8sy8eouWqMyy9faoZrFsDD6cyOhuCqcQo4lA4KAga9RT8X/bZ6852D9PpNm9LeVapgjUeDBuLeSUFn5GzOU4NHfBui0HpQpGivoiNAPM+0VedfhBth3HDnypgrbcJR0Pzmc58YuvScZ4TMyZeDUNaNC8zHA1nfCRNgOTOCMhIsLYU9EwaTtQCg8z1MQmQnJJunaL3gFUt2zzlSvl0l6Q42ghxKm2jlEeW0sf8RXiWOzRch9E6e3MzhaZBliKtcGxumbCUJa9nd/VisTr089KmA5BoI3b+j4fuZrgSF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(6133799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X95lcydfbwogSSaVXgjmIDGZ/yWsuAVz8rq1geAp/RUZ9LyYGxv1hiK3SdFY?=
 =?us-ascii?Q?MpVm5xIQS9tmEg/FyienGnOcq9VslPVpqp5VDadcgc6MXFHpXJrGxsFsUA9N?=
 =?us-ascii?Q?10wXB08bLMwgDrxgT2eoRnxFg5aNbgeT9HVqRLeVNmXqXLY0tV35LzipjY1X?=
 =?us-ascii?Q?X/FAtpkdUcDnj4aUBxOQsM7fibBfRrhnZNjMfYznwGFs0ManzuvwKz70rfTt?=
 =?us-ascii?Q?s8kIUYFWvVsBlHcE/8+kp16o8N30UWl2LRRuWkzi76NckBGUXNPstNxWMwjQ?=
 =?us-ascii?Q?XFreMf02ZvrByrZnd5UV+tXpagpOiqlCNOJejqyg1w7K+Ro1PsaIKBMcyFW3?=
 =?us-ascii?Q?my7+AWBA2nrBN9nNbK8uiUzZzLdhT5WBKz1YSQEddjNU5iOAO2I8tEqfvPEq?=
 =?us-ascii?Q?vq+rIDlJTUNOG0DiYtinSjQSEOw+4G/D35MdsCaoOKGLKYN30RsQbU03Zk4M?=
 =?us-ascii?Q?I3niKnP58bVc/a0OFp8SnRlSnWLK0sA5bB9xXdRn3Gap72yoEu78hQ1EYDoD?=
 =?us-ascii?Q?bQssem9QFiX9/ukFe6QEj4a5dJXt8RfFkCk9iqKpkPLifEjXN8lsoSlxKJBW?=
 =?us-ascii?Q?4BbjGEj1Mb68MTeZk5CyVHVaFF8RyoBB/2oZ1MSX+FUPPRS5WD3CFx+fPQ7g?=
 =?us-ascii?Q?f/18aNKyIaZgT1wgpDCosAdn7TxmHh6APSmk969nyLe5kD3d9Q8mre9IUe9X?=
 =?us-ascii?Q?s6AYa+vKexo3412R2tMuogEiHaIMfWF9PzuKjGCvBnlqnHVXcNkzKr1De+GF?=
 =?us-ascii?Q?2yiJDv78LsKtaKP+LWOT0aNm9wP68VxLCb1oEDfTqIOGjldm3DHl1DpHAlfS?=
 =?us-ascii?Q?OkMpVXM/C6Y09rlFQJv9aVBjfMMTyE9RGNk8D3YXpu+gKwQZMsOCwIMNC9XV?=
 =?us-ascii?Q?ouzaFXACKSKr4Q3VHmuU6QyuOkpby0QP+Q+iOragcDWRZdGlxc8eQJzbp+yS?=
 =?us-ascii?Q?bM1phzo2JlpFDfTjc8wZFTfaoCju9kv0FWV0yP2GpemUhEIeBrtjxf8+qp9c?=
 =?us-ascii?Q?aAf66cMOhyXvpF4EBx+uezdqh3FLGNl0qa5h5SWMnWo/MNiYk7LaeUBtvILe?=
 =?us-ascii?Q?yIF9p4ab9ax3qk+T0bDcV5b+HHJDdcn7cUojMoWLvGUSCVGrIWRtzUSiepgN?=
 =?us-ascii?Q?qCjYlHA5SFZUTfZaUb7zm7FF5v+gN48zExGrqBvJKCaj4mC5VdvYtmEd+VfB?=
 =?us-ascii?Q?L11jz6fjy0QhfARasavoxLo33k9YL7f6fyAf0LMwvUpsUcqGoGT6zQvce0xI?=
 =?us-ascii?Q?0E7F4P1Pxkp9sVKiLfgesZ/OUrLZ7nFZrEVDjSA2HApItOPZHlqpS5a4IbEd?=
 =?us-ascii?Q?HJPgeTc3hN5vUA8y9A/sCILxHh0nMN8vsp3Gls7eXQ6MOIEo328AGv4y1TLE?=
 =?us-ascii?Q?dSfDOnctleCXR0wSCEvSS2ol1eP/ASry5aXBLMVXbh1CygfmLF7dg/AOHsV4?=
 =?us-ascii?Q?6N4WHAK2gYYNK3NyTNdONvWaSEcz2gF64R/WIwfDEHCWe5f0w0OZdHGLHPTX?=
 =?us-ascii?Q?Eyf+vYWpb/RFmf16QUFbc+yqmF6te5AKO1/cLH8CY9R93R2zmZNg/I4lq8I+?=
 =?us-ascii?Q?xeZX+rT/yt0AYi3Xj0f49J2J6bbZrX2XsDefLeNuZbUNdKeygdRNUYpzcmJ4?=
 =?us-ascii?Q?njQGeJB6NFdbiP/LnmcULiXUGASU7cx8QnECK62mLqoKZOkrPxA4hx9XUjPY?=
 =?us-ascii?Q?OHttc710KbqFo+Vljuqi2l/wA6Z/c6CoKz44vVtzMHnfJ+Gb+uq9qsnUu08h?=
 =?us-ascii?Q?V6maZh9cQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78b48a3-fcad-4635-cbad-08debad07f04
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:42:58.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2w3rOW216SXqVxUf95+kOsGIaHR8/xwTF/IXf4Nmqe8cnZu0Wpi+PDnHW2mMRqsss61ABxyIS2GpGEmI337zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052

L3_CAT measures cache isolation, which requires at least one ache bit
not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits != 0 .
On MPAM, shareable_bits == cbm_mask is a legitimate state, so there
might be situations that no bit can be reported as exclusive.

Previously get_mask_no_shareable() does the check inside cat_run_test(),
which returns -1 silently and surfaced as a failure for arm64 MPAM.

Implement cat_feature_check() to run the same check at feature-check
time, it prints a diagnostic and return false so the test case itself
can know when to skip.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 37ca70523ed2..6a25efa59837 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -383,11 +383,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
 	return resource_info_file_exists(test->resource, "sparse_masks");
 }
 
+static bool cat_feature_check(const struct resctrl_test *test)
+{
+	unsigned long mask;
+
+	if (!test_resource_feature_check(test))
+		return false;
+
+	/*
+	 * The CAT isolation measurement needs a cache portion that no
+	 * other agent shares.  On MPAM the kernel may legitimately
+	 * report all bits as shareable, skip if that the case.
+	 */
+	if (get_mask_no_shareable(test->resource, &mask)) {
+		ksft_print_msg("All %s bits are shareable; cannot measure CAT isolation\n",
+			       test->resource);
+		return false;
+	}
+
+	return true;
+}
+
 struct resctrl_test l3_cat_test = {
 	.name = "L3_CAT",
 	.group = "CAT",
 	.resource = "L3",
-	.feature_check = test_resource_feature_check,
+	.feature_check = cat_feature_check,
 	.run_test = cat_run_test,
 	.cleanup = cat_test_cleanup,
 };
-- 
2.43.0

