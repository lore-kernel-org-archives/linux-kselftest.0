Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA556C642
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000700; cv=none; b=kmME7EcSW8w3Kxrkda7Dtlii4Unxji4g9ZucrwJ3PW4i0qyqPhGwBuykv9mMylNQu/iaG8/kHBymYQBAQfaDgI+KLbbUQPUMy1XJcP+Q4nakQuxnhEfxJfhdSoR9eZmkKjY459g3JRj7qEyw2ZlYgFmw3KPxTuyK8FFi5kkl+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000700; c=relaxed/simple;
	bh=HBt/1d0Jv3UjL6OKaXNhIHKOgd3SR6AWUE1zCkdfaFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6KdlE9FB/dCKbGFUx/mDVlIAJeTzfsJ69dWG2YZus2G81uUOYlEY3njcxF3JHjD1bVSihjJrffMCfq08Jz0XzSIfczf3x9b45AyGu6r6AFGIj78O4KZ3UDAREEcYTo1pYgPEuJZIHMc3aoETOkZcYo071WXXdp2/VPjy3gF8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XywEa+rC; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XywEa+rC"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9178aabd30dso44099996d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000697; x=1792605497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4y6AvoDjRL3MjFRJLFGO2/ddqJNiHaVlDDXEV/4hBQ=;
        b=XywEa+rC7uDabIqmIFRhx3HS0ok3JGAVzRMukTyGq7O9OZSdy/efziwMtBgaTyMf0w
         EjolLh2+U9JIZWXcZRlNiHd+f/INsf7CKvOeAeyl+GANYlem1lkkXQ3Ms5OitIRCzHvF
         vx2JJMr2br570D6LbqYurn4GKEs5ozMpETr6IYDwREUWorhjbIZjUgi0vPN7KP+EHkP7
         2YxWs9Db5geGQz3ltRmR+VL9xMkbhjN71Y2NIux/ZuOyIfSF+NCwU+1eVqf0hynzd8Jh
         fmZvfaNN55qvhD/NaN1h9LKFbpwV86e+BIs8viMeVLkIsM7CZ07FJu/0CtCyo0G8Vc0M
         NOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000697; x=1792605497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4y6AvoDjRL3MjFRJLFGO2/ddqJNiHaVlDDXEV/4hBQ=;
        b=0GZPQrssDOLvU4ekT07VesbJZeBHo8jlW/GFTrDUzPElZJFvd7QnpvsAo+CHIB0Y4M
         b0UFBjc4FGlar1desZpRpfFapBVq3zXEQpwoOBJ4nT1kJduH9d2G3bIrhHnMIQ0C80Qx
         KererA4NA4kNPwR3cC+zMsWwYNr4uA1Tr+XcqkweIdpmUtHBRFI8hZGnMdCb1oqxglMq
         xxMMbdpfPcyUzLKvUBuVT6hIlFtKdCOFyzXAuV7QpE8eTTWez6CwjcCobkzMXdyu/A63
         gpQm0WfwMGzJLdSDLa86D7diGbae2YpGzVB1ZcnyHnOOZExBq0mJV+PasYqJEFrlJM4w
         OoWw==
X-Gm-Message-State: AFq9FYKF4hpp2H5LzLfBAUfUs/vzQUGf94e75bDpWewxwu0utwbBw9GA
	260tko6MOTnRQifCCR80l9OHvAn2hzGpkKBES9N3WMIYXfJhNKRVfEegNIxP9cUwGxHAVOQsnnm
	EsE77WV8=
X-Gm-Gg: AYBFou1SBZ/t4HiRqwEb9gfD6QDw8tDo490INcgEdTWkeHJBURFMOAB0iswW8G2jLbB
	GW5PkOtNxYhF3Xhju+SO17s/ig8rcZg3uA0umIU5sg8A+ERUV3y37uDTFJCM/AeB/dWEk+ENwEb
	XSzEmNx0g1KmJX0zBZU2Qj2Qrlzl5QH6UBrU2nWDNJNUhryidaGN7jZxAhtPls1rcufv7a5Lq2u
	vJyyQAjiFO+dF4MRTxS4s7v/wjwNusKVRxJFKNLajaMvSKSMlHjJcvEuWsLdVSSJd/lS3zuhbYv
	bkTI4CHRAVMc+VyZsRE+zTIHViOV4L3H5pv5ZvYvpYSkKFewfqlLcszeaGeL4ZicDHu5hvPSBuD
	qDui9+Bnvegu6G88SFJ16Ow3U9o8cA20AH/Az4FbKdlgBzD1t7TyQ+y6Hm24kZJgq5VEcWw5f3x
	Ri/tug8vyUQ5PzX0v6CkhrO+tXTuwuJflg37tGZhQpld6Bfo1pi/sttu3tes/1ubjrUmM/X17S2
	WO/U76PQ50tXK1vUqCw+UsGlJnq7sKbyy1VIpxanS2PkUNhzSgdD/wDDvJZ
