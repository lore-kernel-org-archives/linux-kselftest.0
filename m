Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A8F1A9F97;
	Fri, 17 Apr 2026 04:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776400632; cv=none; b=io2ojFD3zqsn71+EXvvG6y44VvQAybtuFs3WRa3Tqbf9SH41v8xFpQ6MEZy9LsVcCIFkGvc3jfFvnFNSFyHxEhVG7HwSC4unhQDSqm9mbMIDOhFRAbLbAJxDO/Pw4dsndz15XWiZRHHeU9NObs0nIR9GEcsfXFWU2pHxZpq5SDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776400632; c=relaxed/simple;
	bh=U+PvVVWTwBKNhQRSl1RUbETFIYWroVoewkV9BFEmcmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhDI7t9ffrLyo4dX9DUQPibDdiNgMDLoWOsnEy3JXUBGFnLyOcI5Qj9BHMT6cqkqz/F3vONjxiuPfTn3t+KYjjL4xdBM5sl+prx1As1ceEwowFA0WeLLF5tfM3SidOxc3qp/poH2BcpJbYFicngEELU0DqBSBJ/EmXU+ZaWfVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bVYKLgV5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bVYKLgV5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FC081E8D;
	Thu, 16 Apr 2026 21:37:04 -0700 (PDT)
Received: from [10.164.148.40] (MacBook-Pro.blr.arm.com [10.164.148.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9066C3F641;
	Thu, 16 Apr 2026 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776400630; bh=U+PvVVWTwBKNhQRSl1RUbETFIYWroVoewkV9BFEmcmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bVYKLgV5/Ibm/FJaEhb5pnZ8w2Cij/DsMFDF0lhu68SPQF/hwkDEWdVewd64H/axC
	 Y2QNAEJ2V5I016LZFd18ZvXPsefvLdpkaKPrxLsGSoH2l2uhXBHEVm5Wz7CTalmiOv
	 pC59srDHZKS5o9ypWvoFTVhdFZqo07pDAg6qydCM=
Message-ID: <1edbe2b8-2754-4995-baeb-6b9ecaf05137@arm.com>
Date: Fri, 17 Apr 2026 10:07:02 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
To: Mark Brown <broonie@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/04/26 12:10 am, Mark Brown wrote:
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
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

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
> 

