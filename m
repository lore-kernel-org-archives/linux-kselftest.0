From: arnd at arndb.de (Arnd Bergmann)
Date: Tue, 28 Nov 2017 15:22:16 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] [RFC] packet: experimental
	support for 64-bit timestamps
In-Reply-To: <CAF=yD-+UZuM5uVzb2LAAfEtZ5Nn1zqpzXxRJNEL+vXAv1U4Whg@mail.gmail.com>
References: <20171127162001.4055813-1-arnd@arndb.de>
 <20171127162001.4055813-2-arnd@arndb.de>
 <20171127165945.GC1971@nanopsycho.orion>
 <CAF=yD-LOfbHOhcOaKO8Ek1Ec+7+eKz12y9e98zLXx-xOD7_VVA@mail.gmail.com>
 <CAK8P3a0xjDiA346keUEdsXQ4m2U+cpzzjUjoGyf+2W+mPqEwsA@mail.gmail.com>
 <CAJ+HfNj-2HDuW53sUjgfV4iPnVnMKquV7pgu_zggbRuWf6R3=w@mail.gmail.com>
 <CAK8P3a3y0RkKgvpP4VMgewyLfSw03493L7x75MBwSR9yctvebg@mail.gmail.com>
 <CAF=yD-+UZuM5uVzb2LAAfEtZ5Nn1zqpzXxRJNEL+vXAv1U4Whg@mail.gmail.com>
Message-ID: <CAK8P3a0GLC7gatA5RgWomwq5i2dqd_bcVJqWaYUNZz=mgWWbbQ@mail.gmail.com>

On Tue, Nov 28, 2017 at 3:08 PM, Willem de Bruijn
<willemdebruijn.kernel at gmail.com> wrote:
> On Tue, Nov 28, 2017 at 3:46 AM, Arnd Bergmann <arnd at arndb.de> wrote:
>> On Tue, Nov 28, 2017 at 8:04 AM, Björn Töpel <bjorn.topel at gmail.com> wrote:
>>> 2017-11-27 21:51 GMT+01:00 Arnd Bergmann <arnd at arndb.de>:
>>> [...]
>>>>> There already is an effort to come up with a new AF_PACKET V4 [1].
>>>>> We should make sure that any new interface does not have the
>>>>> Y2038/Y2106 issue. But, if a new version is being developed and
>>>>> that subsumes all existing use cases, then there probably is no need
>>>>> for another version that is a very small diff to V3.
>>>>
>>>> Ah, perfect, that's good timing. Adding Björn to Cc here.
>>>>
>>>
>>> Unfortunately, for the Y2038/Y2106 cases, we'll be (as a result of
>>> netdevconf discussions) moving the AF_PACKET V4 implementation to a
>>> separate, new, address/packet family.
>>
>> Ok, I see.
>
> Does it matter whether the replacement is a new version or a
> new packet family?

It depends on whether the new packet family provides a superset of
the AF_PACKET features or not. If we can expect that all users of
AF_PACKET can migrate to the replacement over time, then doing
it there is sufficient, otherwise adding 64-bit timestamps into AF_PACKET
may be a better way to upgrade existing users.

>>>>> If adding support for existing applications is useful, another approach
>>>>> would be to add a new socket option that changes the semantics for
>>>>> the two u32 fields in each of V1, V2 and V3 to hold nsec. Add a single
>>>>> check after filling in those structs whether the option is set and, if so,
>>>>> overwrite the two fields.
>>>>>
>>>>> [1] https://lwn.net/Articles/737947/
>>>>
>>>> I don't think that's necessary. As long as the V4 capabilities are a
>>>> superset of V1-V3, we should be able to just require all users to
>>>> move to V4 (or later) in the next 89 years, and make sure that they
>>>> use unsigned seconds if they care about 2038.
>>>>
>>>
>>> Given that V4 wont be around for AF_PACKET -- at least not in the
>>> shape of our patches -- Willem's suggestion is probably a good way
>>> forward.
>>
>> That leaves one question: should we do that now, or wait until some
>> other reason for a V4 comes up? I don't mind creating another
>> patch for this, just want to get a feeling of whether the API clutter
>> is worth it when we have a way out that works until y2106 (at
>> which point we run into other problems as well).
>
> I don't expect that we'll have another packet version independent
> from the work that Björn is doing. The choice to implement using
> a new packet family is given by the complexity of the existing code,
> especially the various locking mechanisms.

Ok.

> From that point of view, and if we want to offer a Y2106 proof
> AF_PACKET independent from the above, no reason to wait.

Agreed.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
