Received: from mail-108-mta28.mxroute.com (mail-108-mta28.mxroute.com [136.175.108.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E344C667
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490927; cv=none; b=ujsTe/gVTqsbzrVJ44UWgVY6k3OYH8QfSWHi8eQz6tcoecRPSzH3A0xqrr374ayfgzQmDW3nQHAPivFBgEnjqyxshaYgS99rWxowMrAVAlnxh3CcqjFZT8EhZNMjH7YC5h8v3WCFHP6UbsHVR7X26XTFC63WrJQZHOeAYQ5qrWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490927; c=relaxed/simple;
	bh=vQ4f+DdSut+dFxep7CZUBeHUCOigx2Bw4utbySVzbfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTNbHlYId14BnOdbXTpq/VmZF3u/t6IVptheY1QO1dp4g56gp7bdPeI3AKrZUH5bwmd5YbyehdT+uFL0Ga7u43A5BJ3zZ3mQxntB8ppQ9wzGddZn4YQPTCIvdofL0HkjwEaR+mz7GNV2SXyQeerrnaddu2w/yKlai2IELRTHfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=dUgZVSE5; arc=none smtp.client-ip=136.175.108.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="dUgZVSE5"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta28.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d29631800028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 20:16:54 +0000
X-Zone-Loop: b876eebc428b6d21123ae6e5875415761837701d25f6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=enDRgdVbSaqltWWaveoCJ8OEHuDYLQQCtusSj0dS0yk=; b=dUgZVSE5dLeN51Q6OErPAl/1q2
	AEAnSPZeKCIrdUft2MvCVB6VgvU+OLTVnwEHnZ1r/iH7g4YLiel4xaq5J5LEYGv1hWKmzpCfHR2h6
	jlPzWehUWmoj2IkGr7W11twe4Hu4MF/SklGEWSDLgvtroAOpJYewNgorrT71ERw8l+HsKXs+0/eOZ
	1903N/xEUAeOJZzXwgINPRKUsReNRBm27CBwK6hicsLDkTg+V6+Y/t+OMp11hJbB0q0J/2/jJ5UAW
	upVICMlLiiGhJeKmzR+CvSIcqZ1Nn0gyfndVK2OdTwbA8b9ROWa7pnCb5HrbgTkjTYTLGiXSFwWMc
	opzDVdbg==;
From: Richard Patel <ripatel@wii.dev>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is enabled
Date: Thu,  8 Oct 2026 20:16:08 +0000
Message-ID: <20261008201610.1003569-2-ripatel@wii.dev>
In-Reply-To: <20261008201610.1003569-1-ripatel@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

When returning from a signal via x32 or x64 rt_sigreturn, the
shadow-stack-restore token is validated, but ia32 (rt_)sigreturn
do not call restore_signal_shadow_stack().

With IA32_EMULATION, 'int $0x80' allows ia32 sigreturn in 64-bit
mode, which could defeat sigreturn protection.

Refuse ia32 sigreturn by forcing a SIGSEGV instead.

Fixes: 05e36022c054 ("x86/shstk: Handle signals for shadow stack")
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/kernel/signal_32.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/signal_32.c b/arch/x86/kernel/signal_32.c
index 8e87ab586437..a28e750b4e6d 100644
--- a/arch/x86/kernel/signal_32.c
+++ b/arch/x86/kernel/signal_32.c
@@ -32,6 +32,7 @@
 #include <asm/sighandling.h>
 #include <asm/smap.h>
 #include <asm/gsseg.h>
+#include <asm/shstk.h>
 
 /*
  * The first GDT descriptor is reserved as 'NULL descriptor'.  As bits 0
@@ -109,6 +110,9 @@ static bool ia32_restore_sigcontext(struct pt_regs *regs,
 {
 	struct sigcontext_32 sc;
 
+	if (shstk_is_enabled())
+		return false;
+
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
-- 
2.52.0

