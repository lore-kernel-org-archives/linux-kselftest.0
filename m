Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202245;
	b=o7B490IVC/32nE+h7reW6hjr/0u+hPfbjAtXcTo82AqIRDluEnt5wy/FDZeVev8OoV/f
	 nMJxshzUnTb3Rxvon1rt3wO/j7ubYBJ90eEyWZ3aTQi0C2q6MFxC3SGW/shebfkS85A1Y
	 kMf7Ovy4IPVpTGqu5LbZzlZ3vrbTeMnetoTopXeGD58une7o8Bf2vZEXzFAvFgeJiQCBZ
	 5Zr82jLQ2+fvld0MNLELIWcX0o6c2ZK2TNE4XP4D7+G5dlLDxJiY2m87/IlPpSQFOejP/
	 0vgLva1PUbzltbK19PYuJjdWWuyd2hLtIrF4jDvm5ZKU8lhZ6d0W/zTOidNFLEHVc5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
	b=jmQ6JIvpEB/Iq7rwNH9iFpvxl7vC/CxevD9K6/wy29qWQRuSglAObqeQ3AcHdmH/9wc7
	 w4qqoG2QtE9MRtxnEjvj9uzabF+KpsLDMW0RzdtOGIYuTk2HjKIhWUuT+83TWryrrk1tB
	 VhRMCLQ+xKPiXWWfcI2SJikwrL1tYhcqEvih1F+CmOM4i7qXDu5cw22JWauxurHT85Ibe
	 CC7WD4op6QchvFVTJ6hFSh/l6cVo9udhzVc3ub9VgC4Z1K4hPLaoPmr0KQP8CERpruazG
	 LIagNYqpxKl8xbNu+oHjOvsKXZeh+G3e189/m+Fu8D7PFKOzNisu5L0Db71mmGagkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhNhf4Bj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EB1606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EB1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhNhf4Bj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10169455e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202242; x=1793807042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=OhNhf4BjuSG3e/6VN6GivJmIl/+gJb/TUjJc9z+vBd7CbssvdrIGIH1vG4k+ZfuDpJ
         p81CwXU0OCpslFV70v/D66L0u6pYrg5/WjZNwTPRpJVoE1MHqRJrAvD/nLF5sn/Rwh4T
         BnLwDX91KamNaosDa04cISQoCfHTzRDMW2cEXoKS26/NrJaZ4w3fwAhcDoE3MmD1nBdA
         ds3t6FTpp0UdeBAr7Lq6vbjtA8gTPoCpf9bkLKWJB0diWmPNCIrNFDiOEnDxyAU0GKFW
         ZkpzXaupcEaw34ti0Y7HcfqGFhPINTamCbaEJya7l3ZC+xuTe6W6BPXlk1yHXA1LuRKx
         2jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202242; x=1793807042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=nIhEkvWhNaCCdr+T1BjnlBDzFQYaTYSYxsw6qm+y/ddckAZ6Te7wYGd6FQxyTHI264
         HcEUDGAOUUWNBHfjxBkQQ59BbeKdurAV7753+x7r68GGWE8pappfSlT7GnFoG9GKO7bp
         fmB0gnqGn4fH+JLpVBmbJRR6NI9bi6oQFPALJL4xtLbeVM+stsdxqWGKe9gLJWSjDjHy
         3i9KYhzhdApK93mfMWddJVH75vgZ6fs7+sHxT835TQAUQ5m56gUCbUZL61hS9ANmVSJX
         5Jqy6Pu+5VNSHNUMmRdT7R+jyHb7oX9QjllBN9Z3DoVOJOxHp70Hk8+d3oiTnl8ZZUld
         4Uog==
X-Forwarded-Encrypted: i=1; AKwUvBz8zH7YEjy8LpUHjukB1rMOBLUJJV79SJDtugzDRlW9WN/Z9g+wAf5rX4YKtlLNE6nhyBdxB4AbQ+e2UUc/Hck=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUs9PGDSGU1S/6nJNBjQdGgP0/Cz0D2VxS1hXqBKEpMy/kqrno
	uw/VpHzqDMV4LwaUXtRMgWmiPcuXZVvGA+dGp1AzLeNbVXcpo08/NbDp
