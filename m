Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D33C3BFA
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735937; cv=none; b=pNDLuWe4doD6NDZg/X6Lch2m5Bi7z5Q6WuQt9ZUvTW6E6x7NTiw44DsYwWSB+Ncnm0YhWh63nM6bw6VqbN/nWRmc8EKuO0x36xTHjZVX5d+aW+fSKloGdb3KycJy9qZCsy7yrxdAM5B87MqQNor4t3kV+YgzuAFUYAjgNmhCD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735937; c=relaxed/simple;
	bh=pnbv1cdHILrK3XHy3SSf8zg/Qg2gRvmL7b7jEbqu2SI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AD6JEIBTPqq3vRi0M0XMzIixqvlzYPW3dWrbknLYpGeK3pQGnb1bd8VLixa0PMCqH0bjR+8wl7qUtyvOAHd9qQIh7WELdGjstKEMol7LTw7mC7lOshpwVsieP3CXgIhJ3mWkpX645sbbSdplURP9zSPpxGp9f5uWl9LlOYsKetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f6y0Gecz; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f6y0Gecz"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so980357a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735929; x=1788340729; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xbSTldz0mlkeejSRDvsTzV54cN/f7YMnwUkGWsjOYg=;
        b=f6y0GeczTBGC2qIf4t/91KY+MfufGBHFvIsJmShC4W9MGYfSlzfHDkkoJiFiOdw0Ud
         EzXnnyJ4EznvI0CjDjKK7u6cTRqH06KmmVMNvkTP9RFFnn0QKu2A4NS1E1LuYjXtiAgj
         9bSu8EB+fyDvreJVpmPsdNSpqJfGbP6e+ibJgKzNeR/WA4k/joonfSdsBJrmgPJjegZN
         06dkbLZkvEUqg3UT0l94zxyQ+TSYxAERGxzAl5gDGGOwFe+toqSLfKztHEp5Rv4QUZpQ
         45uR+Pqnj2jB05XavBOGWaMnME0YZQ+cXAtmPNgZRnis9I84oM/LfaSJFlCHDPDg2Zyj
         mlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735929; x=1788340729;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xbSTldz0mlkeejSRDvsTzV54cN/f7YMnwUkGWsjOYg=;
        b=s3RlwujpTUIQPUgs/B1Fv57PVU13nyMzKQbdlghSMhGQdDjxSc88jnT9J8xVz342du
         LzdtwyO0xSy6Ncp+XcVIyIidFYESnwSSImdPf0eUkoosf9fIxkw5lx8zteqiySfdMRRN
         Qc2y9WWegRLZemTwGRsfpJYGTSihmUGgCwPBQZpD9y7DVgjqtzssft13Dt7oFRRXlYjQ
         KPuFX8eYGeYPBdUJWQZiYcDRE8rdXoJozPKJWI1zX60upJbatuIhfPWwAreBxtgFi4lM
         B5x3Q+/c/mX6T52moPr29fYPUQeI1x4CifKogEl6kwPTlvrKpPM2H9ahStmYxRvIYUOl
         Evew==
X-Forwarded-Encrypted: i=1; AHgh+RpCu6USx5h3MMBrFVpcaB86zXBiqA8USxeNgx8K3xvD6U0N4Q5HUdKUU64IPWL1lNqjIRxPZ2uGllK5lnf1HvM=@vger.kernel.org
X-Gm-Message-State: AFuF++n/b2o1PFnN7SV0ZF5hJNQH8NpNe2TJ18XY3oJlXp2BsEVpKq/x
	mDYh/+erq5rJ+1B0NIq0hyTv6XJNXTAV86TRx8blgu1gQQtZZ70fNZ20i6bylbzHtWzC8DYqg4j
	W0zrILUxj6jeSss+oRdpv8OC45w==
X-Received: from plco20.prod.google.com ([2002:a17:902:e294:b0:2c9:b703:3bfb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr88247725ad.3.1787735928419;
 Wed, 26 Aug 2026 02:18:48 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:22 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=1693;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=xxgZV80P6tEBI0TS9iatKBLUXrCS72RFfbwoyow/L9Y=; b=I0SLEj0chvLQHB7QukPCMKxNVTQmEiLmipqoJJ+EGN6XfzLrsg82kHlLQjvE5ty/DdT4FbHrE
 xe7LXVIZZMOCZA0s06FUNYPGMQazgE0t9Oi6aKm/qrHRQUgS8sydK6J
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-24-0a15d8a799aa@google.com>
Subject: [PATCH v11 24/46] KVM: guest_memfd: Enable INIT_SHARED on guest_memfd
 for x86 Coco VMs
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Now that guest_memfd supports tracking private vs. shared within gmem
itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
for x86 Confidential Computing (CoCo) VMs, so long as in-place conversion
is enabled, i.e. when it's actually possible for a guest_memfd instance to
contain shared memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/x86.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 147b3e529cd26..45ef4156274ec 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10637,14 +10637,15 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
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
+	 * INIT_SHARED is supported if in-place conversion is enabled, or if
+	 * the VM doesn't support private memory.  If the VM has private memory
+	 * and in-place conversion is disabled, then guest_memfd can _only_ be
+	 * used for private memory.
+	 */
+	return gmem_in_place_conversion || !kvm_arch_has_private_mem(kvm);
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT

-- 
2.55.0.887.g758fc8c411-goog

