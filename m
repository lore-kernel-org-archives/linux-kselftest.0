Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613628;
	b=Y+M2Yf3lqk8NVHtcRRmlLoLD3IjlOBo3ZDwFxOKCYua4a75ppK0oy+gw0hv4PrKpxIMw
	 wu9iFPVI1yiVTCGdNz9kBtLd7Lhl4+XPNs0JWLc7yOleT+C7quQ8/DEg3zyDeELULAg9N
	 Mz8mpRYR82qEkSyEVHdOUut+H6uPa9LeXrLHql4jbyJOCuBDuMnricmQTctmTqpNQ4/Ms
	 v0y3nbMGhZ9JvajiuIWKqZusuh+Dud8CSKBhVJ1I03G1nCE8Ru0+yA5uzdBnp5/u7I/G4
	 SJFPXEcJYX2aSgrfqkbaOSY1+4f2Kr1g1w3vM4q6YG3Yd0nGF5u6AbVRzATqb4Ihaig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613628;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PD2+gZ9xbgSXLbEJ7tI7PWfna6B+HuEHpaZoWRjo0k0=;
	b=WU6tiCdm236KAAYy4nht7+yYFwl7Jk5E1n8VHPEL1NA/6D8adB98RlixuggoevaIO+ru
	 R7IbZYybBg0EH+4RIswwjTXIJ4tWM0lkHRQ9KJm7e7/6i1qxqRyZPMwsPU+zSzE+O0CCJ
	 JxL8icJDAGlRaX6a8fWks0IGip5K5j6L3c9X3HA4nqCcQEA+OBdgoGhn+L7SO3MrvPv77
	 yAQ7tfldbSfFP7/LuSGilg7Co+U9vnL1YyLsMiU8b73JS9G42q9aRRWUeMh50OjcIm9+6
	 /rtAl8tpGieaITMscck3SDZC7KKKPE4d6oNExS0rNii9LWq9X1SmyQ5pWUNdtbKrPXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lAompqCr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.27
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63090606A31E;
	Wed, 25 Nov 2026 13:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63090606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lAompqCr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvDbykgM+RHq3dMk/zB81OrM9pQblTuz8oCQzRB1+7Ag3qE2M61vHQ44Q4M7Vdv/FWzfngnM7WGwfULrznvFsBdfbAqAQuDDMw0aJ1fS2Neqly8WAA40paL/jC72+ZuirFPbtYvuR5MZGy2+6yydq+KZcylsoox6KOPG8dNVGcqjHm2I7hHuuP/LeRIyfVORsHxaZ0BDKH0MkVjzuHn0yh5gasB+ZQcthPhEATdBu0z7TdJt1uVERcx+r6245w6prMyCMXVFNOHU1sX7DEGgzxPwk6CUp31Vb71Q44tsY8JI4Uj+rar1D5mMfuOQ18nkR1nDC3L07dAJgGHz9ha8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD2+gZ9xbgSXLbEJ7tI7PWfna6B+HuEHpaZoWRjo0k0=;
 b=LeCV37axebXn28iazs2ECoSw40wND5K4mCXYNcNVJ3LQWIw8l0UXBqAKmgUpYynsexiolMcGF7VXIKTkM/FCyUCYWJOF7MGcdkU3RRCMc1Mitdbvv9Vv3BE2I7fymX1dsXbSSWiIbORa5MSWoYfA9IOp2/9JUQqSMDUcg6R3/9vJ6G0JS1CAJUqdAFc4Vg2OJJfQD91XW+GLT5JmOJJC0K43pnqUEYHzUvDQGzOQxntitG431Z4DlpVzTdPA0hQOVTX79oipWN1fTRupbKvOImjzRX25CP5kXybEwnpbHNdM7J9fkl7mv54MFKFghx2nyMCPT1p5XIoF6J7zScbjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD2+gZ9xbgSXLbEJ7tI7PWfna6B+HuEHpaZoWRjo0k0=;
 b=lAompqCrmxTeFYZC01nU/g8vKD0fMWiS3Zd6wfMFseeRlNcqqmVfRMRpaFCExlVv8E0itkzDi+ifAjcluxAaZkOkBHnPXELiQ27wlSF484l5hbDK8rOI1jt5M2xbu1LpZNSnwfLb4GVHZhJ83sVMmvlKvzai5Wh2AUgRfZv6GJI=
