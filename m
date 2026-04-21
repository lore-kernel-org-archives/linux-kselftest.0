Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763E32D7FA;
	Tue, 21 Apr 2026 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760426; cv=none; b=id0OxMx/O67zEd484icCjDkGCefI5LfITwebbL21RZZuNi+f7gHlHdiJZg/c/5vR8ApKUO3HDoGbw+GWrxekUjbFjbRq7txcs7CGKQIwg9hhxvPdSVNhCIyw+cnBQHHD2wVbyq+Ubu5eJM34G7rSJ0A+ramqdPTR7J0O9pN6P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760426; c=relaxed/simple;
	bh=jAjmS2dX1uxy+qP2Pq5KWMNhPJnTErwZDStpHkkhbnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/IfIB/DGhJrpQ/R7dJKeAttpzg0VdZZ4rRCYr566JSNwAKmhq3uVZbymBGkFjvZnAh6TWSc1WJHoAZ6l8hwtJafLNNr0E6RZI3MDEeEZv9lvJ1McANhT1qLasWe1scqFeVTO8C18tz9tydXqETWL5xlq0S8yhYzQY4LiTAB49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdxaoO58; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdxaoO58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1E8C2BCB0;
	Tue, 21 Apr 2026 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776760426;
	bh=jAjmS2dX1uxy+qP2Pq5KWMNhPJnTErwZDStpHkkhbnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdxaoO58sQEm1TSGhXQUFnrptBs5/Q8ZCZMv+b6320vi9MPa+wmLCvLzhI2XQivL5
	 fcl/D3JVvgVU/HjxVKmYwyCc3MyP6q6NQjwJtWWCSQrq/K34ShTQCSU+4x+hm7zgiS
	 6rrFZDR9ffndkJe/Mkjir6ZsOR5J9zLbMyU3SS2ovkCdSgy4t+O8voZx0eW3HLOLNw
	 ZJ7SS1/4jE80YdXQORw4kiSHQxTK8onpaohvLI5gxQsmebZZ0Usolfa7fvpiagL3Q0
	 bvnYkkbDVwlwswhRgW0HS3bnvGnpbZgZ+fgXTExJszm9aylSXjWYx+PBb3Pb4SQcLf
	 6PvwndTaIVCqg==
Date: Tue, 21 Apr 2026 11:33:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 19/53] selftests/mm: va_high_addr_switch: use
 kselftest framework
Message-ID: <aec2YXutD-X_YZsw@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-20-rppt@kernel.org>
 <2abd2a19-08cd-4d6b-800f-24e42a66f00d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2abd2a19-08cd-4d6b-800f-24e42a66f00d@sirena.org.uk>

On Mon, Apr 20, 2026 at 07:11:30PM +0100, Mark Brown wrote:
> On Sat, Apr 18, 2026 at 01:55:04PM +0300, Mike Rapoport wrote:
> 
> >  		if (p == MAP_FAILED) {
> > -			printf("FAILED\n");
> > -			ret = KSFT_FAIL;
> > +			ksft_test_result_fail("%s: MAP_FAILED\n", t->msg);
> >  			continue;
> >  		}
> >  
> >  		if (t->low_addr_required && p >= (void *)(switch_hint)) {
> > -			printf("FAILED\n");
> > -			ret = KSFT_FAIL;
> > +			ksft_test_result_fail("%s: %p not below switch hint\n", t->msg, p);
> 
> The test result reports should use a consistent name for each test and
> log any diagnostic information about the source of failure in separate
> prints.

Ok, will fix.

-- 
Sincerely yours,
Mike.
