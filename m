Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007E4D0CD4
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955781; cv=none; b=hSMIDeYTMR8Q5xsF7v96CebwuseWU40VN7FDVjDRNf5QOCdWtCgnNl57FQdDBvDyyBNNxDgwFV6iFxMlvaJYkv8/m3CM2VzNU5f374d88HiDJmmC1KKy5Te6ZKvzqKdNDNSLnY3NcxPRxXFR7kIDBDupZLKoQKjR3eJkmHpFsBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955781; c=relaxed/simple;
	bh=3N4HhH1cWkzqVHOUQ925Ryetzqlgwmf/5cwKJ8Nc0Lg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T4YsddFhyYCJEcBwn0U/Z1aEJbLH/pXSJlpv4wLLDwsZoe4zwzYmFkFAEKCMei1nDPmsMIruErZsA7d2Zq1SXDtGAzxNshmFfqI5i/nnq3LS6ni+Kni8dnPqGAy7Bjbjy2UVdy8nZqZ8k5IWFVbDV65tkO674igkOZw46GWhG/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ila1rktm; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ila1rktm"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c5818c4a4so547531985a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955778; x=1791560578; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kwrkrr/vf7kFupAjZIcmWfwkxiNpoHruTeKfYbyUJk=;
        b=ila1rktmyNPVD1+vcwUASkJanAQx+ERfJXVTq9c2vItfSSEK+WCAsLiOHx2AxVEVhh
         Gp36PS+MPHqPXABSfJUwNJ95pyzPt2ch7Yi+w7HAknTzWMEYTmAgnqW8BmGJR0L187Cv
         BJ4AADsZC0NFexYiKokDS4MH+O5AI1j8+Znsa9kazUJa/4dtH0Tyn58lYWFuoHdlOvIx
         ekceZvbZTccTO2Z92tgnMG/ZrsYLToqlEk+d1/kSQEKj2CHSC3tvJhkhg1BiniIHY/K6
         XkcPEo16JXVrA9SVVU8WaxjnRGP+9Nvft0qicOfH+QtsPqzWknJui6+jg8HO+N/157hZ
         Hdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955778; x=1791560578;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kwrkrr/vf7kFupAjZIcmWfwkxiNpoHruTeKfYbyUJk=;
        b=zC6s77W3AqB+MZ/7YHR36KowGbvcdyAJvVxm4iX1i2gHtDZlctS22ctNVTaCJBaFoM
         bAEz2ls7wxeE/cSkALwT4XbF8nrzS2Lss/50d0BucbW5gxQo1fKHCeiheu7z5RY6O3C5
         NUIHhr4ofAcWu31xrr0FOY8lLX2IMwXIU5FZLRkTNaOxyjrE58uGJzi+PsUSHprJs1bH
         f4MoHvem0oOU47MP0fPe/68dcn+I5JhQT73SU6WWrPgx+jAUvEYRh/VPnu/fNoHqU/PD
         Bo/RwovstvW1PB/BbJf5LJne/5WbbqJDtp2eNqEi/9Rg2Zc1of5zQS1yVYCmDGg/6rS6
         tTtA==
X-Forwarded-Encrypted: i=1; AKwUvBzKOuz3TX134y1gdwOwo+xT8SqyFxPQnh67yMuRzANzMjyz5jALH/K3YDoFEmkiu8sRv8j3VptG4vxCeXLN0V8=@vger.kernel.org
X-Gm-Message-State: AFuF++m/8KTN6FRiQJQl737ApAo0wAXn+OCh5tJwgOhtnXHQQgAzRPyu
	mz+rpNIVj+wnx3/l8itGQhY+dZI0XTebGF22qDob5g9ePvJ50FaW5k87
X-Gm-Gg: AYBFou03NQ/gp1F/RlJnYPta9M+NUhrEVn4Uv7SEPWJtmPkp8K80qbQ2uxTbA0I3W9Z
	uvXGDASw2DCqgF3tqKMQUwn25y7SE2FuLSPNORJq/36WQp5/Twfc1foXVWEHApZCL1JXAgBv662
	a6At9Dl36Qf/MA0lWXQ+8JT8He6joZOp3b4tHdUPf2mOVwQqW0quA9vkaDNkbF/qpCSlyLYEJDH
	DmWeFUI0bhenl/8rEyk2A9PUVDfwJh44hmdC+oWYzCxBJ1WOmFfzKRwsCOiXsRGle88oCV26Vn6
	0Rpjiyg+RUnm72Rpz/Zi8RHp4AwW87ZSPvXm9KuV4mGKO09Xp6Ql3yQU8yabElqAStW7asNl+32
	Z3vKfvLd43Ks0u1pDu+EG66IpZq0eXP3q+DC+NAeRPwx7SiVWzaGncqqywvh/VQp/HiL2U1S3Vu
	2Ye1SXB1xvbIZM5MbStG7p+yAv6xqX8GP7f2gtk3QThkHgGTlY/Xj81tI8ZCx+MBxPaDn79nw5/
	38=
