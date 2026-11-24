Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545004;
	b=W2Gf8tykwhGW0SnmdOMF2FNJcTQ2w9MvTiZfQY3j5zWExnq2rmouG9BNE4YbTjBitAGn
	 tNEl2lURG6X/ev3tQDDHyCrOJgJmXhQ4RxOygOig9T70mFT6SKP11aZcn4JNLh51zl2/z
	 yMnw0o9nIXiFYMIgA19dUu2zvDtO4p3GcA/+nBGb4ZrWqJnqfyq/NuETJdYVtDZskLR+w
	 EdkM94iHXpCbaUUSAqr29f4aEIA8hc2Ewt0ezry5/E0wUMbJOPSdwT/M9a4s1aOYRuA8a
	 01+bq/yDuIeWj497KB3pUou+NQi+lonaThAyvodsw1bguPyw8VYzR8XJKHbHkThzeSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545004;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DbMNuqLBralp6JqQQXwQMiUu0oCpgkS443CYex4YaM0=;
	b=1RPA/o+afrRNLgwl6aP9l1iwqS/ql2boAnf4VKhgKDuyJzDp4t3ZxQ1HQYDJHyvuMvKD
	 +sVu7xrl0pHWBv6N3P6WcFbYRSIZQ3wN29AVVirPBkNI7xRtiDqZp9RF/AR8LA9zEymdU
	 srC2uvhDLdxYkGof+XSrhaStCsXSIYmsQ+CM23vMIQArRYOQlZOhnS5uDg8HKn7rZu8u1
	 KOToBvGperos/bjwwg9tIEJLBWkhtCterynUXcR2PY93zf7U8ZtZPagxLMugaqqc/xIy3
	 eqwwVKGTKYuv9Cg/h49q+UYiMJ9ajElbuuDM6wtEWtoj6VWTkT4IAOtslGajj4xl1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ll91411+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078F606A31E;
	Tue, 24 Nov 2026 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ll91411+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1183B1F000C6;
	Tue, 24 Nov 2026 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545003;
	bh=DbMNuqLBralp6JqQQXwQMiUu0oCpgkS443CYex4YaM0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ll91411+oopHN4Rwuq7hcIHToDhESzFrZSScQ7ullShnMnif+HUBeBc27kK2qiRqi
	 GQSVM9rLyznnR4eBu4GtwurJhw+H2C0pG/CF7dHO5OPl0KeFVGug7zwaZKKTS4vnVU
	 D7jdjUSkBMwEfOs3qQiWiWmCW+2JuJn0QHxd5Zn5JDm31+/P0k9MmiHFi4X2/eJkYB
	 zwmkcZLo175i/Hi0AAiEgDsvepjYEsP2fLA+v/78ZMQ6hHdGum6yiOb1gdHROKNjW1
	 iJEek1ihMW54dftJh/3mUYwZsOJ+xhXSNxhtTM31464p+EJsImvS/OydVWxhYCA6Hz
	 idLSSJ+v1kdDg==
Subject: Re: [PATCH net 2/4] udp: Keep the bound device on disconnect unless
 connect() set it
From: netdev-bot+sashiko@kernel.org
To: juanagusnicco@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuniyu@google.com,
 willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 18:30:02 +0000
Message-ID: <179554500253.3135.7129341529911265513@kernel.org>
In-Reply-To: <20261120174341.35873-3-juanagusnicco@gmail.com>
References: <20261120174341.35873-3-juanagusnicco@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says that clearing sk_bound_dev_if on
  disconnect "is only safe for a device that connect() set", and…
- [Low] The committed message leaves out or blurs user-visible behaviour
  changes of a Cc: stable patch.
