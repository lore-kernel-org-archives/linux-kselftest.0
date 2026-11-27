Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817737;
	b=Zh3/1aCkcprX+DmNTBBEw8QMO8kPUPjd+PEW8UMmSGqwwtt5TF89hyEznhUhTXAas/Ef
	 Ywk7QLF9VD1t/k14Ho0sQmX+Pm9BTWyflupUqm4bOZIz99tGMcsjHBXorkF1147I3Dvvt
	 hNMVbhBonj1CNtEa2nwIp3HJnJjrc3A8ckNZT2XGYy/1bvxPuU0dM1EXDWw3KdtvFTXyN
	 F72R8OZxiq8EMe6xmK7O7NVOnvSklsVgyP2X2xsh3a1QRN/KsFcZ+hBnuerXqAQCQ0NUR
	 HxkmsGGQJ9jDgNMB8XxyivsyYGSXYcObBphVRZ22nEmppzPErlKK61Z+W+LgkCG1vdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
	b=dbpnAdCyE2wDvQ5bFodsdXDP2x/14AIV9425sI0SJ6tYoXEHIpAtS+bYlvD9kr36S0eS
	 NMMheJEWgP8LlHLEs5hhMuWRrZICsiwGmq6Cgy/4HJ9/qy5cVbE2uJttww+cHPXrvV9Cn
	 c7BlQB9J4aNxDI8ICqPH8YEPLTcqjl9d4kk+kk4fRiYWZEllnSBkvzO8eg26T/6TciGwp
	 b05Vj8CwSDWxEobygCWs3hdlKpFyLRHBkGJqrHpk2OWP9K5NIL+cwz2VexjzzPyUHr2mn
	 4hdnTi8mCwFZqN7oygKf4pWhUy21dhcFHE19H+TLjW/BW6Iv8vkgIhL41oxClO1ydfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F5606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso74973197b3.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 14:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817736; cv=none;
        d=google.com; s=arc-20260327;
        b=jNVJfNDmuDo2fvRCzNA+ddxngpl3S9gbIcePOfhT+7NGCXH7bUBz8Ma+K64YBM43go
         SvTDbJGrtYk2eidW820UtHRhwETEAGZxwgNhwiUQteyvvz8jPAQdaZGTptaH8KULZyXB
         kwjl2WEsKEILN1Lr8IbGxJ1seftaZxNhaA3GfwlWGFvgDRaZAroV0edxfkjl+qOmJxpk
         bxw+Ze8xVnBisDrnRtJMBPh3sjQqdiNjoOS3PIflfri5J5/fHvBLU2nIfk/Qx09B4kfV
         f/F+mzuZyF/Y1P66BUV1eQfiH69JEVjoAZielsXKDGobY3sn+AW8ScDBaLl1QBCcNgsH
         AZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        fh=If6rjni1hO85BZsi0wrMHGtHvTRWvslpwZH/5E/cnZ8=;
        b=D/p5E/KzvjkwkSZPMQ/P6bGxvwZi+jehFpcnRE92/b/cerfrGTta05BwaqBzA5YTKj
         0wjO/SunLjc2pUEHLEmHfcXIRioddyPzah3rq8ikH/iCnUWuBr67+z/g7PDkM0SAodtV
         PBMjKlPTKcPPv1NoIHucf+TxCkhTvYqMcHrxhuaUPE2+loMSOZNW17tXrRJsf6ARgFvH
         Ud/Yz7iih7EB1w2UEhpQkX15ZDzk9zAhmMqnHaKo+BO0ASywXbsUxJQUAXACQ4362JsK
         33FtlCKL5WaJhcQ5j2zFoasLHn1RJ2jtYvEsVA9kfzZHyGwXnzTA+Gwt+U9BfqaEQ2JZ
         nnIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817736; x=1796422536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=R7L1PNXj/Md5qNgsN/Yom1TwNgr5cwmA81rdx25vyLc840UAih1c8rhCiKCIP4WGOm
         tw2Y0KOLd6rkQSfxmbPft1zsIJ+kM5NOrRHe/Zd2Duz2WLfnMLmPgPvoUz8aiEzeB23Q
         xVUjwqrAYPcRRvOJBgHKOZvZiS5RzLMyCRNYjLoyvUpEs/JkLncF3hIAMGTsYAlHKhjU
         8b/h/dl8zDLt5lyT/y/4XisjzHyiF1e9G1CEvNNcQNIQgK51pNCUqCSkBvEi4SuLYyWq
         6tTF+zEPg8f7SE9XGAUIJCZ1VSUzcE6wbEsbISRNoVEja5MS6sOt5j4BS/ozykdFKoVR
         Cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817736; x=1796422536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=n3jartSzMHEvHoreGInwMBhifFhtIxI7eqdOzH91XvBEo4+eMC5JVVE4XSXNogSQU8
         b+1dMmx6SSBQYq/OC2F6/R4bnZEQ89wPm2ZEntmkWr4TEz4DTh5K8yvw3pgiEWTNzNYi
         A/4fQirNyZZUWGqn2VA1ErXs2h7VNaho1uWHwOjsq6n0/5QPnx5U/9oFreZa72CThiiw
         8w2L404o3wB2WWt/pEtvSDansA4ktw+YVTveGVD774YBoGxqoyVu6RPvLPuOvMWZMAF9
         qF5fxSlBTtucNY2lT9C+bAEcPbQivUbQZlWbcxFVnoh44SZtW0bHMGm43LGn3D6ius5k
         fXAw==
