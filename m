Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477195;
	b=aG7UpY6NR28uon8LpUZk82rLFsz7TrICvSadSgp2RiFV3hthksyXb94/l+pBtT96Mqcb
	 06a0g9mnJpBLrDbmxXlEW2YPNqueOhZd9EsA8tluRqUrbjGJEUZzNWqGVdWkebrnirzSZ
	 2XvrYk7R+JQXtmFYBaPvE/Vq2PWefsK0BFXZbgRnYtVsxiYkHIGaufwWBW4ixqEc+vF+H
	 15nFj3/fcrm+ZT4CUhuVMmjtcwRpmlz0c0surDfmhqXlIw60ijySJljPX7ZiLl56LEWnm
	 OQOO0rlswiT+or9bw6Ow4XhB1iPlL/yuVtOfUjZfR0tEKI6xY79yOkHA3ZFXDjcQ6TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TfpmwInLEGo5frDChwR3ktzWoQYmqPnvABEvfJfxR3I=;
	b=zxRonaslw8ABYOXOLIuUXihc09Mqk5NCcHutRfdJeWGcU8I/Osh2ZkRqNJabP7lUl+27
	 GVQVxm5HK5U8oFTZtiOfPuxjTuCqELUwmznPpdDqVB3/6+BZsjCNP6mvbvZn/UCOPOe8Q
	 GGbgeSOYgfcBgg2GDmhsrpCVfoPcHfYV2izPQtYSEEMW1T0rSlph3N0uMHAdbAdxzTUkd
	 wORndW1HTxUyNT2OpcALQEgL4Rqdy9OJNFHDi7xgvTVF4wqwMDbfcT6z9gbgTxDI+Wdf6
	 BNJy17ZPafQp3E0NATQMCxXBKqH1mVQzrqGCMsvZ22WoMX7u+GzV06133Rqew2wqRcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bo42ieLu;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6F60A263B
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A6F60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bo42ieLu
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e937c5bd4fso3393374b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477194; x=1796081994; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfpmwInLEGo5frDChwR3ktzWoQYmqPnvABEvfJfxR3I=;
        b=bo42ieLuaUMLViV72TKfVu77byDyZce5t8h1kVdQlCwltYkFPBjmQeRC2usKNtI/Sc
         gJtOtni6o+woM1LHi57DZSvKUlDZKPBmIr8e73KK4vS0rZrEao4Uf2kPKgY236TUzIfS
         P3N3GNRsBYkfiRxKVesSAxl8Zd9BecAudyCjyiQn7FC1T1DXljtlIJs8jeUBbRF06D+A
         jrrnxhTy+BpJ2oYj69KI7K3FZt7Lgl0MQDSXHiRidPWPFkigLv7yg+dC2VIVfHHbdnYA
         WDa7bVDYW6vuuZDDqGuc7qmBd+lrAjjKtb2oF8NuQHf5Kowo9KxKYxvGPJILb9X3MPb4
         fHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477194; x=1796081994;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfpmwInLEGo5frDChwR3ktzWoQYmqPnvABEvfJfxR3I=;
        b=thAUB6efp65uewnvN/XxZNBaLTJtIgyRXqsGhHZC672JJji9o51Nj6bLeTYNZu/LM9
         ztwYQEvQDdPG+y9uMkcEM0w+nmQ8i59hwpoE3LbLVQ5bdSoRQlKel49ZVI81N4BFJtrp
         Esxz14o3oU2TVMjW6sIFI7lOCgnBoKIKyEu2jGgq7xpWqzyC/+wlwa/4b4ljsIPYEW9q
         ubj1Hnc9Xb5HJPEWNGo9XlVyomS04TTqbXpPndmo7zCHGlZ1sMeRKeTTc5BM98RfjCuc
         HZ967qDi6aAO6xiVHLvErPsH1dz0Gdj9oqHUmRtBDTMCd4uTMaopV4HVqKqcyQGQi4Ht
         rHJg==
X-Forwarded-Encrypted: i=1; AL+hErH4lGGBFmrh7rXjxrj+5g2lJEiXqq/JMNo1dEHEeGWy8ycaeOyInxrT1v47y/5+vqdLUK6r6BdDwbVMGCfl+s4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+psvW1j3+Wp7gVLwluIdcUUZwxt3u54/7AARV79PiRACXPXvrh
	Vq5e/7NFHFY1vkpWLhdJfa83w5k4CQ9xLTLzloHz5kwbIzGnWI0l4oRhddj6yrqjNHjsGgTK1jx
	LhmiTgzJdgv785g==
