Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645939;
	b=jX4A2GOhHxegYnlxHneN6SaadS4j6X6DBVr9ob1z0mYRmR4tsmbg/3RizyrhSgjoDd2i
	 mT9OFN40oxUGFNbLW5Pf2V3ZbXsCpSZ3R0ulAo8WTGTIRuE1WStg2a8oaMXl3ZAN4/1rz
	 aje3kAE78bSCD/DO7L5DzzKJUj0e27vvnM0VtK37UAaY9RLodxwK+M2nyJI3nZJ6UYw+H
	 T74A7Er58RJhpDy/Edg9+EPr7kDPgK7O72njFC2VxD4N9ME1dk3rWxWXZ2mQhH1yAZ5M/
	 D7/yVixLYYbz8g5tzBnlEsHAzWlIszNDf+Us9qkp8ll6Sc69tDHcYTwcr1V0TXIyZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
	b=oXwyGtqMc7N1pqDcyGmMP/Nztr5iLnmQF7xge0VeoGp2NMovn14i8hyJk0E1cd4+ydtR
	 yRLmc7vASSFhZ6560ZD8Yaz/WiXoXv1GKm3sFiJ46Ifsot6xUPLOEHQNDcesubXqlq2U4
	 HkfV/iGoPYomUw5VjZ07tn/BOKssg/r4EOAYHlZ92C15HNNLYbEoJW9EaCe6StLDJmtTy
	 51wZ9mBj0qL588YTTJsD6DGo+18AUwnSHQw4qEvbS7NzQmqtgwQdkMR33t/J64p4o+JLD
	 AcQVBH40VMPAdTtM/zljoNcFa5W1l1tUk8TyCB5+vBJ9myyXmJX64UzePuK6nIBtmlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E0606A327
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 18:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065E0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3698bd5392cso2892910eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 10:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793645938; x=1794250738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=PozYLQ4wJ91rva5JAu8n7V3l3TRDv+1xTlmu1F5D33tEMCR3nJEayW+q/9H0EOctz+
         TfaRyKv5C/bbE8DeFK6+i3wBa0qp+pQZcxEeQ4XpZDijoqoiYdBKMgde0/0nwXs7dS1E
         h2mmTx0ujLGzkGXIv4fph/lIoMxttNu0BT8zNdggyCPDidxiGeCh8VCmIWaQ5UoiK9M5
         9mDPDUnqV3q5suWt0EGAy2i56UXwy3KlDoUmS6pG9716ehk9wUTcilc0uiQoTz4vkdNP
         ts4y9t3PqFDZgAbUc5tbQ7Q4zevugRIZLPqimSAhyPDLATEGDCjCZI5vfBxkpBln3N7r
         zHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645938; x=1794250738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=YdZny0T+Vti2rapGcGy/S9/+rlh9W4cBA/fTwwbDXonzQTFEmHHSO8RuCNIIynftiu
         +55zDEmQSYvd269VNFGwhWTK+KEa4yC2YOBn16kOekcTE221DP69xMRoi/z/27Y3FBb6
         spilgEFEQIuXA6aY0sO0C1YUkVlymYQYQrwBv9FA3ZUYi+SutrCHl7pre0NBIc2TqXv/
         B+P8NkNvv8SXwjqzplBbxJUZwJHKbeq6G0eVSrSkjvXnMndo/ErqFD4/toRqwbHOn1X2
         GHIFmXNHIV5WtdhTffro7cjBP5Jh49BtuAME6Op4PgxxbekrEugUQm0F9D/40vRXQiXm
         8Krg==
X-Forwarded-Encrypted: i=1; AKwUvBzvLXzLZDhkjCfneA8HZrYXU1o0NHqqRb5O35T6J5XmPP5WXp9qhkBPudpeqy6YilhxOTSdTRZkywWRS+CUHps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hpZWZ0bJ6gZVLoBBcpwviPghLPILnME0bU+WqIFuNas/qJPu3
	uIfkdEc8lGnkz5BbksqXvQyRpNULaCfU7zV+xrTYLoPNgyzwxvAncr2Ua0woE9cIRFVqCSK+Wv/
	hIpRK6s2wPWNCneNTjghJtAG7Ew==
X-Received: from dyjo24.prod.google.com ([2002:a05:7300:3398:b0:359:198a:8046])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr15472016eec.1.1793645937269;
 Mon, 02 Nov 2026 10:58:57 -0800 (PST)
Date: Mon,  2 Nov 2026 18:58:56 +0000
In-Reply-To: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102185856.1824792-1-almasrymina@google.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
From: Mina Almasry <almasrymina@google.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com, 
	kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch, 
	sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com, 
	kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 11/2/26 00:16, Mina Almasry wrote:
> > On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>
> >> - [High] The dma_dev use-after-free this patch says it fixes can still
> >>    happen for RX bindings made on a virtual device that leases queues,...
> >>
> >
> > I know about the issues with leased devices. That needs a bit of a
> > rework, which I have done locally, and would like to send out as a
> > follow up fix.
> Will such follow-up rework the code touched by  current patch/series?
> how much? I'm under the impression that at least the fix for the issue
> reported here would be quite overlapping.
>
> /P

I pushed the follow-up branch on top of v5 here so you can see the exact diff:
https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
(commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)

There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
the net_device explicitly to net_devmem_lock_dev(), factors out
net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().

I kept it separate only to keep this net fix smaller and easier to review,
since the lease issue is pre-existing. Happy to either land v5 first and send
those 6 patches right after, or fold them into a v6 if you prefer avoiding the
churn.

-- 
Thanks,
Mina
