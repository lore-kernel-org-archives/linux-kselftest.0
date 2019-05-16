From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 16 May 2019 08:50:35 -0700
Subject: [PATCH bpf v1 2/3] selftests/bpf: Print a message when tester
 could not run a program
In-Reply-To: <CAGGp+cGN+YYVjJee5ba84HstSrHGurBvwmKmzNsFRvb344Df3A@mail.gmail.com>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-3-krzesimir@kinvolk.io>
 <20190515144537.57f559e7@cakuba.netronome.com>
 <CAGGp+cGN+YYVjJee5ba84HstSrHGurBvwmKmzNsFRvb344Df3A@mail.gmail.com>
Message-ID: <20190516085035.3cdb0ae6@cakuba.netronome.com>

On Thu, 16 May 2019 11:29:39 +0200, Krzesimir Nowak wrote:
> > > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > > index ccd896b98cac..bf0da03f593b 100644
> > > --- a/tools/testing/selftests/bpf/test_verifier.c
> > > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > > @@ -825,11 +825,20 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
> > >                               tmp, &size_tmp, &retval, NULL);
> > >       if (unpriv)
> > >               set_admin(false);
> > > -     if (err && errno != 524/*ENOTSUPP*/ && errno != EPERM) {
> > > -             printf("Unexpected bpf_prog_test_run error ");
> > > -             return err;
> > > +     if (err) {
> > > +             switch (errno) {
> > > +             case 524/*ENOTSUPP*/:
> > > +                     printf("Did not run the program (not supported) ");
> > > +                     return 0;
> > > +             case EPERM:
> > > +                     printf("Did not run the program (no permission) ");
> > > +                     return 0;  
> >
> > Perhaps use strerror(errno)?  
> 
> As I said in the commit message, I open-coded those messages because
> strerror for ENOTSUPP returns "Unknown error 524".

Ah, sorry, missed that.  I wonder if that's something worth addressing
in libc, since the BPF subsystem uses ENOTSUPP a lot.
