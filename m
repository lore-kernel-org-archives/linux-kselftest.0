Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021123.outbound.protection.outlook.com [40.107.130.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11483490BFA;
	Thu,  3 Sep 2026 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432658; cv=fail; b=S3hVOSoJnxjB205WKkYS+GJjPi089MXpPtoZtV8ivRryWZ8geuLqqmRePUTOSEuYpsKJdxV5KXIJJQOnJija8zjA6+w8pzqWKVwielD6rMxY4hK9raSVjcq4xs7K+FsYeqKQf8ue5G6h9845xiAdB9pCzq73ek5VppyTFGCuYVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432658; c=relaxed/simple;
	bh=0h3VmDI4iBQXj5Nj+FuDZCNxxbx91KV/Q28xzeKgxe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vE/Zh+96eTveef1trk+ZpCE9aP1wucCwkznq83fLNLww9ZPSYTMsM90wfedkNDIakhBDwwyoqtJ2OMNg+Cjp9f6ppCq+xYlsGjOchLAlNC7WWFaCmnQLJPz/q0kCEB62EbBNAMqM7hx49LZHQ3zPHcRh3cZ1gdRQnji0NSS17EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=r6nLtzPk; arc=fail smtp.client-ip=40.107.130.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="r6nLtzPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeIOgghMPIzhE4ipuDKv/Uz50tomh8cY7T8t/wHhdF6mPleIRQgThhPWdSDyUts54s8m6XzDkJrt1g1srNcdOcnbiUhjSPsVNlgvihwRXIBCtMcUDFLCIUd5SbPKTZN5Hhvqm9JZhZqRHgoOrDG/5Sns0M3MBvE+PJtMGsSMHr7TS5NEz7DkalXQqk/iauJqT4PdBL4ZbDofoEUdNO6o3vlkHO796BwEZjzvgSCyh+EypNOs5lF0gkiOqaIu9SSfz+cU4iyYtNBah6s9HJbBHhJkDJVRBcHVsQgWHEOp6vg0E5fm896HqyUoA6TjkRk/MDfKP7dr5E7HYxTp3zBxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0TvvqRjBRXfrPbl6H0WQ7ujcdlyJewMxCMwVZ+mvgA=;
 b=a2eER1h6klt9TyLCcjvCpHyOctZpaa7X16GCiXrIyealNeGQDaP/i8Qs3LFDxJjjo+aljhy1hY2lvcG9vHnYLT84aQwSCaFh/91KMjY3fh8HqSALgwi7LFtdBCWjS9MK+++pRj0Uv7MAesXSWkgaUgGegxBybSdIdKRQcd5WUtIvp/zyCZiFEorxshdD4bTeCqxokO2yU5PHUF6D2+xdR39Lw75uDcf+DFBWbtmd2qoN/x5SgTrSka2njfv5Dj4NSLB3VtaGKjkyfSkrHdsImYOl9RTO3HbiKL5bqa1ozY+Qk7tEWU9CJ7wnB/kL6LJTtJ0cyi9y9pRZrMixw5gQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0TvvqRjBRXfrPbl6H0WQ7ujcdlyJewMxCMwVZ+mvgA=;
 b=r6nLtzPkg9geIhZHtyPcACEY0JSqMTUtEOgbtRxGqPtuizawY6OUHzBk4GQaLgsoOGhjkVufvBsrNY7CkFF1CRNpbSn21cdYiLk8/GysX2jPQTK12AJgjq9CgpyfyJOIygoulKCwBvng3ksVnwE51IJVCScJsajwM3BDkT74anZeOXROCP6BCqMMwbWRlN8UsQskyDdV8XxI+muXlW2FHIRvukfuVqyEdfz9ZGIAXBnM3AdXtirXiT7O2En5yHmDYh3C0Fl3ZBkvC8SD0kM/Lv5iT2lWlGjioLCG95sD90+DPqqIrbKmiachSdVqCbfO7Hq7Qki2VKBpakYPrtoh5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by AMBP192MB3404.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:759::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:50:53 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:50:52 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 2/2] selftests/dma-buf: Skip some tests if not enough free huge pages
