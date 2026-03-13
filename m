Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA03A1A4C;
	Fri, 13 Mar 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415170; cv=none; b=LQ4F24YbccLOIif2nvzOb6OBhjGdYTFwBqMw7apGdfBmcO/O60WxBSK+ASfxugyo6waBThnBcAdLidJEHlQniDQSMpLL4RjSVpWDU12LEeEgHDtwIz+UCjfm1ZUlVFSSiqVCszr5SMuvuBjk4tmBJsWvsd1PVN1zUrMZAZOE2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415170; c=relaxed/simple;
	bh=upgXH5FQcgGip5m+WEM2EL5BEmevnHCGmPvU2Fnkj+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmB4cC93of7q63oj41+w4yKL8AwUP+KEo6bpN9kHcq6XBbb2jfb0oBIwm1a9MTPR1XOldHeUUiYomr4Bi2kEXjOkJgvcIadvoedfbEKySpy3UuNch6EBp/yRuv/vYrp7/EJDPUsg3tDIzr8lPvRk/ZyuwucDNPB+lQT4HWd/Hoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ej3fenwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ej3fenwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E268C19421;
	Fri, 13 Mar 2026 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415170;
	bh=upgXH5FQcgGip5m+WEM2EL5BEmevnHCGmPvU2Fnkj+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ej3fenwU7ZNxV+t8CeOoTK4z/PpDPzKZ2CWbxzdLP9h6tNFm0kvHP4tsQJTZ7eiqP
	 tksjxO2fZew7oWFELdX+xngRg9cVlsqinaiD9zRwBBSDq3mC/RIFG+OzXsP0fdcI6B
	 bDrdJWwspTjUDePvf+hbAfYUqT84CQ841Xhea0gA1n4zQPduJjWok+KVDJ2DAgRBTu
	 q7/MWBaxIx9teU4VNzGwYuXE5duGq/tAn8O1wEXPC2PglMw3kFvp4jq4/2VMm39zhI
	 eG2C0mgrRSvZqyBxqizbILdhryeIMHrruyob2NzwYCuLyCNJGKXkXcvLV2n0npPibJ
	 NI+UgubaEer2w==
Date: Fri, 13 Mar 2026 17:19:20 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH 0/4] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abQq-Mt0p3vz5rQm@kernel.org>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <abLHz2qjdeNqdFaZ@kernel.org>
 <abNZmiL2C7KMQM1t@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abNZmiL2C7KMQM1t@gmail.com>

On Fri, Mar 13, 2026 at 08:26:02AM +0800, Chunyu Hu wrote:
> On Thu, Mar 12, 2026 at 04:03:59PM +0200, Mike Rapoport wrote:
> > On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> > > There are several tests requires transprarent hugepages, when run on thp
> > > disabled kernel such as realtime kernel, there will be false positve.
> > 
> > I presume that when THP tests run on kernels with THP disabled they fail
> > and it would be a false negative rather than false positive.
> 
> This is an interesting point. I'm not naitive speaker. I just learned
> from AI. It really matters what we define as 'postive'. I presume 'postive'
> is we run selftest and got a failure report, that's postive, not thinking
> as it's thp disabled kernel and a 'pass' is postive.

I think that a passing test is "positive" and a failing test is "negative".
So a test that fails because of misconfiguration is a false negative to me.
 
> I'll add statement about 'postive' in v2 like "a test failure is
> defiend as postive"
> 
> > 
> > > Mark those tests as skip when thp is not available.
> > > 
> > > Chunye Hu (4):
> > >   selftests/mm/guard-regions: skip collapse test when thp not enabled
> > >   selftests/mm: soft-dirty: skip two tests when thp not available
> > >   selftests/mm: split_huge_page_test: skip the test when thp not
> > >     available
> > >   selftests/mm: transhuge_stress: skip the test when thp not available
> > > 
> > >  tools/testing/selftests/mm/guard-regions.c        | 4 ++++
> > >  tools/testing/selftests/mm/soft-dirty.c           | 4 +++-
> > >  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
> > >  tools/testing/selftests/mm/transhuge-stress.c     | 4 ++++
> > >  4 files changed, 18 insertions(+), 3 deletions(-)
> > > 
> > > 
> > > base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
> > > -- 
> > > 2.53.0
> > > 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> > 
> 

-- 
Sincerely yours,
Mike.
