Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477194;
	b=COYqIe3bF/XuEIG49SZ4DU8ylXQbgEx4u89mMIgKg83RDt2YP88KgB+N1a0oc6SiQG59
	 ncuiX9s7I9aOD7uJtpkedNMkmmhHt4meb1BfZSUAXP+68gqlL9Fz5XSn0mZjvSMeOxr6d
	 85qzQhqAlcCDlicVzTnhTiLEF0/i+jXZdXWR5rz3uu/6EAdDEDJlu40Z/b3MU8Ts35f7B
	 VUrXD36SMOz2Wy8IUl9v9k++JX8AGHJ+JO783Xh8tja/aimvb9w/TyxwUKPgnJzBUHdz2
	 AnEfiT9cUZf1WRjxlTcApCd4yEPCUFo6XzogKqNQQgVRqzblxl7+HbxHr4cfwyDCMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iKJ0YhG5KuD0pKI8GbolHfK4XjQIGbL51iUEGtZcrrg=;
	b=pOEF4oQO1YZfrVMLPX0J2VA0JECgPFXNmQIfdDBVSozYKTqYqtLmYaL7/b9/u4eqo4v4
	 tbUrRkLe6mRrrRAMNA3l0EPsiHqXG4KkqZlpRsLGAx4PKLj6FYuJTxiEUFVfoiB+IAvmZ
	 k6bgRNQuXlQdOwRhWwmVuWG9ly53LPOs3XVGr/ALTg5onGCLAX/yzSgdbBVdZjR1a6r+8
	 RVAn5GWhRNiZjKZw86TV8eX5VhOIL/FnhTLhvIyZr0Au4lwFPUEICWaaHmfJ3+MYDJXyV
	 73OPMwGj2cy36PXkAJb3G3c5TH8OrMuMSOr35cgB7OWRkOm5GkJcaV7Tp0QdHv7BrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O8rkdQH+;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5A606A6BD
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F5A606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O8rkdQH+
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so4131104b6e.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477193; x=1796081993; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKJ0YhG5KuD0pKI8GbolHfK4XjQIGbL51iUEGtZcrrg=;
        b=O8rkdQH+VRmOqWLhv1M2GoUP6N7NQ+3NQhkhujWOAiEHGc4faXfuhLC/pTgsh0QppB
         Fsr8Pe3X1Fzpc9b1NjjU6ji4scLNELv5GHIWt9uiRBHNgXjPljzSHo2oH6MPJfLz7E+g
         2GGwgPph4RQhmEnNv5/RkjeKyk+iBVWRgwk5YH0lq6C3SPKqk5Ls9BU0Elqsk/jVE+zT
         9TqsuKvrU4yYxfFygdUMumOPvKvohwskGepIeXiFb4w41r7Rm6nms1yQwRIQdxLcwZdQ
         LG+fAxU5fnrmooixuXiCWFSkyIJL936P02pHc27q6reSIooZlJGNYpyMHgyewrArAFo/
         c1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477193; x=1796081993;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKJ0YhG5KuD0pKI8GbolHfK4XjQIGbL51iUEGtZcrrg=;
        b=uCvSrDfJvbLMoW/BBh4xjO1Nb1IyhfElLkf2pRrbQu9feTJllffgWzOO4qy24xhR9H
         R7LJpGdlgSvT9firjy+KTCDx7mBgMZJeonxJP8gSP8oDS+oz6TnI3rcRnjFK1LxAyuZz
         U113OHfcmSyyBm5VzYQu5jfy2JVKvxwMVwTJFQiHJt25oySRNAG24db608GYClP1/qwx
         QoE8QIOj2I3BN9e2wwQqAFcCtMJLbEIvS3cCHPwSg3vVlTHPRoMxZXrJjiTtKPQVd6kv
         Ts7ALamW1onI0K4HeB1VcLMd/zYevIH1PkIc7t7TeBpph+9dAPfgqjZltrPgdLJIR2X3
         woLQ==
