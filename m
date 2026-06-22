Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D731313E21
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153076; cv=none; b=CmbpmVOwv7mStNSCIJjTh0DzDcMxU4ZIRfY+Lhrs6MPOBczOYexu6+/iGs415x9v2POMw6gsYdYr2DeTfg8OhXzyhTUZ0RY0p4jLGANHeziZVda5ny3Y+SQfw+3U2iEtaOdKrw+ZBEm6Zwj8L8qwU/nTG18NSWN6F5upUkxZXwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153076; c=relaxed/simple;
	bh=QIYEraF/j8k02VvAVfR9lZtuZN9nqciszILyb4fLqMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q02/LmH6j0kkjykfoBPq4QEihm2qJdCsa7DLNdCmBemZG1lfKuaT43hBw8TMI/zWZb1Qymldzj5Z7flg8wf3gi36oD6slofx+YdveQQ0ZqGGst/716JkhNl8NLeRsyIE/MSt0gT3dG2KU1N2KTcwrehqMNKbubszbslvNMMybmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/neiS/m; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/neiS/m"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7f69b71f7b2so50746007b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782153074; x=1782757874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeK5tgUe20vmCAZ/D9O4itxg6FXOxTZ9G+a/3t1IL1I=;
        b=L/neiS/mkAhH7E6rkZwJ0l+j/I64WLX0mhZTbUcyZLy3jLPrkB2F28x7KaRfa9T2VS
         wv9FbKLvywNmrOep9oQ0Zc6nRRwKa7YpiUuX/zDduC3lBw3qrtIrbf9jMjqDh7wrfsj3
         1/inbhASbNG6o+NHx4856Jt30HVA2FhXy3JPw4napnrYhxCdElnvUUflBZtX20Isr1Ty
         tA6iF6NPbmbiIQ4r3Qi/P9LhZT8+OTIoBkJDCTFU6TqjYy2n7+cabUIMTZQTUmzeX72a
         /D8XU1d7fCDMfUywG0ED8/VATHJIVtyW8BVqBhvp0FA4/EXBk+bQREx6H1yFusFZRAgK
         rxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782153074; x=1782757874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeK5tgUe20vmCAZ/D9O4itxg6FXOxTZ9G+a/3t1IL1I=;
        b=CfpIaU9CVXbwA4/W8uUWRfUXGNnaG5xjt3E+UfoMSBEXAMl5YLJIfecyAKNnz0P2lO
         aQ6JVjB2EsWDqbb9U953Blm4FvX0awtuXRVph0GvBQCxrdq7uQAmjBY7CCDxiuYN3aR1
         +rGvkCmsA6/8r9CiFqA1xm7B+dy3q2yKKgUDRS2ietk7cCjYolSBL3fGcGzuud++TnEQ
         yKZ1nw3AriUubf2CcRZoqaEQ3L3/pFfhf2IkliceFf0WPGVNv2+W45Rik6w0MeTNLuB9
         9+BAuTA+u9wdLhGtTyD8xGeurtpQNXjOXpjNuxAOvi83XRRjp1Pt8XjtRKag0qu04ZmH
         aJ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqBmUHOp8H/12KpotGPYhNv0Dk8MLQrj7F3VzDgpEeWTMVOn1Mekjmn+JmXmrMPByKSolBlfa4CIV6eM7G9Bxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAxnbVmQyd88XNPqrDaSApcGuylUU940vEzW4TNZdJ/TxlVLj
	7AmIl/oDkqywwXJ3K0J5KCR3xeSt8jttGNTH6gz/GIJiFFUrwxT5EW4D
X-Gm-Gg: AfdE7cmrL+5ZC7q0e8x5tgRE+BrfCEJgrLweM8rWOEOdfLvUZn1qG0V82vbeWLeY4OV
	HClBo+PVGVLTI8SBKhP+aexQwfbCRY4kRzStjd/2zCiZOvaV4l8tLV5O3djbt1s3ZmwOa2zD/DD
	Iby/McdLW/ouwCIp04dBHQzvv9zjW9N+Amua357NsWV8yCdL+s4K8ubYGgsN7y+ZjweiVDomOR5
	UfnJRAfP0NCcCUNMHfdvTQBt2DRn3kMN1pAMZN4aY4+h7yBxS81yLl5gJAuRtyXTdGsTlrJWLdW
	AHz8ERqG+N7dfGs7ogCSW3Ta5utnA1DsDh1FdnsRXNd4BIAhmL+zfnr/7XBhV/ORVc9A6tzeoaa
	SZ+dxH7eCfnpiuXBv+y7Ab54wcXDioti8rECvcPHVlAYB/b56DuH0nnJu23g2ddyhWeQ9soZZw3
	nRodUrd/hgnKF9i5yKS7datts441empaHnqav9ypGBq4xG8xDh1GbUfQxxI87byMCR1had8W6Cd
	QIHGfnOiwxf4EA=
