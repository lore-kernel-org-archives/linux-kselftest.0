Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD772D876F;
	Thu, 24 Sep 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240849; cv=none; b=uQRKUdzKdobISidVgQu3hrFXcJRcT0K39Pg0NwK+dgfBwqm8syNu7Rn1snUr1vfoWpdiFO80Qqkap/hRbmbot3DUge7giCZ/l+GiAyogTKp4BnUUe6QX4eDaK4aRjoh357Ucry/ROpInOAc/xvdUY9uctz12lROZt+f49xF8N4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240849; c=relaxed/simple;
	bh=JLZ3rGiZZOr7YO/jvpWCxZYD6B7P1DllugeVw46XtUI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dsIRR8MHnmTyKYjadb/ja5Dlofa1LWgVzHmijueAhQW9+8aYl1jG3z2x0xbg6iK2b2tUjOf01QAxgTG+vkuETiVGfJqW7/ttIskd7A/Kd+9rBvsk0yfB+ukTJBGgDtaAMFEkQm7lZWxmWdHD2u0GLNImJ2R8CPAxBv2470IISO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPg2Jui/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPg2Jui/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C251F000FF;
	Thu, 24 Sep 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240847;
	bh=Zk20Ep6/d6197RprSKRr49OuNiYfxV066J/nSmSGDW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cPg2Jui/09mWM3nXccXSUqtiN9hDFvTLhXO+Fq82Mecwc4mwLQZnHDLyV9YTPF7/G
	 AgLW8j80I7AstYCAJR5eWMH6wV2qTm8AtkuPtTXY1FOaPSQekZuhQ8WhULVYMaGzTv
	 nttyuxHJ++RS6R6Qg0NDOsg2xjBhg7AB/EmIrS7wCwUrrcldatVjJEKL5+e67Rsh9w
	 tquWe6kpRjdCVUuidQIAHuNB2139VMaqVsDV2iW4omT07vgzjl43zHu+/okDSnpocN
	 LA8k/eysRMJ97XNZlaUhJVcna86/YMeV/LQ2xViRr2tEwITJjDA4ocigU1PMMFYflj
	 dIJpPiXGsteTg==
Subject: Re: [PATCH net 1/2] udp: fix auto-selected port colliding with an
 existing SO_REUSEPORT socket
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, therbert@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 24 Sep 2026 09:07:26 +0000
Message-ID: <179024084635.2160803.17112917565020576047@kernel.org>
In-Reply-To: <20260923060547.118748-1-jiayuan.chen@linux.dev>
References: <20260923060547.118748-1-jiayuan.chen@linux.dev>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix.

--

udp: fix auto-selected port colliding with an existing SO_REUSEPORT socket

This commit changes udp_lib_lport_inuse() so that, during a port scan
(bitmap != NULL), compatible SO_REUSEPORT sockets are marked in the bitmap
instead of being skipped. The reuseport exemption now applies only when a
specific port is requested. This matches TCP commit 0643ee4fd1b7.

> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b090bd1f59e86..a7ade3171becc 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -147,11 +147,10 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
>  		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
>  		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
>  		    inet_rcv_saddr_equal(sk, sk2, true)) {
> -			if (sk2->sk_reuseport && sk->sk_reuseport &&
> +			if (!bitmap && sk2->sk_reuseport && sk->sk_reuseport &&

[Severity: High]
Doesn't this leave the same collision in place when both sockets also have
SO_REUSEADDR set?

The new !bitmap check sits inside the outer filter in
udp_lib_lport_inuse(), and that filter is also evaluated in scan mode:

net/ipv4/udp.c:udp_lib_lport_inuse() {
    ...
		    (bitmap || udp_sk(sk2)->udp_port_hash == num) &&
		    (!sk2->sk_reuse || !sk->sk_reuse) &&
    ...
}

If sk and sk2 both have sk_reuse set, the outer condition is false. In that
case neither the new reuseport branch nor the __set_bit() runs, so sk2's
port is never marked in the bitmap.

udp_lib_get_port() then treats the port as free:

    if (low <= snum && snum <= high &&
        !test_bit(snum >> udptable->log, bitmap) &&
        !inet_is_local_reserved_port(net, snum))
            goto found;

At found:, since sk->sk_reuseport is set, udp_reuseport_add_sock() finds
sk2 (same port hash, same bound dev, sk2->sk_reuseport, same uid) and does:

    return reuseport_add_sock(sk, sk2,
                              inet_rcv_saddr_any(sk));

The unrelated socket then joins the existing reuseport group and gets part
of its datagrams. That is the symptom described in the commit message.

IPv6 goes through the same path via udp_v6_get_port()->udp_lib_get_port().
Implicit autobind from connect()/sendmsg() on an unbound socket calls
udp_lib_get_port(sk, 0, ...) and reaches it as well.

The commit message says:

    Note that this still collides when both sockets also have SO_REUSEADDR
    set: udp_lib_lport_inuse() skips such a pair before it reaches the
    reuseport check, so the port is never marked either. That is not a
    common setup and is left as is here.

Is that really uncommon? Server code and libraries often set SO_REUSEADDR
together with SO_REUSEPORT.

The message also says UDP now does the same as TCP. TCP's scan calls
inet_bind_conflict() with relax == false, and that treats a reuse pair as a
conflict:

net/ipv4/inet_connection_sock.c:inet_bind_conflict() {
    ...
		if (sk->sk_reuse && sk2->sk_reuse &&
		    sk2->sk_state != TCP_LISTEN) {
			if (!relax || (!reuseport_ok && sk->sk_reuseport &&
    ...
				return true;
    ...
}

So TCP never hands out an occupied port during a scan because of
SO_REUSEADDR, but the UDP scan still does.

Could the outer term be changed to something like:

    (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&

so that every compatible occupied port is marked during the scan? The
SO_REUSEADDR and SO_REUSEPORT exemptions would still apply on the
explicit-port path.

Separately, sockets that have only SO_REUSEADDR set can also be given the
same auto-selected port today. That behaviour predates this patch, but the
same change would fix it too.

>  			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
>  			    uid_eq(uid, sk_uid(sk2))) {
> -				if (!bitmap)
> -					return 0;
> +				return 0;
>  			} else {
>  				if (!bitmap)
>  					return 1;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923060547.118748-1-jiayuan.chen%40linux.dev
