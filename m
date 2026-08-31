Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46726476682;
	Mon, 31 Aug 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192310; cv=none; b=NQtJb/KlXMnlZAuRAWlYwYb6X/xLXhFrFCuwwRTH27DgqxYcwOW+izC3lpfZ4T91ark8E0NA/sDBz0+cEH4Nny5CFMxx0Wn6YsyV95uxlUnq+8Lo3lj9sr7SpOLJUX3r0bezz0Enctge0/0C5rEc1eN6FYbAfAT2tbsK2CBpSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192310; c=relaxed/simple;
	bh=ZYmXFyHdd5TM6cOUG7845M3ywPJUvD+s+gdsFx1U5ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULsLWhZxssOKBK3cqvf6N9KOhNZhOJIoWare5nGupTRWvc/jHQcL1qUzYhD8HjQAvibWeHTpWt9v3CZzln5PHakSjvI240S3zWBvE/49llKD+qzN2iE5kSqdh6ALGq2ym9uKwQV5YfpiF3kxH5you2Lt4lPGHMbIMV+L83VfOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D0Z51uHR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D0Z51uHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788192307;
	bh=ZYmXFyHdd5TM6cOUG7845M3ywPJUvD+s+gdsFx1U5ZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D0Z51uHR9bTCyFQspuODpdXwN66AyhECdKiiM22O+Qo7TnTcSFnQtNnI/NCEGWco9
	 feZY5/d3ogKQ3pm0f8Hhu38LoO5jVOw9SXkWD31oFmlGLFuwm9Kj/eyaX2aLRzxKIO
	 VuJNBKvwEJjU6I4U4QTPk+7mhECE7FJ9kIkX05Ns=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 31 Aug 2026 18:05:01 +0200
Subject: [PATCH 3/3] tools/nolibc: validate directory with O_DIRECTORY in
 opendir()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-nolibc-fdopendir-enotdir-v1-3-8cf0e79c4e6f@weissschuh.net>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
In-Reply-To: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788192306; l=896;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZYmXFyHdd5TM6cOUG7845M3ywPJUvD+s+gdsFx1U5ZY=;
 b=WSMM0vmDTPqJO9nSR9MkfqUXuyO9aJ+5CVOfUbLF9UrM4ylOyXVucqpZbgNhJZRczZNsHisFI
 JlGOZ8wmqbLC9Yn1ykJh3Zdj8M32EsfoBurAGJwRtJg8gXMIGS4yoej
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

fdopendir() requires a call to fstat() to determine if the opened file
is a directory. Currently opendir() inherits this extra syscall.

Switch to O_DIRECTORY and remove the call to fdopendir() in opendir()
to make the directory type check cheaper.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/dirent.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 25fbff208998..2dbf4052b85a 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -55,10 +55,11 @@ DIR *opendir(const char *name)
 {
 	int fd;
 
-	fd = open(name, O_RDONLY);
+	fd = open(name, O_RDONLY | O_DIRECTORY);
 	if (fd == -1)
 		return NULL;
-	return fdopendir(fd);
+
+	return (DIR *)(intptr_t)~fd;
 }
 
 static __attribute__((unused))

-- 
2.55.0

