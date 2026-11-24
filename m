Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545006;
	b=LexCLPmn8umJn0qu9POd5LQFIjkmxpaDo39P0TJAybSYZVhey8tXhyhkRpEhzVo5rPfO
	 l/7Hy0lPNeUoaYD7TC25kD6JQV0jquryfNYc6AAWkhUQq0FY9Be4V2kE86sjQT8f6jqu/
	 3UObin4bhzt1zLpAvf0oWFM8FWhBqu3Tbhho/aGdC1CcstSV7MNdBaUOWZ1Fl/E0ysUpU
	 My+BBOZ/kgPPLw9aORZy7iKH+VvZ/v9hBoJwpvb0v9zvJwz1cBmqkT6BcxNphDjO6xEWT
	 fsWB4ZmgygeDV8IaVdQxDQKF+5MJtzOJ6TIRANUUxOboW8pSf29oCjrI7cVl3yGah3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545006;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=n1KgB2umdvRrwuuScjEMOJBrlsXEpK550A6Xh9JgX3s=;
	b=jNTiaj13mlFmQW1MOovDrh6fheJUO9WR23czkHT0LjlOBVZA5WYvE8edUto6bMLdlnrK
	 7PUG6lMJwT007UAkSmhVILBfJoZZFxsvLtZsXTSqOpZhyOOrwcQ6bVhBuKueAuydG1ibi
	 90YaN7kZFC+x0av1lPwHWUGTftMD0tpPNLBF8XxQ64V82pyRjKnlq+CZdT+VgxWeRJnXG
	 LK8u1oukLEjeKU8AL0tEDfXcojrjgTdLy7LvRdG6s4df7Tf5+Mu+47MCuuF5UuqUCT/3e
	 yFbZrbyw2bCvz6V56TlBC6b9buknQKmvPutWk86C6SCqXgJM+HVWPba7m1Cus/EHNRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4wDJMtc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B7606A330;
	Tue, 24 Nov 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4wDJMtc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2331F000C6;
	Tue, 24 Nov 2026 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545006;
	bh=n1KgB2umdvRrwuuScjEMOJBrlsXEpK550A6Xh9JgX3s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d4wDJMtcIHKnhp3EBugWt1R6dL4xch7LNsy3qdkcrHvQxIoFNn5irw4jFV2o3YJoO
	 uu1/VaxDuGXUGAbBx/IlawwmYjr6pNiPGsgKRVluSmiYEPa0DtJPvZ2+9DGXPqg6Rl
	 bUyjn/Ss1n24VeUM9jprDnAUzqvNRUYmEg09d8ny/+8chyAjT2g9jSlcwL9dufhBGq
	 bgljjgkLvJFCwSmLf6FCUabe2ot7IxnNnM2bftsIoga8WvAE7C344/xL6qZRPm0ymr
	 fS3QNjfoRrCrqRRI759ToMVmAI7JyG+89aRjj613ZxwJ3GAiTqektXQXkrNVuG7q34
	 0pu+7AZ0x5f/Q==
Subject: Re: [PATCH net 3/4] udp: Ignore a connect()-set device in the bind
 conflict check
From: netdev-bot+sashiko@kernel.org
To: juanagusnicco@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuniyu@google.com,
 willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 18:30:04 +0000
Message-ID: <179554500493.3135.4927369151169103128@kernel.org>
In-Reply-To: <20261120174341.35873-4-juanagusnicco@gmail.com>
References: <20261120174341.35873-4-juanagusnicco@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: the port hijack in the commit message still
  works through the local address that connect() narrows.
- [Medium] Incomplete fix: the L2TP/IPv6 bind conflict check still trusts
  a device that connect() set.
- [Medium] On a socket bound to a VRF (L3 master), the bind conflict
  check still uses a device that connect() narrowed, not the device…
- [Medium] Race: the lockless check in udp_bound_dev_if()
  (net/ipv4/udp.c:134) reads flag, then device, then flag again, and…

--

udp: Ignore a connect()-set device in the bind conflict check

This patch changes the UDP bind conflict checks in udp_lib_lport_inuse()
and udp_lib_lport_inuse2() so they ignore a device that connect() set on
another socket. SOCK_CONNECT_DEV records that case. A new lockless helper,
udp_bound_dev_if(), reads the flag, then the device, then the flag again.
Matching smp_wmb() calls are added in the connect, disconnect and
SO_BINDTODEVICE paths.

> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 9f1f45afee532..a13bf32cbdb99 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -131,11 +131,35 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
>  #define MAX_UDP_PORTS 65536
>  #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
>  
> -static bool udp_lport_same_bind(const struct sock *sk, const struct sock *sk2)
> +static int udp_bound_dev_if(const struct sock *sk)
> +{
> +	int dif;
> +
> +	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
> +		return 0;
> +	/* Pairs with the smp_wmb() before SOCK_CONNECT_DEV is cleared. */
> +	smp_rmb();
> +	dif = READ_ONCE(sk->sk_bound_dev_if);
> +	/* Pairs with the smp_wmb() after SOCK_CONNECT_DEV is set. */
> +	smp_rmb();
> +	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
> +		return 0;
> +	return dif;
> +}

[Severity: Medium]
Can a full connect() and disconnect() cycle on sk2 happen entirely
between the two loads of sk_userlocks here?

The writers are ip6_datagram_connect_dev(), __udp_disconnect(), the
error path in __ip6_datagram_connect() and sock_bindtoindex_locked().
They hold only lock_sock() of the other socket. This reader holds only
hslot->lock or hslot2->lock.

Say the victim runs connect(fe80::1%eth0) and then connect(AF_UNSPEC)
between the two flag loads:

CPU1 (attacker bind)                 CPU2 (victim)
udp_bound_dev_if(sk2)
  READ_ONCE(sk_userlocks)   /* clear */
                                     ip6_datagram_connect_dev()
                                       set SOCK_CONNECT_DEV
                                       sk_bound_dev_if = eth0
  READ_ONCE(sk_bound_dev_if) /* eth0 */
                                     __udp_disconnect()
                                       sk_bound_dev_if = 0
                                       clear SOCK_CONNECT_DEV
  READ_ONCE(sk_userlocks)   /* clear */
  return eth0

udp_bound_dev_overlap() then compares eth0 with the attacker's eth1 and
admits the bind. The victim, however, holds the port on every device.

On PREEMPT_RT, spin_lock_bh() in udp_lib_get_port() does not disable
preemption, so the binding task can be preempted between the loads. On
other kernels a hardirq or NMI can open the same window. The attacker
can retry SO_BINDTODEVICE plus bind() at almost no cost.

The notes after the commit message acknowledge this window and leave it
open. Since this is tagged for stable, would it be better to close it
here? A sequence count, a lock shared with the writers, or a single
field that records the bind-time device would each do it.

[ ... ]

