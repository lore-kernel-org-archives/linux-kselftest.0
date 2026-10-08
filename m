Received: from mail-108-mta150.mxroute.com (mail-108-mta150.mxroute.com [136.175.108.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6F4A2619
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490932; cv=none; b=V57TTQBK6oMIoJbCe4d4/Ew1PMp4Tzz0RnyU+wReXZ9EavZ0nOYNZk2SFpf3v4ep2ybA8Pqb7o21g/IzdWt1MY/d/MbUm/8l524sT+tCC3i0XeHw3gWct9DMjcbv8QEGuJ4+AvVId9zpZY/wARWeOjfie9kTKaO2Fq/TVXxDxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490932; c=relaxed/simple;
	bh=nkP0TYI1OknWXhUJhJ/P+r74OvQrHG/vqhKElueQsOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxeX4jdxEEaT4mySW7v3AudzTITNUa2h/oCGxezls+kZaytohd8rgIcnPpOTheo/913c3qjGViM6Lm31TfAqWaaY2ctbdZErfRdd2kyopSQW4qBUBp5AhGRZkAVvdnGmSuMHN4QESnZDQZablJmbrRIZPD7PnoS1x1/9NapYvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=P7JdW09+; arc=none smtp.client-ip=136.175.108.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="P7JdW09+"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta150.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d2975e800028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 20:16:58 +0000
X-Zone-Loop: 5ac71f445fd8009a22940d81f6501b58d6bab101b292
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UzPHQGlo4+Ej104pZ1HkoHdCP3pmcU/VGdSzNU+u5Wc=; b=P7JdW09+8F0g9EADP/RKOxfioX
	JQ/71Noz1aOJevfJby/eEWihsk284qlmlCVImnxUXBk1E0WFEf2jEUROtdbZBICIpJUFakQT4EFPo
	+XONwp79QufHCxIWgWkRrOEU8Eu+bMKQswRDW/e6l1P2SM1VxFA/BFf9GSRZlU7DB4unS8QuYNbZe
	9twgE1C1odpl/hEURomSRLT5Qk2+dcbn36rW2h2uGJ5KZRtvLvXGrBNuVPY3bqAUhXdBgTZuDu89w
	AB6yhMYEKkswv9xR7mt3KUzTo+A1wzu2g6oyliQ/CnLuuHELVuQYI7JBu+BD9g2gCCSU9hjK3aDwK
	TZJeq4Wg==;
From: Richard Patel <ripatel@wii.dev>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH 2/3] selftests/x86: test shadow stack sigreturn protection
Date: Thu,  8 Oct 2026 20:16:09 +0000
Message-ID: <20261008201610.1003569-3-ripatel@wii.dev>
In-Reply-To: <20261008201610.1003569-1-ripatel@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

Check that a crafted signal frame return address (rip) is rejected
by rt_sigreturn when shadow stack is enabled. Test both 'syscall'
and 'int $0x80' (CONFIG_IA32_EMULATION) with and without SHSTK.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 .../testing/selftests/x86/test_shadow_stack.c | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..67baebbdbd87 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -735,6 +735,110 @@ int test_32bit(void)
 	return !segv_triggered;
 }
 