- [Low] __udp_disconnect() now does an unlocked read-modify-write of
  sk->sk_userlocks: `WRITE_ONCE(sk->sk_userlocks, sk->sk_userlocks &…
- [Low] __udp_disconnect() takes a snapshot (`u8 userlocks =
  READ_ONCE(sk->sk_userlocks)`) and later uses it to decide whether to…

--

udp: Keep the bound device on disconnect unless connect() set it

This patch adds a SOCK_CONNECT_DEV flag to sk_userlocks. The flag records
that __ip6_datagram_connect() set the bound device on a socket that had
none, and SO_BINDTODEVICE and SO_BINDTOIFINDEX drop it. __udp_disconnect()
now clears sk_bound_dev_if only when the flag is set, which stops a socket
from clearing a device that the user or a cgroup program set.

> This changes connect(AF_UNSPEC) for UDP, ping, raw and L2TP sockets,
> which all use __udp_disconnect(): a device that connect() did not set
> is now kept, so changing it afterwards needs CAP_NET_RAW, as on a
> socket that never disconnected.

[Severity: Low]
Does this paragraph cover all of the behaviour changes?

In __ip6_datagram_connect(), connect() to a link-local peer can replace
a VRF master M with a slave S. old_dif is non-zero there, so
ip6_datagram_connect_dev() does not set SOCK_CONNECT_DEV. Disconnect now
keeps S, where it used to reset the device to 0, and binding back to M
then needs CAP_NET_RAW.

So a device that connect() did set is now kept, and the sentence above
doesn't cover that. The change is only described in the notes below the
--- line, and those notes won't be in the commit that stable backporters
read.

__udp_disconnect() is also called from raw_abort() in net/ipv4/raw.c and
from udp_abort() (SOCK_DESTROY and bpf_sock_destroy). Those paths now keep
a device set by the user or by a cgroup program as well.

Could the commit message mention the VRF change and the abort paths?

> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 446729b41d661..9f1f45afee532 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2195,6 +2195,7 @@ static int udp_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
>  
>  int __udp_disconnect(struct sock *sk, int flags)
>  {
> +	u8 userlocks = READ_ONCE(sk->sk_userlocks);

[Severity: Low]
Can this snapshot be stale by the time it is used to clear
sk_bound_dev_if?

Ping and raw sockets use __udp_disconnect() as their ->disconnect, and
l2tp_ip6_disconnect() calls it. All of them get there from
inet_dgram_connect(AF_UNSPEC) without lock_sock(). Only udp_disconnect()
takes the socket lock.

Take an IPv6 ping, raw or L2TP socket connected to a link-local peer, so
it has device X and SOCK_CONNECT_DEV set:

thread B: __udp_disconnect()
    userlocks = READ_ONCE(sk->sk_userlocks);   /* has SOCK_CONNECT_DEV */

thread C: __udp_disconnect() completes
    sk_bound_dev_if = 0, SOCK_CONNECT_DEV cleared

thread A: setsockopt(SO_BINDTODEVICE, Y)
    sock_bindtoindex_locked()
        /* device is 0, so no CAP_NET_RAW check */
        sk_bound_dev_if = Y, SOCK_CONNECT_DEV cleared

thread B resumes:
    if (userlocks & SOCK_CONNECT_DEV) {
        WRITE_ONCE(sk->sk_bound_dev_if, 0);

Disconnect then clears the device that SO_BINDTODEVICE set. For ping, raw
and L2TP this contradicts "a device that connect() did not set is now
kept". The result matches the pre-patch behaviour, and the window is
small.

>  	struct inet_sock *inet = inet_sk(sk);
>  	/*
>  	 *	1003.1g - break association.
> @@ -2204,15 +2205,19 @@ int __udp_disconnect(struct sock *sk, int flags)
>  	WRITE_ONCE(inet->inet_daddr, 0);
>  	inet->inet_dport = 0;
>  	sock_rps_reset_rxhash(sk);
> -	WRITE_ONCE(sk->sk_bound_dev_if, 0);
> -	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
> +	if (userlocks & SOCK_CONNECT_DEV) {
> +		WRITE_ONCE(sk->sk_bound_dev_if, 0);

[Severity: Medium]
The commit message says clearing the device "is only safe for a device
that connect() set", and this still clears it without a bind conflict
check. Does that hold for L2TP/IPv6?

For UDP, the next patch in the series ("udp: Ignore a connect()-set device
in the bind conflict check") makes udp_lib_lport_inuse() and
udp_lib_lport_inuse2() treat a SOCK_CONNECT_DEV device as 0. That patch
only changes udp.c, and __l2tp_ip6_bind_lookup() still compares the raw
device:

net/l2tp/l2tp_ip6.c:__l2tp_ip6_bind_lookup() {
    ...
		bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
		if (bound_dev_if && dif && bound_dev_if != dif)
			continue;
    ...
}

l2tp_ip6_connect() goes through __ip6_datagram_connect(), and
l2tp_ip6_disconnect() calls __udp_disconnect(). An l2tp_ip6 socket needs
no capability, because inet6_create() checks CAP_NET_RAW only for
SOCK_RAW. The module also loads automatically through
MODULE_ALIAS_NET_PF_PROTO_TYPE().

Could an unprivileged user do the following?

1. attacker: bind conn_id X with no device, which holds X on every device
2. attacker: connect(fe80::1%eth1), so the device becomes eth1 and
   SOCK_CONNECT_DEV is set
3. victim: SO_BINDTODEVICE(eth0), bind conn_id X. This succeeds because
   the attacker's eth1 is skipped.
4. attacker: connect(AF_UNSPEC), which puts the device back to 0 with no
   conflict check
5. attacker: connect() to the victim's real peer G. The peer is not
   scoped, so the device stays 0, and l2tp_ip6_connect() moves the socket
   to the head of l2tp_ip6_bind_table.
6. l2tp_ip6_recv() takes the first match, so the attacker gets G's L2TP
   packets for conn_id X that arrive on eth0

Without this sequence, the victim's bind in step 3 would fail with
EADDRINUSE.

A related point: l2tp_ip6_bind() never sets SOCK_BINDADDR_LOCK. So
__udp_disconnect() always calls inet_reset_saddr() on L2TP sockets, and
the bound address gets wider too.

There is also a VRF case that this patch introduces. Take a socket bound
to VRF master M that connects to a link-local peer on slave S. It gets
device S without SOCK_CONNECT_DEV because old_dif is non-zero, and it now
keeps S after disconnect instead of going back to 0.

Another VRF socket's bind of M:P is then allowed, because S != M in
udp_lib_lport_inuse(). Before this patch, that bind conflicted with the
socket's device 0.

__udp_disconnect() doesn't clear sk_v6_daddr. So for datagrams from its
former peer, the S-bound socket then scores higher than the M-bound one.

Is the series meant to handle the L2TP/IPv6 and VRF cases as well?

> +		WRITE_ONCE(sk->sk_userlocks,
> +			   sk->sk_userlocks & ~SOCK_CONNECT_DEV);

[Severity: Low]
Is this read-modify-write of sk_userlocks safe without the socket lock?

For ping, raw and L2TP sockets this runs from inet_dgram_connect(AF_UNSPEC)
-> prot->disconnect without lock_sock(). Other code updates the same u8
with plain read-modify-writes under the socket lock, and that lock doesn't
exclude this path. Those writers include SO_SNDBUF in sk_setsockopt():

    sk->sk_userlocks |= SOCK_SNDBUF_LOCK;

The others are SO_RCVBUF, SO_BUF_LOCK, sock_bindtoindex_locked() and
ip6_datagram_connect_dev().

An update that lands between this load and store is lost or undone. A
SOCK_SNDBUF_LOCK that was just set can vanish. A buffer lock bit that
SO_BUF_LOCK just cleared can come back. A SOCK_CONNECT_DEV set by a
concurrent connect() can be dropped.

The plain sk->sk_userlocks load inside WRITE_ONCE() also races with those
writers, so KCSAN is likely to flag it.

Before this patch, the unlocked path only read sk_userlocks. The notes
argue that a lost update cannot cause a bind overlap. Does that argument
also cover the other bits in this byte?

>  	if (!(userlocks & SOCK_BINDADDR_LOCK)) {
>  		inet_reset_saddr(sk);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120174341.35873-1-juanagusnicco%40gmail.com
