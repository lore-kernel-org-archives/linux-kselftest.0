Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23037757C;
	Tue,  6 Oct 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269279; cv=none; b=kHyEib3GMXgOloYIjXX8mz7yPSYpx7niXqnbyR4k3vYGo2DmBgNgFO1tGjq9jy9n5qhXIfQsYoWwgNGkeaTwGl+BtXXYxIvD5CKvUB9ggta9e0hS9GulHtkOS+MUH4RY+fLZNGIk6XQnqe8pHCO9WMdqdmxVPDb1gZmTQ8/DgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269279; c=relaxed/simple;
	bh=8wKPfrIzI6GQxDMp2iaUjY0OL7Vf5zwGRNY9dkqBbdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjZQGmWU9N8BhEf9HMgwZ/qiPxLShgsUZRD5uINcWU1s9a2jlTBElGe7RSKSw6lDTyJIB31GzqANcfJfEqOfZCjbrdHamjWOMnBeGMbHDjVOpsbe5D4zgWASqHTkyEKwpqjcKKHQJX7tYZnefVRt4l/rb5530S4T5nZSnu7IFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 36F56200454; Tue,  6 Oct 2026 14:47:49 +0800 (AWST)
X-Spam-Level: 
Received: from [172.20.4.20] (unknown [193.85.242.110])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7571020043B;
	Tue,  6 Oct 2026 14:47:36 +0800 (AWST)
Message-ID: <f6cf93a1-8fce-4d7e-8f77-fd106a05647a@davidgow.net>
Date: Tue, 6 Oct 2026 14:47:29 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kunit: add KUnit test to assert kernel state
 before KUnit suites are run
To: Malte Wechter <maltewechter@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com>
 <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
 <CAPB1BzeDC=V+jKZgX-2gucSZs8vOmZBvUgZLS8kTLvWa0x5S-Q@mail.gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <CAPB1BzeDC=V+jKZgX-2gucSZs8vOmZBvUgZLS8kTLvWa0x5S-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/09/2026 à 19:02, Malte Wechter a écrit :
> Den tirs. 25. aug. 2026 kl. 13.00 skrev David Gow <david@davidgow.net>:
>>
>> Le 24/08/2026 à 21:32, Malte Wechter a écrit :
>>> add pre-defined KUnit test suite and test case that asserts both
>>> `debug_locks` and `TAINT_WARN` prior to running any (user) KUnit tests.
>>> This asserts integrity before tests are run.
>>>
>>> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
>>> ---
>>
>> I'm not quite as convinced by this as I am by the first patch. While
>> ensuring the state of the system is good before tests are run is useful,
>> this does seem a bit heavy-handed in some respects.
>>
>> This could probably use a more detailed description, particularly
>> describing why such a test is useful, and why it would need to be
>> implemented in a special way.
>>
>> And I do think the implementation here is a bit _too_ special-cased. One
>> other possibility would be to prepend this suite using
>> kunit_merge_suite_sets(), so we don't need to have any special handling
>> of (e.g.) the test count. This could also allow this special suite to be
>> filtered out (which has both advantages and disadvantages).
>>
>> It might also be nice to have this configurable independently from the
>> other checks, and maybe at runtime (via a KUnit module / command-line
>> parameter), particularly if this can't be filtered on. And, as before,
>> this definitely needs to be documented. People need to know how to
>> enable it, and where all of these extra results from tests they didn't
>> enable came from.
>>
>> Thoughts?
> I get your point, the purpose of this special test suite is to assert
> that the kernel is in a "fine" state before any unit tests are run. If
> this
> check is left out the false positives could occur if the system is in
> a bad state before the tests are run.
> The reason that the case was handled differently compared to other was
> because this assertion _must_ be run before any other tests,
> and when kunit_merge_suite_sets() is called from kunit_run_all_tests()
> it also filters the test suites, which would not give any guarentee
> that this
> special suite gets run first.
> 
> I do agree that this initial way is maybe a bit coarse, and i will see
> if i can find a better fit for this assertion. But i dont want to
> leave it out.

Had a chat with Andreas about this yesterday, and we think we've come up 
with another possible option here: instead of doing one check to verify 
the state before any KUnit tests are run, have an option to check the 
taint before _every_ test, and to skip it if the kernel isn't clean.

