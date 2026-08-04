Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA346D2A9
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857994; cv=pass; b=KaToZ70wrXLF9tG54d8JVyG4jyq+bqKQqAoHPCB48XTosziGK0oYA6e3wJBamIN5qu7eoCLkswf0tcg7HnpoVJIONnlheBlFmDsNyNDZk6hv8VNa3x+GmAOBKw7lB2FMHiLFYN+0Rsbe0zy9eXssSP169h0FkUsqnKucPZ7CPyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857994; c=relaxed/simple;
	bh=3oWNFp8mlmM3sK5SQC2KqwSAdHvsMlVK7v6l4lJqdEI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDf1HfBq/cbL8ZdqukMVSWuBVLmmwf39hkxdrnS9fGGDeunix2va4iQ3CXbEK188TGYo6/cG5WH0o49NflCM8RFPEg6a6lmiJRIcvII5T2qCS0DMGOZNNcLC2750TUUOaq1XwCM2lBiE6tgrj4dFUIMoFUxbfRq0ng7ti2bcNNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8Kqbe+8; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8Kqbe+8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so3268830a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857989; cv=none;
        d=google.com; s=arc-20260327;
        b=QKw3A/y/Ib8TUwLmZsU7bgj6TrrEZ3EQFwcc/4uM+pyTpHTdRcnMc0hKza4uZcEOaF
         2vZMExWw6SASRperNMnHbQsygMiNT0YKE9rY2cknIClEYKSbDjgUMMIs3NFDGPxojnD/
         /Z9Qya3Rm6EsRd1fy2K58IpytM33wWnNa6zsQ0Gu2MDd2QMRpRdl3GMZpEPwnZ3+K/6B
         EQWwOsBurBfFSg3wwyULf+4reZiGvnG0ZKq08OlxeRakRpeOIbUkqhSzfk+ASSpNEPGS
         bTH7t95Z4TNtZp0ufwolYA5ecz9ezq9MKUk79aT0m1z4xaFyT5sBMmarSmW2J5/rSe4f
         JFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        fh=x1hs5MQUiYwPKJIKxRRbppmzpr4wgtyNSq5WlN8IJcM=;
        b=rmwS6lF2OZIN/ZlQYV3tCbl2Lv3KTq6qo76SGurPsmQdJn+SB7oSGMgUm/yyomiIh4
         Oe+uqoMxvDYfnPrrpxZ5YHofYm+Sp/jnvUu45O1hEyoaJtZxCqZvREWi+u7ZRXuTNF+N
         h2XxZbghDwLMqUMQVvM1aKXygs75f04QVrdJSk60VAedt2lskVj4i/viKRLNJGRhzfBk
         wCiAhtLcFh17u+0nju0irP1D4ftuGvGezHXknw9nb8+9tOqw/LBr2UAtyxGfkWlDmW5M
         AmSwOoPkdBQIG159ik4WfX7RAnp2VBTBJl6NgiaRN/OlGXKG5wktn5FrqKN3RjB8548m
         7JIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785857989; x=1786462789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=u8Kqbe+8NUGx9yefTwTAvANAItwU6yEEGFtaF1wptzb3NCfl/HzgNPdrrKzF+QZPyO
         qR2u7GnHAczFSGMxmu6RTivLrLESjLA6OcOIxReAP9at23zOfbu276qpd5NXebYcqTHA
         5N8K/OoH4gPX6399D+5ml7KSo3wNwYoSnMp/TiyNx1wFTWwJjIDfZUmJLvmOiqvMoXaq
         PV7jv6yblCt43N8A0QooLDkpvyGjlDlm4fFsN1RXKiXEpq8PzBqPKZHZ+22AjIlEmXOF
         FMh1HQ4kc6jxGPgaZJqsu/nRxDxYvTkJUY9S6qVhyXd3fjEH+qC+jhzuO6k67htlAucv
         cH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857989; x=1786462789;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=bBoICxDvKbOQ0DnmQtLZenJGRwzWEQQGg4gZjvBddzESfByftYaNePvQT2QHPeFFtQ
         QCK5Zbm57IXBUkFs2itVApyIMwnSI1KFWzQ/4W6RmBxJmkXhDSzgbZkz8RxF4NzFK+UA
         j+HLxpAJrZlZuIXuTuH0kvHVF4nm3E0keX8toV1gHe0fDVW/Qgvsjfshq7X7NGhY544+
         eeulIjk2kjaVk/XNydKz7DcIDxpUuP+NUSrS1i40NFjWQ//BeAIcVwm9MZ//d0v62hIJ
         cnClsyzGggENAZ0kv7GhANBCWPk6dEyVoi5+nNUg3zZpjGBqr+A+zkmH2ddcHnpeCxRy
         HiOA==
