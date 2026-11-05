Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922478;
	b=zwtbk0kyxiOddHZN0kaC1UZtv1kWcDpZF2OQgb7v4dP3niJHfWBkJupMMmI/HCIGBYsU
	 BmB4NeFRMo6l7cmj6cPJ7RPQUxD74eUNSf68GXwbuKcDo/uCPEoJ3lELRXc889NHPsSyX
	 8J/08AaU4cO+TS+CF3h+Ps76M4UxJ/rA5Fzi3oAs0WhblYQaZit7VOZbgH+L5Q6PD8TP4
	 gCNQPaJ6Nqc7m/wcJrkqOuK5R/nvt8weLSOOoBoXRtb1mZtIUIyKuFNZk3JXcy9R9GgpD
	 YGR02q5+nTqFwqhZ0+OyjFh6lBkL3lADOLVahm6mPDi4e2jEqj1q7cTDAcS412uMgQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
	b=mfmpMUBsH+sG2ORQ/FEsMeXKe03zeKL1xghEtg/bye7nRagmM2PbiInw5kNFxnOg/JWN
	 pllipCXGVVzYWAtK1gGsi4QO0vRb0rDEEURw4kOdtfYBcI+n4QrRaLTH3Dsj5RAhkP92i
	 ramHX6QVwoIXtywkiOqf+eWFCn3I3VEsfdeiXj257vWKTIB2nKTNYm5BEmZA+YRUr1V+d
	 FH8YAVrdUskybHN8UUdarLDFWu9izwQJn5DD1aUtk3tbtn8yO4koiy/nQOc+/zj5WK2Jd
	 ihe1RVKn/ByrEyjBVGTwIOTqDR+iN+lgnFIn0XD9q1FYVHBaUeV5UK0ole+TOTpJPpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="I8Ib/Wky";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43715608361E
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43715608361E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I8Ib/Wky
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05900df7so688445ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922478; x=1794527278; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=I8Ib/WkyfgcAU2VdIaoBU4qUeZBEglKmk+X5n8rQP3GxoDsCKUkOuUaZe1R09RnUPP
         mbxMxw8EhegROGAA7S1O+pDUbzl9y8upL5sZCF+LikEBSmMRpBinwdJp14GVI+PU0N13
         c1Ao12g2ckrJ7WZ1VMNhk3G4fs7x79mCDOdESF8BqTtnx6CRhl5FIC75ui9zEcU4bI43
         hcZd15GOd9UnC+JMk3xI3UoJMOwebUUWAw9J33GaOrg9jcXfM3j9464npUxj8woLqF9U
         MmdYZHj3Od5owtooe7Wqt41M4Xg1RRPh0yjaZM8DfYLWU/5Xcu3jccCgeXg37XtB+58I
         G2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922478; x=1794527278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=2ydCgo4+yAybiHaiIl3R/iov3G2qe2PUGsWyyyH1Pa0sFVWNddvjQpm3PD4nMApXUm
         PikTM97oe3wCy50lowJdpt4chxNr8RVScZdqlITmqPat/N8a/d5XZ62mtZrD+CUcYANm
         EdX0ivAtNR7PHY4Ic8ko/nGVuVGhiABT8bxLDSAG5iwDrBBl9RgIBltOe78elfdD0kjv
         LwXf5IMsNUB/qN6aROkNmFh1iT13BfFKrA/azDBMoQMveGuL3MC/OS7cp/kIq0k4jBZv
         JSkcwMKjkOtjZvlD46IWR23mjp3GL1c0SaiX8toOFLweiAM+zZGQUQ98G9soPGq0rsQc
         XaJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf5zyHx+iPe7YYuEnX7C+D+Eout4QUtyniYXdOfoOB+uGEIfZ6YF97IdKsFXYHe8+8apNNPkT3zPWmSrFQSUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eEAJlnXAOdjSKPQRLrl2efSVCvdmESvK9n2P0rh8HaLytP949
	PHuSa567vcwqsDPoY+AK7/cRghb6Mpy2r3OXqj4o5bpGtREnsllV0FRY36N16FI/dc0SQczvZGh
	hoAj41w==
X-Received: from plic13.prod.google.com ([2002:a17:903:370d:b0:2eb:153c:2391])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:2ec:ed58:2062
 with SMTP id d9443c01a7336-2ed4197e542mr11947205ad.35.1793922477243; Thu, 05
 Nov 2026 15:47:57 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:00 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1655;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=eAuK6mynjXU4g9scBsf8osxDUNluz16TtjfwP534Mqw=; b=fuDGD8mFk2kezyisI0w6vD9nLF5EHCz8DYL5IKWXrWQlJD+wmgeWQ+Y1ZGY0oFpDoZ71oILr3
 SeqLs8WgWFBAZOWuMvl9z1pOG4vWv/UANcVEKdCrJXru2JQpc/g3Wzv
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
Subject: [PATCH v16 16/20] KVM: selftests: Load private memory and finalize
 TDX VM in kvm_arch_vm_finalize_vcpus()
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Initialize TDX private memory and finalize the TDX VM after VM and VCPU
creation.

Hook tdx_load_private_memory() and tdx_vm_finalize() into
kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
manually load initial private memory and finalize the VM. While this
prevents TDX selftests that use vm_create() helpers from customizing
memory before it is locked, no current selftests require this.

In TDX, finalization is a mandatory step to make the TD runnable. It
also finalizes the MRTD of the VM's initial memory and state, locking
them in for future attestation and preventing any further modifications.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 11db6a3b0366..ee8a1715d844 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm)) {
+		tdx_load_private_memory(vm);
+		tdx_vm_finalize(vm);
+	}
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.56.0.455.g6c5a503b38-goog

