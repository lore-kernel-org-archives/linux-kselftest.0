Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DB347539;
	Mon, 16 Mar 2026 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641931; cv=none; b=M56dDKslNfn49YkoP/jIW7NYxnMUsqxf55hMg1o6hKYfebeOclcvJGs+xXwFcq2P17zUz9fLvkt7NFWdJnte+3LTlnsHt9JBDMaHkh1w2shP5eb9+Ui65gurk7C5TPdcUGUKTf/2OCIAdXzYGvhTUhsQyoY2bQWDTaXA+1aRnnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641931; c=relaxed/simple;
	bh=mV2Bu+6pDC/dmjcbpEZFd1LBe7AtpHPzl2EX2ejAXA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt4xlKDIx1Xc4zBIuuduaeiK+qVqMj7sBBNqW9IugxLrWb1gnjp5eLgbx0m2lcpTnxWxSBbzcYCXjGY9Gjdsq8ZtnnNcnztq5gpZy6uKGz8/gLCzf8wphq666R/uIaJTvWkVXzZRaocwDn47Xy73TUz4LquneHC2CXrkW/qWv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsyHuQuK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsyHuQuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868BBC19421;
	Mon, 16 Mar 2026 06:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773641931;
	bh=mV2Bu+6pDC/dmjcbpEZFd1LBe7AtpHPzl2EX2ejAXA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsyHuQuK/fDs6nCxEINWEtuCbLJ7v6ffmoWRBRAREq3EVn0ZQ+fnvL4VmRoKjG8NS
	 xmfgqzRRuIEqSXf4bYMB/NVioYiV3HSRLus3TgCuPqyBkWMPnno8FLWun8p8mvI65B
	 bOJoqeJJtorgkijv87w/aVc2QAawYw18eOhxO+b2I7/aCg9/dFidrTlJ9ARVQjXjxD
	 ZUoawcJl/UdiDDdw2iuMqg+HvxY0o183K4Ocw2Wm6ACyFbVSt7iTPYSTYyuNkMTE2X
	 NopKEFWhoQfHsnHvJeIZijcbs8geB1Qu2b30YGBhwasFhdt9tiMNYaya1XX2zp7syU
	 Dy/yByI2fZgmA==
Date: Mon, 16 Mar 2026 08:18:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v2 1/5] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Message-ID: <abegwBHT_2nlmWKM@kernel.org>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-2-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316044335.1390608-2-chuhu@redhat.com>

On Mon, Mar 16, 2026 at 12:43:31PM +0800, Chunyu Hu wrote:
> When thp is not available, just skip the collape tests to avoid the false
> positive.

... to avoid the false negative

> Without the change, run with a thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard
>   <snip/>
>   # #  RUN           guard_regions.file.multi_vma ...
>   # #            OK  guard_regions.file.multi_vma
>   # ok 89 guard_regions.file.multi_vma
>   # #  RUN           guard_regions.file.basic ...
>   # #            OK  guard_regions.file.basic
>   # ok 90 guard_regions.file.basic

It would be useful to include output of two failing THP tests rather
then just the output of the last two test.
You can also add '-n' option to run_vmtest.sh to reduce amount of leading
#, but for that I don't feel strongly.

With that updated

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
