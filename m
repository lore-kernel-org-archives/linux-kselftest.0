From: brendanhiggins at google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 15:37:13 -0800
Subject: [RFC v3 08/19] arch: um: add shim to trap to allow installing a
 fault catcher for tests
In-Reply-To: <20181130034135.GN18410@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-9-brendanhiggins@google.com>
 <20181130034135.GN18410@garbanzo.do-not-panic.com>
Message-ID: <CAFd5g45+1wHteYs5YiL19x=L=g=oab5uJrabdKO8q_jS4-ojbg@mail.gmail.com>

On Thu, Nov 29, 2018 at 7:41 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
>
> On Wed, Nov 28, 2018 at 11:36:25AM -0800, Brendan Higgins wrote:
> > +static void segv_run_catcher(jmp_buf *catcher, void *fault_addr)
> > +{
> > +     current->thread.fault_addr = fault_addr;
> > +     UML_LONGJMP(catcher, 1);
> > +}
>
> Some documentation about what this does exactly would be appreciated.
> With the goal it may be useful to others wanting to consider support
> for other archs -- if that actually ends up being desirable.

Yeah, I should. Should this go in the wrapper around the abort() hack?
Or do you think I should write some documentation on how KUnit works
under Documentation/ ?
