Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2F8232395
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911295; cv=pass; b=C9wSgIOhqvL3zTNbD64F+x4/D2jXJRs/1seVhGtifCGsEk9/slcZdxtuiC5Hy1jfZYL0zRy6nYCTZJ5A+hhZWa6vpTWnFj5hyvuse3vhR2PvkN+9NoFeSe/9esk4MJabaknFCneojMedtJm+E2lUDwKGj5kj+HNkjlQOZewBVZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911295; c=relaxed/simple;
	bh=DminP7KHVm63UIC2HtxfneHs0LQ298REtw9Ib4YAqLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbO/b/XhMWIvwk6PvLuerGnrM4MifNMbrtIohhRZzUN3U9w9v8y9bjpw858hwc18BcrjNoiuPpxLlmj4CViX0eyaIOnLbnj+S2hnytyM/hEJ23IB1Fc9OhvCUDCGjW25nILuJ8mWSFs5qGxf0iAjGfBvCNbKAYiWFlh8U+xGtVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjbAiS4k; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjbAiS4k"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so21624415e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 09:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777911292; cv=none;
        d=google.com; s=arc-20240605;
        b=LiyOSOK5nCpSWlvvgq4EukHtsPBIE4i3z0nfc38wp2fLJ0Mkc14cHi3a403dBXf9r6
         3rcx/6oC2e6llC6Znk3DYaX0bHrhZcMpSmZoUIu9zEbUTPrpd9OW/UyPrdIfMzHkmLsl
         ASwyxna3VIHxYAlYvu4nP3cFLmOg5sKZtPTTIsOVB8nMP60faDpVuXwKxIIUsmXVBSFt
         RPE6BRttmxhOJMILxr8qkEXG/g4EKf939L6CMIXlpJDeJQ/FavgyqGX4Xcpe2vCyyov5
         BZfMnTqLW4ScLo1O/9t6lpwk5jsTpM/v7ABNrSWqwwrBrj+V94iFIaM8d8wY2WyzeEqe
         OyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uctyhl2fep2pE4Eu8P5giabdChdRC1urKFD3GIrdlNU=;
        fh=QBQ7lynH/7LE4LwfEYFFtETbCBSQms5knMPY5lyRNrU=;
        b=d35amBU5+WAJJ3F8lAAwsiNvrXeueE/vb2GgkEH4sQBrOYNSE5eikEc4CU/IYyFEfp
         pMDo5Y1rbyKZaLSZqsbxyh2/+RGFoB2ZtKQpI0YccWDv3u4C0kt+3A4PToJ415PeCgIg
         +A/W06f0as6nHbm9fvRoAHOPr6sudNc8rnHg5f9A5OtRcyVtYcZVhHrOjmVG1MMJEoVp
         vmcUyEs8m+BEmOCXN1voAnhUqnbgItFvnADXRYZ6LVvVcnKdbGyt4Jy7lEqVUxU2ofXK
         ruhrXlaUwH5hTUQ4DozGiMN/l74ImSxKy2eARKUgAU/6Zmssu5PtRud9+oXktZEdBZoP
         +LIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777911292; x=1778516092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uctyhl2fep2pE4Eu8P5giabdChdRC1urKFD3GIrdlNU=;
        b=jjbAiS4ktJYA3tfqTyKCsL/krzaQwVFF7itDi7cMIYE/nUy7WeASyzpoaR/8ropESt
         Lg7BSaoCPZRY3U2ExIGF+OmHqS6a17Sv/aVAU8/c8/EBbuPS4TBJbntsCGAM/N0BsPQ3
         B/+1GEoGII8l6UGFY+YSbO3AZ4uad3E/nSAebqgkeT0K5G9ZiwsBSImIPc5wKQmy1+OX
         o5Uw7TEuDM5P5qfZlaOTyzi41sEhsvy+tUbHxexRfq9WmYm9ezyokBCiLv5DWwi0gfHS
         yYku8Duvfp5wBSrKSRVkxKQ+6BtxELaINoMUpWayvHBzdaXon4c3GDrEBkkqOfEIfp5g
         d7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777911292; x=1778516092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uctyhl2fep2pE4Eu8P5giabdChdRC1urKFD3GIrdlNU=;
        b=aG1psZsilCBLLmnxuzFgdV2aM3rnJe4jGdp5+xdSCjiEfgPfR6Ss2PEpmNq3jaxJRB
         1KW1051EsvkJtQiFQPuPObc4ljGIkmkpPsNwH4WipOdqGl/y5KuITgDIOd0p7hqP1QYE
         qw99HeIqSZvWr9aHUrpwGA5tSgUPx+gsFOV6Hl1wrliaT/zOyU0UiQOhBw7d17eKxpZM
         bLlAamKh5YtsfWxUtRV6TjN2I9MemqS/0EH2i4JuqTonVwu7hqEizoqslkKJbqBlgitD
         YqQWdyWWEVFJ/Zgvx9IBF3OPXX86M+9JoKBvX7JxLPCVl8WUotuGIabxFDHONNJSr2qt
         pabA==
