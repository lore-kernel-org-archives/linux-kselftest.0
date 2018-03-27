From: alexei.starovoitov at gmail.com (Alexei Starovoitov)
Date: Mon, 26 Mar 2018 20:02:30 -0700
Subject: [PATCH 4/4] selftests/bpf: fix compiling errors
In-Reply-To: <20180327022010.57u6rn73inbkrycn@intel.com>
References: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
 <1522056208-4004-5-git-send-email-changbin.du@intel.com>
 <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
 <20180327022010.57u6rn73inbkrycn@intel.com>
Message-ID: <20180327030229.txifuth2qmnjo3hy@ast-mbp>

On Tue, Mar 27, 2018 at 10:20:10AM +0800, Du, Changbin wrote:
> On Mon, Mar 26, 2018 at 07:55:13AM -0700, Alexei Starovoitov wrote:
> > On Mon, Mar 26, 2018 at 05:23:28PM +0800, changbin.du at intel.com wrote:
> > > Signed-off-by: Changbin Du <changbin.du at intel.com>
> > > ---
> > >  tools/testing/selftests/bpf/Makefile | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> > > index 5c43c18..dc0fdc8 100644
> > > --- a/tools/testing/selftests/bpf/Makefile
> > > +++ b/tools/testing/selftests/bpf/Makefile
> > > @@ -10,7 +10,8 @@ ifneq ($(wildcard $(GENHDR)),)
> > >    GENFLAGS := -DHAVE_GENHDR
> > >  endif
> > >  
> > > -CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) -I../../../include
> > > +CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) \
> > > +	  -I../../../include -I../../../../usr/include
> > >  LDLIBS += -lcap -lelf -lrt -lpthread
> > >  
> > >  # Order correspond to 'make run_tests' order
> > > @@ -62,7 +63,7 @@ else
> > >    CPU ?= generic
> > >  endif
> > >  
> > > -CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi \
> > > +CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include \
> > >  	      -Wno-compare-distinct-pointer-types
> > 
> > Nack.
> > I suspect that will break the build for everyone else who's doing it in the directory
> > itself instead of the outer one.
> >
> 
> This one? But I didn't see any problem.

because the build was lucky and additional path ../../../../usr/include didn't point
to a valid dir?
Please test with in-source and out-of-source builds.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
