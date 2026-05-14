Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB593E1204;
	Thu, 14 May 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765404; cv=none; b=G64Gr3u5RL6jMC8QSc9yFJu+1ZagAEbqS7YSM0//A/yvTacMpeEAHmLyQT2DYL7eWBtB/iWaCCDyREF3zpXzre/4pj8R2w4/fA5pPpzmqcXSktFV+8c6b9dtI6mDffZwMbDKy2h0PD2qOR0+pM0vu000r5VHLiOfiRtQkRGy5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765404; c=relaxed/simple;
	bh=vxbfjng0B9uFu3i4cyWFlIzzXmNnzPEgPX/PRp4v+CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=js0VqznKicbMbs7aVdjIao2Lbt/Q7IulV70jr4LhchehGUuvP+gnbga9JE4flS76xEG52BQNzuoUe+rOOn2hizOrO7UZmbOX3499FAe8sBUzZZDwBkVMmvWG9JzdrvSOF9cxMMmENpczeUjrWUVH6zdcqmI2xDyXB5AxkCNAib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=acQesxzF; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=XE3hTE2g; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="acQesxzF";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="XE3hTE2g"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778765391;
	bh=vxbfjng0B9uFu3i4cyWFlIzzXmNnzPEgPX/PRp4v+CM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acQesxzF7A7T9F+A+7bYxuQVSsmI/3VdYu2Lt+EvNCs4yPj3KsQYjBZUESXxqlm31
	 PzcNndL7dEGK+k3LKyHVrhR99Hn54130P/82/Hgop9yqqw41Z25mEaoQu2/kbAN5KZ
	 6FMh3aLQTZtQLUoI2P5Oe6BLgkTs/w8fovTxgMaX3Bn52e5nz1qXvkx4SvAz8hHKuK
	 rg1Yjgi0ODWYb8f6Iby8rZuKB3m6wUb68mDA5up/so0LSTATTDVJoIEzTTvzoW9kCn
	 1QJTxBWkr6iZP1rTPQg+grlmgjTOrLGYuLWK16W1v8jgpA3r7yEkQ4CZote2EAKDUi
	 F+nEXpY65tBKtOjiOhVi7ua5/0emivXTUZtaXT2Pg+YHRQ27XJU/Y4CdA/zuJVL492
	 sYThvqxyJbcWd7xMcoQNb7HKTZRsTJUjZddB9ap7cxRK6tnzZGhzDVVdqGL9u7s4I3
	 JdmQcuGvQiZi5KmeL1b6Wimk0UGAtGM2j+0c+LfOkG7AETA5alwqgM8LBCET5I1dy7
	 EoEbMHIcrXwV6COkpWLZ6ymZS39Yy1I0QUqave8mK8G57qFhhFnwRGooIDu6P9H+jh
	 2st+F4eQJctKzA17ySa1gmD+iGoa6aGprGYZ0OibR60EhRZNnuoFzONXbjWNbk1L8q
	 NKkYucWSKOO9YlxMh9RjDt6c=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id D32BD1E96CB; Thu, 14 May 2026 21:29:51 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778765389;
	bh=vxbfjng0B9uFu3i4cyWFlIzzXmNnzPEgPX/PRp4v+CM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XE3hTE2goqoZYwH4TFBAMLkaami0TNvqQC2EB9Yle6CxjGboRMuxVJJ6pSHaydA8m
	 Bu/X0dgrow+gEaHfuMU68gc1L8qCfbZGc6lRhUl3AeR3ENi5EliIYNNngjXOiFGJhV
	 pzvgsatJqSGF1G+ALpluO1NDNOYR2vkEMOaIFIjU2LJU36ec2vHPn8JH2CT+39/No1
	 Z4KBX5DP1lPvLZQtX7btz6Dr3mNGYPb3W4tZTI6AMPXFyAdGyTd9wV5XSeVTNWwNqg
	 3vHFhhtfE80BmORFq7Vy72wX/3/xSMu9UfVFFTBIGLNqniao6hEpJQXxTP+GEmbnMD
	 WWeG14rAKXE7nCjbLribyPQmjW9Y4lLYWCSEHlnJ9yteWc8olstu6Xn1MpHK3ibN06
	 NELYTQN8tGWSoCIZGzB7R7HOSWAJ9YLF2s3gMDR7kdK3r5sq9wmT0E8rTvLtoZcqty
	 0QsANpO8hAvEBogwDFz1cAHLkJwxLOY5KO6yk550F07Qm/owy5FlK5/oHjJX4S9BhR
	 fnQODupDMF4p3tAGviQmWcwyNw9zX8KnRWeSq1LAl57Vr/Jm58bKRIUeEM8xNFmTYr
	 MY9wfHNu0U9j6eGSSDOMSm9YYq9HJ1SRoDxgqUIVgVZea+F4xs4/5z51VjzZw+RA7i
	 lwYO/ev0jhEAS7KZJd+arQEA=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A7B8D1E96C4;
	Thu, 14 May 2026 21:29:49 +0800 (AWST)
