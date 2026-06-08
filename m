Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D03403E7
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935181; cv=none; b=AclHBpvmOaER8UHoMApyku21crfUT6epycl6N+9Y9b3p8+ClHwBPylem3cLY2jYmoNna914c5etu7dZG2f1CCY0nzId54axCR3MP1Qw/vdYo22bcaiVXwviIDbi91hyqzzO+Gnk5J3Vxbs6wtFEqu+N+xZu+T3HUdVmup78BGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935181; c=relaxed/simple;
	bh=X8vqXa+g+F4+jpfKdvboJr2CkJsH22TSkmfdozsNYsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggi/MJyfcGZ6WBE2qBp0ktpokz2Qe+n47R/fTqgwcDJUaz7/GUYBcSJKnCi5D/FSfjSCi541nJT7pRSGqH0ArYG8Kg98K7rT5CZ+Wo+JRq4aWPhsXemftqn1F6gUfXv4jKTHt0zAcdpr/xfC21XRqjeH8DBjLSy/Kw2lt3rXQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AYC3cukT; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AYC3cukT"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9156ceb55ffso392730585a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780935178; x=1781539978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G7BP0s37Q+khF0GZ143YoXVWV8LzH4rQFimf53xc42o=;
        b=AYC3cukTslkI3sFKLoCWn3is6TQhWOnK8c7DbTU1LlFLpy0oM/JeA8tKu3eURfVs8V
         mzFu/b4AGSCKPGWOfr5HLSXUWxejV+ab7Ek/rj/VQXiPvt07acfSAnxnRWRz623KtbKm
         rHT7uVZmpUh9nJ3I8250Syo/CERNvNiPeOzVTgF1RiBGa7hUGuzHL8QZ0M794NLdtvcM
         4Dy4UqNlsg6Bd5c7RskztDZm6ajZuRlYLiCAUvKdCviPnz7uOPb9fi7Ji1jayiaRfKbG
         2vfBaIRheTS709kr3qwOy6kzX9/HNBmbA7Z009mLUUwUB7vDPfDGosSh5RE/eUBmOQi7
         WjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935178; x=1781539978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7BP0s37Q+khF0GZ143YoXVWV8LzH4rQFimf53xc42o=;
        b=U+Xss+kLlvJ7obqHuJdPsQwXc5ibA97bU1ywCRcn09gShkWQa5H0/WaAlDYK5uQovi
         1yZRe5PFCoOs9TGHreOKlygsl0pkgOhn1GRpGd5ONJVXaSsvoHNb9sccYUIpbsmmrhO7
         D9Zsnd4Tq7UL/RvH3vP36k9ly1+SwVCQbtfqFezUHMTdeuIXxWO8LDiVW/1U5xtuu1DL
         rn+PbH8a5MQjzqnXvKXdDp3admBMutGqZrWA6EjJJ7x9f377XGnBCeOaEooaxLJJKE6O
         SDWDd00nB8WwYfhshFReVDq75SCzz056sV0TkGsYF4zg5+MaObRpSgylozu+QSKK9fy4
         ukQw==
X-Forwarded-Encrypted: i=1; AFNElJ8CaV3VrF0uejRF7TwbeKqyM7NAzESngnRvIuQkA9jwY/yH/Da8CEI4ujGF/exniaF6ZicztjtrouRP0MDUZ+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgeqIZzRnF541cAUG1WTyhuF2PXFlZS0YbDdBfrJfLMczPE2q
	/jQ5FfjT6awyJJIe3Tt/W5GvbCRqPq5BSTMWXxCN3RQwgGf+O3+h5fg3xcHymiqa9V8=
X-Gm-Gg: Acq92OGLcLTgkPuFuroind0jAEguQ/YT7ur2r8Hxd6XNdzyfA055bvyELdj9DH9ShcE
	ZLtMcCu2k65NE530M7raC+kSg8IpEDX+B9O8Uwdl1lZ2oq/vPN/016xPLy+ZRymsL69qq5tYFTL
	RcXZGz+C0bqPJP7AkngDiFoGp13Bdhhh0JPdOBIafxMsq8QO7254ZOCuVP57lAYEtgOntsbOXqo
	xaw2T+WiusAJsoDYshnp4SWdrFWqZP6DzU+9bLwMAGlSHnx4APg4sYEsd0q7qUN4EDKYpVksknn
	l8gwRlre9YRV7J3IapgPLp5/maXa+b+rxEs7TYUYuPSu780hAnQgLAkkz92XMQ/l2uocYIcxZN1
	rgTBupechxz01Dqi8Z+buylGfI9ZtvNWybjDf9DN4GKWeVozPGdWO/cUiUHhCtyoIvN12HR4dPx
	qcQr8cavK1E5gSS2XKJU/QsrXkXU95BDhHzkSAp8tDvqj/wetbAyIDJQn7Yj5y2g==
