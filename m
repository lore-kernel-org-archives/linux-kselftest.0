Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613603;
	b=uR34ImB529ACLA9paZnOj5d7pMfPnzWYSpZQgqmkEp6opcQ5QcGT095jICDBON/kf0Hr
	 7mCqqP/B1gA+Jrm/5ZPEl53qKFlqTC53P/8wdT/+6UYlFLbkV+9J3P6jkjgiK0N8+39sW
	 qXPfzOobYa0IL6Vp7hiIFCH5CsnDeVJ32aKJUMpknhc1k7LI5abp+5oqh5XZt4207Y/1n
	 QicRwZ5WdhN1CzywqNU9ar6X3ieyEmYQ1pCSuX0LCmUIxQRilvoC561HsroTdBTeQLMWn
	 wMlWSYtzztBLyvZ7U20se+y9jozXviP7/D0aL8VnB58149ZzB0NjfKbEdodD+rs67tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613603;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
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
	bh=KFm1F/LSI7vSkLsu5OtQQybuZ7xVYgJ0MyanQP6caEs=;
	b=FUtKOkcLU5+yZC+qJi7zFue4th9KymHyEaeKW1/JTZZvX4AfNEbBTbs6cbKFxFXGdY53
	 eC/b8HtgJ/SGTPvrFP661zAGUAPRXgfy9Q+r4UsLFPZy8jPxJ5rQOkR//HXPJ3RVC6Ego
	 E2cenlrOgwSmmzTMMNfAAb1VB5KLgusKSUU23Gxj+yqjhK3///S+nVoLUoD/pHJ1iJfdS
	 GQPr1ORvglTec6olYI0yjb2uxHN8VXFkMg37X04Od5BbzEM4RnzTNnCf9Bl6FFs1YOTKx
	 EmCkO1VEf+WjJFxDgafLwGyv8NU20FTz3dJiePNb9GMpzB9WOF3fnKnrdVNCQ3wz57A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FEriXY39;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.0
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8852606A321;
	Wed, 25 Nov 2026 13:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8852606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FEriXY39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj8eO7kJJsjh6UfTJMqqI3qzYRq4BsGE3rx4Zf1lM2v1Divn1uL+l6I+4gd1+XND1dWhURyETWhrJe77AiJ9QStAmPgl5tr/NT34+dFGSv8SoDFyR58jKxDtldzPBawTgcHh605NoBIfKQHLlvZ5/DGpl+FqDMUB8puxYlZwXByew9sxP987rn2TYH6joDzqrktNX6chU4pe6Ew3Gs7X20JfMSylJiqchynT2xVL2roCEPRQwEIrdOJm0I8/qjz2N07tfAyx/GZ0sEGn+KRhbRULQ4kbi9pOwoE4Ne+VYT0bKPFgkabxwAHYyscD39altsnlqsO0cELo0KOs7onlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFm1F/LSI7vSkLsu5OtQQybuZ7xVYgJ0MyanQP6caEs=;
 b=ryrjb+sLksuSTFwypaRf+lXIQcm6PQsMlNdqDB4qf05XLKV8NGZC24uPV0NlPT560q9oJwrU38U22bq5BJUFP6hox8Hwb7A5uUGsIImkQfRnqFFmxotKIN+YUvJd/sNiSye9lOaGH8q1KFmT6S3QaIDqZtJT+3p9wUKF2FVv64vSASkT8QUy5MFXvzmnc3GfR3SGcMzj0fSh8rgNth/A8Y4vKF7jH5KQHhgVpo/Enwj1h2kObNaCaec+r+FBgQQzVEl7wYu7F99UJP7KglAzm0kQwIpoEPHQou8oV+vspSzrdW8xToQDi84l4VZNjF4otJduB1ftEXlOs0BhS29Mww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFm1F/LSI7vSkLsu5OtQQybuZ7xVYgJ0MyanQP6caEs=;
 b=FEriXY39KQSBKSdUse0r4oZKEIBQj5ZkXpJjlqnMR8iWr7ed96wkC1xtH5X5er/e1byNGF0k1LL7n2UD2kFA38p+/SJld3oovx8YLjROprPr0B7rPd2+F4KKyeqMGp0Zglf/d6CGmaeru1X+KgD5cDDHBhO6mUrYPCwvEpOC9Ys=
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 LV2PR12MB5917.namprd12.prod.outlook.com (2603:10b6:408:175::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 13:33:14 +0000
Received: from IA0PEPF00000042.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::1e) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 13:33:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000042.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 13:33:14 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 07:33:06 -0600
From: Shivank Garg <shivankg@amd.com>
Subject: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
Date: Wed, 25 Nov 2026 13:32:26 +0000
Message-ID: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTtgQqrSVxEXJpm0U/BCJpaK+
 O6muvw4/GcHocgk8Cx2iPRl4XnKUGUB7j1ML0L22aArXSulDVqD44gyh4SeY9ow8I8E69Y9mpa
 UD9ZDjpdI15Dbrr8tq/2QS/83OI4TM+CPCXoAAAA=
