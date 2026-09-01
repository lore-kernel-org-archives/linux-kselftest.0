Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAC471CF8
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250949; cv=none; b=jwBdHWMhG/r5KhGn1v5F6fbNV4Z/e2PK0jH/29WB6psnRoNyeebgCQe4C59XQQqTODWzAlPrN9fyf4LQRdd3nryiw1vXalSxYTDeqyAGKuXMNUf8v6bxO8mU25KnjpwZQ4JXNcTYKD9O363vDAlZZhYhZhIFUem77JPIkRb9KdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250949; c=relaxed/simple;
	bh=DhMUVcNEJUvxZHDXVLf1wEWgegLaaV4GJj/LlpQClbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCNEzuUyCibBZWA/0GbpG/ktYa+s9ofLNPe3F2MeQhn4FL24u9z+fxbJ1qA02mRk26/TUO4RbDfwpNP7slFQ/WoJVhGUwM8ej5ty6+IG2CmN7hTkx0J6TwtQ+vU6M3djexSMOQRhxcoj6PnlM4YfPvT8Gl/wdpZ8sC/9XrmWCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP4suqdU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP4suqdU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484415c8cb1so672323f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788250945; x=1788855745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AXkSQETkKiUigG2NLfDoqqnUq8NIuODErpfVO/TGHg=;
        b=mP4suqdUfeEd7F03MXAVzvmu/U8rWLF1gpPYV42QCKWsLXgqyibK7fcZTCbwpVCPtt
         j2Jaoyvs7ImzZpLCbZxveKFqZisEN7OiwSQoNWfcu7CL2pCFI4N5vf9lBTUiAL6KbnV3
         IO2VaDeQPhy+4z3KmCj2N/aibluiWXAiYKC5Jl5cETrO48HInwLRYR8vFr/SQyPOnYX9
         EtE6g7LtrnxGvPljP2OlmrKd8q/CHvSUhssPbyoCOOpayKdHE5aOn9LQxPePE9GJVllt
         qX26U4lgKSmVmZAUnunXk62PyZgdzZrNqDK9v9Qo2rd6tiHlj+inDVso6DAfahDBENNc
         h8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250945; x=1788855745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5AXkSQETkKiUigG2NLfDoqqnUq8NIuODErpfVO/TGHg=;
        b=W8oLFHhCrEZmHLGqUCZX8V3lJoU01CTldGawUGp3/z8ecxgcUJEWKQ3LdAn0Ytd8HD
         KTEeglgeeJ2UDVfSXJivSGbkbkeDj61U0kPaqIuyB9wqtdBRiUbTHo0AdCj5BtI8vxGU
         SzlXM+3kPvKLu/mdo3CBRXwb7A12ic1NPCmhRmBfBhKqD0n6VNRilFEWzzqUYRhOTGjE
         0DGj3QeuWpNseMMWSLHGhShHIEy/afFFieE8OqObbFmQDISDroWLhYNfC47YaYNRoCrU
         1LNUQ0HlVlpWbq9x/SQM3EK5hggpn9v3Qxi9r+t0XhOKeS7O8Tb9WRCIa+Q9RffPAScR
         tYwA==
X-Forwarded-Encrypted: i=1; AHgh+RrEZipHjCx0BhYkXclddfl/F65j3UJZ5jja9+gQ843XIhrc8DHXkR5wmajPefPp4GqhRyHvlnjvFMdL5eK7Ce4=@vger.kernel.org
X-Gm-Message-State: AFuF++lCLcJMC12z5bGatSDmwlt3NvikYf5VbKqkzy8Zz+uyz9HOXuKg
	YyHGYdqJYUf0n0ZPj9GKlfHDwGYfNrMon3A2Oq2G1XQaPKbOZFbXzDTl
