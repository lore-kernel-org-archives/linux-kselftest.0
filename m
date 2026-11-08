Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126415;
	b=aYWUDQ0VHyatPRuR/YN44W+M1CqwuK/sIdw137Z5h/de3B1NDX4CN1d3qbpf+SsT72Mn
	 kq6R0BSTXiM5g94rgdTLMClaBg5ql+LqFY4+9qS8+0/jJ2Tb1V8ASfrJOlW7GUlOHaFCq
	 bvSm/bEPyCHwYTAtuWqNeShDVpbq7AksuhEbSXNf66vbRTYw4ctDD/tWyTMp8r9P/xD+c
	 FMgJ8FdVdOaT4reS1XgW9jg0u4sZFTyKOInaocX4INrFQeYMy0vDe879xUoSUywSltS7I
	 mrTBGZhN3k/kME6XlN42Q2gnUmRYzZdj5KJZXN4mBnmICqIcz0bgtFqHn3DXxLApXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126415;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p4OcSAvcvQKsjkU4ru+MvGNBWR2vHDxkyHmPg+JgZAI=;
	b=kpJuGwOqN6OGJCg2G1rsBL6qEt4e7rDXLcbr3rq+ck5N3mccLCWF8VdtHHbnlnwMfaTt
	 Pmzs7f1zHsIhI5/UxPvxHqd0S7Iw4I7o+suRNnstkyhc6Qz0CY7mK4/S8o6w1QyCGecWQ
	 y8hffrqo6gTtR3W1Lyz2XzMHBfU0BRJkoikPbvMoWlAdHiwkfEhL4OBcb+n9I5NBaGyd3
	 8Q+18OoLvRt98LFmigZnFrNrUl19tXFa5BPpMBpS64rLw5DQpZOm+f8Ximcx8OTRHUQ6v
	 f2R0kWLGxemKMK8GgM6gvhii2X8rWAaSlCLR0zqQrb7hSqQu6p4cWCu0dd56YLIhI8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7mXUay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F67606A321
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7mXUay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556A11F008A4
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794126415;
	bh=p4OcSAvcvQKsjkU4ru+MvGNBWR2vHDxkyHmPg+JgZAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Oq7mXUayhQTDePVUjrfThAEG1V7e8Y9jHk7AEkIGpjTfkJ74OuNKPp2JUR7gO6tjO
	 gK8sjs0oIZYhKDO6UAQr8qwL/YVbv56dLKzgtpDd7Ua8fA1u/US0Lt6Z7nqH5rpA4e
	 /IbdbI//jYesPChnrmZ3wF53SnhaOo9IpQJRu/gjg2BgoiNbccUOk2BlPXeSHLr2bJ
	 W+AKvkmtSnFlVXENHlF79lpkVV5/tb9l3kXutdiZPrBwEESDq5a9oN/zvlNORF7AkL
	 cVdyb9kv+rjJRYxLzhIkLE1kUTtu2vZibPxBIDsg25TnlJwIVxiE8uI0sMGN6rYzyO
	 hqnXX48hdsztA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so249441a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 00:26:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwhwJVGddy2rrNajpq8G8DGj7qeCIVV9CJW0IPETCd6zpc4usSsfsbwNgsOXtBH+ZDEjxvZwOos/zs+YyUH7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JfcttL8MFIkNaZ6P0YwoVlzb4bALrzvq5vRANcF6nFniXu+m0
	YrAv0ZGV2gkktlM6EzDsuR7nZ4craLrM7cpZJIZVIBpX8T5qXoEBIsopbg9MEPL3F2/kJgaxsri
	SJJvmEnexe5s7KeMKy9x0CqNDV4miRFY=
X-Received: by 2002:a05:6402:1ecc:b0:6b7:1c:eaf2 with SMTP id
 4fb4d7f45d1cf-6b7224041dfmr591123a12.7.1794126413758; Sun, 08 Nov 2026
 00:26:53 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029172956.20791-1-dongtai.guo@linux.dev> <20261029172956.20791-6-dongtai.guo@linux.dev>
 <aux9Hm0QFJLUDPWv@kernel.org> <CAAhV-H7Dsnz03iXChzE6nYM2cs+D6fdDFiWrDxX5jM13kYL6HA@mail.gmail.com>
 <auypq8_7T-vml5_B@kernel.org> <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
 <avAvdiYY7SJ_Gfwt@kernel.org>
In-Reply-To: <avAvdiYY7SJ_Gfwt@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 16:26:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5q2SiDJC+ZSA4F7kw2vO=Y+c5J-aNg=PNMoh_CZ7qWdg@mail.gmail.com>
X-Gm-Features: AclHuK9UKAm9d_ZAky8YF1Z-Jn3w5G8u3fB621EiI1G-bSq5xcRQq5mtls0NIdA
Message-ID: <CAAhV-H5q2SiDJC+ZSA4F7kw2vO=Y+c5J-aNg=PNMoh_CZ7qWdg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] LoongArch: Allow memblock arrays to resize
To: Mike Rapoport <rppt@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ardb@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:14=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:35:01PM +0800, Huacai Chen wrote:
> > On Fri, Nov 6, 2026 at 12:07=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Thu, Nov 05, 2026 at 11:07:01PM +0800, Huacai Chen wrote:
> > > > Hi, Mike,
> > > >
> > > > On Thu, Nov 5, 2026 at 8:57=E2=80=AFPM Mike Rapoport <rppt@kernel.o=
rg> wrote:
> > > > >
> > > > > On Fri, Oct 30, 2026 at 02:29:52AM +0900, George Guo wrote:
> > > > > > From: George Guo <guodongtai@kylinos.cn>
> > > > > >
> > > > > > LoongArch never calls memblock_allow_resize(), so the reserved =
region
> > > > > > array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
> > > > > > (INIT_MEMBLOCK_REGIONS + NR_CPUS).
> > > > >
> > > > > This might be something to fix independent of KHO.
> > > > >
> > > > > Huacai,
> > > > >
> > > > > What's the reason LoongArch never enables memblock resizing and w=
hy it
> > > > > defines INIT_MEMBLOCK_RESERVED_REGIONS to include NR_CPUS?
> > > > At first we didn't define INIT_MEMBLOCK_RESERVED_REGIONS, then we g=
ot
> > > > boot failures on a 128-cores machine, so define it, and the value i=
s
> > > > similar to arm64.
> > >
> > > AFAIR, arm64 had to reserve some per cpu data before they could enabl=
e
> > > memblock resizing, so they had to make it static.
> > LoongArch is similar, so below 64-cores machine has no problem.
> >
> > >
> > > > The reason LoongArch never enables memblock resizing is because the=
 mm
> > > > code is derived from MIPS, and MIPS never enables it.
> > >
> > > If that's the only reason, you might want to revisit that :)
> > Yes, it seems we need memblock_allow_resize(), but maybe it is better
> > to bring back paging_init()? Most other archs call
> > memblock_allow_resize() in paging_init().
>
> paging_init() is a historical relict that hugely misnamed everywhere :)
>
> I think platform_init() should be fine.
If paging_init() is unnecessary, then arch_mem_init() is better than
platform_init(), at least the name is better.

Huacai

>
> As far as I can tell, by the time platform_init() calls init_numa_memory(=
),
> all memory reservations that must happen before any memblock allocations
> are done.
>
> > Huacai
>
> --
> Sincerely yours,
> Mike.
