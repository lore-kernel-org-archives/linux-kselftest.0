Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B10173
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259769; cv=pass; b=jkqIh/20PsqGxaBa0/EGJRYE+75uh7BV0/PvfDD8Im9eFalKKayFlB8mNrarMPY28y++wT90j3Pa5pSSvl+DLsZP7nL5Q2ltfnTTTDqVEKciT0rdszytVPiPwJkUbVMk8A+tESlgo8tHl/LHS6brfw6Y1s8vs0rRalE/8ptSQaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259769; c=relaxed/simple;
	bh=rQfqkBaw/xkmyQgEiFlC2Kezzoeugio7gq7U/cPAgVE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPB1FMLW8v3gHs7goyyVcQ28Nv8DCrjR+4qU5FdNxYyOf94yV9FWYS5+3LTNl4/NQKVEmGlW6L094l/xa1omDqC+4Czc6pAQLt4isNDhI+eeTXK2M9Z+Jha+YLxIlQCRH+UHXT/TR8I7RxPiHYT0M9OWXVcy8iK5s7/q22e4qPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=veUsiC1C; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="veUsiC1C"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13981833e13so523688c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 17:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782259768; cv=none;
        d=google.com; s=arc-20240605;
        b=NXsZdWYLqi6kDqs7dopk26pU0iBxB4g/ffbT0lhhkpX+/wdIjEAV4F2tAQFyx8GWgC
         k/TrErIk51KFLD9XvYbQ/aYfXsar0i7onKg1g4fBkhXkO5x69kfjKJd2PTZTstxjnLIh
         fkTxxsIorffeLz7gncKmjz4UtksvVDGASAbeWsDGe4sgt74H4oCwzWcawolazYVaIirc
         bRaPzeNMeXN1Pu1ro+uDgezOt32GPSdVFWxv+n0yDVAlsPjBxX3zmYTqgiX+YFW+coN5
         FID0xlUwibHNURgCTNZVWjhQQ8UwQwZgEUXKJPCRlKkhHj3EEUzg61P2eXhHtVG8DYNL
         2ibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        fh=Dku3wb/iO+1PQCkzZw5wP23+UzjbAUpCwEYeDzojoL4=;
        b=JUx92xFpjFQkvJSxxlSFDGbBUu5BR5tnZBLuHv0YwSlWv7zQtWELEQnkbgZdUqz75c
         gViygwu8I0+QDrrhB0cvf2irB9+h/dlXR+GQqlsKkCfu77I9bUYegRFnCGGTVjf2/dsD
         beeecasVpHsx2HIzmnxhAA/fD0veCmDjKC+AoCN5hznDw+UEWg1Zls8cHHFZ/53GXZhP
         taz36cDMAmQW/JmQnp6R3ROctkk3movW93CqAs1lvJTzfdEbAYSspH57BsTQhnmfYJnF
         jVSSI/JIpmAkZnh0tGkXRM2xIDSo6ZQz8CsRNMigPAN1AZ1beTAVZympaq7ueJUYRJFu
         MJQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782259768; x=1782864568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=veUsiC1C69EY+fW+phEEcbGGJR1QtHjfW0d5G1V91rsvTaqXDyiTLhXXS9KvXQDxcZ
         oWZfD4aPELOrcjBl0S4WaAofqhRsh7rEZ5pQO3FCfS3ra6aku162Pf0qCkXR+xXopq1O
         IQKeS/G6Yi915cxG1Q5coGJU9a+qvcY+2pF5iSXRniVzMo3wiX9bpO5siiQcu5hv10zG
         IRNmijyT3ZTFPax8idXSgIdxbUpbhO10FVExLS2PxXXeKQXDrr99e5Cw7mM91YAKYLN/
         5W7OT8L10Oa4D+7xzkF7MBH1sJvrlSEyXhHEhhSosvwz7SMH4/WDaSXCQlJ4lOg1Sf2i
         XC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782259768; x=1782864568;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=oPGFB0MaV84iSSU9V4SxExk2gWk2WftrPR6VomxSjtvLyg8a2IXmJY2cwnYMTueoun
         66TuIIfVzi/gcc3+Jd9DjWEEiRdw+auS3eO65SutMDwB9EWmDfldORaVYYzl+wGHH6HS
         ncPmkiOkT4vxe89U7kT6fbfWXyxmTaogIC50I7R/yxckU8ukdfb7HNiy3jadMie/tvku
         s8Q6+Mnruav7ynbBw+G6W5TQhp6NXYnOAbGKOwq+yCFWIWOma3bwXsh4MNaVvlstYiPu
         bfs69AcA0tLbUx/M8l8BAngipRMzVRz3zr12zFogh6mHXNd6iEAaGGf/W3ES3VCtnnXi
         VJew==
