Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B92F7F18;
	Wed, 27 May 2026 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907675; cv=none; b=SB/+LhIE0bS6OEvjNzXCKRNaFCgRfFM42p55zpp9PsIK/jBQ5vRncKtgLybnczDfPUghTe8uLobdk1Q6c2Q+alE7xU1WYRLbyZoNwQQmdAamg5zHDhoNlOWtSFCJBIe/1K8lttyEhZa26ScIZKBTQWxW5Lv85l3d1aXfWfsqDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907675; c=relaxed/simple;
	bh=FRNf0mOJK1bSkZLg+XsuNkDRMpgWAzZM4VUilgwMKa8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mGFu9Ghcbahn69pnDiMOz6cwX+PpnLCEgwKJCT1yBYmsKcJd3CJOQOkXX4WUduv210vgeE5SVuj+F3LsgcsxXuNZEoUF87ZMIXJcguEb2OvjQ/7Lqdd80a20ALxRD7hiSLXDkmj2ggi8o+/74kEu2vuGWTQCj82rCyrhj2vYx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=osFGT9HH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="osFGT9HH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19271F000E9;
	Wed, 27 May 2026 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779907674;
	bh=dGFyRpMilg5FBEZHsEq53XOAuqN0WdRnl6J8HSeVqnI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=osFGT9HHpNBx5BsDMr4gbf+ec/zmEIYPT/ARb+QrHwGAbLmbmGnL/6MYSdmMNX5Xd
	 tpeWdohoB3dc4jZgj5fxq+4jVmU0EhzuAt6Uj5tAFl8xqbV5pT9+QGX2dHBjn7Q5Is
	 xmLXLTQ3U68fI4GZ2lA0mMRC99J5NG6JsqHxR/zs=
Date: Wed, 27 May 2026 11:47:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] selftests/mm: separate GUP microbenchmarking
 from functional testing
Message-Id: <20260527114752.cf4dd3e1bda93fb8ebab5a76@linux-foundation.org>
In-Reply-To: <20260527142432.230127-1-sarthak.sharma@arm.com>
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 May 2026 19:54:27 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> gup_test.c currently serves two distinct purposes: microbenchmarking
> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
> functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
> DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
> tests cannot be run or reported individually and run_vmtests.sh must
> invoke the binary multiple times with different flag combinations to
> cover all configurations.
> 
> This patch series separates the two concerns: tools/mm/gup_bench for
> benchmarking and tools/testing/selftests/mm/gup_test for functional
> testing. To avoid duplicating HugeTLB and related file helpers, the
> series first prepares the existing file helpers for sharing, then moves
> the common helper code to tools/lib/mm/ so it can be shared by both
> selftests and tools/mm.

Thanks.  I'll duck this for now, see what reviewers have to say.

Sashiko still has a couple of nags.  Minor stuff, arguably ignorable.
	https://sashiko.dev/#/patchset/20260527142432.230127-1-sarthak.sharma@arm.com
