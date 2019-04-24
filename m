From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Wed, 24 Apr 2019 13:02:59 -0400 (EDT)
Subject: [RFC PATCH for 5.2 08/10] rseq/selftests: aarch64 code
 signature: handle big-endian environment
In-Reply-To: <697611694.604.1556125254852.JavaMail.zimbra@efficios.com>
References: <20190424152502.14246-1-mathieu.desnoyers@efficios.com>
 <20190424152502.14246-9-mathieu.desnoyers@efficios.com>
 <20190424164538.GC18611@fuggles.cambridge.arm.com>
 <20190424165150.GF21101@lakrids.cambridge.arm.com>
 <697611694.604.1556125254852.JavaMail.zimbra@efficios.com>
Message-ID: <2087640779.608.1556125379269.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424170259.bhcnzteuMD-WyRI5uRx9AwNzpYoaUoLe257DT01TMfs@z>

----- On Apr 24, 2019,@1:00 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> ----- On Apr 24, 2019,@12:51 PM, Mark Rutland mark.rutland@arm.com wrote:
> 
>> On Wed, Apr 24, 2019@05:45:38PM +0100, Will Deacon wrote:
>>> On Wed, Apr 24, 2019@11:25:00AM -0400, Mathieu Desnoyers wrote:
>>> > +/*
>>> > + * aarch64 -mbig-endian generates mixed endianness code vs data:
>>> > + * little-endian code and big-endian data. Ensure the RSEQ_SIG signature
>>> > + * matches code endianness.
>>> > + */
>>> > +#define RSEQ_SIG_CODE	0xd428bc00	/* BRK #0x45E0.  */
>>> > +
>>> > +#ifdef __AARCH64EB__
>>> > +#define RSEQ_SIG_DATA	0x00bc28d4	/* BRK #0x45E0.  */
>>> 
>>> It would be neater to implement swab32 and use that with RSEQ_SIG_CODE,
>> 
>> If possible, marginally neater than that would be using
>> le32_to_cpu(RSEQ_SIG_CODE), without any ifdeffery necessary.
>> 
>> It looks like that's defined in tools/include/linux/kernel.h, but I'm
>> not sure if that gets pulled into your include path.
> 
> Considering that those RSEQ_SIG* define will end up in public bits/rseq.h
> headers within glibc, I'm tempted to keep the amount of dependencies on
> external headers to a minimum, if it's OK with you.

Also, I'm not sure the le32_to_cpu() approach would work in __ASSEMBLER__
builds.

Thanks,

Mathieu

> 
> Thanks,
> 
> Mathieu
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
