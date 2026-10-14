Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F184568FB3
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000692; cv=none; b=ZTBDrXh2yMnxSOgUb64JFD2EB6eU9y0BieauQ/+6/EJM0c5Zq7b5K4IcB+57vxx3wWJhlOA0EHYqrtqzMTIqLV4cIexh7S4Ngngfht1iQ8Z1WuFN1Mw5HMIDJzKGhgqefYp3AuUitOxoodIyvNYdbuWCB2CbwLJL4VSywd+27YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000692; c=relaxed/simple;
	bh=lEJMXUtCVhoeWq4U2V/23VXfvisqCuhdbkr6UhYUggA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/PTDbvg1uC7drvYGJ9jIePFlvcSWoFBlwWZUiwTTABExNwHnnWuMsDob32GX28Wzi264QZtSV0yKj61hOHHM7Tdi2c0M9vh5sBR4iUs5jnpEMDmuHJMp3l7+PSSxoDmrtIVl8kiTebtA4F+nyn/whkav7H3C6u1S4xhCLuUzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fhdxLlXY; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fhdxLlXY"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93ead211f14so118517485a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000689; x=1792605489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj29K3kJ1Vz8u8FKLKjpbxQZ7NU1kf2WCV2QOxB9gM8=;
        b=fhdxLlXYA4YiDAFxJSgdmt0lk/EIlRFJNaYNr/Q7G1N6zm/UnhKW2Z+daMVlkjb4AO
         aI4J49HD/jY8L4A1PSAWn+frjiNkqP/1X0KNmzT0TViRK30AzxMfe+zcO/dAdJ9EdWQg
         kcL/pKt8bPvZgDkEqItDsti3RvG11jV+kHU4csrZoVkQoZWk5LRJl6Vd3iifXdQBpT4D
         OBoX4aYsnSWL3KVhMLo97c8p6n3EhbkF8KhpQzZ0WQ/aAXwMBqpvBd7jvfjLguUBtEKN
         NKpIIDHKAiVP9Tu6hfFRijsVyOwRQVAgEZBV8TE6tLU4Z5XhHkd9jSTT/QOXuNFmiyGK
         XlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000689; x=1792605489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj29K3kJ1Vz8u8FKLKjpbxQZ7NU1kf2WCV2QOxB9gM8=;
        b=aQttDDc7+D9wj9NExQyB3Y4zwGna5uEEqoCkZlDFUotRRrUhz0hJFbF/jIudGHBAtK
         yxH2wbcYZQsxkG994I4skE7805FvhztkHxwfKpIChiiqHx2T83GH0YEL5ft25T2BCleA
         86ly8tloxlVvP0HoaReR/OplYgg78ZDDC/N1CWD0Y4a10gXjGml3z1O9Zh4mEUK236KR
         +1PkzHyA2YIjAlnTZ8Dpym+lZiK+0/BPFxkBPLsUK/gXj28ZuaeAYTF2aInqZ0KQh+V8
         0V8tmmNxBsS90lZFYYT4pwv7+BpNBufOf472eTvZlpzVF3SGeke/gcVj+yGOk9ZpA+om
         EJRg==
X-Gm-Message-State: AFq9FYI0sOCZABRr+03c/5ZuCaYWpSziFePTjeKQ0rZGNznV0AfIy+YJ
	tG1LoGsI2EzYoOSiMHZKAVrBzDgBnBZ4mImY4uk1+LvyPxtugTPlv7GfTwfKdKfGJGBHFJR3VlX
	FKBvNB2M=