X-Forwarded-Encrypted: i=1; AL+hErHRSHqgAwtQvZfexg4vPnatOxEh2iE7JGLOJ0YyWS67Y5ejD6bghigQB07TFNkxqITZTm7BDY6La4dNFeX5qnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hQfQqMWuUvPTm+mxRBeiAM2eEaCOi0C0lqvwTIuXe55WodgSl
	cmkAyNyfTaiLw2aIzHBKw6C3XsxG6q/ISXgfaMYiYy9UgYYo0MX/MaU7QJk+Q3mltv9lKXkxqoH
	nyHzR0DAt7hzr39Z6z2Ekn72Oo542m4PmWanb8GM3wg==
X-Gm-Gg: AZFdTZdYSmyxyI6JbpUNGiZusqp8cGwBBccXq+kXneV8fb5VyDQ1Ozh6Eaa9Dkwrn5Z
	UR18I5eWbnv/YmDryR2WjJBCrEDQfYvGAjru/c6pk/kxTmSLDSw7UMLzxlKdCPZoVZXQBSXFVWU
	SC3RzSQxJDKYM+wz5o0SaPZSPEtnW4LyJwGVAJ31Z++sr3OJsKCFxIIOgfPu9gyJWEV7NUehW6Z
	hCO6+Na7IGvN97ULZ3aji3DvJhJDrrCSLIOu3SX32us7WDqazlYFQytDhaPFpI5YJ7oS1Gm9Jdl
	nXXcRH5U953StlLAvZYrrw0F6SiGnJr/DxuYEufNLehEn1R+b683oGyct1exv6iTqTuDj3JiqNV
	0OIXeVXbsVbEuzEYPdeS0ftbQhqLLT1Okjq4qwtpuVtJdJgFaIJMtmePlUEFqFWSumoOh
X-Received: by 2002:a05:690c:3607:b0:8b5:6e9:217a with SMTP id
 00721157ae682-8b5204a997cmr118432657b3.31.1795817735925; Fri, 27 Nov 2026
 14:15:35 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai> <179572802703.3135.17411865692194388871@kernel.org>
In-Reply-To: <179572802703.3135.17411865692194388871@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:15:22 -0700
X-Gm-Features: Aa3M54p1KHSs9ceXPdvDTdxL0WR7OjSk7c2s4dSWeaRL6V-xTBYAqdTwA4fWcno
Message-ID: <CAAv61uR6XcazqvJySkz3SRHTmw3f8N-dV1xJUqO_RNbXxHK3mA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add tcp_l3mdev_exempt_ports
 test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:20=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The header comment of the new test script
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh (lines 8-9)=E2=
=80=A6
> - [Low] In vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh, the first=E2=80=
=A6
>
> --
>
> selftests: net: add tcp_l3mdev_exempt_ports test
>
> This adds a selftest for net.ipv4.tcp_l3mdev_exempt_ports. With
> tcp_l3mdev_accept=3D1 and the port exempted, it checks that a VRF
> connection reaches the VRF-bound listener in either creation order and
> is refused by an unbound-only listener. It also checks that default-VRF
> connections still reach the unbound listener, for both IPv4 and IPv6.
>
> > diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/t=
ools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > new file mode 100755
> > index 0000000000000..da7f20bf2e9e6
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > @@ -0,0 +1,260 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Test net.ipv4.tcp_l3mdev_exempt_ports.
> > +#
> > +# With tcp_l3mdev_accept=3D1, a listener that is not bound to a device=
 also
