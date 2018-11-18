From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Sun, 18 Nov 2018 18:44:50 -0200
Subject: [PATCH v5] selftests: membarrier: re-organize test
In-Reply-To: <20181109154911.24464-1-rafael.tinoco@linaro.org>
References: <dcc20b51-3069-6854-3190-b8958e2f9b96@kernel.org>
 <20181109154911.24464-1-rafael.tinoco@linaro.org>
Message-ID: <4b31ee44-6463-6f6b-ca43-f03af8b06e35@linaro.org>

>> Why do we need to add new routines for these conditions. Why can't handle these strings in array. For example you can define an array of strings for passed unexpectedly etc. and the pass the string to appropriate ksft_* interface instead of adding of these routines. Also it is hard to review the code this way.

I was able to fit all the logic in the 80 char limit and, still, give a 
notion what was being called on each condition (instead of using an 
array number or equivalent). Considering this is not the core code, and 
the this has been already accepted and reviewed in LTP project, would 
you mind accepting it so both can be maintained together ? It is much 
better than the existing one, anyway...

Note: I have removed the part where we test for older return codes, 
since kselftest is not focusing in those (but LTP does).

>> I do like the direction though. Also please run get_maintainer.pl and cc everybody it suggests.

Done in v5.

Thanks a lot.

>> 
>> thanks,
>> -- Shuah


> This commit re-organizes membarrier test, solving issues when testing
> LTS kernels. Now, the code:
> 
>   - always run the same amount of tests (even on older kernels).
>   - allows each test to succeed, fail or be skipped independently.
>   - allows testing features even when explicitly unsupported (force=1).
>   - checks false positive/negative by checking ret code and errno.
>   - can be extended easily: to expand an array with commands.
> 
> Note: like this, the test is pretty close to the LTP membarrier basic
> tests, and both can be maintained together.
> 
> Link: https://bugs.linaro.org/show_bug.cgi?id=3771
> Link: http://lists.linux.it/pipermail/ltp/2018-October/009578.html
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> ---
-- 
Rafael D. Tinoco
Linaro Kernel Validation
