Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A874DA537
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192840; cv=pass; b=caED8irhNdYbhZLh97+5bO4skK0heyw4jL/KaW8zqeeSpsPd0ZaRzGBTxnyPzY4NxDMFZQf0Lz9cX2be5nbjLKMiOoVAcUAuGVQzQnZCIAnnkR0o26UYOirj0NyuGVN90KpuDbO1LO/roBxlapNZjwgyQx/luu9cwbaWgAkcao4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192840; c=relaxed/simple;
	bh=7VWO4tOJZLIbfUwVyMsF0ej608m9OlSJbClLH5Q+eyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O51T07TnrWHz3hbY8qu3JTI6k1PdKdBs5YqxD8iHVtykPgekgmjke4Z2LaW1rS+81SkCS3UUmJrlJfpVYTCjm1rP2EBdXXRJeynLBv2/qAtz1dk3oOrMBy9h0g4hRYBoNo8RFz3yvn3sqsSragf2kk5X6YuthlCrN9GMW31ykzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfZeg9X7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oSSZ/qsq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfZeg9X7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oSSZ/qsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779192838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
	b=XfZeg9X7vDiJpEuifeO7F6TCiVDeiVt0XAidrSq088+v8elJUP21MtG5es/8jrTWhs+Tqp
	qHyCuAlPr5mghgo/17gkkmCqgb3dvvnOiTTWKqFPqbXLeVsGqXEcAJw4fDYQfeZRGxNDdH
	XgIRM4mhUhv05gN0NLveFAoiR/SnqvI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-p89TyVqePge6nV6b79LYLg-1; Tue, 19 May 2026 08:13:55 -0400
X-MC-Unique: p89TyVqePge6nV6b79LYLg-1
X-Mimecast-MFC-AGG-ID: p89TyVqePge6nV6b79LYLg_1779192835
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so2809965f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 05:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192834; cv=none;
        d=google.com; s=arc-20240605;
        b=SNl1RQoZYwT4+XQ+8ttXUk6kZfpI7XuikJVkH6oAJH3+z71B6MxXFfm/zLO7KnNlWB
         E1yOQMBtn2yaLAGPYeEWvrWti7MUNhxSiMOJEEuOoH7B4kxmXcaJUdrftaRkU70+9sXE
         IDD/0biOUcUvwVvOEmbo2kkM4b99Gf5zdzbMFidKRGg8sVQxCEBVgyaM6lhFSCR2uxke
         h/AEW73/7sJXcJ9VjmPZVZyDRdGfZuBAE5TW7cKyYmSY/G3rwNGZLWBFTFmWKgYhRP03
         FjyNKSxVXLZgJbOGxsOVQPhezQf+EVrmVvrMu3Hv8aDetQtZTTRhgvegC9wJnTJKKiPi
         MDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        fh=2D6KzfpFenqutKaD6QbNVIppGUL2tcgaLYTEfASzHA0=;
        b=Qr1TLCoyQ5m5o/1pEIvR1xrW5avbjmU07tSoUmBxgCtezBf7d52zB7E18WCuCswMmM
         M31xKM9xeib0UkL7wA7kX9kTHxyklu42mGWKm5ivz5NnT7J40BCtvPrlL8Es7yisPjhV
         73Rni6gH7fMj4vBXUfFB9m3qXmbYum+lRFtwmk93z0M99xiQ8i1hrLo5phft/QOX84/v
         uPE9N7SJbBAZrIhnz6xu2kSPKH/Ju5ZoNORwhg5Awu4sKgsef3eFtB3KVvTR55mmnHiN
         Ojt9iu4uXpujUgX5V6FtTvi2QJjUL6RWAus1Y2D4Fb0N3WWfrWZl+8WW6qnQNNP57LSm
         A5bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779192834; x=1779797634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        b=oSSZ/qsqcKkqKxC8ODU8GcNDRe+Uc7J4PKACXx0mFXW5Ue/v+2XS9uqt5QG39wfa6A
         s1uNo8VJF+DtmK0vKgJH1ChGkDzhN+0U88hzwRYIMdzrwjk8IjdbHWu12/RggeDksJf2
         hCAxcHoXDOQ/CvegmlSYedIEo5/KgrPA70XQUVmcYkCAG960RW4Ru8vwC6uHrk3/Dhci
         SZ8Wgp26VGsJU4Wu2DRahvV9ghVuxtFVvbS7NiAqj8G0qsLLDp8m/CwXKAKZlUPLhMVt
         SBDd39P2EHtTtQKRvcKdvjvrpgF+W1QZuCU8WG15MTENZFXWFpDnMYaYIzYTLXodnxOg
         N/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192834; x=1779797634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        b=gOYZ3wajx8QwCy3LdfnppBenl+uZfrF/XaXoEyQhjLiDFs6ipPNqS4O2kqy2Nxiw/c
         dqCTcG1xPRRrYKFyYitwaryrTpJQsrQQYN2FLavedVVUTtkIwNUU27bhS5Kwun+GFKWP
         xnYj5HbDMRJGMmiWtJCMF2QY+43zEJMTd6GIspl+wJ2GW45RmebIcgBJriBJQoZbmzUv
         SxSE1o4e0s9IUKJj9N4OzXtNtKoJFCeuzCJjIj6DKyt6Y2cp7Hspfc4BezVcjSkDwPc5
         5UEIk07aZeTWDuQ1k4IuNjI93zZTglt+wewJ5bPnv+b++ftxsxa4O3rGR9qeWYIew76J
         VVDA==