Received: from BL1PR13CA0368.namprd13.prod.outlook.com (2603:10b6:208:2c0::13)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 13:33:37 +0000
Received: from IA0PEPF00000045.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::11) by BL1PR13CA0368.outlook.office365.com
 (2603:10b6:208:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 13:33:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000045.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 13:33:36 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 07:33:29 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Wed, 25 Nov 2026 13:32:29 +0000
Subject: [PATCH 3/3] selftests/mm: soft-dirty: check that mprotect() keeps
 PTE-mapped THPs clean
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261125-b4-mm-soft-dirty-fixes-v1-3-538e3cdb618c@amd.com>
References: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
In-Reply-To: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Dev Jain <dev.jain@arm.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache
	<nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Peter Xu
	<peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
	=?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <emmir@google.com>, Andrei Vagin
	<avagin@gmail.com>, Paul Gofman <pgofman@codeweavers.com>, Bharata B Rao
	<bharata@amd.com>, Daniel Wade <danjwade95@gmail.com>, Yin Tirui
	<yintirui@gmail.com>, Muhammad Usama Anjum <usama.anjum@arm.com>
CC: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shivank Garg <shivankg@amd.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795613581; l=2900;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=ysJtdznB006XPCFLKnSInZtgqTdAL0R8zaiatSvHshQ=;
 b=sftYeLk03VXHJ5y2JgHDStJJeb0pD1CgWZsJIWWt2Efwq2p2IbkTEg29OQa4v3QI+3R61H4+L
 XoycZIfytqtC90IvMaqYy/F2hNhYc+mL/PiRw5kkoLQRIymGVaeMkMK
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000045:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b5ef3b-871a-4f64-2d7d-08df4af8b57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|23010399003|82310400026|921020|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bRlFROlxqb5gvsWGo3sIIRo9eOCFN8RLj7gYbeS0AelD0kTkMvas+K5gpsfvXqJB+GYkCktuWh4dbpx407c1sA11Q2/JSx4+G3H+EZaQmBthK/KCy7RnWeXRWkov2fIPL1qW9uwFoyfHHL7vUEdNsag9lNwkEvey3R6fCyRRGYXaVwqMFBYwKmRXJ+NXMILlLrpXKtHuE0fFM+S8tx/c1zefJTfGYGCu7Wgixq8HIcGbyM6WpxTi27M8TsCa9QMpsH9v0IF4OmIR+Y6LLPERJHMJvLvLfttLqq4mfJ7S+pEQ0gVNx+H2AuwSqSgspmpf/wwbKvSuxaZ5rrCXPPvT3LqgCZ4Yv7vKhIRlcQjk3TV5iUdS4/bjujO9S63jmwDy+PF044ojHu2b8xKWRklV87Wk9m25mdPWQEds8Rnpip5TedDyMowXblMK1XizNkCwlhMpBy5FhNMZUdimxG+gxbwpyATKlKJcI0T81b9S9UPFcDUjMzfLo9ppaLT7YRVCcEcIgE1BBP4t7TyYCpyqYNx/FAijNJm3J6lVSWtUFssCNIjEB9tRgcUrEkOd0+DhUn/RHzzBKHWIY8OtmM4XwU2kHvMDSSa7wDAnWsE7lcwF2Q/2p7zT682jB2rnBBtLrFDhhzTeMyJvJTqYyR98vGJRiVwQKQ0gbFhVOtE1+823npfdPystAy1FUuz3yY5xq16320mf8XnFxayEboK+c+G7uSmfTU/ki0iqYhiVWIYiTu6mILBheauUJ9TCMP2W
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(23010399003)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M+U5tuMHO/PoUK230RtyyR2C3N45pf6Hd0uhz8SPmEa2zihzNiD1VkHsnqN/BwtSjHg7RNCzm9eGa/0WcIzwSuuuFmUj3PRkP4n2yeqfhXPCMZWB5WtDsw/9bdT1/dW73LIt0dZRqZirzqPBl56d5a+yiM+OWvm9JchsGj+LmqmY0QAB4wqpEUam0asXTlfsF83+8FfKnyVRRRVR9k+1V7Q4s2uHxNOR6pFzo9o3G8LfyWFt83RE4kHbTq3fmuc55Te6PZlJiHUhc/X15jAs3xqpvRZAPW6QVEAXj0AYpFmifDtTtV0lgx6pRrU4ruNU4G9N5GjMv3jcStGPWte0R98tk9yGvcWjlUXrbW1F/cpmrTDG25ZOexrfnxflNrgCBJQL6QgQetT4z8O9/lr4kry7YNMoPrRo4kYq4e0OPJn9o8TmW/bMChmiO6boJTqY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:33:36.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b5ef3b-871a-4f64-2d7d-08df4af8b57e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000045.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223

Add a test that clears the soft-dirty bits of a dirty, PTE-mapped THP,
mprotect()s it without writing to it, and checks that pagemap reports no
page as soft-dirty.  mprotect() batches the PTEs of the large folio, so
this covers modify_prot_start_ptes().

On x86-64, the test fails without the previous patch.  It is skipped
without THP.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 tools/testing/selftests/mm/soft-dirty.c | 48 ++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index 7f649b673355..1764e285f125 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -310,6 +310,51 @@ static void test_merge(int pagemap_fd, int pagesize)
 	munmap(map, 2 * pagesize);
 }
 
