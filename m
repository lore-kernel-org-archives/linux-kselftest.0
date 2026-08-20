Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9C3DD84A;
	Thu, 20 Aug 2026 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215303; cv=none; b=U/krr05GhkLJDEPtlTDV0EQyPD+5NbWVO7w4MUNLLw4hcH/eHVF/9ylcnQ2ZebbHKmJxvon3BLaJB+e+U6r+Gvp0ESrViU619JSuauK7BPyfHkmvIN2bovYFW1LYSQagPq7v6ESF7RNdEiK+KJ7AMCsP9PD+FHg9ou1Y9N3RWWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215303; c=relaxed/simple;
	bh=ZpPYsSH40TqeM2AQL4UYM8fHILDV7CigkX2c64f5tAU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=erJY9l+8QYmZ0JSwIn+I2j2c02uMsBdFDv9k1OgSBj0dPML/76Z8jDztmXMOHDSTL/IdkX70cVDL0SthBIh4kQnd4fMstSX0epyI3If4GugfDV7vth66RNmN8R95mklmQJISV5dGOW/+48C6G3I0dQr23snhSC914mUzto6Tgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rkn+3slG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkn+3slG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5AD1F00A3A;
	Thu, 20 Aug 2026 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215302;
	bh=JgMVYj6pSn8hHC+0OFiCWoGGfzQGeuq+YzQcBDvrKUA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Rkn+3slGUAwpwbgVDe1i5YsP+M1oRKUmAmINtSB2sHiKfOfk0e9h/5PCj60MpfUSg
	 78AVlYHJj5fLr4TU6XUc0QgRND397FRzLc0a5FSaeohzWlBp3zvkTNje6cJuQPjRyo
	 CUu0KQT58Y9W8IhT1KVt0C/cFdA/F+HwVXSE4gO70SBkFVL7+4EUEas2nwmKGS458Q
	 RTAYqBArZY7wh+3o1UvHab30sn5mnZx8JdOp1tKGTefoHT06BslHWyo/200/ZkaG/p
	 h2CSplMikEem692BFSjxUMGAe6MSMTqjNCJqtFDDiFWBsQ++D/vbAcQknjwT6GKab0
	 hpiVZZDRZHvNw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 14/19] selftests/mm: run every supported collapse
 order by default
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-15-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-15-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.4743479069072747086.b4-review@b4>
X-Mailer: b4 0.17-dev

> The mTHP collapse cases only run when the caller names both the context
> and an order, so a plain ./khugepaged covers the PMD contexts on anon and
> nothing else.  run_vmtests.sh pinned order 4 and covered no other.
> 
> Run the mTHP cases once per supported anon THP order below the PMD when
> -c is absent, and pull that context into both the no-argument invocation
> and "all".  Around that:
> 
>   - -c still pins one order, and now says what is wrong instead of
>     printing the usage text.  An order at or below the -s source order is
>     skipped: the sources would already be the size being asked for.
> 
>   - Both orders end up as array indices and shift counts, so -s and -c
>     are range-checked before they get there.
> 
>   - The mTHP context has only anon cases, so a run that names a different
>     mem_type -- "all:shmem", say -- drops it again rather than refusing
>     to start.  Naming both explicitly still refuses.
> 
>   - A case carries the order it was registered at, so a result names it:
> 
>       # Run test: collapse_single_mthp (mthp_khugepaged:anon, order 6)
> 
> On x86-64 with 4K pages that is orders 2 through 8, and ./khugepaged goes
> from 28 results to 77 in 21 seconds, so run_vmtests.sh can drop its
> pinned order-4 line.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 1d357143258a..ba3dc1718e28 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -31,6 +31,9 @@ static unsigned long page_size;
>  static int hpage_pmd_nr;
>  static int anon_order;
>  static int collapse_order;
> +static bool collapse_order_given;

Maybe _set?  _defined? But surely not given ;-)

-- 
Sincerely yours,
Mike.

