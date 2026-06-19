Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F6349CDC
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867008; cv=pass; b=pZZicl6HNBo8r9wLV1zTljIUeNq87Yga5sidQ807R8i8yUsX0jJLiRe2btL7BY8vwfvn3xi0zcJ4VlFHcIbzKVLQzCE0I8L7beszVePPIcpo9aJDwDM1Q1tS96NZqVas25d/AePp6ySIUBV0tHllMYsLA59GB1QKbnEDnnzpNKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867008; c=relaxed/simple;
	bh=GsiXIcEdAu1JNPx0o0Rkb8mPpCDUCHPoupmGVgfFazA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYHwLf9lrUu7QRF9yO1HVagkRWtveMS38wcqWS0EXb/Jv0mzYz6tGGEYc+pcucKp5xNZBSrkz2Ot7YmBUH3BH25nlZ/ApyZTGMANr2kNg/icxsgrc14S+SA0eSNFxPREKlYC6PLSGWID2z8sndCuhKkh08xGrNcLz3aBgEUrI+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbcADlBT; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbcADlBT"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51765331535so158131cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 04:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867006; cv=none;
        d=google.com; s=arc-20260327;
        b=Cr0Tfuydu/YHT2A+xyZdt7TEGQPpdWQnUWFct3NkcwdNbGh4aBGfDBkBNZ+zWVIyJ0
         vKR1xf79aTVqO2cjFYopd+y1mS/U52pxjXgFaX/jwjg4VWFcSGaTqDN6gXYGdUGH3xRl
         C09x/9jqLz3liYKUeXq9dQB3Vfpd93+6jTvua1yxH/mFyRQMvkrPTO/WodkaQvTflNcs
         aSkw4iQRW2df7zSH+YgQdmVhDnkYQMP9IR0pd9X2+r6/WQkxBSqg+EqZTvmbFRgUnpRl
         D6DfzQUtww3FsaSzqKpXzuAVWb090rTKTwNfjzCxmf32DEuE77Lh89t7G0zaIlqi6QEV
         jRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        fh=52/CEm2KvBBA6qjuVmAe1BhOkutgAJsBajygk8BnyZY=;
        b=UUnOlexXoH+pnon0n/ZbAdOpT2uKza8LVmdwF7VhL4Pv+jlrFprWorMFu6QdUh+FvL
         cL9kxIFK/BphJAjSWiEiEUqiMUK/3nYtkwS6Aj+5CYDePWEBM48kiPIiaWZAx64jcD4l
         Vu2oDHTj8Ez/Y4X6O25awn1VZqR9/hAeCPy7hDN9LKmRK2XGgPoMpVnA7UqqL6Pfr8fc
         raxXChWL0jZJTnyNqQh5GmJg5oORnmFvwDHSZET8KnaDi4V1pYty/ZUiCYuTYkY28kaD
         /mM83jFGlMSaWYh2Vf2wtZQFlrS0OCJ8UTblDYIap9abmdul+OQVEmP2H/3set+wyGhz
         9zuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867006; x=1782471806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=bbcADlBT8HbCLpMyMG3EPLwa3qTHe3eGPyIP2OI/A91UMFYoORXh/tpHAi7X8NSPDG
         1kUSIlZt6BWlvj52JyUoPE5hWasC7NKFkEsSQ0zAQxyvdOSpVW/T9hp2/bKg/I/m036v
         8k/FTTc24b5mC/Wy/SGzNiZUA1pm+0qncVvvI3GyBB9Or5pUGPslfJCOrCxbkLpuDX1z
         iudVNAW/M9tbgf1Roi70sGQW6/1bKZ1SEuHX9zl8rOg1gnAB9kPVgYUpQRXULbgRJaCD
         354fbnoesOQTMqVG0pBEdnTJgKCYMdZmpTEl/iwyaixm8tLgehHqCuWfY07hoPgS32CV
         +r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867006; x=1782471806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=T+1vOnPnSE0ZH5YC40cRQkSXDA+RabB41/D8jiYR08W2g6yhaTanTDzHx9TxlzOLrG
         dNg2PQC93hzGZzjqyQWqoyIoshYrRT9WBNA5xWLXcRYmUCCSgWMX2LENLvvIGt/QFPCm
         D+C4lLqF0gBsehp5wV1GzTrZTxC/OnuhH/CuusD4l+9vaUyre08V7TYsBPdpP7vJmZAL
         vQUGdPkW68Msqa27ETIoEWbgOAf5fuichbdHUONniPZdyMjmc8KUXIRSAh4rj3uwpchc
         qdBGrA8wQPmwc91ARKUHUYMq4lYwQ5akV1f6aGZRO13I/2fZ1wRAbH5kIbjgKthwjWkT
         EOTA==
