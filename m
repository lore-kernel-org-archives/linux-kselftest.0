Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F25391842
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469664; cv=none; b=fIcCsX8LFEjCAicRrz4leY6dFTeNyMu3WLiv0GUthJtwOU3DoNsoiXxd1G+NZF6HXGY/Nwqy3hFaFNx0ooIuf/BNu3TjZ0MMkQMQwksbC8Y0zc+TSL97SW1xGk0ZGhUHNZ+W9tpCwuKkFbDYl0hU7sb5laezOguc8lfIHQzm/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469664; c=relaxed/simple;
	bh=WaB0/OBi7Xz0AZ1aEUaODytn+pEkREAfIuXYAwlsKy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+0f2EI1HMBEbw3reGPUNNOFD5tzC/BeAeLiTlE5wQKa7WHc9jA81u0IYZqTNBp3f7s1XycS3c2n45276hkHH5VQsVq2imiHSnwB2LQrNF+VDyERXEoYjXvESPi9Nm0H6RnBWro4qBXF/L65LUWdfo0FbNjYBfPX/d5G9pQygYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCsHPTL+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCsHPTL+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2783436f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469661; x=1792074461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ny/9gEnpxHKxqOxqx4ATI59L/h/kxApeZ/xGlP7B7Q4=;
        b=XCsHPTL++YTqy3qn7s7xabwe7/EIKkajN4MyzCc33FRltDSuYv/SURwL/s7gAJxSHA
         SuC17+fpEN/Zr7SO0N62A54mM9gHjYP9lyPFSGXE5gqiLC2FqsFXooJdqZ48+YAZcaTB
         TcfofNTiQFcIZ+DzbmGndHnEq6BC1Eexv0Frv8u2vrhnzekr/c3th1u5yciRXIpZqTzs
         /o9R0tRsko4otOFgmKvriOj7/witSZLjYESyNmZc/7wM/dVcgRPyD+gxpT5GPPP82YRE
         wBge/SdYMtB7Z+04i0DY4Fw5RgnusNLdzE5mMM9sbmFjbkPDPqTq2C+qyTel67TOisDK
         lsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469661; x=1792074461;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny/9gEnpxHKxqOxqx4ATI59L/h/kxApeZ/xGlP7B7Q4=;
        b=lJlxEIZYGg2WoE3hgTiqrMh30EY369lQMY1EoPXZU4Xn2/YYBZClbp/SJt4MMJvsrG
         YdtO3DRj1I/QmnNaZ9XZMKVPdmwtpXzkRDMJQNAe5xI8tx6FdPNWGKhqvzoR4lO658gS
         YFax0NRljSi5evaVJV0LSclggsj2Fm6nMzOEI2NnnaG2cQnBd6ynZY6abOY/rY2dY5f9
         DppthIrRdZVb2cCvU9dlw/Pv93qVAypW2rSLbxXKZjPSLkddSLOX5bk5qQ9qIRRpVQFb
         K6q6KT3AE73GEruX/3+r1+8InjmL06JwM/Lt3DYf0oJMC8e7Of+INJQyGmONVUiljKJo
         TXWA==
X-Forwarded-Encrypted: i=1; AKwUvBx/Z/PPAvrJzNN03AnauxlpC6drh+PshTK4TdgMg1FUgEGaQnSEfjzosKqnK6tLTu64yBnzkPirNGfkq9HDc30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIBxhzfaVx1G3kf+YHPrpfMUZ8IFWQw5GpJOL5LhT293xzUME9
	BF0T6sjlJZHDNb5kcV86qJfLsqmnNjD2fBvqTV1BbigxddX6X/rUGJKQ
X-Gm-Gg: AYBFou3p+oUoHkcSgCyxHUuJ44Bietn2ia/w1h82w8pwREZFBjcWXbEF6vBEAwh5ElG
	aMxNQ+CeGDug9EBjIs1ExcqX2LvpyZrb3WlnYuSjhucVOIFitgKVwCtT3KxBjDjKE8N693MTWIk
	1PjbMTkRpe3sZGsiLnt9Iee8Lmzjyy/u/rftEG1AiV2ztb1ASPYUb2UPetp8pfUZi6e+6ItgLir
	NnTrE2myNcedCMjTjHAgUGqGXyvltHcOuDQ5RVNTLIt4OOPQbuFtTlqBVmfSlazIT+ldszU1bfv
	dZ8BhNZ1nAzc/gIqRZK6C6/XHaLTgFDb413o4qQGkDftrvTqBBLWJazF4OG8mpPRSuLL8WT9GYV
	fp5LkIqkL8JwaH0qwAYYaQctX4t0JCKM9Ms7bRv2H2jpu+ZfDpMx+LeDJGTGVOJ+DyryqGyRttd
	15vL1mo68FfAAVGgbh4/zB3KeiaN10bu+7ak8TDqBS13D9q/MZv79ThFqGM/jY5EW6BwmUwYswK
	Rr5H1Ml3W1V3CCuFCvgW1U=
