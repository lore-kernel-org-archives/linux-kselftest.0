From: bjorn.topel@gmail.com (=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=)
Date: Tue, 28 Nov 2017 08:04:41 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] [RFC] packet: experimental
	support for 64-bit timestamps
In-Reply-To: <CAK8P3a0xjDiA346keUEdsXQ4m2U+cpzzjUjoGyf+2W+mPqEwsA@mail.gmail.com>
References: <20171127162001.4055813-1-arnd@arndb.de>
 <20171127162001.4055813-2-arnd@arndb.de>
 <20171127165945.GC1971@nanopsycho.orion>
 <CAF=yD-LOfbHOhcOaKO8Ek1Ec+7+eKz12y9e98zLXx-xOD7_VVA@mail.gmail.com>
 <CAK8P3a0xjDiA346keUEdsXQ4m2U+cpzzjUjoGyf+2W+mPqEwsA@mail.gmail.com>
Message-ID:
 <CAJ+HfNj-2HDuW53sUjgfV4iPnVnMKquV7pgu_zggbRuWf6R3=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171128070441.e0j5DWiK858tGF4yqQNIuNmY7g39b4yh7SGPyhAyuG0@z>

2017-11-27 21:51 GMT+01:00 Arnd Bergmann <arnd at arndb.de>:
[...]
>> There already is an effort to come up with a new AF_PACKET V4 [1].
>> We should make sure that any new interface does not have the
>> Y2038/Y2106 issue. But, if a new version is being developed and
>> that subsumes all existing use cases, then there probably is no need
>> for another version that is a very small diff to V3.
>
> Ah, perfect, that's good timing. Adding Björn to Cc here.
>

Unfortunately, for the Y2038/Y2106 cases, we'll be (as a result of
netdevconf discussions) moving the AF_PACKET V4 implementation to a
separate, new, address/packet family.

>> If adding support for existing applications is useful, another approach
>> would be to add a new socket option that changes the semantics for
>> the two u32 fields in each of V1, V2 and V3 to hold nsec. Add a single
>> check after filling in those structs whether the option is set and, if so,
>> overwrite the two fields.
>>
>> [1] https://lwn.net/Articles/737947/
>
> I don't think that's necessary. As long as the V4 capabilities are a
> superset of V1-V3, we should be able to just require all users to
> move to V4 (or later) in the next 89 years, and make sure that they
> use unsigned seconds if they care about 2038.
>

Given that V4 wont be around for AF_PACKET -- at least not in the
shape of our patches -- Willem's suggestion is probably a good way
forward.

>       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
