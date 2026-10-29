Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305711;
	b=PoC13fHNeyqNQJMtglHx6R4Cvx2xAoSTzPa5vL9ZFMUYTbbTLoZioRnxV78eW3Ukmptu
	 q0k2sY7WFfttswgsOTJwSPLGA/kJYYNjp7uVPGmGlmHGnE0/sWIKY0XOITDmC40qwTiJS
	 bAJ2SoR5kF0JvwAHJ2htGPVV4zm0RWp7POy3wdz1OHxRvcKmx/Rc2O9hzWednMR6jEEsQ
	 ji5K4fkAWLN58nha8tWrKIjZq4c7SxyPg1wgtb+TG522wjXAIY0Qf/E51pFMYFS45vkPR
	 EDhT85qSYkFKzfIW7q0WKG45ugnwUTR+UE1GMOorO3CeKl/csHOWOnZpXIIOo4MJk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6O2eAJSUXZ4itbfWSmtZjRk1vi0Y9zhxx9kPbocHe2s=;
	b=cBSbTOtjIcdUIatId4NzvUVKl0ZO6ccSWv4QEMHlosOI0LEpQ/PQxgG2hQw7iWj7ZdeZ
	 9G7ugpFJfwjG3c+Yov/Ad5zLNv8BgedsKDR6Hgpt214Tpkn1v5q52tSw8j1yXch4QTLUl
	 jfLMX2Y07KTe+KcjUJ0vwMS8ZDlSOKMGoBuepsnhk3J9EjvvfpUa3lz5qB2k6Fp7aseeE
	 KHdjLQc+eFqemLWtwANRXxnzxItCQ+O7rdBSMxs3MQ3ghGTgbjhamWt14aWD01lCw2JNX
	 YA3bC0GvGyoqRPPGS3hwhOGo5Mk1ZRDr5ta7mnyrRNSVpKk85LSGFND7Al3SuTk14+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQsIYhm9;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95B606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D95B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQsIYhm9
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2559a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305710; x=1793910510; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6O2eAJSUXZ4itbfWSmtZjRk1vi0Y9zhxx9kPbocHe2s=;
        b=JQsIYhm9nNhmPFm3tJTbecq1sCv4VIao66kAnI89b7oKMxSQGh2O9ZDmAgaStEkKF5
         OzKm3V8EQ1/DuiMFY6XgTdRkTmg9VefYEi2c2CEMW3sCNZ+ehoVV1BBq6w3sGmClJx6z
         AAIdpB1TyuZYEjrKGaR1jg9wMAa903CEjhrhXfvo9J34NT72TIOKzKAiM1FvqfqysD5l
         /IlnWcrAH83UnHxinZ0jSyLK5aLq++Whx+ios1uCTMgXNTvwLqPi2UP2iBwXwRh6QQeL
         IvHNDNdZenB3Q+ghKGWy2y3V7j4cLYC8gDIaMeYu/QhrCcNv2urkxgzOkteBql/JNEGW
         Z0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305710; x=1793910510;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6O2eAJSUXZ4itbfWSmtZjRk1vi0Y9zhxx9kPbocHe2s=;
        b=r5xn3zYmojZGIsIrZGwqUKTb16+kwzASt4TPIw+etMt9Pr/vHKV1Z4r6gtTZKjfdSU
         EbU6IXUK/hqVfuIam5LJ1VnP7t0S011pJDnaZrVyzhqJlwoGO4Cekh0mr5oyod50sjX/
         l0q95yhoPcKMeFCNE1SVos9ETuEqENjc6RDoGPNJtrhWnjDY3IG0VKnX7iabMUvuwWys
         MSk8ldiFN4QTjCy2PfiwdioUudaU3fUfCMa8Sv338IydkNePbaTQyOVUKTbCrNvaQ3gy
         tn80ETWJDfupJMxl5VNfM8if7EzyFizhquUrsNCOb7VyGGF25CeQDPp31LlVRGn3IEcc
         yG2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFjp3lhbCcEPHpXv1fbUF/jPIHUy50n2Gj96ZlkDiRdiQt+0soiJirgssGpjF8BM2NbyZ787H4r5ej7lzfBi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP2OYtHjUS+NhCwdnmZgF7lt46buqdok+nL62nDQbu/vAfoEuC
	Mw0Fh3Wo6XXzg91QHX0PUDPTmgprwgvDdtD16Tq98oktH8+iGC6ENqXlRprT18gUwhLi83Acw0I
	CsQv2nBv+72c9Xw==
X-Received: from pjblt21.prod.google.com ([2002:a17:90b:3555:b0:3a8:74c5:5a5c])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17c1:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae8970e52fmr76939a91.10.1793305709732;
 Thu, 29 Oct 2026 13:28:29 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:14 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029202817.901145-1-jmattson@google.com>
Subject: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR on
 guest writes
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Per the AMD APM, setting VM_CR.SVMDIS while EFER.SVME is set raises a #GP.

In svm_set_vm_cr(), check whether EFER.SVME is set and the value being
written sets SVMDIS *before* modifying svm->nested.vm_cr_msr. (Host-
initiated writes are allowed to set any valid MSR_VM_CR bits.)

Fixes: 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/svm.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 136069dfcd44..3a0a507c94b2 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3015,14 +3015,24 @@ static int svm_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
 	return 1;
 }
 
-static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
+static int svm_set_vm_cr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
-	int svm_dis, chg_mask;
+	u64 data = msr->data;
+	int chg_mask;
 
 	if (data & ~SVM_VM_CR_VALID_MASK)
 		return 1;
 
+	if (msr->host_initiated) {
+		svm->nested.vm_cr_msr = data;
+		return 0;
+	}
+
+	/* check for svm_disable while efer.svme is set */
+	if ((data & SVM_VM_CR_SVM_DIS_MASK) && (vcpu->arch.efer & EFER_SVME))
+		return 1;
+
 	chg_mask = SVM_VM_CR_VALID_MASK;
 
 	if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
@@ -3031,12 +3041,6 @@ static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
 	svm->nested.vm_cr_msr &= ~chg_mask;
 	svm->nested.vm_cr_msr |= (data & chg_mask);
 
-	svm_dis = svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK;
-
-	/* check for svm_disable while efer.svme is set */
-	if (svm_dis && (vcpu->arch.efer & EFER_SVME))
-		return 1;
-
 	return 0;
 }
 
@@ -3262,7 +3266,7 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		svm->nested.hsave_msr = data & PAGE_MASK;
 		break;
 	case MSR_VM_CR:
-		return svm_set_vm_cr(vcpu, data);
+		return svm_set_vm_cr(vcpu, msr);
 	case MSR_VM_IGNNE:
 		kvm_pr_unimpl_wrmsr(vcpu, ecx, data);
 		break;
-- 
2.56.0.317.g454f8302e1-goog

