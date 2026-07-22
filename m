Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D643E3167;
	Wed, 22 Jul 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711563; cv=none; b=m7Q8mHeaHSAGRCisRRsSIz6oQI7eK42EGGh0iMhOF1HI+flAvHkLURMDqL3Lybp0vXMjckaCkVhxHbwh8D5Q2xwJcIIfXkBljkibjaec1W1sI8RtjLTE2KYK942euXq2l2OBVYHCkQop2lXOIQmNT5IOzM4crgxH5P29cWP+ELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711563; c=relaxed/simple;
	bh=MAOIk6RQMMHP9g8q0wW7WPE1XWmO8u6cAL0GlkkzBe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4VYfKrJJ1hoa/HpVeHlskdWtBMe6bGsIO11jfJRfZOC9YfANRFG+W8diYwojQVQjs88GypFLhYEztXozveK00nUax8eMA7xa3XjyKwvfPFuCU/7T7x0a0S7exZa8zsLVj4xax7mC+LoqGWE39sBPNGku/EbVbXf09k6V+ebfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rEfmwAtQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rEfmwAtQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FED11691;
	Wed, 22 Jul 2026 02:12:36 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77C063F86F;
	Wed, 22 Jul 2026 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784711560; bh=MAOIk6RQMMHP9g8q0wW7WPE1XWmO8u6cAL0GlkkzBe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEfmwAtQp5FzBpgznxbXzbVFSASRpkEAKRKrsxYS6t7OaDOvBhG7lXHIMH9aMs83S
	 5q0Ogl46PYCxE4UsX2On99Aa72x+SQlwXDYDlbWwiki1/+Rwonheoe9fNeCyXF0MUA
	 znm6WmOEtVQtpUpIP2CKY8gH9TW6Njp6WSrckMmY=
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
Subject: [PATCH RESEND v1 4/5] selftests/mm: skip page-cache hwpoison tests on NFS
Date: Wed, 22 Jul 2026 10:11:38 +0100
Message-ID: <20260722091219.61504-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722091219.61504-1-usama.anjum@arm.com>
References: <20260722091219.61504-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clean_pagecache and dirty_pagecache cases use shared file-backed
mappings to exercise page-cache memory-failure recovery.  These checks
assume local filesystem writeback and error-reporting semantics.

On NFS, the hard dirty-page case can complete hwpoison injection and
recovery, then report a delayed writeback error when the file is closed.
That failure reflects NFS writeback behavior rather than the page-cache
recovery path targeted by the test.

Extend the existing filesystem prerequisite check to reject NFS and
close the descriptor before skipping.  Other filesystem types retain the
existing injection and recovery checks.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/mm/memory-failure.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 032ed952057c6..2e77f58406868 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -272,6 +272,11 @@ static int get_fs_type(int fd)
 	return ret ? 0 : (int)fs.f_type;
 }
 
+static bool file_backed_test_supported(int fs_type)
+{
+	return fs_type && fs_type != TMPFS_MAGIC && fs_type != NFS_SUPER_MAGIC;
+}
+
 TEST_F(memory_failure, clean_pagecache)
 {
 	int fd;
@@ -283,8 +288,10 @@ TEST_F(memory_failure, clean_pagecache)
 	if (fd < 0)
 		SKIP(return, "failed to open test file.\n");
 	fs_type = get_fs_type(fd);
-	if (!fs_type || fs_type == TMPFS_MAGIC)
+	if (!file_backed_test_supported(fs_type)) {
+		close(fd);
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
+	}
 
 	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
 		    MAP_SHARED, fd, 0);
@@ -325,8 +332,10 @@ TEST_F(memory_failure, dirty_pagecache)
 	if (fd < 0)
 		SKIP(return, "failed to open test file.\n");
 	fs_type = get_fs_type(fd);
-	if (!fs_type || fs_type == TMPFS_MAGIC)
+	if (!file_backed_test_supported(fs_type)) {
+		close(fd);
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
+	}
 
 	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
 		    MAP_SHARED, fd, 0);
-- 
2.47.3

