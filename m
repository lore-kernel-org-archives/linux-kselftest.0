Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2442D94A0
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512831; cv=pass; b=kLnLRb+E+mLIVrV16JGqbEYcMrdFoODJ9XL+tpv/tciQSeuvtAa7fKh5Kgra84rgIKlgiRlAcZ3MCKHQnYXPMKEnDqkkKAB6wNw+CTQX1UKn9idfDOGVWjBJx08j6J+VxglnNTZGzw5df/2ATFweM385VGlvOmtZlMo69Oa2nGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512831; c=relaxed/simple;
	bh=V8k4Cc0VITBpmnahmVzeaPg71KkhDPZXJsHnUUdJ2g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXCuTMqwFKg0vAlAhb24WDy+vPLmA/sSBVdM2eeTxOnPsfnJdr1yS7nuPfRYPm6LmKoOUOT+TVCsx0zrFoPdtDzwayNqUkDwFHohLDt97DSBloW/S1RTuu4G1RxeAFOrHQK/rXLXZMIcwuvf+DW5we2PLllUbRaCojRX3fKxHMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fzR1Y+nv; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fzR1Y+nv"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso352a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 08:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778512828; cv=none;
        d=google.com; s=arc-20240605;
        b=E5LewesZeQ/XH2lhb3cpfO6uLVj2WGvP9tr06kqUFOZdVzQz+IAhG8vbrZBibzdSV+
         mThPkg0oCaK0p7m3Eigs7xDvlzVVsiF95CT87HyIkVZQfjL1Bb6ZEvdcqCA2YhVOHAA0
         kmTUj9b4a92S5ux+6PE/a9hgdezQEtZDjT9Uy9vvu58YTN3nRUsGX6HDLfy9O8G2k8g1
         BRBwqJvjFt6+/LrDQ6lOtn6yV/+CQVh4TONzN8i1q/brlxkDHNSiAPphD1OjvFs7JPxc
         UM0k+PoxumABpHAd990+QanFVNr9NWqffQpYFy81kID3zX+ZUEJx4mTs9ldFuVsDdqSh
         UiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2dG1kfOBx0HJptuC6o6ArS4LPW49PGnYr8UK3AxYy8=;
        fh=CRUweqA7gVM9DkOX0c+ft8sf9BtTDaiyTJN6te9uIug=;
        b=YWo3lf7copaxK+yLlxSCHd3E/OlBWJayDPaPCr4zcKd7t+t3WU/G9WHhKxGZiWhaet
         LdRw6JdnTOioqf4t7f8Jr5MzB4ppWiiBpWb/WdtSdc/3mav3FMbyx4bew44OVQIihNC1
         xPuNtOtKExlrq0643fKjyLAWI0+/Zvef0koP8lssqDSIS2tSXM1c4HSCfScNeBagA404
         23EcvFc9OENxzodxvndMXQlgc7osw10w0/WTCy4awijHuRkGrYDfb1Njq+1B2ubjLUux
         xa184yJhV35LrpzOppga0lWSM8aNuiMkqLESij0HwMScPIGVcmmDZJeO1H2RYHE18vuG
         0hrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778512828; x=1779117628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2dG1kfOBx0HJptuC6o6ArS4LPW49PGnYr8UK3AxYy8=;
        b=fzR1Y+nvZqu+sXtXxjNT+1Q1lL7FlueLSjmUClODX9NNu4cQkPJw4p+J8yHKabOigG
         mONPhKwmEYCBmC7BsU+07Cbw/G4fyhMyMkg6pVgQKA7HY7koQCdXJgZBhXiUGBr8G1lG
         eDADm2NLUjfTKJfJ6d8YJ0Hu6b5Qxzk3bXzdY7dBYsChBoi2qiTMEH4BSH3+6cEGd3GZ
         7AUh8h2KromLlHISoG/t5WJZg6dJpwdGF+5674XOmHty7VGX1O10n/CjYuC1jCGsR3RK
         /z1qR5n5uBg7E4HQKjaM/bfP4O31PZ37YtpAv/etB1f6pSjptXUM+PIQJfPMpylBOlk7
         01hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512828; x=1779117628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2dG1kfOBx0HJptuC6o6ArS4LPW49PGnYr8UK3AxYy8=;
        b=JcLOanhokCdo97I6Ws+bibnScPRxFnDF5fQBf7xiVj0XaOQ01bUoaUtGrpTJY3xodE
         GpWfttCM/HPC1rebasykzzKDdCu0HXFk5pqWneOCb/QrSHQcYxXVM5Dnh8Cf6s2cxC6d
         lVyU/pva5xvMmlCwZHBEuDRcc5bWWDx5HM9TCraXnPfV4iAXzor/JJufGNefqeDXKg/T
         fRlcXQQPLLBl+lfP6zXdnxye/9Kw24kZOqMWBaipvnPVnWvCLiKeBN/oni/Xepzjcqbf
         ePbZGvu2UFMVFYvMRC6PLdw3UTMP+/BjO+IFX2GE39O6iS2yKoII05N44obIpwa+yAw/
         L5VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+65LJnk+InIjcE7D0VdQsCwir7V/+uqj0MAjXty29Uu4pWxfRvzbFv6LNawntE3v+TCerndblIwmVnBeDMUMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ70wAZpwFIC8AQn2aylOq4cV8TFgNnvaIQoNzx1BPXFnVfNx/
	aRGY+ATKY76By/tN46ZTI3jVhEkwXNfs3HMSNwZhF0NsusMKJoeIQZ2pvZ9RdcFqOrH63s30h1p
	5u6quMiEqbeUl68YuSPJqp3Tt9A2sPjv/IynMJ5id
