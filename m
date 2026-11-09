Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228055;
	b=zj12UHlePLTo3/Qo+dTgpHQhBp3mvgtmIwGt9R17sA2a1AKkdEkocaqgL2rbhlC3WcAx
	 tJ5d8Tb3Y/S7yJUZlFuiuRWGqwgORkA31qGPg8L4+Ddbvu7ZI4u9XC08wHo+17LAcpGSV
	 Fz+3VxRgKTmWhzlUENkw3W64e3R/5DM7Shr5w1Ccfsrev7XOJBWFOOOsPKFv3RmlLZHKS
	 0+9b2TxhIf/hXRqHoFV7BahavnbGSBob9dWXkIJc3o1yeyueWMwKpOpk9adJIzvwl+37+
	 8cyqf+H1OhKfzn5/cKi33Rb/qoUQfKuUumKGBtKKceVJm0m35zDLW79TrAHY36Ngn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
	b=zi/QA9DUi3qjIgjObOu8dC4UOns4CbwDj1ORmZnWFalJte7sOluh+HQL/5iK/Qw04KRO
	 +mTbKBo31RaoE6OIq5QdqrGw6o79u58y2d4V/FT1KoTh9q7LyMymgAWtXeBsaLxjWSwmk
	 qvgXqza0T/xYfQVIKYZs11p6Ld4HH/Sl7RBOTJ+msAkaC6lhZdY6W6aUv6dC1iMuiPAsr
	 wERPITM+BhqHLW5nUjaW8eNMj/SZIFXq+SXAhRvsPy4jaLM+QY5GgSpffyldFTunIFFm2
	 QPAp11G/S5MlttwrKm9ccd2kbkezWKdxTPtmaBcSvpNYwlkpRKdhbjQWzbfxEpvy8zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJ7izS+N;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D53606A322
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D53606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJ7izS+N
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f7768acso542336e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228053; x=1794832853; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
        b=QJ7izS+Nj337/icZ8gnu/PtKd7bI9LEikfONLukvDU7r3Ya370Bl0KcCvZevMwPhgr
         S+KpQQQxUox2f7M5fZavoTgNLU2yS1Gb+/Wc4a/IK1Q+2xIE4KoIwHs2XZbz/9vvEl5O
         GKOi0QCuhlQRsXgU6Pb4irlboDW/fe4IIeCv+B98JHx2TkOd5fQNQvWxj7d3+LYsWM8I
         4JcAOjeHBogfG8zWenDpoRbyryEni+6+3mn6UV74xs3iDztePzQdf0Sb66+IZ+mttQdT
         kzynONylS+rpyPxEdUY/QH9mz/aF5O7jcssOOsK9EYjgVQV/Q3jRmFuTILxTxOy2FlQt
         yMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228053; x=1794832853;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcXkNikRo3mZCR3DVumgx3XxvXggolf9GwPpELKwp5w=;
        b=Zy2GJi5eH0HWR154+N6v6WZ3VEIP0WXaPsSTPyJJKIL7UFyNer5nZ1qfqR3G9xp8Kb
         hyGB+q6SbGBrSJAvArB+ErYc5ewkvv5rsFfWFWyR/ZrGFEl2k4r3kLqYYKqD7N4RQHkm
         5YXCGAo6Mqs2ZptHKImwBhbti5j1y8AzMcRHVAPrIbIAtbzRkmnUDT6CL4uepyZZBYKS
         wXFTjYbeyoFI7oxWdyd1KIzXeCy1jB+cJScWC1ELbgvDvZb9ECp5Dt3j9cX80F5nsW3V
         r6qzfzSt0BzspITtgnX2xd0N4l9lmsNk6iPtYSqBuyhHt+ehyciuEPhlRYAAx43Nq+mR
         /PXg==
X-Forwarded-Encrypted: i=1; AL+hErFn+27FKdMuLmp2JtsXIfu2tYF0TQ5A2JjHqKgfi3NT93ldZF6c68QzBs9VjGNCoQ35Tf7+e3U0Y1/BRcfR3Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1X3wxBVztsGkwBeWePI1D3p4+DEOppZ8yr2gNbZBT0iWSQLxW
	hgEchboBbQE6IXOIsEBST7FEbZ7Jf+zrKUi+rw+bdDzGMhMC6gkRQxPW