X-Received: by 2002:adf:e19d:0:b0:488:79a2:3232 with SMTP id ffacd0b85a97d-48c7278c0e3mr12010002f8f.31.1791469660708;
        Thu, 08 Oct 2026 07:27:40 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1e9c2sm10964964f8f.30.2026.10.08.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:40 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/27] selftests/landlock: Fix messages and comments in helper programs
Date: Thu,  8 Oct 2026 16:25:51 +0200
Message-ID: <20261008142604.39107-24-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* sandbox-and-launch: Describe the actual argument order.
* sandbox-and-launch, wait-pipe, wait-pipe-sandbox: Report failed
  read(2) calls as read failures, not write failures.
* wait-pipe-sandbox: Terminate error messages with a newline, and fix
  comments naming "." instead of the opened "/".

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 .../selftests/landlock/sandbox-and-launch.c      |  6 +++---
 .../selftests/landlock/wait-pipe-sandbox.c       | 16 ++++++++--------
 tools/testing/selftests/landlock/wait-pipe.c     |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/landlock/sandbox-and-launch.c b/tools/testing/selftests/landlock/sandbox-and-launch.c
index 3e32e1a51ac5..8b33ddadc63e 100644
--- a/tools/testing/selftests/landlock/sandbox-and-launch.c
+++ b/tools/testing/selftests/landlock/sandbox-and-launch.c
@@ -25,8 +25,8 @@ int main(int argc, char *argv[])
 	char buf;
 
 	/*
-	 * The first argument must be the file descriptor number of a pipe.
-	 * The second argument must be the program to execute.
+	 * The first argument must be the program to execute.  The second and
+	 * third arguments must be the file descriptor numbers of two pipes.
 	 */
 	if (argc != 4) {
 		fprintf(stderr, "Wrong number of arguments (not three)\n");
@@ -67,7 +67,7 @@ int main(int argc, char *argv[])
 
 	/* Waits for the parent to try to umount. */
 	if (read(pipe_parent, &buf, 1) != 1) {
-		perror("Failed to write to the third argument");
+		perror("Failed to read from the third argument");
 		return 1;
 	}
 
diff --git a/tools/testing/selftests/landlock/wait-pipe-sandbox.c b/tools/testing/selftests/landlock/wait-pipe-sandbox.c
index 87dbc9164430..dbc0c2747e9f 100644
--- a/tools/testing/selftests/landlock/wait-pipe-sandbox.c
+++ b/tools/testing/selftests/landlock/wait-pipe-sandbox.c
@@ -31,7 +31,7 @@ static int sync_with(int pipe_child, int pipe_parent)
 
 	/* Waits for the parent do its test. */
 	if (read(pipe_parent, &buf, 1) != 1) {
-		perror("Failed to write to the second argument");
+		perror("Failed to read from the second argument");
 		return 1;
 	}
 
@@ -65,7 +65,7 @@ int main(int argc, char *argv[])
 
 	/* Tries to send a signal, denied by layer1. */
 	if (!kill(getppid(), 0)) {
-		fprintf(stderr, "Successfully sent a signal to the parent");
+		fprintf(stderr, "Successfully sent a signal to the parent\n");
 		return 1;
 	}
 
@@ -88,13 +88,13 @@ int main(int argc, char *argv[])
 
 	/* Tries to send a signal, denied by layer1. */
 	if (!kill(getppid(), 0)) {
-		fprintf(stderr, "Successfully sent a signal to the parent");
+		fprintf(stderr, "Successfully sent a signal to the parent\n");
 		return 1;
 	}
 
-	/* Tries to open ., denied by layer2. */
+	/* Tries to open /, denied by layer2. */
 	if (open("/", O_RDONLY | O_DIRECTORY | O_CLOEXEC) >= 0) {
-		fprintf(stderr, "Successfully opened /");
+		fprintf(stderr, "Successfully opened /\n");
 		return 1;
 	}
 
@@ -115,15 +115,15 @@ int main(int argc, char *argv[])
 	}
 	close(ruleset_fd);
 
-	/* Tries to open ., denied by layer2. */
+	/* Tries to open /, denied by layer2. */
 	if (open("/", O_RDONLY | O_DIRECTORY | O_CLOEXEC) >= 0) {
-		fprintf(stderr, "Successfully opened /");
+		fprintf(stderr, "Successfully opened /\n");
 		return 1;
 	}
 
 	/* Tries to send a signal, denied by layer3. */
 	if (!kill(getppid(), 0)) {
-		fprintf(stderr, "Successfully sent a signal to the parent");
+		fprintf(stderr, "Successfully sent a signal to the parent\n");
 		return 1;
 	}
 
diff --git a/tools/testing/selftests/landlock/wait-pipe.c b/tools/testing/selftests/landlock/wait-pipe.c
index 0dbcd260a0fa..3cfa4dce5f35 100644
--- a/tools/testing/selftests/landlock/wait-pipe.c
+++ b/tools/testing/selftests/landlock/wait-pipe.c
@@ -34,7 +34,7 @@ int main(int argc, char *argv[])
 
 	/* Waits for the parent do its test. */
 	if (read(pipe_parent, &buf, 1) != 1) {
-		perror("Failed to write to the second argument");
+		perror("Failed to read from the second argument");
 		return 1;
 	}
 
-- 
2.56.0

