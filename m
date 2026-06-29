Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C53CF1FB;
	Mon, 29 Jun 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776546; cv=none; b=cgsEgPrGIjcV4T2zO6nRM5xVCS9P1oQ9orcSxmPqz6tKfEX7f40UIOj4M4x6CkJVTK0m0WZ9mLbAgcum7gpAx5p2QGf4MajQTGY+mnOuoi9vIVJ1VdOVYerONam8BwkJckGb7J44lWKmcA3uIF48lNXxBx0c6rIwGs7ZH/oobSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776546; c=relaxed/simple;
	bh=76vj7y1QhK3nQwm/PBKr3J92323Kfo+S9KABwejg9Zw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KJExTqngajr4F6nMUkl+i5RASBqVzx1RD1t9eluzGBdj7bDNPd2+tp95nsGX0+U8YzDaoJXtOHpZ0LF8iDXGHQm5S8My5hDmZVaf8vSdnRmR6ZDixcUerBzyJ4omb2ViAbb9ORy25A71QVhjrfsEpEi590jydT0lFUkdXmg1f68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pqMC9wV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pqMC9wV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51601F000E9;
	Mon, 29 Jun 2026 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782776545;
	bh=LvOP6KyTa1cQF7RqDicaH/PT+XmQi8wUo+CgFxHTDUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pqMC9wV/3Vm7XRL0AP/0vXNIhfNVVwi+hiUC33rtZT0VnJByFxdPl7sGZ85pHKE1f
	 sbDErgIokbNUmPq92rH1vgCFRAbBzT8ZHcmxazXBAwc+YjbN2suKMYexFXhYEWc83Z
	 2x8UPPTvrzQ6mQNwafNncEx7E1EXMK/Ad5WyaIMQ=
Date: Mon, 29 Jun 2026 16:42:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, hongfu.li@linux.dev
Subject: Re: [PATCH v7 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-Id: <20260629164224.ba45dc18cdef2848950631e4@linux-foundation.org>
In-Reply-To: <20260629103234.3240178-1-lihongfu@kylinos.cn>
References: <20260629103234.3240178-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 18:32:29 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.

Thanks.

>
> ...
> 
>  tools/testing/selftests/mm/pkey-helpers.h     |  4 +-
>  tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
>  .../selftests/mm/pkey_sighandler_tests.c      | 81 ++++++++--------
>  tools/testing/selftests/mm/pkey_util.c        | 86 +++++++++++++++++
>  tools/testing/selftests/mm/protection_keys.c  | 95 ++-----------------
>  5 files changed, 141 insertions(+), 127 deletions(-)

Unfortunately MAINTAINERS and get_maintainer are often useless in
selftests.  In this case, I expect the people who wrote and work on the
pkey tests don't know that this patchset exists!

Poking around with git-blame or git-log
tools/testing/selftests/mm/pkey* will show who should be cc'ed.

So can I ask that you figure that out and send out a v8?

(Sashiko likes the patchset, btw)
