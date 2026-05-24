Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0B3ADBA3;
	Sun, 24 May 2026 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642380; cv=none; b=I7ckjs3m+cfkJTfHE1RfgV2Tr2rvpXjCaroV9mMTLkrBn68UDfBP3jjiZqgvhqafusHsQolthmxquDTtoH60F8oCRoSdLSdVEzbUg0/i5ZTyGiXdqOjMFOtqr4w9saVxVTBZM/BxXBFXhwccrzwcVltPP5bWXACu3kibKEq3mv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642380; c=relaxed/simple;
	bh=HvR3LX3b9wOHY+QZpaqYsoGBsI6xKaOXTz9pP3EU7zY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U2dIbNl1wVoYAkxfPcIYpemNGqMzniS5XcljIfhHmZ+q3vscNe+ksKXZiZICPuxNQOcDIja97ulnfxY+oyMKlXAACmrOWFPQtBPegqAvvKIlgG1WCIn8og7s6qXjvYizKHd5NUKKjFyMtkV2/T7oaOpG1JvvHahJjPvpv9Qv8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOTGBYFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOTGBYFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FDE1F00A3A;
	Sun, 24 May 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779642378;
	bh=SIF+d7eP3FZA+FXOPpFTmfAEaiVGtYOh/X4XUDIQvc0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HOTGBYFtSVQVuX6OIVGpgvGVGz99mWvpmdUgcyRaIviFkNulvzY+CxrGr8DlBA1KV
	 52BQVrRSDfQPoQsf0Ctc/SUoRuARvw/NjGp/TSVp03BHAFL1qeUzwAeYcvbPfjqS2Y
	 /3XmKF9GQ0V5Wu3Nkp3C5pNb8iTQpVfmn95DJTDmK0XItoVhJvYScRjEpJc4XRvJRE
	 jH57+HwOhlvQx2IVM5UQAjTouLv1so4L7p8mKhPEm6jNcCErv5leqTUHp6iXR4Cg9z
	 jMQ4lVjknfolAjX+X52h/2XcmQHwvR7njKIBOrz2sKRx9/LCMeJuZl4vPvRbg7idaR
	 NI2qxXj7GR3PQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/4] tools/lib/mm: move hugepage_settings out of
 selftests
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260521111801.173019-3-sarthak.sharma@arm.com>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-3-sarthak.sharma@arm.com>
Date: Sun, 24 May 2026 20:06:02 +0300
Message-Id: <177964236208.4000040.6637433432678119173.b4-review@b4>
X-Mailer: b4 0.15.2

On Thu, 21 May 2026 16:47:59 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:

Hi Sarthak,

>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/lib/mm/hugepage_settings.c
> similarity index 98%
> rename from tools/testing/selftests/mm/hugepage_settings.c
> rename to tools/lib/mm/hugepage_settings.c
> index 5e947abb7425..b08b27776fc5 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/lib/mm/hugepage_settings.c
> @@ -383,8 +387,6 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>  		if (sscanf(entry->d_name, "hugepages-%zukB", &kb) != 1)
>  			continue;
>  		sizes[count++] = kb * 1024;
> -		ksft_print_msg("[INFO] detected hugetlb page size: %zu KiB\n",
> -			       kb);

I believe this message is useful for debugging.

> @@ -503,7 +505,6 @@ unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
>  		return 0;
>  
>  	if (nr_enabled > max) {
> -		ksft_print_msg("detected %d huge page sizes, will only test %d\n", nr_enabled, max);

And this one as well.

>
> diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
> index de0633f9a7e5..7c58506c0aa7 100644
> --- a/tools/testing/selftests/mm/compaction_test.c
> +++ b/tools/testing/selftests/mm/compaction_test.c
> @@ -15,9 +15,9 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <string.h>
> +#include <mm/hugepage_settings.h>

As with file_utils.h this can also go to vm_utils.h IMHO.

-- 
Sincerely yours,
Mike.

