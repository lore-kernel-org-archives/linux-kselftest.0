Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154A420484
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041375; cv=pass; b=JZUbTxcjVyjphFICO8UiWB96hXJt6LACqOjHv0vh4woM9Fyn+BnMwRCnLyjvnJr7GryeTnYdQ8Yxa9dm/u79OStU+Lf7bSjqADOSoOYSjPrFZ5EufeLGTHtSoG4ch52DZ3r4y9+gwDH3UG8adoR5ykHruJc8/VgWetiJRdF6V/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041375; c=relaxed/simple;
	bh=5J3xUB3/7aisz9iRktEt7o1yC5SHtH7S+wRq998947s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr4RJMUfQmAki0SeQispaiG4cpZB/XBTEpCFe5JIE7LG7tePYUxAUkC+i30JzU+M53qpkpk7SbRjwVyPMN83Gm0LG10ql1rWlUAkNkgqEVQeMZ8/RZxjRqrQ0oCGg7SudNhMHcBHd4AD4L4yNzKJUHdvDF8/4KTiuanGV65PWgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T826V2Jz; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T826V2Jz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso55312485ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 01:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787041373; cv=none;
        d=google.com; s=arc-20260327;
        b=bHAf30Q898hWc+o+xQdlWfVvBoNmi+X5kaO2rkHCfa5EMZVHH26glJAhbl0j4D/PNQ
         OtMkfI04uLUd45DXHFsdkBgeYPsu8sxhyEyxv30YCf6k7rcZQh330ZVfF07+SHcciBN4
         kdK+1che/FrHAuD8SnLGn7d9pNLo696cLJU1Oqqb1fGQ3FWrpVRVRzLc4rUUq2mT1Fng
         WePUae6y211mBg7/LBPGntdLJ0ZFAcL7xTu+fYjuv7HYL3+R81JN9eso4Zib0Wv67DGi
         0gm81/mIN+2uqYpSXF0NsDRqhvhGFv2toYi2HJWHK2XU7/GDGsIShJ0FH56IK2wkoyeN
         3gFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        fh=UEUjuMwFMIQzHGlyat6Kurc43y19O7G7RM99PN84iLE=;
        b=DXktamW7spvurQILeUHIAWQ8uXNawHcR3kdrY84cp8Wr8nPkN748L354oieZ4WWB/o
         bIKO2UFk84gBPFNqJoATxarHpjpgVkZ+neIm2+xjTulNN45p/72OErl8qxdrWu5vIJzn
         7YMDvRbvtSBuTONIPLZmPr7cskd1OCRaT2YOZTy87EtIRvZ18hwJtcB0fJ+wu6+eQliG
         Eo8RhkOAxi0KSvrbLN19OfIXiXPju4+6b7B6T6HfdOf2ycg54vv1EJ5SJZqC/JHhgs9w
         Yv1uyxEVCLxEPei1EUh4f03wW7rA62lBQX83Ruzdazo9D0Kdo7MZr23xqBQyWZtfMRNJ
         AiPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787041373; x=1787646173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=T826V2JzQmY0bin515X5csS1JNLlgJ+k5RabIjx8Nf7P7g03ErnJyovgsFXd23Q9Vc
         z8AQrpDSkqu5btNFUJQ+DwbG49sSIRey6haYFnfXG7fADLiaig6qymiR7wtLstRdfMZZ
         Hf47/UsUqaozOh0olPd+JMVYoN1k0yKArFcwSNgUOsZbXZIGNV8S8jn8ebaDN+Nqis4D
         kshDA4GemxSpnAG1A75p227PY8LLhRZhUFG00TbwipJnr1y0LnFlW12gzWrQgdkbnWEr
         IqclVk5a6tg9N5IhKhpIgj77Jx0w5raAz9uJnCZH4mGjIWvuqjtRXD97grWSZ+ls6bWw
         m+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041373; x=1787646173;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=icF02XdMZAOx0Fma1hHTRFaKI4645z3jdkJnEuQJqU+TfXJqFpuZivsyNZCGVkp0w1
         FreNiNFVp88/W14eGkYyNjKpSEihjoeYp/3WhT4lPmpc1iATuHRWo70SSf6McPYnJRan
         RDhrl5qzKp84Fc0ClIzBlCPHBKQkcHLEcp1/NP0irmK4dQAd6ya7JeW8fgst/kEqyInw
         cS/dQ69r6JYGjbQJVddsnVU4D+c3PJc64RTn9AvHM4f1usiQNxX23HzZ0nA/Z5oIrkcY
         Jl2ySiIp+Ff+ClzJnH6L/cEx2aZReGAK3k9F9qi9CERhCxuZQnvlxPeB/fbt06SAD1Ve
         kZpw==
