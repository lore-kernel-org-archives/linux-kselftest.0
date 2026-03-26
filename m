Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048636921F
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563885; cv=none; b=mGK/S+mxvKnydBQfOl5y9H5cVbM3Wc9YnW6TK60TWwLDwrH5jMTDuCuL7QDBU4itimQQ2PbcMPWWC/trU6Rrnm3LPT62rHE7USsfIfvO7o2jnUVzQKWdYPwWpHwsSoVntfNEnsUUV4QjsRWnOMYwy8C4+xaBeTYCJ+9XzErDURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563885; c=relaxed/simple;
	bh=gE3KclXG+bVXmn4N8I/Pzv4zqyHg9U3PnnxTKQ6BJAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WZT9B5nPsj6eXMTLi8fj8OIpxtgmqv5Ibm69s3IY9SE3BJXj4fP9oYHwKFlyFomgYggOUN15PFlznVEJIJt+RVjDkAcBh0tn7/1C2J+xg7oClaIwP+4ZuY5Eg46dlPScnNut4AcXOosq3MemvRCnwiVOPSed0PDp2bBanhrCnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sX1/hitR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sX1/hitR"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82c83bd48afso628208b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774563883; x=1775168683; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmnO4hb2PIIA1EWduI9O/UbYa6yJaVxG6FOYNP/OZJo=;
        b=sX1/hitRHE9h8u9vOXDMAshvOtEFJibLgOYVrMM50ReUqX6jC99w0z+ICWD0cl8tRL
         ZNfZCD9jD1rFEKSiqMiK0pcydY13PKEEQMuLNPlrAk1rZTgigmn9oALnSr3xlmST35v0
         Szl7XvqnKjIGcF9ZZnMG46dIdKYVPGo1kKqgRKMF31XqJPxSRWXbRZIb0QGkFkJqITPi
         pmoe6tz79S+2ddO2KT541aL24H2Xo6NpytFoaIGMFGJkaly0RgjBbJF2ksBy9jkBZWSy
         5JUwnI0exuP3nopY+7WJBc566pbdqwfHRej7OCV9nyVFCx3lwZ1xFaWAUxsl1xode42Y
         w2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774563883; x=1775168683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmnO4hb2PIIA1EWduI9O/UbYa6yJaVxG6FOYNP/OZJo=;
        b=m0XJTo5XZWOBue34d5TocYM0xGbtvraNfPS2+2+6Pbj+xifgJlzUvKUTtUr9dfCcMy
         z9gFKxLP0yyhRRsz/Et4ZpYGs/3FCtf/T12DFtycG0Xjz9u0DAG+P4lTIiAh284ZoetJ
         iO1WgxBbU2NHQ8kgmKnqMbTXgxr4FPM/mcB+/pVemRlUO0Ug9I/rfMsKcQRhXDv0Jh0p
         elMberIv2rzlHmJwUMAYApQmWs4pU340AuHv5rcIN3+fQHC3qK0xVQN84JryJrprXODk
         9D+RCEkZJs9WydlwqIgANEhjfOkcK/uTtvg0Y3VINy+uCB0tBF5gKoVHV6LuO3/ctcnt
         empw==
X-Forwarded-Encrypted: i=1; AJvYcCUGxeemABVXUvWjtE3dfWe8k+3nRYN+umoZPBbUhMEZNBfUHLK0cFsbWnrfgtBotfpS9p9Rbd++bv1igo+QC/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzc+MM5CVr3Lnn/h2DxYG+rHmVdgFiKJ4gdnOBaaqLUjtj+wk
	6uiHPjIcpHxP9i4mtTmZwt3jKeFdjFKZzXuF9jpJjciZx89QRK8nH+OWAE8+FnEJLPpaAk5eI3y
	Q8Hdow4c43BXPn773lduKuO8rRw==
X-Received: from pfbgi8.prod.google.com ([2002:a05:6a00:63c8:b0:82a:1997:96c2])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3388:b0:82a:e3de:27c2 with SMTP id d2e1a72fcca58-82c95ff78dfmr127743b3a.41.1774563883057;
 Thu, 26 Mar 2026 15:24:43 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:24:18 -0700
In-Reply-To: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774563861; l=1337;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=FPot4968BrrzY7lVw+wCqRSRqFOGaqVnuLbaco54t84=; b=pT1cKE5qo45twbYLFoifTHiRtxOTgBfSw8h/PmpQsnlghxeqA74ByQ0l7/JmSNZsH3jS0kwEA
 FZDy0ff5dwLBbaIcg7YIVPXmB7vme9WkWcqdC7GLxJMEVGO2PA4rqXh
X-Mailer: b4 0.14.3
Message-ID: <20260326-gmem-inplace-conversion-v4-9-e202fe950ffd@google.com>
Subject: [PATCH RFC v4 09/44] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
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
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Now that guest_memfd supports tracking private vs. shared within gmem
itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
are disabled, i.e. when it's actually possible for a guest_memfd instance
to contain shared memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7e133a9da11f0..9c29407712580 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14056,14 +14056,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
-/*
- * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
- * with private memory (the private vs. shared tracking needs to be moved into
- * guest_memfd).
- */
 bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 {
-	return !kvm_arch_has_private_mem(kvm);
+	/*
+	 * INIT_SHARED isn't supported if the memory attributes are per-VM,
+	 * in which case guest_memfd can _only_ be used for private memory.
+	 */
+	return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE

-- 
2.53.0.1018.g2bb0e51243-goog

