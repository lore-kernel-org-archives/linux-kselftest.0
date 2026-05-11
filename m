Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D4402B8F
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514064; cv=pass; b=b+J9ah2ZLC6IKwXpsBbd8QdAXtxQJD7nagJrXEdnZcNnWiR7PxD4qxVLN/MDnEqHEkvrXw1nTDwzspChDwW31M6z9IhqUM36De9pdE5P/akIeoh2LPaC9A61E7KFwW0hHQuqLWs3XWv0XrgQRReBwzWn9FAIyIlS3cckQFP+2rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514064; c=relaxed/simple;
	bh=ufOOEfTlvP04cNgy2oV7GSg0scHY29TiT5FrCMkncRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJn3XQ+Pb/3qGGJaDHcIcGXhO4xwhXXq4KxcO1EJTFn0VvCLvV6LkQYx0ZYmAIDQXdvdBhAg94GPxYCKIkKg9f/3rsP+V+MKm12eodDIltA0ppmK8tgHNn92/hO2FzeeJuoac9WqU/S9blx6mGbYb3nVGjVhTUmnxqFEYXz0na8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxnX0drk; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxnX0drk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso175a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 08:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514061; cv=none;
        d=google.com; s=arc-20240605;
        b=PEAdlsUi0L4yRGS17ODhteL42Iap/3LsRGawVmfMeCgXM8tyI64MKC6slh5OhvEdEo
         5gN8I0ORrGVJz68reUktlCgu6Dzk87gp2+Z8mdq/Jeu6UEvfZGEimdUc15rDgmPWJ2C0
         LLzGLbjP1vKHkV7T6YP0uyphgnGuHu2C2tkjMBtxcqeG4k5YL/x+lEanW0kR4jnngGzE
         JUn46ZHrvBzo+5aTHffvtrhXPcY4oVMeKBy+90L4/9u9UHBJtGra6HEWuggukh8Buvo+
         lS6vZZk9JQEIMEB4fYXZbMchTLWxM0Xqz2Oq2/lP1MnqG10zpgzcixmN9QWCaRqWLpup
         Gg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufOOEfTlvP04cNgy2oV7GSg0scHY29TiT5FrCMkncRQ=;
        fh=fla4G/yqCcw13oT6iLnoUYvAaWN58gBvbw82T4Ti1mo=;
        b=CUMmODnGyc8rQvMd8cHtSlyLnRPSAbC7tCx9Q4cbCIPIFKVHrAp4XMXrMWP6jPpV3x
         nu4OOSqntjzCxd4l9R0eMKA6mbEgkGYgYPIMvZXzC0hzB7tkJK+gks7L8ePZ9+jIrepM
         nepVChc33i9Ka00TYlGybixZe5vKxc3R6Un324EjOc2PKPKwaw141UFrXTXacDVhC4ea
         CavgLNzJE+FY2N8ClQ1rEsyT2P+tP0D4YVWlaUJ2gqwHnS2TJ56W0RGWLNf1fdGFeY5y
         jqiiFWM5t+F9FVaXmcyc5HEAT8CjmuMUgb4mfH7N5PP8+NS3S4PiAJG0waYo1gtxmVhk
         MdJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778514061; x=1779118861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufOOEfTlvP04cNgy2oV7GSg0scHY29TiT5FrCMkncRQ=;
        b=rxnX0drk5INQmo4jkpunlGSwqA9rtFYuUJgC93N1LubyQIpMRBp8mucEahpkTcrz0o
         u6Tktl5xycpaqfg2o7X4qmEq+wc8B8rJXaXsE7T8hnmmh4m7BWbrzAZPznLjLEsH2osU
         /V0ckpUj506mcI+fDNH5MdnSy7NkF+BPFOYfxYHrTJsxV6YJxIlUraZafRxEHwLX/Qdi
         QpbgPrrYLCtQKYx4TuqLm48bOjFnLImDW5noGj7Q2cKUkvGUh97SzLEedeB1UDZZWyeF
         BJD4cP9Se8FFBjlnLi+nO13jDrlftWAdCJHhRf28XRrPkouUlezC5pkagd5wkGaDpaFV
         GQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514061; x=1779118861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ufOOEfTlvP04cNgy2oV7GSg0scHY29TiT5FrCMkncRQ=;
        b=Kk9o1VqmxqGP4Vh+WaQYpuSKgoR6+CgUuMMAMUCXutlq4Og0MTZxc+a7EFdLCs0adi
         Xm2hZ65hMwMWccwUV0ToY5tDjQHCM1eicrSpyBwrd2eG1PfM7+dyJM586iXfSWQ9z80F
         lTLThqXxlQ4daz2K/PzhQ+4crLMttseSh7Qc+eUnEnAJYngIrM9nf9rtmUSaH60nuohj
         lPGdUnEoxZ63HaSjeuSKaQotJKw1luo77qMCeWNmOs57PHoaz1YYXaPwZdufUQBeoMmw
         xztyqmIWM+9/WEfQ3YZc3A7NX8YgWEZ8WyrcY1w0nbJ6ATwTrPkYnPkyWaOfDzMS8ydC
         8ynA==