X-Received: by 2002:a05:620a:a0d7:10b0:938:e23a:2ce9 with SMTP id af79cd13be357-93cf16b5abemr419579685a.16.1790955778210;
        Fri, 02 Oct 2026 08:42:58 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917d5938934sm22628306d6.5.2026.10.02.08.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:42:56 -0400
Message-Id: <DLUGU5KA6ZRP.33X0TT44Y2ZR4@gmail.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <shuah@kernel.org>,
 <willemdebruijn.kernel@gmail.com>, <horms@kernel.org>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <kuniyu@google.com>,
 <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v2 2/4] net: psp: require an established
 connection for association setup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
 <179090927139.434549.15378852090892678294@kernel.org>
In-Reply-To: <179090927139.434549.15378852090892678294@kernel.org>

On Thu Oct 1, 2026 at 10:47 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new check in psp_sock_assoc_set_rx()
>   (net/psp/psp_sock.c:162) rejects every state other than=E2=80=A6
> - [Low] The commit message says the new sk_state check in
>   psp_sock_assoc_set_tx() (net/psp/psp_sock.c:261) fixes a bug from=E2=80=
=A6
> - [Low] The new psp.rst text (lines 139-141) says "connect() on a socket
>   that has PSP assoc state will return -EINVAL".
>
> --
>
> net: psp: require an established connection for association setup
>
> This commit makes the PSP rx-assoc and tx-assoc handlers reject sockets
> that are not in TCP_ESTABLISHED. It also makes tcp_v4_connect() and
> tcp_v6_connect() return -EINVAL when PSP assoc state already exists, and
> drops the PSP overhead from icsk_ext_hdr_len in the connect paths.
>
>> diff --git a/Documentation/networking/psp.rst b/Documentation/networking=
/psp.rst
>> index 4ac09e64e95a5..0f9b6b73f2447 100644
>> --- a/Documentation/networking/psp.rst
>> +++ b/Documentation/networking/psp.rst
>> @@ -132,6 +132,14 @@ numbers in a way that deletes a prefix of the PSP p=
rotected part of
>>  the TCP stream. If userspace cares to mitigate this type of attack, a
>>  special "start of PSP" message should be exchanged after ``tx-assoc``.
>> =20
>> +Upgrade to PSP must be done on established TCP connections.
>> +``rx-assoc`` and ``tx-assoc`` will return ``-ENOTCONN`` if
>> +``sk_state`` is not ``TCP_ESTABLISHED``.
>> +
>> +The PSP assoc state of a socket is not reset when the connection is
>> +torn down. ``connect()`` on a socket that has PSP assoc state will
>> +return ``-EINVAL``.
>
> [Severity: Low]
> Is the -EINVAL statement accurate for most connect() calls on a socket
> with assoc state?
>
> rx-assoc and tx-assoc now require TCP_ESTABLISHED, so a socket with
> assoc state has sock->state =3D=3D SS_CONNECTED. __inet_stream_connect()
> returns before it gets to sk_prot->connect():
>
> net/ipv4/af_inet.c:__inet_stream_connect() {
>     ...
> 	switch (sock->state) {
> 	default:
> 		err =3D -EINVAL;
> 		goto out;
> 	case SS_CONNECTED:
> 		err =3D -EISCONN;
> 		goto out;
>     ...
> }
>
> FIN or RST teardown leaves sock->state at SS_CONNECTED, and
> psp_sk_assoc_free() only runs from inet_sock_destruct(). That means the
> new psp_sk_assoc() checks in tcp_v4_connect() and tcp_v6_connect() can
> only be reached after an explicit connect(AF_UNSPEC) disconnect. Every
> other case returns -EISCONN.
>
> Should the documentation say that -EINVAL applies to reconnect attempts
> after an AF_UNSPEC disconnect?
>

I suppose I was thinking more along the lines of the AF_UNSPEC, because
otherwise, the -EISCONN is the same as any non-PSP socket. I could
change if a v3 is needed.

>> +
>>  Rotation notifications
>>  ----------------------
>> =20
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index a9cfeebe4ba1b..a6b1c42dd626f 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>> @@ -159,6 +159,12 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct p=
sp_assoc *pas,
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
> [Severity: Medium]
> This check in psp_sock_assoc_set_rx() rejects every state except
> TCP_ESTABLISHED. The commit message only justifies this with closed and
> listen sockets. Does it also remove cases that could have users?
>
> A TCP Fast Open server child returned by accept() can still be in
> TCP_SYN_RECV. It already has a dst from tcp_v4_syn_recv_sock() or
> tcp_v6_syn_recv_sock(), and it is the same socket that later becomes
> ESTABLISHED. The point that the child does not inherit PSP state doesn't
> apply to it. On that socket, rx-assoc now succeeds or fails depending on
> when the final ACK arrives.
>
> A TCP_FASTOPEN_CONNECT client also returns from connect() while it is
> still in TCP_SYN_SENT.
>
> The commit message also says:
>
>   "establishing PSP state prior to connect() will result in a
>    PSP-encrypted TCP SYN sent to a listening peer"
>
> Is this true when only the Rx key is installed? The SYN is built by
> tcp_init_nondata_skb(), which calls psp_enqueue_set_decrypted():
>
> include/net/psp/functions.h:psp_enqueue_set_decrypted() {
> 	...
> 	pas =3D psp_sk_assoc(sk);
> 	if (pas && pas->tx.spi)
> 		skb->decrypted =3D 1;
> }
>
> With only an Rx key, the SYN goes out in plaintext.
> __psp_sk_rx_policy_check() accepts plaintext as long as no Tx key is
> set:
>
> 	if (!pse) {
> 		if (!pas->tx.spi ||
> 		    (!pas->peer_tx && psp_is_allowed_nondata(skb, pas)))
> 			return 0;
> 	}
>
> So the handshake completes normally, and tx-assoc can follow once the
> connection is ESTABLISHED. With an explicit dev-id,
> psp_assoc_device_get_locked() allows rx-assoc on a socket that has not
> called connect() yet.
>
> Before this patch, setting up only the Rx key before connect() appeared
> to work. Should the commit message and psp.rst say that this sequence
> and the TFO cases are being removed as well?
>

Not supporting TFO in this way is by design. I considered that rx assoc
could be allowed as long as sk_state is not TCP_CLOSE or TCP_LISTEN, but
that seemed more complicated than needed. For the upgrade model,
requiring both sides to just be ESTABLISHED seems simplest.

>>  	if (psp_sk_assoc(sk)) {
>>  		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
>>  		err =3D -EBUSY;
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
> [Severity: Low]
> The commit message says this check fixes a bug from commit 6b46ca260e22
> ("net: psp: add socket security association code"), but the patch has
> no Fixes: tag. Could the tx-assoc check be split out and sent to net
> with a Fixes: tag?
>
> After tcp_time_wait(), psp_twsk_init() makes the timewait socket share
> the same assoc:
>
> net/psp/psp_sock.c:psp_twsk_init() {
> 	...
> 	if (pas)
> 		refcount_inc(&pas->refcnt);
> 	rcu_assign_pointer(tw->psp_assoc, pas);
> 	...
> }
>
> The original sk is then in TCP_CLOSE with sk->psp_assoc still set. If
> only the Rx key was installed, the old psp_sock_assoc_set_tx() accepted
> the request. psp_sock_set_tx_key() then wrote pas->tx, pas->upgrade_seq
> and pas->drv_data. Meanwhile the timewait socket reads pas->tx.spi
> without locks from softirq, in psp_twsk_rx_policy_check() and
> psp_reply_set_decrypted().
>
> The commit message says the patch targets net-next because it depends on
> commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash
> and lhash2."). That dependency only matters for the rx-assoc and listen
> socket part. The tx-assoc state check works without it.
>
> As posted, stable kernels with PSP would keep this race, and backporters
> would have nothing pointing them to the fix.
>

The tx-assoc and connect() bits could be split out into a dedicated
patch for net. Tests in psp.py will break without the first commit in
this series.

Alternatively, the whole commit can be taken without
splitting, but the changelog may need to be changed given that it over
promises on defeaturing listen without the dependencies on
unhashed_state

>>  	pas =3D psp_sk_assoc(sk);
>>  	if (!pas) {
>>  		NL_SET_ERR_MSG(extack, "Socket has no Rx key");