Date: Thu,  3 Sep 2026 12:50:18 +0200
Message-ID: <20260903105018.565425-3-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903105018.565425-1-christian.gellermann@codasip.com>
References: <20260903105018.565425-1-christian.gellermann@codasip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI6PEPF0000020E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8d1) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|AMBP192MB3404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5b4e8f-ec93-4e24-7aa9-08df09a93976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gTwDsmNrGROEiaJ/h3b5fEqOjgnM8+4sUoFP2v+4RCF28E11qSJ+mZ1CBu68H5jQgnth/aQYP2Z6NpQOMTpLHVygpCCnejG2cP4COcHq3Ctpnqf1cCk2QF3xriPj/kSwpGnDUCiXXyapGG6xzUuweCrxVASdOvA/ifRyXUJCiwI2K83lNKFD/ioarZNYwgQmHc3ULoglaSLnyX8VyphdGCnUJyjx2qz5zwMv7yPwJvQM5GIyW+Qe2DWnreW1eWGpyggyShaJtAFN7kx3BIlry/LsJIL7oAOYh4PLyrcdY2UZQcfkheKuLgZGWw9/0nyrVTnX8Qmi4x0mRQCj7N9WSdn4JNatzkfFJmnvQnozvbCFs4i+LZMuPgkn7oadpk/40JZQO9b+FRoh/el7yG+QKZ5g+D7fM2FkXYsrO6l5UeI2uUqh0PWaovBOv9Eqm3HGi1RXUjM1/ZhyaAwhsR32pK8+3BJXJhKdT3ezvckw7hcgqYEJns2X1c55aKxWIw9YdDPsAqbY7P6vR3XKlnisjt3ciGlGh5k8SlO1ThUD5jOZhe5X014UZxs2aGaw3f1vrtBw5S0LKtuQVDUoVXqSwDeAMTNYtn5J6JY/+TgyefW11HDiRJ3M71uKiDws6/Pgymh6k64XCCyCnHtV4EygJN0QLBfSRRO2j8QiGC4TtnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ruGKkuQ86MgCCzrZFk40UHEA89hBMeNaq1rN2nXlztt/TRvEp+Zklwkn/RbT?=
 =?us-ascii?Q?M3mmzFHlCl6SisPdtT7u8baU2QZofHk8GMT0uD/kHMn2sdhTl5otowSCJRYb?=
 =?us-ascii?Q?n2PAHFg14oWCsbR4R15LgPecvGa8VJF2EeouFcyp42oHdsGUM2AMTWZzGie7?=
 =?us-ascii?Q?0l+HwyG2O3dvK4tsXFKdwHuqZJUxns6h1mO4q52aqdEgqqcX9yrBp9Ear0Ev?=
 =?us-ascii?Q?+i+ZDVqn6OhMZsQW4jPYRTmJT0cq1BerEilIjRnAvVUUhBRfoj6BbZLN6fLP?=
 =?us-ascii?Q?avNWNbYFMup37ck6d4EjvjpDUDX6lyr3WQ7fxFiTCO4G75qzqRs6Bh1U1ryG?=
 =?us-ascii?Q?rSPTAeYRd1lqxOoCWZNR6Xi5Ci82bCDbbR9TKYU+OVEST0G6y77+cjq5j9DE?=
 =?us-ascii?Q?V0hFhkw6vPC4ilNFCOTbiNdwIq5PrgLVbCckmDFtd6sbRONVwMEw1Bg3A+k/?=
 =?us-ascii?Q?lox/MG/YMUXadJ6zK1qmWzci4PPwhR8CjjAg/8XOFpSm96JreW3S9hPmvqt6?=
 =?us-ascii?Q?PJQr4iNry7l77C2iWgGGWosDz5s9zlqYrdV18ztRQwK7bCGLTys795T7dwL/?=
 =?us-ascii?Q?y5UgvjyO8atWNf9onWpAQRgQfSRz6UrIEkVXiAdwoR8E1BVQU455iju2dnt4?=
 =?us-ascii?Q?7mxNsLLrraC414Nj22QSV1RMmmyLlJiwphEo1EEPNMMS7Rkub5/lJd942WAZ?=
 =?us-ascii?Q?347dgOOfQmpX/1IkPfoLEZVoXshZH/wJmsraps9O97v7sz1sTKgKxN2ozKE+?=
 =?us-ascii?Q?VnXgC3VjgSc0jDr09ftHCCN2KGb4BqGY76irUhMoV2J5LsFMDcSxxPUtKlfu?=
 =?us-ascii?Q?pOtx+RdqiQYmAIhY5kSBTmPvo6B4LDF65G5bI9BNSAJvtUEpPwbr7Wj5UyPJ?=
 =?us-ascii?Q?yZDoHYijnRM1asCjvkBPKE+baTzXnV7EmHW1r2aQ8k0RTg7rSEorbyGLQdJ5?=
 =?us-ascii?Q?e4F11igZ2Z/JN6QzNSrrB/D6wMCkFQo/wnjJoiatcu6KjtGdvtQwyueoc4GM?=
 =?us-ascii?Q?2+u1tlqz13HDva8t0fiXCj2ScoKWH4MURpfDHvdUfRAZx71gqVDB2hls+b8I?=
 =?us-ascii?Q?IEUzsS1K+W5Aq/haX5k88syItraWTqbVdRJwgZjom/uRwpOHgMDRzGt6SSoC?=
 =?us-ascii?Q?WIey25Kqc+zw4xXOX6LwuEkH0ArDUmfkzMckWUBJpOf3jZApxRrgdThFqaoE?=
 =?us-ascii?Q?wet3pV7+YLnqMKhyCV6/2AQddgL1thbhLUIP6lUoCUhtuZi53OFHkXugFI4s?=
 =?us-ascii?Q?MKg1KRaukrCnVWXuuod+PMeaW5lwlGy4S7GNso+VgoyEGVY/3kvG6bI8LwLv?=
 =?us-ascii?Q?1u3ONKGU+hLCtHvIGXKB/u+7kjScgJkVSSrjDJazOQWdDJAIjNPaOsT4gTiv?=
 =?us-ascii?Q?GfG+WmnFCYeRM0A5/Tn6BTOlAqIAOJ7/3DyRnxDMD5ZMXWc1xE1hbZUjzXgX?=
 =?us-ascii?Q?IGHc32yqcnrSG39S+EVspMz8n4ja8KFRurB442Z2HBoin/QSNlC7XXKFuCdD?=
 =?us-ascii?Q?VrNmz6I8zQhxFv8Zs7MwLMfzKXCgmuIMsG+IoOMG3w5/xeVFGedztLD71psf?=
 =?us-ascii?Q?EAQOErQeuxTKcfwVYTNaLXmdjDUF/ZS4RVWA+DQdQBJMfumSrFmXETXn0xqM?=
 =?us-ascii?Q?3bJbA6djluOPwrG/MTFdBEn0WfinhkVsNDNSKVtHhKv1Q0+8Z2cIpHsz3CAl?=
 =?us-ascii?Q?DV88UE69+MjnSWE3T5WD9nvcryvFyk/pjIam7HDaPZLsoKvbOt5TFMDD2H6C?=
 =?us-ascii?Q?ITXUZmBkNeUQKXMEa4EZFC75wSdcHasX0fbPeStXVLX5lEIj9EmyYkHjK5+N?=
