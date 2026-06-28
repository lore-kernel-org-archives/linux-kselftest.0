Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F542C3768
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782634674; cv=none; b=SJCxP/saQGfdxLVxgrsa/Gs5yR57nBApkHRrMerdktMCfT5oULHCtRNU9S1piNKng/eSJTTcKvg8v2HxZknjkZdiB5jVuik+B0bhzLbrcm5nWn/YAhnXQPCI4IwLQzsXxk0eEXI2XuBndIf2SriuiHRlUzSWq1HLAwpYEEL4q/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782634674; c=relaxed/simple;
	bh=A5u4LAzVAFK4HP13JmQ/QCon/EhAKEfkFBJqMIm3bi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeImqDgkPBcgscc0R7n72cbVApzDMNtTuARq4Y7tD1Czx/zZyKiwvA6LzIzJgnVyXiRq94JDcSWYx4quQqkznfTMTJWt1z6VUZsFY9e8J4BJgAFoQKN7ELeKXWqzO/e3fqEYm7Inh3XTnnC2w0MyiK+JOtcg5Xkj6DjFStkgFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfgqFSxw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfgqFSxw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37d7c265ca5so1869662a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634672; x=1783239472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIbWUZbf4PMs4YBadVfF+7ZfJ1yqBeFq4gfTDljCk2k=;
        b=JfgqFSxw0eTSs3vnGzu/+Nv/3SK40lDU0QrM3Vd9Xs/GssvnnjamGwct0oSVW8KFj0
         x4fR3kAo8lBxlI3VpY+DNebQaxeA5sr6Ld5t57LnQbieFRuc2o+HUbWJ3Wxm8ReArXcT
         EV08868WYtzMxDWExcG9LCCDiaZ6BjOy0vPrTaohsrXHsB3vjINxF8ajgf/i7c9JDKLa
         ZCneZiJDN5ZhaqZxOpraH6ZqRaGpBTjPwRB2gLu1bv0HlZBeJTVWbifW2Q/zVdiUKGdD
         /A/FPiQQZ9kJbKdpkAQc3LGw9MeOPRziDvtMOiiRfmSDsS6JRR4zy5gLEVr/6LazhHjB
         XOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634672; x=1783239472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIbWUZbf4PMs4YBadVfF+7ZfJ1yqBeFq4gfTDljCk2k=;
        b=axsT68Nhdr83vh0lxXmzxGwor8j3qZ7OrItvkgN0LeR67gIjsw023PVyKepjA//1aH
         XmsNzlk78tMmmy377MCQeY50zSF+nMdjJMdu5a5z4DUIqdPmHaZ+YkWhZKHva0z5pYpt
         zDoWJnso757CYMFqeqXobotk/HnsIw1CSXFRDXoCuxRZPquMyIGx4oav3y63Sht/a/LJ
         /LLClreIZUQiEEqlySq5BxeIZbIVv6dL1EzkZuFqudGC0T0n487hNFjsVxC6wuVlAXmp
         bz/6YvRbSk5FIto/6ZbwkqMUqQZ3iIv3BQpZ5U4NBTocll/kO2tumMWNGYWV/e8UV2mA
         LjJw==
X-Forwarded-Encrypted: i=1; AHgh+RoYYMFcRcdsdoIMYGOl8C9xzcv1tDscHaawsfQFaAcySCm2W0qSuwfJTri+E9Meh47XCoBEDsDH58/aOqe82hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAS5oVOvhoHzN0VjGCEzyNsvzAJdcs3fyGNiNfzqxt4WFNFN6S
	A99JZfWF/KtU5tOngLmn7kw9sGxbmwD8Sm3guzX93PB/TIRzFI5540cl
X-Gm-Gg: AfdE7cmwXTU5Shya0+BSCSOMHHPaMusAMXHMOBQ9vcYJejetNQSKXJBgiy5TU9tUHLP
	tYyNAGEoiavmK+KreeIyMPEYUPafGm8X3ml6L8bV1BkdjvnNvPYX2WtJ2QAjcYloEJSCXsBmetv
	ym11xBH0bipIZ+ewYR8h6SQaQZO7K5PaGjSWi4izK6pGlgvEKV2atVptN/b7xSqjI5vJYTwSL2o
	84EW5zMOBe9tUswBQOJMFdCys1m1nzT2ycVwQyyGuCS4U53VBHNrRaaDDX0ympiicNv1cyOHObC
	XaxEEcZ4G2Swe9j9lutOkm5QlTR599cFpvo8Pfndw/5idAJWiG9DNRtjkFUGlPIMv1c/miXq7iq
	9RU058Yu1yhBPK4kn6i/63xyC2Gk2aepbAe9SxhaCizL/jcb6fBj/iYwIw9V2T82SNLzE7Tz4YU
	I1NvcWQnwqeYJvv+/4ddQzcFMChCcY75QIxMVGveDiQ1a+8En3u2SqLxw=
X-Received: by 2002:a17:90b:1647:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-37fd70ab29fmr2995751a91.9.1782634672198;
        Sun, 28 Jun 2026 01:17:52 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:51 -0700 (PDT)
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
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 3/3] riscv, bpf: Remove BPF exceptions from BPF CI denylist
Date: Sun, 28 Jun 2026 13:47:10 +0530
Message-ID: <20260628081710.113333-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081710.113333-1-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
index 4fc4dfdde293..9268351ce4c1 100644
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -1,3 +1,2 @@
 # riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
 tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls
-- 
2.54.0