X-Forwarded-Encrypted: i=1; AFNElJ/q+h0jQ7q0Iivch51Etjtom/lOE1PW8e//0kKQ9S3XVSNvr8UHtiWONGRep/GW76vIr50oMJdIXBbl9hz9/qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fnOFnNRfggJWW99hXtw91coWE91RxlabNUgbd9YCgWOIC5ug
	Sty43/XXAW8HSO5H32GgCfoJ9SafNwXYSuUpbeL6hztepfzGzOqjayGsxRR7BVCAZwi7yNLFh4T
	kuxv5vd1XTyi9zYs+qJIQ7Npgj/mN9WG/ABoq35RYkP5KTalH1laz90nMCq/fzSHICgxkR5Hglc
	axWU/5d+RCMpsQOMcWe+UxBEzlaUtxBk2Bd6/zcoF1K/qG
X-Gm-Gg: Acq92OE2U9WlTYWSkDTwAxspqj8TsgbcSPLwkDwJszrLzxjGhLKYt4/k80+aCawXJfS
	xM5MgZ/eXTaVgpt2MbHCJF++WrLcegLciwVT/TXpApSjOeaIlfTaSGYjvw8/LctHXhnePY1akD0
	wYVOABs4IgJYNdQWNo8P0HYrmGhvZFSZdFShvugLykAqIuUzRSiITEFoYMMhqgOtwK0RnbJEix6
	fHFRW2nlLUdtUFvnrZMhIW6m4TR6UHgkRmRVpwDZMPcITCqoguqJOkH9KSfW2afVnvtzS5sQPS/
	d94+mQ==
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45e73eb2ab3mr19018195f8f.16.1779192834238;
        Tue, 19 May 2026 05:13:54 -0700 (PDT)
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id
 ffacd0b85a97d-45e73eb2ab3mr19018142f8f.16.1779192833807; Tue, 19 May 2026
 05:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
 <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
 <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
 <agxFbniU_6eQ98t2@willie-the-truck> <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
In-Reply-To: <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 19 May 2026 14:13:41 +0200
X-Gm-Features: AVHnY4KnZP7vwbtgqcU4-2-Suro94ZjhbnxjZ4Hm6Me_3CnnH2LMZ4Ptbe46Vgg
Message-ID: <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kvmarm@lists.linux.dev, linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:44=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> > > So... what next? Is one of the other KVM/arm64 maintainers going to
> > > speak up? Paolo would you consider taking the fixes through your tree
> > > directly?

I admit that my knowledge of Arm is really limited, and I do not
understand which IIDR values have architecturally allowed behaviors
and which (if any) were made up by KVM; but even if I cannot honestly
remark on the code or even the approach, a compatibility knob is the
right thing to have.  That's a userspace API design matter, not an Arm
or GIC matter.

I hope that Marc provides a better explanation of why he believes
https://lore.kernel.org/all/20260511113558.3325004-2-dwmw2@infradead.org/
shouldn't be accepted, because I am more than a bit puzzled about
*why* that patch is being rejected or (in v3) so far ignored. Marc in
this thread wrote: "If userspace is not a total joke, it will read all
the ID registers, and configure what it wants to see, assuming it is a
feature that can be configured (not everything can, because the
architecture itself is not fully backward compatible)". But in this
case there's an ID register that tells KVM if userspace wants the old
or the new behavior, independent of whether that old behavior is
architecturally valid or not.

I will certainly take this patch, but I won't override Marc. However
I'd like to better understand his point of view, because right now I
just don't get it.

> If KVM on arm64 doesn't aspire to maintain guest compatibility across
> host kernel changes =E2=80=94 regardless of whether the previous kernel's
> behaviour was "blessed" by the architecture specification or not =E2=80=
=94 then
> it does not meet the expectation that we have of KVM implementations in
> the Linux kernel.

I agree with the "aspire" wording. Even if it's not going to be 100%
achievable, KVM *needs* to aspire to maintain both guest compatibility
and architecture precision. Sometimes it's impossible, sometimes there
are constraints that require you to trade off one for another (e.g.
via quirks, or by breaking behavior that no sane guest would have
cared about). But in general as a maintainer you don't *get* to
choose.

Paolo

> Or indeed the standards that we've held for Linux kernel ABIs for the
> last 35 years.

