Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8873440DFDD;
	Fri, 17 Apr 2026 02:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394678; cv=none; b=NVaDHnGNPpbfJ+LqKLOLWzhwRTnv7Xkmqb99MvuMfKiVnRZwIQjQvVSt8cOKND9dgZYyWtPk/wm9dtsmWv/0BfPPEZ6SmPmnGNvc7JSW5jY7meM8udHWcQHPiL3X+Bw9O4vXmp+bstc8xpNQ1rzv4YywyuNZnOJrktY9kW8+n0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394678; c=relaxed/simple;
	bh=rU6WmezYl0sFEUtCoWXdlbtECzJmA5nZDI8WaNi1Io8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQA7XK4XsQ7/OEkDyXqEzgbgcWlZtLOainjdtgWWdUMpB92h12GU+jXRBPUkjdaBINb2STN7BF2tZCxoxfz1lXOfS+BrF8d6Y+atXCVPODE6Ij2rkJyr97D2kxhyR9Aw4EYxy22QwS5tEE1p9qt1+2ZqLKNu1oPoFN199f7vijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HHfZtUF4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HHfZtUF4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEF01D70;
	Thu, 16 Apr 2026 19:57:50 -0700 (PDT)
Received: from [10.163.182.249] (unknown [10.163.182.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 970EE3F7B4;
	Thu, 16 Apr 2026 19:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776394675; bh=rU6WmezYl0sFEUtCoWXdlbtECzJmA5nZDI8WaNi1Io8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HHfZtUF4DX1Gnx+ce5LsWGA8rOp8LoMLW80xHORqa1niNvxA9NKtQvEOk0wQbh2WE
	 TwNyACytKPLobSP7VzhreMhv+kY+5+DKN3q7RXUUHUCoRy4k5x4XsJVnhs27XJFu9F
	 bBXylUqT2cJUNk7IVzWYvTLkiMvlkI7IirZvO610=
Message-ID: <c3c27255-d50f-4c82-baa5-1f71375dec99@arm.com>
Date: Fri, 17 Apr 2026 08:27:46 +0530
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
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/26 12:10 AM, Mark Brown wrote:
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

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

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
> 

