Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73F274B2A
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235562; cv=none; b=PCcoNcXhLJZ5BkoF/Q2gH9K8NeChTAsLDqrAF0b8x4CyoKPS+2nrui48mivwqCGmNro+lC2sOsOrz/Mk9mPkTaMi1a/1UyR8QXoTy4yAeafkjkJVOLFMYWwNzHBFOg2OnUE3WU1BLXiRebAXVEbFVeHEcfqpnpMFpkXsyW4Bxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235562; c=relaxed/simple;
	bh=zUJOmTvUfrfnyR4xJIXA8bz3JqbLEgsuYvxscT6jdvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ni8Z0D1Qrlg5cydlr/ufVhxISnLLyx91NnvtLug4fQCij7qsHD/8GWhPleg9I0ysJpEQKnBi6FnAGz9sWL+/ta30vLndDW56ku3zsaAIpbtqK/JNCV0Si4uCHWimzMmquYuMOrxcs9+SC3tvVwJRA7NyLzYucmYLqrQxMk2afF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM1fSipm; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM1fSipm"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2c0c2a68d01so3212565ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780235560; x=1780840360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5m0c+tBqsdkoPGavcwU4mvnSNAG+RuBjE1F5U5kFX8=;
        b=MM1fSipmfSYsHXCe4ltitD8Qe579TAFrMtfTmrrsRWngakfaISBh9X7eSSK37WNtHA
         0mCaoegj/mUvwWYWs6y6/XH+q8myvO6oNyIKMuJbci2NwaUZMMwLnNFsUJvaDe8zKNNY
         nQCOuGUkulzytQTrU42HcNaRaM6L4b1WmqfGZalWnJp545mhbbBte48OcbjxdLr0xJL+
         FKZAAzh+A8zFDHXNrCSGp6YQz6iR0ADiuHwfslAXrxHrorH6vUlgfVvFecbyZXronuKz
         +YA3yRM6vHHJ+HgwmiVPBTtmAANx7taDUw6X5fP31HImFDd0Jnhbq6U+y3G2efufDUUZ
         iJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780235560; x=1780840360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5m0c+tBqsdkoPGavcwU4mvnSNAG+RuBjE1F5U5kFX8=;
        b=rE1wXIhSSLpfVFXY+mIx1dnq6i/KkRm7vpHY9Az5zUc/9cFdDLCdXqbuHOPq8G+kfL
         KnOIB/pwiXPdb+LPI7wvtjXpZwCf5ORBIT4jtgcFlFzROOhXU5rXRkl/JpDQJZlgl0xd
         YJZIHXS5x2eySualVuHCZL5weYxe7PuWOGEdwuj4cVFXjbodw0Ic/t0R9X7zr7MSrlLl
         0dCbT6z47pCDXNvyu/Y2kRCIXvkl+SY1OmlmqrVMg3GnGCnfpdyrOVRnWSAM8IpaGXrG
         tn98zbtUMaao0G30aLl9iLiLbqL7k9OIwe5wm0dT9ACJGTN9aBQWVdhsQYAVzlgBwAkK
         Vz+g==
X-Forwarded-Encrypted: i=1; AFNElJ+W90z8kqcM51pPImymlbnC6Str4lNjBho5lxRfWR+b9Z7uVCSENxlLrxShdJ1qfif9wFzH2sUga2/X4/Nnpcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkVfxY9VZPoXEZ0zgXbLz5/tcpk2Jc+hHLwMaGQh1P3y1JDSN
	xpCTQylPFuWZw70E934nPhxRAKbrfZ/O9lNPe8op7qzeoTNWzfDmO+O1
X-Gm-Gg: Acq92OHZ+wWN2EXKSdxuQK7LtpXMlvKsqcBd6LcUoCxeq4rwsxy3DbyYsux+ZY61hGd
	NNnK9p4If1bDP+EYhfuKTBrQxh9gtrygZKX+Oj22kKf5y/nksqTqu76PvncPIaNitgIJMl2vm8w
	nYKyXBv8HYIQwmH1b9VyfgKgpWCoDKdTJM1XghRXz/iMYLkPfCQxncxi4yjInsNY65cY7o7yv+8
	2pU4OM+57bCXKoCAotqSw7DxPUF6ulSiJ9LVNnjx/WzBHnbMWHzfkWk59npe2AfJNtRwmkIZzj4
	AQgyzgBc6zZsO92NU+tLzqC/uYNEl2lvdVpDCvCnImR4lEtsp2FCB7/gVKwNuP71JShU+RJN94/
	A4QG1g7dJ2A+my7RHVu7Z+cDSAr+WVdRcbxqaIYL+AbOjF1kDp5I18+jXy+tBg7bUC05S3zCaWA
	d0LoaVRP1gkOoisHRq63k0qM3ddQk=
X-Received: by 2002:a17:902:f786:b0:2c0:b5c1:8e21 with SMTP id d9443c01a7336-2c0b5c1934amr43378855ad.16.1780235560490;
        Sun, 31 May 2026 06:52:40 -0700 (PDT)
Received: from laptop ([1.247.84.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c857729930esm7136137a12.16.2026.05.31.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:52:40 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-kselftest@vger.kernel.org,
	Woojin Ji <random6.xyz@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Add arena invalid node id test
Date: Sun, 31 May 2026 22:52:34 +0900
Message-ID: <20260531135234.233421-1-random6.xyz@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2845989f2eba ("bpf: Validate node_id in arena_alloc_pages()")
added validation for invalid or offline NUMA node ids in
arena_alloc_pages(), but there is no selftest covering invalid node id
allocation failure.

Add a verifier_arena test that calls bpf_arena_alloc_pages() with an
invalid node id and checks that allocation fails.

Tested with:
  ./test_progs -t verifier_arena/alloc_pages_invalid_node

Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
---
 .../testing/selftests/bpf/progs/verifier_arena.c  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/testing/selftests/bpf/progs/verifier_arena.c
index 62e282f4448a..91aa0941ded2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
@@ -11,6 +11,7 @@
 #include "bpf_arena_common.h"
 
 #define private(name) SEC(".bss." #name) __hidden __attribute__((aligned(8)))
+#define INVALID_NODE_ID 0x7fffffff
 
 struct {
 	__uint(type, BPF_MAP_TYPE_ARENA);
@@ -199,6 +200,20 @@ int basic_alloc3(void *ctx)
 	return 0;
 }
 
+SEC("syscall")
+__success __retval(0)
+int alloc_pages_invalid_node(void *ctx)
+{
+#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
+	void __arena *page;
+
+	page = bpf_arena_alloc_pages(&arena, NULL, 1, INVALID_NODE_ID, 0);
+	if (page)
+		return 1;
+#endif
+	return 0;
+}
+
 SEC("socket")
 __success __retval(0)
 int basic_reserve1_nosleep(void *ctx)
-- 
2.54.0