X-Forwarded-Encrypted: i=1; AFNElJ+Cf+9ZdGuSwCbC7M4eXfx6eMF9jusNhTvmqZ6buvdGYct4MnNr7ITDe2KoAFlFmHymvGY6VlXDZ02l2x6uUZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDtFg0qKGwqLeefcAStsBDptfUs+VfS+bbT5PdbjDRSGeTTjy
	0WYBbAsuUAD62rUp5AbG0aWcAjTwXV+oK16s8YkPl146tyi7wuZhSegK28kA80PF7ufrEdZKlk4
	Tu7v7Py35VtWs6AvVfqlQwBVRSGc0qPs=
X-Gm-Gg: AeBDietcoPXYMTQYG1YCbrV6DQfWXnrQ/fA8kR06J6SLW/JGJgZhHrZdjnzfs22W+P+
	7iUheRIQqfGy97cGIQ9AG2vPK9thFkMZzqo/Zx6Pggb2SOIL+L/eIGrIAhCkfanPuuu8MYTMJwF
	07fh29nvC6NihJIeGOJGOMQOSimqaK+xJXbdbrEJlNzGoW1KCPHnqD7qJbGrGFQDVrkNznxwjwi
	NKgO6a/WtpW+H+fRsgQMmQ4899PU1rYzentgWKGjUuMgMeFpIsq5gmJxHTww+B36L30RfFTr7qT
	QHaHVifAoEc1uwW61g==
X-Received: by 2002:a05:600c:c170:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-48a9852e515mr163196585e9.3.1777911291577; Mon, 04 May 2026
 09:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501133924.3100680-1-houminxi@gmail.com> <20260501133924.3100680-3-houminxi@gmail.com>
 <f7tlddzxjex.fsf@redhat.com>
In-Reply-To: <f7tlddzxjex.fsf@redhat.com>
From: =?UTF-8?B?5L6v5pWP54aZ?= <houminxi@gmail.com>
Date: Tue, 5 May 2026 00:14:25 +0800
X-Gm-Features: AVHnY4KaIFLNi-Dh9lc5p5n5R2gxHKTnaPAl-7T1qHjZz0uGcOSuz6uNUhVgKIk
Message-ID: <CAJ0BgHdsS1sykUqhDY2rzucmnszTLbF11y4cvUoD+mOjp7jO5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: openvswitch: add pop_vlan test
To: Aaron Conole <aconole@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dev@openvswitch.org, Eelco Chaudron <echaudro@redhat.com>, 
	Ilya Maximets <i.maximets@ovn.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

Thanks for the detailed review!

> Weird that this is here.  All other tests would also not work if there
> were no netns or OVS module.  Why were these added?

You're right, the modprobe and netns pre-checks are unnecessary.
run_test already gates on the module, and ovs_add_netns_and_veths
will fail naturally if netns isn't available.  I'll remove both
pre-flight blocks in v5.

