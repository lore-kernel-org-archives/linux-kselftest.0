Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356670;
	b=lAyggIASriUVYhr8hiuM1KsDgAkz/TUr355HPSRnRAxTwvXqRpPntLeUyGMsRZa1RvCO
	 QHc+RuqpDxwJwmvZYHgzEfOv8rNOZ0DudHctq54c34HwwTB1g2t5WwHqt5nzteNF8J8WO
	 Z0W2Rcgjgy+CvPofGqPM6P4XeBILEU1sCLr6wNYHqV4cHfI4ZvPWuiewWccaiioku5ctJ
	 VGZCoOm32AwKjnsG4t5hnCHT5ZshROP1l7rZ6ylV2KHP9t77KHBsBtw1ZqRZ/o1/n+h6B
	 P76hrTHfSf9E4HY+JBuI9C8R6dtl9KoY4tp7KpZR0GDgVFnb/3gccv6+wrIykxCjYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=i6UwDZkR60zC1jRdfetesrUGnOJ3v7sbV3p0GqEZ7UY=;
	b=sLIfysceZcblBhI4ooelrtc+mj7Bci6Yc3CDeXsVXswj2wrg26GxtRDFIsuoF2RfRXoW
	 KXPYcEvWuMTWt52aaxg0DFAQ8aRnXnhh3GDSEi/2/2gP/a1e+8WPlt5i83myIbBCma3+s
	 n+gSUklMhrfednOL3QJ2YHpL7hjG1O24q7HERq2ZPzTOOQ8ML4GK8b9nV5EwKoXsYT9On
	 iBDV9/LHzAQawJ2O2IuXP7qsW130/GVUF7DhJcj0Z2m13Joql0lrE8xOBQ2jJTpgnQaxf
	 kVK7qvh2O0FetmINIr1Girvk1N9LRcD4Zlov9M8PYDpsT7bPZ0KZvcDh5K3OKD/7Ruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JGM0gHvX;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF10C60700B8
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF10C60700B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JGM0gHvX
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c55ba309c2so3202405b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356669; x=1794961469; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6UwDZkR60zC1jRdfetesrUGnOJ3v7sbV3p0GqEZ7UY=;
        b=JGM0gHvX/G7BbRdeuyC61/6m3bQFybn5glgwyfuuOIeyTVYWoqOujPRQ62U0rE7qc9
         giPo6tsqTfrCTtjpUv4zTfMD6pnknqJXzkTsp/KqctJAG+/iobHHyIiF0E2PdfeZnsnZ
         RmzFwISo4CR7k+B1n/lND/vsKCY4hHMSHdfrY7SKwxwbDf62Sh6IsVu7R3hCNgX94HxV
         1dYjQu6UUoZ0PNmN7cURq2LnATjO/k3mEE91iLcEstOWnTj0sklMypArOl19Zbsb6O2u
         /oCDvPNuCQEihWXcRFZJnmB6PlNXrhd7Zaf3Jq38XdEXmTdvnYUSubq7SYt+sPxDbuYC
         /7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356669; x=1794961469;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6UwDZkR60zC1jRdfetesrUGnOJ3v7sbV3p0GqEZ7UY=;
        b=1GTepL/ZI5yfeYgqvCp2SVNOMZAQUiC9nj67cM2ykzXWpJEZltyt1TFzLhblZfvCo3
         1arF0Lb8jLyqMydlmOD+8NgCt1Kuvui7pAhZVspNC0ZNQ1vvoSABNvOhvKE8ENUd/l3x
         MOE6O1/iv4jZz56EDl2C1veVxRJ0xfdmxupSTeMGfsnn3K/vaWGOAnKES8U24nvzX1U8
         9R9wT8fQjpheT1PTTSsXtkGWBb6VpIsAo9VIpp8wzcl5c/I7YJqsboEeK5YODFvxASZZ
         eF9evR2EYs5OF+zEqZuJy8FjhPJ4BAwy8Cs3ozivyKX+PMcbU8el30yU1zTgiDBCVIXX
         GViw==
