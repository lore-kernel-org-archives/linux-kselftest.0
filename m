Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B2392C25;
	Sun, 13 Sep 2026 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343429; cv=none; b=P8G6fJopy9puLMq1d/KeZZNIWbGLPUAYZMNnlT7bJtW1ASG72WwxsNujpC/Jh/KKWJMWiXXCiCL+np2qr2MyPfJEfHRCvPIl1r6OMEGId+fDyBnxpG8jCHU1h1HEPNF1fTG2JZR0hMAStXFo3ZesGPTXQV64RWSfmYy1aCh6ODs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343429; c=relaxed/simple;
	bh=0J+FM3DgylRCkiex+2g+WBKWTN3pZvI6BIC1xKGYLjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwZ0HBhiWhYNPse/lL7fuissE2gl6UA5onhBenlINGWNR2nwGht+rDU2BZpLU5sDEiY3K1A+lGCtdjWM1zZsj+MCrvsPGtxSpI48Kkl40ZrFS/rSvz2tzRg6D4j5DouKL3RhdFCR9im/3co9lb/cBIXrLjMp6czgOAcCRBQTDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=b1JZebpr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="b1JZebpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343422;
	bh=0J+FM3DgylRCkiex+2g+WBKWTN3pZvI6BIC1xKGYLjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b1JZebprQ7niRJFcC57tulQIbzGjXHbFGkt8FpV0YzRbYv2cejNzjZlpdKtDHViJB
	 N3+8idW0xe8BIH3uE79/waQ5FWcEcaQTF2qHActL1Jt8H+lRpt/yP2fCDOrGp87cF3
	 jJsuiUFxLna2I20o1ZQ7ZQ8wI64jQpT/RT0ie6bM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 01:50:08 +0200
Subject: [PATCH v2 1/5] microblaze: uaccess: Zero out destination on failed
 get_user()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-kunit-microblaze-v2-1-7d5756e858f8@weissschuh.net>
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=1081;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0J+FM3DgylRCkiex+2g+WBKWTN3pZvI6BIC1xKGYLjE=;
 b=S9hVt93u6sjnYg34rrmE1Wr14EdxdTjVqLieaIdK8DxJApjv07ON8Iw+6ltoDl7LPGW8YCVz1
 FgKb1C//BHcCQqYpOWW99oCy5/+HJh5ORErA4DCQHYFbz90pAhzPvRH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

On failure get_user() is supposed to zero out the destination variable.
This is documented in the kdoc of the microblaze get_user()
implementation and validated in lib/tests/usercopy_kunit.c.

Currently that zeroing is missing.

Add it.

Fixes: 0d6de9532663 ("microblaze_mmu_v2: uaccess MMU update")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: David Gow <david@davidgow.net>
---
 arch/microblaze/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
index afa0dd8d013f..77203af255e5 100644
--- a/arch/microblaze/include/asm/uaccess.h
+++ b/arch/microblaze/include/asm/uaccess.h
@@ -95,7 +95,8 @@ extern long __user_bad(void);
 #define get_user(x, ptr) ({				\
 	const typeof(*(ptr)) __user *__gu_ptr = (ptr);	\
 	access_ok(__gu_ptr, sizeof(*__gu_ptr)) ?	\
-		__get_user(x, __gu_ptr) : -EFAULT;	\
+		__get_user(x, __gu_ptr) :		\
+		((x) = 0, -EFAULT);			\
 })
 
 #define __get_user(x, ptr)						\

-- 
2.55.0

