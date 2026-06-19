Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACB326928
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867436; cv=pass; b=Qy0D2/2VCHDveqYGROIRYqDzrtuOAOYraXVWfAve3yzW5IXpY+LU9hKss49dvj7bmhV4SRaA7rQFiFeuU0fr/f51dbRfgN7mzwFP9Pkp00/ophYVZhvKKvKDtOd9sIfYMn1e+e8uBJ6uqmla9i2REb8w+twClUro1voqf5JcO3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867436; c=relaxed/simple;
	bh=btKm2haKQomkQw+uhQB5pBRiK+95+O2o3qtewMx7Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRvVdqwaMTC0NnLh1Lt80TcD2bSoPq04QKDr+1AWZtTNuNibIsjsZosoJ3Zxnw4lrH56e2IE23VZq/yfdGHkFScuP1zri9NhDWJcOHZW1dr7FQfPrY9BeIS65MyLmNQQ/TIsmd0WrEk9crV+tNBFnyS6sJHy5f4kRcTRPvtVOrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=of3g3E9E; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="of3g3E9E"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51765531803so237781cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867432; cv=none;
        d=google.com; s=arc-20260327;
        b=KbVh4qd3esa1UQDDrjs+9nQty90XjefXt4ohjUwCN1O/XdA/VbIVSCIU5/+S2/MA2N
         h/AbSN+QbI01I939hUSrFU+viojUPFY2/eWoX59B+f/bA1M4gl1apqQs0R6rDK9PaH68
         H/Z0ZYZ34rK2VTg52VsnQ4CLM2l+7mLkSob1ktHcB7WRYDKqwavsJlXhN4dXd7B05igR
         7rJkJZcf3ZwiBa5Ul6Ji9E9G43V/ig1Sacn1AHGXIGnOF62iKvuT2JKXjdhv/3rPjhv9
         Ph7KQc/5YDywwxQpn03GAMJSWIEX+zqva1LHdB2zE/Mliu0uPnPsp2hsmTN+4z5MDfgP
         WLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        fh=oJ1RKH3BqK2qp6dgf4o1k/oqGrl3kLnKz5wNtWH6KKg=;
        b=O3xS8ulTjdP8UrpWd5IO9Y/WyTTY0vjrWphJdqb2qa38ILLuy1khau0vEJ0Lg7QB/M
         xkTPQYtFrhbvOLcYkoJ2IQIPQtjRD20DvHSxRvUJjA1RC3awF1rErkMWNa0niML6V1wo
         +ClobKZPUP97pHkAiedy2BSFl4FIlhVvY1DByzBCVc/QQ5c0Qysg0YFN1UAV7Q1SrYgG
         ymNF9pDlOMzvkV8KaMkWWfD/Dn3qSGjdxJScN6Lg8Txk1N+QlhPkXbXOtsPDQ8ZNBqUb
         81I6JNFFDTWnyAi0eeed/U1opWE1REHKqXo3IDYbZY8XfHk5j6P4XZGWgiFnzph6AJ7s
         fZyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867432; x=1782472232; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=of3g3E9EWrUYK2VJsf21DH2lVzJYSFekJNs53pg/sCEMq/9gqzry6oRfbRUT7w8vTW
         T9fVtrBBP+n3Rf2X5wlpZPQSO1/9ABHl53gpE0wx3gZ9xqAYAwgGzoXVuzKljkkUuj45
         wjJexN7C9et7BkauciDx6nv9LeEY+MlDqRnaVoThgNRSUldTvu+UGMHDyKtLxiYnsLbM
         Q28hkkzwfBr64cA5YNZeWfm5DQMlPSeW6dd13XO7RsInRVbK6OqteljFnd83iH27XMpk
         Z35kcD25KiV4e7pqZefO/Kgjfd7hwm5fZxwuP/XTumbyP4+of7kd8/H5G74VM0fJ3+0t
         MQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867432; x=1782472232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=cz1Rg87HhnTy4KnPScL0CSQLB25ol6N6kpo3i+uoz4r5z3SBElI9eUEL8dgbGGOeJe
         d4fT/+t9Wy4HFgU8j5IPwMrZOeWjEYjfTCiuqjNqShXZxxfP0o+M6EYpk9uTBbdveOp6
         5eN+eaKfBEDgoBmBn1GLRZLlxJ16QhU0ltwjgL5gAKIf+5Ql04cR2zSLqKjXeZX1BqhB
         ggTTIegzpp3iA6dLHSpLVWmnZ+jN+24p6QOyJB9sSC1SuQK/17TUluS9vpK/b6nHXK/a
         Tt3e/m0h4sl+SvYtcQnTS4u9qfX7w1cb1glNqyHWAF2qlnMVe4QIIcGhCS05U2C81wXW
         0E9w==
