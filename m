Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001325;
	b=b84xCMC2cY1HJeVyExku418ZkQr3gyQ7CBY0k3GNtlbM2scWEItvx3r3K3wyCZIGgUPP
	 0Pwe6Q0z4UDX4dCaB+t/tK11w51wzoFYzC/jNp8cz4OXyOHrApFi2yoIRQTKZNJqn1Lj3
	 j6y9mNAgStjKJHU2jdvigPjutK6Kl/zRUBytTsP3/iem2PZk12okEJFFA0AlWVR6cyLKz
	 13gVkvfE/hMAnC1R7IU5RYSV2YM7KOLyDPYn5XhLka+/dAtHuFywMsOkQ9hr9kIWcHiGT
	 c/ZYvLkoV3P5mXyK4nS/YWYTC29qBQyDFJ7naLy4mt147Ab/dj7uA5pmTzNGl3GxSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
	b=qwZ67rGH55Y1CfKc4dK4RzB9LfW9V+PErdiE/W+tKgesZ8B6kk0+0fEf9phvWRoY+y6j
	 vnedumHI8Its3CY1I1XHsUb7wKlP9QJIiB1ILgoPxDOayBQayzrZc7kc1dz2crvK/p0Ns
	 FX7pBpTDU3XoMGTJfN/S8xa2LljQWSeEI7bm9JHPdCVNZ6p8MXx7Df9OcrduZtEG1Oqwa
	 pt+QV5vYrxQDhpljZxltrz+NBxb66p+Hd1soDLMueX8orahff6xsT/qiPZNDSCq95Hx5o
	 Z/h3JLDKnPgDv4SbgGP/LJ7Ha6VsMVHbCtoCY7aJ4eb2LplcTWGxr8hnrgybQ6OKrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B55606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso8556976d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001324; x=1795606124; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=J9D5OyQQ7CtDJfGNBTDrS8xXQb1oxOlFHB2CwmcqpmdeGfNTXI0akJ0lAfAC8TqwEE
         W50Zc7KjwtcLjWa64N2bJICEox+7cN8GZp6uc5A+aZVDr1EgOu+t+DzvVISOmYq2iAnP
         PN/umpdWd49EvKjLiMbMTTDtc2chbXkrfAjgKwizy/4ebN+GLj6a8QG9/g9QGRq3LP2F
         5aqm27u+smmz8Up+MD8FsgOPaxTto6ProUjm1Ki35/BNDk9qaIae2f3/ow6m/6yAcjKq
         cLv7TJBXbB76xCs5dvWqFwpFu2U8Z1Q49AEo32dVZKR7hFJLipWw1HLWdgp89P5IDKk2
         3zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001324; x=1795606124;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=boHAQKdVl1EM3/Gli3uJqkr0z7JSaHZG4LpDmY7UrtLXz97zqtaCj6oNFFi5tlkrK6
         fF96YoRnzMEhoEpyPnJ6YLdy7ceii1LifS4L9/Gi4cDAj2f1D4Rb/PTOdIcHLRQNJTOK
         7D8MtrhNA7DfMzKbmvY1jNqOr4OTpNM33Q+M7NEfywGXDwSb1ta6sKrk/hzRj2XlE9vI
         Yjzh4nQ4Ob+dFow95K+RobKTBEXducdg4cN40aRQOs+QkIzh++3CjG3JrbRYOj9nZxU4
         EPBQ25nfDxQQ0fmg9WucSbPVh6i0MPpKk5u2tEyXEh0AlnWQ3NXPfvtq8wAGaG+R9ZOq
         NtIQ==
X-Forwarded-Encrypted: i=1; AL+hErHjjwSiaXTqhss9bkkfeKqtlSdnQMQooQYho4g5nyjCHlAaMgMnIMtbiiS2sZADfIMAR3HjHSLsDYs7Pm4sWAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G4TQsTuRYtY+UysgO1toIa2m10MpimCPKP3XI8ZkT/Q3RoDxa
	90k4EJZ/AjxGHZJO5NTiT6uywOU3YOQ4ifc3883zniBD1zZN2yb2fchg
X-Gm-Gg: AZFdTZfdC5xoswHXKqIa2b0MXwdA0eS3WeA6qYqMWs0xYVMS2fKxaRNt7OPgHoyhyu8
	KYz3oGQRaejIXuG8ss4LkW03gA9wtAXxfTTckhBbGF9srTAP320LMjI6MuuSbwRhHHkF0tx5Zi5
	vx6Y1hIWuZmoNmspw8fVCPmSOmPr5y6engYiW1Vl8cHt/qLfNEW/goo2Ebx1JHuLJ5w+Ey5ma9i
	sg22HzvJL/MAD967DS49meHXEeWjX5s3LNoJd8OqLvhGsKXv5MsBuEUAHV9hBryNXzFmDfz3pSu
	cj+9zbV04a6fgwahXINAvJ1aoN7AXkJZTE6xcBA27uwlTF23McyvnIx+K4YPIGb1XQxXOR+rcWv
	S9v4nWzRLloVASYgU3gu0L+E2p8yssqV/jHKe4ReCvESZNpYGhlfdck4T0KMVtkt+pVjUvtvR1f
	HnmbnkiY/1+aXnWfChluzG0wPyqxS/kck8wjoGnPUoQAdEpSUlyfAkHL/FC/JdDchEWE61tGPL4
	tJiikBs+Fntub2EjzQjH9zfgH+XVaopMxNm+CI4afcvGKufRQilFCgq9k9hoed/bJ9VnzHJo4nf
	MSGwHJMJkMWtdHzlNyhHayCC7a8dG09xEQ==
