Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774D37C924;
	Wed, 27 May 2026 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899081; cv=none; b=DsJQew0ijsnLZ01Q1eq2WnicB1jTGuFxtCfdvbKMqDla5IQdfWwpeNNwNER4CPNzTqA8CpEYn9knBzzlc0VqjffoP/eqYG/ajSsFQ8vWQBzAOj8SBYoe8mLjDQ4TnEKuIXy1u5SuJg/wAMrWpjP4jqhCZFC+VUx7RuyjO0bHWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899081; c=relaxed/simple;
	bh=sNDYpYu9WFX/Qa6MEUfvHv4yBAYUwvHqZmDbaFpq1dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c17/dLNlyfpQ/ThWLf6jqw4wcVmUG76ZRr50FDaEXpqyme9Dk7AO3KH2zWZ5Y3NbLPLZ81V2d3Uy3BqSavZBfpkaniiWma9/v3zDxXFeUwxl0mm2VlyU+WPs5adWDxS1ylaBX+pPgt7JzRM1XzKvheB/ygnj5zVYeA8RlPmg4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQ9xkxQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQ9xkxQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6764C1F000E9;
	Wed, 27 May 2026 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899080;
	bh=QhRe9HWwf69DSd30E/Hpvx+gBmO3NQardItpSdvJddY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQ9xkxQGDfK5oYUS6+HDl+tbyUrsMFSpZDebP6wO2/cDp5duntQYPhsV+g0xq95lx
	 3JFBW1PKLgNXbNR8nHepLjUF+/i0JakTtjLNmQbpbdrqP5v8/SM2Kub5dpAFPzpljY
	 vQRvo2/uq8SKDf1nZ6SbwptyjVzu79uVamrVEJ1GW4l6Y0W319q98Qbh8MInDWrHBF
	 QiODZXOJLC/Pr8CMvf5+FaK8yX8YNy2ZOWoS50TCCIWW5AYevSkiXCFK3rZcDfq5TR
	 KV1+fn7EbVyznpNF0/8rnfwb/vn1lOSoF2UUT1BQcDps/dJrTmJSMv4YC6lKoArULo
	 4DP0F4yAEZbow==
Date: Wed, 27 May 2026 17:24:33 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-ID: <ahcatXuo1pI9Z59G@lucifer>
References: <20260525130200.fa26a0456979d8f1045dc930@linux-foundation.org>
 <20260526070518.630740-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526070518.630740-1-lihongfu@kylinos.cn>

On Tue, May 26, 2026 at 03:05:18PM +0800, Hongfu Li wrote:
> > > This series is version 2 of the previous patch [0].  In v2, the changes are
> > > split into two patches for easier review.
> > > [0] https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/
> > >
> > > The main changes in this series are to refactor shared tracing and assertion
> > > helpers into a common file, unify both pkey selftests on pkey_assert() and
> > > per-test tracing for consistent diagnostics, and add missing mmap() return
> > > checks with MAP_FAILED used throughout for readability and consistency.
> >
> > Thanks.  AI review seems to have found a legitimate problem:
> > 	https://sashiko.dev/#/patchset/20260525073026.27594-1-lihongfu@kylinos.cn
>
> Thanks. I'll go through the problem reported by the AI review and make
> corresponding fixes in v2.

You mean v3? :P

>
> Best regards,
> Hongfu
>

Cheers, Lorenzo