X-Forwarded-Encrypted: i=1; AHgh+RpN5/YizmFvJlJcPleXRsSe6fs9jX2PfDKL36/cyJkznS44R/UQwWrC4VZMs4AUyTnrlZKvMYSB2X/GOI0jlYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxB6Wkr/UWOoJA0iPkwKQkcogtvlg/NfVkkDPP1v7Lgzzj9nbO
	zo/LmICFqviYOBUfyJnNNVbstFsqQGD1MwT8zqyF9OESesJaOcNQHWZ9L/pV5+8h0I1TWABF+HG
	2RJsa0AcTBmb+LrH1jKdfqGWUMk7r3DE0Dk5GTG2B
X-Gm-Gg: AR+sD12ksYFlrAqo/9L3TEs3ZItpaA/1XawxejYxBjrrWwoPsXa4em6leJtfOyrHRq5
	usqbF10KK+BhfsaVl6exjGgI1WlKCUCBse8YZVnI9QIA+fCj1y2ruCRy1i2730TwegukBUEFHHw
	GrI3lgpdOduBmsUFiUf7I2GtqD5AGoofY9/xJ3I44+0ZNXCvU+jVbO/2ENfnSi3lA6utw6JySfU
	U02ufluYRW/aQ4Zlqe5qebJa3Cyd7qkIPQf3xvuNKiCAbebvfORvW5uKHfrY6PCBX3JVIqldt55
	EaLpcRaiLcywLC5z3K1JNDEoR9vEQvwiE41pm7DWWO6poICVtZn8EcxChjKcEROXJ/idHWBESUO
	k1/fOTe/3wzs=
X-Received: by 2002:a17:90b:1c8e:b0:38f:1a80:d1e7 with SMTP id
 98e67ed59e1d1-3903c596de7mr90484a91.13.1785857988201; Tue, 04 Aug 2026
 08:39:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-20-35f9aec2aed2@google.com> <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 08:39:47 -0700
X-Gm-Features: AUfX_my5tJzuKxcHX_DSDai20MF8F8MLGyTCXlBPRZTIfOOy8MGvwUJsA-dI9HA
Message-ID: <CAEvNRgErZqaLPpBveBd2VxdrS_8mjMbArL_=AhzMdikXmUU5VA@mail.gmail.com>
Subject: Re: [PATCH v9 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

>
> [...snip...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index ea2752989f8bd..df67a6188aa99 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1137,10 +1137,12 @@ static bool kvm_range_is_private(struct file *file, pgoff_t index,
>>   {
>>   	struct inode *inode = file_inode(file);
>>
>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   	if (!gmem_in_place_conversion)
>>   		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +#endif
>>
>>   	return kvm_gmem_range_has_attributes(inode, index, nr_pages,
>>   					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
>
> With my suggestion[1] on patch 7, this diff block can be dropped.
>
> [1]
> https://lore.kernel.org/all/dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com/
>
> The code looks good to me,
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>

I think your earlier suggestion on only defining the module_param when
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is selected still applies, since it
removes an avenue for a user to turn off gmem_in_place_conversion if
the other option (VM memory attributes) isn't available.

  +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +module_param(gmem_in_place_conversion, bool, 0444);
  +#endif

Given that we're now dropping the diff block as you suggested, do you
agree that we should keep this #ifdef?

>>
>> [...snip...]
>>
