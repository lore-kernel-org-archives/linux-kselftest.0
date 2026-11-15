Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769919;
	b=2UYw7biZG0LNLSvlgOuFlbZxpWWNENWUepdf+MYDFHmlG+vGJqyjHD0mY/obX2hlHo/G
	 RUr39Gxg6OgNdKJ1DR6eVaRLjy3En2Xq45OD4ZQgrNqxnmN7rdz72j1YOdbLOAtuv73KX
	 hNRGiTXcS+9lcjCVU0+LkbjnOZqgzFBmKRkTrSVBF1yXYh/Oh1dYejzJ/JSce4hTP6ZS1
	 NHN47d5OVsEkA9+o4disIEVJJ5KWjkVF/RemaS52J1cVNXJso+qyQhrrtrPT9G1Uh6KNA
	 z7zoo0eZR9cA4tVk0hd3Fz9oF+bvdS31G9n0smqNY2ZW9t0swDU/SfmYRFTu/6OwaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769919;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZxIzf1rOBt5UVX6T+4jsFLqJIyKEfYJr89yjL6zf2/U=;
	b=Q3ze3zc9k03bghTOtdjnFpSUGzaY/Bx3T6omCoQUoy5DAzmyrNPfv5h0SkwibDxtYtwh
	 IUhLu1m0PL+xkOXAU47f3ZeHNw82wpv3/XdoTf7Ld+hCEbgqCq41E5Yp2YOMmpfGhcFMc
	 Nvwgd/CUvxNBNG4CDlZUVbFKMXMwHrXmGmsDR/XcwNaJxXwl96qWfJiGPART23CukxtYV
	 oYY4kYAKrPlReFErDemI1EUyXYjj5C8X2ufW9OGFsOlcZAk7kPlmc75Qo9+ZPoMPgNgNe
	 ykJYohuyS/7um4Cwwxnsdqvx6hNe+b1xfbTvQPzXVLO2XcBrdYgpj4OWwPuSDWgb7mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQb71zmK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B09606A31D;
	Sun, 15 Nov 2026 19:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQb71zmK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BA51F000C4;
	Sun, 15 Nov 2026 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769918;
	bh=ZxIzf1rOBt5UVX6T+4jsFLqJIyKEfYJr89yjL6zf2/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQb71zmKT7FEnL7pd/rUA4mBP+ArRSohAYMmWp7K3aKZPN53O8r4cQUMdmW0cK6kO
	 26rQC2rpgdE1JrBb2SO9nmpP8d3+zhlkOiAFAFNK21MAWV1lWq+uB9txYcdInHf02V
	 HMVT12eD2GhINHfUUCEw4DOUxY2NGlqUR+RvqGk9UP5O/fVgmfmV4/8lQAwDQ1gtSw
	 6BVYpuvBUcrF5MXElUHmD45Qkke4sZgKaWtfRD72YX0jPxRFztd6JHJs+7Zufj+bOz
	 rWZ4jM3N2KCmsgYhyofDmNzbWszbLyBnzTMB/E6Ej3mvzqqRL9UiKWsdztLH/RDJNo
	 QsdzUX890TszQ==
Date: Sun, 15 Nov 2026 21:11:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
Message-ID: <avoD9gIBLvMW4vPp@kernel.org>
References: <cover.1794383544.git.chris@chrisdown.name>
 <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
 <179443886218.2329176.10742245280418377061.b4-review@b4>
 <20261113003059.056dd036a6546756@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113003059.056dd036a6546756@chrisdown.name>

Hi Chris,

On Fri, Nov 13, 2026 at 12:30:59AM -0800, Chris Down wrote:
> Hi Pasha,
> 
> Pasha Tatashin writes:
> > > The reservation varies with the kernel, memory size, NUMA layout and
> > > command line. Our fleet collector needs the actual size from each host
> > > so we can decide where to enable KHO and catch a kernel release that
> > > takes those hosts over their bootmem budget.
> > 
> > HM, that works for cold boot not for live update :-)
> 
> Yeah, that's true :-) A kernel we live update into just inherits the areas, so
> we'd only see a release change the size once hosts cold boot into it. I'll say
> that in the changelog in v2.
> 
> > > Today the collector would have to sum kho/out/bootmem_len in debugfs,
> > > which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
> > > to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
> > 
> > Is this a different bug?
> 
> I think so, yes. Bootmem pageblocks are MIGRATE_CMA, so their free pages are
> counted in NR_FREE_CMA_PAGES, but totalcma_pages only counts the areas that
> mm/cma.c knows about.
> 
> zone->cma_pages is a separate problem. It only gets bootmem added by
> init_cma_reserved_pageblock() in kho_init(), and on a KHO boot we return before
> we get there.
> 
> I can send patches for those separately if you agree that bootmem should be
> counted in both.

Yes, please :)

> It wouldn't give us the bootmem size though, because CmaTotal
> would still include any other CMA areas.
> 
> > I have some concerns about exposing this as a stable API. What if we get
> > rid of bootmem or make it resizable? We only recently renamed it from
> > scratch to bootmem, and we have been exploring for way to optimize it.
> > 
> > I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for
> > now, and not worry about it being stable.
> 
> That's fair. I'll move it to /sys/kernel/debug/kho/bootmem_size in v2, and we
> can look at sysfs again once bootmem has settled down.

The sysfs vs debugfs argument applies to anything KHO/LUO right now.

But we'll need sysfs at some point to lift the requirement for debugfs
mount.
 
> > Keeping it together with the rest of KHO code would be better.
> 
> Will do, it'll go in kexec_handover_debugfs.c next to the other bootmem files.
> 
> The kho_incoming files in 6/9 are already in kexec_handover.c, but kexec_core.c
> still adds the group to /sys/kernel/kexec. Is that ok, or would you rather KHO
> set that up itself as well?

We'll need sysfs at some point to lift the requirement for debugfs mount.
And I think it can live in /sys/kernel/kho and there we can have incoming
and outgoing and the implementation can be in kernel/liveupdate/kho-sysfs.[ch]

BTW, kexec_handover_debugfs.c was initially given the "full" name because
it lived along kexec_* in kernel. These days I believe we can make it
kho-debugfs.c

I promise to look at the rest of the series Really Soon :)

> Thanks!
> 
> Chris

-- 
Sincerely yours,
Mike.
