Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9536EAA2
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819893; cv=none; b=hb0/Rxf5NtQGyvOA577tMsrBn0cC01V+6ARy/wKX0RbncHKkMvNEGiCUpjbmKI/jbJFQnPLRdforJ7+QBn1WW1+umXFO3pWN1leps2E6BGLh26EWZG/NVQLf8zlqP6jwbkPRf6loHlm9kZySVGjCL+RjpJ2daBw8pG5G33p99U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819893; c=relaxed/simple;
	bh=+RF00IvlqUOsY8oumH/FNmij3zs1esuF6e8Zla+pq3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lz1i2VEtBN7xGoocxco1NcNQAkCnCFzTv4lsxu/8cwPD9pOSkrSJ5OxbP7cwKspId5yhGw2HCF2LZ9IS5Pvn4GCb6up8fuh9YwOUuwBkCiplwRtaKE4Dbi1srRjWbYN1l0wU5t7e2j8s+gb9W9f2qpOpsfKdJY3mMT2HK1e1eOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klAfGipw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klAfGipw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c859a374903so1097336a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819891; x=1781424691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=klAfGipw1gco5YkxELYsbsXO1ZvlApD4H+lnrqXgpZtrjSABklqVD1klPtSong89ys
         AQ1xIAVMEAu0TKIqT8eAtcSgMp1QteTCgwzCsIhG9McBz7+0l3F2HXOjDFKe/n5AQmkF
         qZiSKHbxDWRkGh8jklZawAyQ4ifr7vealC7Uu4kjfArA38i9CATtuej+SVRhNHcLeY6d
         efJsMfdAihDsxu9MbOPrvspHg1eeWv/DmKurlIUXsrhZdNEb8EtBZQlj7Wmcp3wbe9+o
         vkUknBUCC4zfGf625PpwK39SYjSKWwG6XMcZJgyAyhaibcVvt3ncEBa7z3sE+jLymd76
         /nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819891; x=1781424691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=OEl1X4MkKf4erclwny94bqH/kO8zf/TpCLIRjJOxufjl73qyVcKS1n2No88Os0R990
         YpWRLDtj1R68VksykenhsjVR5UyG5beFEWoW2J3qSIPXtb9S9ddghHMI6paNyg4mAOG0
         U4DxuC771Guf4vUL+JIrmUWX8Y1gN9cnaDwuAoaAGBK/UWzLk/qKWngZBF8CUax7fYXB
         tR1FdrxytSnmF/jUShHnSdltB4CTd/vmSWfl9WJAkXwbCMGBer7H9gXap4Hdz8JeBCbx
         Flt7ddMQwWd6mhQ10rnUh9a6GbMqGVeV1eiJZdvj52+dYo2XzbjSBWAjaaeanUOhsbuH
         H8fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wwfLjps7+Q2njYg7W49uxrPXcVZ//TrLNur9ynwHmadt2ATc6IZQR4+4kH1tuTDO2CMu33ml+Ca05Lc2SIfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVFyymRUAkj2jDhnCLxcH7JegcqeuValMCZvupM6ZuQbJtRMT
	BI01SHZyvzui7fjaTZGeBUfScUxrmw3LpFpC9AnO55lV5YT1RJZYq0Dv
X-Gm-Gg: Acq92OHabuRjyaajUHv+vN1OsIeU/fXI60kwaaL96aRx7UP0ZkQcEVrQMhMLh6EijAb
	IteJcNcXWBuVaGRzz2C/IHnqnK63AlxKLDmsz058skSfX5QXC3UxWDr0IwgGFddRceMXoaYl0+G
	EaMzV9s8dIjROPAnuHPIwU3N/Gw7dqA6cRO8VeXfLd/20A5lXdhrXh+y+AkMcxBCP3EQ+7PxSP/
	l6n6Nmqs+BmpqHmgsz6wd1rlTKHbd0ECrf9wLH8w5/amTIWhtjF5cztoOANuYvoYSXRbJPI5zU9
	1NxlfXmXGHWBwcJF5QSJvGcGkp1hz3ljUv0ZncEvc+5bIqOW8hQaxnpgYEP6nzi9hdwfmFs+nzL
	hfR8bSgXAHX1bppN9NmgjCY7Oy0fMlQvZLNF2+Y+Mr4TviTfpX5ilUZQ/Gt8ylJPgCNgKW3EK6p
	tpZyJyeaU5GciwcK7+jm0b846F11p2lTwGgg==
X-Received: by 2002:a05:6300:6705:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3b4cd091c0amr13541485637.43.1780819891551;
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm11930677a12.9.2026.06.07.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Sun,  7 Jun 2026 16:11:02 +0800
Message-ID: <20260607081105.993908-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
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
 arch/riscv/kvm/vcpu_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..61305da5256d 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,12 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.54.0

