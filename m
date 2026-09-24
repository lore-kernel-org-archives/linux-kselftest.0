Received: from mail-oo2-f33.google.com (mail-oo2-f33.google.com [74.125.231.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E96485943
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251810; cv=none; b=DxcVcFUJgWVxilluIgoLk4GaK3fbaxEIcUTn0xIeEoimp8OA/TqbPFIZvtTWXate4mYH0QjQjvPpJEZBlTjKIPmyeRDThhG0FrnQGAT5bVCg/RNBhh9OLRVeb47isdlAgGBa/MMsl4qnlWuQw6T2DP36hu+qiDKtcvuzwsMhUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251810; c=relaxed/simple;
	bh=eUWJsg1zsooAzgeGfXboVcrvWw1eYTP66U9U6sf0dKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwFFJQZBk7OyfikGar3cod5QXTzToNQpbHSns2usgeQmSQwkzH+hamPfS1gbhV+6OUQyB85ZXpNIGiTfA7Wg4gqRGUC4HMZTTzqZbGvzl06m3dOIcIzC9ng6VCXrZG6qcznSTqCyaLNf+VV7lIxF53nHcI3q5pHurMqlolpXG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoQ5Oomr; arc=none smtp.client-ip=74.125.231.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoQ5Oomr"
Received: by mail-oo2-f33.google.com with SMTP id 006d021491bc7-6b1ae6a9aeaso1218921eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251807; x=1790856607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ax0qVloBz/Ob0q1phBWfblEo0M91ubq93T1eoxfqLyQ=;
        b=NoQ5Oomrxv9m8QIPWmmIjfAWgy4WwnLz0cXIfO+h/er4WLkWm+9JqTOzqyKBDdPh8B
         cGh3PuhbX/sB0t1nTFXEBS/swnpnKwCJGTyioY4bUwUqs477FvUdWROEBYq8KdHs7Gtw
         5vKV7EFHxjuYy8GlJaWHH+JURLA9tnEbepFNXGd70XeKZSzNSzYNVAto15HZ3Rp8EkT5
         d/8bddadpkgrVBpVFf/tSXK1E50QBjeP/HuddcwnAyBnDAtVszIUTocXhJ8e3o0I3VZK
         q3VNmAWdy7dn/SGyQ03GX3nM6Hm2QIdDeIxM+hg1LEMJlj0dnWoMyBYnhJQCqqghQdt3
         yhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251807; x=1790856607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ax0qVloBz/Ob0q1phBWfblEo0M91ubq93T1eoxfqLyQ=;
        b=avaX2nE8bQDRnGoYWjG7FWWlmDdP0U3jDJuMcUe1Rwt31g1BXFNwbPLnkQQoiKavYc
         wRUngGbLUmb9hzu8/NYBn4LNpWtyACHEFNjQiUC6+SrJ4LORqZOhwunUtVFWEI7ABktn
         vmr9siDdhBYimCyP5fFmRS87vEKawpxBldLIptskfv7+6vTUUrtyYmbCnFmslE0hMXUW
         1kaK+SlnYaJnjoqiDBuo6QHR0dH1qbmcTpQYAQJaEuPGmjt0t69ur3LreDBDuSb/Ietj
         f3FKBx48kwHBU2wYBR006IxCdFDKfxGntgyFyQJrYUgMJoyCjPESW4oEEIcg81YxcTY3
         xd/w==
X-Forwarded-Encrypted: i=1; AKwUvBwvv22Hz4Z4p9nrvx0rtVDvLrAJSpB3inwmKvThJHOwmyHS/n4gHPHBL4uvNLpKXlcJW/feHmXdc3jAp/R0dE8=@vger.kernel.org
X-Gm-Message-State: AFuF++lebafSQSk9RXUTW8n1RXvA2OO6vLJmxkdUPHhHcUjdWdmRMOFx
	/g7uChC75Hvy9F4HsZHINkEQdRFdPSnagXnVStXuwUUIPL9Pcrt06+BK
X-Gm-Gg: AYBFou3bnF6jRoex9cru2fShcesjf4U67YksKbprekprP6TCuurndUcezb8LAqEgWJa
	rfF2rkvNiKFGOmRgXnrBRP7mZO+Rxo/taMAhXnqYIPZqszJPYZcbdKcVcYeb8gDAKU5ufUfpkic
	rquk/ARvvKr2E0IG78azSFMJIh5M3IexCMm4TDT78l5Co25AelNX0ncrElm6nnDDBCDVdkoCkT7
	8F/aY3Q3uyInyusgQM5glN3+tprFVVQ4vd6nZdZHmN2LkvXL9lMEBr8TeCI6V5RDlBmadG9vI84
	wNWw5BKUc4h1PuMeqtwf4m75VCzpySod/vUnG6csCVOWBi7/xhCXuyP5xmXHy++FxPnzwduJZN+
	wPh6AmLD2N3yIsbORqeB5R2JTKezMY5FPgU6+CuKtXWm0D0wxFZXsUUdzMa4T3wtQZOkm64pHpX
	9FSHhKLC6jEru2jjX47UdPS3gzr9LB0yH1KC2nMKlmkdnys2ZFKr+ekx9I+5+l+aabzOg8CeT87
	PZ3ShFokg1Lie0xS3sxzYV5qd/NY+C/HsIEU5aX
X-Received: by 2002:a4a:e90c:0:b0:6c9:d43e:a703 with SMTP id 006d021491bc7-6d43f4bf666mr2265425eaf.33.1790251807333;
        Thu, 24 Sep 2026 05:10:07 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f94sm5018070eaf.8.2026.09.24.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:05 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests/nolibc: add a test for errx()
Date: Thu, 24 Sep 2026 07:09:58 -0500
Message-ID: <20260924120958.23698-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924120958.23698-1-danishkhateeb03@gmail.com>
References: <20260924120958.23698-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nolibc-test does not call any of the err.h functions, so nothing
noticed that verrx(), and errx() through it, printed their messages
with the wrong arguments, or crashed.

Add a test that calls errx() in a child with stderr redirected to a
pipe, and checks the exit status and the message.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 37c11a7fce23..1447c2e39af5 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -32,6 +32,7 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
+#include <err.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <poll.h>
@@ -2223,6 +2224,51 @@ int test_asprintf(void)
 	return 0;
 }
 
+int test_errx(void)
+{
+	char buf[100], expected[100];
+	int pipefd[2], status;
+	ssize_t len;
+	pid_t pid;
+
+	if (pipe(pipefd) == -1)
+		return 1;
+
+	/* flush the printf buffer to avoid child flush it */
+	fflush(stdout);
+	fflush(stderr);
+
+	pid = fork();
+	if (pid == -1) {
+		close(pipefd[0]);
+		close(pipefd[1]);
+		return 2;
+	}
+
+	if (pid == 0) {
+		dup2(pipefd[1], STDERR_FILENO);
+		errx(42, "%d %s", 1234, "foo");
+	}
+
+	close(pipefd[1]);
+	pid = waitpid(pid, &status, 0);
+	len = read(pipefd[0], buf, sizeof(buf) - 1);
+	close(pipefd[0]);
+
+	if (pid == -1 || !WIFEXITED(status) || WEXITSTATUS(status) != 42)
+		return 3;
+
+	if (len == -1)
+		return 4;
+	buf[len] = 0;
+
+	snprintf(expected, sizeof(expected), "%s: 1234 foo\n", program_invocation_short_name);
+	if (strcmp(buf, expected) != 0)
+		return 5;
+
+	return 0;
+}
+
 static int run_printf(int min, int max)
 {
 	int test;
@@ -2287,6 +2333,7 @@ static int run_printf(int min, int max)
 		CASE_TEST(scanf);        EXPECT_ZR(1, test_scanf()); break;
 		CASE_TEST(printf_error); EXPECT_ZR(1, test_printf_error()); break;
 		CASE_TEST(asprintf);     EXPECT_ZR(1, test_asprintf()); break;
+		CASE_TEST(errx);         EXPECT_ZR(1, test_errx()); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */
-- 
2.55.0

