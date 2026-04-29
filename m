Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022098.outbound.protection.outlook.com [52.101.66.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3E3D7D7D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458541; cv=fail; b=pF9pSzNwFeC6TZPOh+xH9AvvLJPh8uuD36N3EUdS6uImVdYwKL3Y1Gx9NQ6hmfCgyXkR2gmyjwVOjVm14axI51a2AM2wmmVLEhPi+3AWlJiRIhWSKcM7aALBK3rQZH/lL8KKZCZWTWkPip7rjMcAYyMcv6k9fGG+rcG8swSBiME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458541; c=relaxed/simple;
	bh=9EJUYmqxAV/w79yTwwsQGJnkxmPR6C5T2GczP01Hlcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJ8GcKCyzY5bEnehhNciJ3Rg69Yi8fS62Giht5hSLjhiCAiCM7OYT2nJ5B/pJWZeHb+GRQn/mJDpBmLwmhATI1CgieH3fG8VdCWpsevX5jTKAZXabWyyTx+16eJHt7UT7GnNrtnPz7JJTLbVwilpaaHBgfA2Zewc/c+3IIi4WvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=J88potbG; arc=fail smtp.client-ip=52.101.66.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="J88potbG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7ZlfhM/ps7a6oID+4+46wCe+CNzXCfQdc0FO63dmcPRnbyZMGDpFJm3Ur0TFXl9QbZlcoj2mFW0pRNNUrWFOoA6cKxqNhMRl5j6TvmamdfSmcusx1Z5C42XMpMGqR70nY4M3eRgfzYvlxABHXFtLxnYyHOx2b0LJZczdgDGLmgQhvCefFX7CuX2Yfq2Cvuj+130kdiyVEwUjYaM+T7ew3ni6lvgupchQW7J1rrLXnhyixxN6o7tENQUCq25QcdsUHzR4+t2gvvekX846mAbR5TEzpe+fLjxxfR+F33nufx5qyo5FosqeUqIC7XUuAVmBa67TCWoz8E7MADOSsimSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0JKebneoSF9lWQLfAXQvWjupGxZm0qnq9bayXjq6vA=;
 b=VFuHVA8cZu4jItvxX2vWIYl0YVyFQkDoRHS/+GmFSaNEDlgoAHeYy1heQHW3buJXsLy4q3pV5V4COtkuuWqdKJBVIujk/YmTk7DNqKKiIs5HIMKDaS2dc0ol3k/4nmHKuuM9hbqM6BkG089gUiKi+fx341R/A/Jxnuu4HzXjhE4M32ITNM6OVg0uz5XqCt9gqhDa98KEPVBHe7Ud59MB3+OzKTRrahZuobcGnmfGwWcOAjefOEBQZofRbj+9vCLLCOthNfpCUM9IC6YsNXEuzOyXTwgqr1buOnFUnGu2Avq5hW/VeiLoRTbW3f787JEUopzMFhs5K9o7wevyDiuXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0JKebneoSF9lWQLfAXQvWjupGxZm0qnq9bayXjq6vA=;
 b=J88potbGBRs+le9T+VAJ3fkcec2B4eaP9F3uyIJjQy04wQzO1mOqcWhPvNZKRJl3kNLEeq1pKblL+tZrWFoCGOufxlCzk8NCvlO2gS5c8XpnmUIbdJW7kLSOP/LDsSzsm0RC/q3BV9e6lKF5O8kilsHSU3VONIY+SJsTBhnLgotNaXBNf/h+NrhX8QhjU/Xk+8OFSjc4ECJNJCS3VphEOyvmQvxlMNz9W+x/Dhdi9HvXzNAPZOvKAHxGMqJwlW2LaH/xWr7btBqCB3EDWv/Lt2EaCGyRta067wjr+DyfBJ3NV8kDEKERx40OfM2ETl/xmpFDugJ1Gy8sUjBI3jn8ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PAWPR08MB11558.eurprd08.prod.outlook.com (2603:10a6:102:509::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 10:28:44 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:44 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 13/15] selftests/iommu: suppress -Warray-bounds in _test_cmd_get_hw_info
Date: Wed, 29 Apr 2026 13:28:09 +0300
Message-ID: <20260429102811.47214-14-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|PAWPR08MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3824b9a5-083d-49f8-f1d9-08dea5da16bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ki8Yh1w7OFScy1aIMThXmmWANLonAE+Q9JffUoa3joww1i97FfDQz5eE9gNUXjhkpkoyGiMbrcatQJZqIhIHdmWBX0MINrOECxJDqXNYGd8Or39hXvdxqq2qBH/NkJQprUb36fYA9Or3pC5nEsWI32/4MKjkYkSbX8/uNElYfOtOtyIcY3bZ0Tq4HkjEpjbdk7dId3+qEoYKl6JIl9YnCZw5wcjiKDSTI7wLJV4AXfZRZpAJQHVIIuRyJOBQZIe9CqMjJbhyFWUbSyrHmlDB5aXDcbda0COS+LtjrReAVsJv95K59d3eGmE1ZxrAVGayV330CIDrm6zcICjr3UL9PgCPQqQ1Thk9RNcDGqw0QNsAaiFyow84SgRb0rODOoYhMhfjmBS2fOQyV2aRH6UHVHRGXavhJ12WiX3rVrgsA0UZyonCvNB3SHl31f128WGUNWMZVqJq5FHw1CViV2kT6x57/ZGlgdqwlm17NEKVKazFu2DAS+1wtFRdMSE050JbINClip6AzlCzrBLc46kPivbwyKPHXaOULNkYqiLxSNsEGpzZCD7UgWJ+EuPArfw7//qcPPcIh74YuBW2ngcU8UFNy4Ci7ESdTwywpiyeEqQCrSfb/HahPl2e9Y8jCl/i8SY0+038ribsNPCwKBAWikggotnOUGHxD1FeRK9dn/5np8Gqe4+8cMayx3Eo2Tcz34JLVGoQro7zw7jjdup89dOWNCUVOInlqAEkGhsyi+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRu99v/63hxDbE9vSluXFYJD0nQkC6Bfy6srA39JV6q9OclemscHQM/P7cO9?=
 =?us-ascii?Q?63qIEK5rHyd60em4g3hkcP5UHthpiY0rDUGWIQmr+DvsVlK+fOVYLdXdf157?=
 =?us-ascii?Q?WPYXv1Gx3XbmXZ3j9MixWDtNL8KGwcdQGqqXDzFts4opldCu/Tdaeq6PfVQ+?=
 =?us-ascii?Q?tSy7mLqRX05qdb4AUiI9DIMUDsEJ20LyAsPVrUX6aTbXEsITEV6BD62lbf03?=
 =?us-ascii?Q?D4+1gjmtBgM8BPCpT9ZEHbpO12UbvlfRKUDltsxC7x0NYGkQKYAe6KiQm3oz?=
 =?us-ascii?Q?9HDC6zvYFliqNMO34Dpj7v6ziqmBP49wA8pXbmYhOfRC6lx3TL4DHnKzS5OF?=
 =?us-ascii?Q?O2prymvOUEHKZwfuBE9h9nhsg2MIBJdY3BsSh41cl5bpsCadyerNlMOeifCV?=
 =?us-ascii?Q?ii5jsTPFU264H0agmBQKP2eszA//qlhEXAFQsowsXzAaTM2hvmE517t2bxaG?=
 =?us-ascii?Q?uOw9lJ+8Gb2zcUDscVvUpXbtiBp52RysDaUM75qkS7MgnmrAc6WuUqMMBprA?=
 =?us-ascii?Q?g5Tr+TWx7FYSGTYXpSnVXLZjrhXDwxwFxqwfei3cjDccMmZ6cYPa24G16dhj?=
 =?us-ascii?Q?XUNzXFs24DzhsYOzNxOqDPV0EjsCST+OBBu3N5jrQvIpPCVbEo1aGUZ+qAMj?=
 =?us-ascii?Q?khBBxZ4maJp5I/Bj6gpjNul0VwLy7PDbk71mLhdQPpmRpXO5LL+PUZiQJSFe?=
 =?us-ascii?Q?AmVqgGUuJUyjs9fAKsSZ3f4jDIGtrM2QkjQo6rdl59FpMxyC/lGNhdllOBUU?=
 =?us-ascii?Q?f92dKjmzH8LfY0Z/S2/Hj2pp/fyyYUBNY+SaMLBGHZLU3kTuwcbCsAQbYBrA?=
 =?us-ascii?Q?5nk3mD4UprHr0NfNuYn5vQ2fDbBGbHTM9xKi2d9WAZQO7jkgeFcwP9l6HTFA?=
 =?us-ascii?Q?EMa+VBmhNSNq8l4QnCVOefn5WiNZUzHqBthvea8/mJ9K5sIKGEM62K1ZvGDP?=
 =?us-ascii?Q?7HOC1Dl7Ti72bvfnp/ARbsRGfwSpTcov4KrHLnERWBtleo8f8pzWxu07RHKs?=
 =?us-ascii?Q?ttOBLJQOFwYgyGnjp7P1Zbg+yroT8DNA8jjOC62cdoSGyFqOLWdZZZTesgNr?=
 =?us-ascii?Q?QluAY1DXZ+DJa905kGEWkCNT2SC8+DhuZ8SK1sH5hE4hXAkSXbLZWOsOPzZ0?=
 =?us-ascii?Q?bK7F7frNB9RQFTC+yXH1oBMeOEq4hDpYRlliYt7cMy57Ik1u7gURdDTFsDEN?=
 =?us-ascii?Q?Oii3zxXvL6Y1ithDrj37ZHmSoZNm3/FXjX/DjzF5O0smqoHO2c5ZXuYkeFah?=
 =?us-ascii?Q?BAhaECjspkG9Jln35lBe7L4X1iCaWO/kEFl3BAlsBHeywB7jToOvpa1eaSmp?=
 =?us-ascii?Q?rO+IrD/Dp2OCcrS+unkeP3P3iNH0nszocU9oA0m4Gq/5N0nW/yeWe1eCKOBc?=
 =?us-ascii?Q?NFIesU6uTYEjlaJz7nmS7cGIRpPXQ6fzigrlAyiclRZ91bmO3X5mzrBdFC5k?=
 =?us-ascii?Q?CbEm3tro23uCg/Gh5T1H7qrvEriAGoS1A08+JePU4e/ZsfyI9nLDWgNnhzcr?=
 =?us-ascii?Q?X+AT6svwuWnKPo6mhC5jW7yLr9gMjoDlZTYmnM9CIoEy9HQMbJU60q9s2hB+?=
 =?us-ascii?Q?Yj3jjUuD4bElUV+MMHGPHmnCLUoxMsCsxR3O4PYxz1fjeiI3T+i5+D98aCOa?=
 =?us-ascii?Q?UnTQMIX6ewQAXNJ37KwQhpWlG1+hrYrU9AvI2jD1JW44GcxSVtetnLUHWwVC?=
 =?us-ascii?Q?RjP+vfRN1i8vqjLejL5tV41WLOKozOyExHIPC5BV4u+F7sKCitbGPYgPIOeh?=
 =?us-ascii?Q?QGCbjtPISGuvzEjvTdXAlyALiTytiLU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3824b9a5-083d-49f8-f1d9-08dea5da16bb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:43.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItBZfId6JnNIOcyxpSv+FzvTcXiFPB9LQOGP4vs/DwKIziTrB8QkZvIPjO+XfJXU2OfRGY/2ppifqAQxnkp10lHeF7BHtZvJoeh20bFRneM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11558

  In function '_test_cmd_get_hw_info',
      inlined from 'iommufd_ioas_get_hw_info' at iommufd.c:614:3,
      inlined from 'wrapper_iommufd_ioas_get_hw_info' at iommufd.c:589:1:
  iommufd_utils.h:683:37: warning: array subscript 'struct iommu_test_hw_info[0]'
  is partly outside array bounds of 'struct iommu_test_hw_info_buffer_smaller[1]'
  [-Warray-bounds=]
    683 |                         assert(!info->flags);
        |                                 ~~~~^~~~~~~

The test intentionally passes a smaller buffer to exercise the kernel's
handling of undersized user buffers. Runtime data_len checks make the
access safe, but GCC cannot prove this statically. Suppress the warning
locally via copying into properly-sized temporary structure.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/iommu/iommufd_utils.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index 5502751d500c..ca978b8b796d 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -5,6 +5,7 @@
 
 #include <unistd.h>
 #include <stddef.h>
+#include <string.h>
 #include <sys/fcntl.h>
 #include <sys/ioctl.h>
 #include <stdint.h>
@@ -826,7 +827,6 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
 				 void *data, size_t data_len,
 				 uint32_t *capabilities, uint8_t *max_pasid)
 {
-	struct iommu_test_hw_info *info = (struct iommu_test_hw_info *)data;
 	struct iommu_hw_info cmd = {
 		.size = sizeof(cmd),
 		.dev_id = device_id,
@@ -866,11 +866,13 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
 		}
 	}
 
-	if (info) {
+	if (data) {
+		struct iommu_test_hw_info info = {0};
+		memcpy(&info, data, data_len);
 		if (data_len >= offsetofend(struct iommu_test_hw_info, test_reg))
-			assert(info->test_reg == IOMMU_HW_INFO_SELFTEST_REGVAL);
+			assert(info.test_reg == IOMMU_HW_INFO_SELFTEST_REGVAL);
 		if (data_len >= offsetofend(struct iommu_test_hw_info, flags))
-			assert(!info->flags);
+			assert(!info.flags);
 	}
 
 	if (max_pasid)
-- 
2.54.0

