From: kieran.bingham at ideasonboard.com (Kieran Bingham)
Date: Wed, 13 Feb 2019 21:55:39 +0000
Subject: [RFC v3 14/19] Documentation: kunit: add documentation for KUnit
In-Reply-To: <CAFd5g46AEquMKzfrjLDVi+PP5-7aGs6C6pCunGAXDn3VRkJP+g@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-15-brendanhiggins@google.com>
 <b4c72234-8c56-6efa-8003-f89d99a9779e@ideasonboard.com>
 <20181130034525.GP18410@garbanzo.do-not-panic.com>
 <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>
 <0927c42a-8e65-f410-e6ed-27576572577f@ideasonboard.com>
 <CAFd5g44fKzriEs_pGyANxe7GuC9Ji2SD7EEz76__h8q9jjg8yA@mail.gmail.com>
 <57c3dc86-236f-e981-249a-8bbfe5c19f0e@ideasonboard.com>
 <CAFd5g46AEquMKzfrjLDVi+PP5-7aGs6C6pCunGAXDn3VRkJP+g@mail.gmail.com>
Message-ID: <eade3052-0aa4-90b4-d55b-8c44556f98bc@ideasonboard.com>

Hi Brendan,

On 12/02/2019 22:10, Brendan Higgins wrote:
> On Mon, Feb 11, 2019 at 4:16 AM Kieran Bingham
> <kieran.bingham at ideasonboard.com> wrote:
>>
>> Hi Brendan,
>>
>> On 09/02/2019 00:56, Brendan Higgins wrote:
>>> On Thu, Dec 6, 2018 at 4:16 AM Kieran Bingham
>>> <kieran.bingham at ideasonboard.com> wrote:
>>>>
>>>> Hi Brendan,
>>>>
>>>> On 03/12/2018 23:53, Brendan Higgins wrote:
>>>>> On Thu, Nov 29, 2018 at 7:45 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
>>>>>>
>>>>>> On Thu, Nov 29, 2018 at 01:56:37PM +0000, Kieran Bingham wrote:
>>>>>>> Hi Brendan,
>>>>>>>
>>>>>>> Please excuse the top posting, but I'm replying here as I'm following
>>>>>>> the section "Creating a kunitconfig" in Documentation/kunit/start.rst.
>>>>>>>
>>>>>>> Could the three line kunitconfig file live under say
>>>>>>>        arch/um/configs/kunit_defconfig?
>>>>
>>>>
>>>> Further consideration to this topic - I mentioned putting it in
>>>>   arch/um/configs
>>>>
>>>> - but I think this is wrong.
>>>>
>>>> We now have a location for config-fragments, which is essentially what
>>>> this is, under kernel/configs
>>>>
>>>> So perhaps an addition as :
>>>>
>>>>  kernel/configs/kunit.config
>>>>
>>>> Would be more appropriate - and less (UM) architecture specific.
>>>
>>> Sorry for the long radio silence.
>>>
>>> I just got around to doing this and I found that there are some
>>> configs that are desirable to have when running KUnit under x86 in a
>>> VM, but not UML.
>>
>> Should this behaviour you mention be handled by the KCONFIG depends flags?
>>
>> depends on (KUMIT & UML)
>> or
>> depends on (KUNIT & !UML)
>>
>> or such?
> 
> Not really. Anything that is strictly necessary to run KUnit on an
> architectures should of course be turned on as a dependency like you
> suggest, but I am talking about stuff that you would probably want to
> get yourself going, but is by no means necessary.
> 
>>
>> An example of which configs you are referring to would help to
>> understand the issue perhaps.
>>
> 
> For example, you might want to enable a serial console that is known
> to work with a fairly generic qemu setup when building for x86:
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_CONSOLE=y
> 
> Obviously not a dependency, and not even particularly useful to people
> who know what they are doing, but to someone who is new or just wants
> something to work out of the box would probably want that.

It sounds like that would be a config fragment for qemu ?

Although - perhaps this is already covered by the following fragment:
   kernel/configs/kvm_guest.config


>>> So should we have one that goes in with
>>> config-fragments and others that go into architectures? Another idea,
>>> it would be nice to have a KUnit config that runs all known tests
>>
>> This might also be a config option added to the tests directly like
>> COMPILE_TEST perhaps?
> 
> That just allows a bunch of drivers to be compiled, it does not
> actually go through and turn the configs on, right? I mean, there is
> no a priori way to know that there is a configuration which spans all
> possible options available under COMPILE_TEST, right? Maybe I
> misunderstand what you are suggesting...

Bah - you're right of course. I was mis-remembering the functionality of
COMPILE_TEST as if it were some sort of 'select' but it's just an enable..

Sorry for the confusion.



>> (Not sure what that would be called though ... KUNIT_RUNTIME_TEST?)
>>
>> I think that might be more maintainable as otherwise each new test would
>> have to modify the {min,def}{config,fragment} ...
>>
> 
> Looking at kselftest-merge, they just start out with a set of
> fragments in which the union should contain all tests and then merge
> it with a base .config (probably intended to be $(ARCH)_defconfig).
> However, I don't know if that is the state of the art.
> 
>>
>>> (this probably won't work in practice once we start testing mutually
>>> exclusive things or things with lots of ifdeffery, but it probably
>>> something we should try to maintain as best as we can?); this probably
>>> shouldn't go in with the fragments, right?
>>
>> Sounds like we agree there :)
> 
> Totally. Long term we will need something a lot more sophisticated
> than anything under discussion here. I was talking about this with
> Luis on another thread:
> https://groups.google.com/forum/#!topic/kunit-dev/EQ1x0SzrUus (feel
> free to chime in!). Nevertheless, that's a really hard problem and I
> figure some variant of defconfigs and config fragments will work well
> enough until we reach that point.
> 
>>
>>>
>>> I will be sending another revision out soon, but I figured I might be
>>> able to catch you before I did so.
>>
>> Thanks for thinking of me.
> 
> How can I forget? You have been super helpful!
> 
>> I hope I managed to reply in time to help and not hinder your progress.
> 
> Yep, no trouble at all. You are the one helping me :-)
> 
> Thanks!
> 

-- 
Regards
--
Kieran
