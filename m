Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582467;
	b=Pt0jp9BGICX4VU5/q1fSzz5W9qL2D+URnsnOEfwDzjNqzZrBPxxocRHpYTXNOtizRKAX
	 MEmjkvKyeOVwdVTvHwg9HFylwu3GSRGe/pMmC1weZ1gV4u2659IoEzCYADiVJdwamhihF
	 MZSUIK9TBROliDmIzFLM4L/eJlyABEzj4vcc02lJm/aNZuT3zqPmEX2vaaQt1iGgjhIyn
	 2vQmKXKSLZiGyViy3CggLXkqUHy3NPPkkK/qVFbHJ/lDFgGP+lEooTyHF5j5iDbOXqEuM
	 zaWEgYN2n5EYuXGZLNu5XZzhVLbjvMf06CfVdhctAxwLy8vHmd2G7s2CMkYuNuR4Czw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Xdl4Tdbv431DSm2QRDQ9sk/ziyVXTlG68qSFJIbEu6c=;
	b=UwV2mOZPHng6y7KSpqirL2z6IsAHd163jDKG5nWNOA7Rbgzniu3GbPHXrc0TZfPWZWOX
	 PQX8mTx/qbbgDiPk3k6SYUQwRyEPmk6zsg0cW4mCHObSDFAjVny+OZikEuHvPvaH/WoTX
	 2dHjs2mM4hHhxQVP136tqxKAwuZsSVUQVdXIHRT4YxHJawhOJ69LgX8tN9zNttPpgghFO
	 nkq1BvSCzP5JnM+rkDbOfqNBok/FPQ+fik5LDeyulJgh7zsLbqtubm492Nf7xDAN8TT6Z
	 3fOw21CDO3GL/eZTmnlBYTWacbeb/pIv/AGbJn57bGWI0LiITc5gO1Wv05S7gE0Qi4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlKFJQ5Q;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C5606A895
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4C5606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlKFJQ5Q
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1883938e0c.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582466; x=1795187266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xdl4Tdbv431DSm2QRDQ9sk/ziyVXTlG68qSFJIbEu6c=;
        b=KlKFJQ5QPmLUdTnjclUHm38zTF2SAkx0xiF0MhAa3Y89oCgC52J4hdLsyOdxXE9slo
         fkG2uJJxtO6pqBB0fdepdqPiia0eUjc9WNW5nj7L5EL8dt73uJxAG6IVVMx4psoVW7ww
         jwBeXuVj0KXEax7xTZnZrxu7dqfvMuEuP6BnOAqcCr++FtVqm4tGd4yS3Y1rN92TjGy4
         Ta5mjQ5XdVUN1FqFG3QuGnVMJ+9WaOhTbWILnZtdeHU/v9FJyjjiQG1cBkKqoIRemjQj
         mkQvg+v43o+eaVir/iQvs5GmAfIEILoS+Gi+D+NC2LwXcQGd1d2/rjq1t0y9hg+oTA0E
         KIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582466; x=1795187266;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xdl4Tdbv431DSm2QRDQ9sk/ziyVXTlG68qSFJIbEu6c=;
        b=rwQIUPN4hB5Gf/u0+d79MxHivWZDrkdQja8iOSb7RIbJRCiTQMHjtH4AjQ4gbcZHvY
         lFgnCgpXIVlQ0hFtjJ2Q6ME9OAOJHhAGbeyk414K14LdxuzeED9jvBu529lP5FqLjscw
         mGPXMHBCZX2G90Ah8gGtPlW3u6oUO1po27lQalu6Mj50C5+I4HP6t4LbDxVAUO5Q1oUk
         phaQmUiKwdG19fsLtvxLDup+4m9m/0M6olwoSET3C7P3c+/xAC/x0jngceiISM+2ef48
         QgVKyFB0frd7zHKt7X12aPflV3Vzr7Wf4hh89/yMc0RJ0+xYK7KjyY0jsLWN+JrmYad+
         G+ag==
X-Forwarded-Encrypted: i=1; AL+hErF4HHFu1vYQNNsJedXhHlgbJrnHcSxG/huq8bOTTh+baH2wWqdNAPjlwS9vmFMuuOS97NQ6pAM5qVCj1rh8dLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bqf4ix2mDi3UIh9rEq8dEQIVt6uj8yne8wCAxnmEYViw893ZM
	Mz8W84fXfP0htr1HwtAXtKDIydMxTfr8wQw+65nJ0lEj82xpRNHSBlHd
