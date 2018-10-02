From: mpe@ellerman.id.au (Michael Ellerman)
Date: Wed, 03 Oct 2018 00:12:51 +1000
Subject: [PATCH v6] selftests: add headers_install to lib.mk
In-Reply-To: <4473d2b6-a760-1a48-68e7-9f90023b57b5@kernel.org>
References: <20180809080402.24469-1-anders.roxell@linaro.org>
 <20180904104721.27535-1-anders.roxell@linaro.org>
 <87y3bmte9l.fsf@concordia.ellerman.id.au>
 <4473d2b6-a760-1a48-68e7-9f90023b57b5@kernel.org>
Message-ID: <8736tol9ng.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181002141251.Ex4ceelPfIvXKh27zJhzIPV-lYgBX8-Kk30vFHCXXpM@z>

Shuah Khan <shuah at kernel.org> writes:
> On 09/27/2018 10:52 PM, Michael Ellerman wrote:
>> [ + linuxppc-dev ]
>> 
>> Anders Roxell <anders.roxell at linaro.org> writes:
>>> If the kernel headers aren't installed we can't build all the tests.
>>> Add a new make target rule 'khdr' in the file lib.mk to generate the
>>> kernel headers and that gets include for every test-dir Makefile that
>>> includes lib.mk If the testdir in turn have its own sub-dirs the
>>> top_srcdir needs to be set to the linux-rootdir to be able to generate
>>> the kernel headers.
>>>
>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>> Reviewed-by: Fathi Boudra <fathi.boudra at linaro.org>
>>> ---
>>>
>>> I sent this (v5) a month ago and wondered if it got lost. Resending
>>> unchanged.
>>>
>>> Cheers,
>>> Anders
>>>
>>>  Makefile                                           | 14 +-------------
>>>  scripts/subarch.include                            | 13 +++++++++++++
>>>  tools/testing/selftests/android/Makefile           |  2 +-
>>>  tools/testing/selftests/android/ion/Makefile       |  2 ++
>>>  tools/testing/selftests/futex/functional/Makefile  |  1 +
>>>  tools/testing/selftests/gpio/Makefile              |  7 ++-----
>>>  tools/testing/selftests/kvm/Makefile               |  7 ++-----
>>>  tools/testing/selftests/lib.mk                     | 12 ++++++++++++
>>>  tools/testing/selftests/net/Makefile               |  1 +
>>>  .../selftests/networking/timestamping/Makefile     |  1 +
>>>  tools/testing/selftests/vm/Makefile                |  4 ----
>>>  11 files changed, 36 insertions(+), 28 deletions(-)
>>>  create mode 100644 scripts/subarch.include
>> 
>> This broke all the powerpc selftests :(
>
> Sorry for thr breakage.
>
>> Why did it go in at rc5?
>
> This patch has been in linux-next for a sometime before I decided to send this.
> My original intent was to send this for rc2, and my schedule was messed up with
> traveling. Since I didn't hear any issues from linux-next soaking, I made a call
> on sending this in for rc5.

OK. And I didn't notice the breakage in linux-next because _I_ was
travelling :)

> On second thought I should have waited until 4.20. Sorry about that.

Yeah that would have been better, no worries.

cheers
