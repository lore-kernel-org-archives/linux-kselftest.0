Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07EC48F855
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989460; cv=none; b=a4VJNDl78oUVj0DYZeChoyStboNrietuEjcLByu4GfQUz2va/LcX6RtQquCZ3NPPoMtG+8UTTYtp3Wiwf9e5aiCDKuu5+j1dgDUt7SM45kSWy4wwplOoXtJQX082eM0PFv/HasT+p7foWTpcQRj0z/x8z4L0O1MvuzVug8QXuxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989460; c=relaxed/simple;
	bh=hOV/NyTnPxdCBe6XO/1GKFUexB1rAl0f0lQQCm4ePvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGaR3uqsoNl/BQfC4+mj3xFUuO8PR0gPxInEDY+aNLVkNladk061F6KZgHqN+eH6N/6YTjfG6WAnPZGGpbrP+d1UU0uETld7wr/NlSF01Xd5haKl0rtiWNhuGZxVn29rfFBvZJmgLz806buThuk1t/+lX1pTWucPYH4dDyOYBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YtarrOsx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YtarrOsx"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so34014855ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989458; x=1790594258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=YtarrOsx3K+S90zlvSL7PpvSj9CEc5Sqm4snKBOiCNTFS5AzbPaGp4ZP/jVS8pd87s
         UHXLz77rt0KEsrZpj54kYRm0kzLfZcmzJOEteryslGkPBaW+nmuUPYHZlCVBDsFX3DHm
         jzwwDEW1NLcDUCXxHm2w+2xynUZUP9eqZkmnSHacsOT9gzr00cjrOFR8NbqWnQH6Me45
         nMwzMLuqKj/KwAjRCmAuT2PLY3CxRN/1WaQe27ocl5kzSx39e4IeEnBdWnJTmRYHpUYR
         VIZOKD5EpWmbXzunlK/y/jiS2zHVqy9irr2dlN8vw+CANSQ2NS446mHolOqQ+0ANaB9R
         +tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989458; x=1790594258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=g/Roi1o2vP4rG2Z1zndySNwmv+zh1CR/KQ6ERzjUDiTfO2kukB4RWoZmkwZYQFiqib
         11a/QFhYmhIu2dE1jA8hb+eeOxSy1T3STOTCge8rbD8q5RLDUv89JMelQaV+28vi+KA7
         jn/EsDRuBUh6J4+poAH+I/0/y3mh1AMm9289qGA44BIVRYjENSE8zg0CfEPpaH1Sea94
         6UQCKDI4dDYDKqGZnxqCsCgeMWAJIEENoBHhhbrolwuZFo3QujGmI+tWf8nm8jUmB/Mz
         4dmTpg3ZmKQrnoBDpO8Mc7nQLAMuV1vnx7YRKrR2A/PP2Mr5eiAzctwPwt9C/0cQJmzT
         t3YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDkGV6Pg971912EQ4wshiecA4uTGU3PrSScunOqR15xPK22Sqty+mYN7TEdfBP51bVYTN2YglfEUsWw0GpgnU=@vger.kernel.org
X-Gm-Message-State: AFuF++kUHkFW7eRUj5aJpGjTinpz2B+qDf0tGgbJUUAnXoAYO9kgZ+Jh
	DQTq1tej/BCStrHs0tFNUMuZl764RlTqEA14C2xhPD1zjieX3btfulARb5Xv76iLTjI=
X-Gm-Gg: AYBFou3I7H3e/RKTofA7sxXM+d8o6dRhzmYby2Ky6a/pTwiDvcMYYVKZv8Se2P949lD
	DElx7drp9lnefUxyyX+my2JXTKqbeloc6zPC4ljGNCVD+X+HxReJpIfdToaRlvWAq6tOiAQKCaL
	IfkekGatEmDQG3GhmX3e2ytwEU2o3i39iU4hgESW0ZF7AU2MQ7yz/HM+7EKL9MZ8lmKNKB75JBF
	DJPmIEu2i0sdTJx9lLwCDzFriyuqH+ghGLCiLmKca03j28ve/1eGCCaEJiYwFVa6hcWDsG42tkU
	Fw0TzfhObxP8ANVdEXktOf260Mn5yQfgRDEhFl4u9LoH0azga+ARb7ib4GhiISjIx+Z+HO9h7O6
	iZfVhbuQ+R6M6dnzBdG5w4pWXcjn9kBms+e/k9wkDIUg1riSC2dIBWBXsN1Sd6qBRKSj3eR/6b5
	K1guJtKL4UYqY+IRhMBSNw8cRp7XQ8OWyjrxps4y2dOe+RqFP9qdGELUMLPxEXi0RW3eFBW7Sly
	dvHwfXYSui9YO+siNFNmynR04tjpwjcsGJy
X-Received: by 2002:a17:903:2349:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2ddc100a706mr90374885ad.50.1789989457717;
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.17.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
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
Subject: [PATCH v10 RESEND 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Mon, 21 Sep 2026 19:15:02 +0800
Message-ID: <4bc18f96053a7859a3ff33747479b05a9e42a706.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
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