X-Received: by 2002:a05:620a:1988:b0:8cf:c106:faca with SMTP id af79cd13be357-915a9d899a6mr2683778685a.36.1780935178189;
        Mon, 08 Jun 2026 09:12:58 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00ba04sm1761661385a.7.2026.06.08.09.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:12:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:12:56 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aibYJvzQQnpoN6YW@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
 <aiVp5RlbWRz5VnPB@plex>
 <178091437240.1648214.10761111570005003901.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178091437240.1648214.10761111570005003901.b4-reply@b4>

On 06-08 13:26, Mike Rapoport wrote:
> On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
> > On 06-07 14:58, Mike Rapoport wrote:
> > 
> > > On Fri, 05 Jun 2026 03:32:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > 
> > > Hi,
> > > 
> > > 
> > > I'd keep vmalloc where it is, it's more of a memory preservation primitive
> > > rather than a data structure of it's own. The data structure it uses is an
> > > implementation detail.
> > 
> > kho vmalloc is absolutely a data structure. KHO core only provides the
> > basic handover mechanism (FDT nodes, physical memory ranges). vmalloc
> > is a structured representation on top of KHO, and should provide its own
> > versioned ABI.
> 
> kho_preserve_vmalloc() has the same semantics as kho_preserve_folio().
> It's not intended to be used as a data structure. The data structure is
> an implementation detail unlike with kho_block and kho_radix_tree that
> are intended to be used as data structures and expose clear data
> structure APIs.
> 
> Yes, vmalloc should have versioning, but that does not mean it must move
> to different files.

Core KHO preserves contiguous ranges of unmovable physical memory, that 
is it. Preserving physical addresses and folios falls into that 
category, and everything else is built on top of it.

The underlying implementation is where the ABI contract is defined. 
Unlike kho_preserve_pages(), which just tracks raw physical ranges, 
kho_preserve_vmalloc() must serialize non-contiguous virtual memory. To 
do this, it passes metadata kho_vmalloc, kho_vmalloc_hdr, linked list of 
PFN arrays.

I do not understand why you are so against the modularization of 
higher-level implementations on top of KHO. Moving them to dedicated 
files makes the codebase cleaner and easier to maintain. For instance, 
at some point we might support sparse or partially filled vmalloc areas 
where VA size > PA size, or areas that have holes.

Keeping all of that in a single KHO file is the wrong approach and goes 
against how other logically separated subsystems in Linux are organized 
(e.g., mm/vmap.c, mm/vmalloc.c, etc.). Yes, there are some messier 
places in the kernel as well, but keeping this in its own dedicated 
kho_vmalloc.c file makes complete sense to me.

> 
> And, btw, moving KHOSER_PTR() infra along with vmalloc is wrong. It was
> my oversight that I didn't insist on using it for most of the
> serializeable pointers instead of open coded
> virt_to_phys()/phys_to_virt(). We need to fix it.

The only reason it was moved to vmalloc.h in this series is because kho 
vmalloc is currently the only user of DECLARE_KHOSER_PTR / 
KHOSER_STORE_PTR in the tree. I can move it to the newly introduced 
compat.h to keep it in a shared place.

However, overall enforcing the use of KHOSER is unrelated to this work. 
I have my own thoughts on this, and perhaps with proper versioning, 
using KHOSER_PTR everywhere would be appropriate, but let's keep that as 
a separate work.

