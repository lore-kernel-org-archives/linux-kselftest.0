Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EAF3D3322
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667303; cv=pass; b=sle7YkS7fy4BFb2PUQfaln1uEmA6x/2rv07UlVE3CD+QCsBXQXwle6bhQZNtSRxkXZNeo66rYJX/yYu99cASX7gMz6oQSu5F/YwgaHt/iLgwKS7og6lWJdKulu9Nff8RVxqoXRUYg1nSzAmM083vkUCIMKyXI2mbG4cHQfaMIgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667303; c=relaxed/simple;
	bh=mfD3kG/kM+SeNRth6Kx4rhag1M2FvxZLG9zsfgZIPLs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHl7KtmnzomeGDYPf9IXUOgou0jqnUw/Z4/auYXbIQ4QPi9sBiVR7jwAlYlzgJG0S3E9fE4heSgxFdQHEjzv4CwHPBfbWMkAjFQHzEVL1I2UfghOKUX5cpGsQJXsVvGj0OiDnoxY46yQgSNBmfJbOGaTqsW2SNdK3jP+AMiKz+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8MOin1S; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8MOin1S"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-953a26a9abcso23393241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 09:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775667300; cv=none;
        d=google.com; s=arc-20240605;
        b=YqA7WekvSZFJJpzUAJmCMOZxNBlcqjtlNaPvK7pjnhr/5Y9cx6q1TFFRViKsJc5QKf
         FmBCubAxkf8eGTO7WvjK0lSGmZsL3bW4+OXVaHnw3SZA0K8yMjANktJ3gT9h3Umu0/tW
         aVyHBfmVWwfwZ0I2pOjEyglGNV0Kj2ieTSGeZDt1OB5Igw9Az0FKdrdJNpXo0Y49Vqgz
         t4tKx+hedrTC2EYQMPxAAPQO+QWXPaTELAZdC9hXl9p5VQfl79fcHdqL0eboBmSfxn0X
         b57jyH34Xpvmzv9BU9goWurQ4OpNtjBFmkdSZ3P5y/FpkuJKCtaSmCcegDYiMGFkeM2g
         GnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        fh=wyGG3Xt5150PAtu9DNp4riMmweMJw2ewz2xQ3KgO2jk=;
        b=iUHgPjqoY2ETqkSakF3WOhkW+UKGsiETM9MVi9h45K+G4dov1u21TzdgfjpzIFL3NB
         491YBC+60C0yzM++LwK5132w/OHycTXSkxasGEiLyYSgPqrFMHcEhOOtXwJkm/NzuHId
         2W+/jEVns9xA23r7L95LPEWWOfP0RriCzRwqkCuTOyXOvJgxY5dDg7QmhE1h+ffybLU3
         e0a1P8Dtp0KA8oX9heiTlU7Nmz7S2JXHrxTclR8cSvdcl+fX4PZfSLcOG6OSLcMngkTo
         3Yn4pWEYm+IKLQuptM/w+YqMicpzlU3N0CMpcXjOi2kGIeIRg0zJs9G6Fnd4nSiChmyR
         Fk0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775667300; x=1776272100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        b=L8MOin1SSqeK/zqrDZOSjFiuso05pi0gfj1wLyQ0OEyRFZnSc5LLFQjX+pB/G0chk9
         zl4i3XNGr2Z5nQe3Yx9rrniSlp/5SpIsunx8bMphNmRIe/xm6MmqkAqQS/8YOnhRDFmI
         zJfAyw9+O58djqM5SaspPDFu0HH3jiiK97oWsoWbsnh7tMlXxfCKv1oAEAcGVVVDHLdZ
         hMPTnVR2kuJh6dOtol7MEuRQxHF3cjibJok4T1peW9vowDCW4ELFzASds65l/U9v3IPN
         lAIfwl+5EYm9mXsC83Fy8G8Y3YeqoPiwkTRs1B6aVxGe31U0ZXYNby+4RL5CTxtfzx6l
         Ni7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775667300; x=1776272100;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        b=e49x9yakvcE6vZ/3RJzcv2HovPyo3sVCWQUbSKC7OgQuMOOYGST9Jr22Hbg3eqfE3q
         p4kpzdIHXOLYrYGPR03eVKnmYs6E4FVPOmgBwh8e1Ws3Ov7Hhybp+MjVYCc6KyTZQk4q
         baAHeBTRtgrxYoQhh7mLxRUyoNlKnaHIYzsJ+W1KqBw2H/rZp0tI9EqIYI9HDy+1BgRm
         2MfmvZ8juD4gLzNv6Yd2FpH/yktva7CEUfaPujRb9RcnEfc0edQHROF5jee6B8dB7JM5
         6gk7iyn2kMZVFP8K5+FQZWQxcdBkTlKe5J30o6LekudV9VrGdDgoYWch8rfK2kIA2XZX
         F6xg==
