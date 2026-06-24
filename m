Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BA33F589
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323193; cv=pass; b=htUvKQmxf/Xq6Akh6UU4bLfaLJq+/I93SxPLEszhFo3EkDwrGvEEYh5l8XceMzUFEQ8mK4aX+hi7bls2ppgtbIsivcB8ejidM9OnNZFw1Nu6IkpUqCCEX4vA68ht22j7/R9ONN2x1MYHCQAiCoUgUg7s05w8Irgb9tRimB37rHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323193; c=relaxed/simple;
	bh=vCq390Phe629A05xURRWOGGQ0yb4i2q+x5ST7PsW5xA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyTvsI1u6nS7zI7uveKeJaIdWthR8UwtEmMhh9jBXfKzwMq20wDCn6oalzh4SvUZnC8QAKoTBdfc1xXWhHmGUs3BVWCPrHI4qJtLhJCgJnBAuAfox+JtK30Tg10sgtV1L5sb2c1JP8MMm2FoAH7mGAorDlSW0hQA9j1nNpwDRc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L9b5eeDD; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L9b5eeDD"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1397e093f90so3667019c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 10:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782323191; cv=none;
        d=google.com; s=arc-20240605;
        b=OAcTa6hN8TX9ha43h7HH6me/pti4w42UPnE4/m7kX7Nb2B/XlH4kjyHZ2sM1Fd3aYR
         uO/AX1+faeEHUr0WbY840YXaTyQDosZRAtuEBjKKyQyfjW7H8hSwhfFx8cPddXmR68cw
         uoQsgIDkOdjB0QLRG+tN6qbjaQqVw3ndGM+SSefbRrz/dbknKmR8Wjj6zTo1CC9CN2z7
         ZKAwzSS/PbPJvsqNc2LXaaL5kr+SgBkqmiNo+5wUqwIi16zRThlwYMiQ3LYKAY/dDgKW
         7jF7l7uq+ZYGVEluA5Cg/iP7I+7k+8flAz2x12r+8SXTA2DGP2ma9qbj5vkXvrFMnZzb
         JEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Mqx7OyqbEK6iUTPEaB+Dm1Nc+76HebeZ2yhpFRHkMNY=;
        fh=mmc8rdjFc42Qlyw6fgNVLw6ZYaa5UvlU8HNbr4MREok=;
        b=f76YYxUAkIhyQ6a0kY6XRy2c6jpnN6KHpQE95xfuarROv7kxQi8xF4X/GL11WN+uD+
         LC9RcbvBERA+D0n+8kLwHiuA6CmlUOv9NMiBr9j/iI6h3gC/8YO4LFbLTzXW1laYW1yV
         areJZbZYaFpROeIw0Wobd+CreQNLUQc8eQUAIurINlU6CZMXeUJ170e4aEDvC+zl+OzM
         vQ0VNnqGTANJn++YcXZ5hytGdwsCv0tN0J6+PIUkS6e0eXlHcDNzVYzFmotDqstwPvnT
         qIq454AU8TVTNHHQK294J/HhDgXNkn4nB6Yuk9y19Id5UOnJkd4oqMXwU/cxXpS5wF1K
         5j7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782323191; x=1782927991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqx7OyqbEK6iUTPEaB+Dm1Nc+76HebeZ2yhpFRHkMNY=;
        b=L9b5eeDDwnekFpAvyBK91cxIbaTW5LZWaIdMHnBWiyiWfC1uR3ZU5IctyGFpkQMk+H
         1hVp6aBQlgkkyXX6Tgke0A5cNdalP1qwlNap7Jip+HN1vznw7gtfHEQ0NX7b/7ZGNO7Y
         PvaQ0KQEKWgBjlI8+RE18RGMwkSscaFcjIegUa+ZXmq9A7bvI1jPjkW5t/ZrG7hZ3Nxg
         Odh3IKWzUeXZObykhACnh2r+69172ZGMq8fikAkf84fAUcsjlYv9+IiZvGVgfdEWD9rK
         YGhRxeASD+cUG3oDeuaA7wHPeQRVx94amtcPrFQo8k6gzFXzsO7R8SoqU8Nmfuwyyyrx
         6JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323191; x=1782927991;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqx7OyqbEK6iUTPEaB+Dm1Nc+76HebeZ2yhpFRHkMNY=;
        b=RRlfxg033Gj52o+ryn4PUrTmu8zouao0o/nrO4cmdNVnAh69cTFtoqJVbP56SwqCpo
         eF0b0OXLPo0yJW8aenJm+gXW3qq7wY8tpUOscHWgwWDm2vGqSyek2JyvozAvocsHDOFr
         wjyXFG1s8FF4D7dkHHKVsGzc6sXvTpQgdxABsUHr6DYYqVIgTg8gMhO5HQ8Q8TooROVZ
         cuLrbFH0beurWCEsjoj3XWjqkMfyvEsRPovDIsqjy5Ht9SrwOn52tXwTfs2vJvEVQ162
         DEPTzzHUWmjQqqgG3H3Tkp233VNMbeNdK8arGKpkoM1C2gMWAa4YcSxx9A0lu7bUgYO4
         NZ8g==
