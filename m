From: shuah at kernel.org (Shuah Khan)
Date: Mon, 20 Aug 2018 09:01:36 -0600
Subject: kselftest-merge misses config's to merge
In-Reply-To: <CADYN=9JsYs+ADo61D7Jpc-8kOebaN=9Cbxc_cVPBYhHLb4Veyw@mail.gmail.com>
References: <CADYN=9KTA0LeczLnY8kxyrCtm2umPX0ODsmVEhBbBTY4MfUP0A@mail.gmail.com>
 <CADYN=9JsYs+ADo61D7Jpc-8kOebaN=9Cbxc_cVPBYhHLb4Veyw@mail.gmail.com>
Message-ID: <f795f5c2-1fc2-b828-45c1-72340144a84c@kernel.org>

Hi Anders,

On 08/17/2018 11:15 AM, Anders Roxell wrote:
> On Fri, 10 Aug 2018 at 10:50, Anders Roxell <anders.roxell at linaro.org> wrote:
>>
>> Hi,
>>
>> I have a question about the config files in tools/testing/selftests/ .
>> The kselftest-merge target in the root Makefile assumes that the
>> config files are placed in
>> tools/testing/selftests/*/config and selftests/android/ion/config and
>> selftests/net/forwarding/config doesn't follow that. So either we move
>> those files up a level or do something like below in the top Makefile.

Let's move them up to where they need to be and document it as well.

Sorry for the late reply. I was out on vacation all of last week.

thanks,
-- Shuah
