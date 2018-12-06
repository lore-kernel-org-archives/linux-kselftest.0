From: kieran.bingham at ideasonboard.com (Kieran Bingham)
Date: Thu, 6 Dec 2018 12:16:33 +0000
Subject: [RFC v3 14/19] Documentation: kunit: add documentation for KUnit
In-Reply-To: <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-15-brendanhiggins@google.com>
 <b4c72234-8c56-6efa-8003-f89d99a9779e@ideasonboard.com>
 <20181130034525.GP18410@garbanzo.do-not-panic.com>
 <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>
Message-ID: <0927c42a-8e65-f410-e6ed-27576572577f@ideasonboard.com>

Hi Brendan,

On 03/12/2018 23:53, Brendan Higgins wrote:
> On Thu, Nov 29, 2018 at 7:45 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
>>
>> On Thu, Nov 29, 2018 at 01:56:37PM +0000, Kieran Bingham wrote:
>>> Hi Brendan,
>>>
>>> Please excuse the top posting, but I'm replying here as I'm following
>>> the section "Creating a kunitconfig" in Documentation/kunit/start.rst.
>>>
>>> Could the three line kunitconfig file live under say
>>>        arch/um/configs/kunit_defconfig?


Further consideration to this topic - I mentioned putting it in
  arch/um/configs

- but I think this is wrong.

We now have a location for config-fragments, which is essentially what
this is, under kernel/configs

So perhaps an addition as :

 kernel/configs/kunit.config

Would be more appropriate - and less (UM) architecture specific.



>>>
>>> So that it's always provided? And could even be extended with tests
>>> which people would expect to be run by default? (say in distributions)
>>
>> Indeed, and then a top level 'make kunitconfig' could use it as well.
> 
> Yep, I totally agree.
> 

-- 
Regards
--
Kieran
