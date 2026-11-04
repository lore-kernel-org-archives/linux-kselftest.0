Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806883;
	b=JxR9X6GTKcmfd0ktC91Hv4hxZcff7CyUa2zGw5XfmYg4drXH7hK9fS/inQKA1oLl6Xv1
	 AwRiAyknyPd3IhdLoALNrvt+gRhHXkwUObfrt9Ln0XMtCJd3NukSIgrMHf6V/C//dZNrV
	 iATvChi3TdxogcXtJfqUT0MT/ahVugCgnYqQjAz/QEv220aN3nHIx4osiJLuaavmgWGa5
	 Tzi6GzO/PjkEj3fckthPuFnBRUeaPG84E7JWbu0t7EBTPM+OXhoOVYr9OIfGTKDRMiZcQ
	 xrnh3eIU0nwllR8eqqhkdGH2+ghwdr+XA2ER/cbAMiWAk784htdDmRJzGh1lJT/OGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
	b=I7SZcZjbV2ExzAfEtxynpTYvO7raoSk2gzhV8MSHXfKuxaAgUM5dMSpkjwbwEYcbxTFH
	 JLHfeSpZjsxtfOEdEEcb5AJ0Xf8QU/HkYgEq5WsQ0uYODz3iPwHxV+E6f5pRGNhb7CUmH
	 pjhs1bGu2V+aNlxc/2WZftPceGiI4wUa0/bYy2MMiE4FFfCScx82/+sqQCTHhAJvC8o8O
	 ICGEf7+2jEXruGLLnPH0GJQ29okc/nEplrLF1OoSKAw8nH/kvFed7S1UnFaikS8TgmEje
	 qdDOMzgnUpyOxHN2Gh+VItuzC4vZIPeJdiDbeFo5e3zdDe5FO/2h9n1dZAIszYVsjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HjMV6rni;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400C606A32E
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 15:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4400C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HjMV6rni
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so2918368eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793806881; x=1794411681; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
        b=HjMV6rnirPdJA5id8UtVqWjrEqOxCFYgbInEUndmQBG9IGwqDf4eKd2nUhUcDuBa3W
         naoBjcrkRW9gQf1MgmsEvth6cdjetKsDsXk5XwDhxNum0s1qFMPG5+ilvaSzEQ+xZYwY
         Tv84bFqfYa5rKy+gTZBe0bSqag2Uj/m70AJqsib5x6i3m9jVMzOnLwUHLDlB5N/Yy0bM
         XL/iW1TkDGelxrI33iHoh2+RTycqt68eYKdYqnBam82nBZdAnsI5QqyOYER9lr7Q8Uol
         5fCr82D46xBT1klUloOTTCg1G6OOxhv2vXv4GNihAsw8nlvpL4SA20uZbSuQ4dPVuriQ
         4jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806881; x=1794411681;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
        b=MqiQz0UdbhneL7fS/JlnFamSUYaQtzIN1AY/W+P4E/rqrPZuu1ZXHvilhWcTistuxr
         KoXz6/h8FjpjDVWQnYuaNar9YvpBuiiSJdLMliwYe9vkd01DbFrOEiPOYp7n9dqftlvk
         Dpf9EPGVO1Em16FMmRVhAdcUrApxjIyZGkZ7DfBoXUaoyeYzeX1kiMt3LVLFjhPJnbmx
         linhJjF1/7INt6n/SB1/XJOqbGQLPdYOqLSVmsKDZIl9I3zB5BFlGkpS2DoXtOAR+kTo
         y/UoLNnRv1IjyZJVMhC1+1YKyYVR84FzXkcHGht9dMje4mmXmWko4XVQabaklUHhwdm8
         xeCw==
X-Forwarded-Encrypted: i=1; AKwUvByYp1b90lEPet8k8GN8BSbe+dbcYl+eQ+ALrY+tbEYQRBHA8AdCXyZk3y1Kkf9Qa3n+39GlCUDsWTU0KEUZzh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+um62toQQSIJotCm4D28viI1Y69Ce+3IfOSnG9PZ8ktFrCQCEd
	PM3yt7ypXuGXoariqgZT+4uUBcJvsVVqt1sbIUjW9zZ656jVzqhBO86Yp6Uyd6bpqwoQVizB7C6
	AKykmE3NbuowZkSO9jjSK3qyh4A==
X-Received: from dycmb18-n2.prod.google.com ([2002:a05:693c:20d2:20b0:359:198a:8046])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr35928950eec.33.1793806880735;
 Wed, 04 Nov 2026 07:41:20 -0800 (PST)
In-Reply-To: <20261103235152.1904727-5-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103235152.1904727-1-sdf@fomichev.me> <20261103235152.1904727-5-sdf@fomichev.me>
Message-ID: <18e4e1daa184cadc.3137322e32382e36372e3935.ceab9.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 15:41:20 +0000
Subject: Re: [PATCH net-next v2 4/7] net: devmem: add a per-device netmem TX
 frag size limit
From: Mina Almasry <almasrymina@google.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	sdf@fomichev.me, almasrymina@google.com, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, razor@blackwall.org, daniel@iogearbox.net, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 3:51 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>
> Devmem TX frags are bounded only by the net_iov size, which is about
> to grow up to 2MB, more than some devices can describe in a single TX
> descriptor.
>
> Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> frags to the limit of the device the binding is attached to.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  Documentation/networking/net_cachelines/net_device.rst | 1 +
>  Documentation/networking/netmem.rst                    | 6 ++++++
>  include/linux/netdevice.h                              | 2 ++
>  net/core/datagram.c                                    | 1 +
>  net/core/dev.c                                         | 1 +
>  net/core/devmem.c                                      | 1 +
>  net/core/devmem.h                                      | 1 +
>  7 files changed, 13 insertions(+)
>
...
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 3ac700d37e59..ba2f887dcd39 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -12350,6 +12350,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
>         dev->gro_ipv4_max_size = GRO_LEGACY_MAX_SIZE;
>         dev->tso_max_size = TSO_LEGACY_MAX_SIZE;
>         dev->tso_max_segs = TSO_MAX_SEGS;
> +       dev->netmem_tx_max_frag_size = U32_MAX;

I wonder if netmem_tx_max_frag_size should default to PAGE_SIZE instead
of U32_MAX, and have drivers opt in by raising it after verification
(e.g. SZ_32K for bnxt and U32_MAX for mlx5 in this series)?

With U32_MAX as the default, large frags are enabled on all NETMEM_TX
drivers unless they opt out. For example, fbnic also has a 16-bit TX
descriptor length (FBNIC_TWD_LEN_MASK) and only avoids hitting
dma_error here because its tso_max_size happens to be 64KB today, and
gve hasn't been tested with >PAGE_SIZE devmem TX frags yet. Defaulting
to PAGE_SIZE (similar to tso_max_size = TSO_LEGACY_MAX_SIZE above) seems
safer for existing and future drivers.
