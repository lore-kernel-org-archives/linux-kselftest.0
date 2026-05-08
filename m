Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C83D47DE;
	Fri,  8 May 2026 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265006; cv=none; b=T8kOkQxbl2eWZcm0rsAHf/AIP/MtdUzemdICTbwQ6Y2V6wCwVoiunLEiivicolIJjmblOeg9wLpq29h6hURIj21D+OjC2ZNR105oBBT3pp1kk05Ukv0UchEyHwRFXpMeVjsG4Uo10g/IzoxLGbO8mejiAU/hAj9m/hnwpXKXFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265006; c=relaxed/simple;
	bh=uqZ9GIgU5Ua8CenXc4GBm5HkBR0SyinC/NipnZ/J91A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrtzw9Su4gXJgdgX7s8/ZbJ4qLRzt6hV4DSVfKrMkQRUXZ7hIr+EbOTbFBOLIkqalFnaLeCJoR9l9Agwe85oUe4W8GG4Gfay2dcSuAMP2cY/Fvzd9uZsSZxp4MRWPxV6Wf+uV4BKww81hNwiRC+ISepCD7ftqd5mk4ePON9JxlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faufokin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faufokin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE1DC2BCB0;
	Fri,  8 May 2026 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265005;
	bh=uqZ9GIgU5Ua8CenXc4GBm5HkBR0SyinC/NipnZ/J91A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faufokinaRBj13HJu1L7q+3vBBKvsp5VRsjqzokcs+iXqgiWuBgoIuw/uPpkFTHt6
	 P1WjgG4IEJdFl/sv6xOKjPl3Y5fpUmrhA+faL6qhn8Cso9tuZXfJHxa7mDU8rvdgvJ
	 kbgEL4kZuXur1wJKAssQQ+v9gaq8qKEGsUZzM54Dly1jcPg5k14Wa9vysYVHJi7Amj
	 OYuxRMiMvYUPTQdsFZ/DoP4U3f9aiwGdGwWI2gAap8JWcPTo5sRzB3ehIUDM/yti/9
	 jx23D9uE2NX8/K0KpwOsd4IgbbkD3+0+7CqrmSCxv7IP6dfMjnmG6wzV+DUFXOeFfE
	 CkQR0K9Sbp7hw==
Date: Fri, 8 May 2026 20:29:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: pratmal@google.com
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosryahmed@google.com,
	david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: use pattern matching in .gitignore
Message-ID: <af4rpHBschXV4QXa@kernel.org>
References: <20260505152228.124065-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505152228.124065-1-pratmal@google.com>

On Tue, May 05, 2026 at 03:22:28PM +0000, pratmal@google.com wrote:
> From: Pratyush Mallick <pratmal@google.com>
> 
> The current .gitignore hardcodes each generated test binary by name,
> requiring updates every time a new test is added.
> 
> Switch to the patten-matching approach similar to KVM:selftests.
> Ignore everything by default and then allow source extensions (.c, .h, .sh)
> and tracked non-source files.
> 
> To avoid un-ignoring the generated headers, rename local_config.h to
> local_config.h_gen.
> 
> Acked-by: Lorenzo Stoakes <ljs@kernel.org>
> Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
> Reviewed-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Changelog since v1 (RFC):
> - Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
> - Updated Makefile, check_config.sh, and affected .c files for the rename.
> - Removed *.mod.c as it was unnecessary.
> 
>  tools/testing/selftests/mm/.gitignore      | 71 +++-------------------
>  tools/testing/selftests/mm/Makefile        |  6 +-
>  tools/testing/selftests/mm/check_config.sh |  2 +-
>  tools/testing/selftests/mm/cow.c           |  2 +-
>  tools/testing/selftests/mm/gup_longterm.c  |  2 +-
>  5 files changed, 15 insertions(+), 68 deletions(-)

-- 
Sincerely yours,
Mike.
