Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400B339021F;
	Wed, 22 Jul 2026 04:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692810; cv=fail; b=PdETrI2EBWAqI7iCkIuG2UZstV+72//Y3RgZVGRGSSCORJh4vwV0EqaJEdigWgdrZBg4auhSnhe6t+gYN+rljFn9wM2gWK1d1rr9ZSwPIcd8FwSZmup0xbED4cR5DFmWJz21DOVma9C3WaGGyBhbSILalbpZSDhirN2thE650zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692810; c=relaxed/simple;
	bh=UZa3xXJ1qqCo/E1v9UIttuqB6yfx5tnvLPYubbIOTS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r/2S7vF+7dWeSjyqVnCttlRgv/5A3fq1VMRL+fF4xdKj8YF97tLquZZiSndpJabuX8ORfKEmmgy0m5pKhoFQLqrqy3ztcydXKHNdenXXTFuNcJXfb5JZ/eSyyht5YLrKWNJrU35Ij9B9D8uzznNKscBqEjG6zmKIrtZCAcU8uYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eJyfvsZW; arc=fail smtp.client-ip=52.101.57.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eJyfvsZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLXdXNlJv2t8lZancAykKS5uPrXFlipKoCYiX60Ztgl+xyBkdWVjb4a8ObuEURc+izirzBGjVjUsDVCJklJZbL47UANY7dZ95kQ8vH/7xXaHVHqBXmDnkBeM5aWOGerxAF2Be+axIgl9qWpJWZBaE3bA9mV1kiOYv3lXv0SKmQfevIhAt1TlK3S1GDUJ93UC6eFrJlLgwjlY0AbJg9uBXTb67Orvel8ZHMsc6CbSO298hIK9FgVrmepkXxdgvoger3k8ectvOpNfh9RIErNCJEHPWrKvKP+AMjQT6dIRsCwE4g9jlPnIFdxX6h46Ef48+v54+ipnzuNMFN6qz9CAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wduKXc9xWYR1OtBrh/G+YaeqcqBphYF3CILX1i+VEV0=;
 b=ZpCRFRR6+Z34RiE2yiBE5YpzlDqU7zDwW24935JYv9pe4m8M55SWDy3WdYxnNGZI0WwZ8A/OFbDFwhf+938XgQKCPAgSiRbgtvT9khQVzazDMkyt8hJngJCMtagUUjq+/tHr5xKNgnJNyGNcaMoNlWtZyJiCBccWqFDUbpwfJsXcdNTaWg9Y+btbHGGuQoUxAjL3DhWgO5vymxtkpRSCmnMBzFwj6sQXftVTtLj11PHBUwiDMNpGSixYKDPzMYt5qL+goEbx/rdGoyJetcDzjCJ7FhZHCf0Xtx7gp0zheq6kiObXweixULi0hyO3gOhLd/dFyQecYrlIFZvnVxV9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wduKXc9xWYR1OtBrh/G+YaeqcqBphYF3CILX1i+VEV0=;
 b=eJyfvsZWM4XvtzUnozh5sK5GFejblEK+x5clIFFwpGWk2TG45NW8xgNcgpJ3+PG2JHZa+es8B3Lyzki67EnUcKa8Mqubxp1zS58343pxGVj3PEksR9fRDlztZfuJnd3W2ytPmrvDJMzWLSacCACNRKcsxvQv5moT5YuLjf1fIK6NQ16+6An4RpVK5fy6lgDuteVY7vB1KAm1A+BoiURfS9+YWMtMooMe3XQiTPCZUe4vhSHzujGG/Nf6Ys5hBx75UYZnGf0ueFJkZVxVkAo8IDJhQo0ib1Qwk1SdjE8AhweUdBYCMRzGGTOoDm6UENiyXCF6wkR1i9DKDKCQyWYC8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 04:00:05 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 04:00:05 +0000
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
	Richard Cheng <icheng@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 3/3] selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
