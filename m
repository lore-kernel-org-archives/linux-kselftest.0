From: rafael.tinoco@linaro.org (Rafael David Tinoco)
Date: Thu, 8 Nov 2018 08:41:46 -0200
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
In-Reply-To: <20181015172140.GJ2401@uranus.lan>
References: <20181011184359.15627-1-rafael.tinoco@linaro.org>
 <20181011205601.GA32757@avx2> <20181011210256.GE2401@uranus.lan>
 <20181011213006.GA13485@avx2> <20181011220009.GF2401@uranus.lan>
 <52504bd5-b4ed-518b-f748-c634172c6c68@linaro.org>
 <20181015172140.GJ2401@uranus.lan>
Message-ID:
 <CABdQkv_vWNbMgvR+1q9gNGHUjvvR5Pb3Z9t3YKhahp4h4P5isQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108104146.iXytsMXYhfMOv6yfn9tGs2AZ837Pv5P0Cqns7KUbEGw@z>

On Mon, Oct 15, 2018@2:21 PM, Cyrill Gorcunov <gorcunov@gmail.com> wrote:
> On Mon, Oct 15, 2018@01:55:14PM -0300, Rafael David Tinoco wrote:
>> That is what I also had in mind, thus the patch. I just realized we had
>> another issue on LKFT (our functional tests tool) for
>> proc-self-map-files-001.c. Test 001 does pretty much the same as 002, but
>> without the MAP_FIXED mmap flag.
>>
>> Is it okay to consolidate both tests into just 1, and focus in checking
>> procfs numbers conversion only, rather than if mapping 0 is allowed or not ?
>> Can I send a v2 with that in mind ?
>
> As to me -- yes, I would move zero page testing to a separate memory testcase.
> But since Alexey is the former author of the tests better wait for his opinion.

Alexey,

would you care if we turn those 2 tests into 1, taking care of the
zero page testing elsewhere ? Would you mind if I send out a patch for
that ?
