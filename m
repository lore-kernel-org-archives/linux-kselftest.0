From: daniel.diaz@linaro.org (=?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?=)
Date: Mon, 19 Feb 2018 10:17:50 -0600
Subject: selftests/bpf: How to build test_tcpbpf_kern?
Message-ID:
 <CAEUSe7-Sk3X0yJd30skK0Ha2GTfZanCYxJ9-Gqe_5RMdyFgtZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180219161750.K7pWh-oUCYyQZkGpBl2X5q0FrZWoHZ2K-KG7rfaKPT0@z>

Hello!

I am unable to successfully build the BPF target in selftests because
of a build failure with test_tcpbpf_kern:

-----8<-----8<-----8<-----
/linux/tools/testing/selftests$ make TARGETS=bpf
[...]
clang -I. -I./include/uapi -I../../../include/uapi
-Wno-compare-distinct-pointer-types \
     -O2 -target bpf -emit-llvm -c test_tcpbpf_kern.c -o - |      \
llc -march=bpf -mcpu=generic -filetype=obj -o
/linux/tools/testing/selftests/bpf/test_tcpbpf_kern.o
In file included from test_tcpbpf_kern.c:12:
/usr/include/netinet/in.h:101:5: error: expected identifier
    IPPROTO_HOPOPTS = 0,   /* IPv6 Hop-by-Hop options.  */
    ^
/usr/include/linux/in6.h:132:26: note: expanded from macro 'IPPROTO_HOPOPTS'
#define IPPROTO_HOPOPTS         0       /* IPv6 hop-by-hop options      */
                                ^
[...and a bunch of similar errors...]
----->8----->8----->8-----

That is under 4.16.0-rc2 using Clang 3.8 from Ubuntu 16.04.3 LTS. Is
there something obvious I might be missing?

Thanks and greetings!

Daniel Díaz
daniel.diaz at linaro.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
