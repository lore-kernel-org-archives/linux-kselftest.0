Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CD3FD132
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651864; cv=none; b=ZjH0K0JmmFP/nq8XAMu8JK8eDhm3C/w35l2ohwpB0iUTOqU+0jGQ0U4PnET1eLWRX1fb8qBNZUVxnvslxJgCYA03lqTTqMGw+uCUydoNYsMYRhMyQwEgkY/ch4Puyv+xjADD6/ds+tlBRiIYpuZ5pJcJizDegibIWdJ+t5JfWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651864; c=relaxed/simple;
	bh=K+Z9T3zHkFd/SQrQ/BlNEowcwkDGxESE+3CbL0x4RcE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Fbi/8cytpZ8U/WQ2mtYk2yyK6MJp10AIWDLBHh/PHywlMnl0jCK0y/cauJTWoN4EW4kXEUGcaAYbPAloVibz7mdYOu0AKJR0il65tVHNYleFokpy0WtMBgemYQMXOP9D+c3Isx9BpEHvLXwz7dFpxG4XfQ4Knv3158iXUT27Ges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWbXyDBP; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWbXyDBP"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66b32bb75beso456188d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651862; x=1787256662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HzUdcmkK3u9r+OT8mch+I5+qedGO9AbIMjInXn7gYYc=;
        b=KWbXyDBP+KFTAOIdXfdO5PjaIXiGqWTybtTUxPCgMvuktCJ6NGO9IMznBloNmTEinb
         wlHyMe/TgZ/XMJa7sAbmw72yAKkfInjvXNPOcViVvcgN5cQCmyLkZCvnL7sJWyC1nSQV
         k4tcPmPsrWclIAX5eb5kOA25N7UkqxdMzKSteMWJuUs42hQ/yE86NuM+r6TuMrE05TQv
         7Oyc6TGu9/1oh/htfJVStdjwV5xWg3ROsq+bX2kmxdEE4NBYGhw2tTve7RT/uV7XgETW
         D6kzbNc66UIKybkPcxQlQ+jiGodjm9arF7FyrU0zgk3uXOaJ3aKS4PK/t6yJLi4DF5xz
         ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651862; x=1787256662;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzUdcmkK3u9r+OT8mch+I5+qedGO9AbIMjInXn7gYYc=;
        b=i2JkloUOfahNcQp1cWqhgIy0ecbUlsvs0fFrq4H3zkjuywyHrNBuvNC6jgaoJ41+X5
         447v8fH85f3Ir1OCHQiIw7mxSmrDDWeX1kl2EZo9QjvFS+H0TgeLUL1xwd/g8kPctCBk
         xjH++9S0j/ltY3tUi70NSPlYUCdMpmGE3uR84iCeLH0NnwWmMm/xUgDWbZFgl8jwL3ix
         UBnjE3WJK80Zx+FBh3SK+JTNpVyYKCfqOUppauHJjEXhQZmOud4tKYXAgGwTFmqMX+qr
         dCFzZ9F0o/ZaCPvLWH/SwOJvhuK4QMh3wrlFUGtuQTNk3E5J7KcSb6/nOWdPqVST600d
         EhDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGWWHVM/NTdWHpGxI36liENk1XWR3RAvNKxLpoFN8rcooH6iZKL36AUfYCO2C7EwFAzzShjqTG1/CjH9uw0tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzwFohHaC6AQnMVFyRAgwuDG7lRI6r+NwJkk2/VJsB2H40Zv8
	hm5/z4diV8/txlOaSzkB40KUBBIK5nnUO40H9mfLZfdsuAtgDPwf47VV
X-Gm-Gg: AR+sD12i4JMTOu0o1tyHQfA1Xm1Lk/HV5R1NAYWLgq0L/KW2M04TX1mjLrCVSFP7nQl
	U+WOszA0NL/rthjd8mpweYZqMmVsTMRIq2Bm7P8KrZyUDzmZm4kqsk19J94eCQmyKoqHC02yoPZ
	77YzSQGhTD9M59mY/egfQ3JGoCAbpWvR536B4l9RSWleBDAAnSREFpW+QcF5m2BlaY94iQT3z7D
	xtpJoq0JLI2VjPwq2fIE/GrEHRsJX2Mcw7n4lEcLR/TguVjj7Zzoz+TspfAlryMfpTT69OjZjJY
	hooN1RYYZEEmFMUiGGhzXpjg7gBCDR+jZcW+8ONQLdyQDsS5lIVyqyQuw0rqUKLmKTwRc5tuzFI
	N01v2Om8CuEfNWL0cf335UrB7p6SaNpvqE0bx92DCQwjklQrZI79VLDu5JkQC2En6UnSUdv9ZG5
	PqNw62LUdpG3C8ZGXuy1DFZPsuWlWO6GttNVwriVLrKntw70mdZxUs6n4DO0LmczY7vCwjp+ueH
	FFW6Zc4Kgbw2t16fpFZitKw4y2BCzIup6I8woE=
