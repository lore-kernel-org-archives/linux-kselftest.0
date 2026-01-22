Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46938E5C0
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099667; cv=pass; b=tzVpImDgTUMJIpaiWSQPqmghmmYkjMhSf3IeQ59bS24aq3SB0ihL8uN6fUSVuToV2Jlhj9qrAL1lVoLQhvnmOwgH97pJtMmv2HXGjKUw204jHc4cqkYWCkt/LoYV8uWkS701DSUBB+AEyoNNjD5MYDZJwq/kQonVOEQuURafrf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099667; c=relaxed/simple;
	bh=ZYIqU7xPcH37zvSybjI3FPpHQTFAEV4LoCN7S8Ljj9w=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn3GjDKUkMJ6dQXr8LSWkhrCsJZXNSh7Vi5NrRzGnAxiVHnmnyL0KdvrrlCZOhRTExfhueZtuj1s/kwWuo5FOfscXlyeqDh1l6BtghG/8pSen+QpsBFX5+CMfXjvhSAK3enDYxd5PmrfV1u7uQpYOc1jWP2FO6hCOz/CTIxPxAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EU5xmGlm; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EU5xmGlm"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f53021703aso419048137.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 08:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769099662; cv=none;
        d=google.com; s=arc-20240605;
        b=i8jTyR8J03cF7bsTBKYLhYCr52FQT5t71YhgfKBQR0p0cREDJMtJe/WEl+ElRgvxt2
         uWc667o+opYVygRae+ejDy3XmLyXFcrC7w66GIcagIcEdg/Gf9QgTbUHpeatveWjTXev
         DUYpVWvmWeYfdP4YsgOrw8ev7yCdO4suJBe8/aV5J/9kSF0SggZ+y1vOIkyffm9o0UgW
         f5Faauddhypwk+fNIzNon/gv7F+mke5OSf3U6xAv5OY5EECcZU19LoRLN6Nh5N+ggg6o
         cD3Un+lJp76sQgptoQ1HGEjkdWWMab3zwecUCEEbtMDRcRjgBA//2+66DWCshDcabC9v
         BZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        fh=wulEBLVVYi/NAmTg5tqw6Syo0dUWv/kcUke1sFzOC5Q=;
        b=T/bG9L2AI8/oVPoDA95ZAP6dX1EX5d94Y6py510X/tnh5dSWbQfWtrSGd6/BNCn6QP
         EJsHsWsIpg/XR+l47zcnIIqsYUDFfcDjCXaQaLV7NCq6F++GYx1yItczdhK9DIidKEYk
         lb/S0WzAlDfkrY7WejDPWlsy12cOLSqTKpMltO8214084sfJF++bI6Ges91Bc/eGpW4z
         4EcgXGxdt7kPthJD5NvtVba5MqPQwbLYXtsIuyJQsDFdIaIUqXCUjcfBJ4biNAFDgAUU
         sDS9RbOH8Ps4NOuCTsAIvZXTH6kaaljhiprBrV6rEBW04bzkh9VkMFBUMp4ipLtipj8T
         ZeBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769099662; x=1769704462; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        b=EU5xmGlmDC+Ko5Fbh04r3YdJaLhYVGOSOyO9DmeQwEHAfDZwRwkt6U+FKqPktNaRYT
         KtF1h0scXhZtiiUdX4d7DLDrHLPKIA/iGqfRzjcOl3FfhUALupCZCoiIYlGtI4vVh1Qs
         qNcZeAnj4Ywg0lL9Nyz6LIPmeZWXnq7gAHb3qsNIgfL1pKBx3XxNGjJRfQ4eGIvox7Kx
         XYwy06ynglLB4ZyaxpMMd+ddRzzwdKWZtwCuZJVecbs7fp09UBVahJlZGesqdP/s4QjQ
         6Y8f4KrqrlMDzennIuPDr7gXaKzHO0wJ1MIlyv/aYuw5pg0i4QrejlGeiNl0L6NrR+s7
         5auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099662; x=1769704462;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        b=IjYYELcne/DzrwqoCqU2YsM5zh/x6K890azldRqAP1LIiTqckko5areJAC351AKVoX
         hh8UeHAa4myfBP7nv9CS3rEGKryPyEXOonNY9fsc5hQfJppKf71xD9Km5wHmQTqb27i0
         64EKtU6El71rggxrsuyvJLbwmuiVq3BzWX6zeAU126pVAP/ephQIlR1l6NF7m8Zlr9Sl
         fT2wKEXq2FCsAwHcmB/rDtb0ioA0jqb/o6hTIp249spXUb+RI5lvINvAej1ndHuIZhsK
         Fsah6E77i7nIEL/3oOtOOr9fo3s0wYgpO9apUx3pGEAdXgCr4yYVNqLab1TD9NqLpuB+
         YG6g==
