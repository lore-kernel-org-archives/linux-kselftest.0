Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11A476684;
	Mon, 31 Aug 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192310; cv=none; b=b/agVBD8L26nh6SehvfGwILw9oRoO9LFRukD55z1IA6aC4PcUghK154nMwmBpB8sy6h5m4izyfkw//04JSdyTX30nmGQ+i3IwZp42mGJkWPtXW1erPmFW3vg8b3lN6rNMPSwmCKdl0wdZqgwN2Nc8KfHyrnnUG1qs1vvC2AErTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192310; c=relaxed/simple;
	bh=csydGn/7BD/hARHg0LOa5fdhTb/AEwCDcfkYU2foV64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNQAz+9fG9KMDe+IUoBUB5enl4fVoCGdSaFLJzWDgyDJU5qF5l46mCyASxROrya0FZgc9zyjuRHDCL6FE8i1RYXgVnLIDEKAc1v2i3++S/HOkBugrz0PGT+YG6DaA1BlEAfsIJdmD1GxxN9xYOZeY4uaQT50RCyvtFAHj775rSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XrSEttDP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XrSEttDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788192307;
	bh=csydGn/7BD/hARHg0LOa5fdhTb/AEwCDcfkYU2foV64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XrSEttDP9cKf4lUDrLe1BpD3/j6oEBVZLxnfs1MiuTnKgqXdwyQ7o/YIBBn37RSuA
	 gbD3HGvwJmUrzTP21wLdIGQFx0ycwJnDIUtTYcLINs0lccvOXs6r0B88eK9ZdWIIzD
	 d7+BA/bNUmLcDDhrxbaBzqX6ksRyA/Fyb5vbSzS4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 31 Aug 2026 18:05:00 +0200
Subject: [PATCH 2/3] selftests/nolibc: validate ENOTDIR return values from
 opendir()/fdopendir()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-nolibc-fdopendir-enotdir-v1-2-8cf0e79c4e6f@weissschuh.net>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
In-Reply-To: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788192306; l=1955;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=csydGn/7BD/hARHg0LOa5fdhTb/AEwCDcfkYU2foV64=;
 b=Wy/IFc6G1MHqNxXW0zXuiHZ8F6SR4plymt6rK/IhXTn1MvVLtv5avY8zlrcx5MV0pfT8E5zVR
 fPytW+LA/F2DjIrf2U6dd8xA5uqM7zkWwJ/Q/xIGBI14CabImKujq/0
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Make sure that ENOTDIR is detected already during directory opening.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 0a8fe5100b7f..7091f63f3b25 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1711,6 +1711,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(execve_root);       EXPECT_SYSER(1, execve("/", (char*[]){ [0] = (char []){"/"}, [1] = NULL }, NULL), -1, EACCES); break;
 		CASE_TEST(fchdir_stdin);      EXPECT_SYSER(1, fchdir(STDIN_FILENO), -1, ENOTDIR); break;
 		CASE_TEST(fchdir_badfd);      EXPECT_SYSER(1, fchdir(-1), -1, EBADF); break;
+		CASE_TEST(fdopendir_notdir);  EXPECT_SYSER(1, (uintptr_t)fdopendir(STDIN_FILENO), (uintptr_t)NULL, ENOTDIR); break;
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
 		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
 		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
@@ -1739,6 +1740,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", O_RDONLY), -1, ENOENT); if (tmp != -1) close(tmp); break;
 		CASE_TEST(openat_dir);        EXPECT_SYSZR(1, test_openat()); break;
 		CASE_TEST(open_mode);         EXPECT_SYSZR(1, test_open_mode()); break;
+		CASE_TEST(opendir_notdir);    EXPECT_SYSER(1, (uintptr_t)opendir("/dev/stdin"), (uintptr_t)NULL, ENOTDIR); break;
 		CASE_TEST(pipe);              EXPECT_SYSZR(1, test_pipe()); break;
 		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
 		CASE_TEST(poll_stdout);       EXPECT_SYSNE(1, ({ struct pollfd fds = { 1, POLLOUT, 0}; poll(&fds, 1, 0); }), -1); break;

-- 
2.55.0