> @@ -157,14 +182,13 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
>  		    sk2 != sk &&
>  		    (bitmap || udp_sk(sk2)->udp_port_hash == num) &&
>  		    (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
> -		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
> -		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
> -		    inet_rcv_saddr_equal(sk, sk2, true)) {
> +		    inet_rcv_saddr_equal(sk, sk2, true) &&
> +		    udp_bound_dev_overlap(dif, sk2)) {

[Severity: High]
Does the hijack in the commit message still work if the attacker binds
a specific address instead of [::]?

On connect, a socket bound to a wildcard address gets a narrowed local
address and is rehashed:

net/ipv6/datagram.c:ip6_datagram_dst_update() {
    ...
	if (ipv6_addr_any(&sk->sk_v6_rcv_saddr)) {
		sk->sk_v6_rcv_saddr = fl6->saddr;
		inet->inet_rcv_saddr = LOOPBACK4_IPV6;
		if (sk->sk_prot->rehash)
			sk->sk_prot->rehash(sk);
    ...
}

__ip4_datagram_connect() does the same for IPv4:

	if (!inet->inet_rcv_saddr) {
		WRITE_ONCE(inet->inet_rcv_saddr, fl4->saddr);
		if (sk->sk_prot->rehash)
			sk->sk_prot->rehash(sk);
	}

Suppose the victim is narrowed to one specific address and the attacker
binds a different one. inet_rcv_saddr_equal() returns false before
udp_bound_dev_overlap() runs, so the bind is admitted. In
udp_lib_lport_inuse2(), the rehashed victim is not in any of the hslot2
buckets that get scanned.

Later the victim calls connect(AF_UNSPEC). A wildcard bind never sets
SOCK_BINDADDR_LOCK, so __udp_disconnect() calls inet_reset_saddr() and
the victim goes back to the wildcard address. The attacker's more
specific socket then wins the lookup.

This IPv4 sequence needs neither a link-local peer nor SO_BINDTODEVICE:

  victim:   bind(0.0.0.0:P), connect(8.8.8.8:53)  /* narrows to 192.168.1.5 */
  attacker: bind(127.0.0.1:P)                     /* admitted */
  victim:   connect(AF_UNSPEC)

After this, the attacker receives the victim's loopback traffic to
port P. The commit's own example also looks exploitable if the attacker
binds [2001:db8::a]:P instead of [::]:P.

The notes after the commit message mention this window and leave it for
a separate patch, and nothing later in the series addresses it. The
commit message says the patch stops an unprivileged user from binding a
port that another user's socket holds, and it is tagged for stable.
Should the address case be fixed together with the device case?

[ ... ]

> @@ -194,13 +219,12 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
>  		    sk2 != sk &&
>  		    (udp_sk(sk2)->udp_port_hash == num) &&
>  		    (!sk2->sk_reuse || !sk->sk_reuse) &&
> -		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
> -		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
> -		    inet_rcv_saddr_equal(sk, sk2, true)) {
> +		    inet_rcv_saddr_equal(sk, sk2, true) &&
> +		    udp_bound_dev_overlap(dif, sk2)) {

[Severity: Medium]
This converts the UDP conflict checks. Does the L2TP/IPv6 bind check
still trust a device that connect() set?

l2tp_ip6_connect() calls __ip6_datagram_connect(). On an L2TP/IPv6
socket bound with no device, ip6_datagram_connect_dev() therefore sets
both sk_bound_dev_if and SOCK_CONNECT_DEV. __l2tp_ip6_bind_lookup()
still compares the raw device:

net/l2tp/l2tp_ip6.c:__l2tp_ip6_bind_lookup() {
    ...
		bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
		if (bound_dev_if && dif && bound_dev_if != dif)
			continue;
    ...
}

Take the same sequence as in the commit message:

  victim:   bind([::], conn_id X), connect(fe80::1%eth0)
  attacker: SO_BINDTODEVICE(eth1), bind([::], conn_id X)
  victim:   connect(AF_UNSPEC)

l2tp_ip6_bind() skips the victim (eth0 vs eth1) and admits the
attacker. Then l2tp_ip6_disconnect()->__udp_disconnect() clears the
victim's device because SOCK_CONNECT_DEV is set. The victim now holds
conn_id X on every device, while the attacker's socket is still in
l2tp_ip6_bind_table.

sk_add_bind_node() added the attacker's socket at the head of that
table. So l2tp_ip6_recv() would match it first for control frames from
fe80::1 that arrive on eth1 for tunnel X.

The previous patch in the series lists L2TP as a __udp_disconnect()
user, and nothing later in the series changes this lookup. Should
__l2tp_ip6_bind_lookup() also ignore a device that connect() set?

[ ... ]

> diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
> index 0296207dbeb0b..37a093f74724e 100644
> --- a/net/ipv6/datagram.c
> +++ b/net/ipv6/datagram.c
> @@ -141,9 +141,12 @@ EXPORT_SYMBOL_GPL(ip6_datagram_release_cb);
>  
>  static void ip6_datagram_connect_dev(struct sock *sk, int old_dif, int dif)
>  {
> -	if (!old_dif && dif)
> +	if (!old_dif && dif) {
>  		WRITE_ONCE(sk->sk_userlocks,
>  			   sk->sk_userlocks | SOCK_CONNECT_DEV);
> +		/* Pairs with the second smp_rmb() in udp_bound_dev_if(). */
> +		smp_wmb();
> +	}
>  	WRITE_ONCE(sk->sk_bound_dev_if, dif);
>  }

[Severity: Medium]
For a socket bound to a VRF master, can udp_bound_dev_if() still return
the slave that connect() picked instead of the device bind() reserved?

In __ip6_datagram_connect(), sk_dev_equal_l3scope() accepts a slave0
scope id on a socket bound to vrf0. ip6_datagram_connect_dev(sk, vrf0,
slave0) then writes sk_bound_dev_if = slave0. It does not set
SOCK_CONNECT_DEV, because old_dif is non-zero.

udp_bound_dev_if() then returns slave0 for that socket.
udp_bound_dev_overlap() and udp_lport_same_bind() treat slave0 as the
reserved device.

For example, user A binds vrf0 X:P and connects to fe80::1%slave0.
Another user then binds vrf0 X:P. udp_bound_dev_overlap(vrf0, A)
compares vrf0 with slave0, finds no overlap, and admits the bind, even
though A reserved vrf0.

With the earlier patch in this series, __udp_disconnect() keeps slave0
because the flag is clear. A never returns to vrf0, and the other user
alone receives the port's traffic on the other slaves of vrf0.

The early return for reuseport can go wrong the same way. Say B is
owned by A's user, uses SO_REUSEPORT and is bound to slave0, and its
scan reaches A first. Then udp_lport_same_bind(B, slave0, A) is true,
and udp_lib_lport_inuse() returns 0 before it sees socket C. C belongs
to another user and is bound to slave0 X:P.

The commit message says:

  A VRF master that connect() narrowed to one of its interfaces does not
  get the flag and is compared as before.

Is it safe to compare as before here? Would recording the bind-time
device, instead of using a flag, also cover this case?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120174341.35873-1-juanagusnicco%40gmail.com
