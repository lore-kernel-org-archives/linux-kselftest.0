Received: from mail-108-mta194.mxroute.com (mail-108-mta194.mxroute.com [136.175.108.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87881C84A6
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685629; cv=none; b=ODG03jjaQkQ3MR6k6zZRKClYBTAIXXnk1O16VW6t2E/52c7qb2JdbQQ1kxiF3MMSNtXRaIJ98ijdtehrOdCp5EcTa/X+kU/YOnDzdtRWa/Ef6tbic6YZ2P9HRNZjbkKkmZZM3kylEBT6nmcP2/XsxQqLukXSvOPQbOXFl2g/Fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685629; c=relaxed/simple;
	bh=U881s5n9/+Yxk0Tltn7Rw415Nvtzme8MYOKwt5z08hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvGGIm55Ax4xwkq8egHqrQoUF8gBcP1h9sYk93IDrCUWSSS4x+qBKBSWc9e/g0uc3mnddlYWDISrRYwnCTtOFhxDXsAhiY5koRaTNis/hAYGsD4ddlnArFfTfHPVsD9jSfdnfc5Fb4Jas+J5tMWlKMsvqJO50NgrXfw72IYN3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=WZ5fOsby; arc=none smtp.client-ip=136.175.108.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="WZ5fOsby"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta194.mxroute.com (ZoneMTA) with ESMTPSA id 19e991d9c9800067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:35 +0000
X-Zone-Loop: 61211984f4314f1afa8781b6f5215bbba0e1bfde259b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6AX3Kzk5v2aPc0+AOTs3qurotM7xs8HKDdOmhlGXq5E=; b=WZ5fOsbyQbvaroTQRcCkcW9W7e
	MB+jp/ZukqdrWvogamhTS44U2byoLfiZg6bTBv4LaWCHxhvcZgJob9h0CD8h18hwkc1ufuZwmowON
	G1Bu2wMt6UJSLzMAeah9MwIvZ+n0+aenatJ3OIHGIKOSj4NqaoQA8xfgS55xd90ArgXY6e2N6jF0R
	rASmViWwljyiQXEi++6WU+BQ64iC9RS5EZyJJwa1ndXofshSs/IvV/QvfRYzNI63R8KYTLL2J3iNg
	Nv986GsAOl9Oe33EbuamDCvlF4xO9LsFPmX8oYBr0rzpLOKZxjmYh9c9HOizmMxFmCakyv9NrkTgh
	t8HAxdMg==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Weimer <fweimer@redhat.com>,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH v2 4/5] x86/entry/vdso: build with IBT support
Date: Fri,  5 Jun 2026 18:47:15 +0000
Message-ID: <20260605184715.3383415-6-ripatel@wii.dev>
In-Reply-To: <20260605184715.3383415-2-ripatel@wii.dev>
References: <20260605184715.3383415-2-ripatel@wii.dev>
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

