Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993382;
	b=DPKfmZDcGFR6aHaeD7HJON8d6O4EXou11R2by1K6QrXbe9bRNWbg3y5MBKX5eekjHaOV
	 any/uC24Ie3zf4p9g35XJZo/X36JuU2CtTle0OHvE9xl5VNjOCg6QJQtAFx8hXTC9w4gE
	 imMMhqJkNu8lpDqYgzFQ/91r7quHlQUZTX+TPr7QU+ZhSDGxjH/arSUsWAJ39Bo8NJkzD
	 s1oPolhpo0hL+nVaNvC9mcyayMMwDkEHYaz/kvFeFjphEwt3iY1vZgaoM4SHqJgsAXplZ
	 vM4InLNsqilZWNs3cy7r7sLyyZpcnreZ43LCvYcauyKWlyhCBU3UtSTE94De8J0+5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993382;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/p1Aibx+fESAoq7Mn088hKyuz3N34SXVD24S7wMWTbk=;
	b=UPAd8s/CryhQGm08esJCKyIat8hpX8aPyidwzI4EwPp8+mMVp9lwwQzmS2ZIgEcOCcbg
	 NxZSS5KDjyGdW2j2lSqq+lxBnuWLK0BKzLHOyojtgqsTohRBJZufZ9/muxCmPpZcmwKub
	 dPzAaosZzfwBZeItGRcVOs1RZCbePWi0Mp6aT1cFpUImLtLfOcz65OrO5E4nkz9Exikps
	 S1s503itJ7PmwHsCB41gQCI+6NFzUnFtB1wPDPnJmWzI2qU79oT9NuV6wgq4wL2Wv4t28
	 0VnQZKAofaMB4c3gUSjoXOH2vFg3lNwUAVMu4Wuew8NFVzB2LqQimlode7hCoxhsXvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="jy9/p5+L";
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3B606A320;
	Wed, 18 Nov 2026 09:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F3B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jy9/p5+L
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794993373; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/p1Aibx+fESAoq7Mn088hKyuz3N34SXVD24S7wMWTbk=;
	b=jy9/p5+LlnJxJv+0rGYUGAozwgS0sYduYx0IudyoKs2MIUokCUC0oCiit+0/IutkKTP9kJKsTjhPi2I/IsuOLWMMBWyJ9h+IWVht94oOQoK2q9SYZAXcJWIHYv/unBkM2fWYlPifQNIT0lUCUoEBVLiQsyfC2xj+YSWBk7kD0KE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF0HHbZ_1794993372;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XF0HHbZ_1794993372 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 17:16:12 +0800
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
Subject: [PATCH v4 1/4] riscv: Call early_ioremap_setup() before parsing the DTB
Date: Wed, 18 Nov 2026 17:16:00 +0800
Message-ID: <20261118091603.979-2-cp0613@linux.alibaba.com>
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

parse_dtb() can reach early_memremap(), whose return value is composed
from the slot table that early_ioremap_setup() fills in - and on RISC-V
that setup ran after the scan, so the mapping came back NULL. The DT
based kexec handover parsing is the first caller to hit this:
kho_populate() cannot map the handover FDT and the handover is dropped.

Run early_ioremap_setup() before the DT is parsed.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..45e2ef9d32fa 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -308,12 +308,12 @@ extern void __init init_rt_signal_env(void);
 
 void __init setup_arch(char **cmdline_p)
 {
+	early_ioremap_setup();
 	parse_dtb();
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
 
-	early_ioremap_setup();
 	sbi_init();
 	jump_label_init();
 	parse_early_param();
-- 
2.50.1

