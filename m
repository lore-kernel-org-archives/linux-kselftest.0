Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702842882F;
	Thu, 30 Apr 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559800; cv=none; b=Wy2zUbOkXub9OFfSLOwolumQUpxf/XyC2hJHYwS/0eDAs86lONHKzWBqtmjsaGkuuEshtJyAXMnLupmOzKcqw8qAN1d1pq6cDdeQ4Y4xwTBt70itk6MyFo/vqDg5+NFj8J/zKeXb7m/QrOmeJQ/wCExpkLcNVu1Q2eOyUTUouTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559800; c=relaxed/simple;
	bh=as939qs8wfsBTGwXp3ewh6inHqVYfZy+nWQOmM5zTpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzU0fRkokSBVofwE4EJu3Cugw6Tc34hQY1a7Eii3c09NXfLwOmuyWbehS4klCjKncbYynPD71R6RA/1Rn4cAQtH0baB5MFNyXa2Sppz5i/Uvt3HbyxYT9n5z1ubEm9nKf/tTlUdI/iKOgWbkuh0xRqDeHcyf3JoiZH5gDdTLBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=By1fd0Wq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="By1fd0Wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901BBC2BCB3;
	Thu, 30 Apr 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777559799;
	bh=as939qs8wfsBTGwXp3ewh6inHqVYfZy+nWQOmM5zTpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=By1fd0Wq3wrNKuKqgvh96v2vhcfbQj3bGDgXXhGVNEIz0O0ePdbmHtVsxWnY21sT3
	 Z7YVI17zupg5zfDfoNOYxv+96OeWMX1JcJlfxbsyhn8oYqssyCFk4zPMk+rdKVva1S
	 9gc+XYWnuaHtRzS8gq+3AmQ8fZ1TBEs9TXJmDzdQgjjVaqdOtXSvcsETxUPAN56y3R
	 hZkdz4ukPN1bdqH+Hy6MssE4QND7B2SYyfxtsG4IneoJocwAJtokbNITRzRC/CdD+J
	 7EBRWBEYslY6iitGnu1nnQX/xH6xRYCgeyuozkC/6PZcwvNJuKWJfZ5eVnnuZYY5Uq
	 4TXElpxlUlj2Q==
Date: Thu, 30 Apr 2026 16:36:27 +0200
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
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 19/54] selftests/mm: uffd-unit-tests: use kselftest
 framework
Message-ID: <afNo6xaWtlTofW4w@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-20-rppt@kernel.org>
 <89382a73-4b9f-422a-acf2-02f77e5bf547@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89382a73-4b9f-422a-acf2-02f77e5bf547@arm.com>

Hi Sarthak,

On Wed, Apr 29, 2026 at 06:43:53PM +0530, Sarthak Sharma wrote:
> On 4/29/26 2:12 AM, Mike Rapoport wrote:
> > +
> > +	ksft_print_header();
> > +	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
> > +
> > +	if (!test_filter) {
> >  		has_uffd = test_uffd_api(false);
> >  		has_uffd |= test_uffd_api(true);
> >  
> > -		if (!has_uffd) {
> > -			printf("Userfaultfd not supported or unprivileged, skip all tests\n");
> > -			exit(KSFT_SKIP);
> > -		}
> > +		if (!has_uffd)
> > +			ksft_exit_skip("Userfaultfd not supported or unprivileged\n");
> 
> If has_uffd is 0, two test outputs from test_uffd_api() are being
> printed and the third output is from the ksft_exit_skip(). Since we have
> declared the ksft plan before this, we are getting the following
> diagnostic line:
> 
> # Planned tests != run tests (67 != 3)
> 
> If we remove this if (!has_uffd) check, still all the tests are
> individually being skipped with a "feature missing" message and the
> planned tests are being equal to the run tests. So do we really need
> this check or can this be skipped?

Apparently not :)

-- 
Sincerely yours,
Mike.
