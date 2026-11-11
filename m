Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376814;
	b=IDbfH741ZYIYvmj/iCsr+HULasFbBhCRonEzsWhcwpWj+oPYrLnszr7SolxnH6k95Wlj
	 JKoh0lm7DgZzjkVlY5MQXm1eFWYbp1Y/cMntuqxJ5G5UToCeOJmCkG5dzLOFiWF8wZfGy
	 19Qxp2p4/8p5jgck75cZnDlfTrKNu9FPEJmTtXGyA2l2nGs1Azq/eA91pqNA1jq13n8Ty
	 yo+vfF9NByBPk/t+bOo3i6RCF5PqJNJYTNijJbcEMKIik5xlBkNkZel2hzyAuWIkHPTy6
	 abTpRNF3ABmdXZ1D6qEDWu0NrQaV9uzFC2HOsD3oGE8FGpkerMsxUJJT6hOp7lOjNlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376814;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
	b=g64ViSXUCu4r7ZyVwKkBBQBleK/d4UPgBaydcfZjg634wmZtU5T9nFZbh7G1IJzX0J0U
	 JxnwSllaisb4l6qe3wRyQiqGG8/gJvJ48oZDMW0wyi03YTzTiH1GXFGOmEdWbsGjWlApe
	 3ZiHbs623LQTobmuyT8B64XhX8wtLSwG//WZAACDYlI/HYJIt6GgpShCPGmyVkoEYlH/m
	 AmwC1R8+SVFxsSpEDlKi0HtLfmnB4Z4VLP3lKbsgXqF5iH8PdP/Zw9ExUmTPEDWtMZhXx
	 xFvQDr6fd5BgOynjGDSigLY6abG+dHSVefMHgjCtpPdITNYu9JgpL4m1ce2BrfQPL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1560A2624
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC1560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1205404a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376814; x=1794981614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=imWhfuRtWZJE1xkkMhvHboXbFAQOzk+7+Mfi4NalXXFN0rSh9jHyM8lZUNabnrCZ+y
         L31VclPVFo3cgPVOq3zI2RcK3vJv3YCbO/+7QVO/v3eJMUnIVh8+0nGcNBpMMS43+MaB
         KquISLeQgrQlMT9Lx2j8E3+j2XB/uz9sq2VFGcMJGHt5aSelTcVk5iKTIX27++QfREkR
         Fkcz/SHJE7Znkn2ZaAFy8+29KDzMdEW/SbaMq42wbJzya95FozWiFSU8+q6DwYPT4VYk
         xih+Xk1oNQv3cj5QPbrbKDNRWaQTeWAK5ydORUF5vjDI4KzCnfXNQw1CVIxA3X09E70L
         3fHw==
X-Forwarded-Encrypted: i=1; AL+hErGSwLJR/vFm9UXJC3y6waB+zN8D2hn9dOnGlyQbu+qu3mqZftGrI+ZLOcYI8HXkbrSsrVcICYjBmcK8Qal0f9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1eGCooeKAfIgDhvSHVxi5NAOvTlO2V8KWzMxhzCmsJL8fXkea
	QO+Po+XG78AgwQnoG6DnpsGGw+2RiaB9D4r5x4JKM6zjGH9eVQNSat5w+YmsCzQ7ioxon5Qx2HJ
	7ZwVtmgmtFGhhVkZTq1a2mLD0VtlY0pg9+YfmInRzDGQ/Ku1DBWvN3nTckyjp5RXQAWzokfi6HJ
	WtGDyZiREOn0gRDsix1gMBE1eAEoc5j3pYWYZ/gBYmNqs9uvzBF7+iSvGH8MmziQP3ebfd5koFi
	ckM1EGm1nv6gwDdZmUt
X-Gm-Gg: AYBFou18ChcwDWbRdmF9UVYGkTDWTdRgu4RCv0nrqi/DNAug4gk1Uub1x37pQxHInER
	XL/s7gVG0ei887X0vAp16url14tk1X0HrnJoBG33uDmLE6L0NGQ83UWa3izMJIb5z7zspu/vbr0
	Y3vq9FEaP67ehuzf6aY08ukXJE+Vg11FPLN4lTNQmtS5k76w996EqpnW2FKFpWlqcv99HWZRkN6
	4+JYTB6r2U862Wctobi8Cs377gLPu2D+3efgEXg3dCx7+i8pyeYQn4Lj1hoGaDpRwT4kFdiAe5l
	Utudc4rU9CKKuGjRIkBS765HM8li2rYirnUmDnBVKU5SB04Ouijb4KJQaoryR+SUMj+Ey0T8bVK
	u+CbwjU4VcgWsaUTpJdRLAGo/t61aDWM15lX0rQetTkYRMEpAwvLfruvA8VGSkUdFTGIM2Bx55r
	EcT4JrtOpNVx8PWMjW8wxHUoaqHr12i3jr
X-Received: by 2002:a17:90b:51c8:b0:3ac:aa8d:19e0 with SMTP id 98e67ed59e1d1-3b182e03460mr1573885a91.9.1794376812138;
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17de318c9sm1420698a91.2.2026.11.10.22.00.07
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so668483685a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376807; x=1794981607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=ZjFvApRIFsh5X67BEGnT6S/tCiy4gMnxOiTiBifW6Drt+KGNJIneE5/tzwMbbqtCaI
         wWn/hwbp5ViDEJsqFOytKVMZJF4tQsgDlD81YvXuiLTVio1CuU3HnOXlzvqLWikXEJ58
         EQa5SyazNYqU9R5FDBYimR48SIikcfIev0Xto=
X-Forwarded-Encrypted: i=1; AL+hErEwOFKlEuXyxQBemefHnYXb8hGuYO572ln9OkLt5JS5FfeOclL4xHPSRXFXZ74FVFvdAjC4a1j14DroYC0vYzA=@vger.kernel.org
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209721985a.30.1794376807039;
        Tue, 10 Nov 2026 22:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209716085a.30.1794376806575;
        Tue, 10 Nov 2026 22:00:06 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:05 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for VMware pseudo-PMCs
Date: Wed, 11 Nov 2026 00:59:50 -0500
Message-ID: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
VMware pseudo-PMC to the VMware emulation.

The pseudo-PMCs are part of the VMware backdoor, but only the
emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
with the backdoor disabled.  Inject #GP instead, as for any other
invalid PMC index.

Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PMCs")
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index eef2f792dc9e..ca6dfb44949f 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -759,7 +759,7 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	if (!pmu->version)
 		return 1;
 
-	if (is_vmware_backdoor_pmc(idx))
+	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(idx))
 		return kvm_pmu_rdpmc_vmware(vcpu, idx, data);
 
 	pmc = kvm_pmu_call(rdpmc_ecx_to_pmc)(vcpu, idx, &mask);
-- 
2.53.0

