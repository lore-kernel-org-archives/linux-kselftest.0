Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043256853B
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967522; cv=pass; b=HeAzmf4LkXo6pmAQHxiMsgs5YRwY+sz7W70hjmBNcWGL0CSfK9HuOFID3805ztHA8l3NRVp5n6lTJ+i00rY1HYqKI0k/+mhUN566YOlOidCiX0L2nuRte15vml5kMVdIp43c/WHTsgENFyJW5uWL8BkqcW59mZDJSg5T5hFbqa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967522; c=relaxed/simple;
	bh=uTvLvNOiD2VaPyg22uQpYQwhoB6nWQlo6kn+/rYg9tw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdHob9cktfrtf4ye5BHiux7nzxqmyhxrBguzglWsqE681O6/0UD+zBMpUxQPTt+Sry/+AIoMhGwiZ9Nt0hU1PZVH8T2o5YK9VPg1YQeWhMH7V9B7p2bPs2jaF67dbsCTE5KzLZTS8XO4tbT+iV/bDoentQizs6/o7VExWAqGpAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWGxi4+l; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWGxi4+l"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-871c8a36fe3so68235617b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967520; cv=none;
        d=google.com; s=arc-20260327;
        b=PkF70eXY9+M72Uk3exOCNHsYulF65hy3tPTb1hDuC+HwNBuQa/zPnJuo8OrWXifaJm
         b10jgf2JGpBpYTjc4gx8tkb3ds/pNKTDQ09XpzEoUp0q2XwAp3XDUnuWPkT99McRC0wF
         685llYNZYV77ijCBqf1JgfSAd2g0VC42H6eYze6wTKN4isrEgtTQPqAtO78Ocg4W7IYX
         tm13c6XgAJowb1yfLN3OWEatYVNLcRoNqVT6t6LsdaXIOcM7K4FBJM5lS8vQkmZ0lEqv
         Ez9IGcsZi2umfepbgsNiBTGCA2M82v/NSFW7/oIGQSKayN7V315B2iVh6T/07UJ21e/g
         mQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        fh=fKxlTqfCroewFQT59io8uLKh7+A7GV+U4FveO/Qlp8E=;
        b=dNeeY7M1Bofq1h+JQfE2biXQU8ZIZF9gx6iN83pUYWHgH1oOf59edfv9Dv8wgZ/gYV
         i5Dn6iS39gajdEX3eAlqICUdftd5EPiZITOMAEReN0gX6L5Bf/S2rVPsXW0wqmwcWKxv
         q0hSPDWIUhN5P+TBqQLWPstLVzHSsBoqvIZnvv4QkPRoh1EGcR1qqQXiKQ8/H7ieOY3K
         bKM2rBuuCgyyiaHuHFnStkRLU4loto4jM6g4rQfFu2HYgwGLkQGCWtjVto2EutNRl8j0
         Merxprx9h3B1nb5GqrAnrTVNpttak9nhkqGpFzLtRokOJogoop7HjuwNIbAvjsNKsUs5
         Z+TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967520; x=1789572320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=RWGxi4+l5Cws4SFBhyNBgN2rFBHxmaxLWMrmyyZmD3JtS10IR3RUc7Gr98Jo/elm7I
         55ELv6Ef9Qq4Opc0Qc2GFDnU2OAdCkh2UlLN4NzMNJCN/t4vCaRmF0jrEUtJrFCXWi6Y
         N73zfAqP4/tLfluPAC8hHPMqUAwDywdNwqYB1WlPUQBdJTUvGN6jpeHr/eawNaBNRjhk
         MVZ0idlk4IZivD1Cg2jWvIYhyZByOzYvsMplov25jOi1/1u3tDEEs1iM5I0w4o6GkPFe
         Cur6YqY1HxeSvlA6EZnyevxos/F9kmfQX+RrieN3itAafB3dY4NPpJ6Q62sQQM9GWjkf
         AsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967520; x=1789572320;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=ec6oJG6rHZaqQdGzDzhshMAQgO+PCpLK1xYJx0i3hRz+l7v0icZ7bMDapiefbam+0E
         LWzWZuLwPo4mipqNIJDB9gD/wApwclwfqup8f0FPzi6IBvd7UC47zEMiW8c9wN5GI4Hh
         dGjbvJ4SEkxj0td0aHuwnBLYGq5+JtE/GUxUrQzaa/rmczKuIkltb/a/01QDN9nqvMnS
         gJyIewKq16ej6p4mUldN4crPtKAQzufjMeVlh3V4eJZXf6IT7Clh2hG4LYvWJ1gxG2Ym
         g+IKvQSXqH5t09BZGevW13Pxxr6j+2kledrWqpolx7N2WsyRILVdmhV3Fee0hahrY/7r
         7lCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMHU3F8fpG53+jNd3ndP0JnSk7guS1Yn+p130gJvxqbEretfKOaSy/ZzBINK7UVSXTj4sYU1VrHrYPzFrZtFk=@vger.kernel.org
