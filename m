Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1A598BF4
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068685; cv=pass; b=LOoUhGEH6VHMg9KyCwWBX36SzAiNWazsdMI7JFxLrv/h72ncGIuoL35oBNdj208Ohf8ahGPamOTYgSevZF1ctyJvk0fqTXeFGoFbEwl7cHHID2qniF8hzfbV5MhI/s5Z71Tq1a+rNoHxRPjRsSFT2rLWTUA/iufssEkr5fEhnY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068685; c=relaxed/simple;
	bh=KTq9X+5RKd6MevfODoxvkTeUdtyi6rv9KjZTSYh2TKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xz7yM/j6c0crCUJIVKwGa3Jy5E1DUATcM6K0lDoMRIbpGoohCkb765BMprs8bUMZRimjR2cUpvQlxnOkgPcTEvy/FBJkhrw2X6fuCzrsz0/feKRccEtrNyLUKK2nceLs/dexcusKvYNGbw2balKFaNItlu/vLXo1eD6J+NWjuKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTyEgftU; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTyEgftU"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466867cso135572e0c.2
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 12:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068677; cv=none;
        d=google.com; s=arc-20260327;
        b=XOd1KljLmEGzb45RIvXxGWeiYx14kOYhtxe+1W1Q7jPw0vmwn8FqqYMI0wxTIBXJyU
         bMCocrXjrD7dbjrG7NbCvV4HcpHInKNp8bWmldPWFT3jdP+rvEs1ZgApvGn0nNjYrTQq
         kvdkUnekB9fK1evoiQBeL8Up5sPs3gOx6gT40Rf8Av77kComP17L2YiOvgS2b44jPuj2
         xwK6vu3XAYj+KnjVy9DN4LIVjT2L7qeBVTiQrdZOY3mV8+LUxWsLJeOL52JmyrOT51dJ
         bdKQ+Fkvgff1Sw6/V3dByz3lV0EW1YcSLvKFPZoyFZLM8oMXhMap3O0uRQQLTM5P/KCP
         RUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        fh=E3pnMyuYyA3eOy0/NlEMaJbhFdPN+yTi7PorOVsNiIk=;
        b=oCaWa+fwyAJS6iUrPB20aS95tWU3+XBW/IuPEsVa7r9WEXhOensVoMiksAXOGih+iB
         rPe2V7JHP1Lee6cDXe7REPjzWtx+ai5IzY/DGpFreGGq+Ky582s92zmt0j9grnh4xroV
         wxpgfx6OJZ7rB4kCXBNWg15hyURqZuuiCCXgVvjl2DYfVd9emDHsZ9GJrw8K1drfmxC4
         XLRilmvKBY14PcwXGp7hrTOsdWP1zD3whNH/kiqb/u2yR8PFIw+j9ZglJEK5lUdhHPQ+
         y0Zk8S4GrQktynxbUhBK3U+DLd/sNdRW+tb2wLDRZqYNZ5WqA9rxwpRx9fEYaJbahwp2
         6v2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789068677; x=1789673477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        b=bTyEgftUWKIopOFjcUBu/2KhyIikGf6Tu1DDL0wwWwCBeQuNHF/DSagivn5/pmOxO7
         7U3doG7W3kvzWMO81f7YlZLMiqtOrQn+32PUDrNIvj1XSYRFFssQku8mVpwT4BpPosUh
         fthi9hb+NCnSppkJTfPLCdYDX4XPhZNirMuLoetNJ94VKcUTmcWKEKom5ZrXrnpZWz05
         o7fTBpSEzeel1qee7ZQtEsF70qdoJyYaVODAa9dyKgK/T9kZYZkONNztop09xD3tmWE3
         Wzau4bN9ObZjURUtR5SxNOFmLx8E8KvX4d3FsBh7p2CB6idxd89ebwg7gc+nBHEXwteD
         oVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068677; x=1789673477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        b=re513lsjjp4nldwrr7IFdoamJjyBpNBKvTS/upl1IlnIe9AHKCGipk8ZY0yyBnrDK0
         y13b28GDg66f1HnbeIYCZjSZarsPjzHqN20hB7Eew8sxskV9K32ZftfBlEjhFqZsAMT9
         u+ytSZIv5fkMUvxidc9Vyn+IQKIBWE7WPV+I6UO8SUpAne3xwE9utsCFMvwlvJ60Q+R1
         Lym9E5lVUsha3jxF57NrRQn/r+TGF3/ePmWR0nExST8iJrxoKm3c+uKFd2656OGbTzsI
         VhkWW69v3jsMcgh+kaCU10Uhf7Ie+hO70+qPNHLslZJgmk6x6KtHQ2MFLtP9cpdxkFep
         TODw==