X-Forwarded-Encrypted: i=1; AFNElJ/aMRc0QsDwrYumAg3xpB1fHzhr7umteL9F7xqw0YKg9rtFFTUCo9N7mE1OMFd6LdtgorLMtk1Pe1/hbeKGS24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWoV3Qmj70K7lngbTHodyqfnlinQ3OCX06ToXs76WHoIL5lXBV
	uXn5DI8qY4L8ENhCygKhy4gVVbSere+lYEJNYrBbjN67zAXggSKFWrB3HvfR4O7pQ9mIwyBaeGF
	redLpncA0yJkDeiVMUfmdMgAO/1xq91jIO7+Yhr8B
X-Gm-Gg: AfdE7clscekvfab0Ggb694eomV9dsAYOHk/zhHmBfYPsqWIjuqRDjXKy/zppal7yvgQ
	G/wgchrv9ElOz2voBGGYXsSBQvvhf/xo5tQKpcsqllmoIaCFQ4lVytYfLIR5My2egaYeXQztOaH
	bZNm3lI5s3W+a0F+Vt3Qd/tRTGmeRROfSaD3SebR1lJM+GVX/mC3ShxmzrQ8fmSp9pRXD169GoI
	+2s1hnGrBimlxYUjyRTNI9XGoonbqu/7/tWS+3wObDGWWNSUfZAXIjb8/9msBDj7CffNWIlv31P
	CtUONVLfptnlBRlm1Cj+K4k2UvwvfOedPyo9Ea6uHr5j/Lv+SuUGJ0N+Yrk=
X-Received: by 2002:a05:7022:ec6:b0:136:c24a:7213 with SMTP id
 a92af1059eb24-139d0c1d9cbmr3442157c88.11.1782323189975; Wed, 24 Jun 2026
 10:46:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 10:46:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 10:46:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajneQVLriUshjFIO@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
 <CA+EHjTx+3U++dnhGEkwh2SO82xMugAvvJ9ee1O__sxZCKL_X5A@mail.gmail.com> <ajneQVLriUshjFIO@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 10:46:28 -0700
