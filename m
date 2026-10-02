Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AE44065B;
	Fri,  2 Oct 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928628; cv=none; b=hLhbc+Nq4sX3lVCy8fBUBTytDOlequG/y9M2CaJXjICw5lt6qcy2mWDByKkf8+vq0/U6EwX9uZ5Y6knTapozQSmXljFv3jM1ib+wA9M8i/CkqYFSowZvTuIvBAk454qarDP4uXcm+yKHQKKKoNwsUXqSxMTgUqIPBrQzCJ2jVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928628; c=relaxed/simple;
	bh=/jWlfTYISWDRdwB70XBgz/0rZ6uagYb5mFQFGQi3k1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWLHwkt/Nh6mtiOA6ynxM5G+ogwLmQOc3SRKgIk/7C/u2iDHUMNWPImKjDlOqmO5fQ6c8hQvKIn7hcndQkEE+as5ofFAEnT3WyOKLO+RgoqvMiWNs0zQi1/SmtSeWHuSfyw58Y043JkIAuxU3k4Y8HTaU41WRZUDk2XwqlH2mpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkKfj52w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkKfj52w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD511F000FF;
	Fri,  2 Oct 2026 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790928623;
	bh=BIHFM4YkUGLtT//ijgD4g07c9OxY00eHXMaA/kwG2nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkKfj52wi+HBtm4OSS7+TGHkipMV+dWZaiDRPkTP1OUg2cSZgWi236Wj6NYUE3zhP
	 cE/wLWLsAeog8taVdUpM5sc8E4yCibHvboHgqOHxAEG+Y5Z/wzqywqWTkRHX1PX8RJ
	 Y6MrqkaPJzwXRfn048jxdDXzNp00NQ6UuQjAuOmLFP1bfYlCjQ7TtK0Qzpq09+/X09
	 mUlW0HPJX0OTnzNLrxPH7PlPg13Ld0kUi9GjYTFEQg80JgThJuOQqXg7k0VabrPqqj
	 M9I4tH9JjiDYoMcnmK8F+JM777QiRIOEKoJxCdsUEHTj9cABRLPo4injcxApsYeJGY
	 nLF4S21X/85NQ==
Date: Fri, 2 Oct 2026 09:10:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, johannes@sipsolutions.net, 
	linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, 
	luto@amacapital.net, brendan.jackman@linux.dev, liuhangbin@gmail.com, corbet@lwn.net, 
	kees@kernel.org, broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, wad@chromium.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	geert@linux-m68k.org, daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
Message-ID: <ar9ldn036SgT-bq1@gremlin>
References: <20260929235711.2287931-1-thehajime@gmail.com>
 <20260929235711.2287931-2-thehajime@gmail.com>
 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
 <ar4br2vW7yZGd3gt@gremlin>
 <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
 <m2se2o3jyc.wl-thehajime@gmail.com>
 <a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>

On Fri, Oct 02, 2026 at 08:08:44AM +0200, David Hildenbrand (Arm) wrote:
> On 10/2/26 04:38, Hajime Tazaki wrote:
> >
> > David, Lorenzo, Johannes,
> >
> > thanks for the comments and inputs.
> >
> > On Thu, 01 Oct 2026 19:01:45 +0900,
> > Johannes Berg wrote:
> >>>
> >>> I thought maybe uname could help but our LLM overlords tell me no.
> >>
> >> Hajime originally wanted uname to indicate it, but that caused
> >> regressions elsewhere, so we dropped that commit. I guess we could put
> >> _something_ back?
> >
> > systemd uses uname information and our (old) patch changing the format
> > triggered the regression.  thus, we dropped it.
> >
> >>> It pointed at something though.
> >>>
> >>> In fs/proc/meminfo.c:
> >>>
> >>> #ifndef CONFIG_MMU
> >>> 	show_val_kb(m, "MmapCopy:       ",
> >>> 		    (unsigned long)atomic_long_read(&mmap_pages_allocated));
> >>> #endif
> >>>
> >>> So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.
> >>
> >> Hyrum's law and all that, but I guess it's not highly likely to (want
> >> to) change :)
> >
> > a runtime detection is nice.
> >
> > scanning /proc/meminfo might be useful. although it requires to mount
> > procfs (we can actually skip procfs mount as it is optional) so, this
> > is not 100% portable.
> >
> > checking ENOSYS like syscall(SYS_mprotect) might be useful but I
> > wasn't sure if this is always the case of NOMMU or not.
> >
>
> I assume there are plenty of other mechanisms. Like testing if fork isn't allowed.

Yup that's an obvious candidate!

You actually need to check for both -EINVAL and -ENOSYS since, of course, we are
inconsistent with this.

Some nommu arches specify __ARCH_WANT_SYS_FORK unconditionally for both
mmu/nommu variants meaning you get -EINVAL in that case:

https://elixir.bootlin.com/linux/v7.2.8/source/kernel/fork.c#L2830

Otherwise you get -ENOSYS because it's not defined.

But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
etc. should do it.

But then that'd need some C... ah fun :)

Crazy to me that we don't expose it in uname...

>
> > My original attempt was to use include/generated/autoconf.h; with that
> > we can omit environmental variable or command argument of NOMMU=1,
> > but gave up with handling standalone build/test case which might miss
> > the generated file (and complicate the patch only for the NOMMU
> > detection).
> >
> > So, specifying NOMMU=1 is my previous, though dirty, conclusion.
> Let's avoid making it harder on users by doing some runtime detection.

Yeah it'd be preferable.

I see a bunch of usage of procfs in selftests.

So can we just please require that the selftests have the user mount /proc, then
the /proc/meminfo grep is the easiest + quickest way.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
