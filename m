Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89F37BE81;
	Mon,  3 Aug 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755123; cv=none; b=u4xdA/FcZyOixQJtMQ52C9+gVfhJdh4qNF9iKXxPDNiWflozP8OI5P6b4g5MdSlSj2PbkRHv+Wz/HONUdRqfyoW7Us0DFnSVNE7fkAsurEANfDGwjlheppPWaNZDW2JBnttYrNQH0cXGvTZWBP2AZ3UYXk15GRYlKBBIstiTCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755123; c=relaxed/simple;
	bh=IgRcXaVc6Olcnpdw07yyyrynMFN2rbp+tJh3jxGKVTg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GeN0dVrlIwCDjxBOSG0KC9PlbpEF/kS/Gx0UcfehGf3S30TiBww7+KVIdPQYyLnKwxyqXU8zsdhpsiyZl0yQ+AWkEmYiGvuI3jt0+O4jJEWkqD/Dps09Wd7yenYYXzkoAVduUoKTvjqXScOnWW0Yf9EKgcN+iGbF2b+na369JlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZ2gDhbU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZ2gDhbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E241F00A3A;
	Mon,  3 Aug 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755116;
	bh=DDKR1dCVeIWJBea0NvOAJ7bfFFbiQtK40uSg+uOfi+w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aZ2gDhbUdv8u/vW7g2zB7xL14AZwWy9NwZMfuJWDklUPfivAaoAZa514qWdkP1ddV
	 RO/w5axr6lvedaKdxqUDyE9r0HmIDQdQxVGbqiuzdiuBFcZeRtVtRzlcZaRz0ePHZ3
	 xFpcDBrrxMMGcaBBt1rgkgvymGEHmXjXgxgGn+Hv//N33uBT/sO51oIEDTI9KALNB/
	 lGqPe65JvGsBKVzE2Tiom+7sRYk4l5yrgm0RM81byxY/iB/YhKozVrcKkWi2j0ixuE
	 nRzAgr8UcmISpZ7VEMipuc/2nQgC2FNAW9u5X0fw6gyK0F1gvoDKxFp+M6sQatNZtf
	 swG1QZrFLNO6A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/16] selftests/mm: skip khugepaged swap tests when no
 swap is configured
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-10-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-10-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506332.1561566.7690482774981947944.b4-review@b4>
X-Mailer: b4 0.16-dev

> collapse_swapin_single_pte and collapse_max_ptes_swap swap pages out with
> MADV_PAGEOUT and then require them to be swapped. With no swap area
> configured MADV_PAGEOUT is a no-op, so check_swap() finds nothing and the
> tests report a failure that only reflects the environment, not khugepaged.
> 
> Skip both when /proc/swaps shows no swap area, so a missing swap device
> yields a SKIP rather than a spurious failure. A real swap-out failure with
> swap present still fails as before.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index b43e060b4118..b074b005b62f 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -181,6 +181,21 @@ static void get_finfo(const char *dir)
>  	ksft_exit_fail_msg("%s: Could not read: %s\n", __func__, path);
>  }
>  
> +static bool has_swap(void)

Would be usefull in vm_util.

-- 
Sincerely yours,
Mike.