X-Forwarded-Encrypted: i=1; AL+hErEXI3GY7vulwfhCRiocarZwUeNSEr6uRKdYxLC8F5qC5wfhnoEVwHXiq4QguFjrOh8RYm/SWYj2PUAidvl49pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sS1CWiM1p4uYIT7qRnihibDR1vEuxQ9ObZdJxXXi4N8NJVrCg
	1BgbkJ7LljfjvOvNb3+kzcLjreeUusdQxkKsUM46hoi8JtIyaV0RMPt/mmrOg3VUuAGczWydF0G
	8GGeb8DEfaHKuIw==
X-Received: from ilei3-n2.prod.google.com ([2002:a05:6e02:61c3:20b0:53c:e043:6f2d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:50a1:b0:55b:f8cc:aef1 with SMTP id 5614622812f47-57a0a930345mr13528096b6e.15.1795477192273;
 Mon, 23 Nov 2026 15:39:52 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:22 +0000
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
Message-ID: <20261123233924.3970932-18-dmatlack@google.com>
Subject: [PATCH v5 17/18] selftests/liveupdate: Test retrieving tmpfs files
 preserved read-only
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

Add test cases to luo_tmpfs for source files preserved through a
read-only fd, through a read-only mount, on a read-only superblock, and
immutable files. Each of these cases except the first also preserves a
sparse file, whose holes are filled when it is preserved. Check that
the files are retrieved with their contents. Also check that the size of
a preserved file is frozen, even when the file is opened by its path,
and that writes within the file are preserved.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 305 ++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_tmpfs.c b/tools/testing/selftests/liveupdate/luo_tmpfs.c
index 27ec750351da..7911ac28188f 100644
--- a/tools/testing/selftests/liveupdate/luo_tmpfs.c
+++ b/tools/testing/selftests/liveupdate/luo_tmpfs.c
@@ -462,6 +462,13 @@ static int preserve_memfd(struct test_case *tc, unsigned int flags,
 	return ret;
 }
 
+/* Skip a case whose source file couldn't be preserved in stage 1. */
+static int skip_not_preserved(struct test_case *tc)
+{
+	ksft_print_msg("%s: The source file was not preserved\n", tc->name);
+	return KSFT_SKIP;
+}
+
 static int drop_privileges(void)
 {
 	CHECK_EQ(syscall(__NR_setgroups, 0, NULL), 0);
@@ -838,6 +845,175 @@ static int linked_target_verify(struct test_case *tc)
 	return KSFT_PASS;
 }
 
+static int rdonly_source_preserve(struct test_case *tc)
+{
+	int fd, ret;
+
+	fd = create_source("src/rdonly_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	fd = open("src/rdonly_source", O_RDONLY);
+	CHECK(fd >= 0);
+	ret = preserve_fd(fd, tc->pos, tc->token);
+	close(fd);
+
+	return ret;
+}
+
+/* Create a sparse file at @path, with a hole after the first page. */
+static int create_sparse_source(const char *path, __u64 token)
+{
+	int fd;
+
+	fd = create_source(path, page_size, token);
+	if (fd < 0)
+		return -1;
+
+	if (ftruncate(fd, 2 * page_size)) {
+		close(fd);
+		return -1;
+	}
+
+	return fd;
+}
+
+/* Open @path with O_RDONLY and try to preserve it with @token. */
+static int try_preserve_path(const char *path, __u64 token)
+{
+	int fd, ret;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = luo_session_preserve_fd(session_fd, fd, token);
+	close(fd);
+	return ret;
+}
+
+/* Check that the file preserved with @token has the source of @tc. */
+static int check_preserved(struct test_case *tc, __u64 token, size_t size)
+{
+	int fd;
+
+	fd = retrieve_new(token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), size);
+	TRY(check_contents(fd, size, tc->token));
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+/* Check that the file preserved with @token is a create_sparse_source(). */
+static int check_sparse_preserved(struct test_case *tc, __u64 token)
+{
+	unsigned char *p;
+	int fd;
+
+	fd = retrieve_new(token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), 2 * page_size);
+
+	/* Preserving the file filled the hole. */
+	CHECK_EQ(file_pages(fd), 2);
+	p = mmap(NULL, 2 * page_size, PROT_READ, MAP_SHARED, fd, 0);
+	CHECK(p != MAP_FAILED);
+	TRY(check_range(p, 0, page_size, tc->token));
+	TRY(check_range(p, page_size, 2 * page_size, 0));
+
+	munmap(p, 2 * page_size);
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int rdonly_mount_source_preserve(struct test_case *tc)
+{
+	int fd;
+
+	fd = create_source("src/rdonly_mount_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src/rdonly_mount_sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	CHECK_EQ(mkdir("src_ro", 0755), 0);
+	CHECK_EQ(do_mount("src", "src_ro", NULL, MS_BIND, NULL), 0);
+	CHECK_EQ(do_mount("none", "src_ro", NULL,
+			  MS_REMOUNT | MS_BIND | MS_RDONLY, NULL), 0);
+
+	/*
+	 * Files can be preserved through a read-only mount. Their holes are
+	 * filled as if by read faults, which work through read-only mounts too.
+	 */
+	CHECK_EQ(try_preserve_path("src_ro/rdonly_mount_source", tc->token), 0);
+	CHECK_EQ(try_preserve_path("src_ro/rdonly_mount_sparse", tc->token + 1),
+		 0);
+	return KSFT_PASS;
+}
+
+static int rdonly_mount_source_verify(struct test_case *tc)
+{
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	TRY(check_preserved(tc, tc->token, tc->size));
+	TRY(check_sparse_preserved(tc, tc->token + 1));
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_child(struct test_case *tc)
+{
+	TRY(drop_privileges());
+
+	/* The owner can preserve a file whose size can't change anyway... */
+	CHECK_EQ(try_preserve_path("src_rosb/own", tc->token + 1), 0);
+
+	/* ... but nobody else can. */
+	CHECK(try_preserve_path("src_rosb/other", tc->token + 2) < 0);
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_preserve(struct test_case *tc)
+{
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("src_rosb", 16, NULL), 0);
+	fd = create_source("src_rosb/root", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_source("src_rosb/own", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	CHECK_EQ(chown("src_rosb/own", NOBODY, NOBODY), 0);
+	fd = create_source("src_rosb/other", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src_rosb/sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	CHECK_EQ(do_mount(NULL, "src_rosb", NULL, MS_REMOUNT | MS_RDONLY, NULL),
+		 0);
+
+	CHECK_EQ(try_preserve_path("src_rosb/root", tc->token), 0);
+	TRY(run_child(rdonly_sb_source_child, tc));
+
+	/* Holes are filled as if by read faults, even on a read-only sb. */
+	CHECK_EQ(try_preserve_path("src_rosb/sparse", tc->token + 3), 0);
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_verify(struct test_case *tc)
+{
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	TRY(check_preserved(tc, tc->token, tc->size));
+	TRY(check_preserved(tc, tc->token + 1, tc->size));
+	CHECK_EQ(luo_session_retrieve_fd(session_fd, tc->token + 2), -ENOENT);
+	TRY(check_sparse_preserved(tc, tc->token + 3));
+	return KSFT_PASS;
+}
+
 /* Set the inode flag @flag, e.g. FS_IMMUTABLE_FL, on the file at @path. */
 static int set_inode_flag(const char *path, int flag)
 {
@@ -859,6 +1035,104 @@ static int set_inode_flag(const char *path, int flag)
 	return ret;
 }
 
+static int immutable_source_preserve(struct test_case *tc)
+{
+	int fd, ret;
+
+	fd = create_source("src/immutable_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src/immutable_sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	ret = set_inode_flag("src/immutable_source", FS_IMMUTABLE_FL);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP) {
+		ksft_print_msg("%s: FS_IOC_SETFLAGS is not supported\n",
+			       tc->name);
+		return KSFT_SKIP;
+	}
+	CHECK_EQ(ret, 0);
+	CHECK_EQ(set_inode_flag("src/immutable_sparse", FS_IMMUTABLE_FL), 0);
+
+	/*
+	 * The size of an immutable file can't change anyway, so its owner can
+	 * preserve it. Its holes are filled as if by read faults.
+	 */
+	CHECK_EQ(try_preserve_path("src/immutable_source", tc->token), 0);
+	CHECK_EQ(try_preserve_path("src/immutable_sparse", tc->token + 1), 0);
+	return KSFT_PASS;
+}
+
+static int immutable_source_verify(struct test_case *tc)
+{
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	fd = retrieve_new(tc->token, "dst");
+	if (fd == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), tc->size);
+	TRY(check_contents(fd, tc->size, tc->token));
+	close(fd);
+
+	TRY(check_sparse_preserved(tc, tc->token + 1));
+	return KSFT_PASS;
+}
+
+#define FROZEN_OFFSET		100
+#define FROZEN_DATA		"frozen"
+
+static int frozen_source_preserve(struct test_case *tc)
+{
+	size_t len = strlen(FROZEN_DATA);
+	int fd;
+
+	TRY(preserve_file(tc));
+
+	/* The size of a preserved file can't change, even through its path. */
+	fd = open("src/frozen_source", O_RDWR);
+	CHECK(fd >= 0);
+	CHECK_ERRNO(ftruncate(fd, tc->size / 2), EPERM);
+	CHECK_ERRNO(ftruncate(fd, tc->size * 2), EPERM);
+	CHECK_ERRNO(do_fallocate(fd, 0, 0, tc->size * 2), EPERM);
+	CHECK_ERRNO(do_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+				 0, page_size), EPERM);
+	CHECK_EQ(lseek(fd, tc->size, SEEK_SET), tc->size);
+	CHECK_ERRNO(write(fd, "x", 1), EPERM);
+	CHECK_EQ(file_size(fd), tc->size);
+
+	/* Writes within the file work, and the data is preserved. */
+	CHECK_EQ(lseek(fd, FROZEN_OFFSET, SEEK_SET), FROZEN_OFFSET);
+	CHECK_EQ(write(fd, FROZEN_DATA, len), len);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int frozen_source_verify(struct test_case *tc)
+{
+	size_t len = strlen(FROZEN_DATA);
+	unsigned char *p;
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), tc->size);
+
+	p = mmap(NULL, tc->size, PROT_READ, MAP_SHARED, fd, 0);
+	CHECK(p != MAP_FAILED);
+	TRY(check_range(p, 0, FROZEN_OFFSET, tc->token));
+	CHECK(!memcmp(p + FROZEN_OFFSET, FROZEN_DATA, len));
+	TRY(check_range(p, FROZEN_OFFSET + len, tc->size, tc->token));
+
+	munmap(p, tc->size);
+	close(fd);
+	return KSFT_PASS;
+}
+
 static int target_rdonly_verify(struct test_case *tc)
 {
 	int target, rd_fd;
@@ -1319,6 +1593,37 @@ static struct test_case test_cases[] = {
 		.size = SMALL_SIZE,
 		.verify = linked_target_verify,
 	},
+	/* Preserving files. */
+	{
+		.name = "rdonly_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_source_preserve,
+		.verify = restore_verify,
+	},
+	{
+		.name = "rdonly_mount_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_mount_source_preserve,
+		.verify = rdonly_mount_source_verify,
+	},
+	{
+		.name = "rdonly_sb_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_sb_source_preserve,
+		.verify = rdonly_sb_source_verify,
+	},
+	{
+		.name = "immutable_source",
+		.size = SMALL_SIZE,
+		.preserve = immutable_source_preserve,
+		.verify = immutable_source_verify,
+	},
+	{
+		.name = "frozen_source",
+		.size = SMALL_SIZE,
+		.preserve = frozen_source_preserve,
+		.verify = frozen_source_verify,
+	},
 	/* The target file. */
 	{
 		.name = "target_rdonly",
-- 
2.56.1.809.ga0b61035b5-goog

