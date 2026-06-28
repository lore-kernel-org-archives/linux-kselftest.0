Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C42C1788;
	Sun, 28 Jun 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782670412; cv=none; b=ckfmcq2KBlFfVslkjtYm000h5lnMfoI4+BmUe7kGM4VdPSOsZkyF9w3TYPgC2KA6AGkrnnO5nNCdDaE3qOnRdLieggsU2ZkD01Mv0xUS/vy+kwaC6g/nQJZSiWqFDs2vZWYfwIPHrLZOHFNrDgioNGFmYnUacvOqLoANH5URcWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782670412; c=relaxed/simple;
	bh=1ax+CZP9CJKkG2RB2qrA9fNZy3WgxRNlD6mlypObbFo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZqXZ5kFR3SHfbTzAIO+NRURfZSvt5C7CacSQ8Ke65AdpjnpFmLO/I5NyEzZxzEk1o3N1kXyR9k0iy4PS/PkggBPEtDgMTh3gt4tusKt3G7sK61UXOpczsUCLlbu+4W5D7cwFU6JzKUq7KLEm9de4MYCBpkgAPrtxQonmMYf++mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Oqd3Y8q4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Oqd3Y8q4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4E51F000E9;
	Sun, 28 Jun 2026 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782670411;
	bh=nG0zSS7NrnTDyRmwSClrih85J+cAN99dOSGVHcRqmTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Oqd3Y8q44w53p5dPo+HSiY+O789+71l/eF/6i7QZfQma4KphYiwC0JJKlq1aMcGeM
	 RZYQ6NH17VeitoTeIR37DA64FdYdQBrwCzoZe9FPWnCOo5hnK87os5SneLHh8NwYnp
	 q3sx3xVAWLXtLz3rIqiGIht0I1/0vy7n6ebfiKWo=
Date: Sun, 28 Jun 2026 11:13:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, usama.anjum@arm.com
Subject: Re: [PATCH] selftests/mm: pagemap_ioctl: use the correct page size
 for transact_test()
Message-Id: <20260628111329.9cfcd9c67925869307020aba@linux-foundation.org>
In-Reply-To: <20260628101118.35861-1-zenghui.yu@linux.dev>
References: <20260628101118.35861-1-zenghui.yu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 18:11:18 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:

> There are several places in transact_test() where we use the hardcoded
> 0x1000 (4k) as page size, which is not always correct for architectures
> supporting multiple page sizes.

doh.

> Switch to use the correct page size. Otherwise ./ksft_pagemap.sh on a
> 16k-page-size arm64 box fails with
> 
>  $ ./ksft_pagemap.sh
>  [...]
>  # ok 96 mprotect_tests Both pages written after remap and mprotect
>  # ok 97 mprotect_tests Clear and make the pages written
>  # Bail out! ioctl failed
>  # # Planned tests != run tests (117 != 97)
>  # # Totals: pass:97 fail:0 xfail:0 xpass:0 skip:0 error:0
>  # [FAIL]
>  not ok 1 pagemap_ioctl # exit=1
>  # SUMMARY: PASS=0 SKIP=0 FAIL=1
>  1..1

Thanks.  I'll add a cc:stable to this.

>  tools/testing/selftests/mm/pagemap_ioctl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

I'd like to see this code initialize page_size and hpage_size before
calling init_uffd(), hugetlb_setup_default(), etc.  That won't fix
anything but it's safer and saner to get these globals set up before
doing other things.

