Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F382BEC2A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406970; cv=none; b=VAB+n5LIow/nHBAIzrV2c4/Swir4A0YPNeHkA9p1bHPsLo6JsZoFIk0ZjtqdccGl15A8t86j3ilwF19P2ntzk6HRDp5okTCpEwvrS7QLCogydRyJWPU6Be/Rd48nD7c3VDlvRXuIqlx/cPL2hMc8o8/k528kxy3/WvyTj+MU+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406970; c=relaxed/simple;
	bh=f94cZgTZJW4iWE7r4y4Agv+EdHqjRzOhJnMgcftx1s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9mVU1JVClxOHkFBcc6AVRuGtVS4xCdBL82stD04TDXSPw93A7bgA3A3WFFnuAsAHPi0bvj4PhwjX/b7QJEv7BZ0tLdNI2Lzqh301BC4dfhEkpCaUNl9GvhxEEPW6T4P1FXuEFYX77L0RAtdhezAb6AcqI52K5X39+0VfHKkKf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3TyWO2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3TyWO2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DCDC2BCC6
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406970;
	bh=f94cZgTZJW4iWE7r4y4Agv+EdHqjRzOhJnMgcftx1s0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L3TyWO2RaWI7Qr7K+U1eHoxj9NPRqHuY8/aE1zGn7CgYj7RH27XXweus0y/VxFNwo
	 5PtwwrGBqlEFpDl/4V5fFaE5R26HX9bQG9gexBD76upKNLt9Zjnr6WzQjZQM3SJbnP
	 hQgERltARaesck+woHdDfHdHzlqOstOAGxB+IgSM/JiOP8vPHqbMjEnQeF+cMfs4WJ
	 4f5h0q6B4samFjnV6CaKW01fEfJaqBHQ0J4ctKPl/HbzglWNgRFZEFjdi0pj414/5K
	 DpM2trCQtbrYRohsZwytMoO6AT83Il6YS571z7/odmn8dfpt3fOj1RiWGGoY+0V6EP
	 B5Z30MMwfAy7w==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so718516466b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 19:49:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6Wif+BCpVLI5lXqVuOngCQzYVstBxy8UvUFs/r281hyatOkIeTPGIo2P67vkxyGerCZUCTKY+Oxb96t6UhgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwplG1DwmUYgYBXTkNTmC3zD68tiQWN84NK6Bw3S1iXpQk3lmwK
	NAwiU8pIvcwnMk0MiEgpokW3sqbovsMrZLMoG7/IS2QLhAGEF/fZDPSbRCsA8jA/4Q3pDuJ/IV1
	rUY0mpKiTV5RhGu0yp1qrYzPwJmB8sDE=
X-Received: by 2002:a17:907:a609:b0:b97:cbb9:2290 with SMTP id
 a640c23a62f3a-b9a3f1665f6mr119783966b.11.1774406968649; Tue, 24 Mar 2026
 19:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com> <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com> <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
 <acNH6C6Ay7As4y60@redhat.com>
In-Reply-To: <acNH6C6Ay7As4y60@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 24 Mar 2026 19:49:17 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>
X-Gm-Features: AaiRm50VK0jNxXzN3lqG3s8-GclVxKcP8tps6ilvisx0LReDcBcJLdXYVJVJk04
Message-ID: <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>
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

On Tue, Mar 24, 2026 at 7:26=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> On Tue, Mar 24, 2026 at 01:28:12PM -0700, Yosry Ahmed wrote:
> > > > Sashiko claims that 512 pages will end up consuming 11K to 15K in
> > > > zswap with this setup, do you know what the actual number is?
> > >
> > > Not very sure, I guess each 64K page contains 1 byte of 'a' and 65535=
 bytes
> > > of zero. A single page like that compresses down to roughly 20=E2=80=
=9330 bytes
> > > (a short literal plus a very long zero run, plus frame/header overhea=
d).
> > > So the estimate is roughly 512 =C3=97 25 bytes =E2=89=88 12.8 KB, whi=
ch is where the
> > > "11 to 15 kilobytes" ballpark comes from.
> > >
> > > > Especially with different compressors? If it's close to 64K, this
> > > > might be a problem.
> > >
> > > Yes, good point, when I swith to use 'zstd' compressor, it doesn't wo=
rk.
> > >
> > > > Maybe we can fill half of each page with increasing values? It shou=
ld
> > > > still be compressible but not too compressible.
> > >
> > > I tried, this method works on Lzo algorithm but not Zstd.
> > > Anyway, I am still investigating.
> >
> > Do you mean the compressibility is still very high on zstd? I vaguely
> > remember filling a page with repeating patterns (e.g. alphabet
> > letters) seemed to produce a decent compression ratio, but I don't
> > remember the specifics.
> >
> > I am pretty sure an LLM could figure out what values will work for
> > different compression algorithms :)
>
> Well, I have tried many ways for ditry each page of the total, but none
> works on zstd compreseor.
>
> e.g,.
>
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -9,6 +9,7 @@
>  #include <string.h>
>  #include <sys/wait.h>
>  #include <sys/mman.h>
> +#include <sys/random.h>
>
>  #include "kselftest.h"
>  #include "cgroup_util.h"
> @@ -473,8 +474,12 @@ static int test_no_invasive_cgroup_shrink(const char=
 *root)
>         if (cg_enter_current(control_group))
>                 goto out;
>         control_allocation =3D malloc(control_allocation_size);
> -       for (int i =3D 0; i < control_allocation_size; i +=3D page_size)
> -               control_allocation[i] =3D (char)((i / page_size) + 1);
> +       unsigned int nr_pages =3D control_allocation_size/page_size;
> +       for (int i =3D 0; i < nr_pages; i++) {
> +               unsigned long off =3D (unsigned long)i * page_size;
> +               memset(&control_allocation[off], 0, page_size);
> +               getrandom(&control_allocation[off], nr_pages/2, 0);

This should be page_size/2, right?

nr_pages is 1024 IIUC, so that's 512 bytes only. If the page size is
64K, we're leaving 63.5K (99% of the page) as zeroes.


> +       }
>         if (cg_read_key_long(control_group, "memory.stat", "zswapped") < =
1)
>                 goto out;
>
> Even I tried to set random data for all of the pages, they still not
> works (zstd). But it can be worked on lzo compressor, I don't know if
> the zstd have any addtional configures or I missed anything there.
>
> My current thought is just to satisfy the lzo (default) compressor in
> this patch series, and leave the zstd for additional work.
>
> What do you think? any better idea?

Let's check if using page_size/2 fixes it first. If a page is 100%
filled with random data it should be incompressible, so I would be
surprised if 50% random data yields a very high compression ratio.

It would also help if you check what the compression ratio actually is
(i.e. compressed_size / uncompressed_size).
