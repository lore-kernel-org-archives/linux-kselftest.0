Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE91367;
	Tue, 12 May 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547711; cv=none; b=Zy77DRK3OneGR1R1QQYk6UQhDLapy+CeDJ3ZpN2ViG4coOROTNvkEU9oNcV1b8UfcipFL66gS/X5jjiKfzPsIPa/apANUFy5p+4MgQAbjvglOScn0CxL1u3XX0zr4jPf+MeVpcLHqV3626ZyEm+hKVElRSQAfSzLNtrFoUlmANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547711; c=relaxed/simple;
	bh=uOigxamA7HqnQC0MEIlrE3L2zzSIAwK5E7bXe17pjuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1pZufmSofqcIDRVWsOoia0VdVRvGjo+aICQcz/x2rjiNjSo5BDDTU7pNeqeTWgTLiXM9Z+i0DG7TftnjWSip9DexYztyVOrceBiYsrNnkaXa10F94XBUugRY6MqeaC9BNb9lo0jvi4gWh4uHz2amZvWy4ZLMyICNZ26M2vOp8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ8mRPl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ8mRPl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCABC2BCB0;
	Tue, 12 May 2026 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778547711;
	bh=uOigxamA7HqnQC0MEIlrE3L2zzSIAwK5E7bXe17pjuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZ8mRPl6jaBrMYPbTjpx1/PdPe8at4EqJQbmNDOM4fuHw5h2XQ3/Wyj2ZXzik0rfe
	 P9+urSYhg+zHJShmVBgBboyIzzFoI5XiIKOYgZh2I1enr2K7IV7iXgHBJ7RPmd3Gwr
	 PMtzi1HL7QeUc7NHL8GsELE4o3h6S801Z2vsTNiEQh7TPZNNHasqqjjouLfjmPuKhC
	 wgiA8wDWK+IbrwwfGvLONOJm26+5mE96shBOi/ZQjoDQiGGVSEC/uCs6q8sQ2La9ns
	 G6zFvENQD/hgPVXTgGTOhEVTiupaI8KGkT1S6ROg1gl2xtZ3jysBg3XyPQL8/Kju4o
	 NyD+BFrTE6s6A==
From: SeongJae Park <sj@kernel.org>
To: pratmal@google.com
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	yosry@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] selftests/mm: use pattern matching in .gitignore
Date: Mon, 11 May 2026 18:01:48 -0700
Message-ID: <20260512010148.1175-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511173411.267628-1-pratmal@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 11 May 2026 17:34:09 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> The current selftests/mm/.gitignore hardcodes each generated test binary
> by name, which requires manual updates every time a new test is added.
> 
> This series switches to a pattern-matching approach (similar to KVM
> selftests), ignoring everything by default and allowing specific source
> extensions. To accommodate this without tracking generated headers,
> local_config.h is renamed to local_config.h_gen.
> 
> Changelog since v2:
> - Split the changes into two separate patches (header rename and
>   .gitignore update)
> - Added Suggested-by for David Hildenbrand for the header rename approach.
> - Dropped David's and Yosry's Reviewed-by tags.
> - Kept Lorenzo Stoakes's Reviewed-by and added Mike Rapoport's Acked-by.
> 
> Changelog since v1 (RFC):
> - Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
> - Updated Makefile, check_config.sh, and affected .c files for the rename.
> - Removed *.mod.c as it was unnecessary.

Adding previous revision links together [1] would be helpful for people who
willing to see details of previous discussions.

> 
> Pratyush Mallick (2):
>   selftests/mm: use pattern matching in .gitignore
>   selftests/mm: rename local_config.h to local_config.h_gen

So, after applying the first patch, we may show local_config.h unexpectedly
shown on 'git status' output?  Maybe too trivial thing, but I'm wondering if we
already considered doing the renaming first.

[1] https://docs.kernel.org/process/submitting-patches.html#commentary


Thanks,
SJ

[...]
