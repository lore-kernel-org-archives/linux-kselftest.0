Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975713;
	b=RATADO82gLg6oQIFtqc8Tn6qxvmZdo5Bjpzxua2TGZ6WkWdnzxPiTEkc5mLdkx1W7HS/
	 PdKZfKYXvpKvYoAC0rcNiavQmemQqhB5AOX3fzkDvJTAbfWjoGeTKr4vk/sFoViCxYome
	 BEe8FmIqOjiKHiNw6HWU++l7LBlS1QMHthgBVnSsgal07/kdaLM13rnWejKE3nCPRFWJC
	 M7IXg/j0zoJlw6OFGw9hSTVlXzG1EUOuNtHwKrTVSJlCf7bOcrro2VmSbtvXRcx3rde61
	 b0ppVK8M/lqmLl8DZS7wP243HkQMsB1BmgCgeKsKsR0mQeO+1IuXdoqSVABdrizL9Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975713;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ABFV9qqW5v9B/veTK1qFSxVFzw8UX9r8phfo5f88bHM=;
	b=PVBuZaRXuqCnnWI4vIw3QmbXCdj/RMeV+t3GPCKeAnDag3Y/RCYo1fT84KmuAi9ZofLj
	 fQc/lJWcDiZ+Mda6rJPhYPHK/xEH475QZ9rK1DYPO8ONgAhY/E8Odw+ESovoXwZPwt7WE
	 ZM9BUPa691ET5ep4QxHyuJUckITTovxxHfStRgajWbFUCX2v/JdnZWiuD7pYO5x0B5hI0
	 mNALv8zUAaC0NxVrSzqd0gtW8dlgzWNtra5uDH/rw3X6nOZjGdwnRojPQfl8qGEXKvUmR
	 YpYlNmreZYL3m0WwyZeDF75ZyWiQTbC1Vf5rUKgg2g/7KNU7GXCtWogOaqwzv/IZobQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NW+CiO38;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675D606A330
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NW+CiO38
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EFD1F008BD
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975712;
	bh=ABFV9qqW5v9B/veTK1qFSxVFzw8UX9r8phfo5f88bHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NW+CiO38XAipmRfvZb5pGzPtdB2zoSkBFY3QqVyfdPAFpM6fBH+ps3C/WRq7ZfzE2
	 o7WUwzmqQQ3PkE3gvMRfgOCP9XzXNGtg12V8S2fi5UZdZmB4q3mp8G+xTIwOtPAtXN
	 3uNZAFMQ5hm//mnLWi8wTsZWz9GGPkHPOFoVPJnbpwCohuzkA8Xk3qgp15B/Qd4kC/
	 XXTNMv1YKeN4P6VHCjS/J2rMGpKFjXdtYP8tYgnawdShP5GHiBIrTMXGFyBBhzj8Df
	 6SsOM4/1dFVK9LCCm2l2qkHcdnKYWKMJ3f1ACFpTO2jqaReJZQlahdWNR0bptLYcEb
	 BhkFz9AHmxvVw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so706562a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 06:35:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJ5qrT36duy7w5z8XiKKcppZvkehJqxV3Bh6SG2oZXhDE7rJ/+MKKkb9XsYusCb72mINpjR9if/lwV4iQT6Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z92G0ijtJmcJ2OFy0b/Z7FykK2luDs+9Dr1pyo5SZQVRnv1p5mR
	P7S7sXGXFP6CrmyQYkHxKuUnJmc4cKBIdmz75qwT4NRxAyouttnhGoNpzyCEcR2dCXl7VymQzp3
	pQPG+MTEwaRYD2AFbyFaHbK5pqa75Q20=
X-Received: by 2002:a05:6402:1e94:b0:6b6:edd7:7928 with SMTP id
 4fb4d7f45d1cf-6b6edd7899emr802991a12.26.1793975711577; Fri, 06 Nov 2026
 06:35:11 -0800 (PST)
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
 <auypq8_7T-vml5_B@kernel.org>
In-Reply-To: <auypq8_7T-vml5_B@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 6 Nov 2026 22:35:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
X-Gm-Features: AclHuK9KCIrf61pzsewLNfcg32ftrSETM4BdWXL6OTYNNDPn4F3U0UamXyiZ-QM
Message-ID: <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 12:07=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Nov 05, 2026 at 11:07:01PM +0800, Huacai Chen wrote:
> > Hi, Mike,
> >
> > On Thu, Nov 5, 2026 at 8:57=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > On Fri, Oct 30, 2026 at 02:29:52AM +0900, George Guo wrote:
> > > > From: George Guo <guodongtai@kylinos.cn>
> > > >
> > > > LoongArch never calls memblock_allow_resize(), so the reserved regi=
on
> > > > array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
> > > > (INIT_MEMBLOCK_REGIONS + NR_CPUS).
> > >
> > > This might be something to fix independent of KHO.
> > >
> > > Huacai,
> > >
> > > What's the reason LoongArch never enables memblock resizing and why i=
t
> > > defines INIT_MEMBLOCK_RESERVED_REGIONS to include NR_CPUS?
> > At first we didn't define INIT_MEMBLOCK_RESERVED_REGIONS, then we got
> > boot failures on a 128-cores machine, so define it, and the value is
> > similar to arm64.
>
> AFAIR, arm64 had to reserve some per cpu data before they could enable
> memblock resizing, so they had to make it static.
LoongArch is similar, so below 64-cores machine has no problem.

>
> > The reason LoongArch never enables memblock resizing is because the mm
> > code is derived from MIPS, and MIPS never enables it.
>
> If that's the only reason, you might want to revisit that :)
Yes, it seems we need memblock_allow_resize(), but maybe it is better
to bring back paging_init()? Most other archs call
memblock_allow_resize() in paging_init().

Huacai

>
> > Huacai
> >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
> --
> Sincerely yours,
> Mike.
