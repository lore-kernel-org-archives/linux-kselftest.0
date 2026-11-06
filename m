Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949310;
	b=lmX0+NUDtoXDm/Pps0lRLbMziU9gWgwVlYCSXxD7qehlolVPb9FgMxNt8u2lnFPEfkpw
	 P9V40l2gi8kuke41o/oxi3jfh1OiX0DVamSdu29tzeX25ITeLjJ5OiYxWLslgkwOebDBD
	 i23QJHkwKlAGEqiJnvd3YUOTFR3SoajRWWXJ9kMSve/tt+lFHqNZV+5E8qAimAUx78vwH
	 7tQD0sxeC3nIIzQ+Dtx+o8uCxqEzPYMxKb9hupXYrHyd7h5z12GeVV2nSWH/n8AmR0q/Z
	 SEh8sgZPOSc1xeVBF6oGe+uElNL3yvcL3gHymUOqNKIKdGOOErZ0J9Bvz/zQuHo5r4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949310;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+m8DC4cfdQZ3xwF8aoJbUjRqYnCvVbB75BJhmdshTY=;
	b=rAIq3Uxk8tEMeAuLqYrV1J9WXU5FLT3GFXT5q2pDQ1Jkv+zmHDjZ+bhPR0tHKD7OlscZ
	 oyeuDe7sCbLURlZjvDVHHlwAeChjb6d5oTAJ0uvAvl7iOwvD3iXpRURgkGZwZ7t/jOCiN
	 QKeymPwg0B1gnDSwv17haSBiq27Iz+9qfJEHVPqa50eaj864f6G7Q1igqug7DzyGLA8CI
	 ayUEElJQBxf9RklqMdLrEz31VuPdGwm6NFN6aCWZ7nUwgbaBmp/iPuV4HogM6DOIaTgTP
	 mJiv08AcV3aFjd4qNr6FiNM9NaTQdD0xFt3gNDb0UaxkjG7qeokR/Oh7pxm+Ga46Qtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Hl3o2weq;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E07606D809;
	Fri,  6 Nov 2026 07:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E07606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Hl3o2weq
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793949305; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Q+m8DC4cfdQZ3xwF8aoJbUjRqYnCvVbB75BJhmdshTY=;
	b=Hl3o2weqnkZwsYIusJDJryh5AJmTnOZWZcfU4b19UghowGy3k+O08szVVPnN6JFBN58y+ixQIXkz+lf0/LsTxTW2BXFlSTZTiXfRwSGzcQfQ0KcgFtgOuCXTTPvv1GWzUEwxXs7h+2stdyf4NGWh9qOc9IBnGwTbc7yfs2Im05A=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEAtjMh_1793949304;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEAtjMh_1793949304 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:15:04 +0800
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
Subject: [PATCH v3 1/4] riscv: Call early_ioremap_setup() before parsing the DTB
Date: Fri,  6 Nov 2026 15:14:56 +0800
Message-ID: <20261106071459.2003-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106071459.2003-1-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
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

Run early_ioremap_setup() before parse_dtb(), as arm64 and x86 already
do.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
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

