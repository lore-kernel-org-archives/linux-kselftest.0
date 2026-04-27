Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391973B4EAF;
	Mon, 27 Apr 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291445; cv=none; b=s5XRXlz0nkGf9H+OGFaNet/MGZLCk3/FNtzmrjcASiqhYpTugwZddhuvKFLM7noCgBmp5rjUfJYUs7mnaIPwDH6npzhBMs3frc3URaZlsJ+Dgxm6cMrUFTlHT+ImFvmXEs/iXaPyQshqwLpMTfKz0gMzirkEGx49MYbu+V8DAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291445; c=relaxed/simple;
	bh=awcZVPdgr4NoF6FXkdZLV9n173eUmmWJVTl+xzU9qi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jz8EtnLCLJEV/rf09BR5fRPcYvu0O3h3s8Okua+iNx/QJ8JJ0pOtLL6sC9UChxOTlgCbfcdOfPtfl30eQRnC1DPZWlKbHG3Ms2Ks2BsWjrddMOWboPrlvHKGLyZQizNeIU4F6J1M8h+qVFZF5yHXfowr1ZyyFtz2o0i8HXRpLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=etUonoN6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="etUonoN6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27EF4237B;
	Mon, 27 Apr 2026 05:03:58 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D033F62B;
	Mon, 27 Apr 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291443; bh=awcZVPdgr4NoF6FXkdZLV9n173eUmmWJVTl+xzU9qi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=etUonoN6yDhxKa6hqLVL5RxhyWOxzED9Q58uZo0iPeFyW4oCmYJkq8Lttdn11mcQJ
	 Yu0mQ+jiepIcjiXT0sced8SveI+geZ8cg46DEctgDeFySf5k863kuKk0/D2yyElW+Q
	 qBMdUlbRGgYjwOqzdfPCbApXucgS20R46HQoI8j0=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:34 +0100
Subject: [PATCH v2 2/5] selftests/mm: Fix resv_sz when parsing arm64 signal
 frame
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-2-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=1455;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=awcZVPdgr4NoF6FXkdZLV9n173eUmmWJVTl+xzU9qi0=;
 b=HUE7VaV5mymXwUwqCX1U0mb2g/qez2BgKu9EqDu+FVf3vPerOr9icMeIKp6NWvRlEynUXEsXu
 6AbWmvJwVciC+2FBPdj7AuDDoP3Y49f/5k9SEqqhbMvqVxsge4RRZ1b
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

get_header() wants the size of the reserved area in struct
sigcontext, but instead we pass it the size of the entire struct.
This could in theory result in an out-of-bounds read (if the signal
frame is malformed).

Fix this using one of the existing macros from
tools/testing/selftests/arm64/signal/testcases/testcases.h.

This issue was reported by Sashiko on a patch that copied this
portion of the code.

Link: https://sashiko.dev/#/patchset/20260421144252.1440365-1-kevin.brodsky%40arm.com
Fixes: f5b5ea51f78f ("selftests: mm: make protection_keys test work on arm64")
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-arm64.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index 8e9685e03c44..c5a78a2f211d 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -130,9 +130,10 @@ static inline u64 get_pkey_bits(u64 reg, int pkey)
 static inline void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
 {
 	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uctxt);
+	size_t resv_size = GET_UCP_RESV_SIZE(uctxt);
 	struct poe_context *poe_ctx =
 		(struct poe_context *) get_header(ctx, POE_MAGIC,
-						sizeof(uctxt->uc_mcontext), NULL);
+						  resv_size, NULL);
 	if (poe_ctx)
 		poe_ctx->por_el0 = pkey;
 }

-- 
2.51.2

