Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202263;
	b=X4kAkVs5TKzsMuMndSTFpZWXH/VkRyB1NhfRgP/YLlo9vBk9A1QQHSUhIA1xgPq5E8+t
	 MZSxMSLJcsP7sH/2bx30N3wefU7H+85I/9t9pyO/Q5w+UyfCSXroLqxJqwvyFhwpDo39i
	 oFf5PbJZpGUjJqvAwA5BXRO3VQZeenUkzYFVIcMbeATM97m1jMmQ0J8PG7TuSBx5J/UtL
	 Ub+elROvXO9A2syJknmsQEM4ofdXWONVYBOhPeKMC8qr5G7T4E8DKNlgl2PtLqwXvZGpm
	 XrtAGSyGna5JDTEDaVbMrWtzSa7alPex2b1Zp6PK9aY/nohDsqwqFEwn3VhcCJ4a/8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
	b=GcZwvboQ1a81zxqCrf+3WbaKUf8lMe376/DksgYaSxLbuCmdJES0GxwS9ZK2OmcBfJxM
	 RNsmuw9lvXf6G68J2kHgqSlrJ7oLGaKjtBmMt5p9Z0d1SaVXEyg112PSKmbhEUYpXlNKE
	 jvZG8jQEsv9LWiHHx1T95OLhniwqKfonih+5lmwMZnwYgetfWyLCbFiPQPD8z9CaIuz4E
	 Sp8ssfaqSDDa5lRBKIT0xC9ROH75RyFT0Am9uC+6pluLVMfB7mR1UTH3lWPl2GE9FgQMC
	 lEqF0zClmImEbkGrqEuYphEW6fANOI3e+BtXTZuWQoybWsBqUYU0eXZOLleYItILnag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVRQYMZm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303B60A383D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2303B60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVRQYMZm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7511685e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202261; x=1793807061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=vVRQYMZmRATfXuBDLw24cUDCHaJq7j+gDMv8Gym+FaX7CLKfgfFnccPLvsd5c+/Tka
         /HLjVRkiJ8uODWT7w65gtCQTsKUEsQiC01/kPuUs8L/YMB913fPNTBqbjmgUPH5lTrlN
         LU+ae7VGzf5rwTZXkeQw13PZUDhNUmZ/KBQxqtWoWh5jLsAz9Nkqim6r0nksE2WuSLuL
         ikrzSl7HyUx13SpLJa09UXCNK5tyPaYhxhU6hlyBqSNCN8j+V0i6NujGOEXmnmDNIQQ7
         Q9jj6iCxMz5X0CAIyh3MjVyp84AK91EmGTy3GAPMrFdreF4iVpAxoZ09RD33DzMZE8LJ
         UD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202261; x=1793807061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=ch9czYdmfYjCR8aeWPlRBz9l+Et7H6Zc+1HvJRfLzjBKpZ4JtZOXzpT83eWWCtk3px
         IXEveq4fUq88aVAxAxQBXVRJIzooYgpj2TQW6H+XiwC+9LCiVnU3YQKxHoiM5rFVKRWA
         kWDNOtiBvFX32NVTAIWufmH31nzxQ8ZbJIaiQcVS8eug6aNqPCakrzdsiEk5TWAPZHnk
         KYalhelfMDj5ImJ6NEKezjBeXIlFEp1FFZcuyVYImieb4zU1mgGRLOOo11qtb7nkKZLD
         H1CH2Fi0TD7tBrdE7iYfvRjxsZNhhcMLMAxUTplgwP3ciTDtALU8BJy/cQLSdI+CkTh4
         LBlg==
X-Forwarded-Encrypted: i=1; AKwUvBwNE9RJsiNun2awVHExf+jw9rKuR9gVCAv2tkQVLOU3CD/hUXgH51wQ/2/J8mHZKSm3TVg9ZFLjfHoVI+ECcok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIdAX2qMC8Hh3TPC2pQ5w6Eqao5zIQTg5lNqatvWwvBd89jzwv
	fJT8LAlVUEq5HBVJSxVKe88GWtUpMV6NcR/ww39USp+32L8MtyTooK8n
X-Gm-Gg: AYBFou0mceeDsM0ivFmSqXQ7kNbhRJnlT6gjtjDBar6Zmvm4illiq8+UXFkyY9p5ZVw
	OYA5LTTKX8mv0Ho0O3y/I2J/rBzNqciI5AA1xk7364RkkYNvYLHRYRbVbZrI4yxwOs5IMdhDpqt
	7+KumQBrE4/aZBNN7/H7fkMs7cTC1Py22Ow+WVlQmlybJhdSNd6HfM+g+PJGWZrANVsZrw9WCGe
	3puqiztZW7pQf6zfKHyY/uw0C+YlGgCApf1yr4HKeoQRXwcajJvxc8xWQ6pluzELIDQxRneEWNq
	s9Bran5KmKOv7nq19Ws7tSyMYAwdSc4y2nxoVhm4yESkhS1zlKAUh7FVvqJS6Pcqw/GbkgrGvAq
	QFesKcCITwFKEHWZYmNV1XuijOEtQH2IEs4LGLjW+C6Qu+yNrltqp+W/9oQBKs9N3YK73u35oIq
	CIwuEfcQXLzzzB1U7yd+aGxWerf8oFEEA+++ZXIAn08a/zeHE6hSTsdKiZ61CNTqeh2o8D0COvy
	Lrsxx2TiiNLC8O2bArcl6WgeIp6qZKHAu1M/vWNatwWvdXWUv9fA8kjFA5+KeehE4PdHJry11eP
	4wJcgu/qeM5rkHpQLRuBWLA53l50TfZyEaPEEuW/Ba1LFeoHQTwlJm209I4/wFggvw==
X-Received: by 2002:a05:600c:8b6d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4a967f8c344mr59591525e9.31.1793202261496;
        Wed, 28 Oct 2026 08:44:21 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:20 -0700 (PDT)
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
Subject: [PATCH v3 2/4] riscv/shstk: release shadow stack on failed fork
Date: Wed, 28 Oct 2026 12:43:13 -0300
Message-ID: <20261028154315.1272705-3-ivanrwcm25@gmail.com>
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

Same hole as arm64: copy_thread() maps a CLONE_VM shadow stack,
copy_process() fails later, exit_thread() ran but was never
implemented. Select HAVE_EXIT_THREAD and call shstk_release().

shstk_release() already documented this path; connect it. Clear
inherited tracking on the args->fn path for the same CLONE_VM
reason as arm64.

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6c9d61d83d71..ba1ee563aa54 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -168,6 +168,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..5bb93377d67f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
@@ -213,6 +214,12 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/* Failed fork after copy_thread(); deactivate_mm() does not run. */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +268,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/* No user shstk alloc here; drop inherited tracking for CLONE_VM. */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0