X-Forwarded-Encrypted: i=1; AJvYcCV4/YGmaDLydavEXcWZ1RMzZP9NSxpCPs5bnau4/xzHwtQEgqWXEAwrRycVJnprwtjio7JxPc5nPNQ7z+l0nDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSciJKfONxvGAH3VWGT+93HB5CINnJqi/3EPFkVwH59kwd/dD+
	CkcMngcxpgQqaT1eLqZtzZ2zbRrbyA3oIekHSgfER2fevt27FC3Nt0knjI3ijP3UIiyvCmNYsq/
	aVI6Kfo+RUij/vBT+FCsog6Tlhy4O9Jx8o81sr9kM
X-Gm-Gg: AZuq6aJkpVMfgqzLqpkMomD7UEIhlbYbTBikKxLFni0bHBno5VtDIC7VaCufE2DsCiV
	mesV7Tf4nM+IVx3AK4xxbsNN06PqiU8Fv/4SpmuN80967L+VgB+rczAWtiwyVEyBCpHEcgFF3yY
	QwPV5xwhnQtR+SnB8XjHztuUyE5DBKNYSbpTZL/3r25Tpd9WnI4zcWVYgad3CrkgEMd8r+YcwBP
	cIg4S0V9xt5rwKQDCm2yT8+vFHya+97wWSBPhfh4qRNpiGXqMhWWzBd9S79ruPMeaCA8C0GEEkB
	jnAj
X-Received: by 2002:a05:6102:c52:b0:5ee:9e4b:a81c with SMTP id
 ada2fe7eead31-5f54bc6d8edmr83779137.22.1769099661387; Thu, 22 Jan 2026
 08:34:21 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:34:20 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:34:20 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com> <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 08:34:20 -0800
X-Gm-Features: AZwV_QgNvHql-EMuz2B4VijAKAK9511fycMrz6pi1d87rdZBUNlP58MQhoc9tIU
Message-ID: <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Nikita Kalyazin <kalyazin@amazon.com> writes:

Was preparing the reply but couldn't get to it before the
meeting. Here's what was also discussed at the guest_memfd biweekly on
2026-01-22:

>
> [...snip...]
>
>>> @@ -423,6 +464,12 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>>                kvm_gmem_mark_prepared(folio);
>>>        }
>>>
>>> +     err = kvm_gmem_folio_zap_direct_map(folio);
>>
>> Perhaps the check for gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP should
>> be done here before making the call to kvm_gmem_folio_zap_direct_map()
>> to make it more obvious that zapping is conditional.
>
> Makes sense to me.
>
>>
>> Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
>> this call can be completely removed by the compiler if it wasn't
>> compiled in.
>
> But if it is compiled in, we will be paying the cost of the call on
> every page fault?  Eg on arm64, it will call the following:
>
> bool can_set_direct_map(void)
> {
>
> ...
>
> 	return rodata_full || debug_pagealloc_enabled() ||
> 		arm64_kfence_can_set_direct_map() || is_realm_world();
> }
>

You're right that this could end up paying the cost on every page
fault. Please ignore this request!

>>
>> The kvm_gmem_folio_no_direct_map() check should probably remain in
>> kvm_gmem_folio_zap_direct_map() since that's a "if already zapped, don't
>> zap again" check.
>>
>>> +     if (err) {
>>> +             ret = vmf_error(err);
>>> +             goto out_folio;
>>> +     }
>>> +
>>>        vmf->page = folio_file_page(folio, vmf->pgoff);
>>>
>>>   out_folio:
>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>        kvm_pfn_t pfn = page_to_pfn(page);
>>>        int order = folio_order(folio);
>>>
>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>> +
>>
>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>> time it's a folio-specific property being checked.
>
> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
> case.  How does the fact it's a folio-speicific property change your
> reasoning?
>

This is good too:

  if (kvm_gmem_folio_no_direct_map(folio))
          kvm_gmem_folio_restore_direct_map(folio)

>>
>> Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
>> this call can be completely removed by the compiler if it wasn't
>> compiled in. IIUC whether the check is added in the caller or within
>> kvm_gmem_folio_restore_direct_map() the call can still be elided.
>
> Same concern as the above about kvm_gmem_folio_zap_direct_map(), ie the
> performance of the case where kvm_arch_gmem_supports_no_direct_map() exists.
>

Please ignore this request!

>>
>>>        kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>>>   }
>>>
>>> @@ -596,6 +645,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>>        /* Unmovable mappings are supposed to be marked unevictable as well. */
>>>        WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>>
>>> +     if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
>>> +             mapping_set_no_direct_map(inode->i_mapping);
>>> +
>>>        GMEM_I(inode)->flags = flags;
>>>
>>>        file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
>>> @@ -807,6 +859,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>>        if (!is_prepared)
>>>                r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>>
>>> +     kvm_gmem_folio_zap_direct_map(folio);
>>> +
>>
>> Is there a reason why errors are not handled when faulting private memory?
>
> No, I can't see a reason.  Will add a check, thanks.
>
>>
>>>        folio_unlock(folio);
>>>
>>>        if (!r)
>>> --
>>> 2.50.1