X-Gm-Gg: AYBFou1LD+LoKucPhKKXyqyH4t1KtvnL9A+gBIW9qXy1silWKWCMAS6LAvqFQ9TJtb5
	cE7jLZvmO21JjSFR1qdLIjKXebUqYilvZzWiGQgy06BSkMuB0V0cXnNUX2ygBKml7gpW9goJScX
	1zySZqZ3DVFLXne6iWqiLzSn4MeFx7XXHcMBz7PJwZck5gKKq9zTffUI0HyMiODgxgm3fgiy6mz
	jTvlVMlO4HlzxshBH9HjxA6tSmK5Ge0vYOTUrCxnU5E9TGB3zuIJpuyjRojY3xhXaxhng0O2Lb9
	G0l/rWFZDBqB7eUfLUVqpuqqUFa0wZDfccksxVuaoTWDMHhkKow43LwgpHkAsSyBDx7ZPyyOWV4
	7Tr+coCQkYif6p6sIo0nLZMB+JrBNrI1lEeZQ4lWr8fTTepYnWuwgMLkFQ/IeK9Ff4YOBGnLT1Q
	HgI7GSTp1QVNTXqogBAbQ63wHF+lyXGVWEf1FpcXGajcCFH6xZKozTomHWfbgPd9Zdjdkq1AZjN
	jUJQfVMksffmNDE4uAd6CicJiqtrv94jSVQjPUFB0dh9+h0hN/6Kc2W/t/txkOmC/qy23vR/1MN
	yra4ZpALgkALFx9J2nGqEYyjkwedNq6ElA==
X-Received: by 2002:a05:6512:1591:b0:5bc:e661:d673 with SMTP id 2adb3069b0e04-5c14c0394demr1140950e87.56.1794228052333;
        Mon, 09 Nov 2026 04:40:52 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b81ae9bsm856420e87.62.2026.11.09.04.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:40:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 07:40:47 -0500
Message-Id: <DMQORDXEIDQQ.2R8EHB9NQARGY@gmail.com>
Subject: Re: [PATCH net-next v3 3/5] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-3-a8dd38f5a727@gmail.com>
 <179408516694.994134.18039275084711975656@kernel.org>
