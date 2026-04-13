Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35533B52EF;
	Mon, 13 Apr 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075918; cv=none; b=K6fmDR5ZAeCP6nUMZoYJoMG4f6LhsE/MITSYa1mZDPCi/EHdQVz++oREkemHDOQvPjOF/F8oxepP5nrr204zKNKx2WDbrDrkGT57N3UHaJrrzmxsCjJOjo3cuhZVAgcNcOWRbLvJbhLUMEq+PXA7MTCCTnId80cfzPouWHRCvvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075918; c=relaxed/simple;
	bh=OpCtMA+VLXoHJ1J0xclfeufGCMuVGef7e420W0OMdkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHbnNAbVPtzbRfwY6NnDmXy3xg8GFQg9/jI52VY5K/d75tbKbxlTuX4UIBs2Z/1VEyqhXm778uLSWdvmusSZyK5Cve8Ez0vTv33DBixPYUHVv8wUgLWFj8UcbkZDXOpqxykqdLFiWfWkxi1C8HGkn7jdQUd4dQU3oRLTF9NFmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB2dbYyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB2dbYyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CB0C19421;
	Mon, 13 Apr 2026 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776075917;
	bh=OpCtMA+VLXoHJ1J0xclfeufGCMuVGef7e420W0OMdkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hB2dbYyNWlMxCeUtmO/7H3w7A3dMhmviL0UrOcV4LLRj6AfNbZE870kw+HAqD03PW
	 sc5kSybQSC+cDpIu294MegfONjVOcCit3vFr8BiJebMKdFT7ju+gZ1RV3OoTO98NwM
	 wv1anMpNA+t9HBkSNp4vURIg7mlq6s/6t1bJ2sJk3NcESyvscMBPH3u3XjTw4ryceq
	 V57GHefaDJIax79/kKQpSD30AvFWIQsZuBPFHQO7G32VEylQIn74c+SZbFeB46NCn1
	 VbRToJWPUfe6HjfMzrqU7r1kS7vNKBr++nFimvX6qlM9XmAIg1PxELvMJJHP3xARK+
	 E/uLbn1wFADNA==
Date: Mon, 13 Apr 2026 13:25:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 10/53] selftests/mm: hugetlb_madv_vs_map: use kselftest
 framework
Message-ID: <adzEg1JM-OO0yzqd@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-11-rppt@kernel.org>
 <c1ff61ca-89a2-4d13-b376-03cbe7719366@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1ff61ca-89a2-4d13-b376-03cbe7719366@linux.ibm.com>

Hi,

On Thu, Apr 09, 2026 at 10:44:28PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> 
>     From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
>     Convert hugetlb_madv_vs_map test to use kselftest framework for
>     reporting and tracking successful and failing runs.
> 
>     Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>     ---
>      .../testing/selftests/mm/hugetlb_madv_vs_map.c | 18 +++++++++---------
>      1 file changed, 9 insertions(+), 9 deletions(-)
> 
>     @@ -115,12 +114,13 @@ int main(void)
> 
>                     if (ret) {
>                             ksft_test_result_fail("Unexpected huge page allocation\n");
>     -                       return KSFT_FAIL;
>     +                       ksft_finished();
> 
> 
> Should we call munmap() before exiting?
 
We could, not that it really matters.
 
>                     }
> 
>                     /* Unmap and restart */
>                     munmap(huge_ptr, mmap_size);
>             }
> 
>     -       return KSFT_PASS;
>     +       ksft_test_result_pass("No unexpected huge page allocations\n");
>     +       ksft_finished();
>      }
> 

-- 
Sincerely yours,
Mike.