There are a few consequences of this:
- You'd need to be able to mask out taints you don't care about, 
especially TAINT_TEST (as without it all tests but the first would 
fail). Of course, that might still be useful if you really want to 
ensure isolation between tests (e.g. --run_isolated)
- If the kernel is already tainted, and so all tests are skipped, 
kunit.py should report 'no tests run' as an error. I think this actually 
only reports an error if no tests are executed at the moment, so this 
may need looking at.
- This will trigger if the kernel is tainted by some other part of the 
kernel either between KUnit tests, or in another kthread. However, in 
this case, the results will look like a series of successful tests, 
followed by skipped ones, with no failed tests. (And hence won't trigger 
a failure exit code from kunit.py). This is likely to be incredibly 
rare, but we could add a fail-on-skip option or similar if needed.

Thoughts?

Cheers,
-- David

>>
>> Cheers,
>> -- David
>>
>>>    lib/kunit/executor.c |  8 +++++++-
>>>    lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
>>>    2 files changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
>>> index b0f8a41d61d36..0db67fe7f09f9 100644
>>> --- a/lib/kunit/executor.c
>>> +++ b/lib/kunit/executor.c
>>> @@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
>>>        size_t num_suites = suite_set->end - suite_set->start;
>>>        bool autorun = kunit_autorun();
>>>
>>> +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
>>
>> Nit: Let's not indent the #ifdefs.
>>
>>> +     size_t num_suites_plus_extra = num_suites+1;
>>> +     #else
>>> +     size_t num_suites_plus_extra = num_suites;
>>> +     #endif
>>> +
>>
>> I'm not particularly happy with this way of adding an extra suite.
>>
>>>        if (autorun && (builtin || num_suites)) {
>>>                pr_info("KTAP version 1\n");
>>> -             pr_info("1..%zu\n", num_suites);
>>> +             pr_info("1..%zu\n", num_suites_plus_extra);
>>>        }
>>>
>>>        __kunit_test_suites_init(suite_set->start, num_suites, autorun);
>>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
>>> index 99773e000e1b7..e64c6d1575280 100644
>>> --- a/lib/kunit/test.c
>>> +++ b/lib/kunit/test.c
>>> @@ -835,6 +835,30 @@ bool kunit_enabled(void)
>>>        return enable_param;
>>>    }
>>>
>>> +#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
>>> +#define DEBUG_LOCKS_OK 1
>>> +#define TAINT_WARN_OK 0
>>
>> Not totally sold on these #defines: I think I'd prefer to just have the
>> literal 1/0.
>>
>>> +
>>> +static void pre_kunit_assert(struct kunit *test)
>>> +{
>>> +     KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
>>> +             "debug_locks are off before any test ran");
>>> +     KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK,
>>> +             "kernel already TAINT_WARN tainted before any test ran");
>>> +}
>>
>> If we are going to generate a special suite, let's have the taint and
>> lockdep checks as separate tests.
>>
>> This would also make it easier to have them be configurable separately.
>>
>>> +
>>> +static struct kunit_case pre_kunit_assert_cases[] = {
>>> +     KUNIT_CASE(pre_kunit_assert),
>>> +     {}
>>> +};
>>> +
>>> +static struct kunit_suite pre_kunit_assert_clean_state_suite = {
>>> +     .name = "pre_kunit_extra_asserts",
>>
>> I think we could probably find a better name for this.
>> "initial_system_state" or similar might be better?
>>
>>> +     .test_cases = pre_kunit_assert_cases,
>>> +};
>>> +
>>> +#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
>>> +
>>>    int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_suites,
>>>                             bool run_tests)
>>>    {
>>> @@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
>>>        }
>>>        static_branch_inc(&kunit_running);
>>>
>>> +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
>>> +     kunit_init_suite(&pre_kunit_assert_clean_state_suite);
>>> +     if (run_tests)
>>> +             kunit_run_tests(&pre_kunit_assert_clean_state_suite);
>>> +     #endif
>>> +
>>>        for (i = 0; i < num_suites; i++) {
>>>                kunit_init_suite(suites[i]);
>>>                if (run_tests)
>>>
>>
> Best regards,
> Malte :)

