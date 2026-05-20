Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677BC3E1CE1;
	Wed, 20 May 2026 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281907; cv=none; b=fiDs/+MilbSZZhB3Gjxq4NtsAGXaOLbYLlCKjwPksM+LD10TgBzylNWK5pD/EJkKIvXWoqXCo6N4RvBZHI3V9G37M6idXi+cNgg4Cb+6cTiO0gLby3crJUHDyy8ABpDozrVwWVaHhZpebOzIxuDhb9qEehXSEBIQfMLJH5UedLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281907; c=relaxed/simple;
	bh=SZ3XnUjpMaWStJq8rla36qMuAI4MZY2cNqWSyf0wb1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXlz8VD+78wXeRMSXMVfKXc2rFDn4gtX4k4POvFKz5sl+zXnZ+CgUCxjQv40VbeQDy+0SeaAMGtYO63NOEuSauNeMZ/74qgGv2agrY0VKYeGQprYV5K9eteODjoQ6ifue3MPoUKb46YHwZ7RQgcBZwUbldEyN6FwXjw2VB8zTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NffAtSug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NffAtSug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139A21F000E9;
	Wed, 20 May 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281906;
	bh=YkW4pvVABxc/wOKESG2c5A2yb2O6fz7b3zhSvVthsmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NffAtSugrfa5NSP2dageADCVoO5P1/NvBAAZ9M2cPo9QytiaLhUEQXbbGnZAnCUey
	 KTk34rOn15zkN1A+UOc0jl9v+F8MNc1ugv4dB8L/z6XLaNESDh/RhBIjmGdcsGdC42
	 9Q+mAkSftX4CaNHxvoEbVMlydPqd1Ie4kmZQ1FVv9OruJCBnWsPpTmBq3fZbHu/94i
	 FC4TIlM4zD7Ee/3lQqOYuBlVDPBCryukvT9maixB6hK651FxrV4wx1Btp1YKZJ20Q1
	 MjYSRRhDw3VDjQQKPJUR6h94cn7h5r2tJlWCqktLkqh7iw3+ky8DPENNaoVvMeO3xU
	 8Wy0zd2DFyNLg==
Date: Wed, 20 May 2026 15:58:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sarthak Sharma <sarthak.sharma@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/mm: add a standalone GUP microbenchmark
Message-ID: <ag2v6KW8E94kl4M_@kernel.org>
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
 <20260519120506.184512-2-sarthak.sharma@arm.com>
 <ag13GbKcLMIoHOHj@kernel.org>
 <9382431f-3746-4477-bbef-87abb58bf180@arm.com>
 <67e9ecff-e532-4659-b4de-7019474af608@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e9ecff-e532-4659-b4de-7019474af608@sirena.org.uk>

On Wed, May 20, 2026 at 12:58:32PM +0100, Mark Brown wrote:
> On Wed, May 20, 2026 at 03:45:53PM +0530, Sarthak Sharma wrote:
> > On 5/20/26 2:25 PM, Mike Rapoport wrote:
> 
> > > It seems that we need to better share the common code in
> > > tools/testing/selftest.
> 
> > > And adding another copy of the hugetlb detection and setup code does not
> > > seem like a great idea.
> 
> > Agreed, but that was the least disruptive approach I could think of.
> 
> > I am thinking of doing this now: should I move the
> > hugepage_settings.[ch] to tools/lib/ and move the read_num(),
> > write_num(), read_file() and write_file() helpers to a separate file in

these might need some adjustments because they use ksft_(), but in general
it makes sense to me.

> > tools/lib/ itself without any ksft dependency? Then both
> > tools/testing/selftests/* and tools/mm/ could share the same code.
>
> Using tools/lib sounds sensible to me - as well as the sharing it makes
> it clear that it's a library used by multiple things so avoids the
> issues we sometimes have with selftest directories referencing each
> other.

I'd make it tools/lib/mm as most of the files tools/lib/*.c are stubs for
the kernel functions.

-- 
Sincerely yours,
Mike.
