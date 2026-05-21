Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C256837F738;
	Thu, 21 May 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356579; cv=none; b=lunWEA1Bgm8EV7Kn1oxLROIJYJq0+L+MtK0oTdYE5Fhmxjx5H5Dfw2hId5F9ag8ocw34Kv26ohgUZSK+FCpwPL2DBjeDo6zwjLKu0J3j56wd6GtV8rkYmoSxkxs/vPk5Z+SidVrIeCYqqKQJZ8jNPgLMpEondNuFjhFRsicCkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356579; c=relaxed/simple;
	bh=/V9dccVTY3QH90sv6TgrxJE8igX/oj1r58vKnvJCNXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6fLGXXbRUC7GX0LzT0I3hnmjwe839QtLhLuUsu0zchDY66X58AYe3E1VkIYQAeB32vWA0Pjz0DfBuLfZhnJFi8kagbHWMCk8YRwTpgGzS9PqpOr6ZQCP6hkDdxpqUNXh9BAodbabnwPVpPKSoc1Rwt2yJLq/HDQHdodRFQrzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N6Xa6iI4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N6Xa6iI4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318273D4F;
	Thu, 21 May 2026 02:42:52 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101763F7B4;
	Thu, 21 May 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356577; bh=/V9dccVTY3QH90sv6TgrxJE8igX/oj1r58vKnvJCNXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N6Xa6iI4OLKgifdEnhg8spdq0S6+o4M7BzhuWYSEGLEHZg0Tvomlbxd2y5zLmZWzX
	 dd69wuYAnIQDrYmCqXCPYSf4wij1ialB0Tp4JZT0SCCQToe6Vjy9UM5ZYAjUpla49A
	 o6/zP3GgGdVVG+SKuITvcODWSYArr+NhRnlBHlHE=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 21 May 2026 10:42:30 +0100
Subject: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
In-Reply-To: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779356574; l=1292;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=/V9dccVTY3QH90sv6TgrxJE8igX/oj1r58vKnvJCNXg=;
 b=D7ii9y0mSyz5i96pc6R74x6SA5NXGDpChlIxUyz0trRS1TnFEn9bUAI2ndbsaC6a0AJER80oQ
 n52VPbpEBS2CZnJNAFElJsXzoMCyLPEQS0TJHfiLfGHWHsYPKh060ch
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
index 212ce1b02e15..6e2f99820909 100644
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
2.51.2