X-Gm-Features: AVVi8CfZZdJUtw5fyaSnXyT_Umcz85ZtFZhHHk4S7sCQCvBEuiIkAR9ZBXOQWWM
Message-ID: <CAEvNRgGX3GkazCWM=6y9YLgn=YemXuG==Oo+L58cac1Fd86_TQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/46] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 19, 2026, Fuad Tabba wrote:
>> On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>> >
>> > From: Ackerley Tng <ackerleytng@google.com>
>> >
>> > When memory in guest_memfd is converted from private to shared, the
>> > platform-specific state associated with the guest-private pages must be
>> > invalidated or cleaned up.
>> >
>> > Iterate over the folios in the affected range and call the
>> > kvm_arch_gmem_invalidate() hook for each PFN range. This allows
>> > architectures to perform necessary teardown, such as updating hardware
>> > metadata or encryption states, before the pages are transitioned to the
>> > shared state.
>> >
>> > Invoke this helper after indicating to KVM's mmu code that an invalidation
>> > is in progress to stop in-flight page faults from succeeding.
>> >
>> > Reviewed-by: Fuad Tabba <tabba@google.com>
>> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>
>> Coming back to this after working through the arm64/pKVM side. My
>> Reviewed-by here is from the previous round and the patch hasn't
>> changed, but I missed an implication for arm64.
>>
>> kvm_arch_gmem_invalidate() is now called from two paths with the same
>> (start, end) signature: folio teardown (kvm_gmem_free_folio) and
>> private->shared conversion (here). For SNP/TDX that's fine, conversion is
>> destructive anyway. For pKVM the two need opposite content semantics:
>> conversion must preserve the page in place (same physical page, the point
>> of in-place conversion without encryption), while teardown must scrub it
>> before returning it to the host.
>>
>> The hook gets only a pfn range with no indication of which caller it's
>> serving, so arm64 can't give the two paths the behaviour they need. It
>> would help to signal intent on the conversion path: a reason/flag, a
>> separate hook, or not routing non-destructive conversion through the
>> teardown hook.
>>
>> arm64 isn't here yet, so this isn't urgent, but the hook is gaining a
>> second caller now, and it's cheaper to leave room for the distinction
>> than to change a generic contract other arches depend on later.
>
> Crud.  It may not be urgent for arm64, but it's urgent for other reasons that
> I "can't" describe in detail at the moment, and even if that weren't the case, I
> think we should clean things up now.  More below.
>
>> >  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 41 insertions(+)
>> >
>> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> > index 433f79047b9d1..3c94442bc8131 100644
>> > --- a/virt/kvm/guest_memfd.c
>> > +++ b/virt/kvm/guest_memfd.c
>> > @@ -607,6 +607,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>> >         return safe;
>> >  }
>> >
>> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
>> > +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>
> Not your fault, but kvm_arch_gmem_invalidate() is badly misnamed.  It's not
> "invalidating" anything, it's much more of a "free" callback, as SNP uses it to
> put physical pages back into a shared state when a maybe-private folio is freed.
>
> As Fuad points out, (ab)using that hook for the private=>shared conversion case
> "works", but not broadly.  And it makes the bad name worse, because it's called
> from code that _is_ doing true invalidations.  For pKVM, it may not even need to
> do anything invalidation-like.
>

Thanks, I also didn't like the naming of kvm_gmem_invalidate(),
especially when conversions also calls
kvm_gmem_invalidate_{start,end}() and those do different things.

> To avoid a conflict with patches that are going to have priority over this series,
> to set the stage for arm64 support, and to avoid avoid bleeding vendor details
> into guest_memfd, as if they are core guest_memfd behavior (only SNP needs the
> "invalidation" on this specific transition), I think we should add an arch hook
> to do conversions straightaway.
>
> Unless there's a clever option I'm missing, it'll mean adding yet another
> HAVE_KVM_ARCH_GMEM_XXX flag?  Hmm, especially because IIUC, arm64/pKVM doesn't
> need a callback for this case, only the free_folio case.
>
>> > +{
>> > +       struct folio_batch fbatch;
>> > +       pgoff_t next = start;
>> > +       int i;
>> > +
>> > +       folio_batch_init(&fbatch);
>> > +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
>> > +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> > +                       struct folio *folio = fbatch.folios[i];
>> > +                       pgoff_t start_index, end_index;
>> > +                       kvm_pfn_t start_pfn, end_pfn;
>> > +
>> > +                       start_index = max(start, folio->index);
>> > +                       end_index = min(end, folio_next_index(folio));
>> > +                       /*
>> > +                        * end_index is either in folio or points to
>> > +                        * the first page of the next folio. Hence,
>> > +                        * all pages in range [start_index, end_index)
>> > +                        * are contiguous.
>> > +                        */
>> > +                       start_pfn = folio_file_pfn(folio, start_index);
>> > +                       end_pfn = start_pfn + end_index - start_index;
>> > +
>> > +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
>> > +               }
>> > +
>> > +               folio_batch_release(&fbatch);
>> > +               cond_resched();
>> > +       }
>> > +}
>> > +#else
>> > +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
>> > +#endif
>> > +
>> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >                                      size_t nr_pages, uint64_t attrs,
>> >                                      pgoff_t *err_index)
>> > @@ -647,7 +683,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >          */
>> >
>> >         kvm_gmem_invalidate_start(inode, start, end);
>> > +
>> > +       if (!to_private)
>> > +               kvm_gmem_invalidate(inode, start, end);
>
> E.g. instead make this something like this?
>
> 	kvm_gmem_set_pfn_attributes(...)
>
> Hrm, though that wastes folio lookups in the to_private case.  So maybe just this,
> assuming pKVM doesn't need to take additional action on conversions?
>
> 	if (!to_private)
> 		kvm_gmem_make_shared(...)
>
> Actually, if we do that, then we don't need a separate arch hook, just a separate
> config.  It'll still bleed SNP details into guest_memfd, but it'll at least be
> done in a way that's more explicitly arch specific (and it's no different than
> what we already do for PREPARE...).
>