X-Received: by 2002:a05:690e:164f:b0:667:bd83:909c with SMTP id 956f58d0204a3-66c72c794bemr393438d50.35.1786651861723;
        Thu, 13 Aug 2026 13:11:01 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c574aec25sm1322076d50.21.2026.08.13.13.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:11:00 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:11:00 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Alice Mikityanska <alice.kernel@fastmail.im>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Hannes Frederic Sowa <hannes@stressinduktion.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Alice Mikityanska <alice@isovalent.com>, 
 syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
Message-ID: <willemdebruijn.kernel.f41e3c8f9a9e@gmail.com>
In-Reply-To: <20260813120351.2807829-2-alice.kernel@fastmail.im>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
 <20260813120351.2807829-2-alice.kernel@fastmail.im>
Subject: Re: [PATCH net v2 1/2] net: Fix UDP length overflow with PMTU
 discover and big MTU
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Alice Mikityanska wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> This commit bounds cork->base.fragsize to IP(6)_MAX_MTU to avoid a
> possible overflow of UDP length that triggers a WARN in
> udp_set_len_short when setsockopt IP(V6)_MTU_DISCOVER is set to
> IPV6_PMTUDISC_DO or IP(V6)_PMTUDISC_PROBE, and a large packet is sent
> over a netdev with an unusually large MTU.
> 
> Steps to reproduce (included in the new selftest):
> 
> 1. Set device MTU bigger than IP6_MAX_MTU (or IP_MAX_MTU + 20).
>    cork->base.fragsize will be set to that MTU in ip(6)_setup_cork.
> 2. Set IP(V6)_MTU_DISCOVER to IP(V6)_PMTUDISC_PROBE or IPV6_PMTUDISC_DO.
>    It lets maxnonfragsize be set to device MTU (cork->fragsize) in
>    __ip(6)_append_data, rather than to IP(6)_MAX_MTU.
> 3. Send 65528 bytes of payload (+8 bytes of UDP header, +20/40 bytes of
>    IPv4/IPv6 header). Device MTU allows it (it's only one byte bigger
>    than IP6_MAX_MTU or IP_MAX_MTU + IPv4 header, and the device MTU is
>    bigger than that).
> 4. The UDP length in the built packet is 65536, which overflows the
>    16-bit length field and triggers the WARN in udp_set_len_short.
> 
> Note: IP_PMTUDISC_DO with IPv4 is safe, because ip_dst_mtu_maybe_forward
> always clamps at IP_MAX_MTU, unlike ip6_dst_mtu_maybe_forward.
> 
> The Fixes tag points at the first commit where I could reproduce the
> overflow with IPv4 and IP_PMTUDISC_PROBE.
> 
> Fixes: daba287b299e ("ipv4: fix DO and PROBE pmtu mode regarding local fragmentation with UFO/CORK")
> Reported-by: syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/netdev/6a6a966c.86abc875.e5c3d.0054.GAE@google.com/
> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
> Assisted-by: Claude:claude-sonnet-4.6
> Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>

Not sure whether IPv4 and IPv6 should be separate patches.
IPv6 will have a different Fixes tag.

Per maintainer-netdev.rst, mixing code and test changes in the same
patch is also discouraged.

