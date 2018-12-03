From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 15:34:57 -0800
Subject: [RFC v3 08/19] arch: um: add shim to trap to allow installing a
 fault catcher for tests
In-Reply-To: <20181130033429.GK18410@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-9-brendanhiggins@google.com>
 <20181130033429.GK18410@garbanzo.do-not-panic.com>
Message-ID:
 <CAFd5g45+MAVaSW8HN9x57Y8Um=TV1Oa=-K8yExPBS-4KjLyciQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181203233457.mjHw-jOZiToa8cymOP0q0f7VoaTSxGuK_QySlPRu36w@z>

On Thu, Nov 29, 2018@7:34 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Wed, Nov 28, 2018@11:36:25AM -0800, Brendan Higgins wrote:
> > diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
> > index cced829460427..bf90e678b3d71 100644
> > --- a/arch/um/kernel/trap.c
> > +++ b/arch/um/kernel/trap.c
> > @@ -201,6 +201,12 @@ void segv_handler(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs)
> >       segv(*fi, UPT_IP(regs), UPT_IS_USER(regs), regs);
> >  }
> >
> > +static void segv_run_catcher(jmp_buf *catcher, void *fault_addr)
> > +{
> > +     current->thread.fault_addr = fault_addr;
> > +     UML_LONGJMP(catcher, 1);
> > +}
> > +
> >  /*
> >   * We give a *copy* of the faultinfo in the regs to segv.
> >   * This must be done, since nesting SEGVs could overwrite
> > @@ -219,7 +225,10 @@ unsigned long segv(struct faultinfo fi, unsigned long ip, int is_user,
> >       if (!is_user && regs)
> >               current->thread.segv_regs = container_of(regs, struct pt_regs, regs);
> >
> > -     if (!is_user && (address >= start_vm) && (address < end_vm)) {
> > +     catcher = current->thread.fault_catcher;
>
> This and..
>
> > +     if (catcher && current->thread.is_running_test)
> > +             segv_run_catcher(catcher, (void *) address);
> > +     else if (!is_user && (address >= start_vm) && (address < end_vm)) {
> >               flush_tlb_kernel_vm();
> >               goto out;
> >       }
>
> *not this*

I don't understand. Are you saying the previous block of code is good
and this one is bad?

>
> > @@ -246,12 +255,10 @@ unsigned long segv(struct faultinfo fi, unsigned long ip, int is_user,
> >               address = 0;
> >       }
> >
> > -     catcher = current->thread.fault_catcher;
> >       if (!err)
> >               goto out;
> >       else if (catcher != NULL) {
> > -             current->thread.fault_addr = (void *) address;
> > -             UML_LONGJMP(catcher, 1);
> > +             segv_run_catcher(catcher, (void *) address);
> >       }
> >       else if (current->thread.fault_addr != NULL)
> >               panic("fault_addr set but no fault catcher");
>
> But with this seems one atomic change which should be submitted
> separately, its just a helper. Think it would make the actual
> change needed easier to review, ie, your needed changes would
> be smaller and clearer for what you need.

Are you suggesting that I pull out the bits needed to implement abort
in the next patch and squash it into this one?
