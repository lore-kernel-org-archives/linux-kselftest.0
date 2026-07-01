Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E81A37DAAA;
	Wed,  1 Jul 2026 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936581; cv=none; b=BQuasQjBwclU8bc11TNx1BEmOgm71/2QK4EuQQyu6PJrr54voYyuCImchO+ia9SnXWoQ5f2nFUigv2G5OFqp0ogh9ogkT4+tXX8rVfPA5KWuPz7W+ZE+ZDoMe6n+moNGCY7G4ZZenxVxZfpN4RwUQ83EAGO1TGmeulW58zblvcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936581; c=relaxed/simple;
	bh=b8yHUUqkzlIXIOKJeOyubq8L2y3biOHEfHZccZ6kLrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RP/Ud5OuEG3iTRYQA2GuRu35e9uylxz4JfHBXRfiph2TcNXjs+9AHFUN+x5ZSvnGYgUTycmvsOXrVLZB67qD0b02olg9cwocuO90a2CpJsgx+znc/ovGnJOkg+/R5qoV5zidySGcO0qUV74X/NRd7ArmRuvuMWBnXu6x9oeYECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVirDeQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVirDeQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BA61F000E9;
	Wed,  1 Jul 2026 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936580;
	bh=TvSshaYaWYRW+SwJgWNvjOVVLpEc9oved1ALiTQdTMw=;
	h=From:To:Cc:Subject:Date;
	b=MVirDeQgrcjlbfDK31r0JZVT2Dkp7SWeLKDKQIjMiAly2fpFlgE+EhftWoFTXTD/V
	 U7NUpXE6vpnSS7Fuy4KBkbKSAvltT7ycb8IJ26tB2JyWfMgQOkv03mM1aMKB5OsZ65
	 3C2+eQky+ExdKOCcSND26uQWubiHtBFQRQ1wgra01Cvlt6ttbdKBBWNeI/+eogC2Cr
	 rVwoWqmmfyn4eqGBIFqgJjozyp/2xqE5G7vwBelFt1LUFEcE6g9yrduZ0r6ySO7rWD
	 xxzPqI2gK9fgN+aq7ovW4pObd8CgMmqrLfTtvPYYvgY7xoXLpazrRpo8M+jDC0IGiw
	 uuQS5MEIMDHDQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RESEND] selftests/mm/uffd: don't treat UFFDIO_COPY -ENOENT as a failure
Date: Wed,  1 Jul 2026 23:09:32 +0300
Message-ID: <20260701200932.1470525-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Non-cooperarive uffd events are inherently racy and can happen in
parallel with other userfaultfd operations.

During event tests in uffd-unit-tests, the uffd monitor calls
UFFDIO_UNREGISTER upon receiving UFFD_EVENT_REMOVE.

In parallel, the faulting_process() verifies that the removed memory is
actually zeroed.

If a verification read wins the race with UFFDIO_UNREGISTER, it causes a
missing fault that uffd monitor would receive after UFFDIO_UNREGISTER is
complete. The monitor resolves the fault using UFFDIO_COPY that fails
with -ENOENT which means that VMA has been changed (see commit
27d02568f529 ("userfaultfd: mcopy_atomic: return -ENOENT when no
compatible VMA found")).

Treat -ENOENT returned by UFFDIO_COPY as non-fatal, the same way
-EEXIST is treated for concurrent faults, and don't fail the test.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
I've noticed transient faults of uffd-unit-tests in the CI runs [1]
and found this issue with uffd-unit-tests.

The issue is longstanding and it's not related to or exposed by the
recent uffd refactoring.

I didn't even look for a Fixes: commit, as this is a selftest only and I
don't see a reason to backport it.

[1] https://github.com/linux-mm/linux-mm/actions

 tools/testing/selftests/mm/uffd-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index edd02328f77b..f48f5d4594ab 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -639,8 +639,13 @@ int __copy_page(uffd_global_test_opts_t *gopts, unsigned long offset, bool retry
 		uffdio_copy.mode = 0;
 	uffdio_copy.copy = 0;
 	if (ioctl(gopts->uffd, UFFDIO_COPY, &uffdio_copy)) {
-		/* real retval in ufdio_copy.copy */
-		if (uffdio_copy.copy != -EEXIST)
+		/*
+		 * real retval in uffdio_copy.copy
+		 *
+		 * -EEXIST: the page was faulted in concurrently
+		 * -ENOENT: the destination range was concurrently removed
+		 */
+		if (uffdio_copy.copy != -EEXIST && uffdio_copy.copy != -ENOENT)
 			err("UFFDIO_COPY error: %"PRId64,
 			    (int64_t)uffdio_copy.copy);
 		wake_range(gopts->uffd, uffdio_copy.dst, gopts->page_size);

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.53.0