+/*
+ * Fork and sigreturn with a crafted signal frame.
+ * Returns the child's exit code, or 0x100+signal if it was killed.
+ */
+static int crafted_sigreturn(unsigned long sp, bool ia32, bool shstk)
+{
+	int status;
+	pid_t pid;
+
+	pid = fork();
+	if (!pid) {
+		signal(SIGSEGV, SIG_DFL);
+		if (ARCH_PRCTL(shstk ? ARCH_SHSTK_ENABLE : ARCH_SHSTK_DISABLE,
+			       ARCH_SHSTK_SHSTK))
+			_exit(1);
+		if (ia32) /* ia32 rt_sigreturn */
+			asm volatile("movq %0, %%rsp; int $0x80; ud2"
+				     : : "r" (sp), "a" (173));
+		else /* rt_sigreturn */
+			asm volatile("movq %0, %%rsp; syscall; ud2"
+				     : : "r" (sp), "a" (__NR_rt_sigreturn));
+		__builtin_unreachable();
+	}
+
+	if (pid < 0 || waitpid(pid, &status, 0) != pid)
+		return -1;
+	return WIFSIGNALED(status) ? 0x100 + WTERMSIG(status) : WEXITSTATUS(status);
+}
+
+struct rt_sigframe_ia32 {
+	uint32_t pretcode, sig, pinfo, puc;
+	uint8_t info[128];
+	uint32_t uc_flags, uc_link, ss_sp, ss_flags, ss_size;
+	uint16_t gs, __gsh, fs, __fsh, es, __esh, ds, __dsh;
+	uint32_t di, si, bp, sp, bx, dx, cx, ax, trapno, err, ip;
+	uint16_t cs, __csh;
+	uint32_t flags, sp_at_signal;
+	uint16_t ss, __ssh;
+	uint32_t fpstate, oldmask, cr2;
+	uint32_t uc_sigmask[2];
+	uint8_t retcode[8];
+};
+
+_Static_assert(sizeof(struct rt_sigframe_ia32) == 268, "ia32 rt_sigframe layout");
+
+/* This tests whether shadow stack protects sigreturn */
+int test_sigreturn(void)
+{
+	static const uint8_t target_routine[] = {
+		0xbf, 0x2a, 0x00, 0x00, 0x00,	/* mov $42, %edi */
+		0xb8, 0xe7, 0x00, 0x00, 0x00,	/* mov $231, %eax (exit_group) */
+		0x0f, 0x05,			/* syscall */
+	};
+
+	struct { uint64_t pretcode; ucontext_t uc; } *f64;
+	struct rt_sigframe_ia32 *f32;
+	void *retsite;
+	int ret = 1;
+
+	/* ia32 sigreturn truncates RIP and RSP to 32 bits */
+	retsite = mmap(0, PAGE_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC,
+		       MAP_32BIT | MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (retsite == MAP_FAILED)
+		return 1;
+	memcpy(retsite, target_routine, sizeof(target_routine));
+
+	f64 = retsite + 0x100;
+	f64->uc.uc_mcontext.gregs[REG_RIP] = (unsigned long)retsite;
+	f64->uc.uc_mcontext.gregs[REG_RSP] = (unsigned long)retsite + PAGE_SIZE;
+	f64->uc.uc_mcontext.gregs[REG_CSGSFS] = 0x33; /* __USER_CS */
+
+	f32 = retsite + 0x800;
+	f32->ip = (unsigned long)retsite;
+	f32->sp = (unsigned long)retsite + PAGE_SIZE;
+	f32->cs = 0x33; /* __USER_CS (64-bit) */
+	f32->ss = 0x2b; /* __USER_DS */
+
+	if (crafted_sigreturn((unsigned long)f64 + 8, false, false) != 42) {
+		printf("[FAIL]\trt_sigreturn protection (hijack failed without shadow stack)\n");
+		goto out;
+	}
+	if (crafted_sigreturn((unsigned long)f64 + 8, false, true) != 0x100 + SIGSEGV) {
+		printf("[FAIL]\trt_sigreturn protection\n");
+		goto out;
+	}
+	printf("[OK]\trt_sigreturn protection\n");
+
+	if (crafted_sigreturn((unsigned long)f32 + 4, true, false) != 42) {
+		printf("[SKIP]\tia32 rt_sigreturn protection (int $0x80 unavailable)\n");
+		ret = 0;
+		goto out;
+	}
+	if (crafted_sigreturn((unsigned long)f32 + 4, true, true) != 0x100 + SIGSEGV) {
+		printf("[FAIL]\tia32 rt_sigreturn protection\n");
+		goto out;
+	}
+	printf("[OK]\tia32 rt_sigreturn protection\n");
+	ret = 0;
+
+out:
+	munmap(retsite, PAGE_SIZE);
+	return ret;
+}
+
 static int parse_uint_from_file(const char *file, const char *fmt)
 {
 	int err, ret;
@@ -1145,6 +1249,12 @@ int main(int argc, char *argv[])
 		goto out;
 	}
 
+	if (test_sigreturn()) {
+		ret = 1;
+		printf("[FAIL]\tsigreturn test\n");
+		goto out;
+	}
+
 	if (test_uretprobe()) {
 		ret = 1;
 		printf("[FAIL]\turetprobe test\n");
-- 
2.52.0