pKVM needs some arch guest_memfd lifecycle functions that

+ for conversion, doesn't do anything,
+ for teardown, resets page state (IIUC it'll be reset to
  PKVM_PAGE_OWNED (by the host))

So I think we need different functions for those two stages in the
lifecycle of a page with guest_memfd? What if we have

CONFIG_HAVE_KVM_ARCH_GMEM_SET_PFN_ATTRIBUTES, which gates

+ kvm_gmem_should_set_pfn_attributes(attributes) and
  .gmem_should_set_pfn_attributes
+ kvm_gmem_set_pfn_attributes(start_pfn, end_pfn, attributes) and
  .gmem_set_pfn_attributes

CONFIG_HAVE_KVM_ARCH_GMEM_TEARDOWN, which gates

+ kvm_gmem_teardown() and .gmem_teardown

SNP:

+ .gmem_should_set_pfn_attributes = sev_gmem_should_set_pfn_attributes,
  and sev_gmem_should_set_pfn_attributes returns !is_private
+ Rename .gmem_invalidate and sev_gmem_invalidate to *set_pfn_attributes
+ .gmem_teardown = sev_gmem_set_pfn_attributes

TDX:

+ Disable CONFIG_HAVE_KVM_ARCH_GMEM_SET_PFN_ATTRIBUTES
+ Disable CONFIG_HAVE_KVM_ARCH_GMEM_TEARDOWN

pKVM:

+ Disable CONFIG_HAVE_KVM_ARCH_GMEM_SET_PFN_ATTRIBUTES
+ .gmem_teardown = pkvm_gmem_set_pfn_attributes

Suzuki, does this work for ARM CCA?

This way,

+ The if (is_private) check doesn't leak SNP details into guest_memfd
+ .gmem_make_shared doesn't stick out without a .gmem_make_private
+ .gmem_set_pfn_attributes, .gmem_prepare and .gmem_teardown are aligned
  conceptually as lifecycle hooks

+ I think the private/shared check for prepare can also be folded into
  preparation.
    + Preparation perhaps doesn't need a should_prepare equivalent since
      there's no iteration and getting the gfn is just doing some math?
    + In another patch series?

> E.g. this?  There will still be a looming rename conflict, but that's easy enough
> to handle.
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index 9ce5be7843f2..8aead0abd788 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -648,8 +648,8 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> -static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
> +#ifdef CONFIG_KVM_ARCH_GMEM_FREE_ON_SHARED_CONVERSION
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end)
>  {
>         struct folio_batch fbatch;
>         pgoff_t next = start;
> @@ -681,7 +681,7 @@ static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>         }
>  }
>  #else
> -static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end) { }
>  #endif
>
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> @@ -729,7 +729,7 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>         kvm_gmem_invalidate_start(inode, start, end);
>
>         if (!to_private)
> -               kvm_gmem_invalidate(inode, start, end);
> +               kvm_gmem_make_shared(inode, start, end);
>
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
