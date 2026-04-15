Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FD7332913;
	Wed, 15 Apr 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232840; cv=none; b=rBbcR0KuZAPgs08wRCUph69gZ0rNZgZ7tBFTGN3IptpL5Yg9lfrcWADjMOXzAPIb4WlP2+dQnQq62vPkNebX7jHIYwHpQrrcukpcXqyfsLlqDjC9N2rYdfW2VaEasERSlHkyxLtwDAV47VeHqL75Ffhe3lxGqqnI0i7ox4rS5rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232840; c=relaxed/simple;
	bh=YpO2tJR55GH2ObkpqG7bQmAtIKqR5Kp4eMXaU9peBC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7QSBnAw2vumCVdT/gC9CiDcMWQ13NHfBdTZKtIU4TofF7fGNswUAlrrm53HxN767ACcm62dwuRc6gn3OUMPT/LDFEptUsvjWo/mxJkjdVhjQYNd4nXdz+TLvgXe66qJ3w+lMln+6oKf6ZCFmOM99qzoH/pcArvQeva0jmx5KKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG+gdCpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG+gdCpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7675AC2BCB0;
	Wed, 15 Apr 2026 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776232840;
	bh=YpO2tJR55GH2ObkpqG7bQmAtIKqR5Kp4eMXaU9peBC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG+gdCpnhZU2mWNHnWjDbccaSYpzW5DWa7oI/L1CZa12jlDWtuuhVgVMvXBSieI5W
	 1mTKkTaPWJLD/7YPLme69oHfx+SqSdka5UJJLQ1JSEj8G/fwR1vKDIL4j9tCnJeXEk
	 SY2pobBl6jNteh8KlrO6WT//yIZHk6KAXt2Hjp0Di+VZncSOHveFrxLquCp41i6EWA
	 RiByggS2Z38tgRf1kBnidx8U6FCVMAdQB7BsauFIhoL+0oihLsQ1YPfGeZkVU1PHNM
	 TOZxYTnx2E6Ox33hogCr348RU1StshzU5rhoFZrFbiLu1YjSVNVJeZVHHWutt2BZy8
	 ipURrYufRW9Lg==
Date: Wed, 15 Apr 2026 09:00:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v2] selftests/mm: Simplify byte pattern checking in
 mremap_test
Message-ID: <ad8pf_wawwRYDW1l@kernel.org>
References: <20260415044509.579428-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415044509.579428-1-dev.jain@arm.com>

On Wed, Apr 15, 2026 at 10:15:09AM +0530, Dev Jain wrote:
> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> mremap tests") validated remapped contents byte-by-byte and printed a
> mismatch index in case the bytes streams didn't match. That was rather
> inefficient, especially also if the test passed.
> 
> Later, commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> execution time from minutes to seconds using chunkwise memcmp") used
> memcmp() on bigger chunks, to fallback to byte-wise scanning to detect
> the problematic index only if it discovered a problem.
> 
> However, the implementation is overly complicated (e.g., get_sqrt() is
> currently not optimal) and we don't really have to report the exact
> index: whoever debugs the failing test can figure that out.
> 
> Let's simplify by just comparing both byte streams with memcmp() and not
> detecting the exact failed index.
> 
> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> Applies on mm-unstable.
> 
> v1->v2:
>  - Simplify patch description
> 
> v1:
>  - https://lore.kernel.org/all/20260410143031.148173-1-dev.jain@arm.com/
> 
>  tools/testing/selftests/mm/mremap_test.c | 109 +++--------------------
>  1 file changed, 10 insertions(+), 99 deletions(-)

I like it :)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
