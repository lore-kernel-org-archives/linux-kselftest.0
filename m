Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321E3321C2
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857356; cv=pass; b=DIq47+4mol1Aeixp9YVh9ptD7esATL5JcZUEpWX0RZo422Zuf3PEHa3VgHkcRz6TnWIrrZAQ99Zl+pkCjbZKGhV2zC6HlidAQ5FtBMRoYtzvex8OcBKisTHyKFyV9ZiwcqakvFaJPAz7hr+c8dOFZVbFBSdTOOTZ5IWsZw+6g/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857356; c=relaxed/simple;
	bh=8G3Iesv6H4uuh2/K8K/iWGA8fNXhb2ucD0ih1NRqF2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbSyYi5NlTYxQud9DJFicGqf7EaiRyj0Rp9+/T1gQ0mbKV/qAWXp6OtZvSoKU5YT+gUrAhuAnx17kTx5L1xvmpOzAOBxmVNH1YmZukjxaDrfqeWqvUXCjyKq8vyxTNTDalG2+mdpYmtaEI/8d/NkMjbHyhGTadhG49Z6WsQw4cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/tHg6j+; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/tHg6j+"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5177d1ff061so115881cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 01:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857353; cv=none;
        d=google.com; s=arc-20260327;
        b=bOQweDLTsfSOmTIBKXXimAa7g2F9II9AaqW2xcPiPYO3NAOiYyokkFTR5TWJeTK5gZ
         C0bnLakZn9YSI/ph6/xWyktsyg56vMd/Wol7rVRE+vEKXvVwMpJx7G6XZRF94hFKtWQB
         bvSqdPcxFgp37Usp9/iS04mpvm8LFHPpL94ZcC3KKDNCn7LgjnVrAdIZkiMzIaHu+Tzc
         vGRaAvxf6l5CDihwu3ublt8Q1B94L03otSKKJsKn9AUoHZyqz+IXso0bmumHRJEdwoSo
         lf9YlstBtYnJwqbI7nH428FLD+3BPUZzi5Je2V+nfKwS86rjp/G9E+QCfWsPwlhey9QV
         xXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        fh=LCCNc2nFFaqfqdL/jYFWA7Vpw8SzquMU76krNbkp65U=;
        b=pXnCfhLkcxl4bK4GTLl61KPDZkKFbHO/yUR3rRuNZEPdk2qi+P/hxPXU1pkQP6s0fL
         hBupimJBQoioAaVvyIu66/wkKB3ltAOn8KYcxttMOwUqsEB/HUTv3UY3SWIe4Rsyx/xu
         hDVg8/SH65kWXbgRi2GCudY0GKo9Ahik7uoQbFCy+DAIwgtuevODOPWOAfUBSeYklgW+
         SZd7wyAYhMxJmR3Fn0KAFskdnYgesEwoGyzthlGYH9fdH9B981zwnIMFmL6bU5t91FxH
         b4rpp+FWNSlvVEu71AqR34/Njht6+CjgN2x+SRvTBU/Fg6ka8xhtGbikjaCd/c4H70dq
         L1Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857353; x=1782462153; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        b=M/tHg6j+C6Vqmb/h1lmvTrgicl8vxiiubgA1EJ+cghpMBmPAQeFLRb4qCFDjAs5lmJ
         Z7pzAd/CL2EhpDHkaENZPa7iepzhfPWHHVx4xagYiJ+AGu/6ykTbOCZyWzum8UoUhs1t
         YS0MyqEUR4MjiRqyIFBFrGQ76ZDD4MTTCABWChiekxTXWqdfB2bAJRJtIgN34ew0SD+X
         2cF3mifgNEivRi1v5D0n76RSKqlY+iuWu02K0Nvhacpop1TvVZl75YlzAkMugSp2PQyk
         1Gd2nQhKkiHpxkfOnGZUUvyHLz5kXGhLyALD0aQxxPem3zzbBj74S/5vya2VGnip//EZ
         kHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857353; x=1782462153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        b=ppPR+FtAfmwZAFHihXKj/oNkqOflAXr5xD246qLD2ZVG8lDMNy8VZ8cVwKVsvqMBjk
         MmAMUV1LVIAwjHkAZ6sqBE9oQV2/YSupMrjl50WHp94FrGiFOgqWQ+KN0Q5h+k1nhPxR
         V9asdF/il734SEimvEYdBU+ju+rIp+NeGprBaPlE8mS6vIhSRLatqlgqsGx7eRgrKoj0
         +JIigj3pYSXM5bMnF7ZD7C0Qhg+caWOjr/02J1PwOcDSdnZRUQj7AvYkrObz6bIdh0SU
         TOVYko+TF5ZnRZ1eSEe21ORr7iX/ILVJX4NeVTe+Edp8RgszAG73eHTAqI/sAcMN/kn1
         KSag==
