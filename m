From: sergey.senozhatsky.work@gmail.com (Sergey Senozhatsky)
Date: Wed, 20 Mar 2019 10:51:24 +0900
Subject: [PATCH] bpf, tests: tweak endianness selection
In-Reply-To: <20190319160115.GD7431@mini-arch.hsd1.ca.comcast.net>
References: <20190319023331.23207-1-sergey.senozhatsky@gmail.com>
 <20190319160115.GD7431@mini-arch.hsd1.ca.comcast.net>
Message-ID: <20190320015124.GB4718@jagdpanzerIV>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320015124.0-hXJXr7GhQQX8UPSdKA1GRwjqJs5mwbCuJBR6FzOzo@z>

On (03/19/19 09:01), Stanislav Fomichev wrote:
> > diff --git a/tools/testing/selftests/bpf/bpf_endian.h b/tools/testing/selftests/bpf/bpf_endian.h
> > index b25595ea4a78..ba06222963d5 100644
> > --- a/tools/testing/selftests/bpf/bpf_endian.h
> > +++ b/tools/testing/selftests/bpf/bpf_endian.h
> > @@ -20,38 +20,17 @@
> >   * use different targets.
> >   */
> >  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> > -# define __bpf_ntohs(x)			__builtin_bswap16(x)
> > -# define __bpf_htons(x)			__builtin_bswap16(x)
> > -# define __bpf_constant_ntohs(x)	___constant_swab16(x)
> > -# define __bpf_constant_htons(x)	___constant_swab16(x)
> This breaks the build until your next patch is applied (in other
> words, breaks bisection). Can we do it in three steps?

Bummer!
I thought about applying the second patch (flow_dissector.c) first
and then the first one (bpf/bpf_endian.h).

> Convert to swab (without breaking existing tests), convert the tests,
> remove unused __bpf_xyz defines?

OK.

> Could you also send it as a series (git format-patch --thread)? Those
> patches depend on each other. And pls use [PATCH bpf-next] ... subj.

Right. I figured out that I also need to patch flow_dissector.c after
I sent out bpf/bpf_endian.h patch.

Sorry about that, will fix.

	-ss
