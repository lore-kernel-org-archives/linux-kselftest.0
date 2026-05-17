Received: from mail-108-mta117.mxroute.com (mail-108-mta117.mxroute.com [136.175.108.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E03CEB84
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042963; cv=none; b=Sf2apxFIzDPbeV9mgxmZuwiL8/g0EW+jfJV2KYuTeRqa71UKpfVuXzUlFYv6faH8KSup//tYs73EVRVPL0HuR6nEoWZqwasj+AETmvtKMC2bQvYlpNdA7Isq9Z52Jn3ayYyJmAcfbNIu7gFbFsSsV22Zm1DAPCiobXh6MPIjXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042963; c=relaxed/simple;
	bh=U881s5n9/+Yxk0Tltn7Rw415Nvtzme8MYOKwt5z08hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoQtIlitOHasn5IopnSHB+50uGH5o2x7uMPuOrAXQ2z6joCJPxPY7pSYdUlgQhUiRz68KhPwtqqCylOTkoz2DazHVGSkUm7mRmCuXAT2apLQY5NkwDT/cNp00ymPJ1R3y3SxOJftD10dXd8/ZXqOtKWLwYcmOPhyGjyggs6IDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=o1TMQByz reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="o1TMQByz"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta117.mxroute.com (ZoneMTA) with ESMTPSA id 19e373480e300067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:48 +0000
X-Zone-Loop: 60849702f041d900edcad280bfa6ccb5513fec49ba91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6AX3Kzk5v2aPc0+AOTs3qurotM7xs8HKDdOmhlGXq5E=; b=o1TMQByzpkn/0HW++VAR9B88n3
	Q0QyB2b8MhsRpQ01mQH8wR8pze1pnLo1a77d0I8SkTTvwPavXTib2JP4i/W3oQADzUiX18/WK7ulM
	Lfk6qbmsMFG7D6/f1DuHbBb7Y2wLPRhL8B7Lcl0aoe3XLs21lUZ8KIGEZawQdFQ62ILtqhdKiLOg6
	AbKgbqYF/nThoII66DqkK2ibmR82McGSrAHZutcfQuP7KTk4qJXLVZZWNMGSLkU2KdEZ4Km1545q8
	lwrCRRD/7DD6kfrWJ47kHA1OPdIDibYjdP46GT+IyiQzy2OC73/kwXmlSvp7aKBL7bqDi3g19M28F
	BunCROYw==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] x86/entry/vdso: build with IBT support
Date: Sun, 17 May 2026 13:30:23 -0500
Message-ID: <20260517183024.16292-7-ripatel@wii.dev>
In-Reply-To: <20260517183024.16292-1-ripatel@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

VDSO should expose ENDBR instructions now that usermode IBT is
available.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/entry/vdso/common/Makefile.include | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/common/Makefile.include b/arch/x86/entry/vdso/common/Makefile.include
index 687b3d89b40d..a0dc69b7a330 100644
--- a/arch/x86/entry/vdso/common/Makefile.include
+++ b/arch/x86/entry/vdso/common/Makefile.include
@@ -46,8 +46,7 @@ flags-y += -fasynchronous-unwind-tables
 # Reset cf protections enabled by compiler default
 flags-y += $(call cc-option, -fcf-protection=none)
 flags-$(X86_USER_SHADOW_STACK) += $(call cc-option, -fcf-protection=return)
-# When user space IBT is supported, enable this.
-# flags-$(CONFIG_USER_IBT) += $(call cc-option, -fcf-protection=branch)
+flags-$(CONFIG_X86_USER_IBT) += $(call cc-option, -fcf-protection=branch)
 
 flags-$(CONFIG_MITIGATION_RETPOLINE) += $(RETPOLINE_VDSO_CFLAGS)
 
-- 
2.47.3

