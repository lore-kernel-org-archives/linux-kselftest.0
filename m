From: shuah@kernel.org (Shuah Khan)
Date: Thu, 23 Aug 2018 11:09:26 -0600
Subject: [PATCH] selftests: net: move fragment forwarding/config up a level
In-Reply-To: <20180822064546.GA32527@splinter.mtl.com>
References: <20180821161212.5750-1-anders.roxell@linaro.org>
 <20180821185625.GB27078@splinter>
 <fa188bdd-2f4c-66fc-a803-5d53425c3daf@kernel.org>
 <20180822064546.GA32527@splinter.mtl.com>
Message-ID: <b8d7aba5-5166-bf6d-0d88-8bfbf380bf28@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180823170926.-YYUbycjnwSneWwV24wU44HjT7J1P695c2j6UpYYhfM@z>

On 08/22/2018 12:45 AM, Ido Schimmel wrote:
> On Tue, Aug 21, 2018@01:41:54PM -0600, Shuah Khan wrote:
>> On 08/21/2018 12:56 PM, Ido Schimmel wrote:
>>> On Tue, Aug 21, 2018@06:12:12PM +0200, Anders Roxell wrote:
>>>> 'make kselftest-merge' assumes that the config files for the tests are
>>>> located under the 'main' tet dir, like tools/testing/selftests/net/ and
>>>> not in a subdir to net.
>>>
>>> The tests under tools/testing/selftests/net/forwarding/ aren't executed
>>> as part of the Makefile. The config file is there mainly so that people
>>> will know which config options they need in order to run the tests.
>>>
>>> The tests can be added to the Makefile, but some of them take a few
>>> minutes to complete which is probably against "Don't take too long;"
>>> mentioned in Documentation/dev-tools/kselftest.rst.
>>>
>>
>> I don't see any reason why these shouldn't be added. With the number of
>> tests that get run by default, time has gone up. The goal is to run more
>> tests not less. There are some stress/destructive tests that continue to
>> be left out of the Makefile.
> 
> Thanks for clarifying. I'll add the tests.
> 

Great. This change to move config up one level looks good to me. Dave takes net
selftest patches through net tree usually. So I will leave this up to take it
through his process.

Acked-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

thanks,
-- Shuah