X-Gm-Message-State: AFuF++mxsUh0jj0uXVc2FJcTQJYICap5G5FBmSsFahfjEd/n1MDZK7uy
	H/GxNf0gmsiwf/RPmiyTXIBuh6nisAY8Blz8PdCOKBbcDROk2nO7ACJB4IsGtKdb2T3sYHourSu
	BGn3VR4YxNK0YFXfoBdGub7S9vQOs796DtpenCdd2
X-Gm-Gg: AYBFou0FDwMsqpHxLO6Qtn+pdA/hSRjZDfgerIN8RPFLD0yKeUQzhheF4Z50GuUySAc
	cXvndjX16OhuCr2HyPKsFlisa49SQ1b2HfHXrZUQkBKet7NDhDW2C4PRKXmixiL9HOCaijDlanI
	e6oz/rSeWrt+Ad2rpTwAOhXX6rxt/kXoD+VnwLU4yk1Ei8EHBxIVr6HcF1NH9NGM3X2mNCYJS4t
	J2OEGKLasKkHTv+2ZTzoOATKDlrMOlb0xPRe4Cu7w0YvZqYAHFdVX03w1kTvUvAJLY4NUnqRDbG
	mQbetoXy0F/IasJEsYG03Ezd/0gHwYkOi6lUqhlqU6npPk7yDNsEN5/N3KWXhe8msg48rbjwqNY
	Y7g3ae0ROMdGA
X-Received: by 2002:a05:690e:d0c:b0:66c:c7e4:2ff1 with SMTP id
 956f58d0204a3-66fb59519a7mr10665340d50.15.1788967513698; Wed, 09 Sep 2026
 08:25:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com> <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:25:12 -0700
X-Gm-Features: AcwNN1XO0ky4otDKucsugFRBan2HEERm69mRZ8ScY2_txSdjnOuds0rILhuqOBo
Message-ID: <CAEvNRgEkkvk11_atVj9=+OBym-7SbSMB7MpHcoN6-Q5KS3Lb_A@mail.gmail.com>
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
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
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hugh Dickins <hughd@google.com> writes:

>
> [...snip...]
>
>> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>>  			*drained = LRU_CACHE_DRAINED_ALL;
>>  	}
>>  }
>> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>>
>>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>>
>
> I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
> a KVM patchset modifying mm/folio.c there hard to deal with: and notice
> Sean also suggesting to separate this part out.
>
> As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
> and _all()" which finally removes the problem lru_cache_drain_for_folio()
> works around. In the initial version posted a week ago, there was no
> lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
> intended a replacement 13/25 in my series, giving you just an empty
> inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
> in linux/swap.h.
>
> But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
> in mm/folio.c, and of course conflicts with my removals (in context both
> above and below your EXPORT line). It's easy for me to remove what's in
> mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.
>
> I've wasted hours on this, hoping not to trouble either of you; but
> seeing now that I shall have to rebase anyway (an unrelated mlock fix),
> I'm electing to take the only clean way out: I'm going to submit this
> mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
> in the hope that it can be accelerated into 7.3-rc2 (or at least get an
> mm-stable stable base-commit id) which we can both work off independently.
>

Thank you! Will use this in the next revision of this series.

> Whether that's acceptable to Ackerley and to Andrew, I don't know
> (just as we don't know when either of our patchsets will go further),
> but let me try.
>
> Thanks,
> Hugh
