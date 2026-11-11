Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356669;
	b=Q0P23NfYWtnNHjjoW2f/8ReIM8haoguDJ6Hq5KiUMAiFNn9TyMXnB87OZpRNQ+SSP1e/
	 l+JqKPgjAqFuRgs0QP7Wv6ldHaPPNZrUKPzozGQSgjMi+bnP6BBOf99ig+CYmVD3X0of5
	 gZIMq4gJ3m/9W8GmsCVIDGfEAbljZZA50fH06vGmVgwSmF6vyyMcMAxtJQO8uXXBF8KeH
	 USRXNganc0EjrqrDEA0rvPs7kitzHJKOnH04z30CKcz1d9BXcZmKalOOv9rFglTjQF2k6
	 x5t6uajcir2/OhWyBHDBnkqbCxYx1rG7oBRzBNM2BEe+5u/wt9TFGX4Mx0YBliPL67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bGnTylInlGPnjPgrMZtxSLopGNvVmMmKkB35AW/t6rg=;
	b=QuWs/FQrkRhcrWZb55LwFI8cMLqxFgCkXoL5+JebyG6ufvOceD8xDOXkQ0KmuJwxK9DZ
	 ddcMWOYm/R54IypdM9CVnByr4IzrbPrMWxK4xL4By6NfLDwq+wsqtCPjKcvZiXMotY+oe
	 V0mPuPmry1Uz+kuTzku51KGtiy/ewT/B8EtDXaW87btPjdcUm0QyKX162rQdEKK7EbCWu
	 cDT4zYCk/Pc0ik+aUM7bJzI5ktx/EYsFuENcSt3hWL2tjwUlW3MplyT3HTgJGmd+uNfb6
	 4zvrs3xOglLdXNWyE/4wp+8j+YtZZK9h0rDg99SHs7Cva4yJBXrh1I7/apl3IwHdlSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JWMMS8tf;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC94F60700AB
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC94F60700AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JWMMS8tf
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5641cd2cc13so3003278b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356668; x=1794961468; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGnTylInlGPnjPgrMZtxSLopGNvVmMmKkB35AW/t6rg=;
        b=JWMMS8tf3lgLxeQzVrabr04SPnS4AJF4m+3SCSo4V96+qdVz6am1gptsmqAMmZv4ny
         RqcFcp1e+lPzK11go5SFd2Ujca1q34Y8SpqolYd1p3KHVCP0q4oNg1SQlxQxHUb4bduu
         kK1fvgVM5Z83jQAnwLaPtMEHLY8I1WD5GrFMNr6gHlcHoT6GBZyi74KfQqgyXP/j8l0n
         iFfHsH3CoZkPx7rTJqhb2dVoR7G/n+qZHGOjzO56KKLdWRdY+HqfiLx7Sk7NOqHv1yzH
         0VTD+LG6IQK63QKg0YiaGirB+CLVyxLS+QO1sZBFsu7LSuXwprC4sr2ILE5IiCjampiI
         xv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356668; x=1794961468;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGnTylInlGPnjPgrMZtxSLopGNvVmMmKkB35AW/t6rg=;
        b=1yyCLGxKzn10lhIWkREHILXbE+mRMM06r6FRUqO+xul37a/elmM3FomPVF/wP4LsKv
         3M8vXPkLwnJgXbhZrjyxzp+LfJrUa/KRqY34bLnsJrVgK3hybMiI5uBYh3/aU0q/vvZ3
         12Bd9cT4x8VLmGXnlcMmzBfNVO040ALD/Tw//4zzAqmKpNma+voEPl6qWK7qLGOyFAmw
         sp5FGx4nN+dNMZQB2OQvgInqgIr4ANvOQe7IOjB4CbGsCqGCT5qorj9B3cNjj3tLI0Iq
         HXRItququ7nfDEBoogQMzqGwNaKnQwaMgofi/Ui2cdKBeGg65TTjACfyTRX/lKl8RaoF
         xKqA==
X-Forwarded-Encrypted: i=1; AL+hErHlbaPY7sTqv5NsmxIkJkEYgmD8oFIOCdkO6E6zhU20KiCg9o7OeKtNw5FGUMo6mA26PiG1A+u0U7MXrp1X28s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7h4IsYp8GX8UZlFXgdAWF8GisvxedSKknmrdMD+sX0DUPqX9n
	TnCecnqiUlnJ7aItvPbWZSqXEzLiGukfz/i6OfLMbCD3Qfx0slQOmaPt92GOTURU6YvLuWBItBJ
	XSc2r9K6tUtz4wQ==
