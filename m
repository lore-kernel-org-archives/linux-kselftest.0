Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C947081F
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178718; cv=pass; b=EwaPoOlpNw+XO+UbB9JpkXEWtYwLcwYB5zHzA4PKYDrVPY1vJQI6ycJAC5eYHWj5G6SzqOptu2KrYPht5zgDVp2yQJv9zYPxgXoR75Mp/nNKvEJgF48EG4ZebRxtueMeG8GVYia5Q+wbWkmIrwK0ntxVEMeqhVqBpkuc1DBo7C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178718; c=relaxed/simple;
	bh=9Gtd+5W8SMTR25ZmPIeA+8FPrVOqTlN7XkJgDdQpNlk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIqW1t6ZaQme5wOUnaBm8XMglKb1JQSxQ1fA34Zx8PAC514V3PD/abk1sdBPYRuokoeCgfiZtcXK67XDR4pgdj8V101zklYGIhz3uWeiqvu2Tmtu/eG4JYuP9gSWKcOYC5ap3Emie1aaaufLOoxW2NPHm3E1a8crSAcWNllmaxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9cxe9a7; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9cxe9a7"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso2126396e0c.0
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 11:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778178716; cv=none;
        d=google.com; s=arc-20240605;
        b=DvaWvJPY4ozJmlGwcIU3e9TkEAmmRS8V7CSFGHYV0OL6G053aqKTrh8ndtJfS617p2
         7FVUGLBXRyBLbVyItmyxkWq7S/HNN6meBE6zM1KWFj8LhYoNChSbljP8pyeAr+oUySKc
         Ej6b6/NCCYhmh+V1UUhRJXow+8ABhdiGFsBLZ1CoHC8A1QI5vau/s029ZzT741nSu9NE
         ZPHde1/H7gwwSbW/zfEXgfX73/gV/2qAJeebhaLMTOsoUE/izf7QTn5xsbFT9Id3r+Pp
         6HmWgBnHORcp53FLHzvbrZKCp3OvXP9bjY1u+4JUuJHzIHh0DEHvLS4qDkgnmA78EDP1
         SLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        fh=HeAT9Zrfw9JZtdgb3hAm/t7qh/4rPtIFdEuHcGuEPfc=;
        b=DJc4U+Kk3UAma8lXN/gXyGayf0e41aPyLlBCnyp5puZv8uaGZWS/g5MW19MIqM8SId
         zw4JnDAvFXKrtgO2p4OfV+j2RZkm0JflHs85JBcTJkc9c36SsxT3ThCCHH7AviZJHfBP
         +OmNHtRUrrMooI3rhFRTgHs9eI96/t5rUnAPDtdrIYaTO1nVG7D300IjxsE7gEf5QYWz
         DHelu700PzhVKK2GPthrqI5RZLz4MaIED5JY2G5CIJ/FFHlxiWD/lc3o4Sg++Ki6eFjz
         FM9fJjMngwgm7PyBPVt+YCJm1I7NYwHxBLB94gOJZFF0jRdqOBSj/5Hwp19JgtsW6OZC
         0/JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778178716; x=1778783516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=Y9cxe9a7HFizfWlIgAijSTg+sNOKPTCIfD5vBOU8y8Mz/QzE/FeerqQ/A2UvBuNAw2
         SBJCjy2e9x+XrkotisFuXDN1fRpLDdslnUKMz7KTp+mWIp5ZjnvluGkicFwv0WLNLI5k
         W521Q4uM1HXHMZDeGy4rTjT3wadbifQg1CiGsO9Sg+r07nzPaM9y1jf99mIjsHCP/qlx
         eAQwh3MNgEfls42ChDhMIMwg1OxbbKaY/0UCXoxdsH1YSSv+/YKUdiT/XB1WlHklBfW2
         gwgP37FB3EkaYPkfJ/o0nlF6PrzisFdCh5IOg1DrZctdmHN1lrUn6ml/EJIZzIjwRbAG
         6MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778178716; x=1778783516;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=SxtHIu88C3UjF5Oa1+QFPMuXVRioilQwwnxftoQYU68FhJ4y2/9hxcg+O0hGcXHrop
         XnKaArmlDuGRl/oPRMskmnd3vAbTGxDxqK7vx5orY3OH27CeiSElrLPgp6JIuIjPximI
         I1wGlu/wHeIUh6LxFLArT1K6yywO4aSQMuvoNeKofz9WjdemTZZVxPlhJ+43X/MY2fz6
         jcH46R4KrzbNdwglCf4UYBXeB4RMiZ4jUN6FctA3rraS+kjZ+wfTcT2eu7aLhYEY44yq
         zrO42p30dKAXyttTAVybATnR8C70jeugcbd2iksX00WAaYpQCUndSJiKOb5O0y0AnqTy
         ZeMA==