Message-ID: <7f673258-e608-4d67-b092-c9dbb533d2f4@davidgow.net>
Date: Thu, 14 May 2026 21:29:47 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: fix use-after-free in debugfs when using
 kunit.filter
To: Florian Schmaus <florian.schmaus@codasip.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260507084854.233984-1-florian.schmaus@codasip.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260507084854.233984-1-florian.schmaus@codasip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 07/05/2026 à 4:48 PM, 'Florian Schmaus' via KUnit Development a écrit :
> When the kernel is booted with a kunit filter (e.g.,
> kunit.filter="speed!=slow"), the kunit executor dynamically allocates
> copies of the filtered test suites using kmalloc/kmemdup.
> 
> During the initial boot execution, kunit_debugfs_create_suite() creates
> debugfs files (such as /sys/kernel/debug/kunit/<suite>/run) and
> permanently stores a pointer to the dynamically allocated suite in the
> inode's i_private field.
> 
> Previously, the executor freed this dynamically allocated suite_set
> immediately after executing the boot-time tests. Because the debugfs
> nodes were not destroyed, any subsequent interaction with the debugfs
> `run` file from userspace triggered a use-after-free (UAF). On systems
> with architectural capabilities, like CHERI RISC-V, this resulted in
> an immediate fatal hardware exception due to the invalidation of the
> capability tags on the reclaimed memory. On other architectures, it
> resulted in silent memory corruption.
> 
> Fix this UAF by properly coupling the lifetime of the filtered suite
> memory allocation to the lifetime of the kunit subsystem and its
> associated VFS nodes. Ownership of the boot-time suite_set is now
> transferred to a global tracker ('kunit_boot_suites'), and the memory
> is cleanly released in kunit_exit() during module teardown.
> 
> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
> ---

Nice catch. Alas, I don't have any CHERI-style setups at the moment to
actually test it out, but it looks right to me, and doesn't break
anything.

It might be useful to add a Fixes tag to this if you do a future
version: I think that the culprit commit is probably the original
debugfs one:
Fixes: e2219db280e3 ("kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display")

Reviewed-by: David Gow <david@davidgow.net>


Cheers,
-- David

>  include/kunit/test.h |  1 +
>  lib/kunit/executor.c | 19 ++++++++++++++++---
>  lib/kunit/test.c     |  1 +
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 9cd1594ab697..ce0573e196ce 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -613,6 +613,7 @@ unsigned long kunit_vm_mmap(struct kunit *test, struct file *file,
>  			    unsigned long offset);
>  
>  void kunit_cleanup(struct kunit *test);
> +void kunit_free_boot_suites(void);
>  
>  void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt, ...);
>  
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index 1fef217de11d..b0f8a41d61d3 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -15,6 +15,16 @@ extern struct kunit_suite * const __kunit_suites_end[];
>  extern struct kunit_suite * const __kunit_init_suites_start[];
>  extern struct kunit_suite * const __kunit_init_suites_end[];
>  
> +static struct kunit_suite_set kunit_boot_suites;
> +
> +void kunit_free_boot_suites(void)
> +{
> +	if (kunit_boot_suites.start) {
> +		kunit_free_suite_set(kunit_boot_suites);
> +		kunit_boot_suites = (struct kunit_suite_set){ NULL, NULL };
> +	}
> +}
> +
>  static char *action_param;
>  
>  module_param_named(action, action_param, charp, 0400);
> @@ -411,9 +421,12 @@ int kunit_run_all_tests(void)
>  		pr_err("kunit executor: unknown action '%s'\n", action_param);
>  
>  free_out:
> -	if (filter_glob_param || filter_param)
> -		kunit_free_suite_set(suite_set);
> -	else if (init_num_suites > 0)
> +	if (filter_glob_param || filter_param) {
> +		if (err)
> +			kunit_free_suite_set(suite_set);
> +		else
> +			kunit_boot_suites = suite_set;
> +	} else if (init_num_suites > 0)
>  		/* Don't use kunit_free_suite_set because suites aren't individually allocated */
>  		kfree(suite_set.start);
>  
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 41e1c89799b6..99773e000e1b 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -1075,6 +1075,7 @@ static void __exit kunit_exit(void)
>  	kunit_bus_shutdown();
>  
>  	kunit_debugfs_cleanup();
> +	kunit_free_boot_suites();
>  }
>  module_exit(kunit_exit);
>  

