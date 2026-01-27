Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABFC2EDD45
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557603; cv=pass; b=SreoiEWidCaftxfxYsmv/4wJ9o286ividZBprvHD/bhUj+cKHdVfOdawawEukr9rba3Dv+mKZGYyCWp/JZwUvwXziyXUNyqAH/R8OeIMROWv7IaR6gXN/zjkFAoNeuj9YDqVlpNldEnQxfgLE1FGV9wZcps/YegAT9MJbk1/Z8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557603; c=relaxed/simple;
	bh=vst6t4peh/JV4Zuhoe6fbMyUDr/jcG7JxMjC1bUj/HY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRCXnkKSaN7JOpzXw55Cu4JARudhFTI9kqnqbUJqr5RVl3BVPFrky8NEGJefVe33qrhKZdfV10MP6SuBRUKEmhWSlzn5YRBazCejfd9xKmp1zzf9OOUerEN7FgzcaFLwOmY9WMTl681MrffWiZKWH4Msb9lOwzVw8z+rml6qNMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q0aMp+cV; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q0aMp+cV"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5664393d409so1239506e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 15:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557600; cv=none;
        d=google.com; s=arc-20240605;
        b=MDRcmXircBHmIcN8DISyWcZ1exR4pKbhYL6iwXpX9vfPGfV3fxldref3M2TAs9L2Iu
         l/PovhrU88kFGej9cLUbf2YfQ+9a2jl8r09wZ7T3SsY3yH6NX0+XqhtwLxjrmeKkekIK
         BfWGHfsLSfSkj8Nt7b8ZxlVlDY/E5ZmGhXpZzuO891NOQ5PhmJru4JUsLgvCv85WwElB
         nbXLyX9KJ6V7bZpIL358LCCA36P76s78UyzUpUL6NNRQjvy0R+sfRjvaq54i3JlhiTVx
         P2MyjcwL4l/NJ2598n41zOqikjt9uWfJlhe6wIesWKIokRHntFC7MtyNykSsxHfPalJm
         tXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=3+EqNzQT9TNRk9U4Wm8Lp51VnBAV17bgK1qxop8j5Is=;
        fh=LXdt+XFxkrM5M14wjeNUXUESDsqdMCCTodX2hyTSTvw=;
        b=kKKX7/JVsY2dCtrMdqQBFTmgTRadiqHXtOkpj3Ll0W/wCRnmQz7TFGT3k4ctU86h63
         xv08sfRb8/IKX26bho24Df1YMJNDw+NWcQRTKXhLxfnQbeAaBAjspYMzvLK3i58Uzr1Q
         jyxctV8zFed/0BLwBxgz0nwi7uN+AYYBAt2pr9WnIIjtuGO5ebxkpmG4/fkOwDth8qSq
         Q/NV/8YFy+O3/V+uc/yG28q2B65T592Qxr0rWvfK5Op9Dpw31/BNQM9M59pDdj584vlw
         Q9osYwCRCtOlM8QV2PISfu+bdeH+ftzeJYj6WJA1TmOW5kDtX6ZrOicAO5+aHqrA4Fyj
         6FbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769557600; x=1770162400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+EqNzQT9TNRk9U4Wm8Lp51VnBAV17bgK1qxop8j5Is=;
        b=q0aMp+cVQgIaUs+GKsnXsbB8/OBQGmUP7zTFWK6YuIMa/8RpGMvXMR/6bZPWJUz+Ax
         u/t64RKqMcpebPRbhQ1M6biN4IVbKs9gzGNSNkMp1uOAxFoKkJ3J2aIai8hAjHoef+oO
         yGAQYLHOusadvqilAz8Cq8+gSfOtTAksoE5xOrb8XOmbpk7FoWeBVa3hH5MKs834fYOA
         CLJ/rTfq30ymSa+kz+gatTy0HfxXCxyYv7Eitpa5Lcrq6+NC0vv4ZfQJ6bRsUKrik2+u
         PKDb6B/ERV/ZDxO60V/G5dT8DoTygTVKTspVy7XBm6gYY5wd3EUNYV8jaV8k+Y2+l26V
         yrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557600; x=1770162400;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+EqNzQT9TNRk9U4Wm8Lp51VnBAV17bgK1qxop8j5Is=;
        b=QFXGuv5NcACelmYTYpe2NUEXQjViYuM/XQwDWqk0obEnnFP2+uGHa98E1Xb4EhxSd+
         AtKIavJggLAvlyPRgHmxCMqJM2z5YnNPDVrnvu8o82vshv5oiy5tueNpsHyqzsnIHNLi
         XMTZ8DpdPvfuUxihiV2d+4doYwo1qcaQraeaQiROuYiS6EZm1wnDXbZvDTAWp0JAYGnh
         uFKXrOupm7MbSGK+Vv77NMeRUKVhVytduEmHEZY+6PFqu6nRbNnoFNWNNgIhdECO73r5
         9WxPPMIppjtvUZR5I6Q/vW62GNXlGrY9s22Wsltxrjw2OMzydCZcaC87ssxrcxZya4OW
         zkjg==
X-Forwarded-Encrypted: i=1; AJvYcCXvRqBIg0iOE2cgM4WLDMlqAg0NMzKOjf2TA5oFaY4F8gUvmFru/rA9Lthdpf4y46Xq/Y5Hm/aUB7qV782Zsx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/Uj9BXdXEsA6/YiPbbV6ZpCaE4wbpVTGw3tvSnTmv1shf7nw
	8Z9ZXAcZIEYbSoAJ3e7BxAg4Agxt/UGzTL2rHTUUGUHpyuRAi9MpJqVhAOuxFGCyBS6mbwC7M89
	XFum/FponQH31vnDnVIIPgwAPfoz6DDouxACfy6U+