X-Change-ID: 20261124-b4-mm-soft-dirty-fixes-68c578e1dfbd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795613581; l=2300;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=Hl/TQ8+lQU0UKIKuK3Xi1XLX9SCpaff1HyNm5GH0CgM=;
 b=PJiq9e3laardsBxVABvA5X2gOdvCdHW/57izuLWbopL5FZfobUg0KS639v0+ArbO8nVSjAmm5
 ndXBkUbl7S9Dq9653IgiVcQWrxNmmp/NLSC3Jr5B+Ghu8NPGb3F6Tdd
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000042:EE_|LV2PR12MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a34a98-5d2d-43cc-962b-08df4af8a846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|6133799003|18002099003|13003099007|921020|11063799006|56012099006|261022075727099003|261028144727099003|261026121527099003|261102123227099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	k5X7y7tHYIJAcwvzTQLBwIGDmTsfX4uVloiTMRL3erlHBZvg9DMZnHP+4BkdKCwb4lSxjoTZ3lrZuGASPAzjVy99Pg0JjVoSzMIzVSJYzf7cMy6JPlOIfFM8ANmdzj+OiGITMTUZjQajPdvIhAfBpN1QRF71HfKWwgMbhs4mo/hQR67AwJh9f/gddMtwQDm98CX1WT7OmaBqUj4sknk9dMec9NBnoiVpyAp7oLi8y9ehObnaqkSnKo+OYNNKo+HLzc264tkBYDCB9r8DCxsJ6EQ7eXzgvz8mwdChH/UZa1R8k45AB11wxQzXYXKhjpEu0J9x8yappqMVubFMiNzM46hLEOdvYKTpRVQ2b0mdQiC1kuXIH7c8W6dyzA3gXfASlsXUs9I+9/FL/Z5xa18Z0NsoiWH4fH1fjPID/pV2wWhU77svBhEufoOp0KlAeZxT6Q6x8KhljAqF3sG5uJcU7Unp+ThtPPEBLUFVMFNcGmwB6w5y113yTrlYqHxNWURzkZhJBapqAYhXlv+eel98D9QA4CEw6aqmbTPNhqnJv3dm9E5LKgDGTuFzJVZ2DYBkwAq7KJO47cCgM6O5X9z8OCwN7zg8nf1y9YtQySiACoT1eu7/0yPgmGHksq9kBaPE0nZajVNXmsJBSehcWCBbwC+Busz9Vz6l60f321lzvRcETswe5416+ge5GvwTtVMl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(13003099007)(921020)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E7YwKMhXZV1Rd+lqvIBFIQKcTh0F2LPqRnILz/Yyb+ZSEf5wMUbnTaWrHmc1bREviwlJh3A5jalWH+ph6gkyYhnL0EVEgtQCSv9Bdc+3FhrdyQdXKOuLzQlruT7Um1rh+uLcLSwGtSGWEdVpWRdAC+vPXxSLI75LrErBW/mSU+E510KvNhox3jls47vc8C2mY4LSo6yPXtULAPwAXSzhUDT44n1Q5J+CLbh7TfPAIF70MGlds+tSze+dpXlLn8EJuwnHZm//qSnQXEY1gBEDBLMrREf62LfFbmunv7gfNICc1LTsGTfEdIVyzvtKABYohfj/Z/c0cRP81pHe+xNqhWSEEVz9rgXZ3UtnX1EC070WOUxubuZ5P2O1OKh/8tFcPuKBtaK6EoM4+SU9uGZACODNnDXD1m0y+6/tdqTIGksnb9oFM1GyaE1x+MjBByVt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:33:14.4992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a34a98-5d2d-43cc-962b-08df4af8a846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000042.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917

mprotect() handles the PTEs of a large folio as one batch, and marks the
whole batch dirty with pte_mkdirty() if any of its PTEs is dirty.  On
x86, powerpc, riscv and s390, pte_mkdirty() also sets the soft-dirty
bit, so after clear_refs, mprotect() marks unwritten pages soft-dirty.
With 64K mTHP on x86-64, all 240 unwritten pages of a 1MiB region are
reported soft-dirty; with my fix, none are.

I fix this issue similar to how commit 055267feaecc ("mm/migrate:
preserve exact soft-dirty state") fixed remove_migration_pte() and add
a selftest.
On Zen5, an mprotect() loop over 256MiB is 2-4% slower with 16K to 1M
mTHP and unchanged with 4K pages.  Patch 3 adds a selftest.

I first hit this while stress testing [1] and [2] with LLM-generated
test cases: both build swap or migration entries from
get_and_clear_full_ptes(), and their soft-dirty tests failed on x86.
Looking into it, I found that mprotect() batching, already in mainline,
has the same pattern and reproduces the problem.

Two other places have the same pattern, but I left them out since
over-indicating soft-dirty is sometimes considered fine:

 - get_and_clear_full_ptes(): when reclaim of a lazyfree large folio
   fails because the folio was written to, try_to_unmap_one() restores
   the PTEs from the merged PTE, and all of them become soft-dirty.
 - remove_migration_pmd(): pmd_mkdirty() marks a migrated PMD THP
   soft-dirty.

Are they worth fixing?

[1] https://lore.kernel.org/20261123053543.295467-1-dev.jain@arm.com
[2] https://lore.kernel.org/20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com

---
Shivank Garg (3):
      mm: move the soft-dirty fallbacks up in pgtable.h
      mm: don't let modify_prot_start_ptes() set soft-dirty on clean PTEs
      selftests/mm: soft-dirty: check that mprotect() keeps PTE-mapped THPs clean

 include/linux/pgtable.h                 | 188 ++++++++++++++++----------------
 tools/testing/selftests/mm/soft-dirty.c |  48 +++++++-
 2 files changed, 143 insertions(+), 93 deletions(-)
---
base-commit: 98f6b507621822477db7ec7cef8519de0dd243c4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
change-id: 20261124-b4-mm-soft-dirty-fixes-68c578e1dfbd

Best regards,
--  
Shivank Garg <shivankg@amd.com>

