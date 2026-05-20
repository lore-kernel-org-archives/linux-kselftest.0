Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B6370AD8
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285263; cv=pass; b=kXztmNZEwBH3TN20S6x/JL5asojjO7tBYcW7S4mC3CxZ+jNGOxbymiixz3fEwwCuMRxxg79aNaOmHyTMjMfmnNUvpM5l7qivocAJuDr3il3ukK0K7cHKZsIjHKjhOX0CZdE2NiW+9qhE8QkGnefe/VQqWEusG5cvA6Vr5/ojXGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285263; c=relaxed/simple;
	bh=S2QQKlnUFtx99q7JAoA0OC+UdWmV5gUiJnNMdrUcP0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVMxB+QL0Pkfy4aD+9v4CEOYv4bCYoWwg9NdE1W7jhRQc0p9e5WflOdt8ZwGewpT/LPteuPxOhY52BHsj3uTK8WiP6a6vQHKpHQKZ59Mj54cY1xuAU2eSjqqu+FKlG8wfDbhWKij0Q3rDmVzq9dls7Wb2BQ2U+kKV9+gBmRo0ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FlGpxnOy; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FlGpxnOy"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50e61648f10so17611cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 06:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285261; cv=none;
        d=google.com; s=arc-20240605;
        b=byiYmh1+yx/n0gTJTuLpUkffec8Io7DpHEonU28O+eqn94Od2ud1DwFx3hZo8iULUb
         0NeMqesxPukjew5kKCdV9eoLd7uOh0Rx11eLifHmC7sAz/R0WvsiZqW3HKkfoWEeJlM4
         RAy9Epk/k08bncX9tVQ8zJ95JxAoBrOrH4uYN6VbWJHP1QJGPqWhlNWMtpBDPUsZ8K1O
         KFlooG/Ywur2BNOz+i+Q0qIZH1BGs8DexmnuM6rryjIYeMbo28F9lyuaLkGIapG0TR76
         AJA7gOZeQ5tY0j179u2NQ/5q/SXbSE1ImKGTBQSAPLmpripca5Lx3VsuJYrTtAo/NlZw
         8v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        fh=3sSEmr7No9eiac/JC4pGzShjGHKWQ1WLZvPHB9H/pIc=;
        b=YI5lDGGlLoTJE/A17gx/Rgvu3sPe3bCRa5G+adi+d9VgFz+YN8apCw9GkCmcFcloI3
         VmC4MbtlfhMyjrVBdx2n3mTTcXYAPIm8wR5+/rU4mNkx+EJiucVv3MPzBpnMa99FoMrF
         le2Cq4/exCJI1O95xocDs1ji0jfZwLbNQ+nqPSbgnEzw9S3cu6PjtK0Tm9yXSskKOgpe
         CbEXCGVih2I6ABLobACuabW2x2Ln0OirYj0X9nHqTXIMTTG0hJX0FV8cfOJRJtrMHp7I
         APANj6HuKU2EPsnHo8aSghvDDFB1ryMhRyCFKF0YQgCknYjgPQX8FvmrzPd0VlMJ26we
         oLnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779285261; x=1779890061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        b=FlGpxnOy1OupyW2Q1zIyup43N87OMJwKztCv6N+HDnob/jJvUJ8z8guWYdsvfgy5Vk
         bYZ8/IxQ03u0nq9UjDTFEIBxWJ0WluRCzbiidl+gTXI1ftCgVUJbKZ7IywxDxWZZdgCZ
         Eut7gVIanoDiulES82ZPcYhphjf4zLo4gZCmLH6DNtbYETq8gOoZpePWFOTSIVJ7z/I9
         jLZZHmnJbJTPJenYfMosc6xqdQYwIW1E+FWC3pTWPoQbcYcYeZzAem92yhNPYOXzfU/O
         MY+XtRStjWRikmNujbDSmdT22fpU0Ybesepsoknhbbd49idN4hoEqIbeVFjer9IUh7EA
         jRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285261; x=1779890061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE3b6wCinhvGTxYfOlCOBpwr8sXmo/MKVQj4OkH8tQg=;
        b=S1hTVnRQDKTeBOYv7FMQ0JIGjf4J6zT+wsktUeqm9di4SZi48R84dkBH40v3ROfGbw
         vd4UVM6EeUIoyCyYskEGr3EMFbV4WMpfg4/C/sMj7xnu+/pox7mFKuzIyUUxpLIQpbme
         dLESXb5tkBlzleaYdVNuXUtHfiIx29zG99gaE2PWfK2zS5tumV/FsjE5Gq0Y9h2PPwEw
         aDPk7wT3H+guc1yGEW1C73VcqUp5octRDCeqTaez1Cc/1WXPIxhsr2waBZc0VpCYNjzT
         +Qu0dDNtMCmmXmohzgHp+dPeLjHSp6q5RI54sOmtgcdplvfWP8xN0e1DaXXJ8e6aMKnM
         U2Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/3t2aQLQqL6IH3SbDI2UZHmYJboCVzdBZDS8rKfBexYtdHA8smKbWLFVnPjD5ionM0R/HF4x0k1IVqwR4u4fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdXkvE0ylllMihVS0tW6Z2u1IwYfJ+O5Rzu57a5FzOfa1fHgww
	yxlCvFyKbbcAyjTzQEAYjetfFj/Fkh/DQHyr2zvV7dG5fpCpAgQbaMBcCQbER1G7NQzGhP5nqF4
	G9VOShKgQv17gbmEpXZwlN3KY4S+GxkbeyVtyQiYM
