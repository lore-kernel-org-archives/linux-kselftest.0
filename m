From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 6 Mar 2018 19:37:59 -0700
Subject: [PATCH v2] selftests: futex Makefile add top level TAP header
 echo to RUN_TESTS
In-Reply-To: <20180306001820.GF25693@fury>
References: <20180301201907.17573-1-shuahkh@osg.samsung.com>
 <20180306001820.GF25693@fury>
Message-ID: <dc8c5139-08fc-3a84-d4e2-627a83b41131@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180307023759.Qy17FPkUTfOQRBI89_38Qx9N1OoUlOB2KFIJ8sHKE6E@z>

On 03/05/2018 05:18 PM, Darren Hart wrote:
> On Thu, Mar 01, 2018@01:19:07PM -0700, Shuah Khan wrote:
>> Add top level TAP header echo, testname and separator line to make
>> the output consistent with the common run_tests target.
>>
>> This change prevents nested TAP13 headers output from individual tests.
>> Nested TAP13 headers could cause problems for some parsers.
>>
>> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
> 
> 
> Reviewed-by: Darren Hart (VMware) <dvhart at infradead.org>
> 
> 

Thanks. Queued this up with the rest for 4.17-rc1

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
