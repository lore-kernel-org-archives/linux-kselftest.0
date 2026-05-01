Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406D2770A;
	Fri,  1 May 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777623509; cv=none; b=n6kIdOk4JOCyohn5j8VRTt+RwIDs7IgX2mq5F9eTaEhnu3LL8fJmej2IDjPiIaHEt1G6w9Pd155ay89osHUju6w7Ew8QZuEGyypDUiEBPVPs9Y7H9BlzbWJ2hpH8yp25gfvTn2cl4OO6ShpeQrQ8FWlCshKB1bFkCWMsh+QyFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777623509; c=relaxed/simple;
	bh=kKoygh8yD3HKmfyGP5oMzsiRdoqFoDmbldOTQT0EBLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBPWzP2I7UKfZs5R3MurWQ2YjRbBMCsfRteoiXMIxGYm+Bkvg+tEwyvZtpBfRi3BVZQmfOK0ua5RK0f2zuxSgZnDvN/wRHqPVybif6BO2G1lal2ijgvpv0VOuKdcOLZ97h6i5nWdLOx76T8WIfLFBzMdAMPDjcdlZHbQwJTs9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uFyo2M8s; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uFyo2M8s"
Date: Fri, 1 May 2026 16:18:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777623505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iVXwRxoZk3ouF0zgeZbTnbTmmQKuuK/h66J4DI491pQ=;
	b=uFyo2M8s1Sp/f/c5/b5vKsH/6+VI6f7IMDun00qu/QKUPEUanqieSnQytlqG8qGuM/rn0t
	iUIGLhvIqhDKLL8WCOa7AkXDl0aB0PU7/UHpNRSCWyWVUscuKMjxatCDcZZQmU1DzsxVSV
	h7XtdLeO2GbPGEJssV5HASwAcXTrI2U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Li Wang <li.wang@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <afRhx6-lEe5bxkMD@linux.dev>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-8-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428204240.1924129-8-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT

Mike Rapoport wrote:

> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -4,6 +4,10 @@ hugepage-mmap

>  hugepage-mremap
>  hugepage-shm
>  hugepage-vmemmap

Maybe we'd better remove those old files from .gitignore as well.
Otherwise, looks good.

Reviewed-by: Li Wang <li.wang@linux.dev>

-- 
Regards,
Li Wang
