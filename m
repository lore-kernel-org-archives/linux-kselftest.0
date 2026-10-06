Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E038238D
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 06:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268888; cv=none; b=WSRcA49M6N9fpQxauKLrOWW55FZhIqx7niqHBcTNVXBibkj8CdqWEjdWqHaQMji4XE7p0rr3xHluaKQoiHlUJUAGMpXWF3sPVJlCT1+bJFrLvn+Jz6T8AW+T8PqXYaXl4ZdVaiGZKcKls1xEjawpcw9IehX58tH0gDtj0I+ttCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268888; c=relaxed/simple;
	bh=kXJchUOuRX8vFWegEnemITVpoyLAy9bJtsH4nZFahTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZwyaEOh2l6d/Cbq21ZCO+WrQSPo87Tt6bh/9/mH+CWzCANnLR8brna0ok8B4YzStWS/IOaeO09J9KVMvdnfM11twWApZAwtTlfIM62sfwHCFqhlulhwIlBNBW0LjcAViQHVh8/f+/KnjEOV0PBzEvQ89A6Oth2wFDesjbxeseM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKw2Sd7h; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKw2Sd7h"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2216752f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268885; x=1791873685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvuUL0ruNpfCRzWzTraH9ZiEVbkwKooQDWiuyseC2V4=;
        b=RKw2Sd7hHPnsOUs+LYZv2w37pkJFkpv1xbYPoyhMUl65c/Q13wptAAB/WXnk15qve2
         zqqlzxDcMExJCeFvI15UWei1AhLN2qHytErl9bN+/Mv1c4dW4jxeJcrTPwMQGUBw9gSk
         ek7uX1ChjJ2uTSPd6ojNWJcvSBKagCwSq0zg0t9wVzaT31N5RX2sUWsbZ+6xOZcSMdu1
         lmPRvVdc1lmmTXfV/9QuZoFPI0CwAjq4lsof0ngN9XtWpBDLHQp9syHZDV52jTTurWwR
         pkoFHEx4Wz+f++8Z574DEVeNTorAuGcXrKc+o4h4E39lcKfAYTmLt0sAiMPMplt5Yymf
         q4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268885; x=1791873685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvuUL0ruNpfCRzWzTraH9ZiEVbkwKooQDWiuyseC2V4=;
        b=jmV08pL/1KdTYb7KO4qzLEqHjt7Vc7kuE9oQ+Bnjf3qYQ9+tjtSw/jDxxoporQj/ei
         b2SRomn2e2SuHZUj05zKuIqAIyIfjKvBxLWN7B1pushPzivutNnMTCTYofvMJzHWwnsz
         wXw5kBdY/87mcaM0gjq0fnlZSdd9nlUSzq/PED+7xyiROjatBuytMs9iL4YrdsZWJBkl
         INB41cmZQzU3EAAGEt09/2dO9SQOUVKL/Mty0TZmAMwXK4mvHaecmcJjT30hjggShbJC
         ewW6CdI/cy730W+RkqotiPH3lX1rvweGR2Yz2EfxH8xqZ8Q3aWmTS5ItqZgxlDhwUPHL
         f8+A==
X-Forwarded-Encrypted: i=1; AKwUvBwMt+jvtI/gc06HjsS6EStySqwEKK8KWI1PRMXrSB+ITwxHLYAYGoTf4wNuiQbTvOC1WviaqrKUITtr+/0O88E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm+2anV34SHUsX1Fmp6z/cDIGe09D3S8oSzd3CZPCGEBT+Px/X
	BJoQJQtnQuaT0Ytur+GHAMLdKLCNG0Gzp4IthRnVjKxA760/bNnmBFXH
X-Gm-Gg: AYBFou0P/bPfBAuJoLPWYeBgUPmxVLEWZqzA/X+RHrNP3TrbcdUCXTZcpWRVpOtfz53
	0TU0BjFvOo0lFO0bw5x3vs/7yst5/uhTfKFwI2NzpBO8rLImd/nHcE08wblVwusGLBoeM+puBcd
	je0f/TnlaB6oVzmKpLLVNGkss2nXdrMH9il0ijm6OJIH1/cAQcu7a/1LBvEoXrJu8y4bz43ZMhg
	g2xwc5CpNOwY4NXFcqa7MclnqdZiVssZcFDnZ+OZXzaUnPmXtykraGfZlQhCxSzM80QcbYfWH5O
	/SMS97A8EfQW17Ah8wunj+tG7tGBUapcHl9Pe5Nz8+KtqMb5UYr8FKogu3kY6tZ4ceTsbxM6+BA
	NId0FO7VDkP/0UvX+qNKqJzK84XZymRZHH4ssnFXjwGLV+tG0Wr2+BEmwkDgNdjwOg75s92fDwg
	5EHPkhiQ7haN3mDcqqQLp+jbbBbXY3ac4a6K1wH+XhpnMfrQTCksS8Ry8=
X-Received: by 2002:a05:6000:4911:b0:48c:4272:86b2 with SMTP id ffacd0b85a97d-48c47fc924emr14855342f8f.11.1791268884519;
        Mon, 05 Oct 2026 23:41:24 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6726238fsm4847856f8f.16.2026.10.05.23.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:41:23 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/mm: check MREMAP_DONTUNMAP mlock accounting
