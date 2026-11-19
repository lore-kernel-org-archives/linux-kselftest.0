Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090180;
	b=x/j0CblSazZGF3HNsOkhwc9pB/zQafz0gJUaUeetYn+dT5C66yQuCFJjCYhWy+2nW0ib
	 PJBk6R3L3lM81FUi/rIRAh9FM3ZhVl93mJqCsooqJeS+c/7O8Ys3lzllPN0N4Qm4GCvSY
	 sub3kTMDDjQ9/aApmp3tyYB0r5RVL8d3RhhsyGNaQVHVcocdUF42bRW4Te2XMapYVGfu7
	 oGBO7xSJitwaDbkt5E7x8v/O6pi1Ij4ehe+ByCgylwVaP2bMYX6Rm7Ft5e+omJd4pMiJt
	 SVy4uRZujiIqglo/WS1eI793ON2tQlA2HBWysHlZ7mxvFA8vM/eOWU5K/dxAQNWKabA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
	b=XQyBVk1k0OFDYKMfPPJ6bjza4tbE5qAxIHcZ8T6Cy7oTiHZHdVxPlCK1/E2t6cna8VfX
	 wpxA0D60ZeWUirdhRKY4Q8bki7/jTeKXZy9QrqHWUJJ9hBCwEzzmv6/NPL2zEQeUcaD1J
	 +3A79T721rPtdPC4EQ10NqRABTJluXzfUrQgSKFz2tvq8NuTvfVw7ykMmYspZJKL/SEFv
	 ZldRAIv7pT2AZcKPfr0kPGgFlol5sKB9Y3Zt0/MAUdr7OUMOE5cz6MmhZMpT+23yNNMQV
	 gFldsozvWoNRMFbCQ3kWkdRybihHzzdtILJT2IJkfQUl8T5e1NSBgk3MKXZ6to7D3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LM9bUZT8;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17179606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17179606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LM9bUZT8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so2923700eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090179; x=1795694979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=LM9bUZT8k3cGQJUUG7eD43z4pVutnUr27pPDXThESBxF7ZhMDdQUWhvcDgWnH9XxKH
         mchcPcBrOACFSfMTAax9uGAMl/WAwjASV3Ow81p+FYSCxq5MHkXXSTlHHj7GmlZnx1VD
         dtFMe9dqMhyJrWIOXEpz1ERAEf+nSyUbpXUlm0Me8lUKBbDn+pfiGZUhP3r/z1v4qmsX
         wAVTe3e9+H36PDiUul3i2jiL6l9l9g1HcOenQ3o0BwbPmyLLJOLJRuQMFaLgg1fIek+i
         xZZ56Jr2OEosC+Jpuz3NjANLOlP+wJ86nQAgEwllXqamti7QjNw7EJN3HDUb9/EHpvlt
         yfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090179; x=1795694979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=mW9cVoJxszYh2gB+1SQtuIFT7fUvsfNwdBN49hkksxrDJIQDDU1kKqfdJri2knHTXl
         NEnpP5mgCKpqGm/OOroWWGsFA/yghGM9FT1FLLlptTMg203865zPbaLdJNOLxXtCwnWQ
         q7JsLPcBb40A5X3/w1WZHi8V8PrqHt8vUmmG8Nz5GC+k3dLeAPsF5oWezaGjmaJMh++O
         0O9YfsAu9v4q6ztMZgyssyRTOIFgLKUm8DWKplrGSIfK3yRXj2C22g7qe/oOEZcRS72W
         4iThrzg6E3GRM8p2jh5f6kXGad7I9qkIXGi1iznXze8LYCcZq1uPoTW0jXoPUy+pmrIi
         7LOw==
