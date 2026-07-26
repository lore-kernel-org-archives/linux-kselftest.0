Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997C37F334
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060814; cv=none; b=t0cGLAIq9ncJas/OeC8+CcPO+kgi33ia1j0CXnrE0hFDcOlWQHCJ6ktFWM1825MgKXbQS46a8hj7IzPp23djf+7gypCGz02nHZmoqbGDRbNjiCUSTxDKD4tnqVFPuQhDGl7FTvt8E1f0w2XrbUPgnWIrBs52L0ysktEk8+wZTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060814; c=relaxed/simple;
	bh=9yh2PeC9iH2ehGJhAogCXH1OX690Q3HSkoCKr4p5te0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5uRdBuAqs28pDQ+NGQmCq8cj3NKrnAOOkzHLyMtAGktdJTZSMyzbjRcdYREJHhqoXT7KHpUzmlG92yGbVzRvZZMqo2rFE0HmV7XUnzJFAErLGXlJc/7XxlQCGcLQbC+mSbtVO9HLZjgBQ9+n9Tp2tISbjilLV5eCp78yxmHYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=k36wezwx; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="k36wezwx"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb85186d43so858863a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060811; x=1785665611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlASkg3aEU6DCVKYIVsNYyPT/klq2H1IARTdtVshro=;
        b=k36wezwx03n85ERYhgKuZaVjZng9syKhwGGhfwQoq5dyRbUPJwIfaO9M8KWWLS399F
         62i0+OKvGL8NyZlwxQcec2RWohamDquZCsezuUJT2CLHGe8TvPttLLeBeYXvjAc5oAma
         gIOM21ETW5oMCUjmoMwlYY/44gmmCnAQ3qmj4/GRjEZRi18mhSX/J8zpaqQkom9roau/
         Otz63XZ+X65QG1Rs/Ypv+lpu9PMfuu81wzsJAvlT1ya47VpkgbLnaRgynFDQ9lyoKE2X
         qb6KOHer4GzwzCC/5i61g/jSqQlJvZS9ha6pWIEIVnf+F6L6izohO2aiOAiyuC4sGsCE
         YvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060811; x=1785665611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlASkg3aEU6DCVKYIVsNYyPT/klq2H1IARTdtVshro=;
        b=eDU/lUfeCDtOqLK9TFa05Cr7qpHU3Sa3IHXqIijs4vmTHwEOsIVPHUi7q1xyV/3DKK
         BVQj37c1vzQYhOIRYOByTX5nEF+dmBQmRoITrbTCMkbO4FGZbqFqKn4bffrJkOPxeolO
         X4BoRwLE7PVbuYsCQWtagd/vD9ZLf/ObAhMrGrpOewnLhT92t+3ZTj1/3Vx8ZGOZvcF1
         8tjiszGLPNgj1qh+xtqm4J2aHLoltSDiiYW6BfMenJswEL1KystHE7/OowEOvs5Jn+Vb
         yJKKt+0Pin/0WgCl7svkAM3ltavX/pYMJ62ibWMxLiWiRG7evp5X35INFFFRzuYAlqm/
         Ouqg==
X-Forwarded-Encrypted: i=1; AHgh+RpOXziAXtgdi0L/5PUsX3akGUwqh8CzH/KJf3VPTSFUNQs1MWk7wfJPtxK5hPgV94ouS7IJqS0t8ue8uG08hH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeADIwU/dlq5tl/9UNgv/K2O96zw7tS0+63ADbghqVh3JtG1K
	MsCSOriuzkg0oF9jr0EeFp4mi4HAgrNv/evbB8g2HQcrlnj6frygH33OJuRkftk25kg=
X-Gm-Gg: AR+sD1028LAlX70Gd6QyBCzYV7RnD2mnP6/2kn4KS2HEEVJu5DvsVoaT4fQdPJy5GtX
	x5Rlhw2j+ZpnEaY/bWEdDkdCVnri+BEzo7uKI3rV/4CHKcvXnMOZmuSBzwMJ/nr6cvT8QyPGbcS
	M4e2wOdRSpPfnNIiV9NRlVFTlmUagQBP/0bxisMtzMW9JU1/e5TtW7voKBtkGl+FW7JGKUwl/x8
	t4rdGfi3kKg7ja2R58V3rzpjbR/wRExje0FvzjoHEGc8WY/qETPCXtljkASsxHSpV8qaVZ7dMz4
	yu/DAzAgTI0FU1VLNY1wmVEZfKub0aKKfpLCj9t9HQsXm8q67poDVRJkPM98pRirpJW5Y4D6RrK
	5ca5YjFZ6qPsPBN1gRRjcMgSoIfJOWmI/jn60DtmmsUOhYhUlIKHvYUQYCgAmOmCqGaFjvWAcLp
	MZgyiukcT9R3uT8g==
X-Received: by 2002:a05:6a20:2d11:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c67df2e412mr4352320637.41.1785060811108;
        Sun, 26 Jul 2026 03:13:31 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:30 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
	LLVM Mailing List <llvm@lists.linux.dev>,
	Yichun Zhang <yichun@openresty.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	gwml@gnuweeb.org
Subject: [PATCH 4/4] tools/nolibc: remove dead __ARCH_WANT_SYS_OLD_SELECT
Date: Sun, 26 Jul 2026 17:13:05 +0700
Message-Id: <20260726101306.3772237-5-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro lost its last user when select() was reimplemented on top of
pselect6 for every architecture; sys/select.h no longer looks at it,
and nothing else in the tree does either. See commit 668e43737279
("tools/nolibc/select: drop non-pselect based implementations").

The comment that goes with it is stale for the same reason, as neither
architecture can end up calling old_select any more.

Drop both from arch-x86.h and arch-arm.h.

Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/include/nolibc/arch-arm.h | 3 ---
 tools/include/nolibc/arch-x86.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
index 8681922e05ca..b88686fb19c4 100644
--- a/tools/include/nolibc/arch-arm.h
+++ b/tools/include/nolibc/arch-arm.h
@@ -33,10 +33,7 @@
  *     with r7 before calling svc, and r6 is marked as clobbered.
  *     We're just using any regular register which we assign to r7 after saving
  *     it.
- *
- * Also, ARM supports the old_select syscall if newselect is not available
  */
-#define __ARCH_WANT_SYS_OLD_SELECT
 
 #if (defined(__THUMBEB__) || defined(__THUMBEL__)) && \
     !defined(NOLIBC_OMIT_FRAME_POINTER)
diff --git a/tools/include/nolibc/arch-x86.h b/tools/include/nolibc/arch-x86.h
index fe152ac2650b..577e9b682eb3 100644
--- a/tools/include/nolibc/arch-x86.h
+++ b/tools/include/nolibc/arch-x86.h
@@ -25,10 +25,7 @@
  *     don't have to experience issues with register constraints.
  *   - the syscall number is always specified last in order to allow to force
  *     some registers before (gcc refuses a %-register at the last position).
- *
- * Also, i386 supports the old_select syscall if newselect is not available
  */
-#define __ARCH_WANT_SYS_OLD_SELECT
 
 #define __nolibc_syscall0(num)                                                \
 ({                                                                            \
-- 
Ammar Faizi

