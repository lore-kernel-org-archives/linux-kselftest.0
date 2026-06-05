Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC6366542;
	Fri,  5 Jun 2026 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640333; cv=none; b=KurBphEXtvWCRp/UkpR91fZ2jNZDvUZv+5HYS6KS5Ka61Cguq/YkFxUPf+fbV1+4fLWTomOtcDdTnmeDHBocle2YwlkgjROqaBKL6VzFd920TrpAsH4ykLPAr9jhAd+8lHpHuzIaD5r7E3iWmLXrjwdXpvrzof/Y5YxnwYiy5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640333; c=relaxed/simple;
	bh=qNbY8EOIDApHSjssqyGjxDYX9La/EKMCV9AdlkYm8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HArmBizlpRLzA8EfJddcahtDRlwkEkkuFr1+cQ/KcyDABtjcwnWQnGJhlMnF2hp1MyyHb6Z7RdY8zwciNVISDZJPOfIGaRz3YiNhcMr9Q7bB/xxwprJmfzFTm5RKmWVzxqgXCeRDsE6fEqHb+4qBD/EkmiTzXJ5XCP0p4re77e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FT3tc2pQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FT3tc2pQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EAB1F00893;
	Fri,  5 Jun 2026 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780640331;
	bh=ljlhAD+FthrnWm6kHVmP5LfpGexV5pKH196BR3ZEKv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FT3tc2pQo4qcYECndowkFVcJjTXk8lbUB6+Gp3P9GFOaIyDZWlWQJc83biab9wTGh
	 L/5jo+QNkgrfBNRpWwJe2tc1IVrGgxBBtH0eieuXnUoJF6btMLd6HOG/DHMjxn1ck+
	 rmqcKv5csTs438PnPUtgOTb5xkfZcLGgoP9SH/XG29Q4YxCGAlFoU1HJRGrRMNVwOO
	 /oNXpIzPR8ln/fJrmZ71eDj5vtbWio0gOG1KJs13OgTvHajTTssQXY0jolrHtz8dFL
	 Iy71twMK/4dXkk9qUMXs25m+EUZPHAaxk2t9V6G/eTNWHTy2XHgXYdx1e9D6sncZJW
	 bLwjENrvVhi7A==
Date: Fri, 5 Jun 2026 09:18:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-ID: <aiJqRNerYkMIo8kV@kernel.org>
References: <20260602070119.1452308-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602070119.1452308-1-lihongfu@kylinos.cn>

Hi,

On Tue, Jun 02, 2026 at 03:01:14PM +0800, Hongfu Li wrote:
> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.

We are too close to the merge window and this is not an urgent fix.
Please wait until -rc1 and then rebase and resend you patches.

Thanks!
 
> Hongfu Li (5):
>   selftests/mm: move pkey selftest helpers to pkey_util.c
>   selftests/mm: unify pkey sighandler selftest assertions and tracing
>   selftests/mm: use pkey_assert on clone_raw failure in pkey test
>   selftests/mm: add missing mmap() return checks in pkey tests
>   selftests/mm: add missing pthread_create() return checks in pkey tests
> 
>  tools/testing/selftests/mm/pkey-helpers.h     |  4 +-
>  tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
>  .../selftests/mm/pkey_sighandler_tests.c      | 81 ++++++++--------
>  tools/testing/selftests/mm/pkey_util.c        | 86 +++++++++++++++++
>  tools/testing/selftests/mm/protection_keys.c  | 95 ++-----------------
>  5 files changed, 141 insertions(+), 127 deletions(-)

-- 
Sincerely yours,
Mike.
