Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0EF3EDE6D;
	Wed, 10 Jun 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087382; cv=none; b=CT5Ym8ct8pC2ebXXe6wZPqg99KrvxY8z8UHN5D594t+1p9Gff7jnXO8wqGHkbnR2asTcPvhnOL4ahe+f048BhsheI7K2x+lLMLDou3yqoKSAhmVkQWgtyWHuNJ0CjxwCHIGoLcTquMvxy4yP+kn+lWJLHEIk511XsTH5LxLLIds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087382; c=relaxed/simple;
	bh=4O34GxUhg4ul80pVP2sLoUDvNkEf/2B9K3nPbckIkDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urFgmgrkGx3MrAiYeTw66WwdoTdgqfm5FtAmpAzSg06gDSrK6DSzM+uogHlGAC5A/lYJLCrJq5EPFU1DzCDFLlTtcYisr22L+bq65Zig+1qS+9dCmrpNsEnW1LFeYXoaUUrmU1J8JN9b3wldj4zUlydIy0cujiPo6X4I6xD629k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nsHtLaKp; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nsHtLaKp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087372; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=GT0MH/saso5XoNvBa9r1fqryd7oF1xj+K/jBExVfL50=;
	b=nsHtLaKpPmZN3gB96dCvPqj1xePqNPvDTXWzsteirsvEwb919JNZfHF/kOddOOVZ+tqi0uH+7wNQFyzU9cjDVr4pgFCjr/DWt4qzkEDZXe3UqfN7Yhb7g3eN8cKA76g4Kvrhe4dbt4BsWJBlLBjH8cTLptcqZXA+zbQug9nwcXo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aHmg1_1781087370;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aHmg1_1781087370 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:30 +0800
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
Subject: [RFC PATCH v2 01/11] mm: khugepaged: add max_ptes_none check in collapse_file()
Date: Wed, 10 Jun 2026 18:29:09 +0800
Message-ID: <2ae023e4c9f5270482c99f244af5d3a40fc49165.1781083630.git.baolin.wang@linux.alibaba.com>
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

Similar to the anonymous folios collapse, we should also check the
'max_ptes_none' when trying to collapse shmem/file folios, which is
also intended as preparation for shmem mTHP collapse in the
following patches.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b12187709f6d..631459172e19 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2234,6 +2234,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		struct file *file, pgoff_t start, struct collapse_control *cc)
 {
+	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
 	struct address_space *mapping = file->f_mapping;
 	struct page *dst;
 	struct folio *folio, *tmp, *new_folio;
@@ -2299,7 +2300,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 						goto xa_locked;
 					}
 				}
-				nr_none++;
+
+				if (++nr_none > max_ptes_none) {
+					result = SCAN_EXCEED_NONE_PTE;
+					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
+					goto xa_locked;
+				}
+
 				index++;
 				continue;
 			}
-- 
2.47.3

