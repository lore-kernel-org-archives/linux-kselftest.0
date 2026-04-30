Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DD41325C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554627; cv=none; b=P8zU9+61sjAzstXjR/BbVKjEX085Jo5Alth+nUHmyl0gDDNyICfbLGi9HoPK5ffyE+qqYw21ZdcxgYTqq1MYJYrSZjUK4hNhDnQBggQYIQUegb0+hJGQJ/6oeY02CBAuTBv3MXRQGs12nJkekbInB8F9ukU23QgkIFxvdQeCFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554627; c=relaxed/simple;
	bh=HRJYxF12jtuLZZC26F4+jkgNMH7CNK9WEA2YRYX8Rcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2xm4/Sjq9OfPERBKowAu9AoDnP71SxCrCB+QonJkEuqyp2B6W1g8G3oCmIwb69T9Id+ImCjRF+bDMcoeQSZV4ako57G1h/ksxDM82vQPKFnzpGSWWMRXsRH5rexAEGHZp+s1jH5RdhzjCVy+21me+rF2xXuPRffpplKScHBE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mb9+D1fQ; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mb9+D1fQ"
Date: Thu, 30 Apr 2026 21:09:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777554613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBE8NSUW3+02PQvvq4r+eXFnlCl3NEybfip8JuueoZE=;
	b=mb9+D1fQvZfKWfRDrG3QeEXxE0x3tqzEDw+JtE0gMPGYgAk8zIec1MHCeLYTQ8NR1w+bld
	xH4WmsU9eonXYVnpfv/pVUdCjFTiKPjcSfCHCFiTDAqqN2Kq7ihnj9zIWW3G8wFkP7hJTA
	78DTXzFVi4bb6npsHsZPslzzDPmeAN0=
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
Subject: Re: [PATCH v3 12/54] selftests/mm: hugetlb-read-hwpoison: use
 kselftest framework
Message-ID: <afNUlEMw2MiAKL33@linux.dev>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-13-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428204240.1924129-13-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT

Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Convert hugetlb-read-hwpoison test to use kselftest framework for
> reporting and tracking successful and failing runs.
> 
> Reviewed-by: Donet Tom <donettom@linux.ibm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Tested-by: Li Wang <li.wang@linux.dev>
Reviewed-by: Li Wang <li.wang@linux.dev>


-- 
Regards,
Li Wang
