Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5F3B47CA
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467862; cv=none; b=NacJd0P6AkeCwLR/d8vLDRtJ9/PKdXtbmIQWcDFE96UgSB+eyvHvFhFv/KfbLkxqZfrhM483CF2wDrnSQriNmJuiiV9MlTjxvWSLziqPrCCzEqoGQDtUmU3PeSOjARFX0L29e0UuJwmj1fZS1HfEdmvk4kPhpK9jPPhifxYG4V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467862; c=relaxed/simple;
	bh=O/xPPZ+sVVTaOOmEwsa+8rqbwM5fmRoimhLyr+2P6bA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PcZSbudtAj8ywQsIm+1j33Fp6DWk/y8+UAcWZfwQ9Dt/2exUu2xuAe8SZfpIaXv7GzhJfRdYk/hGcBbdCSu8N2O3TtPj4BBC0/4SHQd5t4tdMniYHg5fLrUtoDnLRfgE0vyM21d9ysD4/h6lSNEkxGfyxHItDH0uoJctG1h2zs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxBNSnbM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxBNSnbM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so2265265e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467853; x=1789072653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=sxBNSnbM925Xmo5xFRsdYK75FG4jLnidv2k76p3ry07PWePFFgrckheA2t8q5A06xT
         9Dmv0a49W5WIJMfsgZt0kWw2/KNBYRU11sC6TsKn/8enZf/yVlbe1ocdNRZNINzzDAut
         YlTSVagBG+H88PVSxMp9BbLLvMkPGw+lojTgiAv9RQ6rr/alybLCjOF12Du3V0WJMeWU
         xDilYMbZgFjlv5NKAzIU/zSFQLbm9iF1zlSIqlMEsr0pPWdYRTGERvXhUCngxX0Hz/kb
         FZW2IOZsUnJ6DX/qPaAVczsxdm4t0hQYu/EBLd6+U0TX+ubjrzRje5jmztl1e9BXvlEU
         cGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467853; x=1789072653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=fU/piQ/4VnLpRlFItQHKtm2P7ILwpFC176QUXmpWt5TKeZLcOwZZSFzz6FHTaJy6vq
         arIb4S5rAWxc+YyLTEwe2r8OoiM4MryBAyMoXdnbtKhADEP4DPnuRVJnZELuZKdoFRHG
         MTgmUeqKILtp1g8motjOo32wjmwylZChgCGuwJNvN8FT4xBRy/Ah/Bqkd07PN2j4qZv7
         IxEzmFiUpHQBT94c1jHMRCv5Z+KOnytEowIRH1zpiCv3CzyVe4SQI45NXOy/cSIG5MRI
         AYzHCuvKHDeDuhun6ysFKkQ2c2sn0e1G0A6idBkzt0jJaCAVtMtbLXLy1FDJgPVuOlFR
         6Diw==
X-Forwarded-Encrypted: i=1; AKwUvBzTP6dOYaXLIAhkYxbiBFb2IMqYZYglg+SvlU97SmDo3jvstQVtniInfQP0lN08WB28MqB/D22XQb5zrJfuA74=@vger.kernel.org
X-Gm-Message-State: AFuF++mqKxkP9xvKja3cY91SmvZ7wM9vHpzsgu9wCNlw486ZPj0sPGXu
	NNJmJqbK2oDhkGESNCzA5lu5nkdmJ/dPFfBatW7pVKelPEbHhARuu4fg
X-Gm-Gg: AYBFou1s4MoT2a22Cwof9iRQMc97NvKoUABsp4egt9QX4Veu1olJPdWPaHsmDjDEVOv
	uy6K8mBqlGZIW/X2x0dbra3dSBQIf1NX0topjkjrzyHAPXOXEbYUK0oFMnmumjokQL4duGFCBgZ
	N/ej496z8kYSWMJfCoRIIA0XEk/Uf1H9fCNi7kQ8/oaONeALNAeWlVxeVrR2ien1DKUqje95h2W
	HffRqe7wDxbHawje4sgDWPuU5rQRlsTY/esjKH2fCjEgJv3T3DFkKU2moSWQeXOyZb2BudHampn
	Q6/8gAF3oKFw1rnLwj5TiHJKd/M52byOlKC4B7MPCj0Fi3B4Ru2YjWiyDzAGkuxFGyh/SS8Bi+T
	vC+jL3prd8HUIGziz81BCMZJtvH/RbmKh1nSi+ZjPcNWN0V+OxsxTiRhMvOpvdq/qU8OWAGJIpT
	3Ehfbfwu+QdcC/70hWOwLTB6HkYqsKQyO/XxLrs5fJtgYfSdYIlyx/LyS/aai9fi0Gt5+cDckAE
	QS9vHY2hUQsCs1V4q580YMbfFU9zh1kU77if6is3zBi8+pi44mHBIsCOkXcjb7Ym35FDm01qBUu
	UxW/DG2JYYwaMkgVKCBwFeU5dju0L+sF/x+IBDSOh3UwFSefuqG66lb0sL3N4/6HjBE9wTMEm9y
	bnHeFrAe76NG8QjIG
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr8535635e9.3.1788467852848;
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened usercopy
Date: Thu,  3 Sep 2026 22:37:18 +0200
Message-Id: <20260903203720.63689-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing an ERR_PTR to kfree() currently reaches virt_to_page() and may
fault. Warn and return instead, leaving the bad caller visible without
using the pointer as allocator metadata.

Also reject ERR_PTR values in hardened usercopy. Keep both checks
separate from ZERO_OR_NULL_PTR(), whose exact matching is required by
krealloc().

Link: https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com
Link: https://lore.kernel.org/r/202608111716.0FA9DB17@keescook
Link: https://github.com/KSPP/linux/issues/93
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/slub.c     | 3 +++
 mm/usercopy.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..027b44dd7f07 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6780,6 +6780,9 @@ void kfree(const void *object)
 	if (unlikely(ZERO_OR_NULL_PTR(object)))
 		return;
 
+	if (WARN_ON(IS_ERR(object)))
+		return;
+
 	page = virt_to_page(object);
 	slab = page_slab(page);
 	if (!slab) {
diff --git a/mm/usercopy.c b/mm/usercopy.c
index 5de7a518b1b1..c8d8703544c6 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -157,6 +157,9 @@ static inline void check_bogus_address(const unsigned long ptr, unsigned long n,
 	/* Reject if NULL or ZERO-allocation. */
 	if (ZERO_OR_NULL_PTR(ptr))
 		usercopy_abort("null address", NULL, to_user, ptr, n);
+
+	if (IS_ERR_VALUE(ptr))
+		usercopy_abort("ERR_PTR", NULL, to_user, ptr, n);
 }
 
 static inline void check_heap_object(const void *ptr, unsigned long n,
-- 
2.53.0

