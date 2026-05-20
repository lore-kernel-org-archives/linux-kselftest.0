Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E43340A6A
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308754; cv=pass; b=Qz9sxE8oL2G3k/aPhRbY5pM+9AjmjkECbdhZnbklchiaXWrUkJKvsZ8E6jPXVcxnW258UiY4nbMweRO7/S2KHDrRIE1gAio0/5a8lcpPaCXAn4AG7Emq9PYwzCQQB5AMbQFssNNzHKbJ99em2aJGZCHyHDzRE2WTJVvb+R2btg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308754; c=relaxed/simple;
	bh=0y54nFg7E7TaoQP1DdnZ3Kd8izilERRAcK4RB5V7BZY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYQn5/Dz45visUwNv3fVRaQFFtIPfDpo6VczzuJLjrIsm39kRabTOeMt0KS7fRdhXpDMalfVyY0LsifCR/ezL926Xv2eOzQRENNA9KNOXbVp0jsEbmTHgxk/wWF4HTI98G/x8BzxAtqBpfymYV7AGaUvQS4ZT835AS9LJSpboAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XwbOvfxx; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XwbOvfxx"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95ce7b777ccso3386200241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 13:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779308752; cv=none;
        d=google.com; s=arc-20240605;
        b=LLa5xGxbFNpFrBzec+rNClNWZ+Tih6jo7OqWfbz9khylTUpvYGd47cvr7JZOTuPRoh
         Kki4vr71IbjJBtqggQv3yYLw6kZrhD2ZDWo5fzqpnUrEbNR/mJ1MvurUkYS4mjLShrm6
         5HrwzBpN7yK4vsmhvU9JYnU9FPunNjNd/ZQLDC09c/6ba2BchuXOHTFOpfUj+0Ogqr1P
         t9WzI4K75jOUemzYmTj8UHJFeF12TtZ3S6Kxqc+zx/rn0GgRqTqXNxv/7OU0Lqyip/ia
         3+AC8bN6MJwlQinQRv+WYfTOks66S3dh9flgwRzCRvlBuQiQs5xGlHR9RZbx4YSDgsw3
         CWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        fh=6nSjNvsNjI/vayMumdhrFVs9kVE7Z1CutkvRE3LPcIw=;
        b=XjKhXjiaLbNe2WNOKnAyyVwd39j9K8vSTocQojyAOMz+htL5kctakju+qxsMjxbwAb
         id7G96BS1af8sW1BRWXjxIoxrxuBFftY/E0SKqCEjw7Ll14LTwiUPzyQzYToUMS0eOk3
         xojL23pQbPL/ueRu4qWHcKqdVsnUkuvoXYKxrNbp8pHm9uohpHAs1Fnxuoh46VdAOcfv
         NsfrZPdjao1kJLY066da3Gld1hZ3zD9x/VIyfSEaQYnYX/SLF+2dkoaglUp172FE4Yb3
         EV79lfRq6GjHmBcLKmBsm5QFEZ5s9Xqupb+i3Pv1qmDqiCd0bNxmmao8dVqhBfqHtm5Z
         j4uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779308752; x=1779913552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=XwbOvfxxojNTaZZg5xc85ejdAJLXOGIhj/ihtMbe8SNH7QL1VPADFRhf2ZTOAtHqFV
         4k7u1P39PnV25R6VstbsKpEE4wyX0JhVZqvNJ8buaI6G2q2H87BuGLzAO2nbgYCxH5Ft
         GnRlujwb7rxQbKACZqw87Jpo8dHQ7+08omse+HqQur9nmbbQbcYBGsu6Lt95kx29nZ8H
         oiskX7kcTOn14ZXsouLohobxRDb0u/MaDuHoHkfQpRcCjf3Xaun8eVFfJz7WA98ch44F
         epcFLiYRTMix2UmAxWj2gy1brAg77X3TksdbyI3HnBAOQPRug4fxELrHdLfrSuRtRNJl
         7tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779308752; x=1779913552;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=rO88uID/hBsYukGoY2D3/XupSln66MMS4rlH4kTeL/LH4zeVfU8JFbEFQqR42gzD9O
         iyhwCPcqmzw4VgP2TEInrTsckBTPANJtmOA+7JFHuByX6TbLt9fs+UoWi8EXtW1K6eDp
         3AjA5Ry5V7/KZKqXZwPLxHTKvD51FAs0RcywSHCdZVKLQZG0ah3ahT7b5FuSxeHq8D1H
         uuCLbgnl3Dgs6Qsa97iJabenrCqfac9A/KwK4kWEO3jTn2Ql/PLwWR9spAnIwgcGgUhe
         KtoE3yEAS5JlXa6C9NiJb2EVImCeQ8B29TkJPlKT1j+8RNbrM8fm78YSbuT+XklN7vnD
         UDsg==
