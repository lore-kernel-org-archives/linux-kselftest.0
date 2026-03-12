Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C53133F5B0;
	Thu, 12 Mar 2026 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324248; cv=none; b=FhDvzCrz+h76pMCSzuq0b/Y4QH1l9zu4lxsLOnWwPmOaTjsQCSajZu3bwiIrL/UCH3N04UxaSWS0AGWTVsFcxFiFNos8HW/kxSeivyFtyJ5bSN62rgCy8h/kytiKnci0ZXIZBLVbNbnXXa2Looctfw2HzsPfHwasCOhAkQCI+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324248; c=relaxed/simple;
	bh=o9SPjIiwj2xZfrmCdt39M4hAYfV6fTu/SjM80H4vpEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cejduXh4SiRSfW2tvB6y1Z525qH63KuPD3C1+PnmRkK5Zlzw669mqOzBRo7jMsMIWhA0fcnftR8dSVnxUFyFhTcRFVMHTCLdep5zqsEgqBuZRC4bxWa6TBWTWiJi5yZCF5Yxmfw7wCjj8YwEqeRIAoc6Vc1AFEtVqW+9arpEdHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgeEeEyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgeEeEyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D7CC19424;
	Thu, 12 Mar 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773324248;
	bh=o9SPjIiwj2xZfrmCdt39M4hAYfV6fTu/SjM80H4vpEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgeEeEyB5syn1bLnxgeTI7hIxBuMYwh9MjY5vu3G4U6QcmBDns4tFLoVbLX/Zs772
	 7RcxEqJK7Kp6KahBsHUHbyS07BPGmeRtl7imAjGE56nKCWmxhiD+ah+peDNSWkq3Iw
	 hHvsj0tHh3jKKkw3yiQIVvy1wVg40m/37Ab9gpy92kI9c5GwkHTPNzjgLCEBFD7exJ
	 DnZnERitXZZGLd7fsx68j4NrOTwzvdGotpQzHobjLHsHQBW3W0yb+7oPe5eKcE/Bsl
	 DR4bUpf6YdUkDPFwJHk+JdmNHrkVbBzkqcrAcZcz3oFSNVEQapIyjswKLmUeCZDF+5
	 Ik/YqPO3mvrlA==
Date: Thu, 12 Mar 2026 16:03:59 +0200
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
Message-ID: <abLHz2qjdeNqdFaZ@kernel.org>
References: <20260312114027.634559-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312114027.634559-1-chuhu@redhat.com>

On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false positve.

I presume that when THP tests run on kernels with THP disabled they fail
and it would be a false negative rather than false positive.

> Mark those tests as skip when thp is not available.
> 
> Chunye Hu (4):
>   selftests/mm/guard-regions: skip collapse test when thp not enabled
>   selftests/mm: soft-dirty: skip two tests when thp not available
>   selftests/mm: split_huge_page_test: skip the test when thp not
>     available
>   selftests/mm: transhuge_stress: skip the test when thp not available
> 
>  tools/testing/selftests/mm/guard-regions.c        | 4 ++++
>  tools/testing/selftests/mm/soft-dirty.c           | 4 +++-
>  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
>  tools/testing/selftests/mm/transhuge-stress.c     | 4 ++++
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
