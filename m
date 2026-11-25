Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613617;
	b=zIUL6MFpx3CIiHpz24IHP/DEjljdIHr+qRSuz4eVZvAefvv819mlADpGZHF8WdBfXSQf
	 VznejxJuus4geDUzu48AiDdZHcG/y68l1lgGqnr5P3gVAnWi6y/wzRSwyzh2FwgvCPOWL
	 YOPdSOK/VR87EfGawQDqXmTSIMJOztXNdDeFDlRIFGf1T+R2Y3EqDT2td3qM2H1E6IIWa
	 nQ2ZhhHTDUsv0APnqg4c4jm1W+zi+5uUOZTb1/yOkvuXjE/lGrsleOrOzO1U8qeZ1ZC/F
	 C7ilwftPFgAHL+zPaE7oXx+kUDDigHrTXRe4BqIe8TbERqxqkGH2LkdcZCozxztpMkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613617;
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
	bh=S62w6zjcW3s/J+PftCdLGf4vo2CWiGOIoXgabOAgCCE=;
	b=OUZPzmOLbici2ZvqHHvdXbQ4tdgKF2B020mQ4nav8pSFn2OW49fq7UgOPGWbuU/jnlGc
	 YgO6vj90i0OPwT/JkdWm3G3jMkNVQCU+py+2OJfuS/uVnYAAFgj2oanWqFv+O6rQQ8vul
	 vkr0QInLfzCVtxg/t8dKXaWj2j+YGgVwuDRTN5eEbNT9zi/B+vGOUc49trGyeg+tYkZXw
	 qNxIwidOEJ4PofCSk3nOyQRUOEtaVrq/2heNmcsJkajZiJlgREH1mnT0nAWpSyfR2ITSP
	 x7nXSeHoRf8k5QB6fyBA/6hJ9AMW/gFZ4HETjk9g2H2rh1VvDhOJgoqmvsUO34sIDKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q9GMfbnE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.57
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BF606A31E;
	Wed, 25 Nov 2026 13:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823BF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q9GMfbnE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRveqmgsXDxuv4NY5oV+eSydFSlKp/fu+FEtNlWGQLLVgmXbmzlNgJHgGQbCQhKEv5GrNo1k/sZ3a+9tx+rWRWhy4BHpi44zT4NfwiFOjS9ZVlWkZSC7LtjttN7kASskq5xvtCH2XNE9Msm+WpoGfo/mL6p04Mp7vFjXqALelrcO5HZayT/odjsgLQQc163fMp8Yys9D1kiM8fBU2bRC8pUBGvT0EWLjnYuBoHQnev8gUYjrGDp6Z8b3kGQnjLxf+jKsJFwzgPRHXCeb+1Y2+dj1jkx9wAckf8wIbRgMr7oicXJmtAubXFJaE4wSCRQsP0C/fhSnCz18KvdWq3Ep1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S62w6zjcW3s/J+PftCdLGf4vo2CWiGOIoXgabOAgCCE=;
 b=nXg1YwGdS4i7XdxrIFghNWYBM9/hKjRDe1UojNdEwys11tKzwahKhc64TYuScCCbfZ6o/2LSJlwwq6aTUVLHo+dQ0JYbDvYb0dFm4QdaVkXy/s2hyqngDgGhcE8NM84IMvD68QSSZ55XHLOBa1ytVh2sYwFdFnXU3uT5mhNXl8o2zdm4Y8mPt8ZX/g9dVpZbbJjzHulM2Nys8j4RGGAfcniPkc8pDOSCr2J/CTElhPSKKgpsjJ2bEsJgYHOXi2VhOWPtkujJEvC3Qj4/D/N9Fx7ON01vNuozV4DfDZex0+SIBjCtzIxuBSsT3c99Ntir1YBN4qSoBXmAhoT2VNThgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S62w6zjcW3s/J+PftCdLGf4vo2CWiGOIoXgabOAgCCE=;
 b=Q9GMfbnEip63TZEDghlfa4h82DqYN0IhAFsBSFG9gnRfF3KrwFFp6pIwOs458XfS6DECBmqrNgOIGqSe2zER1AtyNaO1lYIXUC4TjSiblYLEh+hBKI3vZw2mok+llY6bRGnE29mM9CGW9IzYYLtmS1KcQ1NVA3MMrMNdHFA3J14=
