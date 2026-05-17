Received: from mail-108-mta189.mxroute.com (mail-108-mta189.mxroute.com [136.175.108.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3FD298CB2
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042953; cv=none; b=jR0rZ7NHk0muphQFRPyaFmfXiM9VjfslKFC+0jZoJS5so5Lo9U1iWd8wzvTqUqlXeyOGoyYclXuXbFVy5+T74kxG3Q5VRvkW5GpfatqUh76XP6P0iODWSy1ZUxcvgXVfQKx+j68vafLVrzDzlz/mF1BiEDumq0xTERmWseD5Y84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042953; c=relaxed/simple;
	bh=b5WOFM52SN13MEtWftN752/9cLw0JVPazUMHSdNkRmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQxXNSUafqYZ3TR4upSfcpMM8lhC4DInUWNr5Dl/YvJoul67ibc0cboNHHoFibjDFsqkNxDs2lJu26Qv0ctblmUL1bwtUMTc8nhcR0wlR0osB83vJLwhnQZk+fKYWUB5Wxj//MWfuybHIanrmmr+ALL1D8yMUXPSPNdzQBWmsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=PSmxD8ew reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="PSmxD8ew"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta189.mxroute.com (ZoneMTA) with ESMTPSA id 19e37345e5700067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:39 +0000
X-Zone-Loop: 77a3eaa4264acb51fdee6308867b75330ba2aba5a46c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZjosEJpA1eXZ50hc7mf1XeR3qMEd5tWpuh367jDJpcc=; b=PSmxD8ewiMCz1ScvdSfi8f+EQL
	IAL5//DWcIuhw6ps49JXXZmkio18k9x/TlqE5cDkdwfqQ5Rg6H94NFbXbwY8RiJZiCgVWRUPveHvS
	tcFX3f15NCgga++KnOAitugfqKC0vp7FTfXojnAgcAhse5rahnO8iGud8swYUK+e0/7t3m2Z1T318
	iQUHBkJWShIRKOfEur8rUkl9W+xrKFh9pr2WrW1hEPQoJ5re1EoP7nIRMXJNl0u2W31GLD1aDhkCD
	RKts/3W+DwxMhthcsCeo2o6QJJzOpbHRoXp85zakTJm2vyXsjXz1noEr1geYYKy4C0ORtu311knvs
	RGIbL8zQ==;
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
Subject: [PATCH 2/7] x86: shstk: don't clobber IBT bits in U_CET MSR
Date: Sun, 17 May 2026 13:30:19 -0500
Message-ID: <20260517183024.16292-3-ripatel@wii.dev>
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

Updates usermode shadow stack code to not set IBT-related bits in
the U_CET MSR.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/kernel/shstk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 0ca64900192f..ff4106dcfec4 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -150,6 +150,7 @@ static int shstk_setup(void)
 {
 	struct thread_shstk *shstk = &current->thread.shstk;
 	unsigned long addr, size;
+	u64 msrval;
 
 	/* Already enabled */
 	if (features_enabled(ARCH_SHSTK_SHSTK))
@@ -166,7 +167,10 @@ static int shstk_setup(void)
 
 	fpregs_lock_and_load();
 	wrmsrq(MSR_IA32_PL3_SSP, addr + size);
-	wrmsrq(MSR_IA32_U_CET, CET_SHSTK_EN);
+	rdmsrq(MSR_IA32_U_CET, msrval);
+	msrval &= ~CET_WRSS_EN;
+	msrval |= CET_SHSTK_EN;
+	wrmsrq(MSR_IA32_U_CET, msrval);
 	fpregs_unlock();
 
 	shstk->base = addr;
@@ -520,6 +524,8 @@ static int wrss_control(bool enable)
 
 static int shstk_disable(void)
 {
+	u64 msrval;
+
 	if (!cpu_feature_enabled(X86_FEATURE_USER_SHSTK))
 		return -EOPNOTSUPP;
 
@@ -528,8 +534,10 @@ static int shstk_disable(void)
 		return 0;
 
 	fpregs_lock_and_load();
+	rdmsrq(MSR_IA32_U_CET, msrval);
 	/* Disable WRSS too when disabling shadow stack */
-	wrmsrq(MSR_IA32_U_CET, 0);
+	msrval &= ~(CET_SHSTK_EN | CET_WRSS_EN);
+	wrmsrq(MSR_IA32_U_CET, msrval);
 	wrmsrq(MSR_IA32_PL3_SSP, 0);
 	fpregs_unlock();
 
-- 
2.47.3