X-Forwarded-Encrypted: i=1; AFNElJ8pNtF4EWyK9M05kfAyCAkTbqDe/RP/ssKctZw3QCgnkVUjZD6QT8DQQzJ49M/zZQY9FdEL97d7iv3EETA4nkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+855qlazzS7M8SEQvg5AR05Mb3iPslGp7GXtSoHX8C+3C5YL
	xiJI/Y3CJz3YqLYTccHWzU+/d8xxd27HOw78xXaSp4g2YEl7Jrw9YEu29gzlq1h5aT+J7t66+WJ
	UZ8Xkn7/OHdhoN/umzWYUbvAOrUCcjUe+NE4Upde0
X-Gm-Gg: AfdE7ck6sk+0VfXB8TITCSm1anOaRNegZRppTdc7rvCG0Y+ckd5GygEZtx4evln9/4f
	bVRyfvplDlrG20SOG3e8wRS4vHcccKLO6/l0FtBySlYBTR0kB06BTk1tip+wpDTI6EQmKN/p7UF
	MAOJ9SCEHkS292fsB12hgKBhpMRRkjSpeYctmp3hvPm0DCpzcBSc/x1JNscrt1MbZIWPH08hiUV
	8S6DH0F3fjsEjP4GSsBAivm9n7saYYOE6E9YfUIqY2Lv3u3FexCbd9gHijUwguPs8xOKVaovw==
X-Received: by 2002:a05:622a:2b08:b0:517:99ea:ab7a with SMTP id
 d75a77b69052e-519e4ab67d5mr7722981cf.26.1781867431624; Fri, 19 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:09:54 +0100
X-Gm-Features: AVVi8CeUT44zBCOt4kdWsDDIMV1MwoUKi9VlfHD19GzvGrkCGzRWMwEiO6g5I68
Message-ID: <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Update tdx_gmem_post_populate() to handle cases where a source page is
> not explicitly provided. Instead of returning -EOPNOTSUPP when src_page
> is NULL, default to using the page associated with the destination PFN.
>
> This change allows for in-place memory conversion where the data is
> already present in the target PFN, ensuring the TDX module has a valid
> source page reference for the TDH.MEM.PAGE.ADD operation.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Sashiko flagged that when src_page = pfn_to_page(pfn),
tdh_mem_page_add gets identical physical addresses for r8
(destination) and r9 (source), reading with host KeyID and writing
with TD KeyID on the same address. I don't know enough about the TDX
module's operand constraints to confirm whether it allows overlapping
source and destination, but the concern looks legitimate.

nit: why does it have Sean's SoB?

Cheers,
/fuad


>  Documentation/virt/kvm/x86/intel-tdx.rst |  4 ++++
>  arch/x86/kvm/vmx/tdx.c                   | 11 ++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
> index 6a222e9d09541..74357fe87f9ec 100644
> --- a/Documentation/virt/kvm/x86/intel-tdx.rst
> +++ b/Documentation/virt/kvm/x86/intel-tdx.rst
> @@ -158,6 +158,10 @@ KVM_TDX_INIT_MEM_REGION
>  Initialize @nr_pages TDX guest private memory starting from @gpa with userspace
>  provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.
>
> +If guest_memfd in-place conversion is enabled, pass NULL for @source_addr to
> +initialize the memory region using memory contents already populated in
> +guest_memfd memory.
> +
>  Note, before calling this sub command, memory attribute of the range
>  [gpa, gpa + nr_pages] needs to be private.  Userspace can use
>  KVM_SET_MEMORY_ATTRIBUTES to set the attribute.
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index ffe9d0db58c59..56d10333c61a7 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>         if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>                 return -EIO;
>
> -       if (!src_page)
> -               return -EOPNOTSUPP;
> +       if (!src_page) {
> +               if (!gmem_in_place_conversion)
> +                       return -EOPNOTSUPP;
> +
> +               src_page = pfn_to_page(pfn);
> +       }
>
>         kvm_tdx->page_add_src = src_page;
>         ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
> @@ -3278,7 +3282,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>                         break;
>                 }
>
> -               region.source_addr += PAGE_SIZE;
> +               if (region.source_addr)
> +                       region.source_addr += PAGE_SIZE;
>                 region.gpa += PAGE_SIZE;
>                 region.nr_pages--;
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
