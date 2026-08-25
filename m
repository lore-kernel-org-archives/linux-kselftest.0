Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA242481AA1;
	Tue, 25 Aug 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668232; cv=none; b=Jl4Az4lrf3wjS254peMSIfpzv0fmrVEV2JIvB77byQS7SspLNVSpMitBNApuR9JD1QVTMi92ybbHrYC0t/OrOt94lwPu2k3tl+QqF8aR1ei+dIpXZ9M6qAq/yvjQHHFT6L3XCeIeI/QBspTa07k0cwV3QwwgVF4ccnjqXLGq5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668232; c=relaxed/simple;
	bh=IACDrstFzeoijA2UEd/+mzOQVYUJ8h0JQ1dl7NmEnWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcyLULGLBHUQXnWL4pg8LIvGYQYpO1++NeFa9EojR2tW8rL9iIv/KrtsOBTt3xfFNw02usR2A6QZlHhmQSBj5yJ2rDp4CakbUBX4jP+0gXdlLO0UwcdSKpNdEDJ/ROD+wO53oTFk3qPfiKCYuR+cjLKrXPiKLmx7s45Hw3aGQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqIQSfW4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqIQSfW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70D41F000E9;
	Tue, 25 Aug 2026 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787668231;
	bh=Yr6Q4NOR0CavABfY6YlUZG51bL9YNUxR3QoyzBCHjBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NqIQSfW4nswMU0GlvMBIMlbN+WrVl66xLwVU/FiWOSN4Wdei+jAZMtmaNX3XOc/qx
	 zwHocI/XQZLNLbFhmDkuJIm+zYSFa5LHg4N4LDIgkdKcKVgx3CSYFBGEHq/eN9R5UU
	 //18Z4UVKlKqBO6xykZbja8x5N+yFp6GWbbwCuQPEMDeb2qGvaulvysyTovtZoG8MC
	 v9OH/0oF5xLGHP3KhVD8ozUHqfg49GsSIdCWUHUaSSShubIptkQAphjZHnp5eusFck
	 lSlzH5kdJqdHjLN2KSZkyDdnd03SZsT59Ula1uYdwR+scL7pG7YFXtve01sweR/END
	 I4C3WDCr+vcBw==
Date: Tue, 25 Aug 2026 15:30:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yury Khrustalev <yury.khrustalev@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Message-ID: <ao2mwLHeS0X1aa6q@gremlin>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com>
 <9e533fcd-c80f-42df-847c-c15c4e3a1a70@kernel.org>
 <aoRcdLGWaNhUFIPU@lucifer>
 <277db0f6-6161-4ff1-9540-7b1eb5f7924b@kernel.org>
 <aoRto6bT3Fv0jm7k@lucifer>
 <20260819074709.1345730-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819074709.1345730-1-hemanth.selam@gmail.com>

On Wed, Aug 19, 2026 at 01:17:09PM +0530, Hemanth Selam wrote:
> On Tue, Aug 18, 2026 at 02:36:00PM +0000, Lorenzo Stoakes (ARM) wrote:
> > But it might be worth checking in this case to see whether the problem here
> > is in fact that we need PKEY_UNRESTRICTED defined over there?
> >
> > Hemanth - could you check please?
>
> Checked.  It is already defined over there:
>
>   tools/include/uapi/asm-generic/mman-common.h:88:#define PKEY_UNRESTRICTED	0x0
>
> and it does reach the mm selftests without "make headers", through
> TOOLS_INCLUDES.  The path is not obvious, so for the record:
>
>   pkey-helpers.h
>     -> <linux/mman.h>           tools/include/uapi/linux/mman.h
>       -> <asm/mman.h>           /usr/include/asm/mman.h
>                                 (tools/include/uapi/asm/mman.h does not exist)
>         -> <asm-generic/mman.h> tools/include/uapi/asm-generic/mman.h
>                                 (-isystem puts it ahead of the system one)
>           -> <asm-generic/mman-common-tools.h>
>             -> <asm-generic/mman-common.h>	PKEY_UNRESTRICTED
>
> I built the pkey tests with KHDR_INCLUDES pointing at an empty directory,
> that is, as if "make headers" had never run.  They build, and cpp -dD
> says:
>
>   defined in: tools/include/uapi/asm-generic/mman-common.h
>
> Pointing TOOLS_INCLUDES at an empty directory as well is what breaks it:
>
>   pkey-helpers.h:188:30: error: 'PKEY_UNRESTRICTED' undeclared
>
> So that is where the definition comes from, and dropping the local
> #ifndef does not depend on "make headers" being run.
>
> The one thing worth being aware of is that the redirection into
> tools/include/uapi only happens because the system <asm/mman.h> includes
> <asm-generic/mman.h>.
>
> I had a look at the history you pointed at, thanks, that was the part I
> had wrong.  If I read it right this is exactly the mechanism from commit
> e076eaca5906 ("selftests: break the dependency upon local header
> files"), which added TOOLS_INCLUDES to the mm selftests so they build
> without "make headers".  So for this particular macro the value comes
> from the in-tree snapshot rather than from whatever the build host has
> installed, which is why it does not vary per system here.
>
> That said, if you would still rather keep the #ifndef as a matter of
> course, I have no objection to dropping the patch, the guard costs
> nothing.  I mainly wanted to answer the question with something
> measured rather than assumed.

Thanks, all I care about is if they build so fine to remove then.

>
> > This is incorrect. We explicitly do not have this requirement in mm selftests,
> > and they're often built without having to do this step and tooling has been
> > provided _explicitly_ to allow for that, which is why this kind of thing exists
> > right now.
>
> You are right, the commit message was wrong on that point.  v2 drops
> that paragraph and describes the above instead.
>
> On the powerpc header David mentioned, I would rather leave
> tools/testing/selftests/powerpc/include/pkeys.h alone.  It is not the
> same construct: it is an unconditional
>
>   #undef PKEY_UNRESTRICTED
>   #define PKEY_UNRESTRICTED	0x0
>
> next to other powerpc specific overrides such as PKEY_DISABLE_EXECUTE
> 0x4, and that header only includes <sys/mman.h>, never <linux/mman.h>.
> A probe including just <sys/mman.h> does not find PKEY_UNRESTRICTED,
> with or without TOOLS_INCLUDES, so the definition there is load bearing
> and removing it would break the build.

Load-bearing :)) Where have I heard that phrasing before...

>
> Thanks,
> Hemanth

--
Cheers, Lorenzo