X-Gm-Gg: Acq92OEyKJU0TW5/4XUgDNV+NewLtGlFpNvsFIvQ4EkjitC2HafIWejkryYhT/Ri1Hp
	GgjnSpGm141EQovFt7+sVU+FKj2yHJb8hsoZF2oOavEW1UgcGtd96NQ4hxduLgW+UqkR9fWUv4d
	R4wFHFkd78wbJ2sLdjELKQhUeEDIoFcTMSBioi4s3q8xNWlk3kE072hJBE+pcj+gpyiOFqjxjmQ
	w94CxHPiSa8R8cRhSl9npRzQn8Lg5PC5OQSU1m8MVDAt9xaLBceyuGVZ82XVxtNCkQv6IjwCWz9
	vmQr2ToAsrNWvGtQlZZS7qkV7VbUGQ==
X-Received: by 2002:a05:622a:4248:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-5167b6af157mr20549601cf.15.1779285259966; Wed, 20 May 2026
 06:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-9-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-9-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:53:43 +0100
X-Gm-Features: AVHnY4Im-a3duwAXpFrRqgO3e6bv1dT8inf454bQ9t5MibC6MZzfjT5fwn9v5O8
Message-ID: <CA+EHjTzd7HrkXyXdO65VDzUg3mehBoajRCS2XBU4ogK+JCuX_g@mail.gmail.com>
Subject: Re: [PATCH v6 09/43] KVM: Move kvm_supported_mem_attributes() to kvm_host.h
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Move kvm_supported_mem_attributes() from kvm_main.c to kvm_host.h and
> make it a static inline function. This allows the helper to be used in
> other parts of the KVM subsystem outside of kvm_main.c. This helper will be
> used later by guest_memfd.
>
> No functional change intended.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 10 ++++++++++
>  virt/kvm/kvm_main.c      | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1deab76dc0a2c..f9ea95e33d050 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2529,6 +2529,16 @@ static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
>  }
>
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
> +static inline u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +{
> +#ifdef kvm_arch_has_private_mem
> +       if (!kvm || kvm_arch_has_private_mem(kvm))
> +               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +#endif
> +
> +       return 0;
> +}
> +
>  typedef unsigned long (kvm_get_memory_attributes_t)(struct kvm *kvm, gfn_t gfn);
>  DECLARE_STATIC_CALL(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 0a4024948711a..ff20e63143642 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2428,16 +2428,6 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
> -static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> -{
> -#ifdef kvm_arch_has_private_mem
> -       if (!kvm || kvm_arch_has_private_mem(kvm))
> -               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> -#endif
> -
> -       return 0;
> -}
> -
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static unsigned long kvm_get_vm_memory_attributes(struct kvm *kvm, gfn_t gfn)
>  {
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
