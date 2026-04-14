Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D33B2FD1;
	Tue, 14 Apr 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182520; cv=none; b=Stnm0j8roK4T4PimO+TFCCQo5Ll4FQS+9+A1GVGQeQ8hjCIfYX+8R1WxoDTAA9O7iQTGtahCVcbjrxLBjL0l5uBiXQtonckTBWeSoM+SnzwmQ6twVLKhjh8XfPAs79SaxpSffUS6Urs/5TlOwRAA8UEmnaq7J1DDdyScWyqW+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182520; c=relaxed/simple;
	bh=G6aj/wFjZndGjV7ENj1/lu2f0AQQk8e3wnWoyQBrrnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1FyhLO+tmVnr+IXRdUD4LeThiohtftGhJCIAoEss3Cv9bOtRTATaxsgbrokMzg9xjtk4E/ZTUykcq74rPm1PmM9z/n5BD1VWx+btY+alT3CCuxpxzOb33OdvoVsSbMElwGAedzmSiTLLNSOtBvcynKUkt3dWGvoO01WGTBNrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvVB5+61; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvVB5+61"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD26C19425;
	Tue, 14 Apr 2026 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182520;
	bh=G6aj/wFjZndGjV7ENj1/lu2f0AQQk8e3wnWoyQBrrnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvVB5+612x88340ZgClvhkj5uO5DaLDgzWKqI9IpbZQgs564ILoKeDhoot+qaZnpc
	 6l5JhLTfhW8v8AmpW4SQqRcnU2HubQCO8j7Tn6risvDuvfXAPw2M00KTjc/J9qRUc0
	 jH4z+7i3AK9sih4Wu/BfBkN5Gw9jrA/PMpQ1AufxlMAAEw6+NRGVqBeKVHzQQPxm7W
	 ukleHFR4okrRNtBEtPVOFNpb/ANLtfz40psL+rBYdQQCP/MjGKw+QddAusYnAjZwk0
	 ecLJufohiWDvt4LDd8NerHXP9e+NU7ZStfh6zObDPeKKW5PoJpSZc1z1BeHHyBns8N
	 eEe+caeu40OXg==
Date: Tue, 14 Apr 2026 19:01:51 +0300
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
Subject: Re: [PATCH 14/53] selftests/mm: ksm_tests: use kselftest framework
Message-ID: <ad5k7-wmYc77sC8E@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-15-rppt@kernel.org>
 <b49e883b-d666-49cb-bf4d-c83a8d92a0fe@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b49e883b-d666-49cb-bf4d-c83a8d92a0fe@linux.ibm.com>

Hi Donet,

On Tue, Apr 14, 2026 at 03:11:44PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Convert ksm_tests to use kselftest framework for reporting and tracking
> > successful and failing runs.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/ksm_tests.c | 180 +++++++++++--------------
> >   1 file changed, 81 insertions(+), 99 deletions(-)
> > 
> > 
> 
> I think we missed one change
> 
> diff --git a/tools/testing/selftests/mm/ksm_tests.c
> b/tools/testing/selftests/mm/ksm_tests.c
> index 752a2c0d06ab..5219ee54577d 100644
> --- a/tools/testing/selftests/mm/ksm_tests.c
> +++ b/tools/testing/selftests/mm/ksm_tests.c
> @@ -104,7 +104,7 @@ static void ksm_print_procfs(void)
> 
>         if (!f) {
>                 fprintf(stderr, "f %s\n", file_name);
> -               perror("fopen");
> +               ksft_perror("fopen");
>                 return;
>         }

ksm_print_procfs() only called with debug enabled, so I decided to keep it,

> 
> Otherwise it looks good to me
> 
> Reviewed by: Donet Tom <donettom@linux.ibm.com>
> 
> -Donet

-- 
Sincerely yours,
Mike.
