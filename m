Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B019B3CB
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473463; cv=none; b=OyvLjLw2tj+E+uggstcEC5CHLMPr1g6BeaMPyDV09lVj03O7WwmF1Fmd13d9pA2kqnhA7NnBwAfKCth8T2UdYKsjxvQwlXo/xa0HYATButEOx64GfEO+zuvw/Jq8yQLEdPDB1lg1qNHzHlSPo41crz3DrF5RO4icNgvhFwRr4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473463; c=relaxed/simple;
	bh=P5J9Sf16uPUvsZ+JfrZlq2hmQ3Ky4R4QrKaKwbraMmQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=SNu+JZqLkxEk8HzFlAQaoYLuIk+du6bpVF0puDD1z89Aeuq4WgGuLXXQqvORzrVbdZr7YvrYqX4W7w0YMotZlorRChbmv1PTw4YGRjMdjjxiAG2zjzqytKTR4hXUFFiDB4Rugaf2wSFLpXz80AqFk6tng1g2WsAnn4EdfIiC1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoFggJVP; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoFggJVP"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5ce9914dso79276785a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473461; x=1791078261; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZDvIRroBF25q1jkpXLqTWAFH4anbNjoJF32ra/1qtW8=;
        b=JoFggJVPQ8N2k4zi2zT7O79vhO51ZgBR69bMKH3FC+s6YmNZ7LjoDVBvP6HEaTM/J2
         GsmZkTDqc4VdmA+6CkZqYbBi9xpmeHoarDTVNu4N0mqBBrfsv9FxD2AF0KaiYhou+M9m
         P/vJd1lKrsKpStd8NCCxgw7s5NwYmOSm+hhYcQaunYCVPoZbKZAD6kNnIMagXPzD/Hp0
         hfa/O+bbVC+kUVJBI/3qC8uVFGnHLl/yEmFtquPc+5ofo0VmWBHj1I6lBs2a8C/NfJY0
         QhNTP2gTJeoXzbTWRimMuG7eErBMuQek3EE8FqJayv/gPYje3bA0+aeSY2YEF3tRuuna
         MP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473461; x=1791078261;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDvIRroBF25q1jkpXLqTWAFH4anbNjoJF32ra/1qtW8=;
        b=NTKNyKwvBUITakUAEDmPaobEA2KSPM/FluCZNrf5oMtfY2YALss0T9YW4cZNel2R/s
         ZFo//hWVB0WnJcGvQZvK78FodjNkYUNVfZXwFUQd4MzT05cjUv7JiRTHAsFK/dtCDTqQ
         4D2sgqrXfwuCiLVE7us/xPDcOKXUlallh8nhmQHam44xfdZ9teKTiRU50+a6803DPe25
         bhtj2HBHr1kwe7SZJPv1JX/p+olnn9R9DFhouREnoUtNIQk9tvCA7BXaaeMOPYN2hib/
         aGA/6lndye68wApfrr0oEdLA6bDHxU7vZEX2/0GHOlabM8Lm+BwfgBvYHtwlmzffKUd/
         UNLg==
X-Forwarded-Encrypted: i=1; AKwUvBzVZXXmbvILflwMBiZ5DfrVXDn1oJ7OPiDBNQpOObNX9k/rhwQslb25f9AbbeAjKvjOnpFGdkDcZtiPWj4smWw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7fecRGGCemPDS8Nu2Cj+rXGWiLUQVA9XB6sSnJG2Q3NZsfVbB
	zQ4IhPcPGBvqANg6twXgrF00dErPKmL/x4PtLwj8idinM3C3v8D7xtpQ
X-Gm-Gg: AYBFou0id51XADtAXEGaO1T8OasVRiFRPUeulFgWejg4PyrL2lY6wFwdBr4IHA1H/yK
	LS1J83lCO6fY/5fmLfwFwre6VOam5K592dzZAQEGb9T6nWu1wButQ9biIiOIj8R6oAh8o54xKDv
	O0C/Ea5BWAobX2zEPSZ/Oec8MTa8bNn40Kh07TyTLl16p6seLu0mlzblRxWZNrNsZkzmzxGlKLu
	Q9hgP7kfRCVRnuDKvk/zrAopfxzl+n+ZZ+81ag0/9SVtmf6Pq5//21A07QePLrdQ/Po/p26KxoE
	6AOynkpcdmRI55z7BHYO1gIo6fZ49QAnySMbTHMsdeZPq4ITvG57S3ToEjDNRU//0/AnTJ0b/h2
	sHY2lroOO7UqyGZWroYkih86P4hMiorPxmnQv29MmY9bNHFTWcbM5QnTZ7tEu0/cfyC4ljlEXim
	EQ1/J3LOwel+wXWVXW3xBsD1MJKxaplg1bzZwMKTKDrF27gqTTfpdP84FJqnYnOdzZBLPGzlvq9
	AaCeLvDQZZguA==
X-Received: by 2002:a05:620a:a515:b0:93c:5d68:107 with SMTP id af79cd13be357-93c5d683856mr415383485a.30.1790473460846;
        Sat, 26 Sep 2026 18:44:20 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e0cb71sm50445796d6.31.2026.09.26.18.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 18:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 21:44:19 -0400
Message-Id: <DLPPVC3CQK2B.A9S40J99PFH2@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <shuah@kernel.org>,
 <willemdebruijn.kernel@gmail.com>, <horms@kernel.org>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <kuniyu@google.com>,
 <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next 2/4] net: psp: require an established
 connection for association setup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260925-psp-defeat-v1-2-9f0b430107aa@gmail.com>
 <179047267826.2160803.3880931721750245623@kernel.org>
In-Reply-To: <179047267826.2160803.3880931721750245623@kernel.org>

