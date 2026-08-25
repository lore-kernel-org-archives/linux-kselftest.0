Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE42F60CC;
	Tue, 25 Aug 2026 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656992; cv=none; b=D/9NWqoHA+XNdJslZvzMHlgRdCbuktb6kxUgrpvpJrkwsr7jFoD3wZGJVZU+Qgz9Sf+lsF4xb2qhwoYt0iUp612R6i5UYoAtJQqzbRXUX2jf/BDoecDSi2K6cUkzrtM7f4g9xeby0u9cjIfUAuxY3ev0a8pgH1xNpTaUE1U4VQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656992; c=relaxed/simple;
	bh=VSe++JTeo3Lze7VoK7R+77jSBU0nwKRUttpcS338dYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1oCgflXRZEs9GxhGqrf3axCGYWVdNYIBgHLgkXsX7u1AwlOhSth3C2tsRubl/+ir+dXpF+r94oUcU+2Hf13gT31HTcCH7iHfmIcDcN7YmKHTTaFCagg1r7na2SjHfSDKh7luhNNrFnMGRcvuTzci9m5OHx9+vtT3uyLGb4gi6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuMLJAY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuMLJAY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164141F000E9;
	Tue, 25 Aug 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787656990;
	bh=Tyn/y+MG68HEs9Pp5bTgaiJX3rDDKIVre5+E3+QTbSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuMLJAY1UgWB45R12EQH+XX1KX79CgVVtBokflTkOcqEHlWAQUSnPp1lMDVi5OQYA
	 mij4WTcyisHP0A1CVOBIBhZRwkxcNLj2qjKm6RBOSWKx6WgK28cTRWXIhNYK+LeD/b
	 IO29TRKJuOrxaL0pPVEu6CCe6RZfAuvDxRqkzwwC0fUNYlbhBN2Fst3Skod8NIvlDy
	 Xe6NLKcvQEuzgPzmrjXy21ARNlBPmdiw5py+xhm9P3yDqG2311iQuCL1cBCAISqAI4
	 NTtlz3EVDQ4KiW8GiMY+yIpu/vWfyesUicZ3JHIxk+JddjhZfLlVQ8NbHtAF5kII8K
	 VR6CWa//69wJg==
Date: Tue, 25 Aug 2026 12:23:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Message-ID: <ao17EcW1-iNN4Y8i@gremlin>
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>

On Tue, Aug 25, 2026 at 01:20:59PM +0200, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
>
> Nobody after us needs these parts of the argv[0] string anyway.
>
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 1d2d6bd72fd2a..83d27d069c413 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1227,7 +1227,7 @@ static void parse_test_type(int argc, char **argv)
>  		return;
>  	}
>
> -	buf = strdup(argv[0]);
> +	buf = argv[0];
>  	token = strsep(&buf, ":");
>
>  	if (!strcmp(token, "all")) {
>
> ---
>
> base-commit: 169393fff5d1ec2690934067eeb95544ff5ebdd7
>
> change-id: 20260825-remove_str_dup-bb089e93094f
>
> --
>
> Cheers,
>
> David
>

--
Cheers, Lorenzo