> ---
>  net/ipv4/ip_output.c                         |  2 +
>  net/ipv6/ip6_output.c                        |  2 +-
>  tools/testing/selftests/net/Makefile         |  1 +
>  tools/testing/selftests/net/cork_fragsize.py | 77 ++++++++++++++++++++
>  4 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100755 tools/testing/selftests/net/cork_fragsize.py
> 
> diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
> index e6dd1e5b8c32..2bc997c4fa7b 100644
> --- a/net/ipv4/ip_output.c
> +++ b/net/ipv4/ip_output.c
> @@ -1299,6 +1299,8 @@ static int ip_setup_cork(struct sock *sk, struct inet_cork *cork,
>  
>  	cork->fragsize = ip_sk_use_pmtu(sk) ?
>  			 dst4_mtu(&rt->dst) : READ_ONCE(rt->dst.dev->mtu);
> +	if (cork->fragsize > IP_MAX_MTU)
> +		cork->fragsize = IP_MAX_MTU;

if respinning: use min(), like IPv6? It's even more concise and easier to read.

>  
>  	if (!inetdev_valid_mtu(cork->fragsize))
>  		return -ENETUNREACH;
> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 2c44e5ed6171..81fb61b94759 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c
> @@ -1430,7 +1430,7 @@ static int ip6_setup_cork(struct sock *sk, struct inet_cork_full *cork,
>  	if (frag_size && frag_size < mtu)
>  		mtu = frag_size;
>  
> -	cork->base.fragsize = mtu;
> +	cork->base.fragsize = min(mtu, IP6_MAX_MTU);

Not sure whether a limitation that we seriously have to care about, but:

This restricts all IPv6 protocols, while only UDP has the length field
limitation.

With IPv6 jumbo frames and RAW sockets, could there be a valid case
for larger fragsize?

>  	cork->base.gso_size = ipc6->gso_size;
>  	cork->base.tx_flags = 0;
>  	cork->base.mark = ipc6->sockc.mark;
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 708d960ae07d..82a1407f6a69 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -24,6 +24,7 @@ TEST_PROGS := \
>  	cmsg_so_mark.sh \
>  	cmsg_so_priority.sh \
>  	cmsg_time.sh \
> +	cork_fragsize.py \
>  	double_udp_encap.sh \
>  	drop_monitor_tests.sh \
>  	ecmp_rehash.sh \
> diff --git a/tools/testing/selftests/net/cork_fragsize.py b/tools/testing/selftests/net/cork_fragsize.py
> new file mode 100755
> index 000000000000..7a1bb069227a
> --- /dev/null
> +++ b/tools/testing/selftests/net/cork_fragsize.py
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Test possible UDP length overflow in udp_send_skb/udp_v6_send_skb.
> +
> +from lib.py import ksft_run, ksft_exit, ksft_true
> +from lib.py import ip, NetNS, NetNSEnter
> +import errno
> +import socket
> +import subprocess
> +
> +
> +IP_MTU_DISCOVER = 10
> +IP_PMTUDISC_PROBE = 3
> +IPV6_MTU_DISCOVER = 23
> +IPV6_PMTUDISC_DO = 2
> +
> +
> +def check_dmesg_clean(func) -> bool:
> +    dmesg = subprocess.Popen(['dmesg'], stdout=subprocess.PIPE)
> +    result = subprocess.run(['grep', '-q', f'WARNING:.*{func}'], stdin=dmesg.stdout)
> +    dmesg.wait()
> +    return result.returncode != 0 and dmesg.returncode == 0
> +
> +
> +def test_ipv6() -> None:
> +    with NetNS() as ns:
> +        ip('link add dummy type dummy', ns=ns)
> +        ip('link set dummy mtu 65576', ns=ns)
> +        ip('link set dummy up', ns=ns)
> +        ip('-6 addr add fd00::1/64 dev dummy nodad', ns=ns)
> +        ip('-6 neigh add fd00::2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
> +
> +        with NetNSEnter(ns):
> +            with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as fd:
> +                fd.setsockopt(socket.IPPROTO_IPV6, IPV6_MTU_DISCOVER, IPV6_PMTUDISC_DO)
> +                try:
> +                    fd.sendto(b' ' * 65528, ('fd00::2', 1234))
> +                except OSError as e:
> +                    # Ignore EMSGSIZE: it happens on kernels with the fix.
> +                    if e.errno != errno.EMSGSIZE:
> +                        raise
> +
> +        ip('link del dummy', ns=ns)
> +
> +    ksft_true(check_dmesg_clean('udp_v6_send_skb'), 'WARNING detected in dmesg')
> +
> +
> +def test_ipv4() -> None:
> +    with NetNS() as ns:
> +        ip('link add dummy type dummy', ns=ns)
> +        ip('link set dummy mtu 65556', ns=ns)
> +        ip('link set dummy up', ns=ns)
> +        ip('addr add 10.0.0.1/24 dev dummy', ns=ns)
> +        ip('neigh add 10.0.0.2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
> +
> +        with NetNSEnter(ns):
> +            with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as fd:
> +                fd.setsockopt(socket.IPPROTO_IP, IP_MTU_DISCOVER, IP_PMTUDISC_PROBE)
> +                try:
> +                    fd.sendto(b' ' * 65528, ('10.0.0.2', 1234))
> +                except OSError as e:
> +                    # Ignore EMSGSIZE: the check happens after the WARN is printed.
> +                    if e.errno != errno.EMSGSIZE:
> +                        raise
> +
> +        ip('link del dummy', ns=ns)
> +
> +    ksft_true(check_dmesg_clean('udp_send_skb'), 'WARNING detected in dmesg')
> +
> +
> +if __name__ == "__main__":
> +    ksft_run([
> +        test_ipv6,
> +        test_ipv4,
> +    ])
> +    ksft_exit()
> -- 
> 2.55.0
> 