X-Received: from iocre20-n1.prod.google.com ([2002:a05:6602:87d4:10b0:9c7:7dbd:f35a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1304:b0:4e7:8f9b:1185 with SMTP id 5614622812f47-56b932426c4mr552544b6e.3.1794356667453;
 Tue, 10 Nov 2026 16:24:27 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:54 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-17-dmatlack@google.com>
Subject: [PATCH v4 16/19] selftests/liveupdate: Test memfds and LUO
 interactions in luo_tmpfs
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

Add test cases to luo_tmpfs that check that memfds are retrieved as
memfds, with their seals and file position, and only without a retrieve
argument, while tmpfs files can only be retrieved with one.

Also check that invalid retrieve arguments fail and can be retried after
fixing them. Retrieving a token again fails with -EBUSY with an
argument, and returns the same open file without one. Files can't be
retrieved from outgoing sessions. A file that LUO already manages can't
be the target, whether it is preserved in an outgoing session or was
already retrieved.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 310 ++++++++++++++++++
 1 file changed, 310 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_tmpfs.c b/tools/testing/selftests/liveupdate/luo_tmpfs.c
index 4e6e035e8433..91a607752ee2 100644
--- a/tools/testing/selftests/liveupdate/luo_tmpfs.c
+++ b/tools/testing/selftests/liveupdate/luo_tmpfs.c
@@ -96,6 +96,19 @@
 	}								\
 } while (0)
 
+/* Check that a system call fails with @err. */
+#define CHECK_ERRNO(expr, err) do {					\
+	long __ret = (expr);						\
+	int __err = errno, __exp = (err);				\
+									\
+	if (__ret != -1 || __err != __exp) {				\
+		ksft_print_msg("%s:%d: %s: %ld, errno %d, expected %d\n", \
+			       __func__, __LINE__, #expr,		\
+			       __ret, __err, __exp);			\
+		return KSFT_FAIL;					\
+	}								\
+} while (0)
+
 /* Call a function that returns a KSFT_* code, and return if it fails. */
 #define TRY(expr) do {							\
 	int __ret = (expr);						\
@@ -121,6 +134,7 @@ struct test_case {
 };
 
 static unsigned long page_size;
+static int dev_fd;
 static int session_fd;
 
 /* nolibc doesn't have these, so use syscall() where needed. */
@@ -271,6 +285,15 @@ static int link_fd(int fd, const char *path)
 		       AT_SYMLINK_FOLLOW);
 }
 
+/* Open the file @fd again with @flags. */
+static int reopen_fd(int fd, int flags)
+{
+	char fd_path[64];
+
+	snprintf(fd_path, sizeof(fd_path), "/proc/self/fd/%d", fd);
+	return open(fd_path, flags);
+}
+
 /* The contents of the files depend on their token. */
 static unsigned char pattern(__u64 token, size_t offset)
 {
@@ -397,6 +420,23 @@ static int preserve_file(struct test_case *tc)
 	return preserve_source(path, tc->size, tc->pos, tc->token);
 }
 
+/* Preserve a memfd with the contents of the source of @tc. */
+static int preserve_memfd(struct test_case *tc, unsigned int flags,
+			  unsigned int seals)
+{
+	int fd, ret;
+
+	fd = memfd_create(tc->name, flags);
+	CHECK(fd >= 0);
+	CHECK_EQ(write_pattern(fd, 0, tc->size, tc->token), 0);
+	if (seals)
+		CHECK_EQ(do_fcntl(fd, F_ADD_SEALS, seals), 0);
+	ret = preserve_fd(fd, tc->pos, tc->token);
+	close(fd);
+
+	return ret;
+}
+
 /* Retrieve the file of @tc into a new file on a new mount at dst. */
 static int restore_verify(struct test_case *tc)
 {
@@ -560,6 +600,234 @@ static int linked_target_verify(struct test_case *tc)
 	return KSFT_PASS;
 }
 
