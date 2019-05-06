From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 6 May 2019 02:18:01 -0700
Subject: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit
 testing framework
In-Reply-To: <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-16-brendanhiggins@google.com>
 <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
Message-ID:
 <CAFd5g456XwQV2+iy=0K7AwBc5wbQDRL2DAJgMEsJBLtFdZ5erQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506091801.CkbceXMpFmJjwpf74ZjGU668Rukkj4apR8GPyKDCkis@z>

On Fri, May 3, 2019@7:38 AM shuah <shuah@kernel.org> wrote:
>
> On 5/1/19 5:01 PM, Brendan Higgins wrote:
> > Add myself as maintainer of KUnit, the Linux kernel's unit testing
> > framework.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > ---
> >   MAINTAINERS | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5c38f21aee787..c78ae95c56b80 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8448,6 +8448,16 @@ S:     Maintained
> >   F:  tools/testing/selftests/
> >   F:  Documentation/dev-tools/kselftest*
> >
> > +KERNEL UNIT TESTING FRAMEWORK (KUnit)
> > +M:   Brendan Higgins <brendanhiggins at google.com>
> > +L:   kunit-dev at googlegroups.com
> > +W:   https://google.github.io/kunit-docs/third_party/kernel/docs/
> > +S:   Maintained
> > +F:   Documentation/kunit/
> > +F:   include/kunit/
> > +F:   kunit/
> > +F:   tools/testing/kunit/
> > +
>
> Please add kselftest mailing list to this entry, based on our
> conversation on taking these patches through kselftest tree.

Will do.

Thanks!
