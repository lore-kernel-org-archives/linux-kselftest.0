Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584717;
	b=P+Gc0nAQH/8LRuyf2CqRohR2Pp/toV51h6uZMzXNu/paVDVdgKEPc0dxMcwXowNqC0Gt
	 HO+p/WKWL1Qaw3mZd40vmw0UR3rvMVTJ4ECzTuyYxMXjqdm8gWFoey8TV0KqcKQc1LqBF
	 RYXG2CmlLZ3UkjTh36Q+qF5fRWxl4JwBWdstz9QOWNwHJ84kABDXvB/Y5VwLqDVqczPqB
	 XQUPoDOQcqvpi8LAx7uskf25RBGjtf60ME9lp2EDiIC9d+N8pxfB/IqqPmW74WWqG3UIW
	 UHeVsEscOOVL/t3XvBdxfjR1BxUnbeuUsUXPauj9/0iwpwWoUa/Z9vlLI4q9WY2lWUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c5iW7hFGFNOx8F7eV0NOM/A0yCVzQynJGDZ1MOVXip8=;
	b=bMMv2dG4RFLPTy5T9+dLdQ8sCrTe76uuPrkGjthCrinl/H14wfbJE8cb4Mv3jyDJNTMk
	 gNxSWZZchbpc89Gu9OktDIwC3zjT/TUQzzqCqi2M4dh7yb9VFBXaBSypvZzYataQBAA3s
	 lLWUQStggiMHGizRZ0fBVg+LVVEMjnW9ERzfpEQgGCezowD9r38lxaFf+iAuPlWYeP5Qn
	 4LoZv3C8nrGKUBvUHLsVTy+uc/xnRfkaQXxJs3TSp1PpQXXek4mE0KrRzHlA54wYEPQD4
	 Sknk3epsjeKu+KM97/vlj12vPUmTZ7Fs+2rd8g1OMleTBPt0TyuPHmZROlpCSmHjKNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=gtoyXS8s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91023606A8AF
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91023606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=gtoyXS8s
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a07078200fso529036b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584716; cv=none;
        d=google.com; s=arc-20260327;
        b=JGvuzn8nRNm0kxE0W+vGcs7i4DPX9eaLKg1Y4S/qg8f2edKjBUZF5rnCof8MK9UTTP
         J0V4hWYbab4BXsnflu9yr0IcJt5LVctP8f+2Us10RxpSxxyo6rV/CudZ+Yq+3rIAoShx
         tdn30o6jx7pk/ml6XsC2Rh/W049/ujQOyC+s61vgLpT5OHWj3/Zc3fooxNvKhWUEm+8S
         jYdXIRH7wQJaIvjBVotYROX/dWH9RmR0Hty/v/hs1HZxw9qkL/lvVAj1b7770BIAiyOb
         b7hzF+54INBuRCtQAPQn9CFoIcVMmW/5tMyhBGCWzijHfqVg+u7T20js9K/EiuYgIOwl
         UgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5iW7hFGFNOx8F7eV0NOM/A0yCVzQynJGDZ1MOVXip8=;
        fh=EHrwd+L2OFVgnK6E6mws89kyPmeuLzHKjWYAwCJxk+Q=;
        b=l3ZZluVuHREL6byw3RCbPN1QXLpZi3d6DVQjdX2kNZ1bmB7bsIk/I6jci/ynIZKFxn
         WUdmZli5Uq42mcoTK6DQ8Vt0X34j0b6OEwve6Rwrr1uhA8g6RFblYUoL/6GH1HNqWLOR
         XZQg6nYB+HFn7tsetnZVMQRVjdd/EgSsnc4gveFhGrJZUUtWcr+tFrcoSmr4W9gkDFCo
         EZXD1VWn0Au8tNYaTgWRn0xXCZZa7kCnkq6x+M10fCUpGOu2l2Lx9BHjdjG8+Pr03vC2
         deouL3Sf4iv93fEXCYDKiBQIQMBqxZgBtSx/IgzreFJyA8JYqpCJVKPUk5QGbXbm0taj
         XGhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794584716; x=1795189516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5iW7hFGFNOx8F7eV0NOM/A0yCVzQynJGDZ1MOVXip8=;
        b=gtoyXS8sibSv91jyE0d+glz/dkfX28fQnlRJfDZ21x/tgcZ/MQ3lgEAicEY00w1TJ4
         d6YUH6TKoCwrqnkEWH0EEtRkWkPomyRqgPjOThGDsXe0d4xgiOrdZEAJJ8AP8J+kNK/H
         WiPI4WSLx9ms4Xu9VuxmhhUYC69nUkYpxiaSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584716; x=1795189516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5iW7hFGFNOx8F7eV0NOM/A0yCVzQynJGDZ1MOVXip8=;
        b=WJgwtVvTpCbrCCnEHrFH5hv5DJMP9V8Pt0MLI2L1gaB9E/XOsoSwgPTrPSg+zCU/qi
         XSVDPhMZZOuDHw4HZb8vjH7nGexc9D8zfxGmNTyS6UhWILyYohzvx3UofhgNR3IZ+zm8
         gIdrXN5gFajfUpsD6csi8DsNaenEMW2FWYmMU62slJlZ/+jpHUMJTBZRdtfaTfCapBwX
         kkMn1a/D0CI16LUBKBOuEis3IqtbZRq8A/ku+UeNmlMsa/No2Rl5Qm6DJWQ5CWnSS8T7
         w+UQpnUICJv1DMnjlo3zga6dSwWgZ/07Z+1B+wXjJuYn+OusWjxBLUNBeYl+sA3pZm7a
         BupQ==
