Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35C1476CD3;
	Fri, 11 Sep 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130141; cv=none; b=PX/HZIF3QHZRO2IrqhsYew7U7bdxvfIGm5ejOCN5qEzy6MCjUyW+mLYfn1ZvWX3pf3fRJJHM/kQzlwF5tNDgjZIgRGVv6oG/dWr8NbTho2vXJhRfL4dfU7tN2cWJudPyMqBNmdb9l9JC5C6RlHcbSY7+ivzdjf88NcnmzaHeoFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130141; c=relaxed/simple;
	bh=zcwDMu7iEB7zmUgykeg/3B8CWbzREswfdkg2PObf10g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rM8Bp5txN9VI5tCrhvGeev4EPPsl2jzIH16J19cFpV1HfrYv5JnxvfS1GtW9OBKuyHtRZtFe0+SeZQC6zW1eRkD3ZcYU8+JR1Jp09PXNzYnDJa2TxVI644GwmX068KnYA1kIhtdJNueAVrWxH+4wdnYnTuQrm7XOruXHIC2Z/l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=i5EU4fj/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="i5EU4fj/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 158531655;
	Fri, 11 Sep 2026 05:35:34 -0700 (PDT)
Received: from e129823.cambridge.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0395F3F7B4;
	Fri, 11 Sep 2026 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789130137; bh=zcwDMu7iEB7zmUgykeg/3B8CWbzREswfdkg2PObf10g=;
	h=From:To:Cc:Subject:Date:From;
	b=i5EU4fj/ZFSEsCwvxg14J6Cjd4C8Hotg4VBg++yf7LYJDIi8EpfGsregp7sb3c69d
	 j3k7MTqVj2GZtpHe9avSZa+FBxgyUm/pmWhD5MGWGQfDkOtolITzYZQoLCYXdFBmCU
	 BuO+kEgSXC9oBDjE/OSTgMnatQiDcMaXpKSrrtQ0=
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
Subject: [PATCH] kselftest: mm: fix potential failure for merged VMA in guard-regions
Date: Fri, 11 Sep 2026 13:35:34 +0100
Message-ID: <20260911123534.1181501-1-yeoreum.yun@arm.com>
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
 tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index 5c8ec3ca75d7..a28a57d34e97 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
 	char *ptr, *ptr2;
 	int i;
 
-	/* Map a region. */
-	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
+	/* Try to Map a region. */
+	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);
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

