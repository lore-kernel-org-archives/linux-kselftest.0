Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793439310;
	b=SK/nmtrYVcJphMm86nuUbnU+abx3HJDHlJ96zz18hI1mQ7U/eMTG2u2LfyP6I9IUD3OY
	 UTRGqpATNJ+GlRZ1AgcR49uSiuDm6kzC2JaSWBPkaSHoCrt2NEg20NvxPQi4KgS8t08dr
	 6B55haZrE3qprrsdlE6PFfTVBMpMnHjNZ0ojH4KBs4OSxOQGXldKCm1Qj6umIlGmgbKUR
	 +j5YZLdIyqxky8Wez0ds2A3EZXqkcMSZOzjCqKHEQyWhljGICMBLyFGeoFdEltQ6CWgzs
	 XhduxOgsCCZY1aGc2CoD3oaEoRA9TRuDJyahn3XR2pMV5W6VezHgyr6RiJtzuer7Gpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793439310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oXiIcJEvHHW2WbJurL7MDrlUJa6yPyxGwD0eqcXi2dQ=;
	b=BXJDh7UJkMXArW416oxUWNkdAEhOtOAkGCP/QaI6FZLPKBIsFVVpfPcc4bda0CTeow31
	 8c+vwQjttF/GPWzL4v9lXLQRbAS0rHzCPLAWVQMpVmOZu82uzTrTMDm+uChOQ9OruDpN4
	 MRjT3I3+xr5tIUg/bEUDls10MluFb/sqVWjXo+XIgA21R6tB0I+1V/skHmX8weXNxJtWD
	 bwAap3PrFHo2M6LOMujb89o8pbU/n9aSRHSivFr68NjyYAP659hiSfy3c2y6YrOouoUjc
	 xy7j7mB4tEZSB4p+nm7b6C4/h2Ns/vIJXmrmdQ+dfNzM1QhOLOBoYh9JksS8bM9K+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMlx+PVU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B7606A31C;
	Sat, 31 Oct 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMlx+PVU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC98B1F000C1;
	Sat, 31 Oct 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793439310;
	bh=oXiIcJEvHHW2WbJurL7MDrlUJa6yPyxGwD0eqcXi2dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iMlx+PVU+3s2S4Nhekc1XnebcbMUhBTXzSaTRFIXiv18Q1Rd+Kw0avo0s3mkmoOU9
	 LhAc8Ule/FkKquWC8kZrlzFmx1zxugwwMrActpUlv6TODjH4ePNPP2EUqpszUq5sva
	 mxklnCJ4ZWiftJjEqjrjC9L7pnyridW3SKXk4emaPQbdRZsZrl10E+iHGquEQf24xZ
	 8P2GVjncSLR8m2po/4dFaDrEMfvVwEpkNPpusfkbyW+OtgaUgnzuRJoegxSbFCPGoA
	 //NpUu0ULR6N7TW0gZ8H9dPBlLiyhMaycyDda4jy56U7Yb3dhwvhkcsppSD3b8E9/S
	 Hmf50SLmp+5KQ==
Date: Sat, 31 Oct 2026 11:35:01 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH 2/2] selftests/mm: add a uffd test for re-registering
 during UFFDIO_COPY
Message-ID: <auW2RZNy4jgR-ZNU@kernel.org>
References: <20261029221129.89068-1-azpijr@gmail.com>
 <20261029221129.89068-3-azpijr@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029221129.89068-3-azpijr@gmail.com>

On Thu, Oct 29, 2026 at 11:11:02PM +0100, Jose A. Perez de Azpillaga wrote:
> Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
> waits for its source page, then check that the copy fails with -EINVAL
> and leaves no uffd-wp bit behind. This covers both the hugetlb and the
> non-hugetlb UFFDIO_COPY retry.

maybe "all memory types"?

> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 2a97ba1d6feb..8a7efaa7b3ac 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
>  	uffd_test_pass();
>  }
>  
> +struct wp_copy_args {
> +	uffd_global_test_opts_t *gopts;
> +	char *src;
> +	__s64 copy;

maybe result?

The rest looks Ok.

-- 
Sincerely yours,
Mike.
