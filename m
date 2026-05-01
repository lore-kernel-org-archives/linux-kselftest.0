Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7395B13777E
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777624554; cv=none; b=Cs9C4hh0T03XG+zOZtj2pshv+gY2/hfbC81VFWEXaqcif8KXUB0EV7KpLC2iGPsrNPgZFS4CPNGzihjgJCgB8F8y2aq2WgEyMJcpT2ssYaIaQqKIlk8r0PkoTZwEaeuBFKFy5s6MT5Kz+ZiTN6iprZIzS6dUiwxH6rTm5rznYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777624554; c=relaxed/simple;
	bh=5uUjvdANoRDxAMtAvPOt97+5/SEdZiKak88fKZP/n1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOZOifyhx6oPjF/twFVbkVlgbYw3P0zxY12cJ9KF98lTCtCuKbJtF3oP/meVy0JbLwvBZzOMjQOBm/LpnUOeMk2afN7Q7L8/P7/DeM8dYGM0mdTggbW3suBhLkiOuDpxWv1xzXYDrBeHXVN4CmyqNS8Z+5a+mPRsqoGBWTO5W04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cOLsC5I5; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cOLsC5I5"
Date: Fri, 1 May 2026 16:35:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777624550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v76T1y5va9Nj+ALtFUiTGiUgpJr8tBYSU1F3DLUEPrU=;
	b=cOLsC5I5OnSiJOFt5iIIxQqmHoWj8Fug/SFJ9IuJMkWgJuU5+a9hOgaExupQkhK+hqkMj4
	wpVUvaUcFtb+LEj84r3l2Dy7motcEs2u2VGW0IuhFklTIbkbQXP0Aqu1ReNPw68f3kkobr
	tCpQD7co4uPD6HIYN0oBM3eBrndmRdk=
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
Subject: Re: [PATCH v3 05/54] selftests/mm: run_vmtests.sh: don't gate THP
 and KSM tests on HAVE_HUGEPAGES
Message-ID: <afRl1Ja9ytVD3nUh@linux.dev>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-6-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428204240.1924129-6-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT

Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> HAVE_HUGEPAGES indicates availability of free HugeTLB pages. It should not
> be used to gate KSM test that merges transparent huge pages or
> split_huge_page_test.
> 
> Remove check for HAVE_HUGEPAGES when running these tests.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Tested-by: Li Wang <li.wang@linux.dev>
Reviewed-by: Li Wang <li.wang@linux.dev>

-- 
Regards,
Li Wang
