From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Thu, 16 May 2019 09:54:26 -0700
Subject: [PATCH bpf v1 2/3] selftests/bpf: Print a message when tester
 could not run a program
In-Reply-To: <CAGGp+cEFxzbH-8vnSAK3sZkM-u3WN4HGnkYvhFwBp85yVtD7Xg@mail.gmail.com>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-3-krzesimir@kinvolk.io>
 <20190515144537.57f559e7@cakuba.netronome.com>
 <CAGGp+cGN+YYVjJee5ba84HstSrHGurBvwmKmzNsFRvb344Df3A@mail.gmail.com>
 <20190516085035.3cdb0ae6@cakuba.netronome.com>
 <CAGGp+cEFxzbH-8vnSAK3sZkM-u3WN4HGnkYvhFwBp85yVtD7Xg@mail.gmail.com>
Message-ID: <20190516095426.2e0d838f@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516165426.J0JhFPVAUE8xh4ZLdk9nAH-bhbLxPymenQhDNzwTbek@z>

On Thu, 16 May 2019 18:21:32 +0200, Krzesimir Nowak wrote:
> On Thu, May 16, 2019@5:51 PM Jakub Kicinski wrote:
> > On Thu, 16 May 2019 11:29:39 +0200, Krzesimir Nowak wrote:  
> > > > > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > > > > index ccd896b98cac..bf0da03f593b 100644
> > > > > --- a/tools/testing/selftests/bpf/test_verifier.c
> > > > > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > > > > @@ -825,11 +825,20 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
> > > > >                               tmp, &size_tmp, &retval, NULL);
> > > > >       if (unpriv)
> > > > >               set_admin(false);
> > > > > -     if (err && errno != 524/*ENOTSUPP*/ && errno != EPERM) {
> > > > > -             printf("Unexpected bpf_prog_test_run error ");
> > > > > -             return err;
> > > > > +     if (err) {
> > > > > +             switch (errno) {
> > > > > +             case 524/*ENOTSUPP*/:
> > > > > +                     printf("Did not run the program (not supported) ");
> > > > > +                     return 0;
> > > > > +             case EPERM:
> > > > > +                     printf("Did not run the program (no permission) ");
> > > > > +                     return 0;  
> > > >
> > > > Perhaps use strerror(errno)?  
> > >
> > > As I said in the commit message, I open-coded those messages because
> > > strerror for ENOTSUPP returns "Unknown error 524".  
> >
> > Ah, sorry, missed that.  I wonder if that's something worth addressing
> > in libc, since the BPF subsystem uses ENOTSUPP a lot.  
> 
> The "not supported" errno situation seems to be a mess. There is an
> ENOTSUP define in libc. ENOTSUP is usually defined to be EOPNOTSUPP
> (taken from kernel), which in turn seems to have a different value
> (95) than kernel's ENOTSUPP (524). Adding ENOTSUPP (with two Ps) to
> libc would only add to the confusion. So it's kind of meh and I guess
> people just moved on with workarounds.

Yes, ENOTSUP is never used in the kernel, but it's a mess.

This commit a while ago said ENOTSUPP is from NFS:

commit 423b3aecf29085a52530d4f9167c56a84b081042
Author: Or Gerlitz <ogerlitz at mellanox.com>
Date:   Thu Feb 23 12:02:41 2017 +0200

    net/mlx4: Change ENOTSUPP to EOPNOTSUPP
    
    As ENOTSUPP is specific to NFS, change the return error value to
    EOPNOTSUPP in various places in the mlx4 driver.
    
    Signed-off-by: Or Gerlitz <ogerlitz at mellanox.com>
    Suggested-by: Yotam Gigi <yotamg at mellanox.com>
    Reviewed-by: Matan Barak <matanb at mellanox.com>
    Signed-off-by: Tariq Toukan <tariqt at mellanox.com>
    Signed-off-by: David S. Miller <davem at davemloft.net>

But it's spreading throughout the kernel like a wildfire, I counted 1364
in my tree :/  Some are in tools/, but still.  My understanding was that
system calls should never return values above 512, but I'm probably
wrong about that.

Given the popularity, and the fact its an ABI at this point, we
probably have no choice but to add it to libc, but to be clear IMO it's
not a blocker for your patches.
