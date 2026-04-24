Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6E375AC4;
	Fri, 24 Apr 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022043; cv=none; b=kLN+zDagbcKQSdx/Bu4yi0QtgyFPvnnLbx5Fv0rzVkrxCAXMPxtz8TgvLM3Y5SNTUjXr1qrMZSfMGsRQIfxbTCeYOTDvxccBS6K7t7jPLdAPfDrNsFSNs82iN4lIfdWcQJhm0De+KRvXJQzwElERl/LZ9Gv+LiGVcgG0qn6Q/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022043; c=relaxed/simple;
	bh=niop0reY6PituW/Dk1Z2ZYI5VhcmIRP9z/VzEFO68oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lymvpzg0LQO2patm8bzewRye/DIgTvPigHusjNSan8qch+c2Jv509SkQARGpVCZqMcos4UwJpRQHqwvKiVruNXKMA930dPddbGltE7lzl0ZQsM1n+/ybZQ3fci/vNizpfXaXTflcRS4hTqp7l5xmkipOZ7eXEjTLZrpS6sPnzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHgSpMBO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHgSpMBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27AFC19425;
	Fri, 24 Apr 2026 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777022043;
	bh=niop0reY6PituW/Dk1Z2ZYI5VhcmIRP9z/VzEFO68oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHgSpMBOVOcwn8p0Xm8TP+46ztAmOgjg7Q2X5khW4rxTMNN0LXQZlmq5PLvGXVkWd
	 cymeLh0U5LJBo2TNtCOtZ5yUzR471uRchQgaAY6znwAZwQ2h9mqTlTZfkENhkHFnl/
	 ppUDOP++UwrQyblYcvuKhSIu6bv7UU98TEJeGy0382i1PT63Y5ZvRwT2yRBq7CD2xk
	 Z3KFITUiFIPFqTg9tNlIYtIEXhBvhCYhOFI9zg4uJoW4bIeY85T3PJWYAREZiejl/y
	 2PB0a7qbtYjuIBLl3QChA/QksVLIygq/gfT5k0m/gjYYLNUlRuLUhoqsnjihiP5hNy
	 zo4VXKAXcBCsA==
Date: Fri, 24 Apr 2026 12:13:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
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
Subject: Re: [PATCH v2 07/53] selftests/mm: hugetlb-shm: use kselftest
 framework
Message-ID: <aes0TwOonlHVgn67@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-8-rppt@kernel.org>
 <3d154106-1de3-4cd8-9bee-53ef20245d62@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d154106-1de3-4cd8-9bee-53ef20245d62@arm.com>

Hi Sarthak,

On Wed, Apr 22, 2026 at 04:50:20PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 4/18/26 4:24 PM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Convert hugetlb-shm test to use kselftest framework for reporting and
> > tracking successful and failing runs.
> > 
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Reviewed by: Donet Tom <donettom@linux.ibm.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  tools/testing/selftests/mm/hugetlb-shm.c | 46 ++++++++++++------------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> > 
> >  
> > -	dprintf("Starting the Check...");
> > +	ksft_print_msg("Starting the Check...");
> >  	for (i = 0; i < LENGTH; i++)
> >  		if (shmaddr[i] != (char)i) {
> > -			printf("\nIndex %lu mismatched\n", i);
> > -			exit(3);
> > +			ksft_print_msg("Index %lu mismatched\n", i);
> > +			shmctl(shmid, IPC_RMID, NULL);
> > +			ksft_exit_fail_msg("Data mismatch at index %lu\n", i);
> 
> ksft_print_msg() and ksft_exit_fail_msg() are printing the same thing
> here. Should we remove the ksft_print_msg() to avoid redundancy?

Yes, I'll drop the first print.
 
> I've run the test before and after applying the patch. The output has
> been correctly formatted into KTAP format with no change in results.
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

Thanks!
 
-- 
Sincerely yours,
Mike.
