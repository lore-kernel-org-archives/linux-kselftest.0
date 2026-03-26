Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40911423160
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547415; cv=none; b=fjbNb2MiwonnM/yv9i3QzBDvn7T3CL0vn+7m/VJvJCQYqipxGOIahf4LrH4BWNlU9XRiAM8N06+YTWMff9nRUV0b2hm/6UFBeX/ga6129UxnHxIBGk43/pcREulR6X4ZbIkCccKgC4Jd+i+Z7ZJUg5ZCIxvuw17TfJmjtFGx3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547415; c=relaxed/simple;
	bh=BujWcctDq6eMuBK2P/8WUsaw3dQtOodTquIl5Xa9hFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=plQfULjAEGx+PpdhkjDwCR8I8CGkemHhWeGNHT6iW9sLGfp5BL0tuBAVy1/B6Z/eugV21lqFBEYhwEoRvPEch0t4LsoJIXwNvRCtr9jCyi+219ns3ApaXcCQ2afr1LLYkFTuLoMTigXw+U6ps364KonOpYDm79AZKLiOQJ67MmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kenaLQ/U; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kenaLQ/U"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b0be75dfd4so17070695ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547409; x=1775152209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLQEnswVcn2VF9Qdewg1FETHaeEFo8aaED/NYmj5Qz0=;
        b=kenaLQ/UIGY8iguqyNs5tNy+AcnSO/Cym/YJy2S//tVjmP7yPlOtfcmBmTm82Vq6pU
         GP5NHyVjB1W2KTzn+TBE/6a2wpHqlI4aCdaOh8WA01Ylnnjn/gQ27yKH9eo58aGzrSbM
         48KRP44gjO16xdrFFhnrhv86/47cMynrlN3TtMQBEBWzDsdFN3UBpgdQTZD1miZiTeyT
         J+zNaum7by4FLaUcpjdzJWbA1yYx1cK4jGYnCMCorPvrw3Xs7Ru9IZs67qefiOiX7OXB
         AZXrtlw6Mm0110KQIwFlRVEno8bEeSzelo0v3bnyLl6ysEJiHCpPx9WFv0/4tOhWdOhA
         IvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547409; x=1775152209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLQEnswVcn2VF9Qdewg1FETHaeEFo8aaED/NYmj5Qz0=;
        b=lAs6yI0D2XRMljLN28dmk2ZX8XL79mN+QqD3XZZYxoIbyQOH7SP/L1026yktDtGiXG
         onmEL9NZqEsrB54jLCxCNMCermXDfwD8DtQctwlT78BH4zFH8aYZp78shJqwTmZFl7UE
         aFA3Dw4OW0tPGwBE8Xds9uSlhW3JhAtgRzLcDBmGkPNfa41AiGu3mFeuu4tEUPCkWPN4
         qV+97oyCAq1wOJC0Qyq3o2M+1PIootQ9tuSZBimbtBuDLa6qyl1XnPh7Uly3q3QRC/qD
         qDerMU+1BRg++I868nY5H1HXf62RsDWTo99t1qAcy3alNqG49LfWJ0t0VKhu9geY7beN
         uL0g==
X-Forwarded-Encrypted: i=1; AJvYcCUsOpp07hMbOnS0rvO9bKdnl7KuCPMU557aEhT7wZbgZlY3rlRysKtR55lH5yuDrR8TdDOAFGcDc2RwW1Iocl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2fZ1koV1jGyFv7w8YeeRLFXtIbA5AcTJaII6hatY4zrT8c9qb
	PkoSzSB19N3/tyvx6fV2LnqBjeoeM2CRROCKPa9mGIEv0/Irua5OlCK3vtrFm9zbnhcJIbQB/M1
	zrCCeKd7e47gw9A==
X-Received: from pli5.prod.google.com ([2002:a17:902:c105:b0:2b0:495c:f3ec])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d501:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b0b1e22151mr92551175ad.2.1774547409214;
 Thu, 26 Mar 2026 10:50:09 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:24 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-7-jmattson@google.com>
Subject: [PATCH v6 06/10] KVM: x86: Remove common handling of MSR_IA32_CR_PAT
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

SVM now has completely independent handling of MSR_IA32_CR_PAT in
svm_get_msr() and svm_set_msr().

To avoid any confusion, move the logic for MSR_IA32_CR_PAT from
kvm_get_msr_common() and kvm_set_msr_common() into vmx_get_msr() and
vmx_set_msr().

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 9 ++++++---
 arch/x86/kvm/x86.c     | 9 ---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b15b4662b653..d87585a42736 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2110,6 +2110,9 @@ int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		    !(vcpu->arch.arch_capabilities & ARCH_CAP_TSX_CTRL_MSR))
 			return 1;
 		goto find_uret_msr;
+	case MSR_IA32_CR_PAT:
+		msr_info->data = vcpu->arch.pat;
+		break;
 	case MSR_IA32_UMWAIT_CONTROL:
 		if (!msr_info->host_initiated && !vmx_has_waitpkg(vmx))
 			return 1;
@@ -2432,10 +2435,10 @@ int vmx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			return 1;
 		goto find_uret_msr;
 	case MSR_IA32_CR_PAT:
-		ret = kvm_set_msr_common(vcpu, msr_info);
-		if (ret)
-			break;
+		if (!kvm_pat_valid(data))
+			return 1;
 
+		vcpu->arch.pat = data;
 		if (is_guest_mode(vcpu) &&
 		    get_vmcs12(vcpu)->vm_exit_controls & VM_EXIT_SAVE_IA32_PAT)
 			get_vmcs12(vcpu)->guest_ia32_pat = data;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0b5d48e75b65..56857da9bda6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4024,12 +4024,6 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			return 1;
 		}
 		break;
-	case MSR_IA32_CR_PAT:
-		if (!kvm_pat_valid(data))
-			return 1;
-
-		vcpu->arch.pat = data;
-		break;
 	case MTRRphysBase_MSR(0) ... MSR_MTRRfix4K_F8000:
 	case MSR_MTRRdefType:
 		return kvm_mtrr_set_msr(vcpu, msr, data);
@@ -4435,9 +4429,6 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		msr_info->data = kvm_scale_tsc(rdtsc(), ratio) + offset;
 		break;
 	}
-	case MSR_IA32_CR_PAT:
-		msr_info->data = vcpu->arch.pat;
-		break;
 	case MSR_MTRRcap:
 	case MTRRphysBase_MSR(0) ... MSR_MTRRfix4K_F8000:
 	case MSR_MTRRdefType:
-- 
2.53.0.1018.g2bb0e51243-goog