X-Forwarded-Encrypted: i=1; AFNElJ/gMJ798g4FJKmiOAqmAxeaR9gM3T6eMUdddIN8YLKjXvwk20qjPXFx6mDJt9uj3yeHH4ur15oi23+SWTPUrjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtXn5SPzw4o9eFVLBuZuT2xCjBD4S5VdTzlaTH3JXATXfZTib
	Qd34ShhZVlZQUq5RiXB3vYRW5b+PZhWGttfY+BhVQjHbBL7Cf5F2lcEctGuQ1yVTQduT4iYPPRP
	JUGqcs9HAnvvB9OA72WU6xsbePRA+oD4KRgV7VFUl
X-Gm-Gg: Acq92OHVketx2VAlnIuQRyl7Xaux+VSYfXVvInLcxzLxIUTfodLn6Lk00D81Upk7a+O
	nB4IDRKrBfTaseHwCxOuWx065TQUe6eb1S3427120XJ06mXLb3KaCYQsVQDYnl98Z0vvKcmeHcs
	ZtVWyzSwxybL/GCJ3dtgsvkG+xk9/G7CcUhWSAQwcLXyjWj+lpgFzCY0k/RaxNNBPe+kf3ObpW4
	s1rSNq2YEKmoOFAtc2Q9zuchbrp+flezG9FlLGtFq9NtpmJ8NNN4Oy4EhuROAmsV7qZoN2Ch1vY
	5NR6qztKdFgy0TSgUcNFwOacaf9VUT5zRevfSQV6eaeil867
X-Received: by 2002:a05:6402:614:b0:670:2007:668c with SMTP id
 4fb4d7f45d1cf-67f59b78c3dmr88770a12.4.1778514060584; Mon, 11 May 2026
 08:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer> <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
In-Reply-To: <agH1ZSdX_7QF8P_I@lucifer>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 May 2026 17:40:24 +0200
X-Gm-Features: AVHnY4JxEXoj7n_mRqXAKWqPwktvE7KbhSXwMMRM-MFeHT-iUzf-b5d6qJOEOUg
Message-ID: <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:32=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
> On Mon, May 11, 2026 at 05:19:50PM +0200, Jann Horn wrote:
> > On Mon, May 11, 2026 at 5:05=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org=
> wrote:
> > > Hmmm I think it's a bit debateable honestly. The ability to handle th=
ere being
> > > gaps is a _new thing_, so there are no semantics to speak of. Prevoiu=
sly
> > > mremap() simply required that you only span across a single VMA.
> >
> > FWIW, I think mremap() on a source region with gaps is such a
> > hazardous operation that nearly no userspace code should be doing it -
> > gaps are areas in which any mmap() call without a fixed address could
> > place unrelated mappings (unless stack VMAs are involved, which would
> > also be a weird scenario), so to use it safely, you have to, among
> > other things, make sure not to use libc malloc() at a time when that
> > could place an allocation in the gap (which means you also can't use
> > printf(), and so on, unless you have swapped out the memory
> > allocator), and make sure that you have no other threads that could be
> > doing that, and so on. There are rare circumstances under which it
> > could be safe, but I think it is almost always better to have a
> > PROT_NONE anonymous VMA or such as a placeholder.
>
> Well, we're holding the mmap write lock so none of that could happen
> _during_ the operation right?

Not during the operation, but right before the operation. So from the
userspace perspective, you have to know that there are no concurrent
threads that could be creating memory mappings at non-fixed addresses,
and you have to know that no mappings can have been created in the
memory range between when you checked that it's empty and when you
make the syscall.

> You might debate also the fact we hold that for an extended period.

Eh, I mean, that's also true if you call mmap() with MAP_FIXED on a
gigantic virtual address region with lots of populated PTEs in it or
such, or if you call mprotect() on a big region. I don't think it is
problematic that there are some very chonky MM syscalls you can make
that will hold the mmap_lock for a long time, as long as we don't
expect heavily multithreaded code to be doing those operations
frequently. (Being able to keep the mmap lock held in write mode for a
long time can be useful as an exploitation trick in some cases, but I
don't think that's easy enough to fix to be worth the trouble of
addressing it.)

> Honestly I probably shouldn't have allowed for this, I've had to do at
> least one fixup relating to it I seem to recall and the semantics are
> _clearly_ confusing.
>
> >
> > I think the right documentation for this is "do not use this on a
> > source region with gaps, it is technically possible but extremely
> > hazardous".
>
> Yeah, I mean on reflection, allowing it was probably a mistake.
>
> The real use case was 'my VMAs are fragmented and I don't want to have to
> know about VMA merge rules in order to move them', i.e. no gaps.
>
> I will do a manpage update and indicate that it probably shouldn't be use=
d
> but if it is, the sematics are such that gaps are not propagated (i.e. it
> is as if you mremap()'d each individually).

Thanks!