X-Forwarded-Encrypted: i=1; AFNElJ8LMtXjr9qTbH1c9AgZme8PNtyorYFiHoLFvEGHEIDC5HzXNN8hVv67N6OHuo2DCo+24vpFsG3G5dOXLZT588A=@vger.kernel.org
X-Gm-Message-State: AOJu0YziDI9hw5V2Isej8lz4hNYgszYaelU7j7Yt1iJ8xsjQF4LDtbx2
	c7akbDy4QCZZu2jQSLzrsZeCOUw8yp6BKSVTzf7Zg7uPe6066U7u/s9jbczGcbcnekwOL3lZdo9
	UULaGwtkIw3n2fmed74KNu/sMBg5RAFHCtDhyWWz5
X-Gm-Gg: Acq92OFEC6TRy+7/zOuxpPDdTzUTpJU8Z/4ENfHiR5ZHWTgKo6FuLofL5OneJHqfahH
	ZireAwBralpUzM+6LomOlAqJ17c6HapU4vjaCRSDdMPBbl9Y+k2p8BUx5Cj3U0S8g5N+A7pSfZu
	bgy4S1mPrWWttI5StvrnS4aExtSWOUXeaOt7LGsAZfKbpv6GypkHzxVhgdkrWXO+IjHQXjEjtlW
	OzMPGy1cPHmz8KRPb6i8ctbuzHWOgrzNh5w1iD/xjL/BeIwRWPEaGfv80ya0Omdb4QZTz9z0oGu
	zemrnLSWDFwtgZidqiEupuDr3v6/0tQOeZP/Kp1erVSAseCVEXGe4C05dMNOUlAue49FhhCOhnG
	YG7MJ
X-Received: by 2002:a05:6102:2583:10b0:631:a34d:b671 with SMTP id
 ada2fe7eead31-673bf885fcfmr10043137.5.1779308751281; Wed, 20 May 2026
 13:25:51 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag3DawWCcrpCkD0e@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
 <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com> <ag3DawWCcrpCkD0e@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 13:25:50 -0700
X-Gm-Features: AVHnY4IBlIN9DzOr96NZ1ZZdFo1tnLv8pC5ZAKQh-hjUOng4U7q5IXabnxVwwpI
Message-ID: <CAEvNRgGHHkvfJ-mn9rfDvS+_1ht08YatFWo-Swt+5wFSPnC9Nw@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> > @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>> >                 max_level = fault->max_level;
>> >                 is_private = fault->is_private;
>> >         } else {
>> > +               /*
>> > +                * Memory attributes cannot be obtained from guest_memfd while
>> > +                * the MMU lock is held.
>> > +                */
>> > +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
>> > +                              kvm_gmem_get_memory_attributes, kvm)) {
>> > +                       return 0;
>> > +               }
>> > +
>>
>> This directly takes the address of kvm_gmem_get_memory_attributes,
>> which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
>> ARCH=i386.
>
> And this bleeds guest_memfd implementation details into places they don't belong.
> The right way to deal with this is to use lockdep_assert_not_held() in whatever
> code mustn't run with mmu_lock held.  E.g.
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index c9f155c2dc5c..3bea9c1137ef 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -547,6 +547,9 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>         struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>         struct inode *inode;
>
> +       /* Comment goes here. */
> +       lockdep_assert_not_held(&kvm->mmu_lock);
> +
>         /*
>          * If this gfn has no associated memslot, there's no chance of the gfn
>          * being backed by private memory, since guest_memfd must be used for
>
> But I'm confused, because kvm_gmem_get_memory_attributes() doesn't actually take
> filemap_invalidate_lock(), so what exactly is the problem?
>

Ahh I can drop this patch now. kvm_gmem_get_memory_attributes() used to
take the filemap_invalidate_lock(), but after Liam pointed out that
the attributes maple tree should be using MT_FLAGS_USE_RCU, I stopped
taking filemap_invalidate_lock() and forgot to undo this.

I'll wait a bit for more reviews and then put out another revision
without this patch.

>> >                 max_level = PG_LEVEL_NUM;
>> >                 is_private = kvm_mem_is_private(kvm, gfn);
>> >         }
>> >
>> > --
>> > 2.54.0.563.g4f69b47b94-goog
>> >
>> >
