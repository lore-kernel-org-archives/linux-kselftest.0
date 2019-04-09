From: keescook@chromium.org (Kees Cook)
Date: Tue, 9 Apr 2019 09:57:56 -0700
Subject: [PATCH] selftests/lib.mk: Move test output to diagnostic lines
In-Reply-To: <d0647ccf-b2a2-8fd4-adc4-16914b68ffbf@kernel.org>
References: <20190408203012.GA566@beast>
 <ac089bd1-0abb-da5b-a418-b81ea9957a28@kernel.org>
 <CAGXu5j+_b-w+e_4rn1D5zH=KF_O=ktz-xV3hEFd1cqSmcWpWhQ@mail.gmail.com>
 <d0647ccf-b2a2-8fd4-adc4-16914b68ffbf@kernel.org>
Message-ID:
 <CAGXu5jLta_gWu+5SXMrkQY3pTVnZ43CAK24Z5xAXdzJMwYWojQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409165756.VpcywnPQQXeMji0XXm0t3u4X5fU4TOMCTd62m38xk4Q@z>

On Tue, Apr 9, 2019@9:56 AM shuah <shuah@kernel.org> wrote:
>
> On 4/9/19 10:06 AM, Kees Cook wrote:
> > On Mon, Apr 8, 2019@2:32 PM shuah <shuah@kernel.org> wrote:
> >> Couple of things to consider:
> >> - will this work on embedded test system with limited applications shell
> >>     support?
> >
> > I was assuming the availability of "stdbuf" which is part of
> > coreutils, and "perl" which is already required for at least one other
> > test (sysctl). What do you have in mind for the "maximum supported
> > environment" (and where's best to document this)? Also, I see python
> > is used by several tests. Should python be considered instead of perl?
> >
> >> - It does add dependecy on perl for running tests - not a problem since
> >>     kernel build system uses it, however it might not be the case when
> >>     tests get run on system without perl.
> >
> > I could likely rewrite the "prefix.pl" in C, and the test could use a
> > built binary instead? Or in python (as noted above). Where are tests
> > being run right now with such a limited environment?
> >
>
> Some embedded systems as I recall with just busybox env. I am thinking
> shell rather C/perl/python.

It can't be done with shell alone if we want to retain the unbuffered
output. Don't we already ship binaries in this situation, though?
(i.e. such environments clearly aren't building test binaries...) Why
not also ship kselftest binaries?

-Kees

-- 
Kees Cook