X-MS-Exchange-AntiSpam-MessageData-1: Wqoq/EKkFHpPk9b9qDsjeeqyFAR51Va9yuU=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5b4e8f-ec93-4e24-7aa9-08df09a93976
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:50:52.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMQHuhNUqta/zPxil7zWbs/pSF1SeK/2yJSWEDX2Zp4YNVpZ0QsFuWPwu2n1etTZ8kcZcA/FGIGEnGb9XziMjbCHfPsd9ToNu6FC3iIoz5Uykkc4aQurdb4bIThE3NlM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3404

Subtests 6 and 7 of the udmabuf test require free huge pages. If there
are not enough huge pages available, the entire test fails on an mmap:
	ok 4 drivers/dma-buf/udmabuf: [PASS,test-4]
	ok 5 drivers/dma-buf/udmabuf: [PASS,test-5]
	drivers/dma-buf/udmabuf: ubuf_fd mmap fail

Instead of failing, check if there are enough huge pages available
beforehand and potentially skip the subtests 6 and 7.

Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 .../selftests/drivers/dma-buf/udmabuf.c       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index 2def04ed3451..daa2fc6c2c27 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -25,6 +25,34 @@
 
 static unsigned int page_size;
 
+static bool enough_free_huge_pages(off_t size)
+{
+	unsigned long free_pages = 0, hpage_size_kb = 0;
+	bool found_free = false, found_size = false;
+	char line[256];
+	FILE *f;
+
+	f = fopen("/proc/meminfo", "r");
+	if (!f)
+		return false;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "HugePages_Free: %lu", &free_pages) == 1)
+			found_free = true;
+		if (sscanf(line, "Hugepagesize: %lu kB", &hpage_size_kb) == 1)
+			found_size = true;
+		if (found_free && found_size)
+			break;
+	}
+	fclose(f);
+
+	if (!found_free || !found_size)
+		return false;
+
+	return ((unsigned long long)free_pages * hpage_size_kb * 1024ULL) >=
+	       (unsigned long long)size;
+}
+
 static int create_memfd_with_seals(off_t size, bool hpage)
 {
 	int memfd, ret;
@@ -236,6 +264,13 @@ int main(int argc, char *argv[])
 	/* should work (migration of 2MB size huge pages)*/
 	page_size = getpagesize() * 512; /* 2 MB */
 	size = MEMFD_SIZE * page_size;
+	if (!enough_free_huge_pages(size)) {
+		ksft_test_result_skip("%s: [SKIP,test-6] not enough huge pages\n",
+				      TEST_PREFIX);
+		ksft_test_result_skip("%s: [SKIP,test-7] not enough huge pages\n",
+				      TEST_PREFIX);
+		goto out;
+	}
 	memfd = create_memfd_with_seals(size, true);
 	addr1 = mmap_fd(memfd, size);
 	write_to_memfd(addr1, size, 'a');
@@ -268,6 +303,7 @@ int main(int argc, char *argv[])
 
 	close(buf);
 	close(memfd);
+out:
 	close(devfd);
 
 	ksft_print_msg("%s: ok\n", TEST_PREFIX);
-- 
2.47.3