X-Received: by 2002:a05:6214:2469:b0:91b:9441:131a with SMTP id 6a1803df08f44-91b9441155dmr124063136d6.2.1792000694921;
        Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
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
Subject: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
Date: Wed, 14 Oct 2026 13:57:55 -0400
Message-ID: <20261014175756.2035176-8-gourry@gourry.net>
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

MADV_PAGEOUT only pages out file pages for a caller that owns the file or
could open it for writing, per can_do_file_pageout(). Any other caller
gets nothing from a shared file mapping, and only the anonymous COW pages
from a private one.

Check that the owner of a read-only file can evict a clean page of it,
once a writable file page shows that file pages can be paged out at all.
That test runs as an unprivileged owner even when started as root, so
that capabilities cannot stand in for ownership.

Also check that an unauthorized caller leaves a shared file page resident,
and that it pages out the COW page of a private mapping but not the file
page next to it. These need root to change credentials, and skip if that
fails.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 105 +++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 8822991eae4a..74202fed2d04 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -5,6 +5,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <grp.h>
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -12,6 +13,7 @@
 #include <sys/ipc.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
+#include <sys/stat.h>
 #include <unistd.h>
 
 #include "kselftest_harness.h"
@@ -208,8 +210,9 @@ static bool page_is_present(int pagemap_fd, char *addr)
 	return pagemap_get_entry(pagemap_fd, addr) & PM_PRESENT;
 }
 
-/* Map a shared mapping of an unlinked, zero-filled temporary file. */
-static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
+/* Map an unlinked, zero-filled temporary file with the given permissions. */
+static char *map_temp_file(struct __test_metadata *_metadata, size_t size,
+			   int flags, mode_t mode)
 {
 	char template[] = "/tmp/madvise-pageout-XXXXXX";
 	char *mapping;
@@ -219,14 +222,21 @@ static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
 	ASSERT_GE(fd, 0);
 	ASSERT_EQ(unlink(template), 0);
 	ASSERT_EQ(ftruncate(fd, size), 0);
+	ASSERT_EQ(fchmod(fd, mode), 0);
 
-	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, fd, 0);
 	ASSERT_NE(mapping, MAP_FAILED);
 	close(fd);
 
 	return mapping;
 }
 
+/* Become an unprivileged user without capabilities. */
+static bool drop_privileges(void)
+{
+	return !setgroups(0, NULL) && !setgid(65534) && !setuid(65534);
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -432,7 +442,7 @@ TEST_F(madvise, cold_preserves_dirty_shared_file_page)
 {
 	char *mapping;
 
-	mapping = map_temp_file(_metadata, page_size);
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
 	mapping[0] = 1;
 
 	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
@@ -449,7 +459,7 @@ TEST_F(madvise, pageout_preserves_dirty_shared_file_page)
 {
 	char *mapping;
 
-	mapping = map_temp_file(_metadata, page_size);
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
 	mapping[0] = 1;
 
 	if (!pageout_until_evicted(_metadata, mapping, page_size,
@@ -639,4 +649,89 @@ TEST_F(madvise, cold_preserves_half_of_pte_mapped_thp)
 	ASSERT_EQ(munmap(mapping, pmd_size), 0);
 }
 
+/*
+ * The owner of a file may page out its clean page-cache pages. Run as an
+ * unprivileged owner, so that capabilities cannot stand in for ownership.
+ */
+TEST_F(madvise, pageout_evicts_owned_file_page)
+{
+	char *mapping, *control;
+
+	if (!geteuid() && !drop_privileges())
+		SKIP(return, "could not drop privileges");
+	pin_to_current_cpu(_metadata);
+
+	/* Make sure a writable file page can be paged out at all. */
+	control = map_temp_file(_metadata, page_size, MAP_PRIVATE, 0600);
+	ASSERT_EQ(control[0], 0);
+	if (!pageout_until_evicted(_metadata, control, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not evict a file page");
+
+	mapping = map_temp_file(_metadata, page_size, MAP_PRIVATE, 0400);
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pageout_until_evicted(_metadata, mapping, page_size,
+					  self->pagemap_fd));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(control, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file must not page out its
+ * shared mappings. MADV_PAGEOUT succeeds but leaves the page resident.
+ */
+TEST_F(madvise, pageout_skips_unauthorized_shared_file)
+{
+	char *mapping;
+
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file may page out the anonymous
+ * COW pages of a private mapping of it, but must leave the file pages
+ * resident.
+ */
+TEST_F(madvise, pageout_private_file_reclaims_only_cow)
+{
+	char *mapping;
+	bool swapped;
+
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, 2 * page_size, MAP_PRIVATE,
+				0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_EQ(mapping[page_size], 0);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
+					 mapping + page_size));
+	swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[page_size], 0);
+	if (!swapped)
+		SKIP(return, "MADV_PAGEOUT did not swap the COW page");
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0