Date: Wed, 22 Jul 2026 11:59:43 +0800
Message-ID: <20260722035943.32337-4-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722035943.32337-1-icheng@nvidia.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f48ae2c-5f97-481d-a2ec-08dee7a5b689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VkpsYsIK/NWbkNEJJgS3VGP37tOyqGedPPbjgn/NwWdbinCdLuchBkHc15VKwsqV79SWGw/R3qPpCa3TJKTznjSXrPWtjhiUqXBYKbbX1VB3Fe30J1lTbQRbS6h3JQ0ie+GQ7ruksfyBejdbLiym3xO1YD5j9v8UYKaflAQXi6EVwECV3SGTo1nPMZZZuM5JgFFyz6HxO2YJUoBmw0XU0nQq8icKB+y6YUursdepTE7lTy7GaJhjY7GHkGKZFZEcWOBT4omsZ7lW+N0WgIixdkwr70rzvn7MT+cBvscHLDICLcVZMkYpDtLfmoAv9BH1HxYecsMsN8qnzbC9UBvjrs2BH5AdAe+NOyf/FfUuaLEvGB4qUVJm96E48Bc/lwhO5WbnbCXS2Bo4AneftujYDISvFueyP4yZiP7rEc+8FTaOATYW9DmNzwtwE4KRNEW8TYg5F+l7YBxJMN/YIDHfSpHu3ysVL6u0GngN0sdUJ3rXsYyF+25H4BUCbUpzm96JvCZZJUFf29oLto6nBX5lg/Q2X95bdLsTxj0mlSAzpcEqBe8KLGgtw8IBwRfjbtN91gKQxAeya+PDTXalixJ5c5BQKAuGIZD/T6E1hVkH8Cja91lsQMlKhaJphPJ4ihPBukSAWtHge2UqMa1hVgHYiMpCsNXBHwBtewFB0Mrf3X8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFaWVlqdkRRTUxVYU5oMWhvTm4va01QR215TXhTMzhia3RxVkVZdjZZN1o5?=
 =?utf-8?B?cEEzODI4ajd2YXhRMEtjOEN4dXFBdEtTNVp2dWR4b2N4OG9OclVpd21pK3BW?=
 =?utf-8?B?N3h1aDJESXFvQ2FxVTdTTXFzK2p4ckJGQVhkbmVCeVhJUmN3Y01kK0UyL0Ez?=
 =?utf-8?B?T2kveDNKQnk1S0dBazlpbEFxdTdCVC8ybGVVVWt5TlpVdUhnUXNmVm5ZcWR5?=
 =?utf-8?B?aElZTmZBd09FVUZTOUhObDhiTllDZlBVZXZEQjUxZkVjbkVDelZmbFFudlh3?=
 =?utf-8?B?K1lRODViZlpNQmNZWElqRXozRHpFQUJaa2JNaDdXY3ZpV1RnbWlGekhOTGNX?=
 =?utf-8?B?c3dvWHZGMis0MytabWIzZ0RvZUYwd1dFallhTitvOFZqUmxkRVdrd09GMjZh?=
 =?utf-8?B?V1RNZnNNQTlHYWxFZXBtN1NZZHp0cTc0akhlOUJvTUMvMXNVaXdMUWMzZnFw?=
 =?utf-8?B?TWtPck43Vm5GTGZNdjArY0R0Z1ArUlFXb1EyY2FxV05LTG1VVkh4Q0VOdkox?=
 =?utf-8?B?K21jSVVpbWhQNHFjcFhvNWtJRVoyckE1My82MEtyT2ljTVo4Rm9TNjd2WlRZ?=
 =?utf-8?B?S1luWGJybzRHWlNSOWdqVmRmeTFiRWxBMEVrUFhqUHZZS3V3cnFySWpOQm8v?=
 =?utf-8?B?LzlCTWw3cTh2SW1MbFBhOWt3SEZFM1NKeTVDYmg3ZnVXODNJTE42QzdUODgr?=
 =?utf-8?B?aHlZSERsRW12NzRudkIzRDF2RmZVU2tHSjlQM2tWR2J6d2VPVEpSMnVzYVNn?=
 =?utf-8?B?NGpuWlNaS0NmTGlPR3J0SjhUdkFGMnZhSVBtamtuQUdMQ2dPb1hvS1ZHOFZl?=
 =?utf-8?B?Q01pMjhXc3VNbDVRSlVaS0FxZUpueVI1SmZSemxJdUNBWVlrZkpiUmJFRlI4?=
 =?utf-8?B?em1qaHNFbDd5N2NEVEFLcW5TVjcwRGx2dEdocFpEYzFLSWdhR1kwVkZvL1Jj?=
 =?utf-8?B?MmlCVkdMYlZTUk5jZnYycFlTU21nZ1dQdWFaSm1qUXRxRjBmTk1qRElibDRR?=
 =?utf-8?B?T0twdG5MdG9TVll6d1FxK3R5MS8rZVFzVEcvU0Zwamlob2luZkgvYzFkN0x3?=
 =?utf-8?B?NEErYTdxWmYyMi80cGVyVVZ3NXFWeWtLK2xmcnord2VaQjVOTDRBam9iRU5L?=
 =?utf-8?B?Y2NrZ0hnSGFwa2Q1MHZQYjU0ZDJjbGFjV2ZTTjNHNGNucjE1S240S2NBOWIr?=
 =?utf-8?B?a2VRdkc5SldYR1RQMHUwamIxbXRYSitaclo1clpkd1kvZGxjTlkwV2o5Skpt?=
 =?utf-8?B?V2RGTEZtVHhYZnlaM3RMdUhzTmdzVEpDbjFWcndEcEhkMUd1WnVuNFNYQ0I1?=
 =?utf-8?B?bXVZTGpxOUhRek5UK1QwdDNvUytrU1lrNTA1WXdrOVpUVWhYQWhuWlBoaHp0?=
 =?utf-8?B?MENOUUluOFFlcHoyQ2t5YWFTWXZ2cGVJSUY1aU1VcHZxYTVrUTZPM2VPdi9M?=
 =?utf-8?B?NndHdWQzcGZhb2cveEJYSmRCSXRnazRPbkN2TGowenZsTHlUZ1M3L3lEY0Y1?=
 =?utf-8?B?Y2JJR1VKRTNMenFTNmNPd3YxWXBYZC9memdLMWl3TzZsaVQrUTFJUlVZYzZZ?=
 =?utf-8?B?d0laVjZHZnU4Zm9hUjVUUHNwYnJuTjNTM0J6enZBVUdIMkxvTXZwU1lIR0Zu?=
 =?utf-8?B?NVkxREppU0JpbS9KWDlGNHI0cUNKWjZQNHlleGwva0llVXhLWnJXRUMwdjh0?=
 =?utf-8?B?MkNmbGhpN3liQzUzclQ4aHhJb1ZyQ29uZ2RQTzVaOEZkNHJ3Q2prcWVjWkdv?=
 =?utf-8?B?bXhJQ2JLQVRSdmllMW5pZ1JJK05ZN1E3MFlsenZCaWxPZnRNZE9oVzFjVkdR?=
 =?utf-8?B?YzR5N3V1RmVsZHU1eEpMall1MWhWSWtQeGVPa2xmMEYwZjZjQXlNOC9VSlZ0?=
 =?utf-8?B?TzYrZ0NlUkdoangwd0JVYnB5UkFvekJFUGhKNWYxT21sSndnZ2VwRmJFWVdC?=
 =?utf-8?B?Y01BY0V1Qm1nUStzdlE5bm1VejBwQytUcHFGVnp2VGI1MmU4bWdCVkFLa1lu?=
 =?utf-8?B?NHNFSGRRVWdwSVFpR1plNWViWWk3ZEJLb3F5aWt5QVAzcXhHcVdaZmFXNjZx?=
 =?utf-8?B?YTc5S2hqdEpRVXZCY1NubTg0NytsREJ0QlhhcXR6d3NiZzRuMjlpR2tqVDF3?=
 =?utf-8?B?TEVSZG5QYW9NaUdFZGhEWFBQUnoweHBWOUJtWGRaVGxRd0RjODgwUkVwRHJP?=
 =?utf-8?B?azcrYkRQZW85eE1lYTYwaVJod2tINDhnaHlrVW0vQmRrUnVCMGxITHRkcXdr?=
 =?utf-8?B?K0dLWGZLYytaeSt5S04zNUpBTTBjOXQwOXhmaVpNUlIwWk5RSmxsWk1qZDZX?=
 =?utf-8?B?Z2xjRjFvSnpQVjNUYVNDTm94SlZiSHkrWTlZdGRVTWRyZVRDdW5Kdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f48ae2c-5f97-481d-a2ec-08dee7a5b689
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 04:00:05.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzdrL8qlZGsZCY16NjC/X8Se5WVUNTvWIpbMeNyhQPKwekH84ba9PI4SmTiyJKns03jM+W3MWsnEW6phvnh0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
and arch_supports_noncont_cat() falls through to "return false".
L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.

Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
add it to the AMD/Hygon always-supports early-out in
arch_supports_noncont_cat().

aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
mandates non-contiguous CPBM uniformly, so per-implementer handling is
not needed here.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 692860c7ce59..55aca0af02c4 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/*
+	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
+	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
+	 * DDI 0598.
+	 */
+	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
+	    vendor_id == ARCH_ARM)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index ad1c17c0b0bf..5c752fc5d470 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -40,6 +40,7 @@
 #define ARCH_INTEL	BIT(0)
 #define ARCH_AMD	BIT(1)
 #define ARCH_HYGON	BIT(2)
+#define ARCH_ARM	BIT(3)
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 593f0ca5251b..57f9f9c0992b 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -24,6 +24,15 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l2_noncont_cat_test,
 };
 
+static bool detect_aarch64(void)
+{
+#if defined(__aarch64__)
+	return true;
+#else
+	return false;
+#endif
+}
+
 static unsigned int detect_vendor(void)
 {
 	static unsigned int vendor_id;
@@ -35,6 +44,18 @@ static unsigned int detect_vendor(void)
 	if (initialized)
 		return vendor_id;
 
+	if (detect_aarch64()) {
+		/*
+		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
+		 * MPAM-capable ARM implementations follow ARM DDI 0598;
+		 * treat all aarch64 builds as a single vendor for the
+		 * purposes of resctrl selftests.
+		 */
+		vendor_id = ARCH_ARM;
+		initialized = true;
+		return vendor_id;
+	}
+
 	inf = fopen("/proc/cpuinfo", "r");
 	if (!inf) {
 		vendor_id = 0;
-- 
2.43.0

