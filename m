From: krzesimir@kinvolk.io (Krzesimir Nowak)
Date: Thu, 16 May 2019 18:21:32 +0200
Subject: [PATCH bpf v1 2/3] selftests/bpf: Print a message when tester
 could not run a program
In-Reply-To: <20190516085035.3cdb0ae6@cakuba.netronome.com>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-3-krzesimir@kinvolk.io>
 <20190515144537.57f559e7@cakuba.netronome.com>
 <CAGGp+cGN+YYVjJee5ba84HstSrHGurBvwmKmzNsFRvb344Df3A@mail.gmail.com>
 <20190516085035.3cdb0ae6@cakuba.netronome.com>
Message-ID:
 <CAGGp+cEFxzbH-8vnSAK3sZkM-u3WN4HGnkYvhFwBp85yVtD7Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516162132.XFxzQYqZEu7lerBx1BQf8btmLVGtGm0D35jOVtdYaKw@z>

On Thu, May 16, 2019 at 5:51 PM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> On Thu, 16 May 2019 11:29:39 +0200, Krzesimir Nowak wrote:
> > > > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > > > index ccd896b98cac..bf0da03f593b 100644
> > > > --- a/tools/testing/selftests/bpf/test_verifier.c
> > > > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > > > @@ -825,11 +825,20 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
> > > >                               tmp, &size_tmp, &retval, NULL);
> > > >       if (unpriv)
> > > >               set_admin(false);
> > > > -     if (err && errno != 524/*ENOTSUPP*/ && errno != EPERM) {
> > > > -             printf("Unexpected bpf_prog_test_run error ");
> > > > -             return err;
> > > > +     if (err) {
> > > > +             switch (errno) {
> > > > +             case 524/*ENOTSUPP*/:
> > > > +                     printf("Did not run the program (not supported) ");
> > > > +                     return 0;
> > > > +             case EPERM:
> > > > +                     printf("Did not run the program (no permission) ");
> > > > +                     return 0;
> > >
> > > Perhaps use strerror(errno)?
> >
> > As I said in the commit message, I open-coded those messages because
> > strerror for ENOTSUPP returns "Unknown error 524".
>
> Ah, sorry, missed that.  I wonder if that's something worth addressing
> in libc, since the BPF subsystem uses ENOTSUPP a lot.

The "not supported" errno situation seems to be a mess. There is an
ENOTSUP define in libc. ENOTSUP is usually defined to be EOPNOTSUPP
(taken from kernel), which in turn seems to have a different value
(95) than kernel's ENOTSUPP (524). Adding ENOTSUPP (with two Ps) to
libc would only add to the confusion. So it's kind of meh and I guess
people just moved on with workarounds.

-- 
Kinvolk GmbH | Adalbertstr.6a, 10999 Berlin | tel: +491755589364
Geschäftsführer/Directors: Alban Crequy, Chris Kühl, Iago López Galeiras
Registergericht/Court of registration: Amtsgericht Charlottenburg
Registernummer/Registration number: HRB 171414 B
Ust-ID-Nummer/VAT ID number: DE302207000