+static int memfd_preserve(struct test_case *tc)
+{
+	return preserve_memfd(tc, 0, 0);
+}
+
+static int memfd_verify(struct test_case *tc)
+{
+	struct stat st;
+	int fd;
+
+	/* memfds are only retrieved as memfds. */
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	CHECK_EQ(retrieve_new(tc->token, "dst"), -EINVAL);
+	CHECK_EQ(mnt_used("dst"), 0);
+
+	fd = luo_session_retrieve_fd(session_fd, tc->token);
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+	CHECK(!fstat(fd, &st));
+	CHECK_EQ(st.st_nlink, 0);
+	CHECK_EQ(do_fcntl(fd, F_GETFL, 0) & O_ACCMODE, O_RDWR);
+
+	/* Unlike for tmpfs files, the file position is restored. */
+	CHECK_EQ(lseek(fd, 0, SEEK_CUR), tc->pos);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+#define MEMFD_SEALS		(F_SEAL_SHRINK | F_SEAL_GROW | F_SEAL_WRITE)
+
+static int sealed_memfd_preserve(struct test_case *tc)
+{
+	return preserve_memfd(tc, MFD_ALLOW_SEALING, MEMFD_SEALS);
+}
+
+static int sealed_memfd_verify(struct test_case *tc)
+{
+	void *p;
+	int fd;
+
+	fd = luo_session_retrieve_fd(session_fd, tc->token);
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+	CHECK_EQ(do_fcntl(fd, F_GET_SEALS, 0), MEMFD_SEALS);
+	CHECK_ERRNO(write(fd, "x", 1), EPERM);
+	CHECK_ERRNO(ftruncate(fd, 0), EPERM);
+	p = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	CHECK(p == MAP_FAILED && errno == EPERM);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int bad_args_verify(struct test_case *tc)
+{
+	struct {
+		struct liveupdate_shmem_retrieve_arg arg;
+		__u64 extra;
+	} big = {};
+	struct liveupdate_shmem_retrieve_arg arg;
+	int target, path_fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = new_target("dst");
+	CHECK(target >= 0);
+
+	/* Files from tmpfs mounts are only retrieved into files on tmpfs. */
+	CHECK_EQ(luo_session_retrieve_fd(session_fd, tc->token), -EINVAL);
+
+	memset(&arg, 0, sizeof(arg));
+	arg.size = sizeof(arg);
+	arg.fd = target;
+
+	/* Problems with the argument itself. */
+	arg.size = offsetof(struct liveupdate_shmem_retrieve_arg, fd);
+	CHECK_EQ(retrieve_arg(tc->token, &arg), -EINVAL);
+	arg.size = 2 * page_size;
+	CHECK_EQ(retrieve_arg(tc->token, &arg), -E2BIG);
+	arg.size = sizeof(arg);
+
+	big.arg = arg;
+	big.arg.size = sizeof(big);
+	big.extra = 1;
+	CHECK_EQ(retrieve_arg(tc->token, &big.arg), -E2BIG);
+
+	/* Problems with the file descriptor. */
+	arg.fd = -1;
+	CHECK_EQ(retrieve_arg(tc->token, &arg), -EBADF);
+	path_fd = reopen_fd(target, O_PATH);
+	CHECK(path_fd >= 0);
+	arg.fd = path_fd;
+	CHECK_EQ(retrieve_arg(tc->token, &arg), -EBADF);
+	close(path_fd);
+	arg.fd = target;
+
+	CHECK_EQ(retrieve_arg(tc->token + 1, &arg), -ENOENT);
+	CHECK_EQ(file_size(target), 0);
+	CHECK_EQ(mnt_used("dst"), 0);
+
+	/* The failures didn't consume the preserved file. */
+	CHECK_EQ(retrieve_arg(tc->token, &arg), target);
+	TRY(check_restored(tc, target));
+
+	close(target);
+	return KSFT_PASS;
+}
+
+static int retrieve_twice_verify(struct test_case *tc)
+{
+	struct stat st, new_st;
+	int target, fd, new_fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+
+	/* The argument only applies to the retrieve that restores the file. */
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EBUSY);
+	CHECK_EQ(file_size(target), 0);
+	close(target);
+
+	/* A plain retrieve returns the same open file. */
+	new_fd = luo_session_retrieve_fd(session_fd, tc->token);
+	CHECK(new_fd >= 0);
+	CHECK(!fstat(fd, &st));
+	CHECK(!fstat(new_fd, &new_st));
+	CHECK_EQ(new_st.st_dev, st.st_dev);
+	CHECK_EQ(new_st.st_ino, st.st_ino);
+	CHECK_EQ(lseek(new_fd, 77, SEEK_SET), 77);
+	CHECK_EQ(lseek(fd, 0, SEEK_CUR), 77);
+	CHECK_EQ(mnt_used("dst"), nr_pages(tc->size));
+
+	close(new_fd);
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int preserve_nothing(struct test_case *tc)
+{
+	return KSFT_PASS;
+}
+
+static int outgoing_session_verify(struct test_case *tc)
+{
+	struct liveupdate_shmem_retrieve_arg arg = {
+		.size = sizeof(arg),
+	};
+	int out_fd, source_fd;
+
+	out_fd = luo_create_session(dev_fd, SESSION_NAME "_outgoing_session");
+	CHECK(out_fd >= 0);
+	CHECK_EQ(mount_tmpfs("src", 16, NULL), 0);
+	source_fd = new_target("src");
+	CHECK(source_fd >= 0);
+	CHECK_EQ(luo_session_preserve_fd(out_fd, source_fd, tc->token), 0);
+
+	/* Files can only be retrieved from incoming sessions. */
+	arg.fd = new_target("src");
+	CHECK(arg.fd >= 0);
+	CHECK_EQ(luo_session_retrieve_fd_arg(out_fd, tc->token,
+					     (__u64)(uintptr_t)&arg), -EINVAL);
+
+	close(arg.fd);
+	close(source_fd);
+	close(out_fd);
+	return KSFT_PASS;
+}
+
+static int target_preserved_verify(struct test_case *tc)
+{
+	int out_fd, target;
+
+	/* A file preserved in an outgoing session can't be the target. */
+	out_fd = luo_create_session(dev_fd, SESSION_NAME "_target_preserved");
+	CHECK(out_fd >= 0);
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(luo_session_preserve_fd(out_fd, target, tc->token), 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EBUSY);
+	CHECK_EQ(file_size(target), 0);
+
+	/* Once the session is closed, the file is no longer preserved. */
+	close(out_fd);
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+	TRY(check_restored(tc, target));
+
+	close(target);
+	return KSFT_PASS;
+}
+
+static int target_retrieved_preserve(struct test_case *tc)
+{
+	TRY(preserve_source("src/target_retrieved_empty", 0, 0, tc->token));
+	return preserve_source("src/target_retrieved", tc->size, 0,
+			       tc->token + 1);
+}
+
+static int target_retrieved_verify(struct test_case *tc)
+{
+	int target, other_fd;
+
+	/* Retrieving an empty file leaves the target empty... */
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+	CHECK_EQ(file_size(target), 0);
+
+	/* ... but LUO manages the file now, so it can't be a target again. */
+	CHECK_EQ(retrieve_into(tc->token + 1, target), -EBUSY);
+	CHECK_EQ(file_size(target), 0);
+
+	/* The failure didn't consume the preserved file. */
+	other_fd = retrieve_new(tc->token + 1, "dst");
+	CHECK(other_fd >= 0);
+	CHECK_EQ(file_size(other_fd), tc->size);
+	TRY(check_contents(other_fd, tc->size, tc->token + 1));
+
+	close(other_fd);
+	close(target);
+	return KSFT_PASS;
+}
+
 static struct test_case test_cases[] = {
 	/* The restored file. */
 	{
@@ -588,6 +856,47 @@ static struct test_case test_cases[] = {
 		.size = SMALL_SIZE,
 		.verify = linked_target_verify,
 	},
+	/* memfds. */
+	{
+		.name = "memfd",
+		.size = SMALL_SIZE,
+		.pos = 700,
+		.preserve = memfd_preserve,
+		.verify = memfd_verify,
+	},
+	{
+		.name = "sealed_memfd",
+		.size = SMALL_SIZE,
+		.preserve = sealed_memfd_preserve,
+		.verify = sealed_memfd_verify,
+	},
+	/* Interactions with LUO. */
+	{
+		.name = "bad_args",
+		.size = SMALL_SIZE,
+		.verify = bad_args_verify,
+	},
+	{
+		.name = "retrieve_twice",
+		.size = SMALL_SIZE,
+		.verify = retrieve_twice_verify,
+	},
+	{
+		.name = "outgoing_session",
+		.preserve = preserve_nothing,
+		.verify = outgoing_session_verify,
+	},
+	{
+		.name = "target_preserved",
+		.size = SMALL_SIZE,
+		.verify = target_preserved_verify,
+	},
+	{
+		.name = "target_retrieved",
+		.size = SMALL_SIZE,
+		.preserve = target_retrieved_preserve,
+		.verify = target_retrieved_verify,
+	},
 };
 
 static long read_taint(void)
@@ -617,6 +926,7 @@ static void setup(int luo_fd)
 {
 	unsigned int i;
 
+	dev_fd = luo_fd;
 	page_size = getpagesize();
 	umask(TEST_UMASK);
 
-- 
2.56.0.542.g3ef89b7020-goog