X-Forwarded-Encrypted: i=1; AHgh+RpWLwe3HxpTpZzu08O7h6OSBnIvafkf+eNZQATU3eH2DqEkWG/CjK3QaT3IhCDlQb+cPLU5Szyplf1H7DmohDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp3dCvb65BAnCvYKHAbA6oNoc7p9bTASiSXPIyQSP24VIH01y6
	7N8+serfwHgA4Au4pLNb7gKmHtcGDi2u0RhnLxED/7Ru1RVL5hRzx9Mr9xFXAKOVHo8CVeG8sGx
	OfZ9GYbPJHlT1gJSfXE42bXttJDB9slviUv8mwbyH
X-Gm-Gg: AR+sD1374rzT7sxUtml2YYNXiCTp0bUR8Ngnyb+51PBNQwjChiLAltPyhxclkUQzMi5
	pn8O2Mgjlr+q+fqp+VQdFJbGOm8qrfepZF+HRmHYoQh8G/7eyQfbaFv7VbWShYrknfyj12slS6o
	VJ69VKQm0uc4JNmFPl3Nbd7BoGXqT+111DXPMtGua3tVdl0xJsGLtm2VX9+TbiPi2diwaYtWUOR
	e9hj1cLtphzGSoGiBU4O/lKzkN+/AylWge5V2kw65JSXj9hY5fxmh2woLHDOLE+XPfNT/szGPzi
	G2zYaJuSGHyCqS+DmObqKSbKDUHsqmBiuk+hSnnBA5sKD8W3kk8Is8/H6iKaXzaKsjUF5+aPegd
	5COOue8EpxQ==
X-Received: by 2002:a17:90b:314a:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-3955a79c987mr7608716a91.12.1787041372060; Tue, 18 Aug 2026
 01:22:52 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:49 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoOJRk5SXBzzT24K@google.com>
References: <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com> <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
 <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
 <CAEvNRgHxda6XK_XqWaqqVnA7oW=Fhp_C5gF4vNcL+-HfwfXMqQ@mail.gmail.com>
 <0c80b9b0e13e3ab2cbe4f9eaf4a02ebba25a7001.camel@intel.com>
 <an5RJYTwlYeym--O@google.com> <aoKnmW9St5zCoTD3@yzhao56-desk.sh.intel.com>
 <aoNrFX9yLfsM7KQI@google.com> <CAEvNRgH_=8YqKHb_OJfT583ZJ346cceRimd9YJ762Vv08uJGHQ@mail.gmail.com>
 <aoOJRk5SXBzzT24K@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 01:22:49 -0700
X-Gm-Features: AcwNN1UwBN-I8e5ZL1Wm4VeVuI85_vvgyrgG68xpeG1bFCBW0uOQsMiH1U5tIzU
Message-ID: <CAEvNRgHXXXBgO2Pw9PcaiaTLXBrm-F++nJKSeHn6m0rnZiT7RQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"forkloop@google.com" <forkloop@google.com>, "tabba@google.com" <tabba@google.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, "willy@infradead.org" <willy@infradead.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "wyihan@google.com" <wyihan@google.com>, 
	"pratyush@kernel.org" <pratyush@kernel.org>, "aik@amd.com" <aik@amd.com>, 
	"jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "rientjes@google.com" <rientjes@google.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"mhiramat@kernel.org" <mhiramat@kernel.org>, "baohua@kernel.org" <baohua@kernel.org>, 
	"tarunsahu@google.com" <tarunsahu@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "jthoughton@google.com" <jthoughton@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>, "nphamcs@gmail.com" <nphamcs@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shivankg@amd.com" <shivankg@amd.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "youngjun.park@lge.com" <youngjun.park@lge.com>, 
	"kasong@tencent.com" <kasong@tencent.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "weixugc@google.com" <weixugc@google.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"brauner@kernel.org" <brauner@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "liam@infradead.org" <liam@infradead.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kas@kernel.org" <kas@kernel.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> > The only question is if we want to commit to