> > If we change any of the vmalloc serialized structures (like kho_vmalloc,
> > kho_vmalloc_chunk, or kho_vmalloc_hdr), then vmalloc won't work and
> > compatibility will break.
> > 
> > Core KHO does not need vmalloc; nothing in kexec_handover.c uses it.
> > 
> > Instead, vmalloc has external customers:
> > - memfd (uses it to preserve serialized folio metadata)
> > - KHO test suite in lib/test_kho.c (uses it to preserve physical address arrays)
> 
> Following this logic, kho_presrve_folio() should be moved out because
> it's not used by KHO but has external customers. And radix tree should
> forever remain in kexec_handover.c because KHO uses it ;-)
> 
> > > Let's minimize the churn where possible for the sake of git blame and
> > > backports.
> > 
> > It is much better to do the right cleanups now while KHO is young. Once more
> > subsystems are added, this refactoring will be twice as hard. Modularizing the
> > code now guarantees a simpler, safer, and scalable design. Placing each data
> > structure in its own file gives us code that is easier to maintain, review, and
> > less prone to bugs.
> 
> dependencies
> > > that justify small headers for each two functions and netiher
> > > linux/kexec_handover.h nor linux/kho/abi/kexec_handover.h are that long
> > > to start splitting them.
> > 
> > External users only need to include the headers they actually use. For
> > example, LUO shouldn't have to pull vmalloc or radix tree KHO
> > declarations, and memfd does not need block.
> > 
> > From a maintenance point of view, it is much easier to catch ABI
> > changes when the file with the appropriate version has been changed,
> > and most likely the version of that file should be updated. If a single
> > header contains compatibility versions for several different data
> > structures, it is easier to miss the correct version update.
> 
> No matter in what files the definition lives, someone can forget to
> update version and we may miss it during review.
> 
> Would be better to spend this time and energy to add kho-specific prompt
> to LLM review to catch such issues ;-)

LLMs are great, and we should absolutely rely on them. Spending time 
defining LLM rules and helps in the long term, but none of that is an 
excuse for keeping the codebase messier than necessary. Having the 
codebase logically separated and modularized is still the right 
approach; ease of human review should always be prioritized, even with 
LLM assistants.

Localized context is incredibly powerful for preventing human error. 
When a developer modifies a structure in vmalloc.h, the corresponding 
compatibility version is right there in front of them in the same file, 
making it far more obvious that a version bump is required. In a 
monolithic header, it's easy to modify a structure on line 100 and 
completely overlook a global version defined on line 10.

Modular files drastically reduce noise in git history and diffs. If a 
reviewer sees a patch touching include/linux/kho/abi/vmalloc.h, it is an 
immediate, high-signal flag that a specific ABI is being altered.

Even LLMs behave much better when the context window is smaller. An LLM 
can read a focused file and understand the interactions much more 
accurately, compared to polluting its context with a unrelated 
subsystems.

> > Since we are splitting the source files (like kho_radix.c and
> > kho_vmalloc.c), the headers should logically follow the same
> > modularity.
>  
> They could. Doesn't mean they have to.

This is not a logical argument, nothing is have to... Keeping headers 
aligned 1:1 with their implementation files provides clean 
encapsulation, prevents transitive dependency pollution, and ensures 
that ABI changes are tightly localized.

> > > I agree that we should decouple versioning of these components from the
> > > global KHO versioning.
> > > Can't say I agree with the way you propose to do it.
> > > 
> > > I don't like that each user of a KHO component should include that
> > > component version in its own version string (or whatever it may become
> > > later).
> > > 
> > > It requires ABI headers update each time a user decides to add a new
> > > data structure and worse when there is a change to that data structure.
> > > It creates coupling of the data structure user with its particular
> > > version and just looks ugly IMHO.
> > 
> > It is actually the opposite.
> > 
> > If a user adds a new data structure, that new data structure will have
> > its own compatibility version. Instead of the current approach where
> > the global version string needs to be updated, only the new version
> > string would be added.
> > 
> > Also, if someone updates their code to use the new data structure, their
> > compatibility string is going to be updated anyway, as part of using
> > the data structure requires including the dependency in their
> > compatibility.
> 
> Sorry I wasn't clear. I agree that kho_vmalloc, block and radix tree
> should have their own versioning rather than rely on global KHO version.
> 
> What I don't like in your proposal is mixing versioning of a component
> with its dependencies.
> 
> I think that versioning should be completely local to each component.
> LUO should not care about kho_block "on wire" layout. This should be
> encapsulated in kho_block.

That is a fair point.

