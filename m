Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D193D411D;
	Wed, 16 Sep 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585521; cv=none; b=pJpCfDG5JoLj7WhSD/QETAKuqr74G6q2AbXW04IVB8gPTo4jr31zu1PzVURI1FwuHJrUywS81Ml3b4TkRZFtkHnk6Ae+tacMEuoRTdrtI3jh9Xz1g90mNl8CrXCuRj/sK6hWfCVYbZkSnhNXTbLqifkO73hk8D4FwPaclOsBwp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585521; c=relaxed/simple;
	bh=UJ5kFpm9lZA/UhILHy/Wbf9REycc1Rg4PzqcUBRkqWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXZjML9BT2eK5o2qZ0y9BvDyC5wouZJb1IiCFrW6ER+r9qXeHMXZdsETdcj6C1VfVRp/a3BZazzkmVs11Xsq0D9vIDHPOpEIEMAvaDcKMA72NOg+hidG6n5JVqDQOHa1Kpt7+Up4430Ufnnkt/lD4izArDMzGURWsrXV3UjsHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UBU8Pca0; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UBU8Pca0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oR
	/3eUkQf5EFBcnB06XpfVH0x6bMok+ngUzEvNVK3+A=; b=UBU8Pca06v8x1YzeCe
	aC/p9E+Ktoux9kwYDsoi7UHKpJDFD8KZsPx2lW8vdAzBeJt9U5trchlpdGZRs+q3
	H2jt4aQJnZbTycnSboFcXIwElOc21frAfmB6vqZQzz+X4+dTHE6v42rmbA/4Jpn0
	0R6EOxCIdWesGBdUl8ouCWzXU=
Received: from WZZ (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC31w446Kpq8UfpQQ--.46080S2;
	Thu, 17 Sep 2026 03:04:32 +0800 (CST)
From: ZhuangZhuang Wang <wzz_123123@163.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuangZhuang Wang <wzz_123123@163.com>
Subject: [PATCH] selftests: kselftest: Fix debug message formatting
Date: Thu, 17 Sep 2026 03:04:23 +0800
Message-ID: <20260916190423.1892-1-wzz_123123@163.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgC31w446Kpq8UfpQQ--.46080S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1xWF1xJrWrAFWxZr17Awb_yoW8Aw1kpa
	n3ZF4jgan8ArW7Ka1DArWDtr1rJrs3JF1fJr93CwnrZF45JaykWrZ7KFyUt3WkG3yFqr15
	Za90gr1DCw47uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5kurUUUUU=
X-CM-SenderInfo: 5z22siqstrjji6rwjhhfrp/xtbC5QCPfWqq6EAkcwAA3o

ksft_print_dbg_msg() passes a va_list to ksft_print_msg() as a regular
variadic argument. As a result, format specifiers consume the va_list
representation instead of the caller's arguments and print garbage.

Add a va_list-based helper and use it from both message printing
functions. Also annotate ksft_print_dbg_msg() so the compiler can check
its format arguments.

Fixes: f2662ec26b26 ("selftests: kselftest: Create ksft_print_dbg_msg()")
Signed-off-by: ZhuangZhuang Wang <wzz_123123@163.com>
---
 tools/testing/selftests/kselftest.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index ae18c491a..d815a8667 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -173,19 +173,25 @@ static inline void ksft_print_cnts(void)
 		ksft_cnt.ksft_xskip, ksft_cnt.ksft_error);
 }
 
-static inline __printf(1, 2) void ksft_print_msg(const char *msg, ...)
+static inline void ksft_vprint_msg(const char *msg, va_list args)
 {
 	int saved_errno = errno;
-	va_list args;
 
-	va_start(args, msg);
 	printf("# ");
 	errno = saved_errno;
 	vprintf(msg, args);
+}
+
+static inline __printf(1, 2) void ksft_print_msg(const char *msg, ...)
+{
+	va_list args;
+
+	va_start(args, msg);
+	ksft_vprint_msg(msg, args);
 	va_end(args);
 }
 
-static inline void ksft_print_dbg_msg(const char *msg, ...)
+static inline __printf(1, 2) void ksft_print_dbg_msg(const char *msg, ...)
 {
 	va_list args;
 
@@ -193,7 +199,7 @@ static inline void ksft_print_dbg_msg(const char *msg, ...)
 		return;
 
 	va_start(args, msg);
-	ksft_print_msg(msg, args);
+	ksft_vprint_msg(msg, args);
 	va_end(args);
 }
 

