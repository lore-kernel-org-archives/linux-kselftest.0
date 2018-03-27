From: changbin.du@intel.com (Du, Changbin)
Date: Tue, 27 Mar 2018 10:20:10 +0800
Subject: [PATCH 4/4] selftests/bpf: fix compiling errors
In-Reply-To: <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
References: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
 <1522056208-4004-5-git-send-email-changbin.du@intel.com>
 <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
Message-ID: <20180327022010.57u6rn73inbkrycn@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180327022010.n70idboVynDPZwncLbjtWDsnwMlneLwThwzvlvIZA7s@z>

On Mon, Mar 26, 2018@07:55:13AM -0700, Alexei Starovoitov wrote:
> On Mon, Mar 26, 2018@05:23:28PM +0800, changbin.du@intel.com wrote:
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

This one? But I didn't see any problem.

changbin at gvt-dell-host:~/work/linux/tools/testing/selftests/bpf$ make
make -C ../../../lib/bpf OUTPUT=/home/changbin/work/linux/tools/testing/selftests/bpf/
make[1]: Entering directory '/home/changbin/work/linux/tools/lib/bpf'
  HOSTCC   /home/changbin/work/linux/tools/testing/selftests/bpf/fixdep.o
  HOSTLD   /home/changbin/work/linux/tools/testing/selftests/bpf/fixdep-in.o
  LINK     /home/changbin/work/linux/tools/testing/selftests/bpf/fixdep
  CC       /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.o
  CC       /home/changbin/work/linux/tools/testing/selftests/bpf/bpf.o
  CC       /home/changbin/work/linux/tools/testing/selftests/bpf/nlattr.o
  LD       /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf-in.o
  LINK     /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a
  LINK     /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.so
make[1]: Leaving directory '/home/changbin/work/linux/tools/lib/bpf'
make -C ../../../lib/bpf OUTPUT=/home/changbin/work/linux/tools/testing/selftests/bpf/
make[1]: Entering directory '/home/changbin/work/linux/tools/lib/bpf'
make[1]: Leaving directory '/home/changbin/work/linux/tools/lib/bpf'
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_verifier.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_verifier
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_tag.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_tag
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_maps.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_maps
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_lru_map.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_lru_map
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_lpm_map.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_lpm_map
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_progs.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_progs
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_align.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_align
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_verifier_log.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_verifier_log
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_dev_cgroup.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_dev_cgroup
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_tcpbpf_user.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a cgroup_helpers.c -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_tcpbpf_user
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../../include/generated -DHAVE_GENHDR -I../../../include -I../../../../usr/include    test_libbpf_open.c /home/changbin/work/linux/tools/testing/selftests/bpf/libbpf.a -lcap -lelf -lrt -lpthread -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_libbpf_open
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_pkt_access.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_pkt_access.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_xdp.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_xdp.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_l4lb.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_l4lb.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_tcp_estats.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_tcp_estats.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_obj_id.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_obj_id.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_pkt_md_access.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_pkt_md_access.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_xdp_redirect.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_xdp_redirect.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_xdp_meta.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_xdp_meta.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c sockmap_parse_prog.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/sockmap_parse_prog.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c sockmap_verdict_prog.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/sockmap_verdict_prog.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c dev_cgroup.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/dev_cgroup.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c sample_ret0.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/sample_ret0.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_tracepoint.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_tracepoint.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types -fno-inline \
         -O2 -target bpf -emit-llvm -c test_l4lb_noinline.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_l4lb_noinline.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types -fno-inline \
         -O2 -target bpf -emit-llvm -c test_xdp_noinline.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_xdp_noinline.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_stacktrace_map.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_stacktrace_map.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c sample_map_ret0.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/sample_map_ret0.o
clang -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include -Wno-compare-distinct-pointer-types \
         -O2 -target bpf -emit-llvm -c test_tcpbpf_kern.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_tcpbpf_kern.o
changbin at gvt-dell-host:~/work/linux/tools/testing/selftests/bpf$ 

-- 
Thanks,
Changbin Du
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
