Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248963;
	b=1gsJ7cyNQ3os8DHqY1xz4S+jhbvNl7Uu4bsNg7bZ1kPnKv14GuDLuXE09ZzCL9x1wAL5
	 luGcKs/InJzbftKH5X+ksj3NN6zZu+o6H3SiJ2iWE1N9E5x1SjEZTOaBqqG4DMgfjr3cJ
	 K4yXHYu5COHYdPvOUnteyBKSUB2jADVMNFIQoaPcGEVkzPLxP55D3b2E9cdr+RgcNeF64
	 Qkgw0J9mY2wngPfIkAA11HfSJkpIkslr5IrpTBDj38CAeD47srF+enPLub7g0vTAggFXz
	 ARLy8J49xKtr+S31Wxpqjl2F86EsRHN0waPhJaAa6uI4RTLEq0tBLQm6NUrcI66RIAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
	b=A2NhTO41rJ6ZFwBQh6laBdyuSYL8lJsJqkmt9m/otSoZ1dgaN92OBO1e2yV51gwYUdRo
	 UKcvaK4DOpKgnq2fVGN0BVZss7g16lZY9lI9Z5Rw2GeYHOPfsO0xBGZ41QOxxko2fPYjp
	 xkTIPXzcOq+kaaAyZn0bXkk0EJdwbNg5fxkmI1O5F2AdVNGGxfGtxLUPeT48EgArCW9Ya
	 WzvEaDRmPyKO9a6rjeeNl6JQDm28nDreIOPk/U6D/LgL1NA9wRjmc8GxYHApnWSGG+xu4
	 6HoochO5L993Zjq935K2SAnLuQ8Sa5Q1RFsFi4lQLO8j1pIr8uozD9/wOSXWZR3bfcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS;
	arc=none smtp.remote-ip=74.125.82.195
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4A60A383E
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A4A60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1498209eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248962; x=1794853762; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=X7wedxBSS8iZNbIq3uVV6Lk387o+XeGOfTW6Zk2cySFVKqEWn7Djj69lXsU8s/kpKz
         tJiJ1NC1pNUqxiy43lTvIzQnaR1XWltnvNswRXYTYKvJhMy1Ym9sy/gLTRWhTzeoZy/r
         kf9IurJNAyUB0JwvE50fsKX5uraHf+5WXfCjtNq7xr/i9v+AGqhqYTaRQLpfpje/s44G
         JAaCcBLIk5pgtY0fMS2yln/+byA2YY2Cjh8Vsy4CPhQB/kcoPBKf8PLdF0pQZM0hwa2X
         mCEmy0QrvQXIQcY0xkadgOuk8+FykA/urSyQYxogIANNQn5HVGBPGbcSPTXfDKNUDh9f
         93Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248962; x=1794853762;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=V+bqn6Q1PS5ZQNlgfSxMxS2lP62Vt07Xh5OG/Z70yl50RQH4rXvDAqimuAEGwpuKLu
         hdPls26yfuFjNfuBT1HtzTGoED/sai5mNrf8Bf5Joympf2CTXHaHMcpUgIVcIB/obQ56
         z09011cOWRVvz/zP7dxissd5ffv7Ak6uSfffeq2lzkAVzfsP8mv1CSoj6VwCDtI8bA61
         2pWh6DMpqU0fN+fbN4m+lntMcxRiFmMZLhpX6qFV0M4hCFn0KcFVy/wkcqhxXEzx8KdM
         O1W8aoODIJC4qZT/+B/DQXETIyhqyX8zuUaYDGhr0rGpMOE4Uw/tdbnWjH1OpKQGYJod
         eEdQ==
X-Forwarded-Encrypted: i=1; AL+hErFAo9BcWWmSrwyjiY8X0Bs7qwHw/lQqo8Rm6f0Jp7RdqBYT6C8t1Dte58dJPjpivMqiHXLxK8wa5y+dd/39mTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8klfpDAmwNTgL6o80nRX0FbEJsrtGXsaFj7OOnWVZSwf5z/SSu
	fvLfTQXKvotXiaKMyCWVTEwNWau2Kodj9xRV0TshOSQm/bTKzmDFF9rh
X-Gm-Gg: AYBFou18uL4zkCTx9mWvbDbDYifNLULqxoTyR0MW520AuuFCA/kEDqq8Vym8nbPkmtm
	I8Hmm1A+K3HPx7E4qV7UV5LMIX5WTOdRJAHmklLVawi+GbcXDaq/5MUWBcKuFaaspBoDQUYIhK3
	zW0kIy8D3OmTxxJFzKGDzJZE1mPJTRvm5+bsGStUl+mqqI0SaAE8uET3BatjKJOXtAvKpXcRxWr
	M/jQL5wUHpjQk0kgtk2Ewl1hC7kRIx/AdveWM9YtDuZNQEP8B+Ln4pAH/Vijy0QIkU1CCD99ALi
	dHv4lcaB1Rpty1BUmskbRyRWssxL3VK0LDYxjAgZ/I7EPlFdgbNkdNIvGhnBGTAXDb81lGCDNu+
	/ZdpLKdDI0J5Is7/71SzBQv8hwIn65DVoHFJ17PtGgNqzmVihKha3pGK+2iloxqK8EV79tUAU3J
	LroJHoKhSgJ8cweHVTseV4dEwgjjzDjknltnOYgor7Cy3cVUxdrO2LE77KbeliZ/Rz7DKWihV5e
	yeXemfSC+zMa6aq48qAr3zvAv9gQiaH7WXldygkw1pZ7cSTpXe4YsBk2NEVwcuHvzrsRNI42G3G
	e1yZAvs6OdcPH8aMzQsdDx4=
X-Received: by 2002:a05:693c:8312:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-3750a20b93bmr299470eec.23.1794248962308;
        Mon, 09 Nov 2026 10:29:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm117168eec.15.2026.11.09.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:21 -0800
Message-ID: <86219505a92ebc720950d87dc76662f3@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737701.994134.5100743053640770189@kernel.org>
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

> > @@ -734,6 +734,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
> >  
> >  		size = min_t(size_t, size, length);
> >  		size = min_t(size_t, size, iter_iov_len(from));
> > +		size = min_t(size_t, size, binding->tx_max_frag_size);
> 
> [Severity: Medium]
> Is this the only place the new cap is enforced? The netmem.rst text added
> by this patch says "Devmem TX frags are capped at
> netdev->netmem_tx_max_frag_size". TCP MTU probing looks like it can merge
> the capped frags back together later.

[..]

> Could tcp_clone_payload() compare skb_frag_netmem() and stop merging once
> the binding cap is reached? Another option is to skip MTU probe
> coalescing for unreadable skbs.

Hmm, let me comment on Mina's patches, might be easier not to merge
netmems in tcp_clone_payload at all?

> [Severity: High]
> This isn't a bug introduced by this patch, but the same merge check in
> tcp_clone_payload() looks like it can also combine frags from different
> net_iovs. skb_frag_page() returns NULL for both frags, so the page
> comparison always passes and only the offsets are compared.

[..]

> Should the merge test compare skb_frag_netmem(), the way
> skb_can_coalesce_netmem() does? Nothing later in the series changes
> tcp_output.c.

Mina is gonna take care of this:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