On Sat Sep 26, 2026 at 9:31 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The new `sk->sk_state !=3D TCP_ESTABLISHED` check in
>   psp_sock_assoc_set_tx() (net/psp/psp_sock.c:261-265) does not close=E2=
=80=A6
> - [Low] The commit message says the tx-assoc check 'fixes a bug in commit
>   6b46ca260e22 ("net: psp: add socket security association code")', but=
=E2=80=A6
> - [Low] Baseline decision: false positive, kept only because
>   requires_validation=3Dtrue.
>
> --
>
> net: psp: require an established connection for association setup
>
> With this commit, rx-assoc and tx-assoc return -ENOTCONN unless the socke=
t
> is in TCP_ESTABLISHED when checked under the socket lock. It also documen=
ts
> that the upgrade to PSP must happen on an established connection, and tha=
t
> disconnecting a socket with PSP assoc state is unsupported. The commit
> message describes the tx-assoc check as a fix for an unsynchronized write
> to an assoc shared with a timewait socket.
>
>> The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
>> psp: add socket security association code") where an unsynchronized
>> write can be performed an assoc shared with a timewait socket when the
>> socket is in TCP_CLOSE after shutdown. This commit is not included in
>> net, because its premise of preventing listen sockets from holding assoc
>> state depends on the net-next commit 8cc3aef0cb19 ("tcp: Do not allow
>> buggy transitions between ehash and lhash2.")
>
> [Severity: Low]
> This is described as a fix for 6b46ca260e22, so should it carry a Fixes:
> tag? Documentation/process/maintainer-netdev.rst says the Fixes: tag is
> required for fixes regardless of the tree.
>
> The dependency on 8cc3aef0cb19 explains why this goes to net-next. That
> dependency is about listen sockets, though. The tx-assoc case of TCP_CLOS=
E
> after shutdown does not seem to involve ehash/lhash2 transitions.
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index a9cfeebe4ba1b..a6b1c42dd626f 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -252,6 +258,12 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct p=
sp_dev *psd,
>> =20
>>  	lock_sock(sk);
>> =20
>> +	if (sk->sk_state !=3D TCP_ESTABLISHED) {
>> +		NL_SET_ERR_MSG(extack, "Socket must be in established state");
>> +		err =3D -ENOTCONN;
>> +		goto exit_unlock;
>> +	}
>> +
>
> [Severity: High]
> Does this check fully close the timewait sharing problem that the commit
> message describes? A socket can return to TCP_ESTABLISHED after it has
> already shared its psp_assoc with a timewait socket.
>
> psp_twsk_init() shares the assoc unconditionally, even when only the Rx
> key is installed:
>
> net/psp/psp_sock.c:psp_twsk_init() {
> 	struct psp_assoc *pas =3D psp_sk_assoc(sk);
>
> 	if (pas)
> 		refcount_inc(&pas->refcnt);
> 	rcu_assign_pointer(tw->psp_assoc, pas);
> 	...
> }
>
> tcp_disconnect() does not touch sk->psp_assoc. The new psp.rst text says
> the same thing: "Disconnect on a socket after rx-assoc will leave a socke=
t
> that can be reconnected, but with potentially stale PSP assoc state
> present".
>
> rx-assoc and tx-assoc do not need admin permission, so this sequence look=
s
> reachable:
>
>   connect(fd, peer1)
>   rx-assoc                       pas->tx.spi =3D=3D 0
>   shutdown(fd, SHUT_WR)
>     peer FIN in FIN_WAIT2
>     tcp_time_wait()
>       inet_twsk_alloc()
>         psp_twsk_init()          tw->psp_assoc =3D pas
>     tcp_done()                   sk_state =3D TCP_CLOSE
>   connect(fd, AF_UNSPEC)
>     tcp_disconnect()             sk->psp_assoc left in place
>   connect(fd, peer2)             cleartext SYN/SYN-ACK allowed, !tx.spi
>                                  sk_state =3D TCP_ESTABLISHED
>   tx-assoc                       passes the new check
>     psp_sock_set_tx_key()
>       psp_assoc_set_tx()
>         memcpy(&pas->tx, key, sizeof(*key));
>       pas->upgrade_seq =3D tcp_sk(sk)->rcv_nxt;
>
> Only the new connection's socket lock is held for these writes. The old
> timewait socket is still hashed, and packets from peer1 go through:
>
> tcp_timewait_state_process()
>   psp_twsk_rx_policy_check()
>     __psp_sk_rx_policy_check()
>
> That path reads pas->tx.spi and pas->upgrade_seq and writes pas->peer_tx,
> with only RCU protection:
>
> 	if (!pse) {
> 		if (!pas->tx.spi ||
> 		    (!pas->peer_tx && psp_is_allowed_nondata(skb, pas)))
> 			return 0;
> 	}
>
> Apart from the data race and possible torn reads, does the behavior of th=
e
> timewait socket also change? Once tx.spi is set for peer2, the timewait
> socket would start dropping peer1's legitimate cleartext FIN retransmits
> with SKB_DROP_REASON_PSP_INPUT.
>
> On the timewait reply path, psp_reply_set_decrypted() would also see
> pas->tx.spi !=3D 0 and mark the ACK/RST replies to peer1 as decrypted.
> psp_validate_xmit() then resolves tw->psp_assoc to the same pas, so those
> old-flow replies would be PSP encapsulated with peer2's Tx key and SPI.
>
> The new documentation calls disconnect unsupported, but nothing prevents
> it. Would the fix need to check whether the assoc is actually shared, or
> reset or refuse assoc state across disconnect, instead of relying only on
> a socket state check?

Ok, I will need to rethink the approach a bit.

pw-bot: cr
