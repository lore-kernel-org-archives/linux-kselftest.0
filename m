Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2110F3E1232;
	Mon, 27 Jul 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145985; cv=none; b=Jxz0xZ33WUS9przADN5W7hrSHwygybFbWoqPsLEksb/kJeP/bjasE1TwDtNDE4jb4I/ID6jFuJN2D6JsmsnSCVRXt50HiJQNnfIVJXVWhliXMyWt30wvQnqSo0xPaaWFR3/zqxZwIswPJBvQB05C1v5DGKFs5FT3utjtwMxIQVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145985; c=relaxed/simple;
	bh=CrJxTUZLpeHCf6pBdIZk3EbePlnhQUeH6RGYCRGqc/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3HFUU4/gFRTR9PSncjbCOMxRuQrzFXeS4CQpBWAeL8tvga7kKy2U7kXuGmdR4KBbsMiy9LR4c8IHpex1PU92xjqmOOQQTHc9EHRIS5i9oSKLhpbTNwuUDR6JBO8MsKAWqZ18XdptiLrMe12gm664x2JljeFb7BvUcrwel6WLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qNR9YuWb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qNR9YuWb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1D98143D;
	Mon, 27 Jul 2026 02:52:50 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80FE03F66F;
	Mon, 27 Jul 2026 02:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785145974; bh=CrJxTUZLpeHCf6pBdIZk3EbePlnhQUeH6RGYCRGqc/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qNR9YuWbJxmMrqAEfagfEbMBUtNmJtMBnJ24m+v4cS4MUu8ztH1DunY/hg/P/J0Cm
	 y+tmKL7S8wBm6LoOKOSGiqhB4eJRYOEjutPbHS/zDdkAFIXaETZ+el8DjG9pc/6xPh
	 nTnHkR7guUjJAQvtVNZ67JNihMWQTtw+Kt5i7DBQ=
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
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 4/5] selftests/mm: skip hard dirty page-cache test on NFS
Date: Mon, 27 Jul 2026 10:52:20 +0100
Message-ID: <20260727095225.372655-5-usama.anjum@arm.com>
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

The hard dirty_pagecache variant uses MADV_HWPOISON to exercise recovery
of a dirty file-backed page. The recovery path records -EIO in the
address_space mapping, which NFS later reports when the test closes the
file. This makes the test fail after the hwpoison checks have completed.

Skip this variant when the test file is on NFS. Keep the hard clean-page
and both soft-offline variants enabled because they use folio removal,
invalidation, or migration rather than recording a delayed writeback
error.

The unsupported-filesystem path in clean_pagecache() also returns
without closing the opened test file. Close the descriptor before
skipping there and in dirty_pagecache().

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v2:
- Explain why the hard dirty-page variant is skipped on NFS.

Changes since v1:
- Limit the NFS skip to the hard dirty-page variant.
---
 tools/testing/selftests/mm/memory-failure.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 032ed952057c6..5d00aab31f9b5 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -283,8 +283,10 @@ TEST_F(memory_failure, clean_pagecache)
 	if (fd < 0)
 		SKIP(return, "failed to open test file.\n");
 	fs_type = get_fs_type(fd);
-	if (!fs_type || fs_type == TMPFS_MAGIC)
+	if (!fs_type || fs_type == TMPFS_MAGIC) {
+		close(fd);
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
+	}
 
 	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
 		    MAP_SHARED, fd, 0);
@@ -325,8 +327,16 @@ TEST_F(memory_failure, dirty_pagecache)
 	if (fd < 0)
 		SKIP(return, "failed to open test file.\n");
 	fs_type = get_fs_type(fd);
-	if (!fs_type || fs_type == TMPFS_MAGIC)
+	/*
+	 * MADV_HARD poisoning of dirty page-cache data records an expected
+	 * -EIO in the file mapping. NFS reports this error on close(), so
+	 * skip this variant.
+	 */
+	if (!fs_type || fs_type == TMPFS_MAGIC ||
+	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {
+		close(fd);
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
+	}
 
 	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
 		    MAP_SHARED, fd, 0);
-- 
2.47.3