As I mentioned in my previous reply, we can definitely look into making 
the version checking more modular. For example, each component could 
implement a standard compatibility-checking interface.

These checks could run early in boot to determine whether each component 
is capable of accepting the incoming preserved data format.

Whenever the component is later used by LUO, memfd, etc., we can query 
that cached status. This achieves four key benefits:

1. It avoids delaying the compatibility check to the actual time of data 
retrieval, which is too late to safely abort.

2. It prevents a local incompatibility from triggering a global kernel 
panic, allowing us to handle failures gracefully for just that specific 
component or session.

3. It keeps the local version local, as you suggested, so it is checked 
only by the consumers of that specific component.

4. It provides a clean path for backward compatibility, as components 
can individually decide whether they understand the incoming data 
format.

> > Backward compatibility is not in scope at the moment, but we can make
> > the version parsing more granular in the future.

100% Agreed.

> > Instead of a simple strncmp(), we can introduce a standard callback
> > interface for data structures. Each data structure implementation would
> > implement this interface, and we would pass the parsed version string
> > to the data-structure-specific version check.
> 
> Backward compatibility will be in scope sooner or later and string
> parsing is surely not the way to deal with multiple versions.
> 
> How do you suggest to represent support for multiple versions?
> "luo-v2;luo-v3;block-v2;block-v3;block-v4"?
> 
> > > Or, say, we add support to kmalloc() and use it in kho_block.
> > > Then we'd have to add kmalloc() versioning to all kho_block users, right?
> > 
> > I was thinking about this. Since we don't have examples of data
> > structures depending on each other right now, I simply made sure
> > there are no duplicates in the compatibility strings.
> > 
> > If data structures have interdependencies in the future, we can easily
> > remove this uniqueness restriction. The users of block will still
> > include the block compatibility string (which automatically includes
> > kmalloc), and if user also depends on kmalloc, they will include it
> > as well.
> > 
> > > I think the versioning of each component should be handled by ->restore()
> > > of that component. If it sees an incompatible version in the preserved
> > > data, it returns an error. The versions can be stored e.g. in the base KHO
> > > fdt.
> > 
> > Hm, I think, checking compatibility inside ->restore() of each component may be
> > too late in the boot sequence.
> >
> > By checking the composite compatibility strings upfront (before invoking
> > the actual restore/retrieve callbacks), we can guarantee that the entire
> > state configuration is fully compatible. If any mismatch is found, we
> > can cleanly abort the live update.
> 
> If a ->restore() returned an error (for any reason) we anyway need to
> reboot, don't we? 
> 
> What do we do if memfd discovered incompatibility, but, say hugetlb
> global state was already restored?
> 
> If you really want to run the compatibility check upfront, we need a
> mechanism for that. And that should probably happen even before
> kho_mem_init().
> 
> > Additionally, keeping the versioning managed via composite strings on the
> > serialized data and registered handlers keeps the KHO core completely
> > decoupled from individual component ABIs, avoiding the need to bloat the
> > base KHO FDT with subsystem-specific versions.
> 
> Actually FDT "compatible" handles versioning nicer than composite strings
> You can have
> 
> 	compatible="kho-v4", "vmalloc-v1", "radix-v1", "block-v2";
> 
> and check fdt_node_check_compatible("vmalloc-v1") for vmalloc and
> fdt_node_check_compatible("block-v2") for block.

That is actually very similar to what I am proposing—individual version 
tokens (which in my current series are concatenated into a composite 
compatibility string separated by ';').

But let's not get too fixated on the composite string formatting. I 
actually really like what you are proposing: using integers for versions 
and having each registered component carry its own "NAME" and version 
number in the KHO FDT.

> And we wouldn't need to reimplement string parsing ;-)
> 
> But yeah, I do see value of making components versioning and KHO global
> versioning independent. I just don't like composite strings and I don't
> like mixing versioning with dependencies.
> 
> Since we are moving from FDT for the most things, version should become
> a number rather than a string and version compatibility should be

AFAIK, for everything but KHO itself is going to be FDT free. I would 
like to be strict about that going forward :-)

> independently verified by each component.
> Then dependencies between components will remain at API level rather
> than brought into the ABI.
> 
> If you think ->restore() is too late for compatibility check, we should
> work on a mechanism for upfront compatibility verification.

+1.

Pasha