X-Forwarded-Encrypted: i=1; AL+hErHJzAW9Gzw3DaUe0dJzjQWI5smqrA1Be6ugPXTmZc4wbebMWkGLOMc1PYz66vnnE7+laEtkFfgvUXs2584EBzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A8a9vV58mwVAf+UKZ0lD+AwurJ0zO8il6VzxrN6eqBobWqOmA
	5Ov9nVNsY6CEi24G6ZkZlwC0/VMkwEbsLZkhXObkGd0fhi4/fRNxF8bkVQCPl4xKxrg=
X-Gm-Gg: AZFdTZfD4x5jr+qpCxR0T+jUhbgBkbaY18fmr7kRKNPmugi9709U6Q6vrDbb3lTzVF7
	iM8NpHgHOi81jIOueX9GXZ/jnx5FwdFA7j3tItfuAqoiwFgpZQw4Ds/0C7UITHoRt7LreAL+HtE
	F66blvyReT1Fbl6vf3rm/qcrSaRDGi/CHo6WHq58bRjv6mrMSnjLQu8vds1K/9QAeRRheRybwpf
	sbDNuZbaaY/0HNZGOUljbw8a3JXj+0Y9v9HIph/p/aBXlE1lNR8cgH1nZ8T4WYcDOR1xj90crg3
	tFP4KUnocEYd3c05mrvjx0DuG4+saJCgVHoAz0/E6CYj9z7CLFTAOPruPP2Yqq5STjHpgEfjuP8
	8y8+bTyzZO5TeJI4ONdvRQZSDNN3NN6hg7BWk7RakOHbkGqFiBU6m1J6s9LdGJ/lWXE3iPOR0Ix
	F2KlYifWeM7FGI5DYyptPH40hhofD//s0ZvcR7Lu0V9jmVIDNa5iliNocvLQYugCGH8JImE+5Hn
	rcINJVkCxAkw1qv5gco/nFbIfz6/TZeYWGQAbyfoLBa4bawcWO/NacKI4t3Sh2WGZ1d65WmudL+
	rkwW1dWUykwXUrvhVR4qqHtEGF2wiA7Lzrc0oVZvlrHxeTmrDsuD5FuELhLnhYx6zOpGjPFHb85
	7REiTkYU=
X-Received: by 2002:a05:7300:b594:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38281eebbb1mr6614536eec.39.1795090179031;
        Thu, 19 Nov 2026 04:09:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:38 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 05/11] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Thu, 19 Nov 2026 20:08:29 +0800
Message-ID: <20261119120824.13969-18-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

On 32-bit RISC-V the vmalloc mapping must still be synchronised into the
current page table before that fixup runs: otherwise a nofault access to a
not-yet-synced vmalloc address would take the exception-table fixup and
fail spuriously instead of being resolved. Order the vmalloc
synchronisation ahead of the nofault fixup. That synchronisation only
copies an already-established kernel mapping, takes no locks and waits for
no I/O, so it is safe in the nofault path; if the mapping does not exist it
falls through to the existing no_context() error handling. This early
return skips the page-fault tracepoints, as before.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..3934248f7a27 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,19 +294,23 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-	if (user_mode(regs))
-		trace_page_fault_user(addr, regs, cause);
-	else
-		trace_page_fault_kernel(addr, regs, cause);
-
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
 	 *
+	 * This only synchronises an already-established kernel vmalloc mapping
+	 * into the current page table; it neither allocates memory nor waits for
+	 * I/O, so it is safe in the nofault path. It must run before the
+	 * exception-table fixup below: otherwise a nofault access to a
+	 * not-yet-synced vmalloc address would take the fixup and fail
+	 * spuriously instead of being resolved. If the mapping does not exist,
+	 * vmalloc_fault() falls through to no_context() error handling.
+	 *
 	 * NOTE! We MUST NOT take any locks for this case. We may
 	 * be in an interrupt or a critical region, and should
 	 * only copy the information from the master page table,
-	 * nothing more.
+	 * nothing more. This path returns early and therefore skips the
+	 * trace_page_fault_*() tracepoints below.
 	 */
 	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
 	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
@@ -314,8 +318,20 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)

