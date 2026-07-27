Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F453DE452;
	Mon, 27 Jul 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145976; cv=none; b=KUc9ZBACqMYK1+dcxt48QdGJfdqfWb8JXJtYbG+rOdkCYGZU+jPmeNbmPwkaIMAHXN8x5wjADoYtIQS8cP1xMF1jiijtD795dH/ON8CtuZZJ+QzFOTV+H/VeYi9XID2Uvuon+eU4EobJW7r5mgS1mSSmFbm2+ZdaybMYhr0PBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145976; c=relaxed/simple;
	bh=5jwfmfxf7oRAwU0+Iu55SZwsCJdmgyHH7m7BYSAM9vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTHYurYgdvyNQ64x5yNIpP5R5qRsVEebXqKGIJNKwi4FHZG0yZXo77TB9WK9YF6nE7ofjzMN1HyetzHorAqWDtguBCEM/RbxZBJwJ3P96INjd5VkHn614MIHPQQBkoWL7TsIz6htLSY8MuZ8dkKGdV7p061mUrxq4tSFZBu+hzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ocvFyGsL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ocvFyGsL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5566914BF;
	Mon, 27 Jul 2026 02:52:43 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA8363F66F;
	Mon, 27 Jul 2026 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785145967; bh=5jwfmfxf7oRAwU0+Iu55SZwsCJdmgyHH7m7BYSAM9vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocvFyGsL/iYFJZW86XCVW5NmMRSO3LjImkEsyF0c/20YRcroF9OFB3xoBvjxWcvA6
	 m7EArpjMqQDQWw5x+DhjJxkNqIReUHRWQ0v01pNQHE6lD73l4Fdi1JZr8pYi0+w0r/
	 2COkDVdtZsgOXk+SsC3nUDO4eYUfL2MG/WPh0g0Y=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 2/5] selftests/mm: skip guard hole-punch test if MADV_REMOVE is unsupported
Date: Mon, 27 Jul 2026 10:52:18 +0100
Message-ID: <20260727095225.372655-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727095225.372655-1-usama.anjum@arm.com>
References: <20260727095225.372655-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hole_punch case verifies that guard regions survive MADV_REMOVE and
that the backing range is punched out.  MADV_REMOVE delegates the hole
punch to the backing filesystem, which may reject the operation with
EOPNOTSUPP.

That result means the test cannot establish the state whose guard
semantics it intends to validate.  Treating the missing filesystem
capability as a guard-region failure creates a false regression.

Unmap the range and skip only when MADV_REMOVE fails with EOPNOTSUPP.
Preserve the assertion for all other errors so failures on supported
configurations remain visible.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/mm/guard-regions.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index b21df3040b1c7..5c8ec3ca75d7d 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -1912,7 +1912,7 @@ TEST_F(guard_regions, hole_punch)
 {
 	const unsigned long page_size = self->page_size;
 	char *ptr;
-	int i;
+	int i, ret;
 
 	if (variant->backing == ANON_BACKED)
 		SKIP(return, "Truncation test specific to file-backed");
@@ -1944,8 +1944,12 @@ TEST_F(guard_regions, hole_punch)
 	}
 
 	/* Now hole punch the guarded region. */
-	ASSERT_EQ(madvise(&ptr[3 * page_size], 4 * page_size,
-			  MADV_REMOVE), 0);
+	ret = madvise(&ptr[3 * page_size], 4 * page_size, MADV_REMOVE);
+	if (ret == -1 && errno == EOPNOTSUPP) {
+		ASSERT_EQ(munmap(ptr, 10 * page_size), 0);
+		SKIP(return, "MADV_REMOVE not supported by filesystem");
+	}
+	ASSERT_EQ(ret, 0);
 
 	/* Ensure guard regions remain. */
 	for (i = 0; i < 10; i++) {
-- 
2.47.3

