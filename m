Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B4333A9D1;
	Mon, 16 Mar 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642617; cv=none; b=tJe9tNp3S5MxMCi6ZISdx/fj+Y69BBjmjMUq6GFJgjUwJjWyxb5txsmhUH/xRorvquPrd1iJaNpS73mkYXaS8dOb1bXFbjHV3DhjPFcejDJYclsR+CGrtiltG7kbgpXqq4tm/QAkGQTlvOYwTpFXSVKoAWbOJ6+Nhx+WQe3uKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642617; c=relaxed/simple;
	bh=BoAh9R2GzWm0J+6HTrGxGxOCOG2wr51zWGNUGEpZehg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB6RZsRCyUmxoQmZztEPQOzvyK2KXq6dbghKwPgGmY6PiriEB+6Vfjm0xVAExoaMYGYZ/LN+fXOyASp7oa7/nQHxoUTm1Dn6GK5tI2fPekqtGWIzlvOspaApF2nHFmTOV9AlHmXY4Be5d8ts2ltah5SigjtBVrxJtoPwaYkhyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrAO+LMX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrAO+LMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7BCC19421;
	Mon, 16 Mar 2026 06:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642617;
	bh=BoAh9R2GzWm0J+6HTrGxGxOCOG2wr51zWGNUGEpZehg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrAO+LMXLmFNA8i12ZwNrpk7GdRAUsDf+a4vK3fq4p42YlFyHT/saU0gROlAzEKZE
	 DnmJq0GG+T+nCaApEM7GEx42dCUaniKigKA31VydRZDVqJIrTzNwa8f92MuB0fhzqW
	 du0TclxXK/qCbTgLDG9cUoUBQSYyZNHWtvVfOOutDP8UAtIqQX2bbNhWGEH1hiljIW
	 3bKcxWK8wHsYTKsgbmOBPMcK7kE1bw79Av0ZmI+Z5kaugNNbJVar+5/f26oHY7BdMI
	 msTWuTlOldO+Wi11E0O9yu/c9+AEp+1iEDrO60RLPr/LpRyDIgC4jHw0HSu/aaKFs4
	 QBe2R/bLqAiig==
Date: Mon, 16 Mar 2026 08:30:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v2 5/5] selftests/mm: transhuge_stress: skip the test
 when thp not available
Message-ID: <abejb7wggISdsIad@kernel.org>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-6-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316044335.1390608-6-chuhu@redhat.com>

On Mon, Mar 16, 2026 at 12:43:35PM +0800, Chunyu Hu wrote:
> The test requires thp, skip the test when thp is not available to avoid
> false positive.
> 
> Tested with thp disabled kernel.
> Before the fix:
>   # --------------------------------
>   # running ./transhuge-stress -d 20
>   # --------------------------------
>   # TAP version 13
>   # 1..1
>   # transhuge-stress: allocate 1453 transhuge pages, using 2907 MiB virtual memory and 11 MiB of ram
>   # Bail out! MADV_HUGEPAGE# Planned tests != run tests (1 != 0)
>   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>   # [FAIL]
>   not ok 60 transhuge-stress -d 20 # exit=1
> 
> After the fix:
>   # --------------------------------
>   # running ./transhuge-stress -d 20
>   # --------------------------------
>   # TAP version 13
>   # 1..0 # SKIP Transparent Hugepages not available
>   # [SKIP]
>   ok 5 transhuge-stress -d 20 # SKIP
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