Date: Tue,  6 Oct 2026 08:39:01 +0200
Message-ID: <20261006064120.6796-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MREMAP_DONTUNMAP keeps the source VMA in place, but clears its mlock flags
while setting them on the destination VMA.  The "mm/mremap: fix two issues
with MREMAP_DONTUNMAP" series fixed two cases where this leaked
mm->locked_vm:

 - an unfaulted mlock-on-fault VMA moved behind itself self-merges, so the
   single resulting VMA loses the flags without the accounting being
   dropped;

 - a partial mremap() moves only part of the range, leaving the pages which
   are not moved accounted as locked in a VMA whose flags were cleared.

Add a test which mlock2()s a source mapping, moves all or part of it with
MREMAP_DONTUNMAP, unmaps everything and checks that VmLck is back to its
value from before, and run it for the self-merge case and for a partial
move with and without MLOCK_ONFAULT.

Verified on x86_64: the three cases fail on mm-unstable with the two fixes
reverted and pass with them applied.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2:
 - Reduce the churn (David): fold the three cases into one parameterised
   test and drop the child process per case, comparing VmLck against its
   value before each case instead.
 - Use the file's BUG_ON() for setup failures and vm_util's
   check_for_pattern() to read VmLck, call mlock2() directly.
 - Verify against mm-unstable with the two fixes reverted rather than an
   older -rc, now that the series is applied.

 tools/testing/selftests/mm/mremap_dontunmap.c | 63 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 96ba537facf7..5ca33d9d42af 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -7,6 +7,7 @@
  */
 #define _GNU_SOURCE
 #include <sys/mman.h>
+#include <sys/syscall.h>
 #include <linux/mman.h>
 #include <errno.h>
 #include <stdio.h>
@@ -15,6 +16,7 @@
 #include <unistd.h>

 #include "kselftest.h"
+#include "vm_util.h"

 unsigned long page_size;
 char *page_buffer;
@@ -335,6 +337,62 @@ static void mremap_dontunmap_partial_mapping_overwrite(void)
 	ksft_test_result_pass("%s\n", __func__);
 }

+/* VmLck from /proc/self/status, which is mm->locked_vm in kB. */
+static unsigned long locked_vm_kb(void)
+{
+	unsigned long kb;
+	char buf[256];
+	FILE *fp;
+
+	fp = fopen("/proc/self/status", "r");
+	BUG_ON(!fp, "unable to open /proc/self/status");
+	BUG_ON(!check_for_pattern(fp, "VmLck:", buf, sizeof(buf)) ||
+	       sscanf(buf, "VmLck: %lu kB", &kb) != 1, "unable to read VmLck");
+	fclose(fp);
+
+	return kb;
+}
+
+/*
+ * MREMAP_DONTUNMAP clears the mlock flags of the source VMA and sets them on
+ * the destination, and mm->locked_vm has to follow.  mlock2() a source of
+ * num_pages and move its first move_pages to gap pages past its end:
+ *
+ *  |------ source ------|... gap ...|-- dest --|
+ *
+ * then unmap everything and check that VmLck is back where it started.  With
+ * no gap the destination is adjacent to the source and could merge with it,
+ * otherwise the gap is left PROT_NONE so that it cannot.
+ */
+static void mremap_dontunmap_mlock(const char *desc, unsigned long num_pages,
+				   unsigned long move_pages, unsigned long gap,
+				   int mlock_flags)
+{
+	unsigned long size = (num_pages + gap + move_pages) * page_size;
+	unsigned long locked = locked_vm_kb();
+	void *source, *dest;
+
+	source = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	BUG_ON(source == MAP_FAILED, "mmap");
+	BUG_ON(mprotect(source, num_pages * page_size,
+			PROT_READ | PROT_WRITE) == -1, "mprotect");
+	dest = source + (num_pages + gap) * page_size;
+
+	if (syscall(__NR_mlock2, source, num_pages * page_size, mlock_flags)) {
+		ksft_test_result_skip("%s: %s: mlock2: %s\n", __func__, desc,
+				      strerror(errno));
+		BUG_ON(munmap(source, size) == -1, "unable to unmap mappings");
+		return;
+	}
+
+	BUG_ON(mremap(source, move_pages * page_size, move_pages * page_size,
+		      MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED,
+		      dest) != dest, "mremap");
+
+	BUG_ON(munmap(source, size) == -1, "unable to unmap mappings");
+	ksft_test_result(locked_vm_kb() == locked, "%s: %s\n", __func__, desc);
+}
+
 int main(void)
 {
 	ksft_print_header();
@@ -348,7 +406,7 @@ int main(void)
 		ksft_finished();
 	}

-	ksft_set_plan(5);
+	ksft_set_plan(8);

 	// Keep a page sized buffer around for when we need it.
 	page_buffer =
@@ -361,6 +419,9 @@ int main(void)
 	mremap_dontunmap_simple_fixed();
 	mremap_dontunmap_partial_mapping();
 	mremap_dontunmap_partial_mapping_overwrite();
+	mremap_dontunmap_mlock("onfault self-merge", 1, 1, 0, MLOCK_ONFAULT);
+	mremap_dontunmap_mlock("partial", 3, 2, 1, 0);
+	mremap_dontunmap_mlock("onfault partial", 3, 2, 1, MLOCK_ONFAULT);

 	BUG_ON(munmap(page_buffer, page_size) == -1,
 	       "unable to unmap page buffer");
--
2.55.0

