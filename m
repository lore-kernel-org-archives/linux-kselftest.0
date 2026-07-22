Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA28342538
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728848; cv=none; b=GT+AZ2yQefW+9zXgC965N7gzNh9fjqgMpQeprxh3OPlNY72aJvUsfwrG6YfNu1E/AvjHYYT4tSFfTIYpTJ7EOxbiODpXX6s1n8866ji0L/WHGmKoObEzyWqi7TlbPhNroZ5wx1yMqalDMjfVj6HYTJzwHXosbFsuzLFzsu+bhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728848; c=relaxed/simple;
	bh=F495hDoANVE0TNTS+OBWz3nMY99148N2vW8xj3+FBPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJHWX2BGc3xhYMMV9l7ieDfG81/SjeYGGhOzSNP2SfFj6R4R+tGCvcW9ZdML+rprIP8ZJD++BrpkE58WbVgS6OQ70MSTCsXK4qx6uoXBJJipqCJrJNYrU0jJ99oKeMux32h0Zl7M8sap6r4158HTkRs5mezmIpzQRwBJEM8iF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUt/uaIn; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUt/uaIn"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848d21bbaffso71033b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728847; x=1785333647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfYPTs27MYWGdTxiCTfoJlFIBIXHokfTJQCS/9/yrrY=;
        b=XUt/uaInwy1xCGEyrH2smh6K6myqBvCiZ4aoBmeUDtG0sCyUREX3XoDeW9Hfpn0M6z
         2VNGSA/0N+58siWgKv+/pZe9ygPnw5dWHAOBaHO5KIefeM1p0xzALwsDBl0F4C8LwKtK
         vGnPCpqEb8SqwFDaVqLeUIS7rWKfDMUC8pJSDmsOsykPm0qvYtYFBDNffYCJFrBb4iiT
         CPABsHgZ+elSoBAk+eg6n8EtX4SZSZEm5+CB0f6zGg7wYIYdnTV05HmPwa9EB+eXT8wp
         qapH08qaW24lfqqdP+S5hkG5RC8PLnoV39xZdZVG5NY+73tgrkdq4McdZ1xnVHM2h7GT
         U6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728847; x=1785333647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfYPTs27MYWGdTxiCTfoJlFIBIXHokfTJQCS/9/yrrY=;
        b=W27gtRn2WZeIgZbB81Etd/0EyYdtEzqBN59LpWlSBUVm7rsOXqcjUCLkCGuFEMocFN
         r9Kmb6g1HFkMYDc+zvO2pc0LD9hINunk+X47B4ZFTwn2tIplkFj9aZS/2DsdT8mhL5ll
         ekEyU31/oayHIuwvOGU72Dw1//uhsxNLMjhekauV8lhf/08TSL9VZ4YlJUClgr1hqq+P
         wKBR7UBZX2BNeXM5I2b8izxcJ9qH9XfQGp6BUD+ZuoXy4DoXcMiGC0Ux0YYT+0PhgYNG
         nBHGT3E7MZ7IOLOad+PapLKeSZN2/77r9ytNAI30QLw9+rZMsLyRsyx/yE8YGiG8JVMz
         R0dA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ4I7AD2oHhVzJnHW1rsP2Px9zgjmnap2hBsxzm3VugFLHQyzoR/+CtYZU8EuDPn4Z9QyVGZjZbDf/deLnHZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBb4fLeQtWzpwK1LXVtVTSHtvbGZysuQ4sfvSj8ObSmcXv0ep0
	S+r/s8p/t7lNzEDkQGJU83fA3isfR7XfsBpqOfz6WWsUFGPDediOlqWn
X-Gm-Gg: AR+sD12Xm+pFYQ6LSrbxy72ebEplqkrpLjTx01VnFfGQUhRvHpBbLNNtephvoANMAnC
	SBm9cQW8zHv0D4+BE2gZBL2EREYZKn5bZk/kdPCTzmbyughJWd5AXFnWWcP5saL9BPlFjlwN1cB
	7Rw2nuyG8YI7qhEI28Cs3EPrU46pIvsvxxdXXCivIF76dhM5OTZGqwVuCwhoLH4D7iQC6Nqtm+c
	XjYtYM/TJcXGelLeZQQ+m4SsfvnGBZzDhVVBdBZQcWabm4BXmkLwUVTdpin5syrvJYcwVld4JXb
	S0aQd/Kt4unNiNXiCKP1uWwW7qPTR5AwGLi9mM+7XpMIpgh0IVKr2tDfBwioWEFy0n65AxO//Dv
	ULF7wF2np9Xd8jky8eIb19pktw0DSpGIUo1EvSzLmRL3VoQaJ4l2R2Xi40B3I4AgO1mt+aMDeuM
	MpqTKAvS2S0y8ojG5+FcyC2SOsxmGxs9c3Ijk/0kV4td3I7rY=
X-Received: by 2002:a05:6a00:3a21:b0:847:8d2d:712f with SMTP id d2e1a72fcca58-84c29239a02mr24030412b3a.10.1784728846034;
        Wed, 22 Jul 2026 07:00:46 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:00:45 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 1/6] riscv: Use arch_stack_walk() for the kernel callchain
Date: Wed, 22 Jul 2026 19:30:08 +0530
Message-ID: <20260722140015.1982158-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace walk_stackframe() with generic arch_stack_walk() which
already wraps walk_stackframe() and is the generic mechanism used in
archs like arm64 to build the kernel callchain.

Also decouples perf from the internal walk_stackframe unwinder which
is modified in later commits to accept a different function signature,
which warranted this change.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/perf_callchain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..93a12d53aa26 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
 #include <linux/perf_event.h>
+#include <linux/stacktrace.h>
 #include <linux/uaccess.h>
 
 #include <asm/stacktrace.h>
@@ -44,5 +45,5 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 		return;
 	}
 
-	walk_stackframe(NULL, regs, fill_callchain, entry);
+	arch_stack_walk(fill_callchain, entry, current, regs);
 }
-- 
2.55.0