X-Forwarded-Encrypted: i=1; AFNElJ+bDgkD/5SHC7qCADTUuQ67I8Z8+0IeubZiyRjtUic4JGhLn5XR9xy51JBvPK0nPuBBIHpw5Vp5ukgHINkNa1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIBjGzC7rF3lXG7bezwU1ZqUju3/2Kf9wyhdtW50PUK85/KBV
	aB8sJ2KkCZg4htOtMYMC7+niXmQFhrmDSxh7vMu68/WZjjYWfjN9xJzJZm1slOJ+ArRipmZFelH
	LIRnp6ZQB4EmLkqAm8be5KP1Vj+jbi0eLaUkLspjT
X-Gm-Gg: AfdE7cljNL2mGpX7JZqNt4Oh1zHGKlhd2A5Y5ZZvMJ3c2jLys9lnclpvBuYlbCvkO/c
	ePkyoM+fkMZ95xwLlxlcqHggzl6ugzmfwtHFMILDhJ9qzV3N9YdGhl5jWX1AUTd0aXCi7zn+8gq
	fNu3hVDsHzxAUPRMvqgbCAzZucCl9L2yiqyjpHsk/kMoXaXsA+4VDJZDejJ5Xn+oMfYGsr2GxG0
	XiI98797f40/eFzcEL+ycLjXKulAWVA9JP8hUTVKoNZJIzPu00avZbRL1Yo3r++iVFPa5sjlyPO
	Y3+WsRGW
X-Received: by 2002:a05:622a:1b1d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-519e877e8c5mr4724561cf.1.1781857352209; Fri, 19 Jun 2026
 01:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com> <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
In-Reply-To: <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:21:55 +0100
X-Gm-Features: AVVi8CebV0NVi3MbMdc8DhRrav01L0h7Tt3z2YxRqWoRJXqhOu4WExRErk69dGE
Message-ID: <CA+EHjTxu32nQ+vPV7Zmcw76_-V4g2_g=P_UzRnnO2dP1PFO2ww@mail.gmail.com>
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 09:19, Fuad Tabba <tabba@google.com> wrote:
>
> On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Introduce a generic kvm_mem_is_private() interface using a static call to
> > determine if a GFN is private. This allows the implementation for checking
> > a GFN's private/shared status to be set at runtime.
> >
> > In preparation for choosing implementations between a guest_memfd lookup
> > and the existing VM attribute lookup, rename the existing
> > VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
> > looks up VM attributes.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> (SoB fix plz)
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
>
> Cheers,
> /fuad
> > ---
> >  include/linux/kvm_host.h | 12 +++++++++++-
> >  virt/kvm/kvm_main.c      | 15 +++++++++++++++
> >  2 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index eb26d4ea8945a..3915da2a61778 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> >                                          struct kvm_gfn_range *range);
> >
> > -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)

Should have read the Sashiko review first, but where is this used?
It's not used at all in this series...

/fuad

> >  {
> >         return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> >  }
> > @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
> >                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE,
> >                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE);
> >  }
> > +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> > +
> > +#ifdef kvm_arch_has_private_mem
> > +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
> > +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
> > +
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +       return static_call(__kvm_mem_is_private)(kvm, gfn);
> > +}
> >  #else
> >  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  {
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 6669f1477013c..8b238e461b854 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> >  }
> >  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> >
> > +#ifdef kvm_arch_has_private_mem
> > +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
> > +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
> > +
> > +static void kvm_init_memory_attributes(void)
> > +{
> > +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> > +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> > +#endif
> > +}
> > +#else
> > +static void kvm_init_memory_attributes(void) { }
> > +#endif
> > +
> >  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
> >  {
> >         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> > @@ -6528,6 +6542,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
> >         kvm_preempt_ops.sched_in = kvm_sched_in;
> >         kvm_preempt_ops.sched_out = kvm_sched_out;
> >
> > +       kvm_init_memory_attributes();
> >         kvm_init_debug();
> >
> >         r = kvm_vfio_ops_init();
> >
> > --
> > 2.55.0.rc0.738.g0c8ab3ebcc-goog
> >
> >