Received: from BN9PR03CA0327.namprd03.prod.outlook.com (2603:10b6:408:112::32)
 by CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 13:33:23 +0000
Received: from IA0PEPF00000046.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::41) by BN9PR03CA0327.outlook.office365.com
 (2603:10b6:408:112::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 13:33:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000046.mail.protection.outlook.com (10.167.249.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 13:33:22 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 07:33:14 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Wed, 25 Nov 2026 13:32:27 +0000
Subject: [PATCH 1/3] mm: move the soft-dirty fallbacks up in pgtable.h
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
Message-ID: <20261125-b4-mm-soft-dirty-fixes-v1-1-538e3cdb618c@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795613581; l=4846;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=nVG+o7H7zKVc74+mKyu3/hRn5ugI+dylRNZVZEKpQG8=;
 b=o2v9vqaAeRGQXMu8q2IPQDHI1MNVPa2O/cxD6JXN82bVHDgYx6GQXWlgvpG+VoO0lCjdC3eWq
 fCgF5sw4FihDoPArErwp5EqYVEkD0ESi2N3wDpV176AOSbuG22W/zc4
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000046:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: d0009333-1b6c-45a6-0474-08df4af8aceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|921020|10067099003|11063799006|56012099006|261022105027099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022075727099003|261021123027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h5dzVHQzbKni1lmzavo+5tooyAL7veA0CfS8PS32igm55j3mHisNHq3S7tizznL98WR41jjwNnS2PNaPU0335Wc/ImCoYIF2fBvRjyKL6XIBYPTn0cTbBDW/HeA98xAnypQ/GOTRNpWCIxfx33L+eKvzZu441k29xPqdKxqbr/oEHSYOvGOHFRR+3hdgu0TOs7eWB0lJPQutzznmYzoHUXGZ/nVAjdUItSs5wd4eCP16b7IdZc9g8SacEVo3512xzwMkUmR7dQN1fi1ac6ne0GvWMPHJ7hw42DVVR8hDsm7KCxcbPwG0LRkkCohFpCrFIqXCV2njT+foAy3EN1cxBfjQgBEqA1ey/XO4ffc1ZgfT+RehOUPtLMCzqw3pRrNnUkq/uEHSdZuy+6e15k3rjDGFZcTr19PmjekspDhaLdSpxP2KeHFiocdgWvO5KTCjO7d/a0zkMeypD9azbJUdoEQS4QHYiOa3wDjnET34EdkjZAxuvnphvS6snxRsOvdO0rNmH8uje32CRFdcVGswImOL5i5Gvg3iSvcaY5rPgTZVAWJj6wS5TeCatAlAcyOugUK1M1Z1pN2wghMKJqHfFlWLw50b9Pf3fOGISyvY6jSxw4jz9XjL5mmditM+FnzT6PNGKt5yOTKCck8t7fqa6gPjoGrlBbmw2kQeJrmbCMH+0Bf1qodzdzZ5ydoZy0L3eoPjGlq39VclzOZ3NFsctjgJy8LJ4RcjkfIzF3PSXLohm7qwCH8QvtwlrcUEC0fX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022075727099003)(261021123027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CkwkkDQ/7YY+BeCZ0w5K7gfMoai9w4jXNozyzfLtKIHpyqDvTIAF+iAYyBY54CaHye/9UJIKYCKAB/OQUiTQY3AXnaO20nEFCswliwqr5qNxbvSZe6C2IyAWQj6HquDOPU7qcA+6zZZqmazdrHBP3C/t5SdQaOyy4ZTp1oC2dLYY73KUDaEdEVGDohYzAg/tMYwJotNbTzAG4NsbTdYeWJ+TxQwh9xSyrAStUHe2p+KtPrsmKhqaP6wdsTAC2RBCtD3GqGxrF22DT2j8vYCWj98JaoXDOpy9sPv7FkuOjcpnd2+WRWiBho8BlHYBj5SSCmJ8y2UNFF1UFeXhzMYFjVAXa2cMIt7nmg2IbCOje2+SfRNJwu4Q+phaoMzn5IxdeeODBbGqx6hx5a/ok86zCMkqVRWxyIE4aFsdiPeTK3cCyT0zQejew4wm0y9oMRal
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:33:22.2879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0009333-1b6c-45a6-0474-08df4af8aceb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000046.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250

The fallbacks for pte_soft_dirty() and friends on architectures without
CONFIG_HAVE_ARCH_SOFT_DIRTY are defined near the end of pgtable.h, after
the batched PTE helper modify_prot_start_ptes().

Move them, together with pgtable_supports_soft_dirty(), up next to the
other generic PTE and PMD accessors, so that the next patch can use them
in that helper.

No functional change.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 include/linux/pgtable.h | 182 ++++++++++++++++++++++++------------------------
 1 file changed, 91 insertions(+), 91 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 66d369870a74..b1db7aec5362 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -194,6 +194,97 @@ static inline int pmd_dirty(pmd_t pmd)
 }
 #endif
 
+/*
+ * Some platforms can customize the PTE soft-dirty bit making it unavailable
+ * even if the architecture provides the resource.
+ * Adding this API allows architectures to add their own checks for the
+ * devices on which the kernel is running.
+ * Note: When overriding it, please make sure the CONFIG_MEM_SOFT_DIRTY
+ * is part of this macro.
+ */
+#ifndef pgtable_supports_soft_dirty
+#define pgtable_supports_soft_dirty()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
+#endif
+
+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
+#ifndef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline int pmd_swp_soft_dirty(pmd_t pmd)
+{
+	return 0;
+}
+
+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+#endif
+#else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
+static inline int pte_soft_dirty(pte_t pte)
+{
+	return 0;
+}
+
+static inline int pmd_soft_dirty(pmd_t pmd)
+{
+	return 0;
+}
+
+static inline pte_t pte_mksoft_dirty(pte_t pte)
+{
+	return pte;
+}
+
+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline pte_t pte_clear_soft_dirty(pte_t pte)
+{
+	return pte;
+}
+
+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
+{
+	return pte;
+}
+
+static inline int pte_swp_soft_dirty(pte_t pte)
+{
+	return 0;
+}
+
+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
+{
+	return pte;
+}
+
+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline int pmd_swp_soft_dirty(pmd_t pmd)
+{
+	return 0;
+}
+
+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
+{
+	return pmd;
+}
+#endif
+
 /*
  * A facility to provide lazy MMU batching.  This allows PTE updates and
  * page invalidations to be delayed until a call to leave lazy MMU mode
@@ -1850,97 +1941,6 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 #define arch_start_context_switch(prev)	do {} while (0)
 #endif
 
-/*
- * Some platforms can customize the PTE soft-dirty bit making it unavailable
- * even if the architecture provides the resource.
- * Adding this API allows architectures to add their own checks for the
- * devices on which the kernel is running.
- * Note: When overriding it, please make sure the CONFIG_MEM_SOFT_DIRTY
- * is part of this macro.
- */
-#ifndef pgtable_supports_soft_dirty
-#define pgtable_supports_soft_dirty()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
-#endif
-
-#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
-#ifndef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
-static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-
-static inline int pmd_swp_soft_dirty(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-#endif
-#else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
-static inline int pte_soft_dirty(pte_t pte)
-{
-	return 0;
-}
-
-static inline int pmd_soft_dirty(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline pte_t pte_mksoft_dirty(pte_t pte)
-{
-	return pte;
-}
-
-static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-
-static inline pte_t pte_clear_soft_dirty(pte_t pte)
-{
-	return pte;
-}
-
-static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-
-static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
-{
-	return pte;
-}
-
-static inline int pte_swp_soft_dirty(pte_t pte)
-{
-	return 0;
-}
-
-static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
-{
-	return pte;
-}
-
-static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-
-static inline int pmd_swp_soft_dirty(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
-{
-	return pmd;
-}
-#endif
-
 #ifndef __HAVE_PFNMAP_TRACKING
 /*
  * Interfaces that can be used by architecture code to keep track of

-- 
2.53.0

