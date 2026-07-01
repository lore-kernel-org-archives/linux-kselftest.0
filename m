Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D113F6C3D;
	Wed,  1 Jul 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918775; cv=none; b=aZuwUWfhnyJ41h3u0ODSjWhZR96UGwRTJrO8ORld6DFzItNDb7f9KEiNwtG1K9EoKbUU2zHKNI1PnfCvZy7vrBkf/WRilTWG3yDqRds+KUG6/POhT2Z4KmC4tC5M3d6HxwlC2mm55zBo+LecQIPkm2mut4CxUopIqw4NWj0e+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918775; c=relaxed/simple;
	bh=w1BNEJPXIDy9algqgCKAxD3B5zfQNFh2VUrM/S84y8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W24VbCGzthxcH0jzwW6hyCpdeCW7mCmC/32VkSJht6irll/nslF2yfnwnidPBKBiTdWL3zKWm2KzDbcTm+Fpo48oJrYRbzfPyyWLf1yvpE2ZMy9L8vzkhdmiaDIRpO1+WNIPFgzatJjX4a2IdpkElYl9dPjGA1bWOJf3JRlkf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=s81qyGVj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="s81qyGVj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F7082309;
	Wed,  1 Jul 2026 08:12:46 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08EDF3F85F;
	Wed,  1 Jul 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782918770; bh=w1BNEJPXIDy9algqgCKAxD3B5zfQNFh2VUrM/S84y8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s81qyGVjJ0IVzVYP6kgfRrvQWpL9l+uqqZm7X+9jKd1w+D7OUr1SGKAKVhYBxXyYZ
	 ABq8+8QLSHBgSAHpKgBQPiyFEnYv7x0xspwb9aG9eXz7fswyMYB/DrWoyWqEOXw7Z6
	 gw1tLyTU4RaNk2fMGekvwKRKsUuFaykZSz/rRAGY=
Message-ID: <fd31a9bc-f2be-4be7-ac4d-c79f2a117683@arm.com>
Date: Wed, 1 Jul 2026 17:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
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

Ran the tests on both arm64/POE and x86/PKU without issue, so FWIW:

Tested-by: Kevin Brodsky <kevin.brodsky@arm.com>

>  tools/testing/selftests/mm/pkey-helpers.h     |  4 +-
>  tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
>  .../selftests/mm/pkey_sighandler_tests.c      | 81 ++++++++--------
>  tools/testing/selftests/mm/pkey_util.c        | 86 +++++++++++++++++
>  tools/testing/selftests/mm/protection_keys.c  | 95 ++-----------------
>  5 files changed, 141 insertions(+), 127 deletions(-)
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
