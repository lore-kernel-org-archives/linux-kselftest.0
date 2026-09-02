Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2F4ACC68
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377393; cv=none; b=RfDD4HMG++vNvIFJbc9qctUYsrqCF0T+FfCCeej9/BhUFqJbbe6Zx6u7nTdLl3ZjM4SWpgTv2X270aIpqfMEzCKkzGczoPy07IAbycinNUX2ANLg05lINabqDBv3HjZ+6VleSEUYPdgkukDEUUFzo2h3EGMssPLfsBJ5elMcdyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377393; c=relaxed/simple;
	bh=ka8YDGkwYD5hFve1+vxCX1O0qWzRDuqcC9mYXKk/0Dc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oGjM8DAgLH6L7VR2kQz7EbYdo5mxYhY/JDijGtazvGl4e9I/oYfdDFF/ADbaLNj1iQ6L0Zg2bANsrjVjfiYefazB8yszlanM+pHRxqYw+Qq2YcFYs/1nOBhRCbgfi5q3kkml9Jyhu9u8j6nZVJvUeBcXLRJaPp19ieDFI5/tEb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WxZkI0zR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WxZkI0zR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267E1F000E9;
	Wed,  2 Sep 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788377373;
	bh=hnKjt2Q7cQQXIMvbkPpCr4kNY4+s/kx6ua0E2A+Cb5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WxZkI0zRNhLOcHhVhBmHsDoraOl7I2tPiez8q2Cj4cBsg4GmNkMb+csAfULTkqgEz
	 1uolqi0vN0C7oBz7biWffMcOilzJTq9LbhFx/ujI82iRdq+YFCjAmaiSk/nivxnEeP
	 vJPnW/A3HIKKsyxH3za7fWoW0edkg/3razfBrGYQ=
Date: Wed, 2 Sep 2026 12:29:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, david@kernel.org,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
Message-Id: <20260902122932.7a1b82de7a80dbd5897b65f0@linux-foundation.org>
In-Reply-To: <20260902175611.1241118-1-yeoreum.yun@arm.com>
References: <20260902175611.1241118-1-yeoreum.yun@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 18:56:11 +0100 Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> When this macro is used in some test, test result would be strange in
> the system where PAGE_SIZE is more than 4KB.
> 
> Here is example with transhuge-stress test with 16KB PAGE_SIZE:
> 
> ...
>
>   ok 1 Completed
> 
> Remove the HPAGE_SIZE and HPAGE_SHIFT macro. and introduce hpshift()
> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-exist
> helper, read_pmd_pagesize().
> 
> Also, do KSM_MERGE_TIME_HUGE_PAGES test with size of 512 MiB which
> is the LCD pmd_size among 4KB, 16KB and 64KB page_size.
> 
> After this patch, output of transhuge-stress:
> 
> ...
>
>   ok 1 Completed

Thanks.  Sashiko made claims.  The first looks legit, although minor:
	https://sashiko.dev/#/patchset/20260902175611.1241118-1-yeoreum.yun@arm.com