+/*
+ * Clear the soft-dirty bits of a dirty PTE-mapped THP, then mprotect() it
+ * without writing to it. mprotect() batches the PTEs of the large folio
+ * and must not mark them soft-dirty.
+ */
+static void test_thp_mprotect(int pagemap_fd, int pagesize)
+{
+	size_t hpage_len = read_pmd_pagesize();
+	size_t len = hpage_len - pagesize;
+	unsigned long nr = 0;
+	size_t offs;
+	char *map;
+
+	if (!thp_is_enabled() || !hpage_len) {
+		ksft_test_result_skip("Test %s no THP\n", __func__);
+		return;
+	}
+
+	map = memalign(hpage_len, hpage_len);
+	if (!map)
+		ksft_exit_fail_msg("memalign failed\n");
+	if (madvise(map, hpage_len, MADV_HUGEPAGE))
+		ksft_exit_fail_msg("madvise failed\n");
+	memset(map, 1, hpage_len);
+
+	if (!check_huge_anon(map, hpage_len, 1, hpage_len)) {
+		ksft_test_result_skip("Test %s no THP\n", __func__);
+		goto out;
+	}
+
+	/* Zapping the last page PTE-maps the rest of the THP. */
+	madvise(map + len, pagesize, MADV_DONTNEED);
+	clear_softdirty();
+	mprotect(map, len, PROT_READ);
+
+	for (offs = 0; offs < len; offs += pagesize)
+		nr += pagemap_is_softdirty(pagemap_fd, map + offs);
+	ksft_test_result(!nr, "Test %s soft-dirty clear after mprotect\n",
+			 __func__);
+
+	mprotect(map, len, PROT_READ | PROT_WRITE);
+out:
+	free(map);
+}
+
 static void test_mprotect_anon(int pagemap_fd, int pagesize)
 {
 	test_mprotect(pagemap_fd, pagesize, true);
@@ -330,7 +375,7 @@ int main(int argc, char **argv)
 	if (!softdirty_supported())
 		ksft_exit_skip("soft-dirty is not support\n");
 
-	ksft_set_plan(19);
+	ksft_set_plan(20);
 	pagemap_fd = open(PAGEMAP_FILE_PATH, O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("Failed to open %s\n", PAGEMAP_FILE_PATH);
@@ -343,6 +388,7 @@ int main(int argc, char **argv)
 	test_mprotect_anon(pagemap_fd, pagesize);
 	test_mprotect_file(pagemap_fd, pagesize);
 	test_merge(pagemap_fd, pagesize);
+	test_thp_mprotect(pagemap_fd, pagesize);
 
 	close(pagemap_fd);
 

-- 
2.53.0

