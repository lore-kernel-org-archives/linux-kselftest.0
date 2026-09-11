Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612AA36B90A;
	Fri, 11 Sep 2026 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138734; cv=none; b=BTcu1C2W3iVzwOJOMaXY5zgct85ntEI68f6zGNFVtijkpqY6AmThlTs1BwwHp/xLYqWeTn/36fBwCW+hvtpwf31aWDhI7RWbKxRs8XWR3zBkmlrWp7O5Uds0GanIWon2IBIPJIh3EfnbuGyiInzHRkxXSY10KTGZdjWVU5JExHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138734; c=relaxed/simple;
	bh=Kwiev2N4L+vyQUztK7DbbRxFpbZV8KwTiUhjm2O/L7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY6ZcnDJUY9p0DDAvaLfnqPCKaXU0MT+D7h9hyevkEY5gNPsgw03oX1i6DjTSShKlmjXx5xDjHCJ5Q8jgTY1sSdIDPJ1lU5yGCOrLWinJr+tFIfEZxRk4ZIdzWcHKNyz4NWkR2POQs0a0YO3f1NAPc+9QPoVLL6154AP0oGFbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqz5AEtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqz5AEtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF0E1F000FF;
	Fri, 11 Sep 2026 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789138729;
	bh=CLYYj8/276uUFHKp2bAmnGjCPPOUxg1/tbdfRRnY79M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hqz5AEtv8bWAGxTuMNtJQO2wPSFWWYfCq+JSxjsW2aNGCo5VgdIdzSLSWqd1EQKf5
	 PV+NDPGnkEYz0CAO9fV9YVVbj39Ws7M+cVb0kh29FAeCTGyGfPWtW7BdHJgMmnzTFq
	 gEJ32WRXDa9WnfxmGqthkNrTKCcaseCh3ywj8MsITXYwpMSGp/6q028uEV7TTpM0hy
	 woNWGJGhhsSMCKZDlpiCZntEgs72YAPBRF1t71AC4guU/LPAbNrmVjo2/BSzuxVGvk
	 fsDYvlMe9lykYXEWYhDdIL72fLBJADzBrm+hz52rTYXxuJ2aISxsMX7BbucMksw4ID
	 E4lf9OfMk6tyg==
Date: Fri, 11 Sep 2026 15:58:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH v2] kselftest: mm: fix potential failure for merged VMA
 in guard-regions
Message-ID: <aqQXFG2O4CtoQERQ@gremlin>
References: <20260911142904.1825452-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142904.1825452-1-yeoreum.yun@arm.com>

On Fri, Sep 11, 2026 at 03:29:03PM +0100, Yeoreum Yun wrote:
> check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> but this can fail if the mapping is merged with an adjacent VMA.
>
> To avoid this potential failure, first allocate a temporary region with
> extra pages at both ends, unmap it, and then map the test region within
> the temporary address range, leaving an unmapped page on each side to
> prevent VMA merging.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

> ---
> Change in v2:
>   - change the prot as PROT_NONE for placeholder region.
>   - add comment for clarification.
>   - Link to v1: https://lore.kernel.org/all/20260911123534.1181501-1-yeoreum.yun@arm.com/
> ---
>  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index 5c8ec3ca75d7..b724d62d2b75 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
>  	char *ptr, *ptr2;
>  	int i;
>
> -	/* Map a region. */
> -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> +	/* Map then unmap placeholder to avoid adjacent merges */
> +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_NONE, 0, 0);
> +	ASSERT_NE(ptr, MAP_FAILED);
> +	ASSERT_EQ(munmap(ptr, 12 * page_size), 0);
> +
> +	/*
> +	 * Map a region for the test. Since the preceding temporary mapping
> +	 * succeeded, this mapping should also succeed without merging with
> +	 * adjacent VMAs.
> +	 */
> +	ptr = mmap_(self, variant, ptr + page_size, 10 * page_size,
> +		    PROT_READ | PROT_WRITE, MAP_FIXED, 0);
>  	ASSERT_NE(ptr, MAP_FAILED);
>
>  	/* We shouldn't yet see a guard flag. */
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Cheers, Lorenzo