X-Forwarded-Encrypted: i=1; AJvYcCVQGUtHig3WFcOKbhq8GKn3shcsET5du4TU9hCXNQLpdbhT5mBCR1Of5YDmcCOPbPzyjv5vRbRlNLT0zYV3a9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTF2U78aKG7qUA+jogk+qvVYVlcnd/WozeUNCQFS9HK3pvvxF
	cC3vMKoVJu4xJ0AvqiowDwWO8XGTO9c14BBAiRrbnXetr787yIAZKWuC0a0vo10+ANoIMgpfMRN
	+7F2dBSh2MkD75qkTagcpE7c6BBdmSporqiV/7ji1
X-Gm-Gg: AeBDieuq5LMrlpZROl4WZF/g+rMqIVJ2kuMyJcMCpwBsyCY3qFtJjsjNDajV8iFrnPy
	pLWnFiPU7TarNFRHBUswHxH7QYHLzlLaemcPQvl0Ep8f+SoSz6F6JTcZg0x1BFCTHzAmzcbZLMi
	pFulgEJPqxfbS3BIBT8qYNwCAtxz9yW4nVS6+oI55cdHgSCkBU8tngqMPX8ZB2bWkbnW8IOEfBz
	SW96YX96EpLUnVjR1fr1nndfdLATZBi9TR6tofK0OSPVffDiufdWyXThg2wkbdhI9MNiHaTiNIX
	xLytkp0nr1mvugsFak5Ty52El2W53JGS3or+QOqk8QZXlbiIqlUqRT09HDSHEWyn7GEJ
X-Received: by 2002:a05:6102:84cd:20b0:608:7548:e83d with SMTP id
 ada2fe7eead31-608754946aemr69543137.4.1775667300069; Wed, 08 Apr 2026
 09:55:00 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 09:54:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 09:54:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <adWidf8UgZeYctr1@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
 <CAEvNRgEtigp7+PVDkyu_DH947CUqDt312d+P+hWjjd2fHONiag@mail.gmail.com>
 <yvfwexsub7nrogh67hzcsupbrkzer6a7kbeao5tlq4elrzc2iz@xrwdjd7p32pp>
 <CAGtprH-kgRByFvvCYeWMXtsvpb6qpaWAo8k-3PEnioyPg-LEvA@mail.gmail.com>
 <nmy5polcxfnn3hoircsiqarxmzlulwwq7w34okanccntp32v56@h2eac44agovv> <adWidf8UgZeYctr1@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Apr 2026 09:54:59 -0700
