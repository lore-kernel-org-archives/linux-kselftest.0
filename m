Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731637;
	b=Cu9JUf0VcdpyDs955EyvKtybSZpjpaSMbt4RCVhs2xh9JYRI7oB4HNrM8LkrddFDtkfM
	 gddi06AWSZREX+nyTCRgQHok9VTfgaSrIuUqDhxbO2QVFPmWqaPiSyX0ASfpz5JlcYoKK
	 9mBt/dn1TKGrm9sSQ8njt+jDEGpdhpk/KzqEUwP62dLCZn7n5Ts1mxZbVKVgsO6x3u35M
	 EusdKqIcvlpBhQSgrLXwuIre0c9zapjPLJmsgS78U1vbuPBqPbIXJ5N3nGiYmi1GAujRG
	 kQ6wYBitIGvcuybvQmnE51EneHaOfxP03uS2yXk+BMY5ZeumTWEsN0Yp7uuTkHvz09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731637;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CioEbthA0RLKw6Q44WSnTaLfw5reBTPGnQegHgGWlKc=;
	b=AoCGIGd5A+8CAF57Vo6O5zn++lnRXo8VpOu+UTs+7e7/kaxWmVatQlqBY1u5v8T7XxWS
	 L0FX9iBF6eXB6fmHGFq5T2E3C2ydbFaDboVvQcmheDuU0RPcXiiBGL+oZBxGzoeVzZ5lu
	 Lz8wTxDwEVAyXen96/zaWX0l5XwkVmYweGZtkayxC99kna2NOrilErir0/GN6C25Nwtd8
	 JzifG+FVjSFwF2Qchvm6suQHhYPvRhfLR1e4DZqbjePC0R7W7tZLL5i7NsjyCZTLHW/yl
	 BlnyeL8bmQAKuzoNRrCE/uBGr9KR+b/UUIG2YVIPAyinfqU+hPwOmW3GqKLLTxHdw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IjBd2zeb;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B6606A326;
	Tue,  3 Nov 2026 18:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IjBd2zeb
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28071595;
	Tue,  3 Nov 2026 10:47:12 -0800 (PST)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F0063F628;
	Tue,  3 Nov 2026 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793731635; bh=LmF7A+ApeToyb4QGehp7q7XzlVTMKY5IiKA8nC2X2ig=;
	h=From:To:Cc:Subject:Date:From;
	b=IjBd2zebkxMWGi7/bmmIQaz0sKF8/NX4nvEwTSvd0Dp8e2p8OP+eharLGaozuNHLz
	 EoSmq2GYtY8FxFfb2INQuRJQvO6QyrccJ+qGYc+SQcUTSLK/wM9N8LMhPgzp7rC2oB
	 n1b/+wEcHmyI1eV3iL3NU5FJErV91pyDU/5RkH9k=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH RESEND v2 1/2] arch/x86: handle ARCH_SHSTK_ENABLE explicitly
Date: Mon,  2 Nov 2026 12:17:07 -0600
Message-ID: <20261102181708.29178-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
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

On x86 user shadow stack is controlled via an arch_prctl() interface, in
order to allow ptrace to actuate some of the options, and allow normal
syscall execution of arch_prctl() to execute others. Only valid shadow stack
options, for both ptrace and normal userspace callers, are directed into the
shstk_prctl() handler via checking in do_arch_prctl_64(). Then in
shstk_prctl(), it differentiates ptrace callers by checking if task !=
current.

The trouble starts when the handling of the task == current (normal syscall)
case treats the enabling option, ARCH_SHSTK_ENABLE, like a default case. It
reasons that shstk_prctl() has handled all other possible shadow stack
options, so ARCH_SHSTK_ENABLE can be the only remaining. Or so it thinks.
Because the ARCH_SHSTK_UNLOCK option is only handled in the ptrace case.
Since it has no handler in the syscall case, ARCH_SHSTK_UNLOCK can get
misinterpreted as ARCH_SHSTK_ENABLE by the erroneous default case logic.

The impact is that doing an arch_prtcl(ARCH_SHSTK_UNLOCK) syscall actually
behaves like an arch_prtcl(ARCH_SHSTK_ENABLE) syscall. This is a surprising
behavior, but does not expose any control to userspace that it doesn't
already have.

So drop the buggy default assumptions by checking for ARCH_SHSTK_ENABLE
explicitly.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 arch/x86/kernel/shstk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index eb690ba90180..8deed118040c 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -607,11 +607,13 @@ long shstk_prctl(struct task_struct *task, int option, unsigned long arg2)
 		return -EINVAL;
 	}
 
-	/* Handle ARCH_SHSTK_ENABLE */
-	if (features & ARCH_SHSTK_SHSTK)
-		return shstk_setup();
-	if (features & ARCH_SHSTK_WRSS)
-		return wrss_control(true);
+	if (option == ARCH_SHSTK_ENABLE) {
+		if (features & ARCH_SHSTK_SHSTK)
+			return shstk_setup();
+		if (features & ARCH_SHSTK_WRSS)
+			return wrss_control(true);
+	}
+
 	return -EINVAL;
 }
 
-- 
2.55.0

