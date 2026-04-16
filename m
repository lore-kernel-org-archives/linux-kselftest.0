Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6934A786;
	Thu, 16 Apr 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365785; cv=none; b=AFPeZxWHmsXl/sxKHAs2qLcK7c3ElfSthtGmeemD1xgGOVWWtxZvVJdyrMQ2LVh+ogVOnH6vuyS6R33s3gQ8PsFpLSTbWu0g7OfH4hdbXNzDT9y3jI2OtuUELthERf0LIVVQ2y0TVsQVWaorRfZbg2ynAaEKa4wdVtXxNC/bxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365785; c=relaxed/simple;
	bh=7PB2sZPapAgcAUO2mX4Ti0uvTw8JML/xOAAhd79EyPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCyZpAq2T9chgZO70gDjYCx4fXSPeYP3yexo4tLjPrT296o1jhEQ44zQ1BSoS2LX1xxeFYjShrBKeB5RZ6yrkyXcIDm45z4M+qhUO65vKb3x2Ea+5XehtDBrXoFXv4KwhGh/SpWJ9XsGUgYPVWAmc7gjCeD+Br7tiJZt9B3bstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPWqxa6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPWqxa6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36227C2BCAF;
	Thu, 16 Apr 2026 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776365784;
	bh=7PB2sZPapAgcAUO2mX4Ti0uvTw8JML/xOAAhd79EyPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPWqxa6zsjaCrCljJTl+M5Pfc9ek5lJZqoyevDvtoq3cOUYO4GOBQZt870v+D5ksw
	 ahJLWEtNNt22du17mTZV9LoHAvPXrhHzzcLxuemlQ31IsOEBBsNAnwazb4tHijONDH
	 58WLGLrgg8BxusHw0vL5coGv/Zs2qq2lzljX2FdzoKUF0B5128mLRJuxquj0+PrGd3
	 4ZN5MqjRkT9aYKV4lwDtiRW1+ro+0HmU5SNmHs0NAXn9ODB8tSOXWi5SfvCjS0Urjh
	 MPaptaE3DriewkH4aYliuUPzv+eyV82IHb3k3dufAUAOP+MsYq6nAa4tjPKx+tKgUU
	 deaapm856Vdqw==
Date: Thu, 16 Apr 2026 21:56:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <aeEw0Jf1JOCvmdri@kernel.org>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>

On Thu, Apr 16, 2026 at 07:40:56PM +0100, Mark Brown wrote:
> Several of the mm selftests made use of /proc/pid/mem as part of their
> operation but we do not specify this in the config fragment for them, at
> least mkdirty and ksm_functional_tests have this requirement.
> 
> This has been working fine in practice since PROC_MEM_ALWAYS_FORCE was the
> default setting but commit 599bbba5a36f ("proc: make PROC_MEM_FORCE_PTRACE
> the Kconfig default") that is no longer the case, meaning that tests run
> on kernels built based on defconfigs have started having the new more
> restrictive default and failing. Add PROC_MEM_ALWAYS_FORCE to the config
> fragment for the mm selftests.
> 
> Thanks to Aishwarya TCV for spotting the issue and identifying the commit
> that introduced it.
> 
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/mm/config b/tools/testing/selftests/mm/config
> index 1dbe2b4558ab..06f78bd232e2 100644
> --- a/tools/testing/selftests/mm/config
> +++ b/tools/testing/selftests/mm/config
> @@ -13,3 +13,4 @@ CONFIG_PROFILING=y
>  CONFIG_UPROBES=y
>  CONFIG_MEMORY_FAILURE=y
>  CONFIG_HWPOISON_INJECT=m
> +CONFIG_PROC_MEM_ALWAYS_FORCE=y
> 
> ---
> base-commit: 599bbba5a36f6de57ab14c373c25881e2b5273f5
> change-id: 20260416-selftests-mm-proc-mem-always-force-5ce1b26022c2
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

-- 
Sincerely yours,
Mike.
