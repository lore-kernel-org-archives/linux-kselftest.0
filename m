Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609253EC80B;
	Mon, 14 Sep 2026 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371078; cv=none; b=kyIR7P4oH8QEc677lGOKGb6RakPamQ8fH7rtd82ST9oW9drVZtcL7Va+5hyU8IcWdN6wwVGKVPDbV59mddk/wg3sj7AxKF8VnkjJkuPB8zOPr7+ALbRLrDsDB2H4tOr/NM9xvxWrp49uasK9+cqFaZLd2uGswk9xhDLAceydnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371078; c=relaxed/simple;
	bh=BeGlU6VoC2nhiSQChEYkjBQ7HxlULOrBNPE3lWJ9ZRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9TI89Zw4uQ94KRp8pKNCF7hVSh2jrAVKHxLra1Z7UCYlC56D/F3elo86kQJpaD+akLgzqgllQsyhnsot43BiaPo+dl5hyfInxV6iHR+4KqVtWT4Ws5PEatCSU8YSaJb1sXjzPsgKDL3wO7fPeFmoW/0mA2TEeppwj43JiqWJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e3Lv730m; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e3Lv730m"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43B81C14;
	Mon, 14 Sep 2026 00:31:11 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BCB93F59E;
	Mon, 14 Sep 2026 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789371075; bh=BeGlU6VoC2nhiSQChEYkjBQ7HxlULOrBNPE3lWJ9ZRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e3Lv730mJzEu/e0Xwxm1fzVM6ZLQ7xGlk7OMGxPIgbgNKgKR83jEZuObZdEcLuQNP
	 Je4dImHlXBcx+Ltsv5q08gwvRbvv84+aB1hJJ70PGMQam9zjbgQPrOdFs8boReoBGO
	 FdnARscTr6MxLUQopNNJDWR4luwOq6U4S5f6XfHM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 14 Sep 2026 08:30:48 +0100
Subject: [PATCH v3 3/3] kselftest: mm: introduce size_to_shift() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fix_hpage_macro-v3-3-c9a305a01d39@arm.com>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
In-Reply-To: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1704; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=BeGlU6VoC2nhiSQChEYkjBQ7HxlULOrBNPE3lWJ9ZRw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqp6KzBl9ctDoG65maPc1EIPIDgHe0gQnqDEXw/
 s+xku9RaRaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqeiswAKCRBt1cPRWsUx
 M9/0C/9PWswjSpx0cGos+ZePQPwtwlTukxcDz008DaWMjW9Pkd3nB3L9u8cQBWHisni2DEI+aMN
 kusuTkSLArK90ltCu5NtTJFZdhtn36RMPnUL4M2Q1OFsGo+ko+flul75cKIGY6pdvJt+soRQpTG
 GgTDMU1jmqpJElRdvszmhchzZb4+KdcqdRkkTRX6cmsxzbza6tiKK/7v88Uh6XihVlWgiqYLvJb
 xTGxWNJ09cRBAFKP6OeTMLSvQXXe0MtfBw34NRIQnQJyaDsWBiIzeFTewlGvqXlQOP9T56atWqR
 /lEKfvTY9G3w2ekHpscWvy7ULp9UesNcGm7LpHAIDASOR3tDhTt7mRxJ/YLBWODIbTjWTiW0SJO
 AjKB7jeq2PVA7id415eseiDmefXz78nXY+2d46buB4Fcd4Q3pClXBHLf/wXX5zi4wkde9NwuObH
 WFjQVU+atoMMulCs/5FNLVeuWbpvKyq3j6yGrv3Hen91EihT4zvce3x442qRLJWiIvPKo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Introduce size_to_shift() for future users that need to
obtain shift of a huge-page which is other than pmd_psize().

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 10 +++++++++-
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index fd1432dc6152..1fef1266429f 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -157,6 +157,14 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
 	return false;
 }
 
+uint64_t size_to_shift(uint64_t size)
+{
+	if (__builtin_popcountll(size) != 1)
+		return 0;
+
+	return ffsl(size) - 1;
+}
+
 uint64_t pmd_psize(void)
 {
 	int fd;
@@ -194,7 +202,7 @@ uint64_t pmd_pshift(void)
 	if (!__pmd_psize)
 		return 0;
 
-	__pmd_pshift = ffsl(__pmd_psize) - 1;
+	__pmd_pshift = size_to_shift(__pmd_psize);
 
 	return __pmd_pshift;
 }
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 71af4804f8f2..0048e0e82770 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -90,6 +90,7 @@ bool pagemap_is_populated(int fd, char *start);
 unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
+uint64_t size_to_shift(uint64_t size);
 uint64_t pmd_psize(void);
 uint64_t pmd_pshift(void);
 unsigned long rss_anon(void);

-- 
2.43.0