X-Forwarded-Encrypted: i=1; AFNElJ+rmc733B6umgj0uSbP/IpUiOIV/YMQYuHpcISWKhTbOoGPKh+1Ds4cGT/d2ddipsoejXeJ+HzJdaLr1y7/etU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHEnLHdk0tftuAefE2GhcZOtRmltRRtuUbxx9K5u/HNbEXA+B
	Sc58/5mcpF2lzBF1A8JouTcPzlthDPIVVyfkJWJMGwjp2UMRzDng+/wTeyT05QF5PGxve7A6EHn
	OfERwLgVMYXnJTjLrNJe50am4C5lUmDSQdCEn9Vzx
X-Gm-Gg: AfdE7cm2DBXmK7qT7LePNRC8OKO4ExU5BARBVzqC46Jw/558SmfNjB7C+ghEDJ/UWQw
	04u0oOKqgA/Wol5tjOZHzq+DcpwKRgsCjjfo6ZpRuScjwoDFbuIXbL3HSVhVxvwqndjMVSgWmwT
	NCTo6bmqZsQhDaYCU/pCL66t0TcDnyUfTr3Z3FL3a1/ngJLmjzJeTynJlyE98yy0Pl7li/EKwRl
	oRYsAJQPHxWmpDNaP+ZZUoJP4nTcp2ymfnWDs16DFOsrqFSeBHKRVeJbUQCmO2IMxBpWQ9JObDf
	21zxV8/xpMFYxJBhzId9+3pUzeGZ/WNP2a5kLR0NHoJ0Xyy4GUyCiDP5BPU=
X-Received: by 2002:a05:7022:45a4:b0:127:3f2a:af21 with SMTP id
 a92af1059eb24-139c5cff378mr4117596c88.15.1782259766886; Tue, 23 Jun 2026
 17:09:26 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnjTJdQKD1Kz3tf@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-1-9d2959357853@google.com>
 <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com> <ajnjTJdQKD1Kz3tf@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:09:25 -0700
X-Gm-Features: AVVi8Cdk7fD1H5RbfHSz0rAk7YN_q01NbBdLx3di9F5nnt4X6vdgAPFTH7tGEuQ
Message-ID: <CAEvNRgFU4H5FrjQvLMQm9DOQ9ujiHfFfsV6zVKNVi-rzC_zSxA@mail.gmail.com>
Subject: Re: [PATCH v8 01/46] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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

> On Mon, Jun 22, 2026, Binbin Wu wrote:
>> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>>
>> [...]
>>
>> >
>> > +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> > +{
>> > +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> > +	void *entry = mtree_load(mt, index);
>> > +
>> > +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>>
>> If the entry is unexpectedly missing, returning 0 means the attribute would
>> be treated as shared.  And then in kvm_gmem_fault_user_mapping(), it would
>> allow the userspace to fault in the folio.
>>
>> Should gmem deny such edge case?
>
> After several bugs this year where a WARN_ON_ONCE() fired, but was entirely
> insufficient to prevent true badness, I'm definitely senstive to making the "bad"
> behavior as harmless as possible.
>

I guess both are indeed awkward.

> However, in this case I think we're just hosed.  If KVM treats the memory as
> private, KVM will incorrectly do prepare(), incorrectly allow populate(), and
> will caused missed invalidations (though I suppose __kvm_gmem_set_attributes()
> "only" lies to userspace in that case).
>
> That said, assuming SHARED is definitely odd for cases where guest_memfd *can't*
> hold shared memory.  Ditto for assuming PRIVATE.  What if we instead fall back to
> the "init" state, e.g.?
>
> static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
> {
> 	struct maple_tree *mt = &GMEM_I(inode)->attributes;
> 	void *entry = mtree_load(mt, index);
>
> 	if (WARN_ON_ONCE(!entry)) {
> 		bool shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;
>
> 		return shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;

I was wondering if we should not only return the init state but also set
the init state, but that would involve performing a conversion to the
init state... Too complicated for an edge case.

> 	}
>
> 	return xa_to_value(entry);
> }

Thanks Binbin and Sean!