X-Received: by 2002:a05:690c:c24c:b0:806:71b2:8f4f with SMTP id 00721157ae682-80671b29ee6mr10031217b3.20.1782153074082;
        Mon, 22 Jun 2026 11:31:14 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81fcb4a4sm101855136d6.36.2026.06.22.11.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:31:13 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH 2/2] selftests/x86: Add shadow stack uprobe CALL test
Date: Mon, 22 Jun 2026 14:31:09 -0400
Message-ID: <20260622183109.1137245-2-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622183109.1137245-1-dwindsor@gmail.com>
References: <20260622183109.1137245-1-dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add coverage for entry uprobes installed on CALL instructions while user
shadow stack is enabled. The test puts an entry uprobe on a helper whose
first instruction is a relative CALL, then verifies that the call/return
sequence completes without SIGSEGV.

This catches regressions where x86 uprobe CALL emulation updates the
regular user stack but leaves the CET shadow stack stale.

Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 86 +++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..3d6ca33edba4 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -873,6 +873,86 @@ static int test_uretprobe(void)
 	return err;
 }
 
+/* Keep the CALL first so the function address is exactly the probed CALL. */
+extern void uprobe_call_trigger(void);
+asm (".pushsection .text\n"
+	".global uprobe_call_target\n"
+	".type uprobe_call_target, @function\n"
+	"uprobe_call_target:\n"
+	"	ret\n"
+	".size uprobe_call_target, .-uprobe_call_target\n"
+
+	".global uprobe_call_trigger\n"
+	".type uprobe_call_trigger, @function\n"
+	"uprobe_call_trigger:\n"
+	"	call uprobe_call_target\n"
+	"	ret\n"
+	".size uprobe_call_trigger, .-uprobe_call_trigger\n"
+	".popsection\n"
+);
+
+/* If CALL emulation misses the shadow stack update, this exits via SIGSEGV. */
+static int test_uprobe_call(void)
+{
+	const size_t attr_sz = sizeof(struct perf_event_attr);
+	const char *file = "/proc/self/exe";
+	int fd = -1, type, err = 1;
+	struct perf_event_attr attr;
+	struct sigaction sa = {};
+	ssize_t offset;
+
+	type = determine_uprobe_perf_type();
+	if (type < 0) {
+		if (type == -ENOENT)
+			printf("[SKIP]\tUprobe on CALL test, uprobes are not available\n");
+		return 0;
+	}
+
+	offset = get_uprobe_offset(uprobe_call_trigger);
+	if (offset < 0)
+		return 1;
+
+	sa.sa_sigaction = segv_gp_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, NULL))
+		return 1;
+
+	/* Setup entry uprobe through perf event interface. */
+	memset(&attr, 0, attr_sz);
+	attr.size = attr_sz;
+	attr.type = type;
+	attr.config = 0;
+	attr.config1 = (__u64)(unsigned long)file;
+	attr.config2 = offset;
+
+	fd = syscall(__NR_perf_event_open, &attr, 0 /* pid */, -1 /* cpu */,
+		     -1 /* group_fd */, PERF_FLAG_FD_CLOEXEC);
+	if (fd < 0)
+		goto out;
+
+	if (sigsetjmp(jmp_buffer, 1))
+		goto out;
+
+	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK))
+		goto out;
+
+	/*
+	 * This either segfaults and goes through sigsetjmp above
+	 * or succeeds and we're good.
+	 */
+	uprobe_call_trigger();
+
+	printf("[OK]\tUprobe on CALL test\n");
+	err = 0;
+
+out:
+	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	signal(SIGSEGV, SIG_DFL);
+	if (fd >= 0)
+		close(fd);
+	return err;
+}
+
 void segv_handler_ptrace(int signum, siginfo_t *si, void *uc)
 {
 	/* The SSP adjustment caused a segfault. */
@@ -1071,6 +1151,12 @@ int main(int argc, char *argv[])
 		goto out;
 	}
 
+	if (test_uprobe_call()) {
+		ret = 1;
+		printf("[FAIL]\tuprobe on CALL test\n");
+		goto out;
+	}
+
 	return ret;
 
 out:
-- 
2.43.0
