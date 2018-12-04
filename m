From: brendanhiggins at google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 16:00:50 -0800
Subject: [RFC v3 16/19] arch: um: make UML unflatten device tree when
 testing
In-Reply-To: <CAL_JsqK5cG=QzMBFSZ31_-3ujnxqxv=jj3XYajbRLT7yWYZbfw@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-17-brendanhiggins@google.com>
 <CAL_JsqK5cG=QzMBFSZ31_-3ujnxqxv=jj3XYajbRLT7yWYZbfw@mail.gmail.com>
Message-ID: <CAFd5g44vWXpY_N80UcAKVkgYQkBLP0qOV1=kwPyxcH4umOf8dg@mail.gmail.com>

On Wed, Nov 28, 2018 at 1:16 PM Rob Herring <robh at kernel.org> wrote:
>
> On Wed, Nov 28, 2018 at 1:38 PM Brendan Higgins
> <brendanhiggins at google.com> wrote:
> > diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
> > index a818ccef30ca2..bd58ae3bf4148 100644
> > --- a/arch/um/kernel/um_arch.c
> > +++ b/arch/um/kernel/um_arch.c
> > +#if IS_ENABLED(CONFIG_OF_UNITTEST)
> > +       unflatten_device_tree();
> > +#endif
>
> Kind of strange to have this in the arch code. I'd rather have this in
> the unittest code if possible. Can we have an initcall conditional on
> CONFIG_UM in the unittest do this? Side note, use a C if with
> IS_ENABLED() whenever possible instead of pre-processor #if.

Yeah, that makes more sense. I will send a separate patch.

>
> I'll take a fix separately as it was on my todo to fix. I've got the
> unit tests running in a gitlab CI job now[1].
>
> Rob
>
> [1] https://gitlab.com/robherring/linux-dt-unittest/pipelines
