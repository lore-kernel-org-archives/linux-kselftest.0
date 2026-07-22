Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90347043A
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762080; cv=none; b=EX5RdE16FMvksF/HDaVIEk82W4czybpqknnABAuZnTpz0SmeZ+QOT/E+ZFvjWqmt5o9fTN39kekYaHbOAhV+sM+R8hVdkw3xAGlYqmUoWCjQ4IfuUbKw5fDKHX0lmHm2HgghrKWmkIvw7vI2WTTyT5UEUBnnueg72WWqoOg2XCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762080; c=relaxed/simple;
	bh=uLTnwqcKeWPbvmmCIr/K2/dvE3UjNBQWRlFbYisxcX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oWfo7TvZLjVk+Qh2oH/gv/k0aI+bB0+OR6bQcuYIMS1+tRXvFUTbAG+RP4jMYjjnstEl2JAR0MrpykHOIh23JB03k4FvC1zijbSeKbzBMKWhbxeJyapdrve7FmswuN6xjJZZ4qp7Gg3Wr+7tyO3dQsUFDF8rWoSm7X4pE9LwOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a+PdaBEc; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+PdaBEc"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1979a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762077; x=1785366877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTOm8OHTnD3CNXmOQdLQqFIFqpZnnwkDQGUQ6GB1D8M=;
        b=a+PdaBEcnFal/iLeTnnu/bzu5Lm4oLYFqwX67lc6o4cmOOd+qt7MaqNDn4u4rT2nen
         0U7bWX06f7l+xgZQOJgm4AcS+2RODZPPiVlji6rCc5IlsDqHRErp8rmogjdrNl4iolzL
         cOF8GfPZ17KJo59GQOfC9bHbNKyL8WnGWd9pdLGQ/CnvB/6QwRgmVP9TE/vOo+HdNYfr
         q7mILyjF47SfBxZbzaVLQpfxrTHH/22x/uONF8pIw264pYNaEi99qeeU+QnmXPUaph78
         RF3cl3G9MOHP+bZZc8kiuoUGsmbGPYY7vKuhOHIhTdNExhw1j04ndJmxgtYWNTi2P1zA
         eSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762077; x=1785366877;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTOm8OHTnD3CNXmOQdLQqFIFqpZnnwkDQGUQ6GB1D8M=;
        b=ejm7ltnKXaN3ch3+mOleuMyRye+vHwI/AQTCaB9cRHstSWKqexo6sRXbnLDH8CZ56B
         xeiXXZxR9dbU4x46ol+Uf+Wxr63ygVhHyN/300zJu+oXBDx+D0Qd0jUU47+imw3mwBtY
         Yp/UIvnDLGTSA6UN0xQKWxFldjwv8n/fZv7dBqbRFVbUWorAjCEfVY375n500Qgi5HOR
         lTC0LNzGZIEx9MRZypj2YHwEwt1t+XM+XwGJ8rf9NrXo/iyNpFoom5uF0QQTePZGDMdy
         +TC+cx8QP/1Srii3ETknDSCag6c/lY2sFZ32UL1TrJyCFjOPv0w6O5kC2CZlAqin8494
         eYDA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu88S30JZPTry/vKkoWRGfFOUbKne4wilK55q31BkGsUxDfP6MtxVDvM2XTDI3A0r/r6sWS8GahX2uyUCyAHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaFdDW6xBEt3CiWClVSzba9F/h8wOr2L+ux6crSsIzNBPT+J9
	gbmQy+hqe4m7uv7emSwKn0NaDbsPvDVIfwjbtUg4LYqbCS9hvT2h4PDXVRK0LwKAMcFjGmE5SSL
	4blk6DA==
X-Received: from pgge1.prod.google.com ([2002:a63:db01:0:b0:c99:aff5:7085])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:17a2:b0:3bf:ee42:192
 with SMTP id adf61e73a8af0-3c44c95687fmr237545637.6.1784762076814; Wed, 22
 Jul 2026 16:14:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:24 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=924;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=yyC4ok9Gt079Udujw0BAUtyTS1qt2jUAvdMSgkP9oBs=; b=YeT84Sa2s65ilrpiII4nei9gR+v8wtHB4zZkk41ORFiKELmdh1JFZMwUT8mna4O7S+2CS2dqi
 KxXOEWTWIPxAuemKnyLgH0/dUr1jhw1cs/O7LBZKHeibqJp7k9kfEac
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-19-15ad654a50db@google.com>
Subject: [PATCH v14 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Finalize TDX VM after creation to make it runnable.

Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 4b97a9a1bb5e..8319ae3d9fe6 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1489,6 +1489,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm))
+		tdx_vm_finalize(vm);
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.55.0.229.g6434b31f56-goog