X-Gm-Gg: AYBFou3vJl1cdH3bDUXb+06NwZnJRfZmNJyKx7Ts2OBwlIUXczkr6O4pTL/xnjhFwQ4
	rRZ1zq9UUo5hDvmsGQYD+TAd81pNXbQPykm8ivU5OZpMxdrlXW4tImrBoxOOU/oarn8CawaizIQ
	EH+w5QUc9gvg2WFcht12dXAldR4oX8813hAKsjg1MbAtAP9wVuwEuUSXudyAB1Yn9xpvKy/ZP+d
	vi/sGAi85Ut9EzkTs7ETw8xvob+LXaJ++Qkqr6UAPaX/RfVWRuqvryRXvA6Cxi4LImjgopDn5rK
	+YGqw5qo6/R6JF+iUGB8JSexrp11eLKZvB3oZcZeud09I2P4zIciEEflBmBYwdvHkZPvIJJbTIu
	2xdaECssoKOxtLFpEp/UDHnl2Ico62JG7QSLBLtrd79ArSc/KqiCt5Z4PyeWHv3IL3j9ixHDm60
	OSVy5RPfWgAwMhUhavNTuik/b1j3G2VVNhNTSOaRz2neHqmUWSfB7Wb/8s3+/M0DYL4PY/MY5CO
	UFnD9H9Wb4ELvihyuo3HqaMjtC0PrK/I2HsGL6WoUhRC1CNy8WTUqcVZgp4
X-Received: by 2002:a05:620a:444d:b0:93f:231:9ff with SMTP id af79cd13be357-93f02310e8bmr565290285a.27.1792000689161;
        Wed, 14 Oct 2026 10:58:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:08 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
Date: Wed, 14 Oct 2026 13:57:51 -0400
Message-ID: <20261014175756.2035176-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise(2) accepts a zero-length range, rejects an unaligned start, and
reports an unmapped gap in the range with ENOMEM while still applying the
advice to the mapped pages on either side.

Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
an effect the test can observe, so only MADV_PAGEOUT is checked for
paging out both neighbours, after a control page shows that swap works.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 103 +++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 42cc08fe45ae..f122154fac05 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -5,6 +5,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <stdbool.h>
 #include <sys/mman.h>
 #include <unistd.h>
@@ -51,6 +52,21 @@ static bool pageout_until_swapped(struct __test_metadata *_metadata,
 	return false;
 }
 
+/*
+ * Keep this task on one CPU, so that draining that CPU's LRU batches drains
+ * the folios this task faulted in.
+ */
+static void pin_to_current_cpu(struct __test_metadata *_metadata)
+{
+	int cpu = sched_getcpu();
+	cpu_set_t mask;
+
+	ASSERT_GE(cpu, 0);
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -111,6 +127,93 @@ TEST_F(madvise, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* A zero-length range is accepted. */
+TEST_F(madvise, zero_length_is_accepted)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+
+	ASSERT_EQ(madvise(mapping, 0, MADV_COLD), 0);
+	ASSERT_EQ(madvise(mapping, 0, MADV_PAGEOUT), 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* The start of the range must be page-aligned. */
+TEST_F(madvise, unaligned_start_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
+/*
+ * An unmapped gap in the range makes either hint fail with ENOMEM, after
+ * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
+ * an effect on those pages that the test can observe.
+ */
+TEST_F(madvise, unmapped_gap_fails_after_advising)
+{
+	char *mapping, *control;
+	bool swapped = false;
+	int retry;
+
+	pin_to_current_cpu(_metadata);
+
+	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
+	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(control, MAP_FAILED);
+	control[0] = 1;
+	if (!pageout_until_swapped(_metadata, control, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the page");
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_EQ(munmap(mapping + page_size, page_size), 0);
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	for (retry = 0; retry < PAGEOUT_RETRIES && !swapped; retry++) {
+		ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+		ASSERT_EQ(errno, ENOMEM);
+		swapped = pagemap_is_swapped(self->pagemap_fd, mapping) &&
+			  pagemap_is_swapped(self->pagemap_fd,
+					     mapping + 2 * page_size);
+		if (!swapped)
+			usleep(10000);
+	}
+	ASSERT_TRUE(swapped)
+		TH_LOG("MADV_PAGEOUT did not page out both sides of the gap");
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(mapping + 2 * page_size, page_size), 0);
+	ASSERT_EQ(munmap(control, page_size), 0);
+}
+
 /* Neither hint may fault a swapped page back in. */
 static void check_skips_swapped_pte(struct __test_metadata *_metadata,
 				    int pagemap_fd, int advice)
-- 
2.56.0

