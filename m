Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBB636212C;
	Fri, 11 Sep 2026 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139105; cv=none; b=TBP/sVJxSk9ISKEvM1UAoFh4JDrC3CcBw+g4SpF6xcNPhUQgH6V3S0EjCtC5GtxmNOgqHqxPUjISnavZ9dCNUbhr9KmJP5NrADjyNeQt+DPajN/wfBFCyYb14aDjpNaLh0H9I/pJavXfoaoCKJEYN1MEnyIwFaaM36ZHNwxG4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139105; c=relaxed/simple;
	bh=fGxzgF0vh9NXwf+awr0+TWm5JWX4fyGfl9v2p2g+H1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0qkzFbRhcLzS3o+nSYISTNWCrdPWvdDIpgERRJxOQpf2A36UP3p6lcayGvEmN38CYSDJuh0pFLRB0ieE4tvjQ6o+nAgvQJrV18AjYwN6w4fr1pvxReSjiWpWX0M7KyhidrUB+xHnxaTC2SvnSoFCkmUONMvrZ6g6rXXZgmdFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW3tYq8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW3tYq8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187921F000FF;
	Fri, 11 Sep 2026 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139103;
	bh=Kxl1OEb1nifXofMFDFqUafcDOTr3tEpBTdUf0C42Lnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HW3tYq8t/BTil2TOS4otxSG0Nd2i2Fd6q3xh4dyxQp8vF8J7eUWgVnBg7yKk8wcsE
	 rWrWFQpBDGqrVdCthv1otmBWSD4a7zWV5XTVyqSAynwCduL2VZM7dTCqdPIgKmFUx3
	 D5jTYwRkXvZTDuEI+gsErZksmgEy+BYjhJ+4Z6z0K1JKK0oJ8MKROAkJMS/WNBhRkL
	 lN3FgyCObYhhG6cXKAmHLUpiRONWfPGUa33j34cT97d1HiltQnaiFEv2LiExjAeW/J
	 DolK4WBGHaYkZnX27lgrlty5O76xVqov+Jb1bIsPQv2Rz4CqKcNEdk9H+vVl4xrn+v
	 3GP1Y2cM8ANiA==
Date: Fri, 11 Sep 2026 16:04:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove exclusion of building soft-dirty
 test in arm64
Message-ID: <aqQYjtKt4z0QFh2d@gremlin>
References: <20260911125028.1268274-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911125028.1268274-1-yeoreum.yun@arm.com>

On Fri, Sep 11, 2026 at 01:50:28PM +0100, Yeoreum Yun wrote:
> Since commit 0389c305ef56 (“selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled”),
> the soft-dirty test is skipped when soft-dirty is not supported.
>
> There is therefore no reason to exclude the test from being built on
> arm64. Remove the arm64-specific exclusion.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Seems reasonable with David's suggested change applied.

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 2d5366196e30..d3e9bd67904a 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -104,10 +104,7 @@ TEST_GEN_FILES += guard-regions
>  TEST_GEN_FILES += merge
>  TEST_GEN_FILES += rmap
>  TEST_GEN_FILES += folio_split_race_test
> -
> -ifneq ($(ARCH),arm64)
>  TEST_GEN_FILES += soft-dirty
> -endif
>
>  ifeq ($(ARCH),x86_64)
>  CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Cheers, Lorenzo
