Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993377;
	b=Nzm+p2IG2VOqfzk4Q3ogS13drIxM8H2+SDnz5UcphsS6XMCuZ/0vCE+hf4smofwtsmH9
	 I0dASfs2ffXzJ96AVlGTjIZ53F8M4QNvoIJfEFFXTi4C3G62f105IneumCYRjDlqHjy7p
	 25FYfVccjhiX3/GaWf6j06hEVwrUJxqf01KN0HLM4U2LkaWk8vADX4alLE8oMbwTOMuta
	 F/Fwz63g9kBC3g3eM7gPxyvC61S++/QXJnRpchLciaxwI2UK8gqe5cYBm2NrnKmacdzW4
	 xbvFDc56OuMmjaaQy3Zvel4rqOYQ/HW++SQOEBP66CkvpDELE6ZAOyrcZuOUECkrRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993377;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cXMHSSOYVw74OronUDzpBoUxN/GzmRZG6et2woHsVBw=;
	b=YoSkHBMxdIoPLdRTd0Jh8uSV9aIoyQd0lnFhQmXTMotNMVO0HFNKgz3/JQO/nVM1+w6g
	 wQiK7Fww8V7eBrCMZ2K4YXRRg6Y7cDlCxvlMjCavBFWQScqjwXeYvvGbk5arkYLEcGbur
	 Ob0zOaCbEh+dC5TEZiFKs6z40U27HMS6+y2IkXSJoC4xaFtUu86nNPI2gq4/mItjXqnJi
	 SZ0moYq0uvkScMYNyZ0RsCtsy/VMjpOPX3CcYIv/v40H+lv3mQDt475Htjdoxz4L9vm04
	 DECwg7X5Baa837TdPQ4RhnxgjMMNYoiYhpT2YOgaU+xCpRURmPXXnxborgJHSjqAmKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UBPmCmDl;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336A606A320;
	Wed, 18 Nov 2026 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4336A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UBPmCmDl
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794993373; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cXMHSSOYVw74OronUDzpBoUxN/GzmRZG6et2woHsVBw=;
	b=UBPmCmDlpRWqX0q+d51An6UjS87dthjR9yR+W0l62BauO4K0RWvQe2tVitk3GcQswS2hBLM2lYkSKf+M2hExQhZlLR/YiU4lS4klW26maIwQZrTAtK0tIpz/IeY/YXa1RZ6uMznOm4kwDtJmlvwVfWn0PZ9pCDWFzKFYGoBEwZM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF0HHbl_1794993372;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XF0HHbl_1794993372 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 17:16:13 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com,
	shuah@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH v4 2/4] riscv: Add support for KHO
Date: Wed, 18 Nov 2026 17:16:01 +0800
Message-ID: <20261118091603.979-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118091603.979-1-cp0613@linux.alibaba.com>
References: <20261118091603.979-1-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic kexec handover (KHO) paths are already in place on RISC-V:
the outgoing kernel publishes the handover FDT and the bootmem list in
/chosen of the DTB built by of_kexec_alloc_and_setup_fdt(), and the
incoming kernel picks both up while scanning that node. Only the
architecture symbol is missing.

Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
and KEXEC_HANDOVER selects CMA, which depends on MMU.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038..bffef6b903e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
 config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool ARCH_SUPPORTS_KEXEC_FILE
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT && MMU
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
-- 
2.50.1

