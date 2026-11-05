Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922474;
	b=n44xdb3PXdvzYie3bHgJ4dN1RbRXZMu3F6h8WDlq3jJHBrXVtgOJviBffUmPyfG4F+0e
	 C3E4A53HnRCf9G7wDvaFsBMrVxhtzlDohBBmaKC6+toufmh1aMDrm3PKOkm3ATq24RoIM
	 0j+tDG3V7baENF9yB+37fr+1ShdGhyKDUcqkLRUIPI7mi2gSqs4dSO1rsrIR0jL/EPBnK
	 q7rZk0mJlHchFCenWH0DoYmjWgq3JXe9b7NbAhzFR8qyWrEHCYo7DkewFdm5SExwMd9vs
	 jhmYDwLNBPPDDjg9krin5hI7n/Hm+9eTRHGKdRlofvQo0KdsRyNdujB2jwxMtg3WsvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
	b=v6ZDvn8993YOmmGkKA1aBWN4W8SbXmdwmkwttdEpALlA8SYH+3B/Z4FiuLdZqaaLskUA
	 lIYOl2YpsVfdAWHk2xwSr9qs/u/AcXvyzPLZG6YwMCmrarpP9bi2FGFwUk26KI7QpqEuj
	 UwBIBPH34Wnac6BQQgFZIh4NYgKHPxXenPDjkS/ry+LxwmvUYOXBUzskLgWo2GCDVbZFY
	 x+gJ7xsluBldr60Oeppk3eHJduyhU8Fn3zX0hkV7qU9ABY4qzIWg08yetmgtQjRcuwTfs
	 1Euic2IUFRlBqgju396GDBumATukkd4Qnbq4Gaxt5yVxcHHMbr+17DTtrKGGvkIg/AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jdyCTleF;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE8606D802
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDE8606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jdyCTleF
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94f72fb9fso660275ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922473; x=1794527273; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=jdyCTleFJ52YC8LhOiBH0Xc86Hpz9qecrO0B90ZJZcMuhY/32u8aD3QgSyO+awNh+e
         eF7BVxEtkw57qwTGglicwXP8w8j9jWsYTWtUP2F61sHw0R5daU97l3212AOS8utRYHL9
         uw5GbehMKN9tbjzN0o1TkdL+Uj4+aDcwKQCaVnXG5IxWMNVLeRk9WwvB9h6mEAef6Xl7
         CCtnxYJaJvZGrCpEXY1z+QjqLuUWOjp6D7wGB0fxhasQ7e5DSiLytBEI82gJGoh6uaDC
         9BOx0LM83OHmTQgp4SnAUmEhHTVPw9GwjWa80wFUIJn8qXFjZazqJwn+8MjVVwW+SQSZ
         pY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922473; x=1794527273;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=UHquKVVTSKvLV4pCZCDuQceu1+GBpTL4l5aNucdA1N1G20bqhQqjLSbpbVFYSX1B17
         nwhsAUiH5RqcMn1u840zzS40DtJcnVAEpiGnnKn2DmHRyjaNUgldODubqpEFIPizbNSn
         tN0xPbJoT3i2uCIPMKbof7lqEhHx8ZTTTTNvC+SbnJK2eivftgZeEc0KB5e32MCTNlzp
         IhqLamWNo5aRrbLf8oa933rQt//Jzw0EyloNjfEc/j8KuiL651y2vUN4cBUZdBeESubf
         ecDzXZ9sU73gqe6JCBCBG7J9Z337kzKnikVTYirqAfHpWJ9K1f+mzDJH3fA8155RR3Ml
         PWaw==
X-Forwarded-Encrypted: i=1; AKwUvBzWdKYMS7iUoMF749IfvjZkoa7SK89M/sE+DSOlirNc25Lwxq+jR7KcchVE3eXyArSnHEbMGUGd+qN0pRO80fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SUrT/rd/RyYhe+ccTIhmIfOZcaX1O8p3RhNmUlrbod+N6zvqv
	1ca5BuTYDECXKUU0TlIPA/i3XOboSdl2vxAuokFEAh5Q8oPkaSHxoHzPKDb/8M8UvuLkpM/mjcd
	bQrCqcQ==
X-Received: from plnu5.prod.google.com ([2002:a17:903:1a45:b0:2e1:326b:da73])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ced0:b0:2e9:6645:e99e
 with SMTP id d9443c01a7336-2ed40c48331mr10886805ad.28.1793922463383; Thu, 05
 Nov 2026 15:47:43 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:55 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=858;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=d6A7oZjd0INte2bacSdXjbStFoBPPx7rvs9xlbLb3u0=; b=9jtIvl+Z+cMjsx274/HuhhAQ0MpGSG0pXW90v5FO8GZuKjRtHljxjeF11lqZ99IZQl8XR/8JE
 EqPOy1Nb/shDDVDDDMoSkur5WKepYwfyJnbEp+GLF3pMlsAKq9tFrTh
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
Subject: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Force guest_memfd for TDX VMs.

Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d42e201eba76..b73a7bfe8531 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
 static bool is_guest_memfd_required(struct vm_shape shape)
 {
 #ifdef __x86_64__
-	return shape.type == KVM_X86_SNP_VM;
+	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
 #else
 	return false;
 #endif

-- 
2.56.0.455.g6c5a503b38-goog

