Received: from mail-108-mta8.mxroute.com (mail-108-mta8.mxroute.com [136.175.108.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D33CA4B6
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042954; cv=none; b=dAwgsP549H/GKRpn+uSJRJvHfRuBDS0c5escQHmgErB2KPVJsfVOgO+PBHJKN6EMjpOekbp2Z/l3AK1ey3tAbOAH9lCjQqLWkNTzidQCAqaP9G6HD0KvyMquVTkJiwOAOp05nip5uFnqg2lFp0zXv17DEl9XZr+7uDw894tImz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042954; c=relaxed/simple;
	bh=6BYRV3L5PLKVoAAO31KqAH45okWzIVfiavyBzR9/wR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKgCWUMQ09X2/Nj3Ftd2KISV7qvGeNK9uX12wEAYZTyNvWjW+JMu0ayoanIYhN5sC+qG24KYgu6Zu15MSSdHWmOnqG2LqbmhF5CE8T0u6kS8HH1uVS48xLcVsaMMEC52+0FR5YOIIIKl6N5PJERgaqMrMJINEbAdrrLzF/Du5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=VNMZXllS reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="VNMZXllS"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta8.mxroute.com (ZoneMTA) with ESMTPSA id 19e37346c3e00067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:43 +0000
X-Zone-Loop: a4c55f3ced1bd77c49879a87a93614d69230f229a3b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3tHMER9SaYBsMWHifDDjYrpCxUmD2yWxiNZjkSjvogU=; b=VNMZXllS0Qt70Zgpk00r/oPCez
	11jO33K/ki/vWsGmX7rFvAP8A4tgVlpjol2rBAanP9Of2aYOh0oa1IKH3qUgwLHJA1XjBrRJ8xZ6e
	Bpnp5mnTxcxrN1W8PvvBpjrVvoHrBijtzhkPwndcfsZh4z9Zz9DaURGHMWdnSOsatiIIcq51H9A6J
	w211yxCylt4q8fKxN9QlVrZUbLPkpDtydXpH4oALs821n/8YNCYHbZjiUUsoNnwImcbrS3ctPFksw
	Q+OyrkFOZdPWZLR/KXwI/+8PlcqbhY3m78XKR2GiCUY6MO87/0GSrFXpRlz88rs0CIbM2u2TY9mVt
	cbVWYf+w==;
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
Subject: [PATCH 4/7] x86: ban 32-bit sigreturn when user IBT enabled
Date: Sun, 17 May 2026 13:30:21 -0500
Message-ID: <20260517183024.16292-5-ripatel@wii.dev>
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

IBT enforces that indirect branch targets land on an endbr
instruction. The CPU enforces this by setting the 'WAIT_FOR_ENDBR'
bit after executing an indirect branch/jump.

The only relevant edge case with user IBT is signal handling:
When entering/leaving a signal handler, the WAIT_FOR_ENDBR bit must
be backed up/restored.

IBT is not implemented for 32-bit and cannot be enabled using a
32-bit syscall. However, a 64-bit thread could far jump into 32-bit.
Therefore, 32-bit sigreturn must be banned until IBT supports that
environment.

Signed-off-by: Richard Patel <ripatel@wii.dev>
Based-on-patch-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Link: https://lwn.net/ml/linux-kernel/20210830182221.3535-5-yu-cheng.yu@intel.com/
---
 arch/x86/kernel/signal_32.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/signal_32.c b/arch/x86/kernel/signal_32.c
index e55cf19e68fe..7cb76d794366 100644
--- a/arch/x86/kernel/signal_32.c
+++ b/arch/x86/kernel/signal_32.c
@@ -143,6 +143,11 @@ static bool ia32_restore_sigcontext(struct pt_regs *regs,
 	regs->ds = fixup_rpl(sc.ds);
 #endif
 
+#ifdef CONFIG_X86_USER_IBT
+	if (current->thread.ibt)
+		return false;
+#endif
+
 	return fpu__restore_sig(compat_ptr(sc.fpstate), 1);
 }
 
-- 
2.47.3

