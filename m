Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85722DCF46;
	Tue,  4 Aug 2026 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835890; cv=none; b=aCc3bCgz4Xa41JucPqB1TUI0bIBVGAkTCCB25tBiycD6dQWZAAq1DdPiHVwgQ4UwAWk4eR7sUMjYC81nfc3g6hg9k3vI5Cuw3Ql+vNBZ9/jV3Uzk6b5M2kvJQEL5UwrOlDjW/k9LltpeZ3JQnfsWUo6GyRAX5z+mLrVhXjxKGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835890; c=relaxed/simple;
	bh=bAGxWX0MLOkooBda3t7h7l0zk0kwwMOFK0D1NYS7Snk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNlwKpYYf5StypEsoqWgjqevmLjMDbh2PTjGRf+l0s20frn77yuL7Tmf+c75B653t017letdWDc8KcDgs+krxDOpvf96vBPlQ+ZPLgQg3YF1LDNkrEhUdNAz4PmN+63PaDH87dsXhZ2nwJqX2Ys7t1ZiWu+hm/hnpQYcZPf8mV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuGrkyn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuGrkyn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABBB1F000E9;
	Tue,  4 Aug 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785835889;
	bh=SQxLOyYTJBWfU4nxvAEc12lzDb/0GaR+mBALXjWRieo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VuGrkyn76C91hbsJO4M6wHKU77ekV1ohakLi/UTuPQRP8j9IykJ1CaqBQHBsFvyet
	 6Q0Vftx+dpcaoCrWJS940rZSP0livz5uGdT+qq8bmQ/+b5DZc1qrRrVSy1Wd1uRfjb
	 5WuwwquradzztFk7LO6IM37cKFE8U+GXN1i0E/7rtmcmWwNUPINAyT8KPd3t0+mLds
	 aQUhXb2uqpYmqaP737ZY0ljX+LeHxRO23u8AEJnprKWQXJYNARBNxxPqmkhAsXMgl0
	 9Bi8/7r/a1trn9Y6cyBiJPIRwvUEUPTezrkIEd9zXRepfGrQ9WGSnIEc5GZCLwsMIj
	 e0OHkJ0Q4NaLQ==
Date: Tue, 4 Aug 2026 12:31:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] tools/mm: make gup_bench a benchmark only tool
Message-ID: <anGxaETOA4a5auZC@kernel.org>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-6-sarthak.sharma@arm.com>
 <178574760162.1561566.7432721858074092727.b4-review@b4>
 <53e2202d-15df-4788-a6aa-1f345f0a5395@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e2202d-15df-4788-a6aa-1f345f0a5395@arm.com>

Hi Sarthak,

On Tue, Aug 04, 2026 at 01:04:13PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 8/3/26 2:30 PM, Mike Rapoport wrote:
> >  
> > And the limit checks seem wierd all over the place, like if we can loop
> > infinitely, why do we care about INT_MAX?
> 
> INT_MAX checks are there since nr_pages, nthreads and repeats are stored
> as int.
> 
> But yes I can keep the parameters which are not there in the ioctl ABI
> to be unsigned long, so these checks won't be required there.
> > 
> > And what exact limit ULONG_MAX / MB or SIZE_MAX / sizeof(ptread_t) are
> > supposed to express?
> 
> ULONG_MAX / MB prevents size *= MB from overflowing. SIZE_MAX /
> sizeof(ptread_t) prevents thread array allocation size from overflowing.

To me these checks seem overprotective from one side and not actually
serving a real purpose from the other.

Like e.g. requesting INT_MAX - 1 pages passes the check but it means almost 8TB
of memory and that's really wild.

I'd say let's keep things simple and if a user is stupid enough to run this
with peculiar command line just let it crash.

-- 
Sincerely yours,
Mike.
