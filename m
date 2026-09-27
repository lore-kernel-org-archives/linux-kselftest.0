Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36E3B71D6;
	Sun, 27 Sep 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498981; cv=none; b=Qks7MJm3BKlEnw5tZBE1uuCF0jHO6wm0ZnLj72W48mb8ZF9hP974JeWb4Mr6LbWD2KlY/c01C3tb9giMsva6Q5R/LqhBR+zsXoxY9v+Ns9FLVv+c1+zfWphLsT37h8VD53ez68PpAklRx4trB4bBwD+844QiIdVRKdpf3VbEgSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498981; c=relaxed/simple;
	bh=pfOBPxwd/uxSmdnWAqCErck9sZ3KTWEEi3HpuaeGEmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9X3I7tueel9r2QB1AzCfFzD7xJ3ffRzcJ52VZ8jfAGajOYSaM4QwU/WdF/345yVaiRlA+4AaxB72+77FPU1KfWrT05/aPNr+IxYeS2Xk5WK8Wy1ZMAK4PLyxgjZuzdcNcMQCTQKNnnlzaP5TXb11BUxVb2nci81ddbhqiM1eCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XRzsBmvy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XRzsBmvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498971;
	bh=pfOBPxwd/uxSmdnWAqCErck9sZ3KTWEEi3HpuaeGEmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XRzsBmvyxBZ0oAWLlY8QK73o2/8qhXbjVt8yAWGlAe92CKKs/oA1H20UYMSWLOO5c
	 wacePmSEAs1IayXXjzymdHuc9WpGEHB1oxNMKddcuw29FNWtrXr4xgebDjn5pctJBx
	 GjZBHIekj48tOGxGS1v0lOnEw1SKouOM2zATiqqg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 27 Sep 2026 10:49:15 +0200
Subject: [PATCH 4/5] tools/nolibc: introduce __NOLIBC_BITS_PER_SYSCALL_ARG
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-nolibc-pread-v1-4-e9af6e47b37a@weissschuh.net>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=1653;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=pfOBPxwd/uxSmdnWAqCErck9sZ3KTWEEi3HpuaeGEmM=;
 b=0eN3UbedJELuX9RPfnedxtQ+nAy0mmHBhgNYqS3M3P29qEVeqilTMupmcGdhtSz3Atoaf7YFr
 7LRi0DlmBpIA/Mq1b3ScvfciJyM2CRaQUrf6mpdJ2h4A+mY0sqSm7j4
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

ILP32 architectures, like x32 and n32, support 64-bit system call
arguments, although they are nominally 32-bit architectures.

Add a new define which provides the size of system call arguments
so generic libc code can use the best system call for those.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-mips.h | 1 +
 tools/include/nolibc/arch-x86.h  | 2 ++
 tools/include/nolibc/arch.h      | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index 21b9959a08e2..c0da0cc309ce 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -72,6 +72,7 @@
 #define _NOLIBC_SYSCALL_STACK_UNRESERVE
 
 #define _NOLIBC_SYSCALL_REG register long long
+#define __NOLIBC_BITS_PER_SYSCALL_ARG 64
 
 #endif /* _ABIO32 */
 
diff --git a/tools/include/nolibc/arch-x86.h b/tools/include/nolibc/arch-x86.h
index 577e9b682eb3..0638f9316749 100644
--- a/tools/include/nolibc/arch-x86.h
+++ b/tools/include/nolibc/arch-x86.h
@@ -386,5 +386,7 @@ __asm__ (
 ".popsection\n"
 );
 
+#define __NOLIBC_BITS_PER_SYSCALL_ARG 64
+
 #endif /* !defined(__x86_64__) */
 #endif /* _NOLIBC_ARCH_X86_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index 24e0ec4fb2db..79ed5900f2a7 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -40,4 +40,9 @@
 #error Unsupported Architecture
 #endif
 
+
+#ifndef __NOLIBC_BITS_PER_SYSCALL_ARG
+#define __NOLIBC_BITS_PER_SYSCALL_ARG __BITS_PER_LONG
+#endif
+
 #endif /* _NOLIBC_ARCH_H */

-- 
2.55.0

