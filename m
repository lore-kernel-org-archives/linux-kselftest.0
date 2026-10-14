Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48A4D7D21
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017777; cv=none; b=ElRRqGV/oeKsxLvp3txvJNwpAskhL6DTAWMTHr+LdNQKrBZajwqSmAoNXtpuFpsA7hB8BDTX1sOt6+Dy5BmzHnVSKQ7f7Xc6KlDOHLVZB438s9coFBmSMUaGN/O21U7fTzT9evSkRBSgDYF0yMFdqkK33c4RTZhJaHCqYs71mi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017777; c=relaxed/simple;
	bh=dE/xlHOL/EzKjQW1+4j93uKxqgbJz2Ukn+A1bhx0A/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5M9QM52mZ/xZQviPjmDb5orz0flg+isrNM/D7A6kdgpGpvREzNNgY634G1zZGx0rgYGGuwm34QV5n97s7I1quPzT6cQq03Ld2Tnj15Hl1+ekLKuyYtfEMnZaqSfkGfO21CmyZTQG8XKY+n6tFiB5Bb0mGNiVqE8JOTNxosfSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kd3EQJt7; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kd3EQJt7"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA51C3F982
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017773;
	bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kd3EQJt76omgjnklk0eBX9d+I50PilTHRJnPx7aMKSpcliLpDBgNxpTb1yX0dexVv
	 FhEc9WoH+KrarX5pbh5gPoIQDDo3ItdWcqz1G9Xv+yrnd8E2J95HHLGR9MpB6jAdFX
	 C+0Ln+/1wLaYgnW++/2/B/QrFxR5D2nPIWmPJeQUcgkY7tFjFQFkUTiq16eKueQ2+K
	 23eVFNf6h1LRMFmsGMtO8u8s/2cCN8HiAWYWB3Jq1yH+pVxAbwA8Jw044iY4PlXyaC
	 UTtyl8LDhd6EG6tsqeJBJ4u1CEnZuI74OSPS/rSGh1eZ0iI5XbbJhtIOKpVBbEO/5L
	 E8QI7e3e9AFhqm3EbZHg04oCSX4E17GPVClO/1J52AwQKRowUFcYuMPdIniCEvyrhI
	 IdZROeQweCaz6xUglXpjhhxyNOoMznyCt30y3+AuL3N5LzvvY0VneTez4ea9GZ4Ozl
	 XOcs3BaYTAo4bZ/M2BTERXLRM8mBUCT/aHM06x135lDMR0TBkcXIcnQczD7JoDZEEY
	 UasAJzFKedvT7oOw//qawOLzWfyxeDGyLijtAtBnojrnsqQu49hULsZgAz8NhCec+5
	 04FZXHtE5vmwVgCHA/0uZYatTbVwVjm1hBKNuhA/gi7xnAsRZHthqwonCl3CBoOq2h
	 lP2TjLPBh3rKBVfA7F/AwKRM=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so21653835e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017773; x=1792622573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
        b=TOQYxnOt6iE61Xilr9idJwxsi7rbjjJb4hkSRnT4KozeV35NqvNkd3PVykBKZOyjbK
         gVmJIDfCX2Jzh9LhZUCB3cghydM1VXsSXyeIViiYcu9v0xXk5XxnIPt5rNnPRL6WkewF
         16cawmB8GSz2ax5k8rsDZvzQRQ56ZqeS3KrY+1cEsONTED05RHEp7HOBVs0cLYaOii89
         mP/shf243HVFqbZYYwdkgNR4dNJk6m8aEMegqpexH4ZYfxfGWnuTOKfIV11eabXcEM7T
         aHe+j+UWAUB8Furi5hQ+JPE0maDNBCXxKOx3JK9UWGrM0zf4sEOANe7sc5e4tA0ZetLF
         uCHA==
X-Forwarded-Encrypted: i=1; AKwUvBwhZsjpyz/Tib3bORKsLGatZzG4p0GNLv8JPLIBD2cESe2aU9HbJc6s4X4NX9yjfj8lSOsVQjJu+GTRw2CHJUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAfDcmm+ithx77FelLxa2FqYb6oeKYe/mJk7vMpLqdhrHKaFR9
	XOz3YA+nv3lq+1kODE5bn0QTdWLysa5DSiErER1rpCRDbrkN8r5hJzCyZ2KgdjwwZEkaHNop449
	LNPW8ADNyQF2rtLCmXkkuQFtlQoL0PWK44tQ79QXUlrf+66Ob1JmxCInU7ld/Tn+ot1dwqmkQDp
	7TiArObtudCQ==
X-Gm-Gg: AYBFou1RD+oHR7APLm/5ztpmq5ue1sPr/ZLpbCYUdm0U8FmBBLpH7YJlMauQiLwG0sF
	NWxlWl7hVoxpLa3LRY0timev6IuuDttx2qvE+Qa1Ug3Y3deZu7u5fcEonepWD49GuBgLEU/UKOG
	gelv9UVEgjc4tyFMMbk6+Mg0GKZoUIYdL+1jQYQRKP0wQO8EpkOJ66FeVLPd5wRU8u8DtHLmDPh
	3QN6jK2GtA/xH6QB5pAwuUpukJ/i2kHqzxtwn96YDOXXy+NEqVumlN0ZVEQsGAIMX5Asa1ujBia
	bZhRez2In2mqGSzKoAdxuR3raF1DP8sW8Ih8ML/UGE+2BJNlivQKybZjeaA6ZnSJcJKl+Q8TJBc
	jG+IE9KhkPl9q9O2QFJSQhqUPDPPdS1EsA0NOsn1brTQ2i/nPlB8F9vWZ
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653725e9.27.1792017773455;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653445e9.27.1792017773163;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:52 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:38 +0200
Message-ID: <20261014224239.963635-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/isa.c              | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 20d9959ca44fc..39b0f3f1d4863 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -206,6 +206,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_ZICFILP,
 	KVM_RISCV_ISA_EXT_ZICFISS,
+	KVM_RISCV_ISA_EXT_ZICCLSM,
+	KVM_RISCV_ISA_EXT_ZICCAMOA,
+	KVM_RISCV_ISA_EXT_ZICCIF,
+	KVM_RISCV_ISA_EXT_ZA64RS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..72e3dc15d2947 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -38,6 +38,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(SVVPTC),
+	KVM_ISA_EXT_ARR(ZA64RS),
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
@@ -64,6 +65,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
+	KVM_ISA_EXT_ARR(ZICCAMOA),
+	KVM_ISA_EXT_ARR(ZICCIF),
+	KVM_ISA_EXT_ARR(ZICCLSM),
 	KVM_ISA_EXT_ARR(ZICCRSE),
 	KVM_ISA_EXT_ARR(ZICFILP),
 	KVM_ISA_EXT_ARR(ZICFISS),
@@ -183,6 +187,7 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
@@ -206,6 +211,9 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_RISCV_ISA_EXT_ZICBOP:
+	case KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
-- 
2.55.0