X-Forwarded-Encrypted: i=1; AL+hErHTGvBQPVNlfus3JRH+3wPvAfNdGeMQo2qgQZCa+RJ86FD+EhlF8bqdfDeR6YPVMty+CvSxYwYqn0e1RGr+q30=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FJkr30Mh1Ih7DjX2jNivgqsQx8qBTDLIAGby4ZoMS/03WNMoE
	dJ1B7HSb22Pe04xYc8jy1sjqa7/wyKbAxQAZMLyC7awCYmhQhoQq3LtKO1ZEzJD3qTDEO17/nW9
	xNEF+J9Ln8r7JIbuYBOIpD4uO47DHvzKWh+qNeRFH
X-Gm-Gg: AYBFou0II22Y+WxadigaB5ZEetWom+L/2Is1z1IyMwxoryRcp0Wty7TyzjouZsqz/4Q
	Cf4vew/r8zjd31xmje5bE1WzQwon9tJsVAK2hEm04dag2QzWcsRUQdwRt7JdRCnr1IOPVGjhIqk
	OlkBCoDbT3iEtwZvlWzkEELe9Aaos3KT2D04+RW4DUNWW5fwoz5XRmrueyfnHPUNw+ZQf2asy4o
	Z+8QB5vH207XElawwZvfvmvMtgjBgn904RxkCklwPGyk8099OoqMij7XkWHydB2NqnazCKh1ebP
	cNugJGiHuR5hxui76XK9r82cnRJjFSLYjvZex74P2D+F9t7vfxvmSVAcmXjGtDE15p7DBYAVNYm
	uP4AtE2s49NB0o4je0dVt7/eKeR7/GzeHXar22OcBPmq0H9MUJ0hSf+f/X04IqnDJ8jzs4R53Kg
	KX1Mr6mNA3cWv/srU=
X-Received: by 2002:a05:6a00:1821:b0:89f:3f60:cd81 with SMTP id
 d2e1a72fcca58-8beb753c09fmr3091922b3a.51.1794584715692; Fri, 13 Nov 2026
 07:45:15 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-1-toddfreed@meta.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 13 Nov 2026 10:45:03 -0500
X-Gm-Features: AclHuK-0_XHEf697Be0EzhcTRZNub2trE33MmnEGFo9sAnvUacsR3JeRnWq8RJM
Message-ID: <CAM0EoMnPM54re5-WKyWgwyoz0cn1uGT6=E96OBG2-4m7M+kx7g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Todd Freed <toddfreed@meta.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
	John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Wei Wang <weiwan@google.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:56=E2=80=AFPM Todd Freed <toddfreed@meta.com> wro=
