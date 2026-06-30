Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083240D587
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 00:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782778419; cv=none; b=SpHMlUS/qNpVAOzA5ac8HKtTw7L8zUoP5Q0lbVzbPSowBrPYjhqXJONb3XEVULVhOmDuomFjK9vBRIGxRt2wLHLTgUasHEZt5lLoOkxR88JwXkx8poocZm9PvAc+H6JfxIe4j+CscthfjmB4Hqr9a30Ap+C7bbDEgzQGx4W2CLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782778419; c=relaxed/simple;
	bh=xA/Vs9V7SjmvMjzEG3jYo4JXm0pLhylCX8gmEuckYbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXBH4crHxllVLok32GLFV0oK013V4mwlqzZHIYdR4Idd36/WGVZQG1+5XBobJ22IV0m/BeLlr3JlJiBHQXrfXDXG+B2WgH3KfsAf0h/vM2FCo7DnRTqTvevvBhjyHphru8la6RO96GtDq7Cu/mdTVQJ00x/OKx1qXk9q0vJ3y/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExUoY7ee; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExUoY7ee"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e501244f5so83719185a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782778417; x=1783383217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIkraZxinUJrwI8LhBH8/tkcf/KJe4Ahg7TpFa29WD4=;
        b=ExUoY7eeULcP47M1bs6z/Galpsx9KC2Lj0Zn1QteJiSOmVaLNrAm6GBr3n7XGJZWdh
         ZiSCJVsEq3hXviQ1iYv7ABy17INGs6u7Ocs9J6bEimYyiypdE25MNxzLEs7U0kxFXyow
         lj/ev5mE1fBg+xlb5NnImOS+o797Uk5anjw5DQiTKXjZeIyy8TuKwjXrseZuIMrqiogQ
         u0C0T9NsINX8TCBDiqgHw9vzDhNNu2C2Bcd5NPw4fvaVIJxG/lvdr/AFAYNxsOmUXBRi
         pCpRUq+7XAUkrvm4s3LZFO14AxfPDh4dyq7XIA8kSIUhDq7isdEmzEtR7+jF1XLTPScE
         28aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782778417; x=1783383217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIkraZxinUJrwI8LhBH8/tkcf/KJe4Ahg7TpFa29WD4=;
        b=dPOEeo5g/BCXg5JIieRaKFWtPm0RCuucqOzyGX4WQggA9pdzykYDGTGRoeOxawUxbh
         X1nbTtxpC431n80Wri3SDERCmXtXCbay3ut7iSXfXVMyl8qaQxtTlvDePdvAHPX26QQZ
         MyP6Z+JYpBim37yY1fWgxvKCDbfGeevnOr6PRtsP2CyZBqIgDmFC4yXd9CZqd1aDJo4X
         Dt94yE4/cAIfwjW3wdwMdSEiawyhbRcbVXfVWY1eDCiect+cP3C0LTOh36gBHmbMMsoN
         H8Vgtn+UU1aO1qOqupTCVoiugxt70odpRrSGWH7dmwUY319JeRUaDPAQURACervO5DUx
         VM6A==
X-Forwarded-Encrypted: i=1; AFNElJ+Q2FJqhW12mLBhGXkCuvMKDv3e9ktfCs3OLvqmXK/PAAVMeo1ibZVo5eBf+kW0mYzrzgx5uSZOXSJ3laHe47w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIO+MLOi+xGYfgj4/qpJB8EOgo99CMOHRQjP7wKW5F7bm0r09q
	ezIRb1cYcoEwKJO63CeE5jvuP/46388IpA2QVZNHuEuomC60ZBoreEjs