X-Gm-Gg: AR+sD11HmZ7b0GFLarNMgorj0m6p+HRdgbPFBK0zX7eGvnjudpVerNieCLxeNyave0I
	q+6+OkqtnUp3UxF5u4i+dwAYnIy9/C9OR/axUOsPJtjIWLf9icww3HAh88JheUeS5WONek77aOd
	qzqo268l+LssPEHyblA1JXcTOTyxTSlMazhhTTmXhh0xz0gqhmJtvR7zEfZUo4JzR81kq59U3IJ
	X7gZ/2mKsXfIsQpIKjaaxTODx3XGCpzRbGgW+kRIvTN8ABDUPkISOZKoEEytzADE+jnEwO0jMtY
	pi9dsq363MIOq8dwPG3dym+OE+z0jkY50ZGRQcPRNsQ6FRt2EwMJRUyW4Asd+MuJUHUf2/QP8eB
	SYpRFEGM02gbrXfsYenJvPl2cML1nPvhydxvgXnCN8iSvqCfsZGaWG6/XYthvVUy/1Jh/LCofZu
	M2Bjnx/PF6ufSyqp8cH8fxsB8Ig3SMluFUzfA5Sv1auiF2Y1VscS1x7Dav+fW9s3A=
X-Received: by 2002:a05:600c:c11c:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49cdc422c5bmr111209645e9.2.1788250945051;
        Tue, 01 Sep 2026 01:22:25 -0700 (PDT)
