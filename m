Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E443F8231;
	Wed, 10 Jun 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087387; cv=none; b=Jm9qCQ3yNprp3wgcOpYoNC6RY5LREyd0EwCSdHZ4aFbHa7vw3i7qawcUMH/nhboqF5Ru8eoFlHSG0UUbU05nvifAVxCWpvFMVjBZzJUfhMtQVzC/K/1Im2xM5YxvCDDRX/uwxF1YwOmj/gcv6Ujk3DUb9bd3gfctsljZsbS/dLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087387; c=relaxed/simple;
	bh=uLnkTESqiZWGT6qRX+3wN16OC/Z7r23GhC78WtGJcnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5oay4y1QYWiIeD8LZm3ahibEHuIDvkidJ4WoM1swTiDcqPRfFA37h/7WBXwO4JMTTz0d8ONptnGSkLLxDhbVwxZc6T3tNEtIcC5bqbMv5mTws4Xdk9PJUvzof8f73UDGVqxipQvcVea9Cz0P9vGy8RI0yEY5HOQRQRg3uXka04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZG9TAZzY; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZG9TAZzY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087375; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WBnURwRT3PtluzIttkapBTzpEpviWA0up/dk/97TMVA=;
	b=ZG9TAZzYXCid/tgbR/iAL/dGLhZGLNXPaIfJ0S/EhvNDRpxjhf5HRePiFqg0qsLSSKDdhUH8dEAIWiK/MAxT6d+dGwcTFTdJH9jTwEJmQxr7+pJKfSk/d21uE7z4DKSSyqW+VWbjj0DVYL4fo2FTRAh5nArME9rzNKsB7DfKTpE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aI8Wb_1781087373;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aI8Wb_1781087373 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:33 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com
Cc: willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 05/11] mm: shmem: run khugepaged for all shmem mTHP orders
Date: Wed, 10 Jun 2026 18:29:13 +0800
Message-ID: <593cc1b1a876dc0f89bb7e3585db7001b44c0061.1781083630.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When only non-PMD-sized mTHP is enabled (such as only 64K mTHP enabled),
we should also allow kicking khugepaged to attempt scanning and collapsing
64K shmem mTHP. Modify shmem_hpage_pmd_enabled() to support shmem mTHP
collapse, and while we are at it, rename it to make the function name
more clear.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/shmem_fs.h |  4 ++--
 mm/khugepaged.c          |  2 +-
 mm/shmem.c               | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index acb8dd961b45..1ec358b40c9b 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -131,7 +131,7 @@ int shmem_unuse(unsigned int type);
 unsigned long shmem_allowable_huge_orders(struct inode *inode,
 				struct vm_area_struct *vma, pgoff_t index,
 				loff_t write_end, bool shmem_huge_force);
-bool shmem_hpage_pmd_enabled(void);
+bool shmem_hpage_enabled(void);
 #else
 static inline unsigned long shmem_allowable_huge_orders(struct inode *inode,
 				struct vm_area_struct *vma, pgoff_t index,
@@ -140,7 +140,7 @@ static inline unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	return 0;
 }
 
-static inline bool shmem_hpage_pmd_enabled(void)
+static inline bool shmem_hpage_enabled(void)
 {
 	return false;
 }
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 818d51915748..75b18ec4a6c3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -532,7 +532,7 @@ static bool hugepage_enabled(void)
 		return true;
 	if (anon_hpage_enabled())
 		return true;
-	if (shmem_hpage_pmd_enabled())
+	if (shmem_hpage_enabled())
 		return true;
 	return false;
 }
diff --git a/mm/shmem.c b/mm/shmem.c
index 56c23a7b15c7..a8d30a123b1f 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1792,17 +1792,17 @@ static struct folio *shmem_swapin_cluster(swp_entry_t swap, gfp_t gfp,
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-bool shmem_hpage_pmd_enabled(void)
+bool shmem_hpage_enabled(void)
 {
 	if (shmem_huge == SHMEM_HUGE_DENY)
 		return false;
-	if (test_bit(HPAGE_PMD_ORDER, &huge_shmem_orders_always))
+	if (READ_ONCE(huge_shmem_orders_always))
 		return true;
-	if (test_bit(HPAGE_PMD_ORDER, &huge_shmem_orders_madvise))
+	if (READ_ONCE(huge_shmem_orders_madvise))
 		return true;
-	if (test_bit(HPAGE_PMD_ORDER, &huge_shmem_orders_within_size))
+	if (READ_ONCE(huge_shmem_orders_within_size))
 		return true;
-	if (test_bit(HPAGE_PMD_ORDER, &huge_shmem_orders_inherit) &&
+	if (READ_ONCE(huge_shmem_orders_inherit) &&
 	    shmem_huge != SHMEM_HUGE_NEVER)
 		return true;
 
-- 
2.47.3