X-Gm-Gg: AfdE7cmqc8KUNK0S5ZdST6f3i/+p7Qc0rCaLqwvpAz9s5BcTT8f8P2qCxdSXzhqKOX8
	b4GS/e8k326gx8etU2T3TCcYJPMmJo2YMYhMX1cYjLQhUVuKm5XFu9qpxs3EjVXiQ7zdLdtsNSF
	r6Jn9McOSKrxfgCFp3ix7kaHc59ROKYkrp7+fh2EaxGU1d6jDsn2lq4ruFDdNkoz2gRyqBK1nWD
	8OXMMYm96XxpVzIvh9GgmkGYV7zCjf3l/aq4KfKYcEBZFBM8JnsqJAhSH8BJKfdsrrW1q4C1mqA
	REEKfudyX6q4Fz+TWhx+VOM1iTfW6PwZn149jaZiqpOCPihVYwOKRk5Y//PHkpC+FF8b0xxE80Z
	q4DtpuPScrW6Jf2E+NBto6NQPqiStwoC1uIIrYF3zB8tbOD31qa9pA4yH79rutVQlkAqOlkir7N
	8pdmdmMPsliojmwomlYxY16foncOIhGoiS8fWACFa61P4aMh7k4obKvVI791C9zqIkl+3vK69yM
	cNWeDRNyseOeHdBKSyxTQn6Kw==
X-Received: by 2002:a05:620a:461e:b0:92b:67e6:8acb with SMTP id af79cd13be357-92e627f80cdmr276859485a.69.1782778416870;
        Mon, 29 Jun 2026 17:13:36 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6219cb9asm101975185a.21.2026.06.29.17.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 17:13:36 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	shuah@kernel.org,
	rick.p.edgecombe@intel.com,
	jolsa@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH v2 1/2] x86/uprobes: Keep shadow stack in sync for emulated CALLs
Date: Mon, 29 Jun 2026 20:13:33 -0400
Message-ID: <8b5b1c7407b98f31664ad7b6a6faf20d2d4a6cad.1782777969.git.dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uprobe CALL emulation updates the normal user stack, but not the CET user
shadow stack. The subsequent RET then sees a stale shadow stack entry and
raises #CP.

Update the relative CALL emulation and XOL CALL fixup paths to keep the
shadow stack in sync.

Fixes: 488af8ea7131 ("x86/shstk: Wire in shadow stack interface")
Signed-off-by: David Windsor <dwindsor@gmail.com>
---

v2:
 - propagate error from shshk_update_last_frame() rather than returning
   -ERESTART in default_post_xol_op(). (Oleg)

v1: https://lore.kernel.org/all/20260622183109.1137245-1-dwindsor@gmail.com/

 arch/x86/kernel/uprobes.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index ebb1baf1eb1d..d74bb54543b6 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1246,9 +1246,15 @@ static int default_post_xol_op(struct arch_uprobe *auprobe, struct pt_regs *regs
 		long correction = utask->vaddr - utask->xol_vaddr;
 		regs->ip += correction;
 	} else if (auprobe->defparam.fixups & UPROBE_FIX_CALL) {
+		unsigned long retaddr = utask->vaddr + auprobe->defparam.ilen;
+		int err;
+
 		regs->sp += sizeof_long(regs); /* Pop incorrect return address */
-		if (emulate_push_stack(regs, utask->vaddr + auprobe->defparam.ilen))
+		if (emulate_push_stack(regs, retaddr))
 			return -ERESTART;
+		err = shstk_update_last_frame(retaddr);
+		if (err)
+			return err;
 	}
 	/* popf; tell the caller to not touch TF */
 	if (auprobe->defparam.fixups & UPROBE_FIX_SETF)
@@ -1338,6 +1344,10 @@ static bool branch_emulate_op(struct arch_uprobe *auprobe, struct pt_regs *regs)
 		 */
 		if (emulate_push_stack(regs, new_ip))
 			return false;
+		if (shstk_push(new_ip) == -EFAULT) {
+			regs->sp += sizeof_long(regs);
+			return false;
+		}
 	} else if (!check_jmp_cond(auprobe, regs)) {
 		offs = 0;
 	}
-- 
2.53.0