X-Gm-Features: AQROBzDEn1_3NBAGLEmc8QVN_GaYAKpE-wwKaGsHEMeG9rJe3AOLJkD1JUoUTtE
Message-ID: <CAEvNRgEcKnHkgC2iK8hRMybruY5LrxWH+RK94M7MddUqgGChHQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>
Cc: Vishal Annapurve <vannapurve@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Apr 07, 2026, Michael Roth wrote:
>> On Tue, Apr 07, 2026 at 02:50:58PM -0700, Vishal Annapurve wrote:
>> > On Tue, Apr 7, 2026 at 2:09=E2=80=AFPM Michael Roth <michael.roth@amd.=
com> wrote:
>> > >
>> > > > TLDR:
>> > > >
>> > > > + Think of populate ioctls not as KVM touching memory, but platfor=
m
>> > > >   handling population.
>> > > > + KVM code (kvm_gmem_populate) still doesn't touch memory contents
>> > > > + post_populate is platform-specific code that handles loading int=
o
>> > > >   private destination memory just to support legacy non-in-place
>> > > >   conversion.
>> > > > + Don't complicate populate ioctls by doing conversion just to sup=
port
>> > > >   legacy use-cases where platform-specific code has to do copying =
on
>> > > >   the host.
>> > >
>> > > That's a good point: these are only considerations in the context of
>> > > actually copying from src->dst, but with in-place conversion the
>> > > primary/more-performant approach will be for userspace to initial
>> > > directly. I.e. if we enforced that, then gmem could right ascertain =
that
>> > > it isn't even writing to private pages via these hooks and any
>> > > manipulation of that memory is purely on the part of the trusted ent=
ity
>> > > handling initial encryption/etc.
>> > >
>> > > I understand that we decided to keep the option of allowing separate
>> > > src/dst even with in-place conversion, but it doesn't seem worthwhil=
e if
>> > > that necessarily means we need to glue population+conversion togethe=
r in
>> > > 1 clumsy interface that needs to handle partial return/error respons=
es to
>> > > userspace (or potentially get stuck forever in the conversion path).
>> >
>> > I think ARM needs userspace to specify separate source and destination
>> > memory ranges for initial population as ARM doesn't support in-place
>> > memory encryption. [1]
>> >
>> > [1] https://lore.kernel.org/kvm/20260318155413.793430-25-steven.price@=
arm.com/
>> >
>> > >
>> > > So I agree with Ackerley's proposal (which I guess is the same as wh=
at's
>> > > in this series).
>> > >
>> > > However, 1 other alternative would be to do what was suggested on th=
e
>> > > call, but require userspace to subsequently handle the shared->priva=
te
>> > > conversion. I think that would be workable too.
>> >
>> > IIUC, Converting memory ranges to private after it essentially is
>> > treated as private by the KVM CC backend will expose the
>> > implementation to the same risk of userspace being able to access
>> > private memory and compromise host safety which guest_memfd was
>> > invented to address.
>>
>> Doh, fair point. Doing conversion as part of the populate call would all=
ow
>> us to use the filemap write-lock to avoid userspace being able to fault
>> in private (as tracked by trusted entity) pages before they are
>> transitioned to private (as tracked by KVM), so it's safer than having
>> userspace drive it.
>>
>> But obviously I still think Ackerley's original proposal has more
>> upsides than the alternatives mentioned so far.
>
> I'm a bit lost.  What exactly is/was Ackerley's original proposal?  If th=
e answer
> is "convert pages from shared=3D>private when populating via in-place con=
version",
> then I agree, because AFAICT, that's the only sane option.

Discussed this at PUCK today 2026-04-08.

The update is that the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl will
now support the PRESERVE flag for TDX and SNP only if the setup for the
VM in question hasn't yet been completed (KVM_TDX_FINALIZE_VM or
KVM_SEV_SNP_LAUNCH_FINISH hasn't completed yet).

The populate flow will be

1a. Get contents to be loaded in guest_memfd (src_addr: NULL) as shared
OR
1b. Provide contents from some other userspace address (src_addr:
    userspace address)

2.  KVM_SET_MEMORY_ATTRIBUTES2(attribute: PRIVATE and flags: PRESERVE)
3.  KVM_SEV_SNP_LAUNCH_UPDATE() or KVM_TDX_INIT_MEM_REGION()
...
4.  KVM_SEV_SNP_LAUNCH_FINISH() or KVM_TDX_FINALIZE_VM()

This applies whether src_addr is some userspace address that is shared
or NULL, so the non-in-place loading flow is not considered legacy. ARM
CCA can still use that flow :)

Other than supporting PRESERVE only if the setup for the VM in question
hasn't yet been completed, KVM's fault path will also not permit faults
if the setup hasn't been completed. (Some exception setup will be used
for TDX to be able to perform the required fault.)
