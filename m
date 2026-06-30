Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF723546E3;
	Tue, 30 Jun 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846313; cv=none; b=tEHdu0bi1hbb6XHSEHb5tPv7QkbkiA9KrvHc9xOkV/qGZw/0oflzwlaI4pvneO4LgCKQj7BoA+pfl86GTArj6qB+l7I1i6V4fddemyYYsz0O7A88mMJl9JGsXfXgFqeL8fIAtuup4FTdwSSkwXoMS/trwVF2zb/QPShIksSfg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846313; c=relaxed/simple;
	bh=FxjCFNoqqQKyGlPBQPta1CU4l1fFNvFDCodTo+r9T3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+9aaSgXD+Mk078cZ+xuC8xuvJkx93Sv5vqHPzXKIY6s6zQjB07Oy4bi2x3t9pkBAE11/dP5xfMdRl1Jmt3dP7Yzzvq8Of1Mzf7zgv4AsiRSQ5BFU/iUX9iiFH4VAJZr7nYYT3oqMBy8jTLSYltiVF6mAPNy11KH0BvSlFvjFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rgsrwj1Y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rgsrwj1Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FW5G+1KBuZlzub8QMEKYBoDh26PDijuF5zKaWYshN0I=; b=rgsrwj1Y/lwGotezM1ZsF5BsSl
	QO8VRqUzKcF0+oCYOnXp22uli69/gpurqKMHTLnLxl5a+XGt5oVdNnSTjtkx3o4tP69no0q6DHRzN
	ZnRtdGdhtVWMV+pGo1WXPg1AnadO9iLPB/DLSQXmnkCs9fCBsqs4kG4EiYCX+oafj50b6sQWpXiNm
	Ntai2fc+MGJjx3t/kV3oX2IB+/l6soT6I7G+dYl4KZLhm7v9/hXT8vBGXbdBuXDnCeMJESotnL0Fh
	R0c4HVpV9ztKxT3DsaeoAqoT90Kj6pl2TNBbixA9/I4YoIkHQCzNJJwiSaFnio6d3sA+Qo+0uHv8E
	fX+u8jLQ==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedlb-000000005PS-4ASi;
	Tue, 30 Jun 2026 19:05:08 +0000
Date: Tue, 30 Jun 2026 15:05:05 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keith.lucas@oracle.com, kevin.brodsky@arm.com, 
	maddy@linux.ibm.com, usama.anjum@collabora.com, yury.khrustalev@arm.com, 
	jhubbard@nvidia.com, joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-ID: <aydheissr7yviudm6s3y57usfyx2kh4p6bdnd6mjdcnvvonga5@ydj327gtjo2m>
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630073235.3802271-1-lihongfu@kylinos.cn>

On 26/06/30 03:32PM, Hongfu Li wrote:
> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.
> 
> Hongfu Li (5):
>   selftests/mm: move pkey selftest helpers to pkey_util.c
>   selftests/mm: unify pkey sighandler selftest assertions and tracing
>   selftests/mm: use pkey_assert on clone_raw failure in pkey test
>   selftests/mm: add missing mmap() return checks in pkey tests
>   selftests/mm: add missing pthread_create() return checks in pkey tests
> 
>  tools/testing/selftests/mm/pkey-helpers.h     |  4 +-
>  tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
>  .../selftests/mm/pkey_sighandler_tests.c      | 81 ++++++++--------
>  tools/testing/selftests/mm/pkey_util.c        | 86 +++++++++++++++++
>  tools/testing/selftests/mm/protection_keys.c  | 95 ++-----------------
>  5 files changed, 141 insertions(+), 127 deletions(-)

Acked-by: Liam R. Howlett (Oracle) <liam@infradead.org>

> 
> ---
> v8:
> - No code changes (relative to v7).
> - Updated Cc list: added developers identified via `git blame` and
>   `git log` on tools/testing/selftests/mm/pkey*
> v7:
> - As previously suggested, wait for v7.2-rc1 and rebased the whole series
>   on top of it. No functional code changes.
> v6:
> - Add missing pthread_create() return checks (new patch 5/5).
> - In patch 2/5, call tracing_off() at the start of test_pkru_sigreturn
>   before the SIGSEGV handler is reset to SIG_DFL, to avoid leaving ftrace
>   enabled on crash.
> v5:
> - Use ret instead of child_pid to hold the return value of clone_raw().
> - Make tracing_on(), tracing_off() non-static.
>   Remove cat_into_file() declaration from pkey-helpers.h.
> v4:
> - Base changes on top of the latest mm-unstable branch.
> - Split the first patch into three:
>   patch 1: move pkey selftest helpers to shared code;
>   patch 2: unify sighandler selftest assertions and per-test tracing;
>   patch 3: use pkey_assert() on clone_raw() failure.
> - Use ksft_exit_fail_perror() in main() for mmap() failure.
> v3:
> - Use pkey_assert() for remaining sigaction() and clone_raw() error
>   checks for consistency.
> v2:
> - Update commit message
> - Move shared tracing and assertion helpers to a common file,
>   replace assert() with pkey_assert() in sighandler tests
> - Drop assert() from main() in protection_keys.c and add a proper error
>   message instead.
> - Link to v1: https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/
> -- 
> 2.25.1
> 
