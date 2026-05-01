Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808153CEB9A;
	Fri,  1 May 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777647575; cv=none; b=nlOEmU2YEBV81Cqn9F22ohAN3DS1HWLxtC3d/t+z9/0fkU/WJ4rvaBjpNWBShu3lmSWAn59guzWX2YvfbguRSLGSBvPfhA2LDL5wTOjvNySuzMDop5ga1neuCdk2QGCmDooCVo5YURD+D8ItB0vLXRz72qWAXmmLnyrCFEtfCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777647575; c=relaxed/simple;
	bh=ycaiT85yjqiIS6M7LkTtnedf3KKXD/JBbKq9kh+z724=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNG22kLzfTufHKnkupsdfs5NMOyfmiUiq0w+jv8+8Y2b8vkmyfQcPwVk721rM730WFkItHXgrx119pvPe89TueWjTOi4p2sFXEXISCprAbgp7h/A+yTZrNDas0xABz99p0PCIVbtI+/hyu27nrbH3RrnKP71Wj+tUrTlYEBkfcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKD9lzFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKD9lzFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D12C2BCB4;
	Fri,  1 May 2026 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777647575;
	bh=ycaiT85yjqiIS6M7LkTtnedf3KKXD/JBbKq9kh+z724=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKD9lzFTYLBUZN6DAKHoiMTYDc76aRpVVAhVDNRyrUGnmPjOk7oaQLU/9xN0XHEOg
	 WjXMR/NJAOMFLBahDRsfvDm/FymGhQmmgawSrG7+SapBrX0vKzOhBUsFWI2rPA8lXR
	 OkC2M9WRZSdpFJXDe+NCnxMlsxw8Z9qFHdeImFUOzSrI1je1+5opkiRMf2B56a9i8T
	 m3eOZnC1tWfsO6nhmK3UjPxocE6UMwQNzeB6hcbGnQJUKe0pF554ineboBD+WL2JYJ
	 s2DHdreQCK8rUByYcJD2kDqLTYIMqkDevQprG5hQrAh+Z8iplkFpIM4EYMf+3zoBce
	 fDGzG7jCKH5DA==
Date: Fri, 1 May 2026 16:59:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Li Wang <li.wang@linux.dev>
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
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 07/54] selftests/mm: rename hugepage-* tests to
 hugetlb-*
Message-ID: <afS_y1FhZCvqet-D@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-8-rppt@kernel.org>
 <afRhx6-lEe5bxkMD@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afRhx6-lEe5bxkMD@linux.dev>

On Fri, May 01, 2026 at 04:18:15PM +0800, Li Wang wrote:
> Mike Rapoport wrote:
> 
> > --- a/tools/testing/selftests/mm/.gitignore
> > +++ b/tools/testing/selftests/mm/.gitignore
> > @@ -4,6 +4,10 @@ hugepage-mmap
> 
> >  hugepage-mremap
> >  hugepage-shm
> >  hugepage-vmemmap
> 
> Maybe we'd better remove those old files from .gitignore as well.
> Otherwise, looks good.

A while ago Linus objected to removing old executables from .gitignore :)
 
> Reviewed-by: Li Wang <li.wang@linux.dev>

Thanks!
 
> -- 
> Regards,
> Li Wang
> 

-- 
Sincerely yours,
Mike.
