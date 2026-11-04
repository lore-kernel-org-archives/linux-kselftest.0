Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826562;
	b=TcaVBxDCeYVhaey6Wba61YKGdRfJFJK5eUPuRNWCSBzusCxhtLHje6VtyQEXd8oqWRqQ
	 bX6q5R2ehY4rG0Sj+SH04paVcxrgHNZfX94b5BJho8e0Ul2+yCQUZ/pw/TOZtS4m27HRE
	 Nf8vlXgaAVaUfpx/9jt78P4stpcGN0uLWwYBsDnRBBkurdEu//cFRFcuaNaNUm/brjM4f
	 ATTVQtx09WUuemqbwJxj11wUgwTNpj4kQcvBsR0NrCsOELpQ2YnvZUubkjb9efGQo7kIF
	 2k9gx6B0qcEE55dzWNZR6/CA+i/aV931QCQAayMwCKXC2RQw7/tyrXGoLXIuNgYK7sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X9wnpJsazkN5foWhabxg0QWUZDXf9PEJ3m6VtZwLNVE=;
	b=unv3kp8PmzM7IznDmmzQXojy7GVJFufP4rbPAEH9j5WogrIWdG84ku1MAaBc2Akc4m0s
	 gJiPmflsk5Av6SHBF1TrL01HIZPmiW2hQQHUatIUytKIkNkUPkJI/N6n2PzkxHiMc5OCF
	 9PF+xTPWeWrVFT7ggSxJL82W9Bcy/GTdpPE7bQdLAOrISZHCZgDPgamOWh0aB2VGkGQmc
	 S2LUpWFk8A9qLVMptvN+NULt1EFOxZcziVJ7U7A7CPb8vdUV2eU2eGijkqcopuVjz+/f6
	 /NdvU4TM90+OXlDymbSoPegZClLW5Kp6pHKdI7UwtE5tj/QypRocc/DWLm2KPBWIAzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTOXDZr5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295EC60EA985
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295EC60EA985
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTOXDZr5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13129595e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826559; x=1794431359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9wnpJsazkN5foWhabxg0QWUZDXf9PEJ3m6VtZwLNVE=;
        b=LTOXDZr5bLktgK4avwYS9F/zbl+kahrT6v5PeXdFUGhBi83GXjDQgEb3rwI+1EolRm
         eOv7aNNuPo+vZIYwCTJ1G2HdFxD/IHyz16btWou1HvdDhyu5jO8dnkoyvHlzqySQeZQx
         RA0EyJrCzZz1OpIcAuhJxJc3ZMSFM2BBNvHRE7HS4RYscwgX+FLutAZEhEzUY0fga0TP
         +IC4ceEY+ZWGdzCKLo4NAXSdqt/rxYt22DJifSvRC7drARWdepAaT8Hg3elaFGxYOyLi
         6bPWeZzIYCWNDJ1sLJunStnZN7tmWCQSq35A5+WNQHlWrpmx+mEnywfVmaPb3jWaan9P
         jC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826559; x=1794431359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9wnpJsazkN5foWhabxg0QWUZDXf9PEJ3m6VtZwLNVE=;
        b=BQCCUO4ulErdJaavKJzSYETinPoL0/6gnmZ1fCxTVddGLL1Jokewytjm7NgL39cgf+
         34SxDVffssZ0WeylKeq2Gdqb56fmOkfMLkGMdg3jWDAfJBbA8cBuvkOjDxQ68CgkWXdu
         80HbcbP3McTTQWqRs9TPrvkCJwG+WqHB8gEOYy3yjWYgs8MGsm+MZl3w3nvcgRkQxi0/
         Rcg9r7Dxq/shcBMH71mSn4Nl0HyDxPyMFVSZI5SeXC8nIWOP1qMIt6hwYBNryfU+KQUV
         Nl4cNalsDoYsOsP0g4k0rwE06ybps06hEQ4RsuYUq79Oz7f2t0RswzAJpV9XPJ/JxbAW
         msdw==
X-Forwarded-Encrypted: i=1; AKwUvBxRwrQwO1js5ycT4UgJ58VJaylXUZhMVgD+1xpHCX10ECyX1/gVs1uUvyoR4S8mQvZ8jnCWKs0EcvQ8GioBHWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nCdtercUxRCvvFeDCv/gPrpNi+LJGNnFjyhBPmUoDZnQbeDQj
	FBnKbaqsYlbQguLu78GJ31pd9Ohp6HV819AfKH7vk0oTmXYEZ5BTa+p9n5+C/h5h
X-Gm-Gg: AYBFou0NXoKog9NayGEOGyskdULKZBQV8hhdEp7xl23eAe70TTavUS9gI7znp0Lc0AW
	bBAc/os/Zx6hnP8qKUEe8mVJzuao4My4gpNx+PfD2Owv+g+wXbuWQfJEYHtstfTeM9SrcjQx2Hk
	bftXHx1ribm1zGVcmg+70J0dtNSgORQOQYeMkerY9QVgVKFyJ8hITF0eqy/KMGfZybyaHxv1fa5
	EX1BH7ljHzz0jaAzmQhUTwMKoaCXDRxzesp7rdti2hVuVhqUGRfR24RWRo8I0jrK74pgLL7iP3R
	+pnTreN986/kZ1cg1B2RBfc5YpzBlyO+r8XIun6yiTuxFRL10IM+OUjUpMKT2mFpHYmVVYNx3zR
	o4r0x31TAaW32ZxqKAdMxDrmZwCZGaattLdzb9cXbc3SGVrf7tGxF0Kyppm9GNRXeuNmGC+ErOJ
	fF+uS2FHEx6aJczMAEq5ZZ/Kb26C++RuXdmzgG6yKaEjvNcMSQLDK2aGPxTuYVA1Ye3U5K77j8m
	nhFGTQUe2ckJ8lR/if2SKSrSMmtYoNeVo/c+MhtP51Jy9BnSH5uwVAjrNMXzduJlAi4RgSBfDhE
	XQ7x7PLhyRV3EB+LJyY+D5Ekw1I/vJqChb3uz/VKVh8BS/VnGrdLFDJT1RGPfwH+2Ca4qtTT6u4
	=
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr422739115e9.6.1793826559506;
        Wed, 04 Nov 2026 13:09:19 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca2a4fsm12965075e9.15.2026.11.04.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:19 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:01 +0100
