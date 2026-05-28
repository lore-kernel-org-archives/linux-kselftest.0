Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF52372B3C;
	Thu, 28 May 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964224; cv=fail; b=tEVXVwehWy5ZkhT6dbIMLoSnEjnU4O3Vu6eYQSXyLzOG34iS1TQiQJqUOaz5lZLyD4Q8MDOLAmJU/RBndRyvTBaA3dRgh8fqJRtcPluEHa0lhGhc7iSxxv8EeiAnm3afFRP9mln/jlyKccLWWCUg3FBkV/ticrNIV/n99Vfqzk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964224; c=relaxed/simple;
	bh=AJcmhvfjkG3wrwE1QvdiFSEXm+EqWJ9hSVes5z9bfoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GCiODrhApdW3EUSoj2GdxDMWydPtANiK82thZAPxQkTNZTOZNTsEm9yxomupCBI0Q5RZBicme6/mzLa/JYI+io1nieMvaruWlaAT7PTEfj3xDrGg/BIHeSBcK5xzwiD9SIE37SlxnViGwvMmO0ZayEEIroRb7EQfafgjFz5KEN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uSO0V0/Q; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uSO0V0/Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aukuvRTt3UEUALgXq9y/VEWxBDf8ALbfdas6B3jS6ExkJpyq6VPT/VxCpE8eaE2FFrR+usJJBZXN4PWjZkEI9kwHEVO3corpzyJDM3zuchCo4eT88S02n/BA2YxR1S/1OXQHTj0Sfq4+dG2ucF/qw1G5rVUBM2tC1gcnqdG1BK++KlTUHLdOB/e1sCdmNxEjj0B5xOcmZJK/TvHk6LQ7fx+AehzX0tpVpegB/SzQg/TLOp3o8Pc6CL0A69WKoy1ZEUVl34SUGdwn4wPB08dvDArDRzrMhIYPcG1657jhtHzPBUZbGNMc+FSLs29sa/jMT0Uky/ge0R3QKny5xVAbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdzn/gZN3lApMcc7eDdFwXWsmhOfvxosLhpWPJ0OR8g=;
 b=TN/KZp9aYWqW2L/yY9HUXEnUuysOvSm1TBr+Ssv3WSsJl3+tj40s2GoIXtGziDo2zKbEy5XYhxQLxHaaoiEMVDhy8+/Q7wOS/kSYgWaDQJNh5t4E02nAJYn+olhpctWPObnbvBBcWykYbyyTLWCND1FmSk3HG0heKt416xvkn8TojIDVG86mUUKnFooBYxNpu9RGcALT7u47Dq4FalbtIQ0jZTUc4geopPGFEraKyx/z/gqdIxVI4UE3oaQXDvxYIzKc3gY2w0+82m09WYLXj/hXQbpngYPLi/YV+Fc/GUbFxLOjXCHXdARhMZY+F9Qzul3zj9DS4iJpvOp1dOEbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdzn/gZN3lApMcc7eDdFwXWsmhOfvxosLhpWPJ0OR8g=;
 b=uSO0V0/Qd5gbm0AeccxU5Aa8NiiHgYsZY1RSM/vGeO0arN64MpgxNLcDx3GZcDOw9LpL+twR5xAhrlXN6KKYiri95PuXahqnp2JwaAZpZNEq40mrxcRsGryZGnc0C+JhEjudBRr0KC8EMwuh+C4F/BRUZTBBiAxHAEGP6mQVH5egEAVin1XQQlnj9YKTX2baii8kFFMFVQ+Pb/JHBLZ6eD1ZGWvprFccqqxlnSI+LEp2DTn+SWeTr6uMvJf0b70pFINJoLCOP/OXcVLeY3XX1bdiuODrIJvgJRfWk5qnOeAymQZeKTedta8ORsTfxWeZtP0p+krA1DkFZHB83jwKmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Thu, 28 May
 2026 10:30:18 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:30:18 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
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
Subject: [PATCH v2 2/3] selftests/resctrl: Implement cl_flush() and sb() for aarch64
Date: Thu, 28 May 2026 18:29:55 +0800
Message-ID: <20260528102956.33121-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260528102956.33121-1-icheng@nvidia.com>
References: <20260528102956.33121-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fe7b30-1819-44db-3752-08debca41d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|11063799006|6133799003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lhdzwE1dYHBDEZ4mYM0eeuRVOek1k2dW0vbb0gTIn71u16skQGNnMqh91aRsdENN2BZBXpwaLwiSIUBEeF/0vyjLcnAt08naAs+yHfhdjPnwwjWxfYlLpu4AZK/4MBYz291dBTkaJpI7LcYVgTwwx5drU2Y+zVPs+q56O9FShg2yduGnHYqw7uqSM7fceLc2EHrvOZna7bZcXLfZWfTqWAe2t1bqY02LY7xEtgoL0Bw33M+c20Huz6ODdPArVv1OSL/5Gb19pFRTEDknJRp5tCX2pJfHvn9s7MGu/+Ksh1kX18G6r2UROgFrn19T4BfatJvHZwE1raVjrFny0eKi89RS+ucunpIh6f438Rjm0iDZqzafTfx/BxZvHHQfUIgT3Yp6sjzRAq1EwXV+3vdaG3974vrfi97gpetcOCthkl392DYTSVs5XGilrC1czO2RsNdY/KuhKzVGRhU1Cd6KpcVnnnWra59JuFimlTFORJL6uZYBHgFWT9M8BWvTBJ6GTizGezhBYiXsggNnJbgGLDbSIeA+fLML1339cCSNmzH4INfYh6b0YiByVrS4xuidTLIHah7GiQrCDdNuLPAnVoLPe+6hCFjqnC2QEEs+T3LP642r5TBrqN6pXdzzmVLuOL2szQ2EIm+NrMrZPyUXvAqsWXxcdC55agyTgo2lpUK0G335mjG9i7KuYFSVsDn5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(11063799006)(6133799003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yhFkKo4Dr6LMT94ZoMIQCeZMKaQxC9479ggglwn8PMlAhLzbzYDRnmDinHEr?=
 =?us-ascii?Q?ERQNPUiXDJa/8emkR5pw4xBu5nHzJFhsANHXdHr7nvP7dhLi0y8j7QgkVZDH?=
 =?us-ascii?Q?E2jAChT+fqR5wyKb/ynLEsXtbwCVYyUTNIt65CVb1atd03nMjhTq50C8ogNm?=
 =?us-ascii?Q?uC4q3osh2FGJIN3uV9rHTvv7J7iUC8g3wAF+hDf75YIDvnVRMHXlDkcwq5j/?=
 =?us-ascii?Q?oBaGm+emuk95Q6sCe/i6RZR18BHmsL8NfMIU0YbqtjDozXJGlOfTIRqFu7sy?=
 =?us-ascii?Q?l8fZ6hagcFTb+PjsOo0M25hPvr5+ndjmh70FpIUGUkSj2KxFUtLe/QcKZ7i3?=
 =?us-ascii?Q?7QWXiF3Tme3/iisPaY5J2Hx4LL1BvO88A7L0/DqG8kZwZ7AAWeYWgVhcOQAQ?=
 =?us-ascii?Q?//Fk1VUkA8Bt0IB7bIAPCXTExMLzYBwaLUfM2cJtiYLsNM/fgrDoFPF4tqSi?=
 =?us-ascii?Q?QX4lc0uYR9aByPZcbraoYhvptRY8zErK/H9mh4ULaYL0cWVt/85NIgII5D5G?=
 =?us-ascii?Q?+fsA0xo27vnLw4jMhsteNPSAEobCqqPpHz2r800pK8x0KubQq9PLjE5ix+kU?=
 =?us-ascii?Q?F0SHYEW8XNXYw46BCMLtL028qZUETQOczu+bFb+DvJB9XEpypJRa5aWcqVGR?=
 =?us-ascii?Q?PKJZaEdg8smR0dRwYM0Wzd+hXiXbGHbdesvvGZoYk35P4PPjp67lkKk/8av1?=
 =?us-ascii?Q?90I3e6xcchm1J6l0aKcY6ntE5yQydr/SqaGSAJNFBw01g4vrg8u3QJ6NhDMY?=
 =?us-ascii?Q?+5Y6A8qYsUaV851iMIkuGe+GHbyje84akr7VZBt43E+2VWu9fG97BtFAVGGn?=
 =?us-ascii?Q?UJCcKrE8I81ntrNSwDhk0CVuwqO6LrTkDbaX+bdXLz+WEHHtNYM8Ry0ZoJjF?=
 =?us-ascii?Q?2fdlJkMn6i85XJ7pQ35aOOyB75IU2bJLFD2Le26njFZ0oI9ocjc3QXjMVBz4?=
 =?us-ascii?Q?ys3AaXCN7WohtUR2MCP+uRPTw9MSRP1V7iTnU/f7iMnkbedpHC/4IVaF/cN7?=
 =?us-ascii?Q?1VlL+gWda5yIbv1xGud3FreQ4Bxe9sOTEZrjeJpsyh5uHhYNVAbHmlX+4k9R?=
 =?us-ascii?Q?UPUNUuECcGz9WyYPC4H8sEjmZU1a8CTMMZ/9E3w1A3KMHLeXEVJ8rp46QUxU?=
 =?us-ascii?Q?q8VOD7uHZWbZRAIlwI/dX4cA4YeJ5BggcSEniTORfRpDJn6CCKJ8hNhoPYx8?=
 =?us-ascii?Q?rKfSbMEPe7xI/mNNUwwLpoNGgHS7RdjnBRjIm8Mt1gZkZGOgWLaJhgdsITu4?=
 =?us-ascii?Q?7CfJYpfQBR8LCwUWd/9gYrnCAhfiOWz09T+Sy5EdNfGfF2EsktsrcCe+H5w3?=
 =?us-ascii?Q?3g8zA6awQkyzZ/1tgK/CtOqij5QxeFqKOacp9+WeL9TVU4gtOyjgCNM9X5eY?=
 =?us-ascii?Q?IN9eKrZ/7AXRTbAacpqh9xQu4xi1olwW/YZCOuMccGGSv8Z4CSNSzEhSkNKp?=
 =?us-ascii?Q?2unLkSEjz2IHDc17ySKzkf9IBF3AWKU/oIlXCpY79NUzoYfA2fL0hxyZoRgQ?=
 =?us-ascii?Q?J3N2eQe6jtl2BChIRUfy/oEsdyxRaLiWDkfhVhHVN6v0/94iPybbdiwrUcOj?=
 =?us-ascii?Q?h4t9yZX0Oy7GOIocPmKz2P7S/DdAqR+JimsYbHWjISxFFTIwsSjsWyxPKhVH?=
 =?us-ascii?Q?3TCOgGof4bX5UTRIHX1ueZwHAYw9OJYkDmjNy8jYzbX/VuXUqOeyuHQKle+o?=
 =?us-ascii?Q?xj8/3MCBkXPNczmTdL9FPoph1S4Ax6biPyO4b5sxiBZqq4l5rQin98WJR/K8?=
 =?us-ascii?Q?6zOKETU3mw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fe7b30-1819-44db-3752-08debca41d00
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:30:18.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mod0twGnYQF0haVfXR5UPF0S+n0g6T+ybwFGwFSjwesaYgPT7Q5WuZzqxaVO3DJOH05M+MxBV5FWdeYmvsEqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

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