X-Forwarded-Encrypted: i=1; AL+hErEhp+H2nj0jGjwmEzIVGg4u/6QSlIbjodKOZZ51EsJv+9u/hJbg6Z80xwLwFC+C1HJkP+vmzFxGt5Rj1u+5Xc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AcOJJWx4uTCemf33j3k/jKJxVauVV6zyGZM/KRPjTs4PtSZlk
	PCz39UaBI2nhnt+z6YhE1tsKRunMBCili7HPk8/qrJYKJoW2/kZE/7prAcebrgA4N8/9YcV9vLp
	Cx3OCVWWSHGMxDw==
X-Received: from jahl24-n2.prod.google.com ([2002:a05:6638:8c18:20b0:61c:f613:9335])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c1b2:b0:4d6:90f4:48ab with SMTP id 5614622812f47-56b97c18413mr582521b6e.45.1794356668774;
 Tue, 10 Nov 2026 16:24:28 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:55 +0000
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
Message-ID: <20261111002358.1842967-18-dmatlack@google.com>
Subject: [PATCH v4 17/19] selftests/liveupdate: Test the targets of retrieved
 tmpfs files
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

Add test cases to luo_tmpfs for the file that a tmpfs file is retrieved
into. It must be opened for writing, but can be write-only, and it keeps
its file status flags. It must be an empty regular file on a tmpfs
mount, so files with data, a size or blocks past the end of the file are
rejected, and so are memfds, pipes, directories and immutable files. All
of these failures can be retried with another file.

Also check that an unprivileged process can retrieve into a file it
created, which keeps its owner and mode, that a running binary can be
preserved through a read-only fd, and that the retrieved binary can't be
executed until the session is finished, since LUO keeps it open for
writing until then. The exec test case runs a copy of the test binary.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 490 +++++++++++++++++-
 1 file changed, 488 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/luo_tmpfs.c b/tools/testing/selftests/liveupdate/luo_tmpfs.c
index 91a607752ee2..2d6dd8f0e138 100644
--- a/tools/testing/selftests/liveupdate/luo_tmpfs.c
+++ b/tools/testing/selftests/liveupdate/luo_tmpfs.c
@@ -69,8 +69,13 @@
 
 #define SMALL_SIZE		8192
 #define SPARSE_PAGES		8
+#define NOBODY			65534
 #define TEST_UMASK		022
 
+/* The exec case runs a copy of this test with EXEC_ARG, see exec_main(). */
+#define EXEC_ARG		"--exec"
+#define EXEC_STATUS		200
+
 /* TAINT_BAD_PAGE, TAINT_DIE and TAINT_WARN. */
 #define BAD_TAINT		((1L << 5) | (1L << 7) | (1L << 9))
 
@@ -129,8 +134,12 @@ struct test_case {
 	int (*preserve)(struct test_case *tc);
 	/* Stage 2: Retrieve the files and check them. */
 	int (*verify)(struct test_case *tc);
+	/* Stage 2: Optional checks after the session is finished. */
+	int (*after_finish)(struct test_case *tc);
 	/* The tokens of the case are token to token + 0xff. */
 	__u64 token;
+	/* State kept from verify() for after_finish(). */
+	int result;
 };
 
 static unsigned long page_size;
@@ -143,6 +152,11 @@ static int do_fcntl(int fd, int cmd, long arg)
 	return syscall(__NR_fcntl, fd, cmd, arg);
 }
 