Subject: [PATCH v2 15/27] selftests/landlock: Close leaked file descriptors
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-15-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Several tests do not close file descriptors they open: the /dev/null FD
in restrict_self_fd and restrict_self_fd_flags, and the parent's ends
of the synchronization pipes in various ptrace, audit, signal and
abstract UNIX socket tests.

Close them once they are not needed anymore.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c                |  2 ++
 tools/testing/selftests/landlock/base_test.c                 |  4 ++++
 tools/testing/selftests/landlock/ptrace_test.c               |  4 ++++
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 10 ++++++++++
 tools/testing/selftests/landlock/scoped_signal_test.c        |  1 +
 5 files changed, 21 insertions(+)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 325fbb9ca297..b38d0c5d5869 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -977,6 +977,8 @@ TEST_F(audit_exec, signal_and_open)
 
 	/* Waits for the child to terminate. */
 	EXPECT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	ASSERT_EQ(1, WIFEXITED(status));
 	ASSERT_EQ(0, WEXITSTATUS(status));
diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index 0bf8632b725f..a6d355807dab 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -352,6 +352,8 @@ TEST(restrict_self_fd)
 
 	EXPECT_EQ(-1, landlock_restrict_self(fd, 0));
 	EXPECT_EQ(EBADFD, errno);
+
+	EXPECT_EQ(0, close(fd));
 }
 
 TEST(restrict_self_fd_flags)
@@ -373,6 +375,8 @@ TEST(restrict_self_fd_flags)
 	EXPECT_EQ(-1, landlock_restrict_self(
 			      fd, LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS));
 	EXPECT_EQ(EBADFD, errno);
+
+	EXPECT_EQ(0, close(fd));
 }
 
 TEST(restrict_self_flags)
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index eb36d4d1ceaf..4fd2b440aa45 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -288,6 +288,8 @@ TEST_F(scoped_domains, trace)
 
 	/* Signals that the parent PTRACE_ATTACH test is done. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 
 	if (WIFSIGNALED(status) || !WIFEXITED(status) ||
@@ -422,6 +424,8 @@ TEST_F(audit, trace)
 
 	/* Signals that the parent PTRACE_ATTACH test is done. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	if (WIFSIGNALED(status) || !WIFEXITED(status) ||
 	    WEXITSTATUS(status) != EXIT_SUCCESS)
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 67fcc3380238..df41da5f2ab0 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -156,6 +156,7 @@ TEST_F(scoped_domains, connect_to_parent)
 
 	/* Signals to child that the parent is listening. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
 
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	EXPECT_EQ(0, close(stream_server));
@@ -263,6 +264,8 @@ TEST_F(scoped_domains, connect_to_child)
 		EXPECT_EQ(EPERM, errno_dgram);
 	}
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 	EXPECT_EQ(0, close(stream_client));
 	EXPECT_EQ(0, close(dgram_client));
 
@@ -433,6 +436,8 @@ TEST_F(scoped_audit, connect_to_child)
 	EXPECT_EQ(0, records.access);
 
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 	EXPECT_EQ(0, close(dgram_client));
 
 	ASSERT_EQ(child, waitpid(child, &status, 0));
@@ -637,6 +642,7 @@ TEST_F(scoped_vs_unscoped, unix_scoping)
 	ASSERT_EQ(0, listen(stream_server_parent, backlog));
 
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	EXPECT_EQ(0, close(stream_server_parent));
 	EXPECT_EQ(0, close(dgram_server_parent));
@@ -779,6 +785,7 @@ TEST_F(outside_socket, socket_with_different_domain)
 	} else {
 		server_socket = socket(AF_UNIX, variant->type, 0);
 	}
+	EXPECT_EQ(0, close(pipe_child[0]));
 	ASSERT_LE(0, server_socket);
 
 	/* Server always has a domain. */
@@ -791,6 +798,7 @@ TEST_F(outside_socket, socket_with_different_domain)
 
 	/* Signals to child that the parent is listening. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
 
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	EXPECT_EQ(0, close(server_socket));
@@ -1139,6 +1147,8 @@ TEST(datagram_sockets)
 	 */
 	ASSERT_EQ(1, read(pipe_child[0], &buf, 1));
 	ASSERT_EQ(1, recv(server_conn_socket, &buf, 1, 0));
+	EXPECT_EQ(0, close(pipe_parent[1]));
+	EXPECT_EQ(0, close(pipe_child[0]));
 
 	/* Waits for all tests to finish. */
 	ASSERT_EQ(child, waitpid(child, &status, 0));
diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 47307dd2e242..0f88a6af9c72 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -1120,6 +1120,7 @@ TEST_F(trace_fown, deny_scope_fown)
 	ASSERT_EQ(0, fcntl(recv_socket, F_SETOWN, child));
 
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
 
 	/* Waits for the child to send MSG_OOB. */
 	ASSERT_EQ(1, read(pipe_child[0], &buffer_parent, 1));

-- 
2.56.0

