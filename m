Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67237D11F
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304499; cv=none; b=NwzwZWTyNvQMBs7iVOTMR62/+9YVjdH8lcTDRIdSyMzl0rn/BXu5l4n5PFTRMwG4PxRuHbMgQp0GI/nn0u/pwR7ESQ8x2PCgEOTl5tRM3EEvzcf/ffNW6OgG1MpO84kmd3nQk9FuB1MTUfK7+fmY7cv5OksjrE71VqnEc7g5yq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304499; c=relaxed/simple;
	bh=jKX7yCJzLXTBm7/RoRGPTwNXXmYDIrIjrn7OXhM9jJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8xB/77d25ApD3EUix1g3ppd9dXipH1YuwkaDeWbo+N5KQRi+yJ9HLHQRs7ULqlCkldD4Y8LmKzzOQSm35C1CuSWAbhVHSWZKT0aJZHLF9AcUFooBu13lOHE4BWtlfYCjnJA+toTaUxJo6EjByyhxyqPmjKcEiAYlCjdqOlbD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/xHsHER; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/xHsHER"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88973b6965so2319930a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 19:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304497; x=1783909297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=l/xHsHERqhNkO5iImfJJ7KP/4NEPnEN1jSnpi7AXSDNJ/ilOMa369kF35n+VSEsFk0
         Z5iVo5MLmalsfclaAj7Y541OnlTbvvdGLI5okLUCMF9b+1LRE0kvuz74/5NdoX0GGd5N
         xTDV5tjzo/stA9sR3zusSRT/ptb307KNQFFJL+bqF+hzmM3MA/dgVoOJthHKuFaQHJt7
         A8WqowMPa5SI5wUxPZEQQ+whgVtbfj7FtmWKH3pbqqQM3vGgKnAdI4oyu3xkw/YNZzky
         cE8RAsE/lOI54IxTjeRK0KWVfkale6NFa+6ATVbwzH8O+VhWwKLWGWoebaVU3V18KHPz
         nQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304497; x=1783909297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=rGExx8Xw1gomCQbNW1QALbm3ONX76TF4TKXSyX4IYrlxBlyO/9p9c6DQGDGydAm7OB
         ubzRMBP9eO83NAi64N0rP0cQYUCMzmzHcdfC9DTpr3k2bSycRuplvX370AotIjek5tjg
         Rxt/TfxbMtypAZMhzvLTIJyRaNxeA88sVTpMXiNP5XC2SweU43iEFos2onmuHulVjfr9
         PBwIgCsdyjpf5NuGavtlEmp0TcICfP9JVhiNdbNy2uPXpVfWXEk5cO0P4Nkhe5sTAlhg
         GLgv0Ve6OBRJ746Exsk1vdJcFhZkJK8BzmncIDTvInoASKy2kwQZPhjP2QlschK+HyZI
         zYXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7K6q4qUpeOAcZCXWuO0Wm4GTJ9PghWQ86+NNGULXAdwZ/rANkIq25r9EZldJ7uQ0/NAlApj2l73FK+WF0qUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCMqZNc9HyHIt8DUjQcCJo0vGWGTlW0tc8yqFK3HKLtPo2hWHO
	SITj12B1eNeefhj9NukpnUMsWWFOnoAbzJ9dDv2RUt0wUaa+tGpPF7GX
X-Gm-Gg: AfdE7cmqV/Vv0N+OhRMwhHxNiiPlwBk/Mppk18Yu8CigPLaHxThEs82v22DvVW3ZB6d
	Fkb8j3o7cnoVEGIvayuaDsD785N3CA2FrrE0nl5cNxYd7GUVJAFRX5jdEFoMXD+e5F8IUdZmiCy
	Z49nnBdczRC/S5Kr5WimwYp/7qL3Bo3MfqeKfuONBVdlhbtm6NNdf2QZCSTbdsoWwHAs1JhbY4v
	0vLZwsIagrZ+hNVVBsjVZEV970Xozw4/IKGtJPD5Nb7P4mBLrJotsUbClkcwZQBah4/Zc2NGFep
	s7wyYPX+wu2u1n2MjlJgEeH2HfKA2YnBMcL46DhLz/AjmD0875z9ibphsDQLfJFz7GbTml1DDSI
	6o5VE0RTIuDBwzdyCD4/khN8JWCb3fpHRuBvOJIhx87DDF6kv+xC6Zqg7QX6v/FNSqdhmNqyL/w
	U=
X-Received: by 2002:a05:6a20:e211:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c01caacd28mr13139722637.20.1783304497212;
        Sun, 05 Jul 2026 19:21:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0a2c4sm4953589a12.19.2026.07.05.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon,  6 Jul 2026 10:20:38 +0800
Message-ID: <20260706022046.214956-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
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

