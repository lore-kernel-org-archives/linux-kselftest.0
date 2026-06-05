Received: from mail-108-mta227.mxroute.com (mail-108-mta227.mxroute.com [136.175.108.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AED3E92A9
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685620; cv=none; b=lwN41Vk2lnusPL1LjfJAdusB5jqL4rJKt8ajIHJJ+8b2J3Obj5aFnTEzCNqr38dITdSKtGnTHXccdz/wZoieBhHZ2gIdOr84t6WskXpY5Tfuo/yeEsHE6PJwgnh5XBVyG2DRDKK1Mf3XdS0FKU71F+zOMkkPWf7rNRaYz9tjdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685620; c=relaxed/simple;
	bh=b5WOFM52SN13MEtWftN752/9cLw0JVPazUMHSdNkRmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+sIQzCkEJv1Yg0QXpjAVGEfWwLV6TCrfEGcb9arZGNNarKlzCz07nXBofzMYs14eaShGQh5p09AddM2gKneW1ImHy/IJ8aep3wDWfbjruz1HUOEUzUpYidcra7MqWmQD/ojgpp0mRoXI0B2ObUe2yxwuqQZIpTCwgy62qWRxnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=pFVpl9XD; arc=none smtp.client-ip=136.175.108.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="pFVpl9XD"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta227.mxroute.com (ZoneMTA) with ESMTPSA id 19e991d814b00067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:28 +0000
X-Zone-Loop: 2ddcfd31bfde6a84d43d9323765fcc7c3c7a3033510f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZjosEJpA1eXZ50hc7mf1XeR3qMEd5tWpuh367jDJpcc=; b=pFVpl9XDMdO6BbhkvYP+KOh2c9
	72YC1t4AkFT6riWxUK1dJ3SfhIiqI/3PQ6ECLQMB6Kb/qV/SyVm06gQV1WEik8dJOdx7c+WLtx7Ws
	SgJsnBMI8hG5qoO9fex3sbyB6Y9bKv3XXldWsTzIyvsTrG8f9gd8oGfKcnB/WgNnSFSqHWXJcn40t
	N+UTBo3ntKWrvR6Qu103wBLpbJDjjzRLCa3QOpzkYSbaNRqjOLGU/+SOyY2voHtqzK4jgG4q3QyKi
	GDs4LjV2JeUYZeH6U74K7tFiQVV/3X1m2uFsvo6/DXqby2GD5sCK5Map2kCZVe0S1/z4B1Dtx0bVy
	gBcw94kw==;
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
Subject: [PATCH v2 2/5] x86: shstk: don't clobber IBT bits in U_CET MSR
Date: Fri,  5 Jun 2026 18:47:13 +0000
Message-ID: <20260605184715.3383415-4-ripatel@wii.dev>
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

