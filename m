Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5238F639;
	Sun, 27 Sep 2026 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498980; cv=none; b=D5sCy8o+g63wrMI6xBjIkzYZ2almZTMiORr4epMRFvcAulS2QOK0VEIj6nWqR7cSc18073Fi28NcGDaTOnBhfP6VNzjSIUtDZs4KbU5wGpNqZ5GYP5t2PPz03LhzBu2cM5tKJOIfjo3J/8vIxGJZrFapeY//CnMeH8AM3RL6V1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498980; c=relaxed/simple;
	bh=pUxleBtV7AQyyXGq/vDWC2EgoP2sATZ8TagLLv25yCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hohViXl6JxkgHh/RrOkFgTJKrD38GxQ/I/2ngDhO2Mgc8bewSAIQXq/X6Ecz7aVdj+LFnaaqYu7ZPBGo+HJsi6K3OSb+963gn5Ci6usHn05yPdG2cl/v1uxQId5ZZESXmRtLX1hhBuhXeUoFWbEuROBxM3HF1shPgc7iZWnT9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GSQWX5Wc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GSQWX5Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498971;
	bh=pUxleBtV7AQyyXGq/vDWC2EgoP2sATZ8TagLLv25yCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GSQWX5WctjdcPS1lziHqD+cWobZemgaWAGvwa4gmYlUixPzIQUTb7TXnQBf1aX1cg
	 Psqu/Rkso0LZ2W2HHqYzmasCSof3QmtsQhqCCdRQMjCcNjhKEhPk3iKCVtM4gRSezN
	 mzLt89xndNa3eoYAuJ1gR6JdUlMqOwlL5xC1xnjs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 27 Sep 2026 10:49:14 +0200
Subject: [PATCH 3/5] tools/nolibc: move __NOLIBC_LLARGPART() to compiler.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-nolibc-pread-v1-3-e9af6e47b37a@weissschuh.net>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=1975;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=pUxleBtV7AQyyXGq/vDWC2EgoP2sATZ8TagLLv25yCY=;
 b=CrM1x6eSxfSIgCD7cqTjyceilAE/I7X8I09PrVvort782lqiq9bII7P6tmFi5lp7f8817y0oG
 iD3zV9FxvMHAQYGbOKXybZD4BNsacfLAfBHQri9datYPtfzD0Tym0Z/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

pread() and pwrite() support will require the usage of the macro from
the arch-*.h headers. sys.h can not be used from those.

Move the macro to a more generic header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/compiler.h |  9 +++++++++
 tools/include/nolibc/sys.h      | 10 ----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/include/nolibc/compiler.h b/tools/include/nolibc/compiler.h
index f2d7a81d0d7c..375c45ce81c8 100644
--- a/tools/include/nolibc/compiler.h
+++ b/tools/include/nolibc/compiler.h
@@ -90,4 +90,13 @@
 #  define __nolibc_no_sanitize_undefined
 #endif
 
+/*
+ * Helper for 32-bit machines where a 64-bit syscall arg needs to be split into
+ * two 32-bit parts while making sure the order of the low/high parts are correct
+ * for the endianness:
+ * __NOLIBC_LLARGPART(x, 0), __NOLIBC_LLARGPART(x, 1)
+ */
+#define __NOLIBC_LLARGPART(_arg, _part) \
+	(((union { long long ll; long l[2]; }) { .ll = _arg }).l[_part])
+
 #endif /* _NOLIBC_COMPILER_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 548f94d96ed2..7f06d27da612 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -71,16 +71,6 @@ static __inline__ int __nolibc_enosys(const char *syscall, ...)
 #endif
 
 
-/*
- * Helper for 32-bit machines where a 64-bit syscall arg needs to be split into
- * two 32-bit parts while making sure the order of the low/high parts are correct
- * for the endianness:
- * __NOLIBC_LLARGPART(x, 0), __NOLIBC_LLARGPART(x, 1)
- */
-#define __NOLIBC_LLARGPART(_arg, _part) \
-	(((union { long long ll; long l[2]; }) { .ll = _arg }).l[_part])
-
-
 /* Functions in this file only describe syscalls. They're declared static so
  * that the compiler usually decides to inline them while still being allowed
  * to pass a pointer to one of their instances. Each syscall exists in two

-- 
2.55.0

