Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460630AD1C;
	Mon, 11 May 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488132; cv=none; b=qTg5ysNc7xFOMJnmJPHw7S76iS69YznjDTyHbOtr1U28MgPXuIHjHZFf2sxGJr34hmMub5hRew2qhAQulcZyzd/B9csGqGxqgBkbji7Tn+OvHfvWdVB7LA6I8oL1vhht5HsB4MCWYS61//WVx+EGk93crAkeHWA2xP6+xG4k7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488132; c=relaxed/simple;
	bh=iozcmjeAP6nUALBo5HVeYq0TXjJRgbdJ7Nhs9vISU1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gwr+9Jib8I5jqDtQFOmGumJuw1dyp1hiItxpqPhzHQ7EG0hrgqNQ1Hu59Z9vSYNNAaUjCXa/9rp6hYVzlS4rO0jafU58kQhsrh51vEJLaYxW4mjrZlhV3NeKsqeqO4gx724D1Yhz1iuY7pYdLQGkXsW3120I3aJwXo1AcExIZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJhCk7dS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJhCk7dS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074DDC2BCF5;
	Mon, 11 May 2026 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778488130;
	bh=iozcmjeAP6nUALBo5HVeYq0TXjJRgbdJ7Nhs9vISU1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJhCk7dShIW/oMMoKij4Ca32+sU9UI6r15MDLfTGp2dwojSWsZ+M8I2Ytayski5Kf
	 QRNb+SNdhZzARNckyjO8uRXM7Gyh7q9Vgf5iogek3QhPI3wrD8dqQKQ4lptuO75NPJ
	 hKlPUgo/k/0NArrTVJtZf5kT13EUBkNFi+7KQCUQ0xZpqWW7KgEeUZ0U8H5vz46+JB
	 OR5Gev5TZlZzbi2b9F8RE5UUwdEFF2LFqiwgly3v4T6M+MN2Db+ZOJf+W/Wk7C9CL8
	 7DkBJ2xrrVqgU2SslIQ1IAdxNWKwYjbiHaOx2Kngr9LR3ZiamlGCfCCU2KkJdsGxBb
	 I2JdEeRTkrJ5Q==
Date: Mon, 11 May 2026 11:28:39 +0300
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
Subject: Re: [PATCH v3 49/54] selftests/mm: uffd-unit-tests: add setup of
 HugeTLB pages
Message-ID: <agGTN2MVcGsZULz-@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-50-rppt@kernel.org>
 <2d31eca4-9ecc-4a7f-9359-2c605858ce11@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d31eca4-9ecc-4a7f-9359-2c605858ce11@arm.com>

Hi Sarthak,

On Tue, May 05, 2026 at 05:18:38PM +0530, Sarthak Sharma wrote:
> On 4/29/26 2:12 AM, Mike Rapoport wrote:
> > @@ -1771,7 +1794,7 @@ int main(int argc, char *argv[])
> >  			uffd_test_case_ops = test->test_case_ops;
> >  
> >  			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB)) {
> > -				gopts.page_size = default_huge_page_size();
> > +				gopts.page_size = hugepage_size;
> >  				if (gopts.page_size == 0) {
> >  					uffd_test_skip("huge page size is 0, feature missing?");
> 
> A small nit, after this patch, uffd_setup_hugetlb() can return 0 in 2 cases:
> 
> a) default_huge_page_size() == 0
> b) hugetlb_free_default_pages() < nr_hugepages
> 
> The skip message only covers the first case and would be misleading for
> the second case. Should we differentiate both these using different skip
> messages?

I'm more inclined to have a single "Not enough huge pages" message to keep
the things simple.
 
> >  					continue;
> 

-- 
Sincerely yours,
Mike.
