Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F62253A1
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904649; cv=none; b=JEZdQIfBZXx8fyO8tpL4q7iGlyCWsBuipeKudMZWxRs2ize3XnpUeiKu+UIlzxlUWxA6YDGeNqmCcgvppzZXscr+FbSKO18IF4aUaAdBbnlYFMv3RKbIOAEln+3kNc9SYLBW5TybUYSq9jl1RQmWZsDJD0U1gtkPTu5xbL1fZxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904649; c=relaxed/simple;
	bh=gGfxTLPCEXSgUtK5WaUX5O/nHFlYsALwKDZ9s87hSwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnGRQdk8Rwt2nI4vONbRDZIkBM7/A63/yAn4U3Gc66uttscz7B3dwDdCQmFZY8BGHGgvhQxTkZC/a2+V7sBRJ94AebS9zYyz6C/tm4ZIOkVrjeFGkCAKWJV7rIEdzCxZSNBqs2R6unw6cUcE4js55x9hlvm/VS+vy55jZFtsq8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioPxYieg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioPxYieg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso29714325ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904645; x=1784509445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=ioPxYiegLCzGWvc7cISXavHNafqRKoVM42PpoNlqovOQhbQjvb4IdApuocZPxfeSHO
         VL/7I8bjyKZhf+yTWZYHnz4XVyO+j2BasF3jPeYuYHhW7o1Gnw/OQDx1+gqspQLcxdoV
         eQ6OQPs+OfFWnxlKoAOSsmjRmNYLMcWGDP36y+Y//EW63gFXIU10rTyD7nQkFLxkPr2i
         tqqV1RgMqfYGMoa997lcL38RkNwndFrmM3d7CJd70diWlrtDUow/zIAvPSyMiTYmnYKY
         0NhHdW74JBmyWSqf36qF9+WzFNE2UKReOshay/Y+83SXVWng/c1wDcn4CCgDbJYaZO3B
         S50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904645; x=1784509445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=dmH9sk93kfORqw8jX1psFey0bNMee0QsgIJ5bClrFudyGxbXGC8Nx9ZoM68oA2aIdp
         Q1CbxRy/DhSKlpqzYm76zRKMAYIec0jtCdSfoSJfEmGgWpioXicBkBdZ/YllJr91uTC6
         byH5+o0izpR7daQ1G0wVXcwoVl/VhTr4ZH9IkcVKkGUssNq7d2fGunNoUcP0PCO8R8Sz
         lx4WdJAdFymYw1voEm2uMMdXPP9T4JP26a/6FjzfhO43zbKyNx6Ru2ljBII8zRKbT0vC
         suZE1JlZWt/d/uh6BfOjcbLccguUlxpDZSxuGs1HMXBQG1xDwmLUOX1ysKRFG0e8jeRw
         GK0g==
X-Forwarded-Encrypted: i=1; AHgh+Rq8ZA0RHMuKWcw1y67iXqv+6oZAiJp3u/ml6Bt90qthWlYfU5Rx4u0TMPxgABo+XVubt6SwtVbdxqaWBQvrEJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzWbHYodfdNJYd7qkJPGV2h7guHpLg4q4a1UMQShiAwtv/cg0
	w+Jbxp8nswNOLKSy54pcg4cTApXiLCPF6qNuF+3/kCgb87KBk6Ed63kn
X-Gm-Gg: AfdE7cl/aod0P3ZwWyVfPXVAPQ399zAFiavkEA5RTWDpayaX5BEzksSCnNQLffOa41t
	tN7hayosj5ngx0VBlW/bXtiIA/3jHvZ9s+qZTeIAOLz09LlZXPfzKO1hMtCyebDkg/PqDv1hSuK
	HYd+Pczopay7/M3BbhSP8ED59flUHnrC+ECd9U4h6Io7ZEOFjkn2+s3fwQcLk8n+v5maIDMrAXH
	x4XWoj2hjVk2RFfcRvoRahaTutTQd7cAiSa++IiDYZEj/PcRfdvzhpefFfdspvT2tSo6jrZRar+
	nKA7nfB4WDepVuY6aBDggwN8yt60C3QGBtc1I/MqB9vImGob2PuDJ6VOhgDX0x4tE67fgh3zyTL
	4nLwfdFkluDT8imunbm5JI9kPyktEIUbzvImguuluAiw2hsQ9pGKZq2ftyzGkMFUdJCrOW0v2nI
	BCH7wNEs1mOuE=
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr69731695ad.45.1783904645152;
        Sun, 12 Jul 2026 18:04:05 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm91755405ad.39.2026.07.12.18.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:04 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon, 13 Jul 2026 09:02:59 +0800
Message-ID: <20260713010302.303278-7-inochiama@gmail.com>
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..92a3ea7c7ffb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,13 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+		vcpu->arch.guest_context.sstatus &= ~SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.55.0

