Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5B4477E7
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430221; cv=none; b=Nkk4+1sZZsbsnGPugYwdHsh8NUP/tlJa+hvY+HEOOV5iMyIKekv4U+yfJE6wmYFCPDDLLp9d1NEB8+z+PCs+aSGlt8ApJT9bCoRuCun5+Hw6VT7e6wCG/e5s/3b2hQrmSiK9uQQhxhBjUG7uxzpyCk/AiVpF08Yvz7sT4s+gCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430221; c=relaxed/simple;
	bh=p8q8S+t50Q/lthBy7TyZdCyK2F1VHCzwEkcLBr2vUDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6+5bjcZPN8cVX8gzhB/bOpzhFQ+PR5tnLB0ONFw2gzBahzJn/7XKeZtpwdGua23KbwVJKIYIyGAI5juijA2xpBgWbhNOMZBIXU5yR4Fwqt4cm5YWOli43DOuZnfnJOIZ1RutM20ZC9yboB5ie/t3TUQFUZ3M2ri+95HNp8it2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7LLUJEl; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7LLUJEl"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8198a3a54d7so954760a34.1
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430219; x=1791035019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wesr4wlntThYfZMKHQxMphlwtEmOCUFLraCacdEeC6k=;
        b=O7LLUJElr0QijasfqzYdKLAVRU8Cl6AWl7oktKCszr47ARk8Tbj7zi/hJ7U/qa2KsN
         QGw/8iyMaxLYGcvXPebgvQDcRa3+NGn3AS72LtJFY4aW9LY8KM4Ke0S8eu6NGkalRV4h
         EKFCRmkCxsqjE3iSEVa3Cqw702O8cz7P0k0xNsYVpXbyV1fpngAf7yhR9gy5nVpJmNin
         1RFnUVaUdvmOmkf840x7gVkLuUHSXawZb9+4HyEDKnaFyNsS57QkaqB3uoGtDn3JD9wM
         JwDbBzWJ215x51loVFVOyIjiY4C0sf0QwLZfcpMGxwNNAGFCE4lsKfXhSexWNmPIOuhJ
         sCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430219; x=1791035019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wesr4wlntThYfZMKHQxMphlwtEmOCUFLraCacdEeC6k=;
        b=leL+Htdql1SCnhW2UFMLKdIX506FOBXPuDFusJQCOHsyN7hs8wXJvJ/VoJAzzKg5wt
         vlKIMBkBk6IxUwb6vDbAXyNea/lQjVsd74sj8rcvka4LlSM7+6QJaQ29ZVS53I0GM1G3
         zw2rZTBbo9QgNOfTo9m4VLWn8kdAW1HOTqolz90A2KE0zZCH12y2XvJpRfiO3AJFgQgo
         1wt+QTHd6aLsSjSuhC6zWWtq9RZFbaPvOPkFNZFCwBbem9nuwfhvbifIBN1v9X9nVNl9
         qV1JjZCxRbYekR6p/xv31o0q3/moD3Z0eC/nNo6s4DHZ/dAEJ5ni2gnEtm+gqWBCZUKA
         4Sgw==
X-Forwarded-Encrypted: i=1; AKwUvBwHOgb+ituryqu6zbnQS3LxbqvIGb5VI2aavnlvvQ/1Asl9ltDKUNUKhtYSe7aSLu2TRi1tOs3CuQ7blcbWKyY=@vger.kernel.org
X-Gm-Message-State: AFuF++lFXGnyJiPS7HmwVA1AlZG5cWknVlk/ZSS8lz7v4duC0BJ1OC2/
	H8SWd+dlz50Ic3Sje4vIAx7+N4lEKhO1HDv4gQpQDrOe9OBJkwWeAAL4
X-Gm-Gg: AYBFou3w1yV+vqJHG844BmkPjS1NQiQInsqwCFzb8nFvPRDB7+ePb5FD1oE6D9H/AW1
	2I/FD7XwGSGRNke/P3F9pUbY/8J3kmubl93aoy89/2L/13k6fg/fQYo5jCPI8UVIWN5DbfuLa70
	d30+4BjAOrCsXtpAHD1U6FX6fFRHsa2BCChLy5Xqm+qKv+oct0kJdP534Y3DPScaR1WT+x6GG0+
	JF6yThCDNa8dFo0N2xGdV1ag5tRAT8uAYszuhhNj9fTd3czUvoLuaVzlVSWY8r86HDQyKhiuL99
	CT2EvdOg53w4+9AglNuHbTvNfZwxVMEDinWVFwLppk0R2tqj7SURWIzT0TCB4+svRqqcsDXKtJX
	dYJ8SBmStXz5qZa9xycGDOfizDAQwbHq1BHfEaYgbgkTGTKHnAUKnXEDhXs1CwEIfPT20oMrdG0
	7qZEPDhqEt3vumwvfp7yzDiMz7jenIRmuEDXkw9ekNc6aC8XTZ8ennm7RMZzmwNo0ENkeLKdyP7
	E3XYZ+CJuz9t7DjhW87bA4FIDs4QjMK+gRUHzXjREJ3mXcLUB3o
X-Received: by 2002:a05:6808:f04:b0:4d6:9133:cfe1 with SMTP id 5614622812f47-4d72cd36157mr8644772b6e.38.1790430218897;
        Sat, 26 Sep 2026 06:43:38 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74281sm4452874b6e.5.2026.09.26.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:37 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 08:43:31 -0500
Message-ID: <20260926134332.58184-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926134332.58184-1-danishkhateeb03@gmail.com>
References: <20260926134332.58184-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() adds the size of its header to the requested size and rounds
the sum up to a multiple of 4096, without checking either step for
overflow. For a size within the header size of SIZE_MAX, the sum wraps
around to a few bytes, and malloc() returns a single page instead of
NULL. For a slightly smaller size, the rounding wraps around to 0, and
malloc() fails with EINVAL from mmap() instead of ENOMEM.

calloc() checks its multiplication for overflow, but then passes the
product to malloc(), so calloc(SIZE_MAX, 1) returns a single page too.
So does realloc(ptr, SIZE_MAX).

Such a size is usually a bug in the caller, for instance a length of -1
used as a size_t, and returning a page instead of NULL can turn it into
a heap overflow.

Fail with ENOMEM when adding the header or rounding up overflows, as
glibc does for sizes this large.

Fixes: 0e0ff638400b ("tools/nolibc/stdlib: Implement `malloc()`, `calloc()`, `realloc()` and `free()`")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdlib.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 6c3c620a04cf..ea315e60cdeb 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -130,9 +130,15 @@ void *malloc(size_t len)
 {
 	struct nolibc_heap *heap;
 
-	/* Always allocate memory with size multiple of 4096. */
-	len  = sizeof(*heap) + len;
-	len  = (len + 4095UL) & -4096UL;
+	/*
+	 * Always allocate memory with size multiple of 4096, and reject sizes
+	 * which would wrap around once the header is added and rounded up.
+	 */
+	if (__builtin_expect(__builtin_add_overflow(len, sizeof(*heap) + 4095UL, &len), 0)) {
+		SET_ERRNO(ENOMEM);
+		return NULL;
+	}
+	len &= -4096UL;
 	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
 		    -1, 0);
 	if (__builtin_expect(heap == MAP_FAILED, 0))
-- 
2.55.0

