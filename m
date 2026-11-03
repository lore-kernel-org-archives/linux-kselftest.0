Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748422;
	b=o6lAgJaF24LoGIFy7cxzRQF9EOJxU6HXv1A0XBmTVySf3y99x0OV2di36d0KnF0vHcW1
	 bW981IA0w5E5DcnFwUCubqaCjHEoU7XNVcBfe8mTN1ZDvCrkf1FDyVgKyv5Y9/e605wVp
	 hyTWKp+2IPC2WsvjcfvfuS4pT3jhbsNfkKbNE6jwSMLCG3Yd+R8jUgfpIC4JXfRfAQVKk
	 eAqy0VhmlPWWnqV86WF1O3VKzHCUnliiopXjx3MNZZazvEFedxcGOtfWs6j50Vqq2hCle
	 89VKAOug0ffwK8PwDRQwG6C6c1y5RaUrp6y2srvxbsY1Oig/FP+FNdoBiOMiTJkz88g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
	b=m8TgThOrq8RpfQlRDvFaxZxYllSEtW+omAVVXgBJdutY3XjIfPRFlEexj6qm4YxebWCf
	 n1GtJy7xr94OAYs7OB5afd4csdzC9fGF+LE3RAsG/NyS37RJwXhu9Z84M6cVdamQn3vxH
	 D8tZ28bOkYSoSg74AYcqp15LtYd/r4ViVVTKaD1KmTQ0j6sxAhNNM5wr0UVzLu3MkJGsh
	 ztoFpob6ZS08Oehhc5jFSScJW0F5QzPqT4MRePUlmDp9D9+/HwccHg71qba/sCNVOgZuT
	 MdihjIIlXRqtjNBU4HBl2qHWkYDXGFsQXVXlidMj1otFnt3MgxvoY2W/nep4E4y0Qjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kMqQ5/+Y";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B775606A328
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B775606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kMqQ5/+Y
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso131713eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793748421; x=1794353221; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
        b=kMqQ5/+Y3q+3svE8pMnZxDPk4dEBWFIZpEzNnbKht5uygeHOSpTFh1FfkhHL4jxNSg
         hs/M4i1gK8tL+d6Xb/h2b8iNMF+Mgmth7XA3bijSxNHkAAPYMwbgz5UKv55ujE24G6/O
         RoDQCz36Ylpau1m0BSKQlLFquBABJNJDb+ftwe7Hdb7pFZvkd00Q/VDEujlMGNlE0YbV
         Gg4mvJtd427alIgL2np2OEjFpwYU2OESTtccko8bdnzKv6D739uHQTWg+bJnet5YWGux
         h7TigQZBiEXh1QQSre7xMft/7cLZETtPzLeA5qcNE2RnlRwfOgyzBAdCkeSURbyvpb9h
         uc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748421; x=1794353221;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
        b=qtDZcTC8m5/3k8RI2R3RUrJ9R+9O651GJQ2MhT/1DLKL7VUIr+RRmUx1+lfrI8ggRG
         3XkOfVB1eZJwUVykh1/N0tH7RtWxVjcm0wV0jORYF5X4igeSTbCMzBRPvd8jiesdeKqf
         0NyJBny6jDehfv5iGn6e6W5FpVfH7qsE3SaEGJ3KFtLgtTWBy1XO7lRnFQe2vG1b2V6D
         dRpiNbXizkF6mMoWH1kU5+ApvO9+z0Q5Hs5cR50qZpOF369aDmuKJVhi5uTByaRp+hRU
         MuH2thm60wYRzV8zP0fq3JW5aV3nVjF/iWMZTXJeUxJifDbaDRXWLLreiO68FtdrCFY0
         Ux8A==
X-Forwarded-Encrypted: i=1; AKwUvBwCflVA/cxpAddzwuAsChNlWcVm9DCEgwzQNEROiEsHbpzD/A+Jzs4jkFUZ+zrI92KGuLXPpK0z4YA2ksGz2bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F30TVU8gRr+BUhJvmOgSGggH8fDKmcc2qq6je4N3Mp1GpEDhK
	ExINmB35Oejkg4Hc0OL/dv1hMwIMykoxTX6ndWtXAcMO1Mzk0UArj5VKjFq9giN1txqrUJcE1cj
	jvOGLOzumd5R1SVJCsC1oDwj/rQ==
X-Received: from dyuw3-n2.prod.google.com ([2002:a05:693c:8803:20b0:351:2266:121])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr19610913eec.37.1793748420418;
 Tue, 03 Nov 2026 15:27:00 -0800 (PST)
Date: Tue,  3 Nov 2026 23:26:55 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103232659.1340283-1-almasrymina@google.com>
Subject: [PATCH net-next v1 0/4] net: devmem: support leased RX and TX queues
 on netdev unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	David Wei <dw@davidwei.uk>
Content-Type: text/plain; charset="UTF-8"

Support leased RX and TX devmem bindings when either the virtual device
(e.g. netkit) or the physical backing net_device is unregistered:

1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
   can lock either binding->map_dev or binding->bind_dev.
2. Rename binding->dev and binding->vdev to binding->map_dev (physical
   DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
3. Always populate both map_dev and bind_dev for direct and leased RX/TX
   bindings, and rely on dev_memory_provider_uninstall() and
   netif_rxq_cleanup_unlease() to uninstall RX queues and clear
   binding->bind_dev once bound_rxqs is empty.
4. Add kselftests in nl_netdev.py covering leased RX and TX devmem
   bindings across both virtual-first and physical-first netdev
   unregistration orders.

Mina Almasry (4):
  net: devmem: pass net_device pointer to net_devmem_lock_dev()
  net: devmem: rename binding dev and vdev to map_dev and bind_dev
  net: devmem: support leased queues on netdev unregister
  selftests: net: add leased devmem RX and TX netdev unregister tests

 net/core/dev.c                           |   2 +-
 net/core/devmem.c                        | 121 +++++++++++----------
 net/core/devmem.h                        |  25 +++--
 net/core/netdev-genl.c                   |  58 ++++++----
 net/core/netdev_rx_queue.c               |   5 +
 tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
 6 files changed, 249 insertions(+), 94 deletions(-)


base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
-- 
2.56.0.385.gac671c819a-goog