X-Gm-Gg: Acq92OHzWc3SgZSY13gwkFeiR7K7oUEcU8Df4hC/k2nDOwJRK8K0bjCYVDwNtY5KkDw
	b3acBxxQknqmUbJGkfSFiIcOAZGyQcV6iYyj9KKH7/zAuAQ0tMxqq/aoL+1CQdIfYGcelqD+FUy
	qGFbzOXGVhDpL3cedJO0ZWCUpjxK4bXw/j83zSt5s9ph0RJUheQtYvXqGErbC7d47hfkwtXMude
	l+UV6Ad6xiZuSl7TqEeQwxLeRyxUxGe5btvwvK1TUZ6lpksf0pFuSt3GRF+AdP/S8nDKG7vaCUr
	elzMpATszUrGkSzRna8geQL5jIG8DeeABH/n53eJoCknPKTs
X-Received: by 2002:aa7:d44d:0:b0:670:9e9f:1a5e with SMTP id
 4fb4d7f45d1cf-67f5998f71dmr103041a12.2.1778512827673; Mon, 11 May 2026
 08:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com> <agHmO4i4YUhs3cSG@lucifer>
In-Reply-To: <agHmO4i4YUhs3cSG@lucifer>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 May 2026 17:19:50 +0200
X-Gm-Features: AVHnY4InzSL2AhuukjCngXl0RYuPKjoMy6hvuirqqPJQVud7h9Nv7GrmkhXycBU
Message-ID: <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:05=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
> On Thu, May 07, 2026 at 06:24:45PM +0000, fujunjie wrote:
> > When MREMAP_FIXED moves a range spanning multiple VMAs, remap_move()
> > iterates over the source VMAs and skips source holes.  For each source
> > VMA segment it narrows vrm->new_len to that segment length before calli=
ng
> > mremap_to(), so the MREMAP_FIXED destination unmap is also limited to t=
he
> > current segment.
> >
> > If the source range contains holes and the destination range is already
> > mapped, the destination subranges corresponding to those source holes c=
an
> > therefore survive the move.  That violates MREMAP_FIXED semantics, wher=
e
> > the destination range is supposed to be unmapped before the move, and i=
t
> > also means that preserved source gaps do not necessarily become gaps in
> > the destination.  Userspace can then observe mappings at destination
> > addresses that should have become holes.
>
> Hmmm I think it's a bit debateable honestly. The ability to handle there =
being
> gaps is a _new thing_, so there are no semantics to speak of. Prevoiusly
> mremap() simply required that you only span across a single VMA.

FWIW, I think mremap() on a source region with gaps is such a
hazardous operation that nearly no userspace code should be doing it -
gaps are areas in which any mmap() call without a fixed address could
place unrelated mappings (unless stack VMAs are involved, which would
also be a weird scenario), so to use it safely, you have to, among
other things, make sure not to use libc malloc() at a time when that
could place an allocation in the gap (which means you also can't use
printf(), and so on, unless you have swapped out the memory
allocator), and make sure that you have no other threads that could be
doing that, and so on. There are rare circumstances under which it
could be safe, but I think it is almost always better to have a
PROT_NONE anonymous VMA or such as a placeholder.

I think the right documentation for this is "do not use this on a
source region with gaps, it is technically possible but extremely
hazardous".
