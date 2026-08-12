Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26F3515C2;
	Wed, 12 Aug 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542188; cv=none; b=fQGUG6mjPGQ2X/PzJN1RIhH5x1Q+xZRAB8XyZ9wAgW9Qedq4UBHNcLWrSdOFIiBfdM90emaxJjjdSJ//LU3xE2kQuwvNYdFWQzVNdIHEeoNX9r7jzmLHQoeB9fah8wLQD7h2NaUXwjY/oF464SzZY/XnrbAf9pNXGkl2UhOBmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542188; c=relaxed/simple;
	bh=F3BY6/HfWHrzeRYK1ZYvjX3A6OgT7BNNzaV5IPjlV6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYh/GKGCk4UuxlFaJBik4qRtz4Z77k0qrH55yGADCKm7mFYvWUBA6OQy5ZgG2xRoCZJM0/wapL0f4D/wufiyMpnN7FYGwplbPjRfDU1ThPjcJRBDGrupwGDIfSSGiB+Dvw/pF/UZoiPrPZXVQXId1/LpbdnsZeZZmS5qE67fsrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZGVjU55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZGVjU55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A381F000E9;
	Wed, 12 Aug 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542186;
	bh=NdUfCzcf3wF1p3vo4sFhy9PeaTxbdEqGqIMoxni8TVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NZGVjU55FQi534PAJGHVOYuF8jMET4sFgF7el1r7GfrP7y5uoqTNaTldB8MpRpIzQ
	 sO87zUQJLpBMuqR6LEwIAEz0YIj2NOrCPQCXSsbbLHSLK9umZmQN0gHwEJ/koEHrkV
	 olSRdM8zqKUFF7XlLaEVqaXoHg+OwCqPr8l/3tFhBMfnHjY3iBj8sQH0r9K9oLXQYv
	 nBMFjq8yRkvprENQktFnMAOFEZhSdEqm0ttSDUTF9SZn4jBKMc7+3eYWcXpdXTnN3n
	 4g8EJ2F9oFlA7sHfmeMmlROsFRtvqN37j4+9ht5fmFKWeNZMOVN7PglHElU1bPXbeA
	 /YZr2noOoYVnA==
Date: Wed, 12 Aug 2026 16:42:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, shuah@kernel.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	peterx@redhat.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
Message-ID: <anx4YviUtQzP-cGe@kernel.org>
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-3-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812120821.523860-3-husong@kylinos.cn>

On Wed, Aug 12, 2026 at 08:08:20PM +0800, Song Hu wrote:
> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
> TAP line, so its output is not valid KTAP.  Add the header and switch the
> skip to ksft_exit_skip().
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/mremap_test.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

-- 
Sincerely yours,
Mike.