+static int do_fallocate(int fd, int mode, off_t offset, off_t len)
+{
+	return syscall(__NR_fallocate, fd, mode, offset, len);
+}
+
 static int do_mount(const char *source, const char *target, const char *type,
 		    unsigned long flags, const char *data)
 {
@@ -437,6 +451,200 @@ static int preserve_memfd(struct test_case *tc, unsigned int flags,
 	return ret;
 }
 
+static int drop_privileges(void)
+{
+	CHECK_EQ(syscall(__NR_setgroups, 0, NULL), 0);
+	CHECK_EQ(syscall(__NR_setresgid, NOBODY, NOBODY, NOBODY), 0);
+	CHECK_EQ(syscall(__NR_setresuid, NOBODY, NOBODY, NOBODY), 0);
+	return KSFT_PASS;
+}
+
+/* Run @fn(@tc) in a child process, and return its result. */
+static int run_child(int (*fn)(struct test_case *tc), struct test_case *tc)
+{
+	int status, ret;
+	pid_t pid;
+
+	fflush(stdout);
+	pid = fork();
+	CHECK(pid >= 0);
+	if (!pid) {
+		ret = fn(tc);
+		fflush(stdout);
+		_exit(ret);
+	}
+
+	CHECK_EQ(waitpid(pid, &status, 0), pid);
+	CHECK(WIFEXITED(status));
+	return WEXITSTATUS(status);
+}
+
+/*
+ * A copy of this test that is executed with EXEC_ARG writes a 0 byte to stdout
+ * once it runs, and exits with EXEC_STATUS once stdin is closed.
+ */
+static int exec_main(void)
+{
+	char c;
+
+	if (write(STDOUT_FILENO, "", 1) != 1)
+		return 1;
+
+	while (read(STDIN_FILENO, &c, 1) > 0)
+		continue;
+
+	return EXEC_STATUS;
+}
+
+/* Copy the binary of this test to a new file at @path. */
+static int copy_self(const char *path)
+{
+	static char buf[65536];
+	int in_fd, out_fd;
+	ssize_t len;
+
+	in_fd = open("/proc/self/exe", O_RDONLY);
+	CHECK(in_fd >= 0);
+	out_fd = open(path, O_CREAT | O_EXCL | O_WRONLY, 0755);
+	CHECK(out_fd >= 0);
+
+	while ((len = read(in_fd, buf, sizeof(buf))) > 0)
+		CHECK_EQ(write(out_fd, buf, len), len);
+	CHECK_EQ(len, 0);
+
+	close(out_fd);
+	close(in_fd);
+	return KSFT_PASS;
+}
+
+/* Return the number of pages of the binary of this test. */
+static long self_pages(void)
+{
+	struct stat st;
+
+	if (stat("/proc/self/exe", &st))
+		return -1;
+
+	return nr_pages(st.st_size);
+}
+
+/* Check that @fd has the contents of the binary of this test. */
+static int check_self(int fd)
+{
+	long long size = file_size(fd);
+	void *p, *self;
+	int self_fd;
+
+	self_fd = open("/proc/self/exe", O_RDONLY);
+	CHECK(self_fd >= 0);
+	CHECK(size > 0);
+	CHECK_EQ(file_size(self_fd), size);
+
+	p = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
+	CHECK(p != MAP_FAILED);
+	self = mmap(NULL, size, PROT_READ, MAP_SHARED, self_fd, 0);
+	CHECK(self != MAP_FAILED);
+	CHECK(!memcmp(p, self, size));
+
+	munmap(self, size);
+	munmap(p, size);
+	close(self_fd);
+	return KSFT_PASS;
+}
+
+/*
+ * Execute the copy of this test at @path and wait until it runs. Return the
+ * write end of its stdin, which ends it when closed, or -errno if it can't be
+ * executed.
+ */
+static int start_exe(const char *path, pid_t *pid)
+{
+	char *const argv[] = { (char *)path, EXEC_ARG, NULL };
+	char *const envp[] = { NULL };
+	unsigned char err = EIO;
+	int in[2], out[2], status;
+
+	if (pipe2(in, O_CLOEXEC) || pipe2(out, O_CLOEXEC))
+		return -errno;
+
+	fflush(stdout);
+	*pid = fork();
+	if (!*pid) {
+		if (dup2(in[0], STDIN_FILENO) >= 0 &&
+		    dup2(out[1], STDOUT_FILENO) >= 0)
+			execve(path, argv, envp);
+
+		/* Report the error instead of the 0 byte from exec_main(). */
+		err = errno;
+		if (write(out[1], &err, 1) != 1)
+			_exit(2);
+		_exit(1);
+	}
+
+	close(in[0]);
+	close(out[1]);
+	if (*pid > 0 && read(out[0], &err, 1) != 1)
+		err = EIO;
+	close(out[0]);
+	if (!err)
+		return in[1];
+
+	close(in[1]);
+	if (*pid > 0)
+		waitpid(*pid, &status, 0);
+	return -err;
+}
+
+/* End a program started by start_exe() and check its exit status. */
+static int stop_exe(pid_t pid, int stdin_fd)
+{
+	int status;
+
+	close(stdin_fd);
+	CHECK_EQ(waitpid(pid, &status, 0), pid);
+	CHECK(WIFEXITED(status));
+	CHECK_EQ(WEXITSTATUS(status), EXEC_STATUS);
+	return KSFT_PASS;
+}
+
+/* Execute the copy of this test at @path. Return 0 or -errno. */
+static int run_exe(const char *path)
+{
+	pid_t pid = -1;
+	int stdin_fd;
+
+	stdin_fd = start_exe(path, &pid);
+	if (stdin_fd < 0)
+		return stdin_fd;
+
+	return stop_exe(pid, stdin_fd) == KSFT_PASS ? 0 : -ECHILD;
+}
+
+/*
+ * Preserve a copy of the binary of this test while it runs, through a
+ * read-only fd, since it can't be opened for writing.
+ */
+static int preserve_running_exe(struct test_case *tc)
+{
+	int fd, stdin_fd;
+	char path[128];
+	pid_t pid;
+
+	snprintf(path, sizeof(path), "src/%s", tc->name);
+	TRY(copy_self(path));
+
+	stdin_fd = start_exe(path, &pid);
+	CHECK(stdin_fd >= 0);
+	CHECK_ERRNO(open(path, O_RDWR), ETXTBSY);
+
+	fd = open(path, O_RDONLY);
+	CHECK(fd >= 0);
+	CHECK_EQ(luo_session_preserve_fd(session_fd, fd, tc->token), 0);
+	close(fd);
+
+	return stop_exe(pid, stdin_fd);
+}
+
 /* Retrieve the file of @tc into a new file on a new mount at dst. */
 static int restore_verify(struct test_case *tc)
 {
@@ -600,6 +808,229 @@ static int linked_target_verify(struct test_case *tc)
 	return KSFT_PASS;
 }
 
+/* Set the inode flag @flag, e.g. FS_IMMUTABLE_FL, on the file at @path. */
+static int set_inode_flag(const char *path, int flag)
+{
+	int fd, flags, ret = 0;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	if (ioctl(fd, FS_IOC_GETFLAGS, &flags)) {
+		ret = -errno;
+	} else {
+		flags |= flag;
+		if (ioctl(fd, FS_IOC_SETFLAGS, &flags))
+			ret = -errno;
+	}
+
+	close(fd);
+	return ret;
+}
+
+static int target_rdonly_verify(struct test_case *tc)
+{
+	int target, rd_fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = new_target("dst");
+	CHECK(target >= 0);
+	rd_fd = reopen_fd(target, O_RDONLY);
+	CHECK(rd_fd >= 0);
+
+	/* The target must be opened for writing. */
+	CHECK_EQ(retrieve_into(tc->token, rd_fd), -EBADF);
+	CHECK_EQ(file_size(target), 0);
+
+	/* The failure didn't consume the preserved file. */
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+	TRY(check_restored(tc, target));
+
+	close(rd_fd);
+	close(target);
+	return KSFT_PASS;
+}
+
+static int target_wronly_verify(struct test_case *tc)
+{
+	int target, rd_fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = open("dst", O_TMPFILE | O_WRONLY | O_APPEND, 0644);
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+
+	/* The target keeps its flags. */
+	CHECK_EQ(do_fcntl(target, F_GETFL, 0) & (O_ACCMODE | O_APPEND),
+		 O_WRONLY | O_APPEND);
+	CHECK_EQ(file_size(target), tc->size);
+
+	rd_fd = reopen_fd(target, O_RDONLY);
+	CHECK(rd_fd >= 0);
+	TRY(check_contents(rd_fd, tc->size, tc->token));
+
+	close(rd_fd);
+	close(target);
+	return KSFT_PASS;
+}
+
+static int target_not_empty_verify(struct test_case *tc)
+{
+	int target, fd;
+
+	/* The target must be empty: It can't have data... */
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(write(target, "x", 1), 1);
+	CHECK_EQ(retrieve_into(tc->token, target), -EINVAL);
+	close(target);
+
+	/* ... a size... */
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(ftruncate(target, page_size), 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EINVAL);
+	close(target);
+
+	/* ... or blocks past the end of the file. */
+	target = new_target("dst");
+	CHECK(target >= 0);
+	CHECK_EQ(do_fallocate(target, FALLOC_FL_KEEP_SIZE, 0, page_size), 0);
+	CHECK_EQ(file_size(target), 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EINVAL);
+	close(target);
+
+	/* The failures didn't consume the preserved file. */
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int target_not_tmpfs_verify(struct test_case *tc)
+{
+	int target, pipe_fds[2], fd;
+
+	/* Like the preserved file, the target must be on a tmpfs mount. */
+	target = memfd_create(tc->name, 0);
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EINVAL);
+	close(target);
+
+	CHECK_EQ(pipe2(pipe_fds, O_CLOEXEC), 0);
+	CHECK_EQ(retrieve_into(tc->token, pipe_fds[1]), -EINVAL);
+	close(pipe_fds[0]);
+	close(pipe_fds[1]);
+
+	/* It must also be a regular file. */
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = open("dst", O_RDONLY | O_DIRECTORY);
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), -EINVAL);
+	close(target);
+
+	/* The failures didn't consume the preserved file. */
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int target_immutable_verify(struct test_case *tc)
+{
+	int target, fd, ret;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	target = open("dst/f", O_CREAT | O_EXCL | O_RDWR, 0644);
+	CHECK(target >= 0);
+	ret = set_inode_flag("dst/f", FS_IMMUTABLE_FL);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP) {
+		ksft_print_msg("%s: FS_IOC_SETFLAGS is not supported\n",
+			       tc->name);
+		close(target);
+		return KSFT_SKIP;
+	}
+	CHECK_EQ(ret, 0);
+
+	/* An immutable file can't be the target, even if opened before. */
+	CHECK_EQ(retrieve_into(tc->token, target), -EPERM);
+	CHECK_EQ(file_size(target), 0);
+	close(target);
+
+	/* The failure didn't consume the preserved file. */
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	TRY(check_restored(tc, fd));
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int unprivileged_child(struct test_case *tc)
+{
+	struct stat st;
+	int target;
+
+	TRY(drop_privileges());
+
+	/* The file keeps the owner and mode it was created with. */
+	target = open("dst/nobody", O_TMPFILE | O_RDWR, 0600);
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+	TRY(check_restored(tc, target));
+	CHECK(!fstat(target, &st));
+	CHECK_EQ(st.st_uid, NOBODY);
+	CHECK_EQ(st.st_gid, NOBODY);
+	CHECK_EQ(st.st_mode & 07777, 0600);
+
+	close(target);
+	return KSFT_PASS;
+}
+
+static int unprivileged_verify(struct test_case *tc)
+{
+	CHECK_EQ(mount_tmpfs("dst", 16, "mode=0755"), 0);
+	CHECK_EQ(mkdir("dst/nobody", 0755), 0);
+	CHECK_EQ(chown("dst/nobody", NOBODY, NOBODY), 0);
+
+	return run_child(unprivileged_child, tc);
+}
+
+static int exec_verify(struct test_case *tc)
+{
+	long pages = self_pages();
+	int target;
+
+	CHECK(pages > 0);
+	CHECK_EQ(mount_tmpfs("dst", pages, NULL), 0);
+	target = open("dst", O_TMPFILE | O_RDWR, 0755);
+	CHECK(target >= 0);
+	CHECK_EQ(retrieve_into(tc->token, target), target);
+	TRY(check_self(target));
+	CHECK_EQ(mnt_used("dst"), pages);
+	CHECK_EQ(link_fd(target, "dst/exe"), 0);
+	close(target);
+
+	/*
+	 * LUO keeps the file open for writing until the session is finished,
+	 * so the binary can't be executed before that.
+	 */
+	CHECK_EQ(run_exe("dst/exe"), -ETXTBSY);
+	return KSFT_PASS;
+}
+
+static int exec_after_finish(struct test_case *tc)
+{
+	CHECK_EQ(run_exe("dst/exe"), 0);
+	return KSFT_PASS;
+}
+
 static int memfd_preserve(struct test_case *tc)
 {
 	return preserve_memfd(tc, 0, 0);
@@ -856,6 +1287,43 @@ static struct test_case test_cases[] = {
 		.size = SMALL_SIZE,
 		.verify = linked_target_verify,
 	},
+	/* The target file. */
+	{
+		.name = "target_rdonly",
+		.size = SMALL_SIZE,
+		.verify = target_rdonly_verify,
+	},
+	{
+		.name = "target_wronly",
+		.size = SMALL_SIZE,
+		.verify = target_wronly_verify,
+	},
+	{
+		.name = "target_not_empty",
+		.size = SMALL_SIZE,
+		.verify = target_not_empty_verify,
+	},
+	{
+		.name = "target_not_tmpfs",
+		.size = SMALL_SIZE,
+		.verify = target_not_tmpfs_verify,
+	},
+	{
+		.name = "target_immutable",
+		.size = SMALL_SIZE,
+		.verify = target_immutable_verify,
+	},
+	{
+		.name = "unprivileged",
+		.size = SMALL_SIZE,
+		.verify = unprivileged_verify,
+	},
+	{
+		.name = "exec",
+		.preserve = preserve_running_exe,
+		.verify = exec_verify,
+		.after_finish = exec_after_finish,
+	},
 	/* memfds. */
 	{
 		.name = "memfd",
@@ -987,7 +1455,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	long taint = read_taint();
 	unsigned int i, nr_tests;
 	struct test_case *tc;
-	int stage;
+	int stage, ret;
 
 	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
 	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
@@ -1001,6 +1469,8 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_NAME);
 
 	nr_tests = ARRAY_SIZE(test_cases) + 1;
+	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
+		nr_tests += !!test_cases[i].after_finish;
 
 	ksft_print_header();
 	ksft_set_plan(nr_tests);
@@ -1008,13 +1478,26 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
 		tc = &test_cases[i];
 		enter_case_dir(tc);
-		ksft_test_result_report(tc->verify(tc), "%s\n", tc->name);
+		tc->result = tc->verify(tc);
+		ksft_test_result_report(tc->result, "%s\n", tc->name);
 	}
 
 	if (luo_session_finish(session_fd))
 		fail_exit("luo_session_finish for '%s'", SESSION_NAME);
 	close(session_fd);
 
+	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
+		tc = &test_cases[i];
+		if (!tc->after_finish)
+			continue;
+
+		enter_case_dir(tc);
+		ret = KSFT_SKIP;
+		if (tc->result == KSFT_PASS)
+			ret = tc->after_finish(tc);
+		ksft_test_result_report(ret, "%s_after_finish\n", tc->name);
+	}
+
 	if (chdir("/") || syscall(__NR_umount2, TEST_DIR, MNT_DETACH) ||
 	    rmdir(TEST_DIR))
 		fail_exit("Failed to clean up %s", TEST_DIR);
@@ -1033,6 +1516,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 int main(int argc, char *argv[])
 {
+	if (argc == 2 && !strcmp(argv[1], EXEC_ARG))
+		return exec_main();
+
 	return luo_test(argc, argv, STATE_SESSION_NAME,
 			run_stage_1, run_stage_2);
 }
-- 
2.56.0.542.g3ef89b7020-goog