X-Received: by 2002:ad4:5aaf:0:b0:91f:329a:904 with SMTP id 6a1803df08f44-92114ee2ddcmr32476686d6.32.1795001324220;
        Wed, 18 Nov 2026 03:28:44 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d35dabsm19207126d6.17.2026.11.18.03.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
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
Date: Wed, 18 Nov 2026 06:28:42 -0500
Message-Id: <DMYAV3MCA9T5.180N4MSVXNWT@gmail.com>
Subject: Re: [PATCH net-next v4 3/5] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-psp-v4-3-1a599df2aefa@gmail.com>
 <179498190614.3136.5698785790307751985@kernel.org>
In-Reply-To: <179498190614.3136.5698785790307751985@kernel.org>

On Wed Nov 18, 2026 at 1:05 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new PSP_ASSOC_DEFER_TX_KEY_DEL path in `psp_assoc_free()`
>   (net/psp/psp_sock.c:118-121) gives up its only psd reference before=E2=
=80=A6
> - [Medium] Removing the SADB check in `psp_sock_tx_rekey()` lets any non-
>   admin user who can reach the PSP device rekey one established TCP=E2=80=
=A6
> - [Low] The commit message never says that this patch turns on Tx rekey
>   for SADB devices.
> - [Low] The patch adds a lock-context rule for SADB drivers that only the
>   commit message states: they must not call `psp_dev_unregister()` with=
=E2=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This commit adds a deferred deletion queue for Tx keys on SADB devices.
> A key detached by a Tx rekey is removed from the device only after a
> BQL-based descriptor grace period, which a delayed work item checks by
> snapshotting per-queue num_queued and polling num_completed. It also
> makes INET_PSP depend on BQL, requires ops-locked netdevs for SADB
> drivers, and drops the check that rejected Tx rekey on SADB devices.
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
>> +* Before calling ``psp_dev_unregister()``, the driver must ensure that =
all
>> +  outstanding Tx descriptors containing key references have been comple=
ted
>> +  or discarded. PSP core deletes all remaining Tx keys during
>> +  unregistration without waiting for a grace period.
>
> [Severity: Low]
> Should this list also say that psp_dev_unregister() must not be called
> with the netdev instance lock held? The commit message states that rule.
> It is not in this list or in the psp_dev_unregister() kernel-doc, and
> nothing asserts it.
>
> psp_dev_unregister() now starts with:
>
> psp_dev_unregister()
>   psp_deferred_del_stop()
>     disable_delayed_work_sync(&psd->tx_del.work)
>
> and psp_deferred_del_work() takes the locks in this order:
>
> 	mutex_lock(&psd->lock);
> 	netdev_lock(psd->main_netdev);
>
> Suppose a driver calls psp_dev_unregister() while holding
> main_netdev->lock, and the work is blocked in netdev_lock(). Wouldn't
> disable_delayed_work_sync() then wait forever?
>
> Even with the work idle, the later mutex_lock(&psd->lock) in
> psp_dev_unregister() would run under the netdev lock. That inverts the
> lock order the work uses.
>
> mlx5 complies today, because mlx5e_nic_disable() drops the netdev lock
> before mlx5e_psp_unregister().
>
> Could the rule go in this list with the other requirements? Something
> like lockdep_assert_not_held(&psd->main_netdev->lock) in
> psp_dev_unregister() would also match the ops-lock WARN_ON check in
> psp_dev_create().
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..48bffe088c79b 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>> @@ -114,8 +114,14 @@ static void psp_assoc_free(struct work_struct *work=
)
>> =20
>>  	mutex_lock(&psd->lock);
>>  	if (psp_dev_is_registered(psd)) {
>> -		if (psp_assoc_needs_tx_key_del(pas))
>> +		if (psp_assoc_needs_tx_key_del(pas)) {
>> +			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
>> +				psp_deferred_del_queue(psd, pas);
>> +				mutex_unlock(&psd->lock);
>> +				return;
>> +			}
>
> [Severity: Medium]
> Once pas is on psd->tx_del.next, its psd reference belongs to the
> deferred queue. This path keeps no reference of its own across
> mutex_unlock(&psd->lock). Can psd be torn down while this thread is
> still inside mutex_unlock()?
>
> Documentation/locking/mutex-design.rst says mutex_unlock() may access the
> mutex after releasing ownership, so the caller has to keep the mutex
> alive until it returns. When there is a waiter, __mutex_unlock_slowpath()
> releases ownership and then still takes lock->wait_lock and calls
> debug_mutex_unlock(lock).
>
> A possible sequence:
>
> CPU1 (psp_assoc_free work)         CPU2 (psp_dev_unregister)
> psp_deferred_del_queue(psd, pas)
> mutex_unlock(&psd->lock)           mutex_lock(&psd->lock) succeeds
>   still in slowpath                psp_deferred_del_uninit()
>                                      psp_dev_put(psd)
>                                    mutex_unlock(&psd->lock)
>                                    psp_dev_put(psd)
>                                      psp_dev_free()
>                                        mutex_destroy(&psd->lock)
>                                        kfree_rcu(psd, rcu)
>   debug_mutex_unlock(lock)
>

Ah TIL. I was a bit naive that mutex_unlock() can still be running while
the next waiter enters the critical section.

pw-bot: cr
