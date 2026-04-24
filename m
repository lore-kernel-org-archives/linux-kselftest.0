Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0355B32938D;
	Fri, 24 Apr 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021914; cv=none; b=VCoUeKFBIE20LXEulVRyyhiIlS6CPUaZF468KExedLz1YvXUO9TNafMmOq34y+2gY3R3Nibb3hGmdfTtbO/RXk371XqsgHNTn5fSa6knlHYNBar7CIxS/WSSS0i773G+PaWDBmkrRsBCcfomDFMIQ1tPSi+GtaRoBQG63W/jtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021914; c=relaxed/simple;
	bh=SsqSo4+zjog+NkLRTA0Kn233Cxw/eENvVArd9TQ7CcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doART8zXK1lc08r85yLgfAmwzASH+PTEgsrtC3d0HCBcj8jygu0AD1ViFYc23o6fTjkyYih9EdEkIAcH5vqmYD9IUlKvqIVjpAyqDtYs3Ifeps2Fp7TWzMsFlniIZeQEP3Q7hnK1AOQuml83mQMWcD+UinJtB92idbuvbb41R4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Su1jyHjF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Su1jyHjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C07C19425;
	Fri, 24 Apr 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777021913;
	bh=SsqSo4+zjog+NkLRTA0Kn233Cxw/eENvVArd9TQ7CcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Su1jyHjFu/8YsS48wDh711n00szcy8RRRx8P4BZ+dQyykIbYmeeE9RTMf8ATgJBsJ
	 jCQHZ4bj09apvjrQpVki8eBjYYIiLVXFTEfekDI/YJsEsigdOWyqc5nEHmK/O7azzw
	 QU6u8C25RMKPE+YqRBm12lfEW6MHkhInS6brKvL1XEEzhxgYEGdXwVtkwaESEH7eoT
	 JKGgUB+mnHGanzv0cifDp5Bjq87FKWg63zEiKjoD8iOqA/Q53kdAIY+BAauVSSkHfo
	 MBu7Bgg9iyCY0xvNfHK8lISptO8ffBRbj2VO3lQNmVpb6iJ4hopu2byxyx3pDpX5El
	 H+Z5ortWjUULg==
Date: Fri, 24 Apr 2026 12:11:39 +0300
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
Subject: Re: [PATCH v2 16/53] selftests/mm: protection_keys: use kselftest
 framework
Message-ID: <aeszy67Qrb8Q-Xw_@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-17-rppt@kernel.org>
 <f8495e44-a34a-4289-90f8-0faa71bf1a71@sirena.org.uk>
 <aeczFjEs6sqRPy0w@kernel.org>
 <bf3133c3-ae12-45ac-a3d1-5e58b849f817@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf3133c3-ae12-45ac-a3d1-5e58b849f817@sirena.org.uk>

On Tue, Apr 21, 2026 at 01:59:21PM +0100, Mark Brown wrote:
> On Tue, Apr 21, 2026 at 11:19:34AM +0300, Mike Rapoport wrote:
> > On Mon, Apr 20, 2026 at 06:54:31PM +0100, Mark Brown wrote:
> 
> > > If that fflush() is needed it should go into the helper, particularly
> > > since ksft_finshed() calls exit() so the fflush() will never be reachd.
> 
> > Looks like I'm missing prints because of something in my environment, I'll
> > just drop the fflush().
> 
> Interesting.  Usually the culprit would be calls to _exit() that bypass
> the libc cleanup but I'm not seeing any right now...

Interesting indeed :)

My observations up till now that if I run the test on the host, it prints
everything (without fflush()) changes at all). If I run the same test in a
VM either using virtio-ng or ssh'ing into a debian VM, only the first part
of prints is displayed. However if I run protection_keys_64 | tee in the
same VM everything is printed.

I'll just drop the fflush() from this patch and will investigate later.

-- 
Sincerely yours,
Mike.