X-Forwarded-Encrypted: i=1; AKwUvBy7oCLv6QFQjC9BCXbhfikcHSuBuA9JAWjqpsA7v4iRLTfYI7fTqEZKnkxHkXmSho5nPWpqrB7IvNUjj2jYYdc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5iAxXj2OxQeGUlx/qXm+a+HdsBTDibOiHv+M2mlrfN0Ag+k0+
	BqilW4uAptbBo7YpCYx0xSTHHJDg3vhvEVz/u0lF5um6W6YKttjaWu9n1JjVZMuFcSGZpBea+Gd
	UZZmY/kOkCUCpmNIGjfHgCx1p26WJqVIcYW5lJcM=
X-Gm-Gg: AYBFou2Ecv/OVQpkp3K/za7Y/cTQOJckrdLxJXDLouC3bdbSsgEGq8bpwBSg8vPJWXH
	7+N9HLkI9a0B8bdlAkw97Zf+woA6Jrqbu7byW5aYvh3ecCVYihiHpYyqUACIIpbhUSTIhFk90Ow
	XIbD6tqBiXOF27cDa+TwhCgcuaEGUu3k2RfmkuM2hbSbIlTH0ttZHDZx1+vK6+Nt1Bzvry7dAAK
	L7b8lg9hrzmDeU5cjzZucNEFU5UcxDaK3anYrhpfesK2ZCVZ8rnme21azy4LqQIhN3Z9rIKLiVy
	XTukneqYGGt5Xsv6kWdvH1Xh6lwoOknw64EVVx2XXr2spWmlxH70lLlx0CEjJEjnwx0YqFDQ+0K
	kvdx+22bb29OK4CddAzOOHeG6e2kPpFrRdtVvimsrWzsr0w/33mTi
X-Received: by 2002:a05:6122:3417:b0:5c8:3122:ac47 with SMTP id
 71dfb90a1353d-5c8462b2288mr1910205e0c.5.1789068676639; Thu, 10 Sep 2026
 12:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823123549.1120133-1-morbo@google.com> <20260823123549.1120133-3-morbo@google.com>
 <aosNst7K9zaClFEH@google.com>
In-Reply-To: <aosNst7K9zaClFEH@google.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 10 Sep 2026 12:30:59 -0700
X-Gm-Features: AcwNN1UAFW8O5KEENv3dVtojFZT_CRKAdk5AOtP2XF5VqSdFHqLVOslXBPVUWeo
Message-ID: <CAGG=3QX5PQSioCK+5kM5wZvtYoa7iKrRFtPuwvX2d06C2kw-iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/tests: Add KUnit test for struct stack_trace
 __counted_by_ptr attribute
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Dmitry Antipov <dmantipov@yandex.ru>, 
	Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>, 
	codemender-patching+linux@google.com, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuan-Wei,