> > +# matches connections that arrive in a VRF. For a port listed in
> > +# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VR=
F
> > +# may take such a connection. Connections in the default VRF are not
> > +# affected.
>
> [Severity: Low]
> This isn't a bug, but is this comment narrower than what the kernel
> does?
>
> Documentation/networking/ip-sysctl.rst describes tcp_l3mdev_exempt_ports
> as:
>
>     only a listen socket bound to the L3
>     master device or to the receiving device can accept them.
>
> The check in compute_score() (net/ipv4/inet_hashtables.c, and its twin
> in net/ipv6/inet6_hashtables.c) only rejects sockets with no bound
> device:
>
>     if (!sk->sk_bound_dev_if && sdif &&
>         tcp_port_l3mdev_exempt(net, hnum))
>             return -1;
>
> A listener bound to the slave device (veth_vrf here) still matches
> through the sdif comparison in inet_sk_bound_dev_eq().
>
> Could the comment say "bound to the VRF or to the receiving device"?
>
> Also, none of the cases uses a listener bound to the slave device, so
> that documented behaviour has no test coverage. Would it be worth adding
> one?
>
> [ ... ]
>
> > +# Start a server in the background. nettest sets SO_REUSEPORT on its
> > +# listeners, so an unbound and a VRF-bound listener can share the port=
.
> > +# $1: IP version, $2: "vrf" or "unbound"
> > +start_server()
> > +{
> > +     local args=3D()
> > +
> > +     [ "$1" =3D 6 ] && args+=3D(-6)
> > +     [ "$2" =3D vrf ] && args+=3D(-I "$VRF")
> > +     ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" -t 3 -q =
&
> > +}
>
> [ ... ]
>
> > +             for order in "unbound vrf" "vrf unbound"; do
> > +                     read -r first second <<< "$order"
> > +                     RET=3D0
> > +
> > +                     start_server "$ver" "$first"
> > +                     pid_first=3D$!
> > +                     wait_listeners 1
> > +                     check_err $? "first listener did not start"
> > +                     start_server "$ver" "$second"
> > +                     pid_second=3D$!
> > +                     wait_listeners 2
> > +                     check_err $? "second listener did not start"
> > +
> > +                     connect "$ns_c" "$ver" "$addr"
> > +                     check_err $? "VRF connection failed"
>
> [Severity: Low]
> Can the first server time out before the client's SYN arrives here?
>
> start_server() gives each nettest a fixed -t 3. In nettest.c, do_server()
> does a single select() with that budget right after listen(), and closes
> the listener when it expires:
>
> tools/testing/selftests/net/nettest.c:do_server() {
>     ...
>                 rc =3D select(lsd+1, &rfds, NULL, NULL, ptval);
>                 if (rc =3D=3D 0) {
>                         rc =3D 2;
>                         break;
>                 }
>     ...
> }
>
> The first server's 3 second timer is already running while the script
> does all of this:
>
>   - finishes the slowwait poll
>   - starts the second server through ip netns exec
>   - polls until wait_listeners 2 sees two listeners (up to 2s)
>   - starts the client through ip netns exec
>
> On a slow or debug kernel (KASAN, lockdep) these steps can add up to
> about 3s.
>
> With order "vrf unbound", the VRF listener would then be gone. The
> exempt port makes the unbound listener refuse the connection, so the
> connect fails and rc_vrf is 2, even though the kernel behaved correctly.
>
> With order "unbound vrf", the unbound listener exits early. The
> check_timeout() on rc_unbound then passes trivially, and the subtest no
> longer shows that the unbound listener was skipped.
>
> If wait_listeners itself times out, check_err records it, but the
> subtest still goes on to connect.
>
> Would a server -t larger than the total wait budget avoid this?
>
> > +
> > +                     wait "$pid_first"
> > +                     rc_first=3D$?
> > +                     wait "$pid_second"
> > +                     rc_second=3D$?
>
> [ ... ]

Thanks. Both are fixed in v3. The header comment now says "bound to the
VRF or to the receiving device", and new cases cover a listener bound to
the VRF slave device. The listener that must not get the connection is
now stopped by the test after the client connects, instead of relying on
its timeout, so a slow setup cannot make it exit early.
