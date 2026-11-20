Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212219;
	b=mLZVWEx8hekv2CUAABmG6NS+8fPhH1wMTF8EyduUyPjCUANsnYyfxnqXnmEE/bZ4UpvG
	 tuDq+Ehr3B5H7XwGO7DlJURX7mTWeUpRJ9gEZKbHSZSAE3Zg/pLZZCQkO/U/00V0d0P0+
	 plMXqS1Bk6MpoetFH2jzIRqsLUEMUAkKvyJVd26WxhbutZlkDNoAtVRSmBMSjroXPLU3n
	 7kj9jsqtTm7JgOzGCiy4YZRTsjNITHlPPd6UtmBVpbtklcdNoQEpslBg7O8vf3kkNwVMq
	 Fr/D3+7xqhLzLkdFhvgrgwoshY5Q4LSowDB8Jifq7k215uotTRM1zB/2AMjdc5sFjlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
	b=hWv4THIKLM3WEOhsQlzCH3HcU1C8LGK/az1xrKiMKtjqb6u1p5cOAHviE9A9MPydavZ/
	 0I8UuGwIpxhex4ry5KXwuxJzyNUWQ2pL0r602y/bksbvRCGqnX6/CaiJDmaWLvvpgCryB
	 qZ7FBAKitVWVReWQ8vYAhMVzvLzxEVji/atfJjAfRUr3t9oenPe5OrNkXzQUmlrBZETYj
	 jkJRdjZLSQzM0lFEv7bYdsBkMJTF4XceaqaQTOXKnOiySaMSX4NB3KO2oA2FxSNHFSco8
	 dse33zgbm72Y6THOcxnm4hshT96VJt+sqv2U0H9iJbKYeiRq2VNQTkgo2XmbFToROSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE03606A691
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE03606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10201375e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212213; x=1795817013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=gOr5oD3+13AfWWQTSdFX3WSjjiYlo7c+u8wQ1CpkBAAkYZiHLLdq1kJqz6dWoUFll4
         C1RBB6n0tqmGlNxVAsLs7iuZnWNpLZurwoVPpz21eT+RBA7McTrgbgvy6C7GbelsSc3y
         ypNIFpDYCBppbKgTn8aqp/Y5wa4zdhsm+N1OaSfeCvRCN4fh6mvLvNp0FIDd8tuU8fLy
         ja4Kt6KPmeFNQSKjtu/Sfqd73q+HxLFUQdf6H0ad1TQhO7LztHL7NXupIvdU+PAptgvp
         v4/d/dGFiYBPI/hzuLYytMdzt0BA/YpVi+bDxjZcLZmcbRQQDlUamMb/S51re+P3L21r
         SW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212213; x=1795817013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=v00+19q0jjFe8T1IY5aQS7gLtFivJRZRx9O05kRMxT1ei3e4kXclCRLCgwOPhr+T/L
         BitfWZYfee+s8uAV1zZ5RA9mHhnJd7b2iFcXyiJn7eRT2//lY+NLwVEJq4Sol5Xw+nuH
         uWZWCpIQDknegpLjfOjky8CmIygE9Z/Oq/vLI5kRH3hROu8U6NMtQVt27PkEqGlLXfxF
         dxBtC5YXU+7F6rZwNzd/nCnyz0qMMGaDq4tncdgYuMHTF5X4kM8UFczAxG3usDSjoeeG
         KzoyBuNyhxa0O1rHwsfCae+FlE7K8cu/69Kq1EliTVrCLioQCTYquN3xJs29G+3tl1cG
         52hg==
X-Forwarded-Encrypted: i=1; AL+hErHiP2KPJidTXbVW4ENm5mUW3eX9l8pNMHOIe1348epn885Tbnh3F5Kw16T2u6HIUgxyMwfIGEMUZ4psN7Fq8PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UKflg45k43W3cwaaQu10UXSxOYINkh4zhEDda3vHPxvGsGFSG
	9fJ3J4QJsblZRlwOHeNnS8zBTe7blyjpc8/9IQzqkoNFqljQqEmSlhnJ
X-Gm-Gg: AYBFou03atC1dZcVEe7G9MwJAWsSLtSoWECfWKVAUHkBqty4+yuU/ZkE9oR4bpn65tM
	7FTmxzVvWtINJ+hNYul//wUm16k733wGRklzCyxMLm4tt6jfGjuN8pcTTLp4ALVs+fdQWPGBGV5
	c/VOFRfngiEW371mF6VIcenL1Wr4EDRg4vYlKfD1xuNqcVhKwr1JsGhObHZfr1ty6XpCEGw3+/E
	1NSfkAzGB+O8rRcx/OlZqfiT4d+hFjVEx7OlpZeSzytK5kSJa9eYW31NTCN90A+9o06sBPWiYzG
	IKMpieS4FGEEPItqUALD3xkZo4jcPTDFUuLfsVoPQ0feSrkeMY4ybW8hj4o327djVgP86mjPCgZ
	c+4jRD+50HwePiiUe0ZExDbFSiqXZgGYFrDo6ZUX2BiIbsW0NA367ENTio+tfuRE6CUCs/3QjHH
	DriMBav+aoX0qLLu+tRdGS4Mux+9Iiz2549oJgHuqXnDgfmKtejKWBCxQZyPZ2x8ArU4fyuqGhZ
	JZexyxGnkekDBBesFckPs0vEZGVBr39TL4ZJg5yAkAbKRMeuzRxnUsySWekce64aMeMUSYckDOB
	sluacIyW2AKXuhKSuDrNY/8U2Lhr4ZCHl6uFMmDWwmq7HJV3vJiHI3KraqgyLTw=
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr101074205e9.32.1795212212878;
        Fri, 20 Nov 2026 14:03:32 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:31 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:22 +0100
Message-ID: <20261120220330.1067165-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a single-pass csum_partial_copy_nocheck() for arm64 and KUnit
coverage (plus an optional throughput benchmark) in checksum_kunit.

On ARM Neoverse-V2 (3.0 GHz), this reaches 39.2-45.1 GB/s aligned
(1.8-1.9x) and 36.5-43.8 GB/s unaligned (2.0-2.2x) for >= 1368B buffers
vs generic memcpy() + csum_partial().

Changes in v3:
- Use a 64B carry-tree primitive unrolled 4x to 256B (~21 insns/64B,
  pure leaf function, zero spills on GCC 15 and Clang 21).
- Align @src to 16B for len >= 272, stashing the odd-offset bit in
  bit 62 of the carry counter.
- Add zero-length, 72/256/272B threshold, and dst[-1]/dst[len]
  sentinel checks to checksum_kunit.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20261114045500.v2-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 +++++++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 453 ++++++++++++++++++++++++++++++
 4 files changed, 655 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0