>> > guaranteeing that conversion will succeed in this scenario, or if we want to take
>> > the easy way out and formally document that conversion can fail with EAGAIN at any
>> > time, even if userspace has never mmap()'d the memory in question.
>>
>> I don't really think there's a need to commit to this, IIUC in principle,
>> ignoring that on many paths of those guest_memfd may be excluded, refcounts
>> can be taken even if there are no host userspace mappings. For one, memory
>> failure handling doesn't care if there are mappings, the refcount will be
>> taken for a short while and could cause this conversion failure.
>>
>> Here's the relevant part of the documentation added for conversions:
>>
>>   If this ioctl returns -EAGAIN, the offset of the page with unexpected
>>   refcounts will be returned in `error_offset`. This can occur if there
>>   are transient refcounts on the pages, taken by other parts of the
>>   kernel.
>>
>>   Userspace is expected to figure out how to remove all known refcounts
>>   on the shared pages, such as refcounts taken by get_user_pages(), and
>>   try the ioctl again. A possible source of these long term refcounts is
>>   if the guest_memfd memory was pinned in IOMMU page tables.
>>
>> > I'm leaning pretty strongly towards guaranteeing conversion will succeed.  We'll
>> > still need to document the EAGAIN behavior, but IMO there's a massive difference
>> > between conversion failing if there's a lingering reference acquired via a VMA,
>> > conversion failing because a vCPU page fault raced with conversion.  E.g. being
>> > able to assert success in a very curated test, as the stress test presumably does,
>> > would be extremely valuable for helping detect/prevent edge case bugs.
>> >
>> > The argument against guaranteeing success is that we might make our future lives
>> > harder, e.g. if it turns out there are legitimate, hard-to-solve edge cases.  But
>> > I'm ok with that risk, as it seems highly unlikely to be problematic in practice,
>> > and there is real benefit to guaranteeing success.
>> >
>>
>> Is there really a need to commit to anything? This is already documented
>> as "can fail", and it's orthogonal to whether the memory was mapped.
>
> Yes, but the above docs also say "it's userspace's problem".  Which I generally
> agree with, but that's not a very good story when it comes to KVM itself taking
> transient references, because then the answer becomes "Stop running all vCPUs",
> which I don't like.  E.g. in a very pathological scenario, it's theoretically
> possible that conversion may never succeed.  That's what gives me pause.
>
>> The transient nature of refcounts on pages in general makes it hard to
>> guarantee, and this stretches outside of KVM. I mean, anything could take a
>> refcount on a page in future and we can't be auditing the entire kernel for
>> no refcounts on guest_memfd pages ever.
>
> True, but at the same time, if there were never any VMAs then I would expect there
> to never be transient refcounts, modulo memory failure.  And it'd be easy enough
> to document the memory failure angle.
>

I think even modulo memory failure the contract in mm for pages is that
transient refcounts are allowed to be taken.

>> >> > As for in-place conversion, this is not a blocker.
>> >> Sorry. I didn't intend to block in-place conversion.
>> >
>> > LOL, what we intend and what happens aren't always the same. :-)
>>
>> I don't think we're ready to guarantee conversion success when guest_memfd
>> pages are not mapped to userspace
>
> Yeah, that was too strong of wording on my part.  The needle I was trying to
> thread was "conversion for this specific scenario, in a controlled environment,
> is guaranteed to succeed".
>

So I think we can only specifically fix this case Yan reported.

>> without dragging this out way further.
>>
>> I'm all for KVM not taking any references on guest_memfd, but I think
>> eliminating KVM itself as a source of transient refcounts can be a
>> series in itself.
>
> Yes, it would definitely be a separate mini-series.
>
>> KVM not taking any references on guest_memfd memory is definitely welcome,
>> it'll pave the way to using non-struct-page memory in guest_memfd.
>>
>> It'll come, can we not block on this please?
>
> FWIW, it doesn't have to block initial merge, just the final release.  E.g. even
> if we decide that this is a blocking issue, we can still land the in-place
> conversion series, so long as it's not exposed to userspace in the final release
> of 7.4 (or whatever kernel) without fixing the transient refcount issue.
>
>> If we find a way to strengthen the guarantee, wouldn't that be an iterative
>> improvement?
>
> Yes, but we do need to draw a line in the sand.  E.g. if conversion failed 99%
> of the time because KVM was taking spurious references, I think we'd all agree
> that needs to be fixed before the code is released.
>
> I'm still leaning towards saying this one has to be fixed, because it would give
> us a solid baseline from which to start, and a way to enforce it going forward
> (Yan's stress test).  I could certinaly be convinced otherwise, though dropping
> the transiest reference seems straightforward enough that hopefully it's a moot
> point, i.e. we land both in 7.4 and don't actually have to make a decision.

Sean seems confident enough that it's a small change to drop the
transient reference so I went ahead to put together the series [1] so we
can kick off the reviews.

I'll follow up soon with some testing and report on the other series
[1]. Yan, if you could provide a Tested-by on either series it'd be
great :)

Please send your reviews on [1] so we can make it for 7.4! ~7 weeks to
the soft-close of 7.3-rc5!

[1] https://lore.kernel.org/all/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com/