> We don't like to make extra files when not requested.  For example,
> this is making some pcap file but do we need it?

Agreed. The pcap capture was overly cautious, ping success/failure
already tells us whether the VLAN tag was correctly stripped (or not).

> We also have a specific spawn function `ovs_netns_spawn_daemon` that
> should take care of cleaning up at least the PID.

Understood. I'll use existing helpers rather than rolling custom
infrastructure.

> Do we really need these tcpdump checks?  The ping commands above
> should already capture when we are expecting tagged / untagged
> traffic.

Makes sense.  In v5 I'll drop the start_capture/stop_capture helpers
entirely and rely solely on ping results:

  - Baseline: ping without VLAN flow succeeds (ARP resolution works)
  - Negative: ping with tagged traffic and no pop_vlan fails
  - Positive: ping with tagged traffic and pop_vlan succeeds

This will significantly simplify the test.

I was previously working as QE, so my instinct was to add
defensive pre-checks and packet-level capture for every test.
I'm still adjusting to the kernel selftest convention of keeping
tests minimal and relying on existing infrastructure.

Appreciate the guidance.

Combined with the depth-check removal from patch 1/2 feedback, v5 will
be a much leaner series.

B,R
Minxi

Aaron Conole <aconole@redhat.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=B8=80 23:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Minxi,
>
> Thanks for the test (and the support infra in 1/2).  Questions below.
>
> Minxi Hou <houminxi@gmail.com> writes:
>
> > Add a test for the OVS datapath POP_VLAN action.  The test uses
> > the VLAN sub-interface of a veth pair to generate 802.1Q tagged
> > frames and verifies that pop_vlan correctly strips the VLAN tag
> > before delivery via pcap frame capture.
> >
> > The test has two verifications:
> > - Negative: forward tagged frames without pop_vlan, verify the
> >   VLAN tag is still present on the egress interface.
> > - Positive: apply pop_vlan, verify the tag is removed and an
> >   untagged ICMP echo request arrives at the egress interface.
> >
> > Static ARP entries avoid the complexity of VLAN-tagged ARP
> > resolution (the egress side has no VLAN sub-interface and cannot
> > process tagged ARP).
> >
> > Signed-off-by: Minxi Hou <houminxi@gmail.com>
> > ---
> > v1 -> v2: rebase to latest net-next/main, drop --base=3Dauto
> >
> >  .../selftests/net/openvswitch/openvswitch.sh  | 132 ++++++++++++++++++
> >  1 file changed, 132 insertions(+)
> >
> > diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/t=
ools/testing/selftests/net/openvswitch/openvswitch.sh
> > index b327d3061ed5..cd614ff7b740 100755
> > --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> > +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> > @@ -27,6 +27,7 @@ tests=3D"
> >       upcall_interfaces                       ovs: test the upcall inte=
rfaces
> >       tunnel_metadata                         ovs: test extraction of t=
unnel metadata
> >       drop_reason                             drop: test drop reasons a=
re emitted
> > +     pop_vlan                                        vlan-pop: POP_VLA=
N action strips 802.1Q tag
>
> nit: The whitespace alignment above is slightly off.
>
> >       psample                                 psample: Sampling packets=
 with psample"
