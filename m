Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361256;
	b=L5d/ySVz5uCJfbXN0c6RotqSy8GNSX5Y9Y+vUhEF3RccAY8vVGeMIdpGDCBSbf9yQJ+x
	 nMMo2361C9gjLd6/SZ3vHxoHpQZH2QyeG0px5c0m0JstbylTFxZR6r470wdlIVWAxoEVL
	 KzSZgkpCIet6N0/zHlJnpoEg5T6NrfdjsOi+cIn2jXTdeEImhvpfcakjZrlvuLiNJnB5I
	 dxrM850tzcjr5CFFrnx7XYWqVVpqfmcQrkx2NTFRdzyJBPJp/4SIoOESWbIqkPI5c7y4J
	 dYLPt0kYHABGl3hwwHdOK3A2gb3vyXJPUBdo1qrLzMyUsw3xG+lmNeeMihutSraSjOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
	b=xQMV/RkPqf8KFZqRpmDwHs7KQ5qMq+61N4u0/U3Jr7zKGAQEol5JssZjXacblPY6CLlh
	 HEIx6PCVSur0CJZrnHx0BxxA+tyDBT71BLz51FhOcMOADxiV2ja55WMCj48LcattxDMYU
	 JVn1ggLiY8oz6nV7Hg8CdNNAHw9dvrMsfTIZysV1AI18cDruNK14Gihqt3KdhqHbHkcMp
	 rzD1LmoKlrMshcUCb/Xy838wdXH9ru1F4guOEA7FwadaQDYdkyrLC+NgK3mY405pJm6wo
	 ElGOuU3XOf1XcQghTYL7yZJReGocFzaefVHZvKxznkdRQd5x9ejiDalKtWDHR0Jgogw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dV6pIqMz;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADF606A335
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CADF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dV6pIqMz
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so720339c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361255; x=1793966055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
        b=dV6pIqMz6qcj5WU78ZHzj/KF4aKibYvrs8/6ji6nXDDNh5PDxdyvZSyJvYni9ymT1r
         rNBf1xYhAG/jXaKaFzktQpG2ZK9zdhVyN+y95XF127auwbS8LhI8r0OYqS0XolIPwWOW
         dzxadP/bMd8Vo8VmB2dYjuIMwpZ41MKi4hAOcuDJvY93EbmF+afT1IXyACyZlAW79pT8
         posjpZxdFgNsC0zIb6JimPVaNaLxI6Fqvryx+FhEZTBU+5IIxX0mQrHvFA0khE5DcsMT
         fRBicev11S9ZrLyo5ptfT703aUlKAzBvjIf58F4+8XG+XIcudN/+gRF0zygAR/5rE9vM
         McOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361255; x=1793966055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
        b=g9xWaTH6Gmn6jInrAz4YCgILZCQ3bNMWa4nU5TH6jDCDGE0MRW+mTPRcZWbyBydS5b
         u3jVsElPdr14IEeaArFlxxHJCuur77enXkLvDBYQ+hbKlFZp+d1B8+kGpUwbq7ktGo1I
         oQG44mEIpSIUO81y9wLVc8mXTRwyUUn0lPkvRKaH4g+pxwjs301yDWKtG6G+F8UbAIbq
         2nMquwCkdkZSa0VoE2BtTJGbwYTtho5N9QOY7960kN2vKuUCl1DNMWq7ylTuxkAlvDrE
         7okH74BCJt8AKrAwcH4a6YOxYJiJBOn3ebl1g721sp4U2q/oGR3TCfcyY778IVYt8cYI
         QhdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSETHi5/W2KWHxgccYVe5ofHOgSYFkpQyEVzslIWF5D6lcxa+8bh9aQGEnPUq1W4Zhxyol8TUhTTt3HKASrFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLomkl7jwjs4fuDCSgsZ3XtPGyYnDbaQY/mk5Vyhi+HXW0l8bYm
	SiL+2DRkyWxavOLJF1vP4/crMTgUm1gkjgWMVKPEvEFWT08XwJNLtofg
X-Gm-Gg: AYBFou1gCL/M+gxsC9wcww/qmFAafA1Lwf8WI603j/E3W6KTdVbMG4j5mWY2K1FRXkr
	1c0RJWX/Eq39/o6bLjApCzDf9fSXI0lHWuDlFAAGMeNuyZ1MzJCWiZ7uTGBCxiaivlLOx/t3fn/
	q5fRFLobS2qzGc/yX/dCe2u4kTvIIClLi1v/PVdqMDpZaWMPJU4UpICbiw5Xb3mikGH5xF2gyRk
	VZb0kjNGXnhW3q0y6EEXWHBfDqim5uq/aTsABADykiXfQBekYVrYtYvDg7QYlHCm81wpKz/s9xs
	qWX2ULD+ozabUYcQH1JE7Y8r3lUDXoEYl/iSH5AFTmzBWjw6+4UH3aCKehnEC8LSkkR02HfmEkS
	GTnkN3SAD9Q+ZyaEFQBd1FGfI5keLAPHRWG3eAXjeKp0ekGA4GXS0DJxeGheAN2P6/4O+mdvmRh
	Zr6GAwZeZkvA6/34dhv1mzc5wvD8o6mb86DzKAjSrLIQ09PXVT6f8e/KwyQc8iP5QmYSxL3dGVV
	1P+jAswF1oqoG0E85NtdVwbPp4eA0TQLVP53M3e/i8+fStv+rcnHoP4lNnE92J3mG53VZcqRUSb
	VTxDDWdTAiRH01ykZoXKWFYD
X-Received: by 2002:a05:7022:b053:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1ac5bda4447mr3052864c88.21.1793361255352;
        Fri, 30 Oct 2026 04:54:15 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:54:13 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:07 -0400
Subject: [PATCH bpf-next v2 22/22] selftests/bpf: Cover a backward may_goto
 pushed out of range by patches
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bpf-verifier-patch-batch-v2-22-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_do_misc_fixups() expands a backward may_goto to gotol when the
patches queued between it and its target push its offset out of the
16-bit range.

No test covers a backward may_goto whose expanded jump only goes out
of the 16-bit range through the patches in between.

Check that a may_goto jumping back over 8191 guarded divisions loads
and is expanded to gotol.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../selftests/bpf/progs/verifier_patch_list.c      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index 1370cdd5e5836..302e739caf83c 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -172,4 +172,39 @@ l0_%=:							\
 }
 #endif
 
+/*
+ * may_goto jumps back by 8195 insns, by 32768 once each of the 8191
+ * divisions is guarded by a patch of 4 insns. That still fits the 16 bits of
+ * may_goto, but not the jump it expands to, which has to become gotol. Once
+ * the budget runs out, may_goto jumps back with r6 set and the program exits.
+ */
+SEC("raw_tp")
+__description("patch list: backward may_goto expanded to gotol")
+__arch_x86_64
+__success
+__xlated("...")
+__xlated("{{[0-9]+}}: gotol pc-{{[0-9]+}}")
+__naked void patch_list_may_goto_gotol(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r1 = r0;					\
+	r6 = 0;						\
+	goto 0f;					\
+1:	r0 = 0;						\
+	exit;						\
+0:	if r6 != 0 goto 1b;				\
+	.rept 8191;					\
+	r0 /= r1;					\
+	.endr;						\
+	r2 = 0;						\
+	r6 = 1;						\
+	may_goto 0b;					\
+	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";

-- 
2.43.0