X-Forwarded-Encrypted: i=1; AFNElJ8fYRFu52tCksUxjdE2busd+paY1BFpnsZ68faSnWS7CfVTdRdwQJdgALSgDm68aklB3Yrnufxq1C5u6y16WOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kUuMnMAMTw5VSeLBgpDUto7t0ESnmjnvcTiDzEudBZ9cKhwn
	JBGEeJzyi4ZRAGxb/RWum7lU7dpSIBrDbf3KM35sqeXGDBs41n4h0PT6Tur/jW2D5n3IWFfhmww
	eCMUTENmrONkeCxskh9CxsGSmeNUMSVbixRdWfNcN
X-Gm-Gg: AfdE7cnA08Vw5pYLmlDFWtO41rCUi/Mn51UdWWGJnEt+PdGW55OwW2qzUmFxIj+xuu6
	y0PYci9znbszpcsQWBmsYpcXp1cPpSDD7InICv8Ico/SVZBL+fpLRgrwr7l3Yab0WVmx9FZuHCb
	+Jd2bSLTUYjm0246qVuKHoo2rDYDDal+/AhaQyvUqy1UbAgyTBgCBlSXcuJtUzUk65fvUJnYf3p
	1g4wdrYdr0hN+oP4AV0Hj++sYemiGcjvs7BznWvOIPObV/oMSJn6G62mQc3AY/T6XNBqGckuA==
X-Received: by 2002:a05:622a:5a12:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-519e878bcd3mr6572861cf.1.1781867005698; Fri, 19 Jun 2026
 04:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:02:47 +0100
X-Gm-Features: AVVi8CdeH8_e_cqUhrAt8PYHFeMtnUwZS7qxotCUws3_NP2cjS-AO0E0Squx-po
Message-ID: <CA+EHjTxd4_x-J8DurWuhPostfZqsxMUV87tWN5GzLCknH5wfQw@mail.gmail.com>
Subject: Re: [PATCH v8 11/46] KVM: Consolidate private memory and guest_memfd
 ifdeffery in kvm_host.h
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

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Move the kvm_arch_has_private_mem() stub and a few guest_memfd function
> definitions/declarations "down" in kvm_host.h to utilize existing #ifdefs,
> and so that related code is clustered together.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

SoB fix please. With that...

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index acb552745b428..9c1cf1a6559e3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,27 +722,6 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef kvm_arch_has_private_mem
> -static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> -{
> -       return false;
> -}
> -#endif
> -
> -#ifdef CONFIG_KVM_GUEST_MEMFD
> -bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> -
> -static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> -{
> -       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> -
> -       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> -               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> -
> -       return flags;
> -}
> -#endif
> -
>  #ifndef kvm_arch_has_readonly_mem
>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  {
> @@ -2572,6 +2551,11 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #else
>  #define gmem_in_place_conversion false
>
> +static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> +{
> +       return false;
> +}
> +
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
> @@ -2580,6 +2564,17 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> +
> +static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> +{
> +       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> +
> +       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> +               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +
> +       return flags;
> +}
>
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