X-Forwarded-Encrypted: i=1; AFNElJ+vyxtHlBZ4NEcweH2ejtxEUYMelrxT4g/HbzWKDLqFFvDAgbh6wPVFL7rEZvqId6EmkKmVeJtqNLIjtej+D28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYHpIEywqG9YUsybScH1jk7DbBnj5Eh5OeWyRwxldERf6jkhc
	y0v6bHczYcgGoI3fVF+AoB+J/7uD+BnRpczbCHpP5G4Ba6IPAk9JGYtTYjYswYXIVfKV17YSDD6
	pMx1cfriT79NuAIxYP2ihylPSEdHMyQdu9oE0In1r
X-Gm-Gg: AeBDies7OPVQQsR7bDbvRAl/h6890fU6Z8i4EGoFsfjDPna2Ti5F+B70GZmt0Yi7vpQ
	KInylIiAX3Prf4d1f+aoljIRfscsqh1GxO+QknmX2kM5NbOH++Vp/ScO9tPxO7/3qg9H4uJXs/d
	tzuyBzYor4bU3giG2F7Be0xunWnWAIqiHM94clp9mJAoLtDMsCKsgzL4dbIr5b2a3ovKVc1JXNU
	cNdsG6wlsTUwOI35+apuqpF9gB5DRouz+aXp+5+GpCfG8H4/MFg4wHHMDPCIpOrfTjpt7vmdSd7
	8BeQhZNxFy+MFLAHdYCArhQn76lgpOaSsVjA/UygHsasu+/56cE1hNfq6c2x6nR0erxnH+N7KqW
	SNpt9
X-Received: by 2002:a05:6122:6304:b0:56b:a7de:7129 with SMTP id
 71dfb90a1353d-575702cc825mr1528185e0c.7.1778178715530; Thu, 07 May 2026
 11:31:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-1-d8608ccfca22@google.com> <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 7 May 2026 11:31:54 -0700
X-Gm-Features: AVHnY4IrLeBlt83AneVyVg35mAkmDcan1kch_gmoyAe0Nsgg7IVb__9uDe3mtms
Message-ID: <CAEvNRgFGc7SRy_hkfSH3X=Cu00CP6wMHBJO0+55uebKTezWVnw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 01/53] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

"Liam R. Howlett" <liam@infradead.org> writes:

>
> [...snip...]
>
>> +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> +	void *entry = mtree_load(mt, index);
>> +
>> +	/*
>> +	 * The lock _must_ be held for lookups, as some maple tree operations,
>> +	 * e.g. append, are unsafe (return inaccurate information) with respect
>> +	 * to concurrent RCU-protected lookups.
>> +	 */
>
> Can you please elaborate how you see inaccurate information and which
> information is inaccurate?
>
> Your comment is incorrect and misleading as append will not be used in
> rcu mode.  Note that you have not set this tree up in rcu mode.
>

My bad. Thanks for clarifying about usage of rcu mode.

>> +	lockdep_assert(mt_lock_is_held(mt));
>> +

In the next revision I'll remove this lockdep and use RCU mode, and
kvm_gmem_get_memory_attributes() should get a stable result.

The other lookups using mt_for_each() in kvm_gmem_range_has_attributes()
and kvm_gmem_get_invalidate_filter() retain the lockdep since those
operate over multiple ranges. Those are called from paths that require
holding the lock to exclude other operations anyway, so the lockdep
requirement does not cost anything more.

>> +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>> +}
>> +
>>
>> [...snip...]
>>
