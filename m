Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649737E302
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 02:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304510; cv=none; b=kfZPzSXEDY1+AZV4ba3pKPeMNo/6Rm3rOsWPNw2P0N5ezCkn7FkCPZ2iCfdZU5wiqDVZuz8Wcue1lJ2xK09HbHLbP1dn9gGidKMmzkptQbtJNTYRJPnmKbGZKcLLJyKQvRXdk8BX81WPtFltHRU57KmDyTTu4841ZARmTNpWtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304510; c=relaxed/simple;
	bh=gGfxTLPCEXSgUtK5WaUX5O/nHFlYsALwKDZ9s87hSwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXwQNyzc6sQBx57LF+VfpfhInWlG3DtveOap+Toa667RwWzizqO9l/MQHLk30ga0HunWbPeGuHTmz/Djybz/84j/m9cy4iOKOhBx//wY+daYcjeHX4cEYak/I2DR/dqWuFoe+am/1qCwqToJrWCcnc5JBSwTtMaUjMOcZTMF6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YECXW1XP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YECXW1XP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1732901a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304507; x=1783909307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=YECXW1XPT0pPjaFaByTY2xjcMd7jbAYEdyTdxo1NuZBumsNa3RODaiueyR1G2t/rOt
         dUukDV/AG6sOOfTMRiUk/aRHySguDmh2hci082z7ItqPr5cJdcxP3mfMDOnWkbWy5iQv
         OeWhAGMJbmKzOIbhryiwrBgEF2GyUb8XUHnEF+NSNZE6UdN+0ySf7Z0h3UcJ28wmYh/c
         RfJXPT9tD2e/IXi5iu9btTJVkSJFDfHMkTIM/Dsk9x/pacBCGXXs590cN9qMjKoW8E+7
         EYhMbBXDmXvMA0adxENsjlKgdUqzaDVKxIfrYcN1BgeQg4iezhD2djnzekHXwGt79kEw
         UEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304507; x=1783909307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=Q621EwJVAGPxWrd5iTF4lQ+CrnyZIor/0/GBOSlnpSj2OOVaSzg/B8uM5MqsIgZ4Uf
         g8F0CSHzqrtkYf8P8n8uZVeNeRmH1Wv8T/N7mMY7ZGy+6y1fna3uKqG+gPiiDHVRyxnk
         ay/eECABdxTvxSzTuFqNd1n0YQXZd54n3gYKtVm9+Qp09kPYuOlR11dc5HgIY0BYN7xp
         grU7OYL6sf/lpSyFIjG2dZkwtjeaW5eCoC//eQ2rFQ2AmaI/wb3fFy9rVvg1B+uHxbId
         e6ue3osQ6wlKMP+twYh4IhiI0aUI1tpx5UVZi+tsRP+NxUR9Wd2cHipJWYJxArgPTYB+
         Eh4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/yzrXjBO0j4Amgtfbt80G3TeIVONuKJYdIy5b1GRfjOnRsZuN0jV2lRCApbAOIFUtlnq0oV9BTJj9um1PyqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyvL9NTrSHX4dN/YEgo6VuCiFYz3ZfA8Sfkc4od+/zfI35Sfx
	xrnPF5cZIV3DeDsGfPpDcfQBvP0/qTjXCoQaKvH1VqeEKNlTolu86Gj/
X-Gm-Gg: AfdE7cliQDRNcYQX44bxuF/8EQL1jw+b7ydZAIkZREPuYgyByFjGPGQMQIoQldNGfLm
	3WxnS8K9KISpbVqs1Ryvb/C/5lfZs3EAP4Yt9BFx4bs62nnTyXRMHmPNBV113h9j/q8vJb1JvS9
	BzTi7L73IWBWj6a3jG9A2elAqMbWiQJoPGyT0MEsC6wUW1d1qcMVgscx+yp8gJdn05kYv7woOHK
	21EPHvDYOIkpzA6Bi4Y2qZ3TZ57IQ18ThIFTNFNAtFg9Gu6MqB0q884+zK8rNj7o+EaqN5km9Yd
	BNLQBUC9pdPCgGfRQzxqeqX49GxN8XFBYZT51wswt9lEbsXEmkAPo9bIJFuPrd4+qNcthENw+hy
	aBuHRaJDQHVRi3ReEf0mvslq4bf5eRYFsbkEeAQlnKIPuiGE1QfZA5NuCqUTUl1GT
X-Received: by 2002:a17:90b:288c:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-3829f00021fmr7476641a91.23.1783304506913;
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3854f03f92dsm1348394a91.6.2026.07.05.19.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon,  6 Jul 2026 10:20:42 +0800
Message-ID: <20260706022046.214956-7-inochiama@gmail.com>
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

