Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094B40629D
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554283; cv=none; b=ZYojnxb7N7lfHWwcaAOldBnfdSyddR1OmjnApBdLe3vExv7q8BePG97e3e4TyfWzRJDmq9HS6iKk9r+p6xDP9Rw8GgB7vCI87G4+NDaF14813MrM18mdNw7YhVVCzH8ywUBWzsur3iwKACISM6veu9yp+Ks5uALqReKJe6JJwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554283; c=relaxed/simple;
	bh=6KOU+ZJy2J4hk/QALIzI0l7fxnNlLBHRkwCUfv1rU+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEQIASYS0pKlD1ZqhQBsUR+03KE3/3J8m5zKko5mlmDjbxV40VQucT077iDCZMSUY02jGI4JGiyymEYsbTAaRvsmNVzOfrBRhLVKXFMLvSwvCATl8q8UKHniigFomUjSSx1c6C1Lv2nDspFwZG5riCxo+f+1CkKRrEZfxxIpIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WsjyOm2h; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WsjyOm2h"
Date: Thu, 30 Apr 2026 21:04:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777554279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uDExBGJ1iHFzE1+M5f2gg1Hy6mF0tMQr+a7AadJt5vk=;
	b=WsjyOm2h0YAycZDR5kiNh/spTi79Rzyrar8FrMDPTk1dG9O54ia+/wp+ub+W/WB0OC5M/L
	mwmMp+cZOf5su/zNIj/uXXEGdP1hZ0fJ+mHedReUpuXBPmTiuwgLlmTsy2edJFuUciNVOo
	RbFNXMnmYzUJKl6f0jGtWn2GW+mCdQ8=
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
Subject: Re: [PATCH v3 01/54] selftests/mm: hugetlb-read-hwpoison: add SIGBUS
 handler
Message-ID: <afNTXvC_vXnwkNny@linux.dev>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428204240.1924129-2-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT

Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Access of poisoned memory causes SIGBUS, which terminates the
> hugetlb-read-hwpoison test prematurely.
> 
> Add a dummy SIGBUS handler to allow the test to continue regardless of
> SIGBUS.
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Tested-by: Li Wang <li.wang@linux.dev>
Reviewed-by: Li Wang <li.wang@linux.dev>

-- 
Regards,
Li Wang
