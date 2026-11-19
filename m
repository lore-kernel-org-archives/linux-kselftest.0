Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085789;
	b=rUOcyrzcSmUijM8FFlZcVs4VEtIcOeFl9MEu4WQySxRzcTg3eHbKbrgq8t26hCpBtaW2
	 aoqcCzxF6IKw49F/DGsvtAUjn4JHsFWhz4/53b/7PwLhvfqJvct0mC1owWI7jHVKneH2i
	 7zUseGcn9kCZjb3/zeHyy7Sbu+2db+YXQL4Wqc4B/yCQG5pxTeRsvjk4BFMNLIrLsZCUT
	 4WUGOQoC01QyjcYjg+PEU3CXS4YgFfEwKZRpTIJ8XDOFDv2ydNagBqkQ1/Gc0mIKAZzID
	 ihnrJvN9LNVmjSX8XiBpy3hzrZPCwgxFlphnv2ytz8wEZhxzxI/oZuVD3F6R/xL7VPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085789;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1wCwidvWt1cqBrbT7rjfx5MEEUDzKrjbVm0qxvrz8SI=;
	b=IldlsXq1HFXdegR/TsIHT8uHBKFHOV3fc40iLKE+3IiNeGd73X4TIe9dSvod10cwURwG
	 BRlJwhcD5iXm7OCPc8QF7sWovaFyPHyxxwktPcUzdvc6OpJQNhaI5lhBqh5A++ArInoIN
	 w6edIm8cco03BQhesEMMnydMU5XaKgK357fSXE6UWshoXptv+wteQGr773D2XPPa+1YBd
	 XH/lEP0PnYyuzWRMlTqbm9XBz7oQwCzEi68zm/+WK2+381QoZimk2BEGFx+pNItP2K51y
	 tJvP3PKAHkzRyQfi+PjDHOUtiqDcUghOTE7qaOJlkLZKArrVr60LwVTuNELNi5sxUnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LZhznp3s;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50297606A32A;
	Thu, 19 Nov 2026 10:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50297606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LZhznp3s
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A56C619F0;
	Thu, 19 Nov 2026 02:56:25 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13E793F673;
	Thu, 19 Nov 2026 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795085788; bh=syNZT2w4whFXFirm0x7ThuFyXkb0QRz/R/XB+nu4RGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LZhznp3sWko7nWnT1w4AM1ZfrkPxlp9uJ4cQHJYrLAGogHb19f2+CCdqZXCCFkxLi
	 CfU/uDi4fMU8wiRQ47SGjEMNJGJHXhCfJIU5lSd3fw83C2YkD7lbCXRcCBRzmdPkFa
	 5g4PZBAojJ3rdx2VsjDU3mDvScCaV+rpOGQBo3Og=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 10:56:18 +0000
Subject: [PATCH v3 1/2] arm64: mm: Add note about overlays in PIE_EL1
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
Message-Id: <20261119-poe_futex-v3-1-0baeb0aee0d9@arm.com>
References: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
In-Reply-To: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085784; l=1340;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=syNZT2w4whFXFirm0x7ThuFyXkb0QRz/R/XB+nu4RGI=;
 b=P+hEOkqyywAV7BHvXSFevUVvs54ph9TkqpVX92bDaWXy5GzBGz+QHx2dAwHP/2n5eIThYrkMP
 Orh87+nvP8FA0/6YcrdwE3S35twxQ9CR7epuNhdPJ1No+guFxLcB9ai
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

It isn't completely obvious why user page types do not have overlays
applied in PIE_EL1. Add a comment to that effect, to avoid
unpleasant surprises in the future.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
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

