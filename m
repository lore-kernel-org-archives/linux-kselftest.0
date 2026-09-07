Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133B37E2E9
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756716; cv=none; b=IKbXz44aFYrqOnscqdYsserrACIKfb8QU1zMRVC9LUf7/yrs2Uo7Y3/WrabSotC6l0ELGGfVh2KFHkjT6I1fHPZgGVWvVp54znuAAXFQ9BO3sFl8TZeiLAJm1Q4qgxYkBS0FqiF2dh9rrh0WOO4tO7WXOx34XyuVt6eJhddUXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756716; c=relaxed/simple;
	bh=WGtOQOgtI5Fvi9gfpYR69VsJM+hCLeDnatkdn+Q2LKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQetE6NJT1A1vaoi5EgKJWVWU3OVJRhDoxbfgtEaYHZ1mNsguvio8aowDh8spu6CRpdglo70jJAeVrZB0/euvXw2GNI8PwhD7WvElOYoECUA6eHwtRG4GLhg2Zn2vUaaBUDOPrOIf6uyeT6DlbeCyRZuAPCSdpMV6lctVzR7f9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv4oxIpJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv4oxIpJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853e2610bb4so2713152b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756714; x=1789361514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZDdWvx8nd79EclYwIbserkqXBmdMeyV10TLzPxe1TU=;
        b=Nv4oxIpJPqU7YNEbfXW/xZzG+x3fDC9m/DF2QQuMVAEgxpLVHSDc48xc+kBPWgcDti
         F/T93U9NdBsOJsGBU3gpco28cLyeGbxd4kLT5KwV4c98jO3ijn0ISJeOJbw0ogQ0PxLp
         dLfOHJ1YF6vacdUlePjdlDpoRhy7vOnd/VgeiEA9W44gVQ+BbU1fIfshow7Tv16bwNHc
         tnvnsBCIhHaYrlyoGFvJYMUP591ZrF65wSLggcOrWF3flt30+ytafy8q3YCTBwDo2SBI
         uX8+S7FZ1SUSaW9hi+QZs0DiDBMGHJH15wjSy+VhAXlNiEkaX7Xwgf27uDZypajVmKgt
         XBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756714; x=1789361514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZDdWvx8nd79EclYwIbserkqXBmdMeyV10TLzPxe1TU=;
        b=hnyw+xEM8pB+j8FTiO32pHfMflp+E+qOpDga3y4b6UybRwfaqxrDoTh1jdbVOdo2mG
         pRXZK7jGGOjliT+DrT1EZwDTz3oQGPFQb4frsnaZsToIAfBCMxtFEzlSNtLSdjtNEzAp
         fl/jGEGJj2soVxCeilUniYMS36XOrEgBamLn8NQWTLc8plqC8/GhgpjGjZa6YjzPi/Ca
         0OvHwx7NyWdN+0cYKpia1aE8yRS5dL6sTDxd8WQu0S1hLNZaNgufnaYflynK6V6FQgZK
         lPBbyHqv4YN4Ii+15PCv+jn5uWoT36G9ap4vRPb6zhAiuoEYioxWQeii/1hIaLCz7mXJ
         3gjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMBBhGksFSgFjPGrLvQOA0ygPGRfSdNP33pJYzbsMlhs0xQjl7ZYUBJ0GgVbSXCqHDtQKnV70D69PEduTQraE=@vger.kernel.org
X-Gm-Message-State: AFuF++mv1Zlz6hiFk7km9RUZq8VDgWvEhtfgM0rhm5IEVNiPN1SUVMbH
	SwLV5mDroT6Rb5wMpGrDsydSHZuskUzy1Neao5VcBXZOv1wPh9sM0Oah
X-Gm-Gg: AYBFou0XeQc8fW7A67fhrzxxHjER2+MQYaK1VHEoA9bTY4MhW/FNlW07TBLXBoSoyva
	C5KkIRt/qNn1xrNdr1iE8L/+CoqkRV8yjSicWwNlkMXNdsuK0X5gPxn2Syc0eCz5PP2a34QgqdY
	9k9Ad7DoZ1EN6spqZl3MmG7S+h/F4XYnM0EI7BmXE9+KJbDNN3+iS6nldLJM8uZNtvybmq/KKBU
	3mCbI6pyPKIxCzsd//N127OfsleMLKUoxRaTCDqZAXoKG2WRbuyjncnZ8Bm9q24O/boR9yhVsTI
	7dLR0/dWVCe8Uh4F6vgqvgibEqRTKM0hTmMh3Fk204njBsnyGIgUxOGui4yjNUPX+pElgjYUma/
	7PjIWk5LPiExDgD1OOygrCO1eWan6WprKbxNh2QCf7GYy4FlUxItTn0Fc6sR5lZt+BeBMf5r8k4
	tIG9ppDVSyw5BP01dJtarAlelgUZ3v94P7KxR34HEazkY8McpMB19pf8U9+E+Lwea4B6+q8zOjX
	rpyL6oREcvJ+Q==
X-Received: by 2002:a05:6a21:e082:b0:3d3:aed2:6f21 with SMTP id adf61e73a8af0-3da2160e09fmr24886058637.21.1788756714529;
        Sun, 06 Sep 2026 21:51:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:51:54 -0700 (PDT)
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
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Mon,  7 Sep 2026 10:21:29 +0530
Message-ID: <20260907045135.13317-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
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
