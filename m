Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA307481674
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782465; cv=none; b=QgNyJjvGwKi+unIRiSVODzjtL+5d31K3XKZlETwD5Ye+EB+FmqE0nl8vdcajnB6im81mORqoqZwOGesVlITXzVUuClRRRu6kivLgNZENTZmDqwS0JT5n7grOls9mkcYhlR7BXwCtCr81ILwKtDRrqwSaxgGgkGBNOPf0cE+eShI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782465; c=relaxed/simple;
	bh=pXIKNBJZ7VpWZJHYVm5d/JqZ2uDmSW/zMvrAvNFtAkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEdsU6gnIYb2+8mcaMibf/wXGLpgNpDsTtU+xuOeUfgK69+vtzAaCF/Lr/1AhKhFlUEp1wtH/9u6Kn0LgyW+umg3TpohQ9TQWi1BXBU7pWvwFS6Ok0B4YOCVNOw76ezi/txv9zNOG3B3N06mXTr9Rg4jWH5PLut2Iv4ndTwXdiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjXhYYma; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjXhYYma"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d91ff7d9acso29000915ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782463; x=1789387263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=FjXhYYmaEauGGLqYWyyOJ4/1TC8ANJ74Q6/9Nj71oEAfnQSQ30dnWvkZjY+AfGgN/X
         GVkwV7JSgmUdMLSbloQ5YCnjkxV3M7QOceat8zEoHXxL1dWbaiEGcCMHEXmgKWLU7Gvj
         ThBbirWM4mRg6IibmJC77Ei3CVlRAiQ023ZDyk9Salpi2uhKjiBkXgc0LL3hSA979aO7
         y44od5gCv39+fodKg7VIdSVbnKgV/ZsxUwA0xPGTWvHd3qEicirEmRI7jwyf+VNFw9K1
         bTsRz0qnE7Ai24oH3GaTeE+RsTygeF2XX9eCH+KrKq8YdMhdKbXuyirTLwZvGqOMO9dN
         62Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782463; x=1789387263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=nwwXn9AEzLpUbCFnn8KRaIX+PBciQpAahPmwCSP5JCPiG+zsEdcgpivK4utMdZ9VWO
         1yH2QtuqZ3NU57S0kutz9jFO9SSGRHqUJMIdVlpbn+bFjNtQzczOlns1ElZEiMSyDmxB
         gccEwhPL0AMtgDJUAFDv9P7NCksVAhJYPLhAclBOOm7yM714YDD9c9zF3MeYqJx5GlSK
         aegIf9TmJBwoUwRHpGWpnIux9hv9IhA1kxdnmuqdecC8bhrmCLIY4pEm6sHEaJbtz9by
         6h62qrJhGit/LOhq72F1fZ2DEeDBx823+CRD3QppmZngCLC2eCWVHlmiyOsC/C+WnaM0
         9YbA==
X-Forwarded-Encrypted: i=1; AKwUvBzU35uY9LqYGG60iN7NHnC5YvKCpbZ2Wh0FGaYHpbfQqvQ6dwR3RaQYQHAp+hqBZgYCIPn9fMu6+o15V/Cufks=@vger.kernel.org
X-Gm-Message-State: AFuF++nxzwHPXAeqtQoiewSd5AfveMJbEArILDn80R/1rwVrQgxQjW4C
	cx9/p+H5yyIDe//XomY8GHTeBFfQPVavlomIv8+FmT58xRcnLaNRVWPB
X-Gm-Gg: AYBFou0M3Kzi7VsT5a5SDXNV5p1K63Wm1utpmtGRGUztgtdsQByPtstCClD0PU7K9Df
	gZ9/MKLzf/LE/fRP53L/iOvc1Rg43JdMNuOVH7ha7dEvKof1BHNci4khZ50VrW0ema2RdjnEjCa
	gc+xj5ZWFWC3oaNU5+Px/+wKbBeMMGBDzQdPl1Lnb7t9Z/08iN2YOr5uvRNaE2LtgQnlfItmvTA
	HRzk9Ub7qXsZfSpbPThle4T7UD1PvbWssUad9rJ3y0TzDVtIZrboWyyyUgoWsQgIdA0pjraBxU0
	yeGhy6k28cEwfgypvKDSMhpdLjzEAZXR29T2Jsu5hUOI3/0yrIMfrgQKHOKzi1Ltl/0AvZUGQAx
	3TjzV4PGYW7AIUjem2HU5mtaDRqOjNMFlPAKEiF09VD1Zhs1bxrEuJH0W7uDX4S+QWi1eV618Kt
	dAWHh9QlUZX4kJJnLbHjbH0e8lu44Ej5DEpq9xvIj83jXyvLuOiyb0bf573XAcw6hQ/o3mImG8n
	KZ6k7z4TeVoCA==
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr35003952a91.1.1788782463059;
        Mon, 07 Sep 2026 05:01:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:02 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Mon,  7 Sep 2026 17:30:37 +0530
Message-ID: <20260907120043.36894-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "arithmatic" to "Arithmetic", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/net/bpf_jit_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 9ede81afbc50..b1c21c014c9c 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1346,7 +1346,7 @@ static inline void emit_ldsx_r(const s8 dst[], const s8 src,
 	arm_bpf_put_reg64(dst, rd, ctx);
 }
 
-/* Arithmatic Operation */
+/* Arithmetic Operation */
 static inline void emit_ar_r(const u8 rd, const u8 rt, const u8 rm,
 			     const u8 rn, struct jit_ctx *ctx, u8 op,
 			     bool is_jmp64) {
-- 
2.48.1