> >
> >  info() {
> > @@ -830,6 +831,137 @@ test_tunnel_metadata() {
> >       return 0
> >  }
> >
> > +test_pop_vlan() {
> > +     modprobe -q openvswitch 2>/dev/null || true
> > +     [ -d /sys/module/openvswitch ] || return $ksft_skip
> > +     ip netns add __test_pop_vlan_netns__ 2>/dev/null || \
> > +             { info "CONFIG_NET_NS missing"; return $ksft_skip; }
> > +     ip netns del __test_pop_vlan_netns__ 2>/dev/null
>
> Weird that this is here.  All other tests would also not work if there
> were no netns or OVS module.  Why were these added?
>
> > +     modprobe -q 8021q 2>/dev/null || true
> > +     [ -d /sys/module/8021q ] || { info "CONFIG_VLAN_8021Q missing"; r=
eturn $ksft_skip; }
> > +
> > +     local sbx=3D"test_pop_vlan"
> > +     sbx_add "$sbx" || return $ksft_skip
> > +     ovs_add_dp "$sbx" vlandp || return 1
> > +
> > +     # --- baseline: untagged forwarding ---
> > +     ovs_add_netns_and_veths "$sbx" vlandp ns1 veth1 ns1veth 192.0.2.1=
/24 || return 1
> > +     ovs_add_netns_and_veths "$sbx" vlandp ns2 veth2 ns2veth 192.0.2.2=
/24 || return 1
> > +
> > +     # ARP + IPv4 bidirectional (all untagged)
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return =
1
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return =
1
> > +     ip netns exec ns1 ping -c 3 -W 2 192.0.2.2 || return 1
> > +
> > +     # --- POP_VLAN test ---
> > +     # Register cleanup before creating resources (safe on failure pat=
hs)
> > +     on_exit "ip -n ns1 link del ns1veth.10 2>/dev/null || true
> > +              ip -n ns2 addr del 198.51.100.2/24 dev ns2veth 2>/dev/nu=
ll || true"
> > +
> > +     # ns1: VLAN sub-interface generates tagged frames
> > +     ip -n ns1 link add link ns1veth name ns1veth.10 type vlan id 10
> > +     ip -n ns1 addr add 198.51.100.1/24 dev ns1veth.10
> > +     ip -n ns1 link set ns1veth.10 up
> > +
> > +     # ns2: no VLAN sub-interface. POP delivers untagged frames to ns2=
veth
> > +     ip -n ns2 addr add 198.51.100.2/24 dev ns2veth
> > +
> > +     # veth disable VLAN offload + GRO (ensure kernel software tag pro=
cessing)
> > +     if command -v ethtool >/dev/null 2>&1; then
> > +             ip netns exec ns1 ethtool -k ns1veth 2>/dev/null | grep -=
q vlan-offload && \
> > +                     ip netns exec ns1 ethtool -K ns1veth rx-vlan-offl=
oad off \
> > +                             tx-vlan-offload off gro off 2>/dev/null |=
| true
> > +             ip netns exec ns2 ethtool -k ns2veth 2>/dev/null | grep -=
q vlan-offload && \
> > +                     ip netns exec ns2 ethtool -K ns2veth rx-vlan-offl=
oad off \
> > +                             tx-vlan-offload off gro off 2>/dev/null |=
| true
> > +     fi
> > +
> > +     ovs_del_flows "$sbx" vlandp
> > +
> > +     # Static ARP avoids VLAN-tagged ARP complexity (ns2 has no VLAN
> > +     # sub-interface, so tagged ARP would be invisible to ns2).
> > +     local ns1veth10mac ns2mac
> > +     ns1veth10mac=3D$(ip -n ns1 link show ns1veth.10 | \
> > +             awk '/link\/ether/ {print $2}')
> > +     ns2mac=3D$(ip -n ns2 link show ns2veth | \
> > +             awk '/link\/ether/ {print $2}')
> > +     [ -n "$ns1veth10mac" ] && echo "$ns1veth10mac" | \
> > +             grep -qE "^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$" || return=
 1
> > +     [ -n "$ns2mac" ] && echo "$ns2mac" | \
> > +             grep -qE "^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$" || return=
 1