te:
>
> psp associations today are bound to a tcp socket when created. traffic
> on that socket is encapsulated in transport-mode psp, and encrypted.
>
> this series adds associations which aren't bound to a socket, which
> allows psp encapsulation and encryption to be applied to forwarded
> traffic. you can use this to transparently apply psp tunnels to flows,
> with help from userspace to manage the tc rules and orchestrate key
> exchange.
>
> the lifecycle of socket-less associations is managed over the psp
> netlink family. socket-less associations are stored in a small registry,
> and are addressable by id. the registry does not contain socket
> associations.
>
> socket-less associations are on the device's association lists, like
> socket associations. rx ones are therefore marked stale by key rotation
> in the same way. in this series, nothing acts on socket-less rx
> associations on key rotation. instead, userspace should replace decap
> rules for a SPI before its device key has been rotated twice. a
> follow-up will bring enforcement.
>
> series structure,
>
> 1, 2/ prepares psp to work with non-tcp packets
>
> 3, 4/ adds the netlink commands for managing socket-less associations
>
> 5/ adds a METADATA_PSP dst which carries the socket-less psp association
> on an skb for tx, and the transmit checks for it
>
> 6, 7/ keep mirred and bpf from sending decrypted skbs from egress to
> ingress, since skb->decrypted depends on direction
>
> 8/ limit time-wait psp socket validator to sockets actually in
> time-wait. the new psp actions check for presence of the validator
>
> 9/ adds the act_psp tc actions, psp encap and psp decap. in software,
> encap is egress only.
>
> 10/ adds flower matches on psp header fields, for rx matching
>
> 11, 12/ add drv-net tests (netdevsim and hardware)
>
> 13/ makes tc-testing run dependsOn probes outside the test namespace,
> where they currently always fail
>
> 14/ adds tc-testing tests
>
> 15/ Documentation for socket-less psp associations
>
> a following series adds hardware offload of the psp actions and flower
> matches, psp tunnel mode (which is offload only and therefore not
> included here), encap on ingress (also offload only), and the mlx5
> implementation for switchdev mode. It's available in the tree below.
>
> relation to the psp fixes in net:
>
> this series is based on net-next, and overlaps with "psp, tls: don't
> send offloaded contents in cleartext" in net:
>

I looked at the net/sched bits also looks like the two sashikos
already caught at least two issues i would have brought up. I have
started a test run on our test system to see if anything pops up; i
dont suspect anything will show up, but if it does, I will followup to
this posting.
My suggestion is you address the issues brought up by the sashikos and
spin v2.  I will review when you post a v2 and possibly add my
reviewed-by.
In v2:
If you have, or can capture, the decapped-GSO packet shape that leaves
the L4 header non-linear (gro_cells/vnet_hdr decap bridged to the
act_psp
egress), attaching it to the v2 would be useful evidence for the GSO fix.

cheers,
jamal

