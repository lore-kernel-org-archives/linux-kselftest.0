Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183F48F82E
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636523; cv=none; b=PCWu7baK855lG76zpcNsXqc3LOm33KrlvAKMrWGg1h3eFqJi+wyR5jQxAMe/hXw/Q+QCkwJMg4Mq5mLYQr1wz8rFyqcBJt+yhthfj2lN9I/X5+lwKa0YVUCOMFXyFwfNSZ/ebTyug0cx8wlSctuv5DsiaxI03YXUDPBn1WCG8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636523; c=relaxed/simple;
	bh=KjvD0FYtibQe8DPB7+KaUJitoRzCPmTVRI1ZUYReScM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XDQCP9B8n0sYDWDPFihcU1RsQ08xa+ZpEl+k5kLsX0IiJSj7HiADZX+UVfjm+fgq6V7DyynFu5g0zAtwGNcqtB/EfYtOyZCun2SHWT3OsCei7rj7BWa1xuBwEJvHAe6hTXZtA0wmJAWezqOwbgEOZkGlzCu7H0aqnPKz5v+WFbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HcNZfx6v; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HcNZfx6v"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1170548a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786636515; x=1787241315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NWd+efJbNRhMQi4tFuFF6oho5IzekPVE1UiVHSpD6zk=;
        b=HcNZfx6vLVC9BEDC8pXA2hcsv1hw1DlxI8tikd0v/Vo9/mx/VfXMUd77bFcBKP9q+m
         dfHxlzZ6qZ2Nck2sQdH4hN+EwNi3vHEUVF4XsK9AEDm9hlSToITJ56mHWxhopD39isb+
         RawwSZUj7w65cysAh7SIYq+F2CSM9zJqI97fIchtzcIpG9ezxz9PDQ4Ta266yFHlU3Tg
         JVetymie04n7vw2meuI/o9dyatD/0p0LHk9FMUi4RN8eLF5rsdLyvncUg3xuxqJK1V7I
         ecuUQ1PGX5WvTDb3Y7wFXusJ/cJYPgf0CHQmqBF6xDq5r27hlL9DEgnfeGudigfVR9mH
         SmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636515; x=1787241315;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWd+efJbNRhMQi4tFuFF6oho5IzekPVE1UiVHSpD6zk=;
        b=iC0hVxqSsRWKcylQZimpxaZWAMIGHLo1bObJrbHfNVytx6kcKgK4BXJehbohFZMqyj
         14fgTxkqBhUllMuoupgeVePce1gfDexmvK5xgDj3Av0Jyh++qSGK6pJDUlIg4gBdA+wo
         b7KBWZgKeTlnolW2ekX60oLx/HqXBEZ0SkTgi8GP/F94BAaCb2Mn3cfgndTtuHsKSf/r
         c56BujX7zVCKVV7k6EzSc7kJZniPs8+RPF2Gmlh/s+XUXY/OZ/JA9LPZ2Nyt8FaGdUwD
         7Y9mB+BjG2ncFg7UCnz45grQ4K5aNM8IesY4Pa7Tk9iXU32pqmrPomm3NQz2mNLBT/nX
         qq1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq6a7eFwc/WLOSx6MnaSYTpnT80NdeiihFEao0bmPdYYapkbbRGmvP5cQw65ZF6TgSIqFjyNbjVJqycSEpM2sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJGDwCpYLVuhOAuqoSxzjtUVsL4zK1hnugKvJAAX4dpWj0DooM
	AUxFheMt3tBneyRl7NWmJ4bDjohyBxqlFmV/jZrO+sImzCjMfPr5UjSoYpoXxuhhikNqTdglvTX
	JL/ze6w==
X-Received: from pjbmr22.prod.google.com ([2002:a17:90b:2396:b0:381:1d7f:b8db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8d:b0:36a:8240:2477
 with SMTP id 98e67ed59e1d1-3931e31a6f4mr7349226a91.19.1786636514937; Thu, 13
 Aug 2026 08:55:14 -0700 (PDT)
Date: Thu, 13 Aug 2026 08:55:14 -0700
In-Reply-To: <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com> <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com>
Message-ID: <an3o4h-E8mj6CUaM@google.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026, Binbin Wu wrote:
> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, p=
goff_t end)
> > +{
> > +	struct folio_batch fbatch;
> > +	pgoff_t next =3D start;
> > +	int i;
> > +
> > +	folio_batch_init(&fbatch);
> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch))=
 {
> > +		for (i =3D 0; i < folio_batch_count(&fbatch); ++i) {
> > +			struct folio *folio =3D fbatch.folios[i];
> > +			pgoff_t start_index, end_index;
> > +			kvm_pfn_t start_pfn;
> > +			kvm_pfn_t nr_pages;
> > +
> > +			start_index =3D max(start, folio->index);
> > +			end_index =3D min(end, folio_next_index(folio));
> > +			/*
> > +			 * end_index is either in folio or points to
> > +			 * the first page of the next folio. Hence,
> > +			 * all pages in range [start_index, end_index)
> > +			 * are contiguous.
> > +			 */
> > +			start_pfn =3D folio_file_pfn(folio, start_index);
> > +			nr_pages =3D end_index - start_index;
> > +
> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
> > +		}
> > +
> > +		folio_batch_release(&fbatch);
> > +		cond_resched();
> > +	}
> > +}
> > +#else
> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, p=
goff_t end) {}
> > +#endif
> > +
> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t star=
t,
> >  				     size_t nr_pages, uint64_t attrs,
> >  				     pgoff_t *err_index)
> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode =
*inode, pgoff_t start,
> > =20
> >  	filter =3D to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
> > +
> > +	if (!to_private)
> > +		kvm_gmem_make_shared(inode, start, end);
>=20
> If both KVM_AMD_SEV and KVM_INTEL_TDX are enabled, HAVE_KVM_ARCH_GMEM_CON=
VERT
> will be enabled and the logic in kvm_gmem_make_shared() introduces unnece=
ssary
> overhead for TDX.
> Not sure about CSPs, but in a standard distribution kernel, it's very lik=
ely
> that both are enabled, right=EF=BC=9F

Yep.

> Should kvm_gmem_make_shared() do some optimization or the overhead is rel=
ative
> small in the conversion to shared path so that the optimization is not wo=
rth it?

I assume it's relatively small, but it's probably a good idea to gets numbe=
rs so
that we can make a semi-informed decision.  E.g. if processing 1GiB work of=
 4KiB
folios is <100 cycles, I think we generally don't care.  But if it's more l=
ike
tens of microseconds, then I think we do care enough to optimize the walkin=
g for
TDX.
