Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F567403B16
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374783; cv=none; b=F+ULkpBDKrkui/YxPtnl3HCE1UxMiRNn3zdqdA76WqcDiEt+JJMIHbEY523oOZjFOrvROJIlBWaJ8m2FRk1e37J7lAm/pE4yjg+PZqApdmJsXACe/pbk2HcPWGjnZTbzPmRcuFamd3q7gGMmhIWzcoHBUL1CwFZMN6/u/HAFBpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374783; c=relaxed/simple;
	bh=e8a82G3vdF1gTRu9deHGJJWozJtJR+he1ppv5OSrv/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZI88Y23G6pdtCj293eBkoMREJrqRGkynM9Buly0Q7QkNzzl1a579DSp9hJsDrvNnE3xhVoyiEA3rfr33C7wgplktCaI0vRioVO3wTfp7ivrmHVpz9aM3Hi1PpzSUj0YGdQdAmsK4MvvJU3z0AnvGobZozRLpbrkNpE/f7Yg9gZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IT+sDP8O; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IT+sDP8O"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so5491399b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786374781; x=1786979581; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jP6OZG+k89vE4yr/pvKA0W8zcNVpjbJQrQC8mI91fW0=;
        b=IT+sDP8OZWdknMBCj+jUaT5LnA6Ow5v22niPqrSYGF8L3nwkcru4ObO6PsTsHvwhRu
         w0wPRpwxMaeyCoHuK9oxL94vmEBYdVRu0hQ9XYpavkER5C5Ne7ulYtTzG/z5bWzR/mLp
         FYc4Kc4bUdb/C5AsSTzaWM7KYzlWM5Rn5zt6r9sUo1VHLZ94QiWUOPt76o3U6EwrL0hd
         9krDBH/9KF1A3DejRttnMAPLDQzC74v5anj8WcRnk0CnHQVtIdHH9xg0ZG0gtr5TS3JB
         HtYy67mhe0xL27wczJGVc3tpVC66+b875u92KVVsm70ffLdeatf0JOzMlaYEW9tjLPtm
         2zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786374781; x=1786979581;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jP6OZG+k89vE4yr/pvKA0W8zcNVpjbJQrQC8mI91fW0=;
        b=JLwMo2KM6C1XAlTujKjrwsnnKelavckE8IZD9/8Qxm3PYeciNhtcmKI7Ea0wdZfFh/
         42lKQXM7kDT5wv2DM9mK0eMhtVCWikbC1u16F9wREQot8Nn3yUrto84OCgKpRPTqwUsN
         cLSfrCTwQijXNKNuGfZh+U8FHeSjTsBwIjuHEuPB014/cc+DC6d1HhbJZONjTFHkI2Qu
         39L9GmbEKiG/k9sZ3RQnKFCcAueGsI4ULWjxKGR9W/kVR1tuCYO/23J64up7fUhGW9BC
         1rmtvL1CNFoVrNvnLNATfOeUn1q8qWwhwxlLlth4hGzG+euXQyJ+6iKvUoVtwzsB8CxB
         V/KQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNyYxB9qSxJ/CZ5hwpdwLeG08o3GMnoDaGF5Wt5VJYFn3vwXFvvliMXU+K0SMV67+pADns1ahmG+t99TYU7eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDLH9CPRfqPdlLdjIr+GLCcIILqChZqG4oN5fKD5alMqU0R7X
	4ctoVnKr2HdFGHySh+mYR+J52PUwo0DuneYWLPtcyF4/urERydDc0z09bnyCACsBQKQSZXtVbVR
	3gv0DSg==
X-Received: from pfqf14.prod.google.com ([2002:aa7:9d8e:0:b0:84d:f9cf:1f3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2286:b0:848:76af:db37
 with SMTP id d2e1a72fcca58-84f694200b5mr21737517b3a.7.1786374779939; Mon, 10
 Aug 2026 08:12:59 -0700 (PDT)
Date: Mon, 10 Aug 2026 08:12:59 -0700
In-Reply-To: <20260807-gmem-inplace-conversion-v10-2-2fc18ee6d3ba@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-2-2fc18ee6d3ba@google.com>
Message-ID: <annqex-kBOc0UJvp@google.com>
Subject: Re: [PATCH v10 02/41] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 07, 2026, Ackerley Tng wrote:
>  static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
> @@ -61,9 +69,25 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>  	return gfn - slot->base_gfn + slot->gmem.pgoff;
>  }
>  
> +static u64 kvm_gmem_get_attributes(struct inode *inode, void *entry)
> +{
> +	if (WARN_ON_ONCE(!entry)) {
> +		bool initially_shared = GMEM_I(inode)->flags &
> +					GUEST_MEMFD_FLAG_INIT_SHARED;
> +
> +		return initially_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;

As David pointed out in v9[*], a helper would make this code in particular much
easier to read.  Though my vote is to add "get" and make it plural, because this
function is also plural.  I.e. this as fixup:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index f2bec0d49747..b7435a8d2405 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -69,14 +69,17 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
        return gfn - slot->base_gfn + slot->gmem.pgoff;
 }
 
+static u64 kvm_gmem_get_default_attributes(struct inode *inode)
+{
+       bool init_shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;
+
+       return init_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
+}
+
 static u64 kvm_gmem_get_attributes(struct inode *inode, void *entry)
 {
-       if (WARN_ON_ONCE(!entry)) {
-               bool initially_shared = GMEM_I(inode)->flags &
-                                       GUEST_MEMFD_FLAG_INIT_SHARED;
-
-               return initially_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
-       }
+       if (WARN_ON_ONCE(!entry))
+               return kvm_gmem_get_default_attributes(inode);
 
        return xa_to_value(entry);
 }
@@ -833,7 +836,7 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
         * index is represented in the maple tree at all times simplifies the
         * conversion and merging logic.
         */
-       attrs = gi->flags & GUEST_MEMFD_FLAG_INIT_SHARED ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
+       attrs = kvm_gmem_get_default_attributes(inode);
 
        /*
         * Acquire the invalidation lock purely to make lockdep happy.  The


[*] https://lore.kernel.org/all/0a85b27a-121e-40a3-92b6-3927fc298e4e@kernel.org
