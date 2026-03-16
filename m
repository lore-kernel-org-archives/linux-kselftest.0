Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9F21B185;
	Mon, 16 Mar 2026 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642567; cv=none; b=ZdPLVM0KbU1GJtL/eoMrxUgJJa4R1AdivzC4/imFQUbyO1tGDLB2jMOr8w7hyaO+TJS9g13WXAS1DebLLvKFDHvKmvVsmEwxvxYm7xxBH+dQAEzC8n/K61yMb5a47l0rkQKxRLIZJno4QdgaGtdkD1Ho9iHKSzVN/viUNiXu/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642567; c=relaxed/simple;
	bh=ktXRXkP5hrIO2loAV8z65+7YYpRkolR39H5JtUzQg6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIV1XBqzwWi4hN7eg/wdjlnBL/67UWD/nRODVl6NM/V4WOcD6O2c6Yth+AIbB6uQZAyDr6U2VHI7B44z8dT1AaTRYhMv/b/OcebSl9XbPowQtBByD49ysNlVX3jZPbP4tz3PwUeHXbSHtpt3q11b3OsMZ64ypiW27EimyUu6m3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1EHAFsp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1EHAFsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A81C2BC9E;
	Mon, 16 Mar 2026 06:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642566;
	bh=ktXRXkP5hrIO2loAV8z65+7YYpRkolR39H5JtUzQg6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1EHAFsp9jlP2J2cwUKw8HzJN07gL/SrtcH4P4ScAdVPoK3NKpmev9F1XykTIgAOw
	 FvMBt/kSQgiNysyDgoNWApuF1zHEqvzk7B1H73sbpJbSFrjSAyBK+FGVD1jgfBiya0
	 veXnsLgv7Q3o0uGoOwKv0+jveNvUsf+/MtDmmyszyBdKFvLx4mUsH9oBWGthwjlIw/
	 TxN07vLkVnVgvTKlUGlBkcbQHJk1hIrWmbO0u8dDuTnwsc3LadUJ9YuG5prA9ca1kM
	 L/4IM9vXIATWNgSDjOnNaaFNmtV4HfdE3/4gRZojDX6qZqheX9SgM84Yl/GtNqnpmr
	 ya8fMRR8FVwZQ==
Date: Mon, 16 Mar 2026 08:29:16 +0200
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
Subject: Re: [PATCH v2 4/5] selftests/mm: split_huge_page_test: skip the test
 when thp is not available
Message-ID: <abejPBPP0J2m8j18@kernel.org>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-5-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316044335.1390608-5-chuhu@redhat.com>

On Mon, Mar 16, 2026 at 12:43:34PM +0800, Chunyu Hu wrote:
> When thp is not enabled on some kernel config such as realtime kernel, the
> test will report failure. Fix the false positive by skipping the test
> directly when thp is not enabled.
> 
> Tested with thp disabled kernel:
> Before The fix:
>   # --------------------------------------------------
>   # running ./split_huge_page_test /tmp/xfs_dir_Ywup9p
>   # --------------------------------------------------
>   # TAP version 13
>   # Bail out! Reading PMD pagesize failed
>   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>   # [FAIL]
>   not ok 61 split_huge_page_test /tmp/xfs_dir_Ywup9p # exit=1
> 
> After the fix:
>   # --------------------------------------------------
>   # running ./split_huge_page_test /tmp/xfs_dir_YHPUPl
>   # --------------------------------------------------
>   # TAP version 13
>   # 1..0 # SKIP Transparent Hugepages not available
>   # [SKIP]
>   ok 6 split_huge_page_test /tmp/xfs_dir_YHPUPl # SKIP
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
