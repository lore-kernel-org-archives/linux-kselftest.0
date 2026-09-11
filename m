Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3BF3546C3;
	Fri, 11 Sep 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136960; cv=none; b=KVtG8ze6GpUsDy2ZaykETmTBOZ23pP7SrfWr3oaUork9v+UkDeISlKArn7YhqXalaB3p7TgH/bLcuc9TynLtLSMINyrO15mDOUATVdPQcLAtnPTudZSh4z6G+LbiIA+sQNdqeAVL/vqQ+V/UQvwRc4u9uLk2UMXIeV9w9CF261k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136960; c=relaxed/simple;
	bh=goER+PRl5M+XinmIsN11F1totcROkCZg1t/jSNDQghw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWaHZ6RLTb9BM7i++itux0tpc/tSTM2V0o1GqbrWatzdi25hVgfGpP96XdImjzlFXYfbFwgG7vUJqQBYxEO4Nx9nCaeRzcf1a6oBmwo3jG6on+GuXRfdp/poOtcSVNJpcx0YbxOmZ67nCfdJ/3viwAc2z9naDIj4eKeg+9pcUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=t/n5yxpg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="t/n5yxpg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C58D16A3;
	Fri, 11 Sep 2026 07:29:14 -0700 (PDT)
Received: from e129823.cambridge.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B7053F7B4;
	Fri, 11 Sep 2026 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789136957; bh=goER+PRl5M+XinmIsN11F1totcROkCZg1t/jSNDQghw=;
	h=From:To:Cc:Subject:Date:From;
	b=t/n5yxpgwto6maQgmjHoXtiUDq97KYpJQIXFDb8jbIbnrKsYcMTk1zMlRHBG83OUF
	 AJteqyURsi6A95plKNueo9cdJgI6G4l8djo8i9LZwUXPCyOK7pMq/uB/dB2N4s/V7r
	 0kUqjFNQDXNUnCZ82p5tFWf3s+S65/KomICdbG9Y=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2] kselftest: mm: fix potential failure for merged VMA in guard-regions
Date: Fri, 11 Sep 2026 15:29:03 +0100
Message-ID: <20260911142904.1825452-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
but this can fail if the mapping is merged with an adjacent VMA.

To avoid this potential failure, first allocate a temporary region with
extra pages at both ends, unmap it, and then map the test region within
the temporary address range, leaving an unmapped page on each side to
prevent VMA merging.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
Change in v2:
  - change the prot as PROT_NONE for placeholder region.
  - add comment for clarification.
  - Link to v1: https://lore.kernel.org/all/20260911123534.1181501-1-yeoreum.yun@arm.com/
---
 tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index 5c8ec3ca75d7..b724d62d2b75 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
 	char *ptr, *ptr2;
 	int i;
 
-	/* Map a region. */
-	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
+	/* Map then unmap placeholder to avoid adjacent merges */
+	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_NONE, 0, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ASSERT_EQ(munmap(ptr, 12 * page_size), 0);
+
+	/*
+	 * Map a region for the test. Since the preceding temporary mapping
+	 * succeeded, this mapping should also succeed without merging with
+	 * adjacent VMAs.
+	 */
+	ptr = mmap_(self, variant, ptr + page_size, 10 * page_size,
+		    PROT_READ | PROT_WRITE, MAP_FIXED, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/* We shouldn't yet see a guard flag. */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

