Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E28534A795
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353646; cv=pass; b=JtfypTBtNvUNkOPANqXGOChQXkfypdBEm6tU+1FWERTPHYq/OpYGguJrOtWK4HU5JNsdW2L/NrnPQdH8NSBkhzAxokrDVtvl2fUdJCXoVSnRe25N7mp3bLQHQv9eI4HCmid7JFUDtFiYWYkkPxN0KX9pWYqeKG8ybVkZ1hGQsNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353646; c=relaxed/simple;
	bh=BlROpg/oMQ6qyw2CniwdkMcN/+oY12kcabYx5q1tsm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPPTwBDNOaFPKyXn23PhpaQNWzPsjIar/3M189Rvd9PZg0uUI6FUVVfqRPBPF0JbFbO9emSc6I/5NpkF0kbNuEX7K4AVlNo2HBgkeZXL5wRznsPMdukzg25IM17wc48HshJ4rHYPXms9y5Lb8E+Z8jH4ZiDMz7b073UVRrol7bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BN5jP55N; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BN5jP55N"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-515548f390fso2201cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 01:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779353644; cv=none;
        d=google.com; s=arc-20240605;
        b=EtzEDq4VDAveHbgSBoGrpP1UbiPXqpxxWmVUSzzBJKZ81pyJ4oqUnyhDiJU/kveY84
         sP7vePRE839rNmRGRodlh/K0+V9VVOeQikv15UJ8i/xma9/cSvoH4Rp778Mp1zaoNpOw
         1uOZ7xAJ+2/1k9eLwhtHpJjYc+ehP8U0d7NrsNm6ubrDsEdYKcEVrhkJexUOjVlU9Sdq
         PoTRZ/ScZyTtA7WG1jjhiz0NwFLlybRBmKVBIynzQmsyOc38r8q4hnTf4ShpFYCuaVQv
         4tWEwVFy8zunzypmoQllrNyulYc2yzDG29o/xO2qzbPU0Iyo2CWVDTdU2nzcaOxooR+h
         mqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        fh=AnW/nWFnGDDi8+5OEuAhZbPCYlucmtGSbJUza+jt/gQ=;
        b=Zq5VLNv9HyqzTCamWkyjdSBQntpEjw8wszTNXZVM85ohTY0kSMCsenpCWme9+4LLja
         PqZxQfFSdBHx+HhorxEzAZNKFWA4r6hMJq8l6QmOqzwjJn0qnvCgJ8CsLmaYlFYamkyy
         LeY1RuxQehpoYG+iQzgN1hUQMMfDXGNsc6W2yUrTqjqbieHIz3TZ2Kkzp4URGHuoNt1p
         eTTdpI5yUKO06i+Je4Z+ZOnxVbnaMXoK/ayUq+R2wxYNabxTArFOulGd/p5fczQiGqj+
         NzwCxTWBKShr+Uf3I85IuMN1DTHfMJrrOpC2wiXt+J76C3g/vs54V+xVfnTYFyYZGsSO
         bRZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779353644; x=1779958444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        b=BN5jP55NPPw9UIZ2qVQVKD7Av3ym/lEOMlvrQqeFmhYNXnSy49oBoJ4Rl387X8seMj
         XJm5/p6PiZGxnb8qiNNXME6lr5o2U0E7Xw5FHeJaKmyXVTMbkXjZo/lXs73llKDnwZjY
         TjXDU8qACJ9aOsrcDt/rYFMO8uOgqjTJJxX2DNnV9X14uQT7IwAJ+3HCHHDwseyYCpfz
         fCl3qq+SYBr4v+yOtOHsd1EHeAuqS6s6YKUMc2c/P+Q4bRwyijR2MApo/T9BioJkSibu
         rrvOqFCyxohOlBjgGWqa+EZznn6TY+YbknPOA96lCJO/1TwVEMPvtTwD1Cc73ydAZbVQ
         9sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353644; x=1779958444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        b=lzv2PEQzWdtI4Lg39cCMlN31pnA3QKDnuyrh4VURvfT2z4iY9iI4gd51+jrXJKGaC4
         HuqG4hY+KTPwsaAGYyshP35oPib0EohULh5FlTna34uAzgl/irQyppENSeR0izZ6eUTH
         h9jFCzqgc9DdZVvEKzVBtgIKpJjehHeWfyvMG3omXM6R382HWKayQHuhuActEZmGzv+3
         pqSklarzuHUah6WkrN57ElyKJbS2H9qBwei5uyzT9oltsLlfnhlMuqM5UuXQU7P3OYRc
         Le8bgLHpYSZKnVEdKn5kfMltQkJl7Lm7aXaGaAhkx3fzXApkTPA69pvqf+lQCUOPRiwR
         BrOg==
X-Forwarded-Encrypted: i=1; AFNElJ+szDgB/x2K2rLGR/du6Uk8Ynohy2iKqro8scRyoE4Cat2BM+0ktvL5xntRYxPZ+sHuIK5VsFbUMaZfrT5mXvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSM9GVfww2OQEviDE1ZB5NWlLBvxv4VfxwZEYqXFTn1q732AT
	N1kP6LCRNprMeWyK1VigxEgcBbLqkrbRybte7pR5e7DnIQwdK4vrfLjjZnptuYiq4i60FLu4jZR
	qwQsHUUWhiFuCqNWlthgtZJnKRgMNTKAa7dISK6Aa
X-Gm-Gg: Acq92OE8jH1v9MLy/i/nCFHXtcA7mXVLJc4yRC1cq8dYWZSrC19M65ssBJ/2XZIRrjb
	Wuw7H3vjIchMeujDSD7ENDDG13/A8w7OHswMN+oaXt4ZhDL3JrsD5Zw0UKbYo7KMo1cCnl32jRb
	dA/owzMoJzh4gYhSJPU3A1lr8l6c/vnoKfykmuPPvrcWK9/gxn0KIGvmakqLjSScb4B3FH1w+gh
	1GanR1tYOdgEf9kzHaQJgLUHQgfjnm50rXDjJlj1KuueOc3Khy/gV9pFuXT3fRp5TbPPjeMGJC3
	rZX+d0NHoa+2aCaueI0=
X-Received: by 2002:a05:622a:2682:b0:516:cc18:4760 with SMTP id
 d75a77b69052e-516cc1848a3mr1318811cf.21.1779353643586; Thu, 21 May 2026
 01:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:54:00 +0100
X-Gm-Features: AVHnY4JjgkDwC5Px9qxOcGZwEfL7vQEDZaLkFA7McDQJ3moR9Atjhj_tt-FGzFY
Message-ID: <CA+EHjTwkX_K4S4CHNFvoP=vDUnzW9MyLxBFZzDrR3tM6yuKNTA@mail.gmail.com>
Subject: Re: [PATCH v6 20/43] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
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
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Now that guest_memfd supports tracking private vs. shared within gmem
> itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
> for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
> are disabled, i.e. when it's actually possible for a guest_memfd instance
> to contain shared memory.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/x86/kvm/x86.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 1560de1e95be0..6609957ecfea3 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -14172,14 +14172,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> -/*
> - * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
> - * with private memory (the private vs. shared tracking needs to be moved into
> - * guest_memfd).
> - */
>  bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
>  {
> -       return !kvm_arch_has_private_mem(kvm);
> +       /*
> +        * INIT_SHARED isn't supported if the memory attributes are per-VM,
> +        * in which case guest_memfd can _only_ be used for private memory.
> +        */
> +       return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);
>  }
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
