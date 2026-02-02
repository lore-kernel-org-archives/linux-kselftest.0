Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD2E358D16
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071430; cv=none; b=NBKAdQKLpPRqDEbmZd2B4SsJeUAePLo9gg0tBN4Jc+9N9Rkv61BTwYDLwUECTwAjM2qi5RuY9ggTIOw9XLuixVhHJ+oHnZHnyRa1WQ8FikJeWK9svI8I2vVV7bqrJDOslBhl8maVLwCaYTBtcLbkpDlKOkeI/wo6CsJ6nQsc0Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071430; c=relaxed/simple;
	bh=WorvCjpgns2C+Ce5/F3Rb80WYbvrDTVDudVlO0Kxxhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YjO+nkELyWyUIPNBFbLeMi5yXjMg0Xzol49Lf5yDrby9ictyAAmVQaoFQ71zX4jxK1WBN28qNWN9xMkMkPseCzOInlgtOJLKhzbjHXEc9qHm6ub36BkyuRPBaLItQD3qWi0gmutFMdakSFW3szpuLf2+pXrgpLUyLn0TToyxDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DY7MTWU6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DY7MTWU6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a8f8c81d02so22529095ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071428; x=1770676228; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XrHR5u0tXK8+IxgO/pbPsCcUw6Jina1DaW7jGvD7ugE=;
        b=DY7MTWU6XVikzfxbgksUGTVt/YBXTiG/1xqy3Ne/CAvUkTNoR3lTL3yu3g7zxq+q/+
         cogpxJLMhcE2Q65gpobBA7kMa3xBn/nFQjAwTUOnO32Dg11JSHO6ctq9284KKGxJ0AMC
         EG0pc1obKaSm55Cuyxl4eags+tmvsZWq2swL59sKS8F4TJuQUVetltVkp30uVgvP3p5C
         QGIcp2HjTT9VbS6eoOFpJPMDR4lfQCgGoJNK2TvuQjyzndaNb5driggYUQPHAxakID1o
         Y58BZNz/fhOnmMae4F3i6A0kVlMDiaGAZvIlO9712Xdtl8bH00XzNnKVhlf0RyrgmmXM
         SZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071428; x=1770676228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrHR5u0tXK8+IxgO/pbPsCcUw6Jina1DaW7jGvD7ugE=;
        b=nirgZVibRTx9/Msj28M12jSYksnmXq2ZgAdFXtd/C+3/SHd8EbvtnJyNFpFwiXs/M7
         iFN1fOJxUo1QlmuMqChWqpKWKNp+XF49v30wdUJNINyAqsyTjJfldSA+fXPB71UAkq2T
         s3WGbjU6BvHjKCW65KorM/VuGMQbyTF/y5O6TltaYxLuRnYuqag2M3fILjOA7uEJUZaU
         GGzfEvngunrv/KjW6vxC2T9vHJxA6AYT6szVG597JRL++ybU4XAjmfpEFDipYP5mH8h8
         UFOUYAhdgR8zYU1M4TYYyPVZerFclp+tGRPfLyMvXKifrMPoXXIX3zc07fxvI8pwFNXL
         +YCg==
X-Forwarded-Encrypted: i=1; AJvYcCW9C9Ty0rffZBm41butsLd7RduT/kCwUrvVFVqmqRHbh/NvHL7ENw8hN7FQCrW+M80m6tJuC6hQuHIFcthIALk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz976TtkQdIWKB5qUFXubxdiGSii37JK3aczGJ5lX7+HHOrRuU5
	om3WfINQbkO+k9K0QblCBiyjQqg8yTSglg04CzfPV5dmDSxELFG9epjMaskpH97usWXJUz9hpD6
	fX99pkQf0qjJxZDLRNkmSjsSx8g==
X-Received: from pjon10.prod.google.com ([2002:a17:90a:928a:b0:34c:dd6d:b10e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1dc1:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-3543b3d4a49mr10688959a91.21.1770071427601;
 Mon, 02 Feb 2026 14:30:27 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:41 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <490841ae4dac3292d74f2250867f90cd5d16b29f.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 03/37] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
on kvm_arch_has_private_mem being #defined in anticipation of decoupling
kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
guest_memfd support for memory attributes will be unconditional to avoid
yet more macros (all architectures that support guest_memfd are expected to
use per-gmem attributes at some point), at which point enumerating support
KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
supported _somewhere_ would result in KVM over-reporting support on arm64.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 66a5e05bb5b7..af2fcfff7692 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -721,7 +721,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
-#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
+#ifndef kvm_arch_has_private_mem
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 11c34311b0ac..26e0d532ba03 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2444,8 +2444,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
+#ifdef kvm_arch_has_private_mem
 	if (!kvm || kvm_arch_has_private_mem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
+#endif
 
 	return 0;
 }
-- 
2.53.0.rc1.225.gd81095ad13-goog

