Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C0386422
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382444; cv=none; b=BWAHUMLtKq5i/nD/J0Qctl3ij1jhKjUlu6TegC4tCylmNx9/NwmI5GfnMBpOvdKmiV+GNWNr+1u3aL3IlK6b0cBJdSCFRF0vrujllFCkSEiqIhbpJzzX8NUD0FfQHFYSYEiragvl09GO/XvZdIMTWM95DB02pOHulqf0qqdO+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382444; c=relaxed/simple;
	bh=eHYnZ4b1YfTkQYFRV/vwy19bweLPw9di8nJ0CgUFfP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xo8Zm9DQPi5obm5nApRxAWQK5pHoN4uMZkF8pfdUfgbO4bqdWXZCKoZTPfcuMBIfzp7fT5DVDS+rPrfKXHOO2CP5rrSBhqdWpcg5LxTjePezWgctCf6mmT7SRsUa+vPuHsqJgs7JkCC/NMmyLpjoYsYGOykDCDwJtBVH63qRCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DoBT7rCP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DoBT7rCP"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12549312a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773382436; x=1773987236; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeX9NHGT79VIWrTrWv7REJqQFLvO/7s3sB7jc929G+A=;
        b=DoBT7rCPM4+jejFuS3yd8PugpKZGHirZ5K18heSwJpvpzTC2CgI208KXzIDnrbjpZP
         bBAteuMFDMVdtwtjT8EaJxIEvw/h/W4ADBKJrqZ3YzCsYLu2hFE4+vMkJC788mYQVtdN
         XXZc5tmYtsou+61FBXDkShY06E3XBopDcpUK2hIllgW3IyzATW5s8i2nu45grarqzECY
         tzqijmgYT1JrjGkwUuaS7iY8otj5I1tSTnamhVNWQate3X/Gho5w+5NrxpH01VdUiQPt
         7Jk144UBZrDOqBIEcdp917myIFkmubybruFmrKVjyLAfHxcBNUA5ecaJSTRmzfo7KDZq
         pj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382436; x=1773987236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeX9NHGT79VIWrTrWv7REJqQFLvO/7s3sB7jc929G+A=;
        b=axMRzW4mahzvCzg8MIiCX5XIAt5yp5INtF3RektcNysPMGpjvi5eZRgJ7Pup3Mq8A9
         tRZR9ugNDJ3wrVI5m8PZ++MXRqTz3MXY+KXsWo6gbicRDhQTXxkXGzpdwFcrww+nKfyk
         tf6d9zkhwrqcFVZ0HzsWom/3g78BxYzP46oteGGOAoAho5G9L6hhMHVNESoop03vWO3z
         bry/nBC4OPxPtKBUt5YqbjHyfkQMHZ7OnrtVmLqnPnVHeK8u6+ZQlmDf9pB0+Hq6HWzd
         mgmplmn+ODk0OxBbJ/Ef5pBMaKQCcIgQIRLbxHP5lhXf8g+FyJ+jMj1p6tJjWoGvgVo1
         6bQA==
X-Forwarded-Encrypted: i=1; AJvYcCXksLXIhFHX9jh+JUELZIE3aEBuNrD748PovTZ/Xumcy9Fao2rwnzPuP96G454P4h0rFkguqTHi5iJa0aNvDrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISGLls1S5naomfKEeH9j5hZD58St+xmws36OkjufnsYyWnD7m
	wBLwAD7Qxt4h7AKbLxotPlVReEhxqrwt+vWcyNnV+A1RJhqx3g0CcaBG70/Qmbtb2MkbXmPvco/
	TjsBJsCGi0wvdbhzNvkpaTCuMSQ==
X-Received: from pjbhg18.prod.google.com ([2002:a17:90b:3012:b0:359:8d6a:9bb7])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3dcb:b0:354:9b26:cdf7 with SMTP id 98e67ed59e1d1-35a21efae3cmr2174626a91.14.1773382435767;
 Thu, 12 Mar 2026 23:13:55 -0700 (PDT)
Date: Fri, 13 Mar 2026 06:13:20 +0000
In-Reply-To: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382364; l=1210;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=eHYnZ4b1YfTkQYFRV/vwy19bweLPw9di8nJ0CgUFfP0=; b=rqiNCCUj0FITl4TSW1UUj0oq7hsYbkSvZt06OqDlmcSg6UpNG7FtqMbblYVVtVwfIs39KRqkE
 zn6/r8J1IIsB66DPTP29Y9PgGogkWFKfLEPrDDUIU4WjVn8xw4GWd+6
X-Mailer: b4 0.14.3
Message-ID: <20260313-gmem-inplace-conversion-v3-41-5fc12a70ec89@google.com>
Subject: [PATCH RFC v3 41/43] KVM: x86: Support content mode ZERO for TDX
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

Support content mode ZERO for TDX by doing nothing, since TDX firmware will
zero for the host on private to shared conversions.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/x86.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 49c19897a9c30..1354fa89edb09 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14088,8 +14088,9 @@ u64 kvm_arch_gmem_supported_content_modes(struct kvm *kvm)
 	case KVM_X86_SEV_VM:
 	case KVM_X86_SEV_ES_VM:
 	case KVM_X86_SNP_VM:
-	case KVM_X86_TDX_VM:
 		return 0;
+	case KVM_X86_TDX_VM:
+		return KVM_SET_MEMORY_ATTRIBUTES2_ZERO;
 	case KVM_X86_DEFAULT_VM:
 	default:
 		WARN_ONCE(1, "Unexpected conversion request for vm_type.");
@@ -14103,6 +14104,9 @@ int kvm_arch_gmem_apply_content_mode_zero(struct kvm *kvm,
 	switch (kvm->arch.vm_type) {
 	case KVM_X86_SW_PROTECTED_VM:
 		return kvm_gmem_apply_content_mode_zero(folio);
+	case KVM_X86_TDX_VM:
+		/* Rely on TDX firmware to do zeroing. */
+		return 0;
 	default:
 		WARN_ONCE(1, "Unexpected request to zero for vm_type.");
 		return -EOPNOTSUPP;

-- 
2.53.0.851.ga537e3e6e9-goog

