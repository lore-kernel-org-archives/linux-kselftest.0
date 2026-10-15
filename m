Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706EB45FFB0;
	Thu, 15 Oct 2026 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044887; cv=none; b=EyrO+2zYNdPk+5gvRA9Niy7xFd3FRtdoB3Su8j1Z3u5jDcPPGuIatGvv0yYHILqivS7h8dwdXSrRK9kV90y4GkhFmTuhHl/9levgaPHMExWQHJRuyGO28GtAL+VvZwzCPnA9yFwpeenEwnEZgmIOjFbo+8sWoHJpGPxTaknHYoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044887; c=relaxed/simple;
	bh=ZjHmUvD814tjkhysjYalQNoKk/0MhRSls02vcp1OVtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePT78EWDC+rQ3tRL8uXJ/8aixo+8y6MG1pV7MguSfrtKkyMfQ3aQgKqy0MahvwwwCZ4s3uvRUBotLcrBG2pHHc4tZGrHUl6iog0GNfk7dpyR4pfj6juYQ0r0y8WcgU5yaVliZUMAekckY+xzYz94YkIuvw28j9rKfVFEUY/r24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FvNgevAo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FvNgevAo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB0F1516;
	Wed, 14 Oct 2026 23:14:31 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38BB3F871;
	Wed, 14 Oct 2026 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792044875; bh=ZjHmUvD814tjkhysjYalQNoKk/0MhRSls02vcp1OVtw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvNgevAoTv232YZhVkEm7d++ZVEKA0pJhUSWt3GosYUbkm5hDIEIx75W5Y33f7zs7
	 3ACuYSJGmk4lkTHG2VDI1rwU/6nPZByOqb8lICdTFpcigp3s+5oWcWe/dzvpsQIf+m
	 vTyW5mgvnVnn0rY2YOjrQFigPYkrjRFPF6rZ7Vio=
Message-ID: <3d43e4bd-7065-4ae1-bbc9-b034a9de531f@arm.com>
Date: Thu, 15 Oct 2026 11:44:29 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: mremap_test: Validate the preamble region
 before mapping it
To: =?UTF-8?B?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261014-selftests-mm-mremap_preamble-v1-1-2e97f501cb56@marliere.net>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261014-selftests-mm-mremap_preamble-v1-1-2e97f501cb56@marliere.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/15/26 12:16 AM, Ricardo B. Marlière (SUSE) wrote:
> remap_region() checks that the destination region is free before mapping
> it, but not the preamble region placed right before it, so mapping the
> preamble can intermittently fail with EEXIST:
> 
>   # Failed to map dest preamble region: File exists
>   not ok 15 5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble
> 
> This happens when the kernel's heap ASLR (arch_randomize_brk()) lands the
> process heap inside that unchecked range. Confirmed by correlating
> brk(NULL) at startup with pass/fail across 60 runs: every failure had brk
> land inside that range.
> 
> Fix it by including the preamble in the free-region check.
> 
> Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
> ---

Just wondering, should this have a Fixes: tag as well?

Other than that, LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

> Hi, this sporadic issue has been found in openSUSE CI:
> 
> https://openqa.opensuse.org/tests/6270334/logfile?filename=serial_terminal.txt#line-6760
> ---
>  tools/testing/selftests/mm/mremap_test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
> index 131d9d6db867..8d4fa3025a9d 100644
> --- a/tools/testing/selftests/mm/mremap_test.c
> +++ b/tools/testing/selftests/mm/mremap_test.c
> @@ -1006,8 +1006,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
>  	if (!((unsigned long long) addr & c.dest_alignment))
>  		addr = (void *) ((unsigned long long) addr | c.dest_alignment);
>  
> -	/* Don't destroy existing mappings unless expected to overlap */
> -	while (!is_remap_region_valid(addr, c.region_size) && !c.overlapping) {
> +	/* Don't destroy existing mappings unless expected to overlap. */
> +	while (!is_remap_region_valid(addr - c.dest_preamble_size,
> +				      c.dest_preamble_size + c.region_size) &&
> +	       !c.overlapping) {
>  		/* Check for unsigned overflow */
>  		tmp_addr = addr + c.dest_alignment;
>  		if (tmp_addr < addr) {
> 
> ---
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> change-id: 20261014-selftests-mm-mremap_preamble-5f98ad625f93
> 
> Best regards,
> --  
> Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