In-Reply-To: <179408516694.994134.18039275084711975656@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] This patch removes the psp_dev_has_sadb() -> -EOPNOTSUPP guard
>   from psp_sock_tx_rekey() (net/psp/psp_sock.c) and replaces the old=E2=
=80=A6
> - [Low] The patch adds an implicit rule for SADB drivers (those with
>   tx_key_add/tx_key_del) that is written down only in the commit=E2=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This commit enables Tx rekey on devices that keep Tx keys in an SADB. A
> superseded Tx key is now deleted only after a BQL-based descriptor grace
> period has passed on every active Tx queue, and a delayed work polls the
> queued and completed byte counts to detect the end of that period.
> CONFIG_INET_PSP now depends on CONFIG_BQL, and SADB drivers must be ops
> locked.
>
>> diff --git a/Documentation/networking/psp.rst b/Documentation/networking=
/psp.rst
>> index 43f222b38d3d4..ceb1e232317fc 100644
>> --- a/Documentation/networking/psp.rst
>> +++ b/Documentation/networking/psp.rst
>> @@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to che=
ck if PSP Tx offload
>
> [ ... ]
>
>> +Drivers which implement the Tx key callbacks must meet the following
>> +requirements:
>> +
>> +* The driver must be "ops locked"
>> +  (see Documentation/networking/netdevices.rst).
>
> [ ... ]
>
>> +* Before calling ``psp_dev_unregister()``, the driver must ensure that =
all
>> +  outstanding Tx descriptors containing key references have been comple=
ted
>> +  or discarded. PSP core deletes all remaining Tx keys during
>> +  unregistration without waiting for a grace period.
>> +
>
> [Severity: Low]
> Should this list also say that psp_dev_unregister() must not be called
> with the netdev instance lock held? Right now that rule is only in the
> commit message.
>
> psp_dev_unregister() now begins with psp_deferred_del_stop(), which waits
> for the work:
>
> psp_deferred_del_stop() {
> 	disable_delayed_work_sync(&psd->tx_del.work);
> }
>
> The work takes psd->lock first and then the instance lock:
>
> psp_deferred_del_work() {
> 	...
> 	mutex_lock(&psd->lock);
> 	netdev_lock(psd->main_netdev);
> 	...
> }
>
> Suppose a driver calls psp_dev_unregister() under netdev_lock() while the
> work is blocked in netdev_lock(). Then disable_delayed_work_sync() never
> returns. Taking psd->lock after that would also invert the psd->lock ->
> instance lock order.
>
> The psp_dev_unregister() kernel-doc has no Context: line covering this.
> The @tx_key_add / @tx_key_del kernel-doc in include/net/psp/types.h still
> only says "Can be left NULL if device does not store Tx keys". It doesn't
> say that psp_dev_create() now rejects tx_key_add on devices that aren't
> ops locked, and it doesn't mention the BQL requirements.
>
> mlx5 calls psp_dev_unregister() from mlx5e_nic_cleanup() without holding
> netdev_lock, so it isn't affected today.
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..48bffe088c79b 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -287,10 +293,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *=
psd, struct psp_assoc *pas,
>>  	struct psp_assoc *new;
>>  	int err;
>> =20
>> -	if (psp_dev_has_sadb(psd)) {
>> -		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
>> -		return -EOPNOTSUPP;
>> -	}
>>  	if (!pas->peer_tx) {
>>  		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
>>  		return -EBUSY;
>
> [Severity: Medium]
> With this check removed, can an unprivileged user use up the device's Tx
> key space by calling tx-assoc in a loop on a single socket?
>
> The PSP_CMD_TX_ASSOC op in psp-nl-gen.c sets only GENL_CMD_CAP_DO and not
> GENL_ADMIN_PERM. The caller just needs to own an established TCP socket
> routed over an SADB device. Every rekey allocates a new device key:
>
> psp_nl_tx_assoc_doit()
>   psp_sock_assoc_set_tx()
>     psp_sock_tx_rekey()
>       psp_assoc_set_tx()
>         psp_dev_tx_key_add()
>           mlx5e_psp_assoc_add()
>             mlx5_create_encryption_key()
>
> The superseded key is released only after all of these steps:
>
> - an RCU grace period
> - the free work runs
> - psp_deferred_del_queue() moves it onto psd->tx_del.next
> - a BQL grace period completes on every Tx queue
>
> psp_deferred_del_work() checks for the end of that grace period only once
> every PSP_TX_GRACE_POLL_MS (1000 ms).
>
> Nothing limits the rekey rate or the length of tx_del.next and
> tx_del.active:
>
> psp_deferred_del_queue() {
> 	...
> 	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
> 	schedule_delayed_work(&psd->tx_del.work, 0);
> }
>
> If a Tx queue stops completing its snapshotted bytes (for example, the
> peer sends link-level pause frames), the grace period never ends. In that
> case tx_del.next keeps growing and new device keys keep being allocated.
>
> Every PSP socket on the device shares these keys, and they aren't charged
> to the caller's memcg (only the psp_assoc allocation uses
> GFP_KERNEL_ACCOUNT). Once they run out, tx_key_add() fails for every
> other user of the device.
>
> The commit message says:
>
>   Adding a time based rate limit per socket for tx-assoc to prevent
>   wasting SADB or deferred deletion queue space is possible for future
>   work. For now, users should avoid presenting PSP devices to users they
>   don't trust to abuse this.
>
> Before this patch, a socket on an SADB device could hold only one Tx key.
> There also doesn't seem to be an in-kernel way to limit tx-assoc to
> trusted users. The rest of the series only adds selftests, so no later
> patch adds a bound.
>
> Could this patch cap the number of pending deferred deletions per device
> or per socket, or rate limit Tx rekey, instead of leaving that for later?
>

The cover letter and commit message discuss this. I think adding a rate
limit is a reasonable bit of hardening that can be done. My preference
is to introduce that in a follow up series, as I think this series is
already pretty dense in terms of complexity, and deployment-wise the
admin user can hide PSP devices with namespaces, or block all usage of
tx/rx assoc netlink calls by just disabling PSP on the device.

> [ ... ]

