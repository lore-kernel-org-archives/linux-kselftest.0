From: changbin.du@intel.com (Du, Changbin)
Date: Tue, 27 Mar 2018 10:33:16 +0800
Subject: [PATCH 4/4] selftests/bpf: fix compiling errors
In-Reply-To: <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
References: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
 <1522056208-4004-5-git-send-email-changbin.du@intel.com>
 <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
Message-ID: <20180327023315.zjxrxfmhuzfqqpos@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180327023316.TXhVz2tFcZZpTnG9ANF9kJFfgIDCBtVRbylKhYwKWx8@z>

Hi Starovoitov,

This one does have the issue you mentioned.
[PATCH 2/4] selftests/gpio: fix paths in Makefile

And can be fixed by:

--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0

+OUTPUT ?= $(shell pwd)
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
 BINARIES := gpio-mockup-chardev
@@ -24,7 +25,7 @@ LDLIBS += -lmount -I/usr/include/libmount
 $(BINARIES): gpio-utils.o ../../../../usr/include/linux/gpio.h

 gpio-utils.o:
-       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
+       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) OUTPUT=$(OUTPUT)/ -C ../../../gpio

 ../../../../usr/include/linux/gpio.h:


I will update it later.

On Mon, Mar 26, 2018@07:55:13AM -0700, Alexei Starovoitov wrote:
> On Mon, Mar 26, 2018@05:23:28PM +0800, changbin.du@intel.com wrote:
> > From: Changbin Du <changbin.du at intel.com>
> > 
> > This patch fixed below errors of missing head files.
> > 
> > tools/testing/selftests$ make
> > ...
> > clang -I. -I./include/uapi -I../../../include/uapi -Wno-compare-distinct-pointer-types \
> > 	 -O2 -target bpf -emit-llvm -c test_pkt_access.c -o - |      \
> > llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf//test_pkt_access.o
> > In file included from test_pkt_access.c:9:
> > In file included from ../../../include/uapi/linux/bpf.h:11:
> > In file included from ./include/uapi/linux/types.h:5:
> > /usr/include/asm-generic/int-ll64.h:11:10: fatal error: 'asm/bitsperlong.h' file not found
> >  #include <asm/bitsperlong.h>
> >          ^
> > 1 error generated.
> > clang -I. -I./include/uapi -I../../../include/uapi -Wno-compare-distinct-pointer-types \
> > 	 -O2 -target bpf -emit-llvm -c test_xdp.c -o - |      \
> > llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf//test_xdp.o
> > In file included from test_xdp.c:9:
> > In file included from ../../../include/uapi/linux/bpf.h:11:
> > In file included from ./include/uapi/linux/types.h:5:
> > /usr/include/asm-generic/int-ll64.h:11:10: fatal error: 'asm/bitsperlong.h' file not found
> >  #include <asm/bitsperlong.h>
> >          ^
> > 1 error generated.
> > clang -I. -I./include/uapi -I../../../include/uapi -Wno-compare-distinct-pointer-types \
> > 	 -O2 -target bpf -emit-llvm -c test_l4lb.c -o - |      \
> > llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf//test_l4lb.o
> > In file included from test_l4lb.c:10:
> > In file included from /usr/include/linux/pkt_cls.h:4:
> > In file included from ./include/uapi/linux/types.h:5:
> > /usr/include/asm-generic/int-ll64.h:11:10: fatal error: 'asm/bitsperlong.h' file not found
> >  #include <asm/bitsperlong.h>
> >          ^
> > 1 error generated.
> > clang -I. -I./include/uapi -I../../../include/uapi -Wno-compare-distinct-pointer-types \
> > 	 -O2 -target bpf -emit-llvm -c test_tcp_estats.c -o - |      \
> > llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf//test_tcp_estats.o
> > In file included from test_tcp_estats.c:35:
> > In file included from ../../../include/uapi/linux/bpf.h:11:
> > In file included from ./include/uapi/linux/types.h:5:
> > /usr/include/asm-generic/int-ll64.h:11:10: fatal error: 'asm/bitsperlong.h' file not found
> >  #include <asm/bitsperlong.h>
> > ...
> > 
> > Signed-off-by: Changbin Du <changbin.du at intel.com>
> > ---
> >  tools/testing/selftests/bpf/Makefile | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> > index 5c43c18..dc0fdc8 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
> > @@ -10,7 +10,8 @@ ifneq ($(wildcard $(GENHDR)),)
> >    GENFLAGS := -DHAVE_GENHDR
> >  endif
> >  
> > -CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) -I../../../include
> > +CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) \
> > +	  -I../../../include -I../../../../usr/include
> >  LDLIBS += -lcap -lelf -lrt -lpthread
> >  
> >  # Order correspond to 'make run_tests' order
> > @@ -62,7 +63,7 @@ else
> >    CPU ?= generic
> >  endif
> >  
> > -CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi \
> > +CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include \
> >  	      -Wno-compare-distinct-pointer-types
> 
> Nack.
> I suspect that will break the build for everyone else who's doing it in the directory
> itself instead of the outer one.
> 

-- 
Thanks,
Changbin Du
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
