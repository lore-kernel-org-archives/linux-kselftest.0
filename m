Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FC3EB108;
	Wed, 10 Jun 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087378; cv=none; b=c4BHB2XFPMtyzB+QFTt3hykeWG30H3nbfcBnohpF9/3S+WoMroYKYDFA8BFW+Fd++jDsTnubUPw8+LNrH2mf/kCdHzA0Av3RwO0s26/CK2zeoytGpnS4Fif9W7IEy6td10gs/TXDnttmFfqcaXzvuwhFJzRaWGGoeccJBAREPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087378; c=relaxed/simple;
	bh=YUOf2WDW5txQE8N5WRor6rnu453FeoALhOI8ghFvK80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbHlo0XDJ2a1BUcZIGk37XOD7RzFXPjH3icSgwMH3Aj23WoOb7plIlg9rxLb12VsFenBKVY09EFd9qemNl+29s/1/xMmjcfIhQJXOSWl8olvhYN9EnT2PRNUQ2FjAtg0woPXY5DUDtLcSO86FhVJNPjAotnmh7t5niiDRAg78bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lw+qdbTA; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lw+qdbTA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087374; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=73PkU5SoaImbKfw1j/NfpvTWcYJyb2ykeO+wdSwB/I8=;
	b=lw+qdbTAaWwjS/N08az+Ir1hvzvPy9ohCbGeiJmqD3WeTtOhiNaTusI1Is1ITDqiqMQQORHgZjDh/nX/euLuFAOrJxapZDngYyV8AsPu76L/jciLV4whW5C0ixpP5l6c7lDebRJYQpC4mS93TCKqr8Vin4PkF4wq8aWV8Hd/5kc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R231e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aU07y_1781087372;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aU07y_1781087372 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:32 +0800
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
Subject: [RFC PATCH v2 03/11] mm: khugepaged: add an order check for PMD-sized THP statistics
Date: Wed, 10 Jun 2026 18:29:11 +0800
Message-ID: <6e8cefeb420866a68353fe8decdb4162c877205e.1781083630.git.baolin.wang@linux.alibaba.com>
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

In order to support shmem mTHP collapse in the following patches, add
an PMD-sized THP order check to avoid PMD-sized THP statistics errors.

No functional changes.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4adc8c6de062..0c8dfbd48410 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2595,8 +2595,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 
 	if (is_shmem) {
 		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
-		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
-	} else {
+		if (is_pmd_order(order))
+			lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
+	} else if (is_pmd_order(order)) {
 		lruvec_stat_mod_folio(new_folio, NR_FILE_THPS, HPAGE_PMD_NR);
 	}
 	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, nr_pages);
-- 
2.47.3

