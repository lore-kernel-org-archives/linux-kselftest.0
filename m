From: mark.rutland@arm.com (Mark Rutland)
Date: Wed, 24 Apr 2019 17:51:50 +0100
Subject: [RFC PATCH for 5.2 08/10] rseq/selftests: aarch64 code
 signature: handle big-endian environment
In-Reply-To: <20190424164538.GC18611@fuggles.cambridge.arm.com>
References: <20190424152502.14246-1-mathieu.desnoyers@efficios.com>
 <20190424152502.14246-9-mathieu.desnoyers@efficios.com>
 <20190424164538.GC18611@fuggles.cambridge.arm.com>
Message-ID: <20190424165150.GF21101@lakrids.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424165150.bdEW_-9IF2ZXt8ctvyNOktl2VGCRO5NucAp6N8--Ebo@z>

On Wed, Apr 24, 2019@05:45:38PM +0100, Will Deacon wrote:
> On Wed, Apr 24, 2019@11:25:00AM -0400, Mathieu Desnoyers wrote:
> > +/*
> > + * aarch64 -mbig-endian generates mixed endianness code vs data:
> > + * little-endian code and big-endian data. Ensure the RSEQ_SIG signature
> > + * matches code endianness.
> > + */
> > +#define RSEQ_SIG_CODE	0xd428bc00	/* BRK #0x45E0.  */
> > +
> > +#ifdef __AARCH64EB__
> > +#define RSEQ_SIG_DATA	0x00bc28d4	/* BRK #0x45E0.  */
> 
> It would be neater to implement swab32 and use that with RSEQ_SIG_CODE,

If possible, marginally neater than that would be using
le32_to_cpu(RSEQ_SIG_CODE), without any ifdeffery necessary.

It looks like that's defined in tools/include/linux/kernel.h, but I'm
not sure if that gets pulled into your include path.

Thanks,
Mark.
