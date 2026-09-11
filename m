Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4F357CFC
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129042; cv=none; b=kpVyuFYVHfl0cnBMQ3vClr8udwxlREY+LOS0Xpw+jTBK156FWLrOGDZOcACaMkR+MojkmvRVXAxod4vl/MDWDcAx1zw1yYNqAZUr8AheBpI7gjAoQnFMSkZQWYvRdPr0BixKYYY7pXN5/10bFSg0Qourg1L98KlEtIrDgDbwUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129042; c=relaxed/simple;
	bh=hOV/NyTnPxdCBe6XO/1GKFUexB1rAl0f0lQQCm4ePvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzWqsTFuIlx4QQyfgy1/Q7utJh97Hw1xsVo5qGXtwYPSPn4GCmCi6//1S3BZsfAoFTH4aZmAdnZZyQw9XWNRjxKKoi0z1E0iJCDI97doxt3p5+itg3AN4ovcATkfQgNcnJevr85aZ9052rXYdM4z7GO4sGOvxvw8ZkKDWbLUvWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZCwO2x+Z; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZCwO2x+Z"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so605001a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789129033; x=1789733833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=ZCwO2x+Zz0mF496XXksvyKkzsEgTm7H6IvtuQL7hBi0gQ2/3wKIfxjj8hUN1Bt9y/5
         v+mD9bEW8OXQV4o4y5XTKRjt7/rEa8qrFDKG+NaVlBGMzjI9jCJVejCNvIFlP5H5htiO
         ek05r9M5gu8PPuTGi8fgx1LbiQllQuFWDNwwHRySR3D7+QnlJr+PFr3GdgTrD0zJXwyD
         3grHsP3DRS181Ff6NtPRJ+THc2/BkYwv41Ufnu8XdwLwxcxkzu/o6lMgyIsbjnzOsOFt
         /6Jv7LdDzf3JYl9/TIlCOxMIJOBB6TEbC4nu8qJnAl2LKxp+/OnLBJAe8/Tgr8HcEXGs
         6zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129033; x=1789733833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=Z776skcL6d3bu+/wt+tv7XWrERY6bnryzNWZoSRwznBiZiovxqiW7VFpt/IlPkFZ4o
         ffkNj0TXnphP+TyxJMW40Et+6e0toUjO1xO4H/G4pko0sgkFp4LBaHjorX56kKs0+Kmi
         /h9mL35k8pZXv48rM0kL2WxHZSBj8LId5qot+YFKEsOdybPTeBPKlrt8iLR6+mPpZqsL
         cJy7/QJNq/R+lMALcAgfY/K41d3ReCFEBNtxy4PiXKgOQRXEMbr0OHjxSGGY/Otq25g9
         8X0qBi7ZDLEsZ7APbfSksvFyMKO5KI6KLqYrWxCcTJkWj58aoXGmeDuPEn/vBt4+HiCm
         Xzag==
X-Forwarded-Encrypted: i=1; AKwUvByIaXEklxlwROevnepUiQFiQ8cvfH5nxQ+yByH5ETzSfGO68Kn17E1wui3KFBxZE8SczhCfw9eLfiKbu3Aj098=@vger.kernel.org
X-Gm-Message-State: AFuF++mg8BdAIgQ3mY1IEwQpMHGKRH3Xf0bVbKQKS06Tx+DTj9Q6ocP+
	p63wLhLecx9gQjoTCq1T4PXxelArerPnQleOMyeYk6+wXEitzk0+HHSHoO/XWxdzkZ0=
X-Gm-Gg: AYBFou2GP+RRE2HUVHFQw57E5uLKQm/Yd9a5/kHFBCxdG25GAWf4IV+8/7vFJ8yNIrE
	2K5QVM999sJh82e7fFQlhhLJ/Qyrz9/y9lgR22VrwXWb+KxhpAhjUckP9wYPQNT6FQ5tY4BzAzY
	oLqkIRpYgfw2dGjochDN4TEdKq3cYEsbgQaONg6K8btq1xIk1GItMnC/cBIF60d6x1iK7i+l5Db
	JReCf+ByEliulyL1QDN5xZbD1jW/F4oHrU5zS6o+S0WqfRw5MiVnIiRY7luybn/E3QjvgYN0xfy
	mw8+kM0OwMbNwRcw09HtWLpjn0l2DI5/klkvDKjmWctFoa1SbR+HJ94QGi8dab1Dsww0ukAMqVY
	0EW6z34gziyq74WW5e3YFTT6H+cqIZDW8HMq0nlhRkDDXeO8H+4EM5xfK9SD5LCaFmPO01PJkTJ
	tNnaMCH5mhzdClNMG6sGQQetIwlrYxiNtvcTskwOkp8Xmjbz/AlF1o4TIfBW2IyPv1qdrg9Kc26
	knmh+vs3wrLhrhsNmpxIFVUb0rBgu3M5F+c5AId2XZ8eQ8tz4y8
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr7597131a91.17.1789129032846;
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Fri, 11 Sep 2026 20:14:52 +0800
Message-ID: <20260911121456.33223-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..520495420462 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,6 +294,13 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
 	if (user_mode(regs))
 		trace_page_fault_user(addr, regs, cause);
 	else
@@ -314,8 +321,8 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)