X-Received: from jats20.prod.google.com ([2002:a05:6638:2594:b0:61c:f132:938b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c3d2:b0:579:293a:52ac with SMTP id 5614622812f47-57a06a0f737mr14141383b6e.9.1795477193657;
 Mon, 23 Nov 2026 15:39:53 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:23 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-19-dmatlack@google.com>
Subject: [PATCH v5 18/18] selftests/liveupdate: Test block accounting of
 retrieved tmpfs files
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add test cases to luo_tmpfs for how the blocks of a retrieved file are
charged: The file fits a mount of exactly its size, and a large folio
that extends past the end of the file is charged in full. Running out of
space on the mount, or hitting the memcg limit, fails permanently,
leaves the target empty and nothing charged to the mount or the memcg,
and the session can still be finished.

Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases, and
CONFIG_CGROUPS and CONFIG_MEMCG for the memcg test case. They are
skipped without them.

tmpfs quotas are not tested.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/liveupdate/config     |   3 +
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 283 +++++++++++++++++-
 2 files changed, 284 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 37230f4c488f..7f38291c979d 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -1,4 +1,5 @@
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CGROUPS=y
 CONFIG_DEVTMPFS=y
 CONFIG_KEXEC_FILE=y
 CONFIG_KEXEC_HANDOVER=y
@@ -7,7 +8,9 @@ CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
 CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
+CONFIG_MEMCG=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_XATTR=y
 CONFIG_SHMEM=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
diff --git a/tools/testing/selftests/liveupdate/luo_tmpfs.c b/tools/testing/selftests/liveupdate/luo_tmpfs.c
index 7911ac28188f..df2bc1488c01 100644
--- a/tools/testing/selftests/liveupdate/luo_tmpfs.c
+++ b/tools/testing/selftests/liveupdate/luo_tmpfs.c
@@ -62,8 +62,9 @@
 
 /*
  * Everything happens on a tmpfs mounted at TEST_DIR. In stage 1, the source
- * files are created on the tmpfs mounted at TEST_DIR/src. In stage 2, each
- * case runs in the directory TEST_DIR/<name of the case>.
+ * files are created on the tmpfs mounted at TEST_DIR/src, or at
+ * TEST_DIR/src_huge for files that need large folios. In stage 2, each case
+ * runs in the directory TEST_DIR/<name of the case>.
  */
 #define TEST_DIR		"/luo_tmpfs"
 
@@ -145,6 +146,7 @@ struct test_case {
 static unsigned long page_size;
 static int dev_fd;
 static int session_fd;
+static bool have_huge_src;
 
 /* nolibc doesn't have these, so use syscall() where needed. */
 static int do_fcntl(int fd, int cmd, long arg)
@@ -213,6 +215,16 @@ static long mnt_used(const char *path)
 	return buf.f_blocks - buf.f_bfree;
 }
 
+static long mnt_free(const char *path)
+{
+	struct statfs buf;
+
+	if (do_statfs(path, &buf))
+		return -1;
+
+	return buf.f_bfree;
+}
+
 /* Mount a tmpfs with room for @pages pages at @dir. */
 static int mount_tmpfs(const char *dir, unsigned long pages, const char *opts)
 {
@@ -248,6 +260,26 @@ static long read_long(const char *path)
 	return strtol(buf, NULL, 10);
 }
 
+/* Write @str to the file at @path. Return 0 or -errno. */
+static int write_file(const char *path, const char *str)
+{
+	ssize_t len = strlen(str), ret;
+	int fd;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, str, len);
+	if (ret != len)
+		ret = ret < 0 ? -errno : -EIO;
+	else
+		ret = 0;
+
+	close(fd);
+	return ret;
+}
+
 /* Retrieve with the argument @arg. Return the new fd or -errno. */
 static int retrieve_arg(__u64 token, struct liveupdate_shmem_retrieve_arg *arg)
 {
@@ -462,6 +494,33 @@ static int preserve_memfd(struct test_case *tc, unsigned int flags,
 	return ret;
 }
 
+/* Preserve a file from the tmpfs mounted with huge=always. */
+static int preserve_huge_file(struct test_case *tc)
+{
+	char path[128];
+	int fd, ret;
+
+	if (!have_huge_src)
+		return KSFT_SKIP;
+
+	snprintf(path, sizeof(path), "src_huge/%s", tc->name);
+	fd = create_source(path, tc->size, tc->token);
+	CHECK(fd >= 0);
+
+	/* The test needs the last, partial page to be in a large folio. */
+	if (tc->size % page_size && file_pages(fd) <= nr_pages(tc->size)) {
+		ksft_print_msg("%s: No large folio for the source file\n",
+			       tc->name);
+		close(fd);
+		return KSFT_SKIP;
+	}
+
+	ret = preserve_fd(fd, tc->pos, tc->token);
+	close(fd);
+
+	return ret;
+}
+
 /* Skip a case whose source file couldn't be preserved in stage 1. */
 static int skip_not_preserved(struct test_case *tc)
 {
@@ -1335,6 +1394,186 @@ static int exec_after_finish(struct test_case *tc)
 	return KSFT_PASS;
 }
 
+static int mount_fits_verify(struct test_case *tc)
+{
+	unsigned long pages = nr_pages(tc->size);
+	int fd;
+
+	/* The file can be retrieved into a mount it fits exactly. */
+	CHECK_EQ(mount_tmpfs("fit", pages, NULL), 0);
+	fd = retrieve_new(tc->token, "fit");
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+	CHECK_EQ(mnt_used("fit"), pages);
+	CHECK_EQ(mnt_free("fit"), 0);
+
+	CHECK_EQ(ftruncate(fd, 0), 0);
+	CHECK_EQ(mnt_used("fit"), 0);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int mount_too_small_verify(struct test_case *tc)
+{
+	unsigned long pages = nr_pages(tc->size);
+	int target;
+
+	/* The failure leaves the target empty, and the mount untouched... */
+	CHECK_EQ(mount_tmpfs("small", pages - 1, NULL), 0);
+	target = new_target("small");
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -ENOSPC);
+	CHECK_EQ(file_size(target), 0);
+	CHECK_EQ(file_pages(target), 0);
+	CHECK_EQ(mnt_used("small"), 0);
+	close(target);
+
+	/*
+	 * ... but the preserved contents were restored before it was detected,
+	 * so the failure is permanent. Finishing the session frees them.
+	 */
+	CHECK_EQ(mount_tmpfs("big", pages, NULL), 0);
+	CHECK_EQ(retrieve_new(tc->token, "big"), -ENOSPC);
+	CHECK_EQ(luo_session_retrieve_fd(session_fd, tc->token), -ENOSPC);
+	CHECK_EQ(mnt_used("big"), 0);
+
+	return KSFT_PASS;
+}
+
+static int huge_folios_verify(struct test_case *tc)
+{
+	unsigned long pages = nr_pages(tc->size);
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", pages, "huge=never"), 0);
+	fd = retrieve_new(tc->token, "dst");
+	if (fd == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+	CHECK_EQ(mnt_used("dst"), pages);
+
+	/* LUO keeps a reference to the file until the session is finished. */
+	close(fd);
+	CHECK_EQ(mnt_used("dst"), pages);
+
+	return KSFT_PASS;
+}
+
+static int huge_folios_after_finish(struct test_case *tc)
+{
+	CHECK_EQ(mnt_used("dst"), 0);
+	return KSFT_PASS;
+}
+
+static int huge_folio_tail_verify(struct test_case *tc)
+{
+	long pages;
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 4096, "huge=never"), 0);
+	fd = retrieve_new(tc->token, "dst");
+	if (fd == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), tc->size);
+	TRY(check_contents(fd, tc->size, tc->token));
+
+	/* The whole folio is charged, including the part past EOF. */
+	pages = file_pages(fd);
+	CHECK(pages > 1);
+	CHECK_EQ(mnt_used("dst"), pages);
+
+	CHECK_EQ(ftruncate(fd, 0), 0);
+	CHECK_EQ(mnt_used("dst"), 0);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int huge_folio_tail_enospc_verify(struct test_case *tc)
+{
+	int ret;
+
+	/* There is room for the file, but not for its last folio. */
+	CHECK_EQ(mount_tmpfs("small", 1, "huge=never"), 0);
+	ret = retrieve_new(tc->token, "small");
+	if (ret == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK_EQ(ret, -ENOSPC);
+	CHECK_EQ(mnt_used("small"), 0);
+
+	return KSFT_PASS;
+}
+
+static int memcg_limit_child(struct test_case *tc)
+{
+	long limit = tc->size / 2, usage;
+	int ret;
+
+	/*
+	 * Charging a large folio doesn't invoke the memcg OOM killer, but the
+	 * source may have gotten small folios. Protect the child, so that the
+	 * retrieve fails with -ENOMEM instead.
+	 */
+	CHECK_EQ(write_file("/proc/self/oom_score_adj", "-1000"), 0);
+	CHECK_EQ(write_file("memcg/small/cgroup.procs", "0"), 0);
+
+	/* The folios are charged to the memcg of the caller, which is full. */
+	ret = retrieve_new(tc->token, "dst");
+	if (ret == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK_EQ(ret, -ENOMEM);
+
+	/* The failure leaves the mount and the memcg untouched. */
+	CHECK_EQ(mnt_used("dst"), 0);
+	usage = read_long("memcg/small/memory.current");
+	CHECK(usage >= 0 && usage < limit);
+
+	return KSFT_PASS;
+}
+
+static int memcg_limit_verify(struct test_case *tc)
+{
+	unsigned long pages = nr_pages(tc->size);
+	char limit[32];
+	int ret;
+
+	CHECK_EQ(mkdir("memcg", 0755), 0);
+	if (do_mount("cgroup2", "memcg", "cgroup2", 0, NULL)) {
+		ksft_print_msg("%s: cgroup2 is not available\n", tc->name);
+		return KSFT_SKIP;
+	}
+	if (write_file("memcg/cgroup.subtree_control", "+memory")) {
+		ksft_print_msg("%s: The memory controller is not available\n",
+			       tc->name);
+		return KSFT_SKIP;
+	}
+
+	CHECK_EQ(mount_tmpfs("dst", pages, "huge=never"), 0);
+
+	/* A memcg without room for the file. */
+	CHECK_EQ(mkdir("memcg/small", 0755), 0);
+	snprintf(limit, sizeof(limit), "%zu", tc->size * 3 / 4);
+	ret = write_file("memcg/small/memory.max", limit);
+	if (ret) {
+		ksft_print_msg("%s: Can't set memory.max: %d\n", tc->name, ret);
+		ret = KSFT_FAIL;
+	} else {
+		ret = run_child(memcg_limit_child, tc);
+	}
+	rmdir("memcg/small");
+	if (ret != KSFT_PASS)
+		return ret;
+
+	/* The preserved contents were restored, so the failure is permanent. */
+	CHECK_EQ(retrieve_new(tc->token, "dst"), -ENOMEM);
+	CHECK_EQ(mnt_used("dst"), 0);
+
+	return KSFT_PASS;
+}
+
 static int memfd_preserve(struct test_case *tc)
 {
 	return preserve_memfd(tc, 0, 0);
@@ -1661,6 +1900,42 @@ static struct test_case test_cases[] = {
 		.verify = exec_verify,
 		.after_finish = exec_after_finish,
 	},
+	/* Block accounting. */
+	{
+		.name = "mount_fits",
+		.size = 2 << 20,
+		.verify = mount_fits_verify,
+	},
+	{
+		.name = "mount_too_small",
+		.size = 2 << 20,
+		.verify = mount_too_small_verify,
+	},
+	{
+		.name = "huge_folios",
+		.size = 4 << 20,
+		.preserve = preserve_huge_file,
+		.verify = huge_folios_verify,
+		.after_finish = huge_folios_after_finish,
+	},
+	{
+		.name = "huge_folio_tail",
+		.size = 100,
+		.preserve = preserve_huge_file,
+		.verify = huge_folio_tail_verify,
+	},
+	{
+		.name = "huge_folio_tail_enospc",
+		.size = 100,
+		.preserve = preserve_huge_file,
+		.verify = huge_folio_tail_enospc_verify,
+	},
+	{
+		.name = "memcg_limit",
+		.size = 4 << 20,
+		.preserve = preserve_huge_file,
+		.verify = memcg_limit_verify,
+	},
 	/* memfds. */
 	{
 		.name = "memfd",
@@ -1765,6 +2040,10 @@ static void run_stage_1(int luo_fd)
 	if (chdir(TEST_DIR) || mount_tmpfs("src", 4096, "huge=never"))
 		fail_exit("Failed to mount the source tmpfs");
 
+	have_huge_src = !mount_tmpfs("src_huge", 4096, "huge=always");
+	if (!have_huge_src)
+		ksft_print_msg("[STAGE 1] huge=always is not supported\n");
+
 	session_fd = luo_create_session(luo_fd, SESSION_NAME);
 	if (session_fd < 0)
 		fail_exit("luo_create_session for '%s'", SESSION_NAME);
-- 
2.56.1.809.ga0b61035b5-goog

