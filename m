Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082131;
	b=TRWkAbCoQsQTKLpPadKqbob6nlgLF+fWabREseNvoQvhU2GBu409AhfXLpxPKrye9cs+
	 HWD0/KL9d6ieX0v4MlfOGgUmPyWzlaSA7gWSz3JqXhsXLzgxaq0EXr+rq1khgOAeTy6m1
	 tl5RKmHGsDIt3+fFlzkKhiabgVGs3G9e+DRyAXqLW8g0O7jxP7yEUsCbCO3MG5FAyqQdZ
	 dPiPNBSe7nbqtsXu6ExlX1XugTADepzeYGU6j7oo2ks8y8uKZKDlF+cQYTN1mdU/yDwFJ
	 jqkxRB0EmbLqtsDtSUYxjyCcF8qF2we3Z3+zYaOXYira/Eb2kZKi6TaK9IvWfpqKklg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082131;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XIB6M4Pn7MaMbV0LjTjtc8YsdU+Og6VyAOfbG5hYnZs=;
	b=zWGG4DnfCME/hOoSJBGvB/R1khSYN6msyDi6FDgKgGj8rEzAA9ZWPbt2NEOUHuaqJupE
	 phmZGT6KUvocVY6D8+HNkJKfWNelo4tUxPPnhdNr0v3XNm6BnJXX9dXIkhp8eCWQojfpe
	 zz10RPNEyJg+OgoVRVRTCC8fOK+l23GrsDouam8QyvSALGabBW/zF6z2d9Zcqy6XFB0d+
	 pR9VsQk3HqErRXXqqJSxoywOisZwItjRTTp/YYZyaN6zmHJ2yXFbJ2Rx8te1GwuqoBUY1
	 ay8B6HzUjfyAD687I6HFH6LOCz+T90NV/W0qLSMuxPbPViLG7tijxSw/JCvAH+7pFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="C/sbStvA";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A68606A33B;
	Thu, 19 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A68606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C/sbStvA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD87F19F0;
	Thu, 19 Nov 2026 01:55:27 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E003F882;
	Thu, 19 Nov 2026 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795082130; bh=syb2Id5d1NmBSpb67maJTDdXcKDxidynmk4E6xC0f6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/sbStvACwh4293rdqcZbO7A20EUjzcMPsjbu2yAehjXdu26ZKoSFbWmVya/qVnqP
	 /KFPZtZIYPQNAqJDBSEweqQENBb7FZFvJc7AC3Dn0sPenaEoAApZ5dNueUA1gnRLiC
	 m0wXfHZ42I5n6x8cx+VCjAyJL1BIFBfTAsavjgSA=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 09:54:37 +0000
Subject: [PATCH v2 1/2] arm64: mm: Add note about overlays in PIE_EL1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_futex-v2-1-244c7a01f788@arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
In-Reply-To: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082127; l=1292;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=syb2Id5d1NmBSpb67maJTDdXcKDxidynmk4E6xC0f6Q=;
 b=QU0NeRBExCgHLxzTpAHbmIHRYXfarCeSXRfSgUtH54+6hKG2x7PQrwZ2hKaKesjyq5aDJvLKE
 rHf3XYRde3oBzBxD1cj+kk3FXugea5QA7duibMWapyIW/fawi49cT4z
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

It isn't completely obvious why user page types do not have overlays
applied in PIE_EL1. Add a comment to that effect, to avoid
unpleasant surprises in the future.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 590ef4328f12..e6788e2e23bf 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
 
+/*
+ * Regular user page types such as _PAGE_SHARED must not have overlays applied
+ * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
+ * would break futex atomic operations on user memory with a non-default
+ * POIndex; the privileged atomic load/store instructions would be mistakenly
+ * checked against POR_EL1.
+ */
 #define PIE_E1	( \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \

-- 
2.56.0

