Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C760B388887
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303466; cv=none; b=nq1xIkLTk5YWgdW09dRR2WIsoR9VXJ9RrBiRHtNbY3VM+IMqAt8R1vXN4DuhLBb0Dy2TpYPPK7KsRvNCicKVd09umL1sNbfKQseQ/xGj5Hg6pCfwTCseOde45ZYEUZXiQ/vrUgm9mELtqhdfSZVPsTNAYiuLMhV2uPbQA6ekRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303466; c=relaxed/simple;
	bh=h8lwCwpBvsZAK2xSMui6cpZp1xkNbU+SVH73g8ceUx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwyYpdQoFm2RiJ8fozGW6o+nobTw43lfnmA6ZDyJT6kUYDRjp1VeAElcQGAygWkspfC8GHBHyqEmY+AWbc6/X7kBp3Hj/yCaw603LbLcRjVG3V0SaQviD4VB4d39l3o00STxrmfGEymJyr4/75WwkrjB4uJeGEY/2VFo4tPGbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjbXNHuA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjbXNHuA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf3781ca51so18813575ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303458; x=1780908258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS2CUg/Sh/44DwNmonmJi8mUsAkNkldRmQVB8GPLmro=;
        b=bjbXNHuAP7LFkvBLGc5IqNXM2HTlbnHM8i1/WRKOpr5xEK3TPZ01Ul+H3NAUgR9LcM
         CHTYlzm6JOF8ACaPJNn+4/oAJFw5JwctRF4rOaO/54Nz1rqcwuyBbmyB49JPITpLrOq4
         NmDW6seldzadDFbVBXJUb/b/jOzodsDCN9l7D3wa5h4nY2sUcfi+0+DWXRSnTxGOsaZt
         xKzodV0nBgLqFkzDGc+1Mp6NLHvE+N2wa/ZEhzUosGf7Gt5WWCJpSa7aoAHQwzqsDyoO
         nYchj1BZlCZKe8reTOkb95FWqbgOTyq9JGXZaYQ6FAt+J/UK0isyazxgSMRWu9vfK0zG
         TXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303458; x=1780908258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fS2CUg/Sh/44DwNmonmJi8mUsAkNkldRmQVB8GPLmro=;
        b=X/+NE4iMvJsBCDkVdXwBWVfs7VJzQNU4DcepcoPDJPM45XSAwV612fHtaw5NCWH1WB
         L5HPV/6xwQhSorqJpgKT1Dr1/ytifXPeZVdaoZtuqVFh3b9jygTikbutHsaxHTylHE63
         JWp8s6Z/lqSwLGPwt431FdYuo2keAYXzJrJW/G7QGtrVUyKPxcSwZSbUtPapZbi3GGEF
         ITGU0QsLtMjF2VbHNbt1FletyFkBJtQ9EPoVUZ7o895x07hPSQEn8EjxSw+MgQWgWRP5
         TmP2U8Qk5SFa4GAjWOvl0bGumtjtY35zXWB6ZfziO0/NvoU6Tjh32SbEtFBwr24oAUGl
         cCWg==
X-Forwarded-Encrypted: i=1; AFNElJ96KpAOBoxg5gQiqTT/4VPq+ZfS1gM8yiLDFGpZnCElSVV/CRC2KzVqiS1dIVdhnPMe32kqEZuiAjFSqEHVqWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHVQuiRwuwMfRpbjhf4B2s5cNYqoZLakp83vjoUqjpOtHNy0g
	udnpdrv5rQjzkmidvQSY0SlkSvPgsIbImWPS7JtlKzd7FDNAqScYPUZ2
X-Gm-Gg: Acq92OHZcMFzYMSHUfBsQ+y3UdYCnZukuunkdqFvPxjDkX2fObCCwSyxKJqK3S7dyIA
	DS/gOsgL73/5EVKbuOjLpJuFNyWxGIsxUgRYe4cM6bgcc4U8YuJ6wy/w5MVAzEZWY8pQLu4AulE
	dDOA9HhaQ/IorXyHMDnbpCCok0xPDxrTdDGSTXdwGJA/qEaZACjRh1s6YjhwmGONaWaykHswGXV
	mt6pgVw523JOdWdSjIYQgZO+pex7au4B9l5zpkqfREJPUNzSFAV/KKJpgEVFBmf3Y+j+KIsBh+7
	SmEUSUNomiE0C0hiUNhA2SORrX8h0eZ/QrTEDmeg/B1ivf4lPEgqbb22dCPeu6KinIuRqEwsN07
	xIrtHAa9S2JbbqqEWygwcn/mMts8FykycEWM6aJv7tdRynGTsZUe4ATXPrlX8aVcysRiU7lHT78
	ZZHcjv0AJCax7WYUnfZZdoM6tPPzesgr67Ig==
X-Received: by 2002:a17:902:f70d:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2bf379b561cmr100522325ad.15.1780303458099;
        Mon, 01 Jun 2026 01:44:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3eb31sm92807725ad.75.2026.06.01.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 7/7] KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
Date: Mon,  1 Jun 2026 16:43:35 +0800
Message-ID: <20260601084336.2601675-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
add these extensions to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d88edef77ccf..4fab3d2d0b43 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -89,6 +89,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
@@ -552,6 +554,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICCRSE),
+		KVM_ISA_EXT_ARR(ZICFILP),
+		KVM_ISA_EXT_ARR(ZICFISS),
 		KVM_ISA_EXT_ARR(ZICNTR),
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
@@ -715,6 +719,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
 	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
 	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
+	case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable)";
+	case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags)";
+	case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value)";
+	case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable)";
+	case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags)";
+	case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -911,6 +921,12 @@ static __u64 sbi_fwft_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
 };
 
 static __u64 zicbom_regs[] = {
-- 
2.54.0

