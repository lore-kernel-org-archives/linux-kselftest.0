From: frowand.list@gmail.com (Frank Rowand)
Date: Wed, 7 Nov 2018 09:46:41 -0800
Subject: [RFC v2 00/14] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <CAFd5g45Tgcx4RisrCF8QHneR7ELezPfpEPKh_mH8KEUi3skE7g@mail.gmail.com>
References: <20181023235750.103146-1-brendanhiggins@google.com>
 <f3682d48-6f27-5eef-8274-02f90dd65188@kernel.org>
 <CAFd5g45Tgcx4RisrCF8QHneR7ELezPfpEPKh_mH8KEUi3skE7g@mail.gmail.com>
Message-ID: <04f677b1-bc44-f004-cf2a-51b47baf0965@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107174641.opdLjSwPSPm_P2nq_9BpPMWHk57SGMRgCQWBDGS6DMY@z>

On 11/6/18 5:17 PM, Brendan Higgins wrote:
> On Fri, Nov 2, 2018@11:23 AM Shuah Khan <shuah@kernel.org> wrote:
>>
>> Hi Brendan,
> <snip>
>> Framework looks good. I think it would be helpful to include a real test
> 
> Great to hear!
> 
>> in the patch series to get a feel for how effective it is.
> 
> Alright, will do. Rob suggested converting
> https://elixir.bootlin.com/linux/v4.19/source/drivers/of/unittest.c to
> KUnit, so that might offer a good comparison.

drivers/of/unittest.c might be a bit bigger and more complex test than
you want to start with.

-Frank

< snip >
