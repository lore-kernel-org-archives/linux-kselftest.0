Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61D379EF5
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060805; cv=none; b=LT7koaLrkAPEDu9TJK/6f/0r3n5OFOrcfYcgj5ZXTpzIBQYQsAgM66Sn0DbpAynUdBqY5TNJ/4Q6cdbBFKlofIGdiIA65MKE3qneP0WCm9KJjNuZBqBsWL4KO0cUEjYvaR8Z59PdBur4Q/N4Yjd5d+w11r1BWBWMZ3SCS+Rb1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060805; c=relaxed/simple;
	bh=QOdOi199BViQDB2zktzRARAZBH5W7lFBr1ovz4QbkjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rl5wNk1mVdQDslG2IZsgCb+HCHRZrIvrLXYp/hIk57gun8ysQ6Wg5m8S7xBORbGZ7iD+vdV47m51EaksxWZx95qWQqm1zBSaZnjjUzVZfGoXg5UZJtz5/g+EWT9TaSgmcOJz1ofCLQ7mzLN+bTu2vfsDG2SHvls1M7SnnK9LD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=Q+tDLb/H; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="Q+tDLb/H"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1823130a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060803; x=1785665603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzYyTqubCWXIpDP8ZIyMuH6xumXv5Qqvgs5r4fwNWNM=;
        b=Q+tDLb/HpocUsmSxUhUDhOh67cpBs1Moe0061ZdIjhmXTK7clfBaOlN2GCr7hNjRT8
         mz4qS4eo7cI0o30+7Fx30731OxfUIWSVowU2b6MhMcBM7+MefIAcJXK8YM8qpdJDBJO9
         KbRytHtqjfnPgAiwTC3xqZ8PRk2Ahj/swfXLHIY9NnDfzSyFOagffak+3d1d8Mbu/93R
         tpAo7nG+K4T4ojYWiyll7ak4XfKvCl2WDwiY24pl7w0rOn6mQRq42XMFYpaTTq7bDezm
         GzllMfiokhwBI3FdwCLkeLXSBmUHSyffertgTLM3fPCy+8bXTc5y4bnW5fd9cLk+1gnc
         4PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060803; x=1785665603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzYyTqubCWXIpDP8ZIyMuH6xumXv5Qqvgs5r4fwNWNM=;
        b=j1ydj2UDOEllqEpBG/6Z9eUlJKNYNi0c6V9L3bCc5AyghmojXcl7UgjPjqUzw1sM0B
         HXsOVLm52dGXXQxZyWrE3V+XJMS32SIOlVaN3YWLv4UfAIRW4cb0Cl0fCP/yJRxWarZT
         OXgXQ0Y5XvbHkAQw6PrpwmPhqxatzsO8HFvO1uI5ZheGmSVBydVV6h9FlbjIpsjSKYP9
         UHCX5rP3yBpgfGGl4A9fWxQtQpHXnrUuHlZFvdLchYuGBOZohm75zLNevSYjqmvMT13m
         R46IOOI3ihbHBalmge1pT4abBt+ap13i/xEo8AGuJ26OOK4Lz+wYLPmpgUvPN9dEK4FW
         0RxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZBNFmc8jfYsWvuk2vZE3GkBX3X82NvYijeH5VppSmCicrPcUCntmYzTdfZtWdHr5W5b3HZgcAgzmLZQmy3Ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLfXsamI9dI+8WtYQagXDy+WeglrnlEfP1dIel/I89FJyBeWyD
	aP74rPUhDkt9JUf5VERFJNMLq5zBJHK1rK88GWEOLxtO4FhW225bnAbrSGOgYQ8aEYI=
X-Gm-Gg: AR+sD13OWVRqX8QjVqiMF9LOrPgQtCWoVkJYoyqBKt9Wuj5dmh2SDmB/EPc7lxvpr97
	rQnmnAlWXvTEkUS6H3akYzn2AnWmxvF+mDAsFbKvynXCPCT4wowssWAcWTN5CFBLwVlJin4ornU
	dUU9Gxp6ZkgYjuYh1K5L2yi5D2t9lNcR0GjlvFefKqcufp1Jl27XO8V044y+za3AVkLXfe6g81k
	0qxTu3tEE57vZ1z9aYXUK3325i1of4HExvGCUi8tHeh2ZWpK8Spnj6IDEoxNI+jNK1w0sm8BXiN
	5ns56Tp/7rojCkpVjO3AT2QD4YhpYcI6sgnh0qX2jqUSEPMO1ME7V1lBF4XbMH31IV3P0LbTigP
	xfFNDyaqCdJmrMb0yBdAx3laz0+z6t+ng7YjWC8/PDkm6h0kfYzIWMEy+E9Ut/LKFw75AmTNtCc
	JOnsjKAB+WIvdFiw==
X-Received: by 2002:a17:90b:254c:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38f298859c2mr4688509a91.40.1785060803000;
        Sun, 26 Jul 2026 03:13:23 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:22 -0700 (PDT)
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
Subject: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs() and friends
Date: Sun, 26 Jul 2026 17:13:03 +0700
Message-Id: <20260726101306.3772237-3-ammarfaizi2@openresty.com>
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

Negating the smallest negative value of a signed type overflows, which
is undefined behavior. The selftests are built with:

    -fsanitize=undefined -fsanitize-trap=all

so a caller passing INT_MIN does not merely get an unspecified answer,
it dies (on both x86-64 and i386):

    A simple test program:

      printf("x = %d\n", abs(INT_MIN));

    $ ./ab
    Illegal instruction (core dumped)

    (gdb) bt
    #0  0x0000000000401009 in main ()
    (gdb) x/6i main
       0x401000 <main>:     mov    $0x80000000,%eax
       0x401005 <main+5>:   neg    %eax
       0x401007 <main+7>:   jno    0x40100b <main+11>
    => 0x401009 <main+9>:   ud2
       0x40100b <main+11>:  push   %rax
       0x40100c <main+12>:  mov    $0x80000000,%esi

Negate in the corresponding unsigned type instead. The value still
cannot be represented in the result type, so the minimum is returned
unchanged.

Cc: Yichun Zhang <yichun@openresty.com>
Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/include/nolibc/stdlib.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1816c2368b68..8d86044f759f 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
  * As much as possible, please keep functions alphabetically sorted.
  */
 
+/*
+ * The absolute value of the smallest negative value is not representable in
+ * the result type. Negate in the unsigned type so that the overflow is
+ * defined and return it unchanged, like the other libcs do.
+ */
+
 static __inline__
 int abs(int j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (int)-(unsigned int)j;
 }
 
 static __inline__
 long labs(long j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (long)-(unsigned long)j;
 }
 
 static __inline__
 long long llabs(long long j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (long long)-(unsigned long long)j;
 }
 
 /* must be exported, as it's used by libgcc for various divide functions */
-- 
Ammar Faizi

