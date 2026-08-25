Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A11DE2A5;
	Tue, 25 Aug 2026 11:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655614; cv=none; b=bEqbm9skdsx+shnFnLWRRFEoJaAi+2Lh8PiiyT19l0L/ZNm3Hk7hxZB3Sthi7+uCbIbNHcmFnBkeKmDPPoqVSQ71FCRtAJbbEubrqXFdtUrvjYu6CUUWDzAw091NEXuHNfGUYtxfaL1kfnOZ3d0hjQWBuX9IYovF7fgVkj/a+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655614; c=relaxed/simple;
	bh=K8yYxve3hNjFCZ5OcRw/w5pU0iFtwWDNTv8KlHAfiKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyzJkUWe/jPzd3RlBHTNv0jvaP3ej3liru2+Wp95lu6Ax6OXFslAAlQvfz6Gxx4/sHIdC6LsSmRGvSwq503mPG5eZ2nd3M+kyJTU+KTieAgjzWOSHcJQFgUrmfZOauRm6Rj25DHWaSWqLql0CbKWqp2hraJaRdt+XjSf6fW4tqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 481D91EAAA5; Tue, 25 Aug 2026 19:00:09 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 4857C1EAAA2;
	Tue, 25 Aug 2026 19:00:03 +0800 (AWST)
Message-ID: <6fd0143c-4afb-4de8-b65e-3ab9a8042f1a@davidgow.net>
Date: Tue, 25 Aug 2026 19:00:00 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] kunit: add extra assertions to KUnit test cases
To: Malte Wechter <maltewechter@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-1-36a6fec9f72e@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260824-lockdep-kunit-v2-1-36a6fec9f72e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/08/2026 à 21:32, Malte Wechter a écrit :
> add extra assertions for each individual test case, that checks that
> both `debug_locks` and `TAINT_WARN` are intact after the test is run.
> The assertions are optional behind CONFIG_KUNIT_EXTRA_ASSERTS.
> 
> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> ---

Thanks for this.

I'd prefer to split this up into two separate changes, one to check for 
warnings, and one for lockdep issues.

There's already a patch series to handle lockdep failures here:
https://lore.kernel.org/all/20200814205527.1833459-1-urielguajardojr@gmail.com/

It's pretty similar to this, but may have some good ideas in it.

As for WARN, we have a new feature which allows individual WARN calls to 
be expected and ignored. This works by having the WARN() macro directly 
check if a test is failing. The difference there is that the code only 
runs if the current thread is part of the test (so it wouldn't be 
affected by a WARN() in another, non-test thread). There are advantages 
and disadvantages to this, but it's probably sensible to be consistent here.

Take a look at this for more details on how it works:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=85347718ab0dd7ede9c3e1dcff2d604c7073df05

(That being said, the current implementation does seem to work pretty 
well even with the backtrace suppression, so continuing to use this 
implementation is not necessarily a dealbreaker.)

Finally, I'd appreciate there being some more documentation of this, if 
possible. In particular, it'd be nice to extend the KUnit documentation 
in Documentation/dev-tools/kunit to mention this and provide some 
examples of how to enable it. In particular, it'd be good to have an 
example kunit.py invocation which enables lockdep, e.g.
./tools/testing/kunit/kunit.py run --kconfig_add 
CONFIG_KUNIT_EXTRA_ASSERTS=y --kconfig_add CONFIG_PROVE_LOCKING=y 
--kconfig_add CONFIG_DEBUG_KERNEL=y

Thanks again for looking into this!

Cheers,
-- David


>   lib/kunit/Kconfig     | 12 ++++++++++++
>   lib/kunit/try-catch.c | 23 ++++++++++++++++++++++-
>   2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> index 94ff8e4089bfb..38801f7493669 100644
> --- a/lib/kunit/Kconfig
> +++ b/lib/kunit/Kconfig
> @@ -142,4 +142,16 @@ config KUNIT_UML_PCI
>   
>   	  If unsure, say N.
>   
> +config KUNIT_EXTRA_ASSERTS
> +	bool "Enable extra assertions in KUnit tests"
> +	depends on LOCKDEP
> +	default n
> +	help
> +		Enables all extra assertions for KUnit which includes asserting `TAINT_WARN` and
> +		`debug_locks` from lockdep. A KUnit test suite (and test case) is inserted
> +		at the start of all KUnit test suites. This makes assertions prior to running any
> +		tests, as a pre-test integrity check. Assertions are made after each test case which
> +		asserts that each test case did not trigger either `TAINT_WARN` or `debug_locks`.
> +
> +		If unsure, say N.

A few notes here:
- I'd rather have the taint/warn and lockdep assertions separate here.
- A more descriptive name than "EXTRA_ASSERTS" would be nice. Perhaps 
something like KUNIT_FAIL_TEST_ON_WARN / KUNIT_FAIL_ON_LOCKDEP or similar?

>   endif # KUNIT
> diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> index d84a879f0a789..7eea3af4c9671 100644
> --- a/lib/kunit/try-catch.c
> +++ b/lib/kunit/try-catch.c
> @@ -41,6 +41,11 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
>   	struct completion *task_done;
>   	int exit_code, time_remaining;
>   
> +	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> +	int debug_locks_snapshot = debug_locks;
> +	int tainted_warn_snapshot = test_taint(TAINT_WARN);
> +	#endif

Nit: Let's keep the preprocessor #ifdef/#endif lines un-indented here.

> +
>   	try_catch->context = context;
>   	try_catch->try_result = 0;
>   	task_struct = kthread_create(kunit_generic_run_threadfn_adapter,
> @@ -70,7 +75,23 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
>   	put_task_struct(task_struct);
>   	exit_code = try_catch->try_result;
>   
> -	if (!exit_code)
> +	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> +	bool extra_assert = false;

Please define all variables at the top of the function / scope.

That being said, we don't need this extra_assert variable at all if you 
move the setting of try_result above moving it to exit_code above?

> +
> +	if (debug_locks_snapshot != debug_locks && !exit_code) {
> +		extra_assert = true;
> +		try_catch->try_result = -EDEADLK;

Why are we setting this, and then never handling it?

> +		kunit_err(test, "Test triggered lockdep\n");
> +	} else if (tainted_warn_snapshot != test_taint(TAINT_WARN) && !exit_code) {
> +		extra_assert = true;
> +		try_catch->try_result = -EDEADLK;

-EDEADLK made sense for the lockdep implementation, but makes less sense 
for WARN(). If you really want to keep it, please document it.

That being said, it should be possible to do this outside of the 
try/catch scope, as both lockdep and taints are global. And if you fail 
the test using the hook mechanism (like the warning suppression does), 
you won't need a separate check afterwards.

> +		kunit_err(test, "Test tainted kernel with TAINT_WARN\n");
> +	}
> +	#else
> +	bool extra_assert = false;

If we declare this unconditionally at the top of the function, there's 
no need to have it in an #ifdef.

> +	#endif
> +
> +	if (!exit_code && !extra_assert)
>   		return;
>   
>   	if (exit_code == -EFAULT)
> 

