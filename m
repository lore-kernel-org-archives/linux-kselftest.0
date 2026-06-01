Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621C3876BD
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303444; cv=none; b=dZINT2La+FJisk5/fayCjup1D33cMWbzu97D0qaac8jyOPzwRQcvj1rcSbG6wT0iHAYJBPFBASgHPZqU3pKHzN5bfGF3sSaEAX2E9eVju60jkiA6yAWtoM6R1/j/tHh1NrajlznaAWu/UbbG6P80nSNT+pAJ9R7u4VOquek3LEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303444; c=relaxed/simple;
	bh=sMii3fcp84xgrUzG/3AkSPmm2RWBWNn2SHl6UbCXr58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWEmGi+s89W5CkPh+z6zdUaN661t8wyj6kLZ7sTMPQKXM/1KPLt9w5LmITKYzSju6q/KjEh9n5ymKueuPdT1Vy0tgMVPqwhOtebqdAy/EhT/Z5OxrGm1DCy62WmvUiquzxmGEpNw1q3INneSR8YTsveE75TayiBNOd5fUqHovC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSncP3mp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSncP3mp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0b944f6edso13000065ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303442; x=1780908242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=rSncP3mpc4hJ8UYDbDY3aBlLI+nPtJZ3DtxcfcH7R63NXbn42iFd2ZvDsrOkK9Y6+a
         Z0szbUk0Siw86BPdl+4FHCHXtxF/o8UBJJMEf0t1h2Zdxh8lHidnWVAdAbcQ4Jk1zTFN
         zMOQhaautKIsc7UfStlZWQ59iJRKEHAGbLaF773y2ryjZL2ulwzpwODbkfSpLdgDxqdy
         dWgSEtICIi1XyRmFla3eoJ4b3agSneejJQ0MhLiCNJl+bAuZaFD8oaCxpkyI6Cf0lY6Z
         XXW3l4j44ksCUxrKCygSDCu1D9eroU1H8mEl5fbGVG8BSR8q+M2i+3PnuDPG+VSDrljy
         qQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303442; x=1780908242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=epnYE5RbyM5ROw6mRPOcentENH0+9S0+IpMO0JJ5EiGpLsxdFofxUCwv7b0WcDeHdK
         oxv1xCX/LbNU6d/sQGGkVACzRBbrAZE2SbdL+k+kQjM5ORHAMUvDmTvSC0olST2kV4vb
         b5xt1EWV+lV/4VDkd7XFAesdUvYYxzP4YYaW12BAldzeMXKdvLrJMKCf0XJ6JI62n+qW
         AzRP/xuWajXfBqSj3P7nyHqDn5Oo+NUT/fWS2Mtuh4ZwbbCln0PupcJr20Tf81SoHgxx
         +d5FHm88qKIVtfCeq7v2KZ84QspeVqsDA6K3JAQO8AMZLa9/kjXtbL2rudFyxjiMRmKe
         L9Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/2dzMRkYdQtFVfpBJSGyWb3DmcJDfdrQtBiW0JrDjL2rBRDL7kyfAYcK6desaVJBPXjysWIBW0N/R1TtZ2WTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt75W+5Rjp7L+QlZLLPadzblhbLF2Aw3BjD5svHKzNZox5T90E
	LpZA2WgQVbaDbmgMKR4b7LEM1uXrO8Z8jZEHQ1RGrHeAb3qCagMdP1mm
X-Gm-Gg: Acq92OGXM5E5Y3ycJTOt+RFe6xgtaSp5v/uQrmVUio0vcu184l28NsWcO8BXDNTuH9B
	tqmK7N2MTAIIVjlRwX6n08+EBeTlN3TbETQHB3XDtm5UbsmoWOh4haqPZEuH5k8n0N2iGcievtN
	/d+xtztUryVTHpj+FW6jSNy+pYg9/Q29Xa6ZHM6PGYyWQXD3kiZXHRGGGqukKzXccfyYwst8KWR
	PdigHiPtlFN1GU8a9jJNr7dskziOLhbFjqdQ43V//U4SCduKe37WUAcLHIWv4vkJeotx0RjwLqP
	Bmcvr+WwxGKXcLxjwFmkZhAZKVNAZbcBdUkN5vUTOtJvlNnzC80kd1grYv0QVqrgoUM3XfBfHXX
	w1snIZkgfMvQo3VZKDJ+/ElyYCkc2YhB/WDrKZyJiRaSSE+2L80ytAInKsO8a5eK3e5G4cZCFQm
	ADPTUSorKU/EnH8+h36boR6Un7jZLVmzLbbqSBKqwwFWdT
X-Received: by 2002:a17:902:ea12:b0:2b2:3bb6:fbf8 with SMTP id d9443c01a7336-2bf367aa3a1mr120210065ad.16.1780303442300;
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4dd4csm99949505ad.78.2026.06.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
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
Subject: [PATCH v2 2/7] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon,  1 Jun 2026 16:43:30 +0800
Message-ID: <20260601084336.2601675-3-inochiama@gmail.com>
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6fdb5d38b8..d88edef77ccf 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -712,6 +712,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -905,6 +908,9 @@ static __u64 sbi_fwft_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
 static __u64 zicbom_regs[] = {
-- 
2.54.0

