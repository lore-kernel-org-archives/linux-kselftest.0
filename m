Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D4B39DBD4
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690511; cv=none; b=Zk8kweGzCNdDloNu7Kr+GO/MiRYgXdhI0H2MTkv2j9/ANcYDjArfKhXCrPPMWy2fI5IQyfx7oGLf+UCCYZe1Em1kfiGua3EFV75QQdsCdIi8CNH7zT4U7USS7JsEuw1KIOcq2ToTCTf3JusU3jQivS1SZlPTXhrwMHxvIyieUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690511; c=relaxed/simple;
	bh=9CjF84FJpCHrZRL2IHoyuIePe3hokPwDjhhmVprjElM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KR8Qswm8BFTMR3SaJL5FV6zh6Qyde3XEmUb0/2JBh29V3PJYwdEYc0THsS4ZnJTH1YCk59seb341RUH2fSaj8XF8l+jPBrE/p8HmTKACHQs/eBQnfoy5PkPVjSH3GKp8/VTwUO8VeL6+bw1dmbugz0UXePJp+ZlqRWhyKuSWgRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VuZqun4P; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VuZqun4P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acZ9/LK5EVhAjK8ZnaMSqOtU1DWY9dKNeWMugFjaoLg=;
	b=VuZqun4Pplkhr1ruJCNhwVyCRlrJ8YN5XTuCHzFwjIcN4On6My5+wO2nuTa2YcDH+R4x6j
	OjQ+8k237y/C3DS7wVCLCALfIUOCRMwX/WzkA/gCfLrA6MW2xJnKiJbNKOWvZQoDysQxv0
	8CF/cAFRfIql3lLNEgSTyZ3IVe4HdCo=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: kernel@xen0n.name,
	graf@amazon.com,
	shuah@kernel.org,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH 3/7] LoongArch: Add missing linux/mm.h include in asm/io.h
Date: Mon, 25 May 2026 14:28:06 +0800
Message-Id: <20260525062810.103367-4-dongtai.guo@linux.dev>
In-Reply-To: <20260525062810.103367-1-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

When CONFIG_KFENCE is enabled, the virt_to_phys() and phys_to_virt()
macros in arch/loongarch/include/asm/io.h expand to use offset_in_page()
and page_address(), both of which are declared in <linux/mm.h>.

Without this include, any translation unit that includes <asm/io.h> and
expands these macros with CONFIG_KFENCE=y will fail to build. This was
observed when building kernel/liveupdate/luo_session.c with
CONFIG_KFENCE=y:

  asm/io.h: error: implicit declaration of function 'offset_in_page'
  asm/io.h: error: implicit declaration of function 'page_address'

Add the missing include to fix these build errors.

Fixes: 0ca84aeaee15 ("LoongArch: Make {virt, phys, page, pfn} translation work with KFENCE")
Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 0130185e0349..7ff4aa72a34a 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -13,6 +13,7 @@
 #include <asm/page.h>
 #include <asm/pgtable-bits.h>
 #include <asm/string.h>
+#include <linux/mm.h>
 
 extern void __init __iomem *early_ioremap(phys_addr_t phys_addr, unsigned long size);
 extern void __init early_iounmap(void __iomem *addr, unsigned long size);
-- 
2.25.1