X-Gm-Gg: AYBFou1fTwNmta+a8DzJE2lLy1JpdIVbPHfXPu4nQHpetnsy6pk1pKUolDn/CSGBs1q
	pIqEYZFixm9cR3Oo5Jd7kQop/K3UmmzOtXlAHP9h7JvuyGgV0xBx9LJaEpdWAjb3f2pPZ+y/rgY
	CYwV1g3L4LCGuVGs/ZezFtsw5vG4yZfmP8+ad8ombawKhdjI3qkps5aGvEwGNZJ/mCA1WqBk6+R
	x+urXAZnIJ09JQXa/IJt/C10BFPJMk7xR1Vk4kL4cfrXBemNN8TJlOF6UCfcCiEtT4hCAtjX+wN
	gtV9LoslT+6iuwz3W6KOK6cRL23ZCNnMHk369dE+flqTjrxnNiXAK2LZ16SP4XX1Ga3XHLkeLSF
	ZJEn2nAzTwBK0b4PqOyZJ7uXN9rpoqDV//Sxc4452ARGqe9RkgvQksc6Dv+3ltMgmccouVIPvk2
	7SqbJYeqVhtwTOXvelxge+X1CLh3R/uQdsaD8O0hm8cGJKAxrEyPXGzc2f4A5KvmKdsKApe4PXF
	VRTXftClrMHPpwPSKJALwpvarGDrff9+DLK3Ju6xGUIqjspdAXaHXaQGNuw/nIVdKf5nuYEV4NE
	2wVexh3tPqjxXK2IoPdXEVmWSGLiibZI4Pu/hRknWZHYSw+tIqDag/H/RNcMK3Eo30eOGUcZVjU
	kXf6r5LBvRzBZR6OJZCZV7g+LU/ScMlpOhlPExzBi0mskZhpRmb14iRAzvhC5sPhVKSnww7PXIZ
	WlPxVC6JBP
X-Received: by 2002:a05:6122:3382:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee344ee205mr1106421e0c.0.1794582465695;
        Fri, 13 Nov 2026 07:07:45 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3df52b8esm122502e0c.0.2026.11.13.07.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:07:44 -0800 (PST)
Date: Fri, 13 Nov 2026 10:07:44 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 jasowangio@gmail.com
Cc: andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 mst@redhat.com, 
 eperezma@redhat.com, 
 shuah@kernel.org, 
 ast@kernel.org, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 john.fastabend@gmail.com, 
 sdf@fomichev.me, 
 maheshb@google.com, 
 peterpenkov96@gmail.com, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org
Message-ID: <willemdebruijn.kernel.14b320acee076@gmail.com>
In-Reply-To: <73aa2f53-e2ba-42b7-9712-06e223459144@mandelbit.com>
References: <20261111014208.1795777-1-antonio@mandelbit.com>
 <20261111014208.1795777-3-antonio@mandelbit.com>
 <willemdebruijn.kernel.1220f3b31f685@gmail.com>
 <73aa2f53-e2ba-42b7-9712-06e223459144@mandelbit.com>
Subject: Re: [PATCH net v5 2/2] selftests: net: add a vhost-net test for the
 tun NAPI queue bound
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Antonio Quartulli wrote:
> On 13/11/2026 00:34, Willem de Bruijn wrote:
> > Antonio Quartulli wrote:
> >> Send 16k packets from vhost-net into a tap device with IFF_NAPI and
> >> netdev_max_backlog set to 8, in the three ways vhost-net passes packets
> >> to tun: batches of XDP buffers, one packet per sendmsg() with MSG_MORE,
> >> and zerocopy buffers. Check that excess packets are dropped and counted,
> >> that the queue keeps draining while vhost-net keeps sending, that every
> >> packet is either delivered or dropped, and that every buffer comes back
> >> to the ring. If a dropped zerocopy buffer is never completed, the test
> >> fails, and closing vhost-net then blocks until the buffer is released.
> >>
> >> The zerocopy variant needs vhost_net loaded with experimental_zcopytx
> >> set and is skipped otherwise; with it, vhost-net does not batch and the
> >> batch variant is skipped instead.
> > 
> > That means it will be skipped as part of kselftests.
> > 
> > And as a misc device all tests may be skipped in minimal environments
> > if vhost-net is not autoloaded.
> > 
> > Maybe a .sh wrapper could resolve both.
> 
> Right. With a wrapper script we should be able to deal with these.
> 
> >   
> >> The test drives a minimal split virtqueue itself, in little-endian as
> >> VIRTIO_F_VERSION_1 requires. It needs root and CONFIG_VHOST_NET.
> >> netdev_max_backlog is global: the test lowers it only once setup has
> >> succeeded and restores it first in teardown, and should not run in
> >> parallel with other tests.
> >>
> >> Written and tested with the help of an AI coding assistant (Claude
> >> Code).
> >>
> >> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> >> ---
> >>   tools/testing/selftests/net/.gitignore  |   1 +
> >>   tools/testing/selftests/net/Makefile    |   1 +
> >>   tools/testing/selftests/net/config      |   1 +
> >>   tools/testing/selftests/net/tun_vhost.c | 409 ++++++++++++++++++++++++
> >>   4 files changed, 412 insertions(+)
> >>   create mode 100644 tools/testing/selftests/net/tun_vhost.c
> > 
> > That's a lot of code for a fairly narrow test.
> > 
> > Not that long ago I would have applauded all test coverage we can get.
> > But now that LLMs generate them instantly, not sure where to draw the
> > line.
> 
> Well, the test has already done its job because it immediately helped me 
> fix some small itches in patch 1.
> 
> This said, I can definitely shrink this test a bit, maybe around 50% of 
> the current code. But it'll still be quite some code for a small fix.
> 
> Should I just drop this patch?
> 
> Alternatively, I drop it from this series and I send the shrunk-down 
> version with the wrapper script to net-next later on.
> 
> 
> Opinions?

If you could compress it to about 50%, let's merge.

Maybe we can use it over time for more coverage in this area.
