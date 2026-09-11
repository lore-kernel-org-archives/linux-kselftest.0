Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54047ECCF;
	Fri, 11 Sep 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131595; cv=none; b=aAZKC9ic8jJEmMea9wuJsmJBOsQLLgckobeY2hSSuaJ7h+RDpT0Kzyq9H5L7zwC5sTOdCYnbJizIPzuQ1swKgTLsfWj1BecE8Who6CMZtQo7S4OjGcXEkTN40iDBz2SOrBEpPcSDRHZc2yUEdvlhtc04Gm7FKXAhFwXyWFaFA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131595; c=relaxed/simple;
	bh=alagyW4M2wT8F9qhEUqU+fLCxXSZQQpP5hUQKF0iMe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwpFvJVTxdDEJ6eQGTw66W8McgD0bvyYb3Yb7jodpmzDhmkwxo2aEgMGOFborYcIhDAcnsbCUDO+rDsfzjOgUgGwDLshu+LErHmyc+IsVD8C6O6qcW8NCfz7puOmFe64mFRA1vC2n/fFOK5lMX5ucNntEf1C/L5qL82f58k/FZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4EmxVGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4EmxVGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91CA1F00893;
	Fri, 11 Sep 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131576;
	bh=dKbU6ZCLYf+36lNW3LS5uhSrwFRNIDzXZ4c4yuSq4Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4EmxVGVN2EXpDK1mdHXmj2dyRkhyvTefQxs2Ed1lcVVpAdr64kc8KZ4OAdO03oob
	 IBw4kCAf4vMzqTMtdkuhTW3RYjP301+5k65naRnSzfEHfoRhmIx57u/fXs0+gSyDms
	 epLslWhFMPJ12tHHQI3wyRgzVny1LAtfsbJJWqW4B0j4A/MXVqxU7+EqGWH45aVGLr
	 qRecNBabXd5k+7EGgl1vCLpKOycF58Jv/7qAtvVo5vEhEJhmw2+Cld1dcAFO2V453P
	 Fa5Ic58w2xkZi08EJfSQUAUd5wYZwkdvfThDH65X4TEQA1mu3OMWgbTeidzuY9lI8s
	 pSEQSvNKRE13g==
Date: Fri, 11 Sep 2026 13:59:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH] kselftest: mm: fix potential failure for merged VMA in
 guard-regions
Message-ID: <aqP29-H0iKl-2CVH@gremlin>
References: <20260911123534.1181501-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911123534.1181501-1-yeoreum.yun@arm.com>

On Fri, Sep 11, 2026 at 01:35:34PM +0100, Yeoreum Yun wrote:
> check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> but this can fail if the mapping is merged with an adjacent VMA.
>
> To avoid this potential failure, first allocate a temporary region with
> extra pages at both ends, unmap it, and then map the test region within
> the temporary address range, leaving an unmapped page on each side to
> prevent VMA merging.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index 5c8ec3ca75d7..a28a57d34e97 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
>  	char *ptr, *ptr2;
>  	int i;
>
> -	/* Map a region. */
> -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> +	/* Try to Map a region. */

Map -> map

> +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);

Should be PROT_NONE otherwise it'll merge with the below.

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