X-Gm-Gg: AYBFou1eWCwqjEIwvBxGR2SAAJDFY6wypcdMpCFQMSbAppUJBNiZqnd6xB48xsJhwB3
	X4H+5UHKK8lkzZmfILUBVY4zOOBGz+NVWz1x1q9C9qI/bgTVS6c2jHvs/dbKIS4DJZ6dZ8ZolGC
	HbJ7/VMfaq1otnu4wnqOJRHJx4UTzWMuyLuj7GtTMUiqtgEth27g4oRJoDXFk8Z/ROzcWttLCmM
	Vvg/gJPTG/llIHUlSKs6XzNYJ4ENduuwv//tTr1p27Rwv6+UO5k5nFJayORxDgf/6HX5ZKlzcB0
	GzGghaPVf5cLdUFWLX2L1h3+cOrIMuRgNH4MIOibUXxPhd4G5LDwlp2RshtOssMmoynXHRXLiuG
	IasJcN9UZvIxBdCa0a9WTIXAqwtEK9Z3oDy1RItTI6sLjpi6b2//aDjS6s82hWU5zr413I6uAhU
	S4sBORceygl47yVucxR++6VKZkfBvy7vFEKt28/j1tpzOK4YeHUvytgBvJg0KokIttadkHNF0A1
	11bXHu7e/XC3PmD/PlThOrmzkGNugTmuftauDmA+VrXOiozwKJHU+kC8Qxmm7POy/i2tTR9pkQ+
	tjVnxdHK+mczvcUvJ2r64z8wVei/uZU70vbayhUoFMtlb4r8QaBQhmKNQA4SLfPDMQ==
X-Received: by 2002:a05:600c:a48:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a9661ab4e9mr59192805e9.11.1793202242297;
        Wed, 28 Oct 2026 08:44:02 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Date: Wed, 28 Oct 2026 12:43:12 -0300
Message-ID: <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() can map a CLONE_VM GCS and still return 0. A later
copy_process() failure calls exit_thread(), but arm64 did not
implement it, so the VMA stayed in the parent's mm. Wire
HAVE_EXIT_THREAD to gcs_free().

x86 already does this via exit_thread() -> shstk_free(). The separate
x86 TLS leak is different: copy_thread() itself fails after the
alloc, so copy_process() skips exit_thread().

args->fn tasks inherit GCS tracking without allocating; clear it so
a failed CLONE_VM copy_process() cannot gcs_free() the caller's
stack. Keep that helper in process.c with the other fork helpers.

Fixes: 506496bcbb42 ("arm64/gcs: Ensure that new threads have a GCS")
Cc: stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/arm64/Kconfig          |  1 +
 arch/arm64/kernel/process.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cfef22aee709..3010ced4b4f2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -177,6 +177,7 @@ config ARM64
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
+	select HAVE_EXIT_THREAD
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..d17172e60acb 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -320,6 +320,13 @@ static int copy_thread_gcs(struct task_struct *p,
 	return 0;
 }
 
+static void gcs_reset_thread(struct task_struct *task)
+{
+	task->thread.gcs_base = 0;
+	task->thread.gcs_size = 0;
+	task->thread.gcspr_el0 = 0;
+}
+
 #else
 
 static void flush_gcs(void) { }
@@ -328,6 +335,7 @@ static int copy_thread_gcs(struct task_struct *p,
 {
 	return 0;
 }
+static void gcs_reset_thread(struct task_struct *task) { }
 
 #endif
 
@@ -341,6 +349,12 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/* Failed fork after copy_thread(); deactivate_mm() does not run. */
+	gcs_free(tsk);
+}
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
@@ -503,6 +517,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+		/* No user GCS alloc here; drop inherited tracking for CLONE_VM. */
+		gcs_reset_thread(p);
 
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
-- 
2.43.0

