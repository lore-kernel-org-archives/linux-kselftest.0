Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751254;
	b=vzt3TNZyV2nGF1O7Sym6GqZgrn597fOjPixc+7J7LysLHrabJ2m+dYSLHo4wjcEKAPO6
	 iVFc5y+CAnGpYfqZ64rNBvGHxJfdhMFkK+rjIQdhfO4rG4qmxvQv9MFUWyVHW6JoqZmyv
	 52c9dA8fotTlkmhHbhRnGVOF7EpzkBuygtMIS3WDuflgyu/Z68ae5OlC9XLGdkV212hng
	 BehNAHZVscd/iDULqRRWKbMsuCJ0/NyH8Les99/zwP8IpZv3zpadYoXjERbFjPbrTFCOG
	 cKJAVC+Z41b+9dMkNF+yOwcSiOxqhUrPod78h4jAPXY0t6M+B7pKV+Mae2b5mAV3B3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
	b=2M3oL3KOB25KkThSQTpYJyWaejwlHTi9niZlCqqVGaCk1r9Sq3xPcKQ3oRAIGceyAIeW
	 pkqQDWPrYcPFK7oAvP0ruk2+nXTO0NCkZb5DQjlk+ENWX5y9aIOkFjkcFfkrgz9uOYZgQ
	 dahZekTMkTExgn2HFX4g6cTqj2CB5vNEolHQryoxhJ2m4eDyEq3sOpW0/3phX8hm5FzfL
	 h/SCntXTDMpyG/JiwLelRb7CwmXROKh96iLQX3XxyiFzTGbmaa9+AS3EjIafL1H+C7oeO
	 jaMoTf2xazj9FcthbBT8/GpomRDXOKU1uGmQJlmilGnzs2q0i3iakVFTnYwXyS0SKLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gpsiXt+L;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC99606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 00:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC99606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gpsiXt+L
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so380325eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793751253; x=1794356053; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
        b=gpsiXt+Lx1ZaXcGETB/DpG859ORQWw34HeZ4i/HbRZkr2HrHRYRnlQClCxPPrvdMBS
         GEflGEM2njFo3OKgBIVjNYlaCgIw144SlM7nIaotrEa0MWvxmqBS0BdWomjoHGW6iEeP
         DeFrOHsmBQIbnSwRrgOLE8Q2EwTb8Q53jI/z2AJw1IC3Oy8XIJMd2wDBXvvDOxuaO6hN
         bcKQqDRyLcWauKBNgtcURfJ3O4vAUZ+PsMzZXXFoC38sJkIdqiWyppoZ5/AuULZWjF7Y
         E6+t00iSLmoJbKR3NDF32G7Y8yMxrxl46JsGRRlo599aOF2HOj7p4J4j1ksFDMw0v5If
         Bblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751253; x=1794356053;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
        b=GFV1kJsDFgzMy17h9dfR0irYmFPYqC67ls1IvU4XCaqSCqFdkZV3arQGAOqTcBSWwU
         G4BFNHNVQV/hV6iSCMkw/xKIIJDSajyVDDLdPBsc4Tv9Ajig6DOUtSWiIc4OjYvBltt+
         TuDdcrEQRuOG9UyKw+4wlxGo+6U5MH8JfJgfS4af31rtQNLxmyhl5PlehD+xss+Yp39r
         9Xx+7xQhS4AMmdNmWXqbh6284o4j60MQq12+5EwltZGgcN7c7xhAnoIkb6vHBgfbgTtH
         n9PiSJygSHXHJ5kfc2xP61t/4vdNgy88pVabX5/FIn6GaC+BXsNURJzCKTuidG/QzyWk
         2jjg==
X-Forwarded-Encrypted: i=1; AKwUvByt03pqGjVPUdPg6WOOjcRIMl2ZzQ0yslWGpjRMw0G4uHFnQ9BnokxfJWeN/VQgGGCApIfKG2mV0LOWpuNAjwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B17LxaGoSST6F1k4hdfhcFpri8P76Bby+nIUSUeYu9MNZ6OHG
	vSwMbY8BcOfT3CSYMVCgKV6N43WHBHu1K3aTPg4ox/cItxq4H17TV0o3ZRjTu+u2Gdtnll613iR
	2fKA+zJb5U0BHpceOOSec1Neprw==
X-Received: from dyclv23-n2.prod.google.com ([2002:a05:7301:6197:20b0:36c:a067:eca4])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr37881360eec.21.1793751252976;
 Tue, 03 Nov 2026 16:14:12 -0800 (PST)
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103235152.1904727-1-sdf@fomichev.me>
Message-ID: <18e4af42c8b279c4.3137322e32382e36372e3935.1c58a7.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 00:14:13 +0000
Subject: Re: [PATCH net-next v2 0/7] net: devmem: size TX net_iovs from the
 dmabuf layout
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
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
>
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
>
> TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
> A single frag can now be as large as the skb, which matters for
> NETMEM_TX drivers with tso_max_size above 64KB:
> - mlx5: 32-bit length per data segment
> - gve: splits frags into 16KB descriptors
> - fbnic: keeps the default 64KB tso_max_size
> - bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
>   per-device limit

Reviewed-by: Mina Almasry <almasrymina@google.com>
