Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F44224AF1
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904640; cv=none; b=jXwq4oa53pItUVXigJvwciJG+YcaPbomb9cKA6affPQDBn+iUbMcL4QD+Puw3BxtlfgQWW8ksJJcRgLqoeLSgol5/y3E7NR+a3Ec/fE2qZTuZvYyRu2xh2+l+qWgMkBFQYz3vlA8FfXfYP3sWdRTjHdH8XX9nkjqFwmEuocW5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904640; c=relaxed/simple;
	bh=jKX7yCJzLXTBm7/RoRGPTwNXXmYDIrIjrn7OXhM9jJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1ctTapSQDBmCj2UW2DRLn2uAWqaK5bLUr7PFHlSkknjCR5d9KApBw9V24nPAuDmBWmlnnrfkl+43gAMi+Yb2H98RKxp7ftnDfRkCwXbvkgR2mxpYqxbtNwiueSHgNQZWkm/1UOHAeT7zdR0wg30dsuJBmywjetHOiG6fdhDdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8xM5z2e; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8xM5z2e"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so27573775ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904634; x=1784509434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=Z8xM5z2el85KExbg2nd2ZXUOuGVt9dtLL+uub/EEgQ3U/bge92iNKmKh/eMNmN3EO8
         nV6E0bixZZUYhICn5DeJ65RHLwh2GlF2ZpbZgMsxnueCr8Wez4acScnjgbANWmS1TJyU
         zwuRy95S42ufRymLRdiBJQy/idVt4xw5otYOWB+8yhb0n8+fW2bNi4XI76aFKd+zIIYV
         c+TP9OzzwdFVEszAJJDB3cm45N2vDo34ycU3rmWjV3+lER/gDF6Pr+xSuaKNXD7onXA0
         Pwlki9zXqrzRKX1Pg9Fwfxgwb24qRsLNxgACqzCHcU/YwycrA223TUxYDi67aIy2oZji
         4KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904634; x=1784509434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=at8mMQnD3wE0EckgkUNcLpy0S7VQnB74++bKun/nB+7mC3IiX6iBXcpJif+Qy0lZaF
         4AqDZWzfasz5CFZam31jpKy08z4Eceq7W25x11Z7HQaTTRZ+xlqn4eSniCUKCmGi+Y7E
         mDjbyiuZ3LynmJZ1FP17MGjpM9XNUXT47VX0NahNU33qZuJUWf9mdC8a/1kKYjEbmZ2X
         heDjXlRmsj+DURlqjbxZRybmuXp1kTtsAtwrCHVox/wOyMiLJwUoaUrYyVJISppxktXj
         cLI42KFa9Mh7ljlEGg6k7GdJk80HXgMwISi6q0Fxhb6t9rFpOcw3c7HhS0R7CRqX7c+O
         I7Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rr88q6sP7rkjOZCc5S17GlrDS78VFdxwIV1NP2ElwImCoh4Hp0QYBsDUsV41TJT55gRxYOC9JIPIC8gdQo/qnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hFPn2ECX7eo/f6tWUSWiJdexKFalqn3oSzQsIzGUabxOh6of
	t9vhhFEWGZg+H19u8/MIsQ3z58Wq36Vyy0YZWNHZuDrCo1JiRxrFtMb+
X-Gm-Gg: AfdE7clZ48EyeXaRZqcIVHZ9lmqLBuNJp7alunrC4sc75/ztEESq/SJkBoBDP0VfkDk
	8YgRBOWMGzttyLQEol4VFF/zcjT0Hp234GtJuoYd1joziKpS1q3i9FCDwgcE//e7L7W4ztPAEJj
	q+15jTp1BKsWJaTxisuVrIyR0MJgQYy9tP3LdY7ZxT7M9psLXw12WeRK3DlWdGWokEIb37nBI8a
	LNeCmPm1vXuWIgFD2L5qFykssaUDk2BaL32+C9/5N9TefSHaoXhydnwRcvTgckFSbXudhdeo/45
	Z2xERUWSPXJckYgBOAxzT4uhqx+Z2f8e8T67sceOfelgBC5xREFdt2nL+pyCTkNmZD3hO43WrHx
	+E+KdHJ8QuEnJdSSRHC9WxBuLsRmj8mHh+P7LtqEZ/kdQGUCngsB2c5Z+/gmL8hlfTnOZ/KpZwl
	72sl15ypX9EFQ=
X-Received: by 2002:a17:902:d546:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ce9eac212bmr74630405ad.17.1783904634295;
        Sun, 12 Jul 2026 18:03:54 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm89409935ad.19.2026.07.12.18.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon, 13 Jul 2026 09:02:55 +0800
Message-ID: <20260713010302.303278-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
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
 .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb86cb6b3635..94e33b2ee796 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
 };
 
+static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(svade, SVADE),
+		SUBLIST_ISA(svadu, SVADU),
+		SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_mpxy,
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
+	&config_sbi_fwft_pte_ad_hw_updating,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.55.0

