From: shuah@kernel.org (Shuah Khan)
Date: Mon, 7 May 2018 14:19:17 -0600
Subject: [PATCH 14/24] selftests: kvm: return Kselftest Skip code for
 skipped tests
In-Reply-To: <004c6cf7-a79d-ab00-ee68-f8c5bc7f5988@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-14-shuah@kernel.org>
 <08ca6038-00a0-1526-493a-36e6732b5934@redhat.com>
 <004c6cf7-a79d-ab00-ee68-f8c5bc7f5988@kernel.org>
Message-ID: <aad4ff59-a43f-7074-b5c6-e6ade55d887c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180507201917.LVdFRv_KcXX94sSXAx8m0vLey_V2GJIwe9aLTlmleNI@z>

On 05/07/2018 01:41 PM, Shuah Khan wrote:
> On 05/07/2018 05:46 AM, Paolo Bonzini wrote:
>> On 05/05/2018 03:13, Shuah Khan (Samsung OSG) wrote:
>>> When kvm test is skipped because of unmet dependencies and/or unsupported
>>> configuration, it exits with error which is treated as a fail by the
>>> Kselftest framework. This leads to false negative result even when the test
>>> could not be run.
>>>
>>> Change it to return kselftest skip code when a test gets skipped to clearly
>>> report that the test could not be run.
>>>
>>> Change it to use ksft_exit_skip() when the test is skipped. In addition,
>>> refine test_assert() message to include strerror() string and add explicit
>>> check for root user to clearly identofy non-root user skip case.
>>
>> Root should not be needed.
> 
> Will remove the root check and send v2.

Hmm. I am seeing 

selftests: kvm: sync_regs_test
========================================
==== Test Assertion Failure ====
  lib/kvm_util.c:54: kvm_fd >= 0
  pid=2840 tid=2840 - Permission denied
     1	0x0000564cd5206163: ?? ??:0
     2	0x0000564cd520531b: ?? ??:0
     3	0x00007f7ec018f1c0: ?? ??:0
     4	0x0000564cd52058f9: ?? ??:0
  open /dev/kvm failed, rc: -1 errno: 13

There are a couple of other tests that fail with EACCES
It would make sense report these tests as Skipped perhaps.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
