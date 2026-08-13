Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20647CC67;
	Thu, 13 Aug 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633443; cv=none; b=JRc6NLA9rPQYSKo0v97cygf1MBfK14UQl5SDoPePVM0c5o5nISJ1eirOaaAhp1m8awi4Ag4N/P3/donTOiN7HXt1Kzn03F8lBeoxdyQoS/vMSD3MliPmM9YHPquKiKjECJEKgK6llZPkoQQYtA0RZDz6U7oRuyHKF0cXiSxBEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633443; c=relaxed/simple;
	bh=y9IEKuwlYReSjioBMwiZcz6XGGhoNrutcClItw/Pzd8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Jqnv8V5osGabrnn95HhtNpJPONyX1hcF7FZGaLaxxkyBKBXvdUaDQpySKDKcFaJWX+ptz6cpGqrAmfpH1TSHQ1STAFyXnnxwSVqPRxHQKUURBuwfYpgM42B89dwODG8Sq4pMildOY7XPk+zRMQWWml7avXh1Vk/+k4tBz6Q2isI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJJA+LTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJJA+LTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03711F00A3D;
	Thu, 13 Aug 2026 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633441;
	bh=EUx/HV/mY8GPcWaJmj2Bcf36M6F/pfZ1KaSoB4Gw+0s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CJJA+LTJ3eAHgzpkzyBDL+mVKOec2R+daIBEuQr8Ehs+16/Col/yJJlFgxht0s8OG
	 gWWlf/fQO3uPbvdQrjnLlQmFqr/mDVFpITKc0RwBvjO8cWRplq8DyJDcaEDHIuf/ga
	 iEXFojuiMwCqQ723FcoMyJQOO6fyQq10klyp6X44APsq73+AY2BClzbui7Gu/M6pM4
	 CJzdMSpark1r1+BYhw7Bg7S309jvBlxdhhIxzSmQ2rCA2aanzG2k9ExxMDkGGTStGP
	 dAsigcIpHCVvcHTOUoBWp+AM1wtPAwQMd+bMbKFjPdkqJv0RoXZ08pKKi3T1SGyWCT
	 +Aa8Gf2BA+u7w==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 04/18] selftests/mm: skip khugepaged page cache
 cases without a PMD folio
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
In-Reply-To: <20260812132304.199287-5-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-5-kirill@shutemov.name>
Date: Thu, 13 Aug 2026 18:03:34 +0300
Message-Id: <178663341429.2230969.14030646208213550752.b4-review@b4>
X-Mailer: b4 0.17-dev

> The page cache caps folio order at MAX_PAGECACHE_ORDER, which sits below
> the PMD order where a PMD is 512M -- arm64 with 64K base pages.  A

"which is smaller than PMD order on arm64 with 64K pages" reads less
ornately ;-)

> PMD-sized page cache folio is then impossible, so MADV_COLLAPSE answers
> -EINVAL and khugepaged passes over the range.  The shmem cases ask for one
> anyway, so four of them fail and the run bails out in the middle.

shmem asks for one who? 

> The cap is one global, so it rules out every file mapping, not just shmem:
> shmem_huge_global_enabled() drops the PMD order from what it allows, and
> file_thp_enabled() refuses a regular file whose mapping cannot hold a PMD
> folio.

I had hard time parsing it beyound "the cap is global".

> Skip both mem types when the PMD order has no per-order
> shmem_enabled control, which is the readable form of the cap: that control
> is created for the orders in THP_ORDERS_ALL_FILE_DEFAULT.  A run left with
> nothing to collapse into skips outright.

This should be a paragraph on its own IMHO.

-- 
Sincerely yours,
Mike.