Received: from gentoo ([45.150.111.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8b9a2efsm155590875e9.3.2026.09.01.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:22:24 -0700 (PDT)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	Laika Price <laikabcprice@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Aaron Conole <aconole@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3] ip_tunnel: drop stale dst from generated PMTU ICMP replies
Date: Tue,  1 Sep 2026 08:17:09 +0000
Message-ID: <20260901081825.287173-1-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110224.GA753154@shredder>
References: <20260614-master-v3-1-9f5060ba1ed1@gmail.com> <20260616110224.GA753154@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

Since this series hasn't moved since June, and I've been debugging the
same code path independently, sharing what I found in the hope it
unblocks things. The kernel fix should of course remain Laika's;
consider this supporting data.

> 1. Please split the selftest fix to a separate patch (patch #1), explain
> why the test is currently passing and why it's going to break with the
> subsequent code change.

Below is that explanation (1-3), plus history (4) and a reproducer for
a July 2025 field report of what looks like the same regression.

In short: there are two independent defects. The stale dst in the
reply builder (what this series fixes), and a selftest stimulus that
can only pass while that reply is *not* delivered -- so any correct
kernel fix turns the bridged subtests red until the test is fixed
first. Everything below was measured on net at v7.2-7323-gf967455fb2a5,
under virtme-ng.

1. Selftest problem

In test_pmtu_ipvX_over_bridged_vxlanY_or_geneveY_exception():

    run_cmd ${ns_a} ${ping} -q -M want -i 0.1 -w 1 ... || return 1

With a deadline (-w) set, iputils exits on the first socket error
(main_loop(): "if (rts->deadline && rts->nerrors) break;"), before any
echo reply can arrive, and finish() then returns non-zero because
nreceived is still 0. So this line fails exactly when the ICMP error
is delivered, and passes when the error dies in the kernel. The ns_c
line just above already uses -c 10 and survives the delivered error:
it reports "+1 errors" in its statistics yet exits 0.

2. Kernel side

When iptunnel_pmtud_build_icmp{,v6}() gets the skb it doesn't touch
the attached dst, so on reinjection skb_valid_dst() is true, input
routing is skipped, and the reply is dispatched through the stale
dst. What happens next depends on the dst:

- Locally generated traffic (a socket on the bridge host itself):
  the dst is an output route, whose ->input is still the
  dst_discard() stub from dst_init(). The reinjected PTB is freed
  silently. Verified with bpftrace on kfree_skb().

- Forwarded traffic (the WireGuard setup from the original report):
  same mechanism up to the ->input call, but here the dst is the
  forward route, so ->input is ip_forward and the reply is forwarded
  along the stale route -- out the original egress, into the VXLAN
  instead of back to the sender. That is exactly the reported
  symptom. Reproducer script for this case is attached at the end of
  the mail.

  In the reproducer every oversized DF packet is lost with zero
  errors on the sender's socket -- all feedback channels are closed.
  The router's own Frag Needed never fires because the forwarding
  path deliberately ignores learned path MTUs
  (net.ipv4.ip_forward_use_pmtu=0 by default), and the route
  exception written by skb_dst_update_pmtu_no_confirm() is readable
  only by local sockets for the same reason. Setting
  ip_forward_use_pmtu=1 takes {10 tx, 0 rx, 0 errors} to
  {10 tx, 7 rx, +1 error}, which pins the mechanism -- but it is
  not a fix: under default policy the generated PTB is the only
  feedback channel this sender class has, and the stale dst kills
  exactly that channel.

- IPv6 differs in shape, not outcome: the unicast branch of
  ip6_rt_init_dst() sets ->input = ip6_forward, for output and
  forward routes alike -- and ip6_rcv_core() takes IP6CB(skb)->iif
  from the stale dst's device, so the redirect precondition
  iif == oif holds by construction. Measured with an on-link stale
  route: forwarding=0 drops the PTB at the forwarding check;
  forwarding=1 emits a spurious ICMPv6 Redirect (target equal to
  the node's own address, PTB quoted inside) and then dies
  resolving that same address as a neighbour. With a gatewayed
  stale route it should misroute out the original egress like IPv4.
  Never delivered to the sender either way.

3. Why the tests are green today

- skb_dst_update_pmtu_no_confirm() runs before building the reply
  in skb_tunnel_check_pmtu(), so for a local sender the route
  exception is created whether or not the ICMP ever arrives -- and
  the test only asserts the exception's existence.

- With br_netfilter loaded, br_nf_pre_routing_finish() replaces the
  stale dst on the reinjected PTB (it re-enters through the vxlan
  port) with the bridge's fake rtable, which is dropped again before
  ip_rcv -- so the PTB is routed from scratch and delivered, and
  then (1) turns delivery into FAIL. Reproduced with a couple of
  commands:

    modprobe br_netfilter
    ./pmtu.sh

  All 16 bridged subtests fail on a vanilla kernel. A fixed kernel
  fails this recipe identically -- which is the point: the test has
  to be fixed in any scenario. The same happens in a plain
  sequential selftest run, because fcnal-test.sh loads br_netfilter
  and does not unload it.

4. History

The root cause is 8930424777e4 ("tunnels: Accept PACKET_HOST in
skb_tunnel_check_pmtu().") combined with 4cb47a8644cc ("tunnels:
PMTU discovery support for directly bridged IP packets").

4cb47a8644cc shipped the builder with

    if (!reply || skb->pkt_type == PACKET_HOST)
        return 0;

so replies were only generated for bridged-through L2 frames. Those
reach the builder with no dst -- they never visit the host's L3 --
so the missing dst invalidation was unreachable, and the selftest
(df40e39c0df0, same series) was written against that semantic: its
-w 1 line could not receive an error by design.

8930424777e4 (6.15-rc1, since backported to stable, at least
6.1.135 per the Debian report) removed the pkt_type check. From
that point on local and forwarded senders -- the first callers with
a live dst, attached by the host's own routing -- reach the
builder, the stale dst problem became reachable, and the selftest
assumption was silently invalidated.

This matches Debian bug #1108860 [1] (July 2025): the same
VXLAN-over-WireGuard breakage in production, bisected to
8930424777e4, revert confirmed to fix it. That thread ended with a
request for more details and, ideally, a self-contained reproducer,
and stalled -- the script below is meant to be that reproducer. The
two reports look like the same regression, so I'm Cc'ing the people
from that thread.

5. What I suggest

- Selftest fix first, as its own patch -- otherwise any correct
  kernel fix turns the bridged subtests red: switch the -w 1 line
  to -c 10, keeping "|| return 1". Measured on both a masked and a
  delivering kernel: without a deadline the first error does not
  terminate ping (it consumes -c budget instead), exceptions still
  get created, and the line exits 0 in both worlds. Unlike dropping
  the "|| return 1" guards (the v3 approach), this fixes the
  stimulus while the guards keep catching real breakage. Neither v1
  nor v3 carried Fixes tags; for this patch the lines come from
  df40e39c0df0 and their assumption was invalidated by
  8930424777e4, so dual Fixes tags would route the backport to
  every stable tree that has the latter. I have this patch ready
  and can send it right away -- it is independent of the kernel fix
  and passes on both kernels -- unless Laika prefers to fold it
  into the series. If I don't hear back either way in a week or so,
  I'll send it on its own with a Link: to this thread.

> This probably needs to be:
>
> if (skb_valid_dst(skb))
>	skb_dst_drop(skb);
>
> Both VXLAN and GENEVE use the dst after skb_tunnel_check_pmtu() when in
> external mode, so you can't drop it unconditionally.

- Can confirm this guarded variant works on both sides: the 16 OVS
  subtest failures from v1 were exactly this metadata issue, and
  with the guard all 16 pass on a guarded kernel; on the bridged
  side the reproducer below goes from 10/0 (no notification at all)
  to 10 tx / 8 rx / +1 error, the error being the tunnel's PTB
  finally reaching the sender. Happy to give Tested-by on a v4 with
  the guard. Fixes-wise: 4cb47a8644cc introduced the missing
  invalidation and 8930424777e4 made it reachable (and is what
  Debian bisected to) -- dual tags again, since prose in the commit
  message won't route stable backports. Given #1108860,
  Reported-by:/Closes: tags for the Debian report may be
  appropriate.

- The in-tree test cannot catch this bug class at all: it only
  asserts the exception, which the silent update always creates.
  The reproducer below is nearly a pmtu.sh subtest for the
  forwarded case (assert that the PTB actually reaches the sender);
  I can follow up with that as a separate patch.

[1] https://bugs.debian.org/1108860

------reproducer: forwarded sender, persistent PMTU blackhole------

for n in D A B; do ip netns del $n 2>/dev/null; done
ip netns add D; ip netns add A; ip netns add B

ip link add veth_D-A netns D type veth peer name veth_A-D netns A
ip -n D addr add 192.168.3.10/24 dev veth_D-A
ip -n A addr add 192.168.3.1/24  dev veth_A-D
ip -n D link set veth_D-A mtu 5000 up
ip -n A link set veth_A-D mtu 5000 up
ip -n D link set lo up; ip -n A link set lo up; ip -n B link set lo up

ip link add veth_A-B netns A type veth peer name veth_B-A netns B
ip -n A addr add 10.0.1.1/24 dev veth_A-B
ip -n B addr add 10.0.1.2/24 dev veth_B-A
ip -n A link set veth_A-B mtu 4000 up
ip -n B link set veth_B-A mtu 4000 up

ip -n A link add br0 type bridge
ip -n A addr add 192.168.2.1/24 dev br0
ip -n A link set br0 mtu 5000 up
ip -n A link add vxlan_a type vxlan id 1 local 10.0.1.1 \
	remote 10.0.1.2 dstport 4789 df set ttl 64
ip -n A link set vxlan_a mtu 5000 master br0 up
ip -n B link add vxlan_b type vxlan id 1 local 10.0.1.2 \
	remote 10.0.1.1 dstport 4789 df set ttl 64
ip -n B addr add 192.168.2.2/24 dev vxlan_b
ip -n B link set vxlan_b mtu 5000 up

ip -n B addr add 192.168.4.1/32 dev lo
ip -n A route add 192.168.4.1/32 via 192.168.2.2
ip -n D route add 192.168.2.0/24 via 192.168.3.1
ip -n D route add 192.168.4.1/32 via 192.168.3.1
ip -n B route add 192.168.3.0/24 via 192.168.2.1
ip netns exec A sysctl -qw net.ipv4.ip_forward=1

ip netns exec D ping -c 2 -s 56 192.168.4.1 >/dev/null
for n in D A B; do ip netns exec $n ip route flush cached; done
ip netns exec D ping -q -M want -i 0.1 -c 10 -s 4500 192.168.4.1 || true

  Result on an unfixed kernel, default sysctls: 10 transmitted, 0 received,
  no ICMP errors on the socket, and 10 misrouted PTBs inside the tunnel
  (ns_b IpInAddrErrors +10). Persistent: no packet ever heals the path.
  Mechanism check: sysctl -w net.ipv4.ip_forward_use_pmtu=1 in ns_a, flush
  caches, re-run -> 10/7/+1 error (the router's own Frag Needed takes over).
  On a fixed (guarded) kernel, default sysctls: 10/8/+1, the error being
  "From 192.168.4.1 icmp_seq=1 Frag needed and DF set (mtu = 3950)" --
  the tunnel's PTB finally reaching the sender.
-------------------------------------------------------------------

Thanks,
Yaroslav Dudkov
