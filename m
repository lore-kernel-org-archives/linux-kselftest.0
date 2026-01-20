Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6533B96A;
	Tue, 20 Jan 2026 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929775; cv=none; b=SMvNB+b9am3l4fo5WvPhXlfR4NCrivXUSMI2rHYXMBl0sc6egFqDdGL9P77UxWvy2K6VNcQXR0nQraV4SobxPoFbJFWtd2GvKS5BI40oromEpt2o6EMe68dMnSAwkF2EFGtGiaXqra4J6mIr7QSSfFRKzxPEtH18mCO+tZm6LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929775; c=relaxed/simple;
	bh=+PpQhlnYOghCS9FQdpea1dqa5DXErdHY+bL/BwEjMXw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gR1i/BAfGyw6g/wfredhZoLmO/uWKkLyZ29/5qXoiaq/Zu0CONmGzNXtHOcVZinQgRs/mNCJPAnSbj6acZ25uLyXEuQT7P4S7FsUFN0mdvHubsjxaXOTlvHZCp20kRJet76fxYQog2xdEQruCBREtLsm2Zlb2XL2UPXFi9vp4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s8lvO7fL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s8lvO7fL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E111C16AAE;
	Tue, 20 Jan 2026 17:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768929773;
	bh=+PpQhlnYOghCS9FQdpea1dqa5DXErdHY+bL/BwEjMXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s8lvO7fLdDgmuSM7nWDJ+1STjiJK4yz0QTXDWDsnC60f57BOxkn1aV8PUyyd5tGJv
	 CpAdZzrrFM1+UaaGDgyfYAsCdjuC6mXplHGhDQyBJpXj/zJLdQSmuTBoh6XNq+clD7
	 itFs77aewVdoUUl2AggxsHzWejrcHv5vSI5/BXM0=
Date: Tue, 20 Jan 2026 09:22:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
 <leon@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Have the harness run each test category
 separately
Message-Id: <20260120092252.8597a496ed1cdebe5e120fb6@linux-foundation.org>
In-Reply-To: <20260120-selftests-mm-run-suites-separately-v1-1-a4334f0cbb3a@kernel.org>
References: <20260120-selftests-mm-run-suites-separately-v1-1-a4334f0cbb3a@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2026 13:25:32 +0000 Mark Brown <broonie@kernel.org> wrote:

> At present the mm selftests are integrated into the kselftest harness by
> having it run run_vmtest.sh and letting it pick it's default set of
> tests to invoke, rather than by telling the kselftest framework about
> each test program individually as is more standard.   This has some
> unfortunate interactions with the kselftest harness:
> 
>  - If any of the tests hangs the harness will kill the entire mm
>    selftests run rather than just the individual test, meaning no
>    further tests get run.
>  - The timeout applied by the harness is applied to the whole run rather
>    than an individual test which frequently leads to the suite not being
>    completed in production testing.
> 
> Deploy a crude but effective mitigation for these issues by telling the
> kselftest framework to run each of the test categories that run_vmtests.sh
> has separately.  Since kselftest really wants to run test programs this
> is done by providing a trivial wrapper script for each categorty that
> invokes run_vmtest.sh, this is not a thing of great elegence but it is
> clear and simple.  Since run_vmtests.sh is doing runtime support
> detection, scenario enumeration and setup for many of the tests we can't
> consistently tell the framework about the individual test programs.
> 
> This has the side effect of reordering the tests, hopefully the testing
> is not overly sensitive to this.

Thanks, let's see what people think.

What happens with tests which are newly added but which don't integrate
into this new framework?  eg,
https://lkml.kernel.org/r/20260120123239.909882-2-linmiaohe@huawei.com

