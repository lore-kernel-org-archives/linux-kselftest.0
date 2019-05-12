From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sun, 12 May 2019 01:34:29 -0600
Subject: [PATCH] selftests: bpf: Add files generated when compiled to
 .gitignore
In-Reply-To: <20190512062907.GL1247@mini-arch>
References: <20190512035009.25451-1-skunberg.kelsey@gmail.com>
 <20190512062907.GL1247@mini-arch>
Message-ID: <20190512073427.GA10811@asus>

On Sat, May 11, 2019 at 11:29:07PM -0700, Stanislav Fomichev wrote:
> On 05/11, Kelsey Skunberg wrote:
> > The following files are generated when /selftests/bpf/ is compiled and
> > should be added to .gitignore:
> > 
> > 	- libbpf.pc
> > 	- libbpf.so.0
> > 	- libbpf.so.0.0.3
> > 
> > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > ---
> >  tools/testing/selftests/bpf/.gitignore | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
> > index 41e8a689aa77..ceb11f98fe4f 100644
> > --- a/tools/testing/selftests/bpf/.gitignore
> > +++ b/tools/testing/selftests/bpf/.gitignore
> > @@ -32,3 +32,6 @@ test_tcpnotify_user
> >  test_libbpf
> >  test_tcp_check_syncookie_user
> >  alu32
> > +libbpf.pc
> 
> [..]
> > +libbpf.so.0
> > +libbpf.so.0.0.3
> How about libbpf.so.* so we don't have to update it on every release?
>

That seems logical. Updated in v2. I appreciate the feedback!

Cheers,
Kelsey

> > --
> > 2.20.1
> > 
