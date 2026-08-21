Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF710785;
	Fri, 21 Aug 2026 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787270630; cv=none; b=FeiDunYDIfqc+ou6kIJ6dxGlCigC41Al0or0pOq9SZfc2t1eLYgo26ljk5Z6Nf9ECEDSyGQnx82H7i59Wp57IwaTQDUCE948ZQSY9on1twkLqzkmhMSAg6xg66gzaOEESUtjNqF1+2x0qWpg0gcLfVsut3Yr4I+Es6Af3gp7fSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787270630; c=relaxed/simple;
	bh=9grO1gL79JAJkR/YuUOv47B4sK2PlKk9UyMafpw3yl4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gr2zJ4mzBsgFTi3wv0QIzhAXCPcO0ZM7tZkgIVuNDo8eo9rq5NzpOezT1MK65qy+I9Xw1hdlofh5WHBkSYHBLreue1+rAz2iugMOqanoz73Cqtexr1qrtntP5VilbvPU1gdgGs/+vDeuIgszBo2rAgPnhkPwq6u1BxucbkUtn5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GfJIQSk7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GfJIQSk7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130941F000E9;
	Fri, 21 Aug 2026 00:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787270629;
	bh=rkqoQ1bNprLHZhoURPVoyGVzYoMeIkuc+4Vk6Fc2uzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GfJIQSk7VaFpnteowHD/FR0/xe6Peu4XjC5VYanSXlsFT621yIX8fq8xncajnoDev
	 PYBBJD82NMxIY0W7y0w/JIAbwOtqkrFkFYWNGwLq0/7YrebfI9WZODjg7F34825QUr
	 i/Kv9foWkJV0FleVubC27wy6ae93DLU3J1aG7pMU=
Date: Thu, 20 Aug 2026 17:03:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jason Miu <jasonmiu@google.com>
Cc: David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 David Rientjes <rientjes@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Greg Thelen
 <gthelen@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] selftests: mm: introduce page allocation stall
 reproducer
Message-Id: <20260820170348.48f04ed654dce5193ca3a532@linux-foundation.org>
In-Reply-To: <20260819070538.2404983-1-jasonmiu@google.com>
References: <20260819070538.2404983-1-jasonmiu@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Aug 2026 00:05:35 -0700 Jason Miu <jasonmiu@google.com> wrote:

> Background
> ==========
> Under severe system memory pressure, system unresponsiveness often 
> occurs due to page allocation stalls. In commit 94e0bcde055e ("mm, 
> page_alloc: reintroduce page allocation stall warning"), David Rientjes 
> introduced a warning mechanism to emit a kernel log when a page 
> allocation takes longer than 10 seconds. This log is used to correlate
> a frozen system with the system memory state at the time of failure.
> 
> To further debug and analyze these allocation stalls, we need a 
> reproducible test case. This patch series introduces a new selftest 
> designed to artificially mimic the severe memory pressure scenarios 
> seen in production, allowing us to observe the resulting allocation 
> stalls.

Interesting.

>  lib/Kconfig.debug                             |  11 +
>  lib/Makefile                                  |   1 +
>  lib/test_mempress_timer.c                     | 140 +++++++++++
>  .../testing/selftests/mm/page_alloc_stall.sh  |  80 ++++++
>  .../selftests/mm/page_alloc_stall_pressure.py | 235 ++++++++++++++++++
>  5 files changed, 467 insertions(+)
>  create mode 100644 lib/test_mempress_timer.c
>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall.sh
>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall_pressure.py

Nothing fits very well, does it?



selftests is for quick tests which are run by run_kselftest.sh.  You
had to place it in selftests because there isn't anywhere obvious for
it to live.

So I suggest a brand new tools/testing/stresstests/mm.  If we create
this, people will jump on it and start adding things which presently
reside in their personal collections.



I can't say I like "mempress".  Is "memory_pressure" too wordy?



All of lib/test*.c shouldn't be in lib/.  lib/ is for library code! 
Again, we put them there because people are shy about doing mkdir.


Sashiko said hello:
	https://sashiko.dev/#/patchset/20260819070538.2404983-1-jasonmiu@google.com


In [patch 1/3], s/__GFP_NOFAIL// and s/cond_resched()//.