X-Gm-Gg: AZuq6aLPU3DlyuJBqAWR9sjP1WqMxhhC1oktPupqk3K2rv5+/yLqCEM69x9UskJQhMc
	mPHslztcxAUbiljE2T8XumuIAIEpEFAXJzEjbnZ/HFtv/CdWpuQHI/qCFnFtQlsF911lg/bVU96
	YCXl+OV4rD5NmCmFtTRhIdiYyy/afNIHldnvDwhFjaFUM1PsF79qdT4LOWlkkZRD/PFBXr9difS
	1sS7XWaKhuPWS3VCrH1yJIP8W6D9EGwmhgT2NSbYVVJQBHQB/SjKCeQKa/VOvJTKQ3DbKOvL3nC
	dYPkikU8SmJM3c2iK9zup0ivMg==
X-Received: by 2002:a05:6122:488a:b0:566:36e7:8934 with SMTP id
 71dfb90a1353d-566795c5856mr1161633e0c.16.1769557600050; Tue, 27 Jan 2026
 15:46:40 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 15:46:39 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 15:46:39 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ce78da49-2525-44af-9cb8-301bf6a4658a@suse.cz>
References: <cover.1760731772.git.ackerleytng@google.com> <02aad35b728f4918e62dc6eb1d1d5546487b099e.1760731772.git.ackerleytng@google.com>
 <ce78da49-2525-44af-9cb8-301bf6a4658a@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 15:46:39 -0800
X-Gm-Features: AZwV_QjMPyTn9KuYIeoCwzon32JStKYHl7N-mpSbapwuTdPZlfrcWu1xEKHINOw
Message-ID: <CAEvNRgE07d_TaSVpkWO8gMfGgPsP9sBzrqMPCte8PET0THF=QA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 09/37] KVM: guest_memfd: Skip LRU for guest_memfd folios
To: Vlastimil Babka <vbabka@suse.cz>, cgroups@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org, 
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com, 
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com, hannes@cmpxchg.org, 
	hch@infradead.org, hpa@zytor.com, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	liam.merwick@oracle.com, maciej.wieczor-retman@intel.com, 
	mail@maciej.szmigiero.name, maobibo@loongson.cn, 
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org, 
	mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, mpe@ellerman.id.au, muchun.song@linux.dev, 
	nikunj@amd.com, nsaenz@amazon.es, oliver.upton@linux.dev, palmer@dabbelt.com, 
	pankaj.gupta@amd.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	peterx@redhat.com, pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, 
	qperret@google.com, richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, rostedt@goodmis.org, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shakeel.butt@linux.dev, shuah@kernel.org, 
	steven.price@arm.com, steven.sistare@oracle.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	vannapurve@google.com, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Vlastimil Babka <vbabka@suse.cz> writes:

> On 10/17/25 22:11, Ackerley Tng wrote:
>> filemap_add_folio(), called from filemap_grab_folio(), adds folios to
>> an LRU list. This is unnecessary for guest_memfd, which does not
>> participate in swapping.
>
> IIRC guest_memfd mappings are unevictable. That should mean they are not
> ultimately added to a list (see lruvec_add_folio()).
>
>> In addition, the LRU list takes a reference count on the folio. With
>
> IIUC the refcount is temporary while being on the percpu
> &cpu_fbatches.lru_add, added by __folio_batch_add_and_move().

Thanks for pointing this out. You're right about this, I misunderstood
this refcounting earlier.

> When flushed
> via folio_batch_move_lru(), the refcount is removed and there's only the LRU
> folio flag that remains. The fbatch flushing can be triggered if you see an
> unexpected refcount increase.

The new plan is, to update kvm_gmem_is_safe_for_conversion() to drain
the fbatch if it some elevated refcount is found:

static bool kvm_gmem_is_safe_for_conversion(struct inode *inode,
					    pgoff_t start, size_t nr_pages,
					    pgoff_t *err_index)
{
	struct address_space *mapping = inode->i_mapping;
	const int filemap_get_folios_refcount = 1;
	pgoff_t last = start + nr_pages - 1;
	struct folio_batch fbatch;
	bool lru_drained = false;
	bool safe = true;
	int i;

	folio_batch_init(&fbatch);
	while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {

		for (i = 0; i < folio_batch_count(&fbatch);) {
			struct folio *folio = fbatch.folios[i];

			safe = (folio_ref_count(folio) ==
				folio_nr_pages(folio) +
				filemap_get_folios_refcount);

			if (safe) {
				++i;
			} else if (!lru_drained) {
				lru_add_drain_all();
				lru_drained = true;
			} else {
				*err_index = folio->index;
				break;
			}
		}

		folio_batch_release(&fbatch);
	}

	return safe;
}

I hope this is what you meant!

> So it might be feasible to do without this
> patch (maybe it was already tried and there were substantial issues, in
> which case should be mentioned).
>

The patch "KVM: guest_memfd: Skip LRU for guest_memfd folios" will be
dropped from the next revision, and "KVM: guest_memfd: Don't set
FGP_ACCESSED when getting folios" is no longer a requirement for this
patch series.

>> shared-to-private memory conversions for KVM guests dependent on folio
>> refcounts, this extra reference can cause conversions to fail due to
>> unexpected refcounts.
>>
>>
>> [...snip...]
>>