>  https://lore.kernel.org/netdev/20261111001831.3710881-1-toddfreed@meta.c=
om
>
> when net is merged into net-next:
>
>  - net/psp/psp_main.c conflicts around psp_dev_encap_ok(), which both
>    add: net's only allows tcp, this series' (patch 2) takes any l4
>    protocol. keep this series' version of the function, and its
>    comments above it and above psp_dev_encapsulate().
>  - tools/testing/selftests/drivers/net/psp.py and
>    tools/testing/selftests/drivers/net/config conflict: keep both sides
>    (imports, constants, the list of test cases; the NET_ACT_* options).
>
> relation to the netfilter fixes in nf-next:
>
> packets which a psp device decrypted don't have to end in a local psp
> socket. they can already be forwarded or bridged today, but with
> socket-less associations that is the intended use, e.g. a router that
> decaps and forwards. netfilter handles two cases itself, outside the ip
> stack paths which the net series fixes, and would send such a packet's
> decrypted contents in clear text:
>
>  - the bridge refragments packets which bridge conntrack reassembled
>    (br_ip6_fragment(), nf_br_ip_fragment()), without the check of "net:
>    don't fragment decrypted skbs".
>  - the reject code builds its own icmp errors and tcp resets
>    (nf_reject_skb_v4_unreach() and friends), without icmp_send() and
>    icmpv6_send(), which the net series' icmp patches cover.
>
> a separate series to nf-next applies the net series' rules to both:
>
>   "netfilter: bridge: don't refragment decrypted skbs"
>   "netfilter: reject: don't reply to decrypted skbs"
>
>   https://lore.kernel.org/netfilter-devel/20261111003111.3826942-1-toddfr=
eed@meta.com
>
> it doesn't depend on this series, and the two don't conflict.
>
> trees:
>
> the full tree, with the net fixes, the nf-next series, this series and
> the mlx5 offload series, and the conflicts above resolved, is at:
>
>  https://github.com/toddfreed/psptc branch psptc
>
> iproute2 tree, with support for the psp action and the psp flower
> matches, based on iproute2-next. the selftests need it:
>
>  https://github.com/toddfreed/iproute2-psptc branch tc-psp
>
> testing:
>
>  - netdevsim: drivers/net psp.py passes (57 tests), and tc-testing
>    psp.json (17 tests).
>  - mlx5 (ConnectX-7, FW 28.48), two hosts: drivers/net psp.py passes:
>    46 pass, 8 skip (GMAC versions not supported by the device),
>    3 xfail (netdevsim only).
>  - each patch builds without warnings with gcc and clang, allmodconfig,
>    W=3D1.
> Todd Freed (15):
>   psp: get netns from net_device instead of sock
>   psp: take the psp nexthdr from the packet on encap
>   psp: declare psp_assoc_set_tx() in psp.h
>   psp: add support for socket-less psp associations
>   net: add METADATA_PSP dst to carry a psp association on an skb
>   net/sched: act_mirred: don't send decrypted skbs from egress to
>     ingress
>   bpf: don't redirect decrypted skbs from egress to ingress
>   psp: only give time-wait sockets of psp connections a validator
>   net/sched: add act_psp for psp transport mode
>   net/sched: flower: add psp_spi, psp_ver, and psp_dev matches
>   selftests: drv-net: psp: test socket-less associations and the tc psp
>     action
>   selftests: drv-net: psp: test that software encap on ingress drops
>   selftests: tc-testing: run dependsOn probes outside the test namespace
>   selftests: tc-testing: add tests for the psp action
>   Documentation: networking: psp: document socket-less associations
>
>  Documentation/netlink/specs/psp.yaml          |  98 ++-
>  Documentation/netlink/specs/tc.yaml           |  14 +
>  Documentation/networking/psp.rst              | 139 +++-
>  MAINTAINERS                                   |   3 +
>  .../mellanox/mlx5/core/en_accel/psp_rxtx.c    |   2 +-
>  .../net/ethernet/mellanox/mlx5/core/en_main.c |  33 +
>  drivers/net/netdevsim/psp.c                   |   2 +-
>  include/linux/skbuff.h                        |   4 +
>  include/net/dst_metadata.h                    |  19 +
>  include/net/flow_dissector.h                  |  18 +
>  include/net/psp/functions.h                   |  91 ++-
>  include/net/psp/types.h                       |   1 +
>  include/net/tc_act/tc_psp.h                   |  23 +
>  include/uapi/linux/pkt_cls.h                  |   6 +
>  include/uapi/linux/psp.h                      |   6 +
>  include/uapi/linux/tc_act/tc_psp.h            |  28 +
>  net/core/dev.c                                |  48 +-
>  net/core/dst.c                                |   5 +
>  net/core/filter.c                             |   9 +
>  net/core/flow_dissector.c                     |  27 +
>  net/psp/Makefile                              |   2 +-
>  net/psp/psp-nl-gen.c                          |  60 ++
>  net/psp/psp-nl-gen.h                          |   8 +
>  net/psp/psp.h                                 |   7 +
>  net/psp/psp_assoc.c                           | 120 +++
>  net/psp/psp_main.c                            |  54 +-
>  net/psp/psp_nl.c                              | 261 ++++++
>  net/psp/psp_sock.c                            |  32 +-
>  net/sched/Kconfig                             |  13 +
>  net/sched/Makefile                            |   1 +
>  net/sched/act_mirred.c                        |   6 +
>  net/sched/act_psp.c                           | 439 ++++++++++
>  net/sched/cls_flower.c                        |  64 ++
>  tools/testing/selftests/drivers/net/config    |   5 +
>  tools/testing/selftests/drivers/net/psp.py    | 750 +++++++++++++++++-
>  tools/testing/selftests/tc-testing/config     |   2 +
>  .../tc-testing/tc-tests/actions/psp.json      | 459 +++++++++++
>  tools/testing/selftests/tc-testing/tdc.py     |   2 +-
>  tools/testing/selftests/tc-testing/tdc.sh     |   1 +
>  39 files changed, 2812 insertions(+), 50 deletions(-)
>  create mode 100644 include/net/tc_act/tc_psp.h
>  create mode 100644 include/uapi/linux/tc_act/tc_psp.h
>  create mode 100644 net/psp/psp_assoc.c
>  create mode 100644 net/sched/act_psp.c
>  create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/p=
sp.json
>
>
> base-commit: ed04b202027249e2769420893220f54a56e0c59a
> --
> 2.53.0-Meta
>
