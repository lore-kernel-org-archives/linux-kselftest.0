From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 27 Nov 2017 21:51:48 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] [RFC] packet: experimental
	support for 64-bit timestamps
In-Reply-To: <CAF=yD-LOfbHOhcOaKO8Ek1Ec+7+eKz12y9e98zLXx-xOD7_VVA@mail.gmail.com>
References: <20171127162001.4055813-1-arnd@arndb.de>
 <20171127162001.4055813-2-arnd@arndb.de>
 <20171127165945.GC1971@nanopsycho.orion>
 <CAF=yD-LOfbHOhcOaKO8Ek1Ec+7+eKz12y9e98zLXx-xOD7_VVA@mail.gmail.com>
Message-ID:
 <CAK8P3a0xjDiA346keUEdsXQ4m2U+cpzzjUjoGyf+2W+mPqEwsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171127205148.D5U12sBQleuTaAC0gojo71-6jqkTRg0uexiAE451Dcc@z>

On Mon, Nov 27, 2017 at 9:35 PM, Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
> On Mon, Nov 27, 2017@11:59 AM, Jiri Pirko <jiri@resnulli.us> wrote:
>> Mon, Nov 27, 2017@05:19:25PM CET, arnd@arndb.de wrote:
>>>I tried to figure out what it would take to do a version 4 mmap packet
>>>socket interface to completely avoid the y2106 overflow problem. This is
>>>what I came up with, reusing most of the v3 code, except for the parts
>>>where we access the timestamps.
>>>
>>>For kselftest, I'm adding support for testing v4 in addition to v1-v3,
>>>but the test currently does not look at the timestamps, so it won't
>>>check that the timestamp format actually works as intended, only that
>>>I didn't break the parts that worked in the v3 selftest.
>>>
>>>Overall, this is more of a mess than I expected, so it's probably not
>>>worth doing a v4 format just for the timestamp, but the patch can serve
>>>as a reference for anyone that needs a new format for other reasons and
>>>fixes this along with the other changes.
>>>
>>>Signed-off-by: Arnd Bergmann <arnd at arndb.de>
>>>---
>>
>> [...]
>>
>>
>>>@@ -250,7 +269,8 @@ struct tpacket_block_desc {
>>> enum tpacket_versions {
>>>       TPACKET_V1,
>>>       TPACKET_V2,
>>>-      TPACKET_V3
>>>+      TPACKET_V3,
>>>+      TPACKET_V4,
>>
>> I wonder with how many versions are we going to eventually end up with :O
>
> There already is an effort to come up with a new AF_PACKET V4 [1].
> We should make sure that any new interface does not have the
> Y2038/Y2106 issue. But, if a new version is being developed and
> that subsumes all existing use cases, then there probably is no need
> for another version that is a very small diff to V3.

Ah, perfect, that's good timing. Adding Björn to Cc here.

> If adding support for existing applications is useful, another approach
> would be to add a new socket option that changes the semantics for
> the two u32 fields in each of V1, V2 and V3 to hold nsec. Add a single
> check after filling in those structs whether the option is set and, if so,
> overwrite the two fields.
>
> [1] https://lwn.net/Articles/737947/

I don't think that's necessary. As long as the V4 capabilities are a
superset of V1-V3, we should be able to just require all users to
move to V4 (or later) in the next 89 years, and make sure that they
use unsigned seconds if they care about 2038.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
