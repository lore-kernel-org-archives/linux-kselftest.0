Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F242050
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311159; cv=none; b=B9lrdhtJCFrnJEn3IzWMwNwKsJkBcP7eYbmOnOBB7KlsYFvSBa4cd+1NfuKSEzSLXotU/W+xqSnEs+ZuDqqp2FpEIomH1WNqiM8EcmVIyeP/eQhTRoWTJl+D5wKrnjYkGrsgN6sLFZscJlo6E+FyvijOIB9JIV5nMdBEEnh3UbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311159; c=relaxed/simple;
	bh=+H+s+aYHdcYd04gEc6EzQ/seiFgB/hzUY1F9yPfmoQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5oweAOE1vZ7rEDFdRsh9XbJSf+OkLZPWtVftqfxzpB0fQAbLWR0kXrr/LM1xyiHfTlxoSU6KuSfuYVhnD8SnL8gN+kjHejzbEIBWmcKtDTiNoTEq/1RltCFvyCswwD+RidsaNTbk5Otl98VSE59SCF+sWWQwcjNZ4hE5ZEEnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbwpHILI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbwpHILI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7660C2BCB9
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311159;
	bh=+H+s+aYHdcYd04gEc6EzQ/seiFgB/hzUY1F9yPfmoQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EbwpHILIgrDz16B2s4kO53Xdxoz8B3HvC5aZbHN5d3HrTUxTCzn2Gshz/wT8+Iihj
	 YArY+6RnEkySw/spJV2mmre1jWbAszzRKIqcDJ08zI3HGB4b31IzOOVC8yaSWNXf2t
	 NTjhsypu8gSwHGgcJVS1xzmRHvfbegIfP3BAodFz8Fa/aNMJdCuod/exVPymq9JF55
	 0sdhwaBPKzJIu2oe30G3+27CCAEisedicZBtpa3nUA+JhVgO5NLguf6xA179OYj31N
	 hRd7hva+/9wE+6TE4Zly1QS274Yp9RVuKpkGCcVzY8KFMQK0YIJN2cGXezfwH4P2MZ
	 qoh+ih4iO/A5A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6674cba2c50so8377522a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:12:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvLrR+b3m+duWN1ZH9e+tkSh2Fi8K9HKyvEfl3BncpmdcB18yXC0UNDdpebADBjOVcPBHjNzNJQ1MMCRj/wCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQDq7uJfjZylzdLOdQSKD+e8kK1mZ6sewz2bse4ptRModoiAew
	cdDpfNKz6qpD5GTgUbzveDpw3YkohJ5uQDT45Q3D3MkcVeQYdH2gjC82sXpgdo6gXt+dmsabam0
	9AtJ6yq8+MlUzYKmDVAlMHh7s4tBGkHs=
X-Received: by 2002:a17:907:9454:b0:b98:f1d:6a63 with SMTP id
 a640c23a62f3a-b9886321306mr94675066b.9.1774311158414; Mon, 23 Mar 2026
 17:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
In-Reply-To: <acCyPNCBoTGAJjfs@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 23 Mar 2026 17:12:27 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
X-Gm-Features: AaiRm52HZcCGreQcxDKdZ-TsdspC_G13k_3Z2yzugtPstoSi8EP305bZwbreA_8
Message-ID: <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
To: Li Wang <liwang@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com, yosryahmed@google.com, 
	nphamcs@gmail.com, hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com, 
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 8:23=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> On Sun, Mar 22, 2026 at 09:18:51AM -0700, Andrew Morton wrote:
> > On Sun, 22 Mar 2026 14:10:31 +0800 Li Wang <liwang@redhat.com> wrote:
> >
> > > This patchset aims to fix various spurious failures and improve the o=
verall
> > > robustness of the cgroup zswap selftests.
> >
> > AI review has questions:
> >       https://sashiko.dev/#/patchset/20260322061038.156146-1-liwang@red=
hat.com
>
> > [Sashiko comments in patch 4/7]
> > ...
> > Could we update this loop, along with the identical loops in
> > alloc_anon_noexit() and alloc_anon_50M_check_swap() shown below, to use
> > sysconf(_SC_PAGESIZE) instead?
>
> I found that Waiman submit another patch that do same thing like this
> suggestion. I'd consider to merge that one into my patch 4/7.
>
> So, let me talk to Waiman first.

Probably fits better in your patch.

> > The test data is generated by writing a single 'a' character per page, =
leaving
> > the rest zero-filled:
>
> >       for (int i =3D 0; i < control_allocation_size; i +=3D pagesize)
> >               control_allocation[i] =3D 'a';
>
> > This makes the data highly compressible. Because memory.max is set to h=
alf of
> > control_allocation_size, 512 pages are pushed into zswap.
>
> > 512 pages of mostly zeros can compress down to roughly 11 to 15 kilobyt=
es
> > using compressors like zstd, which is well below the 65536 byte (64k)
> > zswap.max limit on a 64k page system.
>
> > Since the limit might not be reached, writeback might never trigger,
> > causing the test to falsely fail. Should the test use incompressible da=
ta
> > or a lower fixed limit?
>
> If Sashiko suggests reducing compressibility, we'd need to fill a signifi=
cant
> fraction of each page with varied data, but that would work against the t=
est:
>
> zswap would reject poorly compressing pages and send them straight to swa=
p,
> and memory.stat:zswapped might never reach the threshold the test checks
> with cg_read_key_long(..., "zswapped") < 1.
>
> So, at most I'd keep the data highly compressible and just ensure non-zer=
o,
> unique-per-page markers.

Sashiko claims that 512 pages will end up consuming 11K to 15K in
zswap with this setup, do you know what the actual number is?
Especially with different compressors? If it's close to 64K, this
might be a problem.

Maybe we can fill half of each page with increasing values? It should
still be compressible but not too compressible.
