From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 2 May 2019 17:44:05 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
 <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
Message-ID:
 <CAFd5g47JiSXHvMEu9NovkGdG7ugMCwVO0pGwT7bC=NCghD0w-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503004405.sORX9Wvp4uGKSDK18Q2fAbpP4AZWDJRpNTlxsxgAMBc@z>

On Thu, May 2, 2019@7:04 AM shuah <shuah@kernel.org> wrote:
>
> On 5/2/19 4:50 AM, Greg KH wrote:
> > On Wed, May 01, 2019@04:01:09PM -0700, Brendan Higgins wrote:
> >> ## TLDR
> >>
> >> I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
> >> 5.2.
> >
> > That might be rushing it, normally trees are already closed now for
> > 5.2-rc1 if 5.1-final comes out this Sunday.
> >
> >> Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
> >> we would merge through your tree when the time came? Am I remembering
> >> correctly?
> >
> > No objection from me.
> >
>
> Yes. I can take these through kselftest tree when the time comes.

Awesome.

> Agree with Greg that 5.2 might be rushing it. 5.3 would be a good
> target.

Whoops. I guess I should have sent this out a bit earlier. Oh well, as
long as we are on our way!
