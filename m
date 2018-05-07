From: shuah at kernel.org (Shuah Khan)
Date: Mon, 7 May 2018 13:41:32 -0600
Subject: [PATCH 14/24] selftests: kvm: return Kselftest Skip code for
 skipped tests
In-Reply-To: <08ca6038-00a0-1526-493a-36e6732b5934@redhat.com>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-14-shuah@kernel.org>
 <08ca6038-00a0-1526-493a-36e6732b5934@redhat.com>
Message-ID: <004c6cf7-a79d-ab00-ee68-f8c5bc7f5988@kernel.org>

On 05/07/2018 05:46 AM, Paolo Bonzini wrote:
> On 05/05/2018 03:13, Shuah Khan (Samsung OSG) wrote:
>> When kvm test is skipped because of unmet dependencies and/or unsupported
>> configuration, it exits with error which is treated as a fail by the
>> Kselftest framework. This leads to false negative result even when the test
>> could not be run.
>>
>> Change it to return kselftest skip code when a test gets skipped to clearly
>> report that the test could not be run.
>>
>> Change it to use ksft_exit_skip() when the test is skipped. In addition,
>> refine test_assert() message to include strerror() string and add explicit
>> check for root user to clearly identofy non-root user skip case.
> 
> Root should not be needed.

Will remove the root check and send v2.

> 
> Otherwise
> 
> Acked-by: Paolo Bonzini <pbonzini at redhat.com>
> 

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
