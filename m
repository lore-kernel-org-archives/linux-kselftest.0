From: krzesimir@kinvolk.io (Krzesimir Nowak)
Date: Thu, 16 May 2019 11:29:39 +0200
Subject: [PATCH bpf v1 2/3] selftests/bpf: Print a message when tester
 could not run a program
In-Reply-To: <20190515144537.57f559e7@cakuba.netronome.com>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-3-krzesimir@kinvolk.io>
 <20190515144537.57f559e7@cakuba.netronome.com>
Message-ID:
 <CAGGp+cGN+YYVjJee5ba84HstSrHGurBvwmKmzNsFRvb344Df3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516092939.K7ISwbPJy9hBg_TJ5i96bZZrMtbiQ_Ww_XTrkwpYUv8@z>

On Wed, May 15, 2019 at 11:46 PM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> On Wed, 15 May 2019 15:47:27 +0200, Krzesimir Nowak wrote:
> > This prints a message when the error is about program type being not
> > supported by the test runner or because of permissions problem. This
> > is to see if the program we expected to run was actually executed.
> >
> > The messages are open-coded because strerror(ENOTSUPP) returns
> > "Unknown error 524".
> >
> > Signed-off-by: Krzesimir Nowak <krzesimir at kinvolk.io>
> > ---
> >  tools/testing/selftests/bpf/test_verifier.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > index ccd896b98cac..bf0da03f593b 100644
> > --- a/tools/testing/selftests/bpf/test_verifier.c
> > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > @@ -825,11 +825,20 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
> >                               tmp, &size_tmp, &retval, NULL);
> >       if (unpriv)
> >               set_admin(false);
> > -     if (err && errno != 524/*ENOTSUPP*/ && errno != EPERM) {
> > -             printf("Unexpected bpf_prog_test_run error ");
> > -             return err;
> > +     if (err) {
> > +             switch (errno) {
> > +             case 524/*ENOTSUPP*/:
> > +                     printf("Did not run the program (not supported) ");
> > +                     return 0;
> > +             case EPERM:
> > +                     printf("Did not run the program (no permission) ");
> > +                     return 0;
>
> Perhaps use strerror(errno)?

As I said in the commit message, I open-coded those messages because
strerror for ENOTSUPP returns "Unknown error 524".

>
> > +             default:
> > +                     printf("Unexpected bpf_prog_test_run error ");
> > +                     return err;
> > +             }
> >       }
> > -     if (!err && retval != expected_val &&
> > +     if (retval != expected_val &&
> >           expected_val != POINTER_VALUE) {
> >               printf("FAIL retval %d != %d ", retval, expected_val);
> >               return 1;
>


-- 
Kinvolk GmbH | Adalbertstr.6a, 10999 Berlin | tel: +491755589364
Geschäftsführer/Directors: Alban Crequy, Chris Kühl, Iago López Galeiras
Registergericht/Court of registration: Amtsgericht Charlottenburg
Registernummer/Registration number: HRB 171414 B
Ust-ID-Nummer/VAT ID number: DE302207000