On Sun, Aug 23, 2026 at 8:11=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> Hi Bill,
>
> On Sun, Aug 23, 2026 at 12:35:33PM +0000, Bill Wendling wrote:
> > Add a custom KUnit test suite 'stacktrace_counted_by' to verify that th=
e
> > __counted_by_ptr annotation on the 'entries' field of 'struct stack_tra=
ce'
> > behaves correctly.
> >
> > The test verifies that 'max_entries' correctly limits and validates acc=
ess
> > to 'entries' when CONFIG_ARCH_STACKWALK is not defined. If it is define=
d,
> > the test is cleanly skipped at runtime to prevent compile-time or runti=
me
> > failures due to 'struct stack_trace' being undefined on modern
> > architectures.
> >
> > Assisted-by: Gemini Next
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Brendan Higgins <brendan.higgins@linux.dev>
> > Cc: David Gow <david@davidgow.net>
> > Cc: Rae Moar <raemoar63@gmail.com>
> > Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
> > Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
> > Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Cc: Dmitry Antipov <dmantipov@yandex.ru>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Kir Chou <note351@hotmail.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: kunit-dev@googlegroups.com
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  lib/Kconfig.debug            | 10 +++++++
> >  lib/kunit/.kunitconfig       |  1 +
> >  lib/tests/Makefile           |  1 +
> >  lib/tests/stacktrace_kunit.c | 51 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> >  create mode 100644 lib/tests/stacktrace_kunit.c
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index e97bdf3a42a8..51a6ac1a2461 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2716,6 +2716,16 @@ config BITOPS_KUNIT
> >
> >         If unsure, say N.
> >
> > +config STACKTRACE_KUNIT_TEST
> > +     tristate "KUnit test for stacktrace counted_by attribute" if !KUN=
IT_ALL_TESTS
> > +     depends on KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       This option enables the KUnit test for verifying the __counted_=
by_ptr
> > +       attribute on struct stack_trace.
> > +
> > +       If unsure, say N.
> > +
> >  config BITFIELD_KUNIT
> >       tristate "KUnit test bitfield functions at runtime" if !KUNIT_ALL=
_TESTS
> >       depends on KUNIT
> > diff --git a/lib/kunit/.kunitconfig b/lib/kunit/.kunitconfig
> > index 9235b7d42d38..b3761b41459e 100644
> > --- a/lib/kunit/.kunitconfig
> > +++ b/lib/kunit/.kunitconfig
> > @@ -1,3 +1,4 @@
> >  CONFIG_KUNIT=3Dy
> >  CONFIG_KUNIT_TEST=3Dy
> >  CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> > +CONFIG_STACKTRACE_KUNIT_TEST=3Dy
> > diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> > index 4ead57602eac..40875e729fc8 100644
> > --- a/lib/tests/Makefile
> > +++ b/lib/tests/Makefile
> > @@ -6,6 +6,7 @@
> >  CFLAGS_bitfield_kunit.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> >  obj-$(CONFIG_BASE64_KUNIT) +=3D base64_kunit.o
> >  obj-$(CONFIG_BITOPS_KUNIT) +=3D bitops_kunit.o
> > +obj-$(CONFIG_STACKTRACE_KUNIT_TEST) +=3D stacktrace_kunit.o
> >  obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
> >  obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
> >  obj-$(CONFIG_SHDI3_KUNIT_TEST) +=3D shdi3_kunit.o
> > diff --git a/lib/tests/stacktrace_kunit.c b/lib/tests/stacktrace_kunit.=
c
> > new file mode 100644
> > index 000000000000..7ec48edf84fe
> > --- /dev/null
> > +++ b/lib/tests/stacktrace_kunit.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for struct stack_trace counted_by attribute.
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/stacktrace.h>
> > +
> > +#ifndef CONFIG_ARCH_STACKWALK
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     unsigned long entries_buf[4];
> > +     struct stack_trace trace =3D {
> > +             .entries =3D entries_buf,
> > +             .max_entries =3D 4,
> > +     };
> > +
> > +     KUNIT_EXPECT_EQ(test, trace.max_entries, 4U);
> > +     KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries=
_buf);
> > +
> > +     /* Write to the allocated elements to verify access */
> > +     trace.entries[0] =3D 0xdeadbeef;
> > +     trace.entries[1] =3D 0xbeefcafe;
> > +     trace.entries[2] =3D 0xcafebabe;
> > +     trace.entries[3] =3D 0x12345678;
>
> This only does in bounds array writes.
> To test __counted_by_ptr, I thought we were supposed to intentionally
> trigger an out of bounds access and see if it actually catches the
> error?
>
True. This is testing only that the existing behavior doesn't fail
with the new attribute. It looks like you're not the only one to
comment on this, though...

-bw

> > +
> > +     KUNIT_EXPECT_EQ(test, trace.entries[0], 0xdeadbeefUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[1], 0xbeefcafeUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[2], 0xcafebabeUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[3], 0x12345678UL);
> > +}
> > +#else
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_=
trace is not defined");
> > +}
> > +#endif
> > +
> > +static struct kunit_case stacktrace_test_cases[] =3D {
> > +     KUNIT_CASE(test_stack_trace_counted_by),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite stacktrace_test_suite =3D {
> > +     .name =3D "stacktrace_counted_by",
> > +     .test_cases =3D stacktrace_test_cases,
> > +};
> > +
> > +kunit_test_suite(stacktrace_test_suite);
> > +
> > +MODULE_LICENSE("GPL");
> > --
> > 2.55.0.860.g4b6b3295ed-goog
> >