> > +     ip -n ns1 neigh replace 198.51.100.2 lladdr "$ns2mac" \
> > +             dev ns1veth.10 nud permanent || return 1
> > +     ip -n ns2 neigh replace 198.51.100.1 lladdr "$ns1veth10mac" \
> > +             dev ns2veth nud permanent || return 1
> > +
> > +     # --- Negative check: fwd without pop_vlan, VLAN tag stays ---
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(1),eth(),eth_type(0x8100),vlan(vid=3D10),encap(e=
th_type(0x0800),ipv4(src=3D198.51.100.1,proto=3D1),icmp())' \
> > +             '2' || return 1
> > +
> > +     local pcap_no_pop
> > +     pcap_no_pop=3D$(mktemp --suffix=3D.pcap)
> > +     on_exit "rm -f $pcap_no_pop"
> > +     ip netns exec ns2 tcpdump -nei ns2veth -w "$pcap_no_pop" -U &
> > +     local tpid_no_pop=3D$!
> > +     on_exit "kill $tpid_no_pop 2>/dev/null || true"
> > +     sleep $((WAIT_TIMEOUT / 5 < 2 ? 2 : WAIT_TIMEOUT / 5))
> > +
>
> We don't like to make extra files when not requested.  For example, this
> is making some pcap file but do we need it?  We also have a specific
> spawn function `ovs_netns_spawn_daemon` that should take care of
> cleaning up at least the PID.
>
> > +     ip netns exec ns1 ping -I ns1veth.10 -c 3 -W 1 198.51.100.2 \
> > +             >/dev/null 2>&1 || true
> > +     kill $tpid_no_pop 2>/dev/null || true; wait $tpid_no_pop 2>/dev/n=
ull || true
> > +
> > +     # assert: VLAN tag still present (no pop_vlan in action)
> > +     tcpdump -nr "$pcap_no_pop" 'vlan' 2>/dev/null | grep -q . || {
> > +             info "FAIL: negative check: no VLAN tag (expected tag pre=
sent)"; return 1
> > +     }
> > +
> > +     ovs_del_flows "$sbx" vlandp
> > +
> > +     # --- Positive: pop_vlan strips tag ---
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(1),eth(),eth_type(0x8100),vlan(vid=3D10),encap(e=
th_type(0x0800),ipv4(src=3D198.51.100.1,proto=3D1),icmp())' \
> > +             'pop_vlan,2' || return 1
> > +     ovs_add_flow "$sbx" vlandp \
> > +             'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return =
1
> > +
> > +     local pcap
> > +     pcap=3D$(mktemp --suffix=3D.pcap)
> > +     on_exit "rm -f $pcap"
> > +     ip netns exec ns2 tcpdump -nei ns2veth -w "$pcap" -U &
> > +     local tpid=3D$!
> > +     on_exit "kill $tpid 2>/dev/null || true"
> > +     sleep $((WAIT_TIMEOUT / 5 < 2 ? 2 : WAIT_TIMEOUT / 5))
> > +
> > +     # ping reply unreachable: ns1veth.10 only accepts tagged frames,
> > +     # ns2 sends untagged reply -> dropped by ns1veth.10.
> > +     local ping_rc=3D0
> > +     ip netns exec ns1 ping -I ns1veth.10 -c 3 -W 1 198.51.100.2 \
> > +             >/dev/null 2>&1 || ping_rc=3D$?
> > +     kill $tpid 2>/dev/null || true; wait $tpid 2>/dev/null || true
> > +
> > +     # ping failure is expected (reply path asymmetric)
> > +     [ "$ping_rc" -ne 0 ] || \
> > +             info "NOTE: ping succeeded unexpectedly (reply reached ns=
1veth.10)"
> > +
> > +     # assert: no VLAN tag (POP succeeded), untagged ICMP echo request=
 arrived
> > +     tcpdump -nr "$pcap" 'vlan' 2>/dev/null | grep -q . && {
> > +             info "FAIL: POP_VLAN: VLAN tag still present"; return 1
> > +     }
> > +     tcpdump -nr "$pcap" 'icmp and icmp[icmptype]=3D8' \
> > +             2>/dev/null | grep -q . || {
> > +             info "FAIL: POP_VLAN: no untagged ICMP echo request"; ret=
urn 1
> > +     }
>
> Do we really need these tcpdump checks?  The ping commands above should
> already capture when we are expecting tagged / untagged traffic.
>
> > +     return 0
> > +}
> > +
> >  run_test() {
> >       (
> >       tname=3D"$1"
>
