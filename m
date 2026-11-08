Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174243;
	b=g+kb+pmnAaWT9RAALTrECfCkRd1qGF5eXLcPQ+gzq1894SxMbnnTq57QBZdjDH1JVr+W
	 SRoZ7YhPPpQbxBuUFoqnNV+Tio8jUe5pXQN1nlg35rTqQLvAyDeb0V4AzWUG3Xeo0Fs6X
	 208pLQYapqxHTioJ8a4Jp+Z4RdYwp7TIATBbqYhQzhbpeiqUJycwxyaCVqxjS03uyME41
	 aNNcSPb02eHLfIj/jAsuj1Vq3xkm4TLZDVSTYlpibq4g9mNfHl8cgMbKl/0SajARlO6nk
	 G//IK59CdLCr4Nv5W2+kAGrG7MAKf8H/kPsL84SuVTylyUpOYa0RVWNrC5p9dKjROdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y10z5AzD+i22lo7RP46fqtgjpar7IW8k2qpztw2GR18=;
	b=k3O3a8jPFVwmjmKM5CiIJOlhavog4yTTDwsQh2dOzVcwYAGhyH0HwZcg/NkxMoxcpjT9
	 OZfCas+VrISZfnxhpPDfVBv2ENrzn8+AWnK6GeKwq5u7iZajeKS0g3b/IpdLBMPN9n0l9
	 ISEo1TjxNwtIwFpBqA2SCbkwe6idbZP/Z0nYF8ljpT4wJoiscaxpbZOi6JpSGDjzyM9Br
	 o8GvJVksjJ97aXfwWe6EVcmEig1ay8XoEWdLVC+ognVsEiVJZrXPV7kANmd7xeOy7I1R6
	 vREcdoGFLDBVcsDFvW8nU3Sa5O6wMr1Zoo6VL7ZaaG/WflANuCNSoqpkRYFGiQEitOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Sr6yDk4d;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60414606A320
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 21:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60414606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Sr6yDk4d
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so436008a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 13:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794174242; x=1794779042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y10z5AzD+i22lo7RP46fqtgjpar7IW8k2qpztw2GR18=;
        b=Sr6yDk4dtttSFsLiVpGOBa/SdwfLyad+WndTtGDMVrwbwUEW+v4mm00fVFKu8yDnA1
         wyEAr4CEHKEhS4ndIll1qHxbwFVo2TxN+nmDGCFHY8qB5YowQ2Jy9/MDh9R++vG8hSLu
         dYgy9bSDHQdFELf+JSbTYNm6Wtc8/KjFWI9Bx44NnX4P27EMTEIoy82G3n7SmpOS8uk6
         G0wQ2kVsR2nI50m4XPIz/XgRU6EVhs+dHpMPmSoq4+9Nb9FOPyE45NjRIK7hn4kNIZ35
         ely+fNVEv+LDHnYkHb31OSzYzWJ+2qBHkUJHLNsLM5eYuE4UjEhWOexgb+un8vvBTp7D
         9qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174242; x=1794779042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y10z5AzD+i22lo7RP46fqtgjpar7IW8k2qpztw2GR18=;
        b=OjonFgHkzGbEqAXK3TKrUq8vhYzpXhoAX/XTtdCW+yFsVzXTVYH1twJgsTIbUfZ5f4
         VASJppMG4zv5M63dX5s0J+cPGHRLJb0n9ZkYWghILokWL8caWFrd9d0KLnZRzEx2ehS1
         e1rA0AQBR4Tut9yF+8FuAftqztkJQgt37aE8gifHzx4i6KL6cJ40ctYljtOo1NNJ8+up
         Qh/PlEbJR9mmGOGnV+RIAYmmE83H1gdjstH0b2WEYRsnJcQZM8Ed+6G66X0k5MO6JcxT
         IyAxEKiSuv9Ukb37uSPZa9mGEDoMfU27hFN2MsXERnfkWd2ea4omSmQY61fIphKc3lFk
         1QSQ==
X-Forwarded-Encrypted: i=1; AL+hErEr2j23nDqhba28M4gyHfrjVLvKGvHNz+5phnOIgr7umaaLo1BOJfGhiQK/lhQQVV8FyQ+SQPGjMTmdJXwjT/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uqKGZ8lOnKLU12IQJUvP1RZL/wx7hyzFnOhsik2H+cteRQJbq
	9bP+bqgZhWCo9Qtc8AD2nkHLLGatslccVuVYlE+eoGaIPSnAXj4fvlw2ifZJr2nnTPA=
X-Gm-Gg: AYBFou0ccDSxZaDyYcgrSvh72oVHxlgwb+DEzH+AonY1dSBbV/itvknap5qW8vjElcB
	HpeQzYZxtxJuF0EAF75MK9da6Pk99j8wc0Q65r4eYYPUfQC4Snkt0RQSaQmKoGz+N3BacqPnADo
	8Sq2+Zvk2uFNs3XMajiEI9E/lk+afZN3VXLI4vUbQLOO9M9gLLoV+7djz8BhWMTwOSVBPfb/RqP
	hY6fjvTWNCJHfkmG3SfZF8oZZ3vxksPj0eNYOdsPupCdDgIXF/zcFI+exKrYApSQFOwxjo6jT6o
	4GpOOCD+oryRi3qm336onHv/4roq1ItL1QyJmqgyQHEuvzmWGvQilles3jkrDeG7SYczxETdrL8
	82q0R6nDLhlMknbg8vGyTkGFkVheoV7M5aHLuExHvRPZnw69Zd8nBUVuMN1wgyxmrOcV7XQaOme
	fFasaXFVDUb2h4fGD464rKXRfidycJKJ1DDBpaI+wsjZyc5+ZRjBE99HLiorVn77N/CQ3bSdyhm
	rnraWTU6wgWNV7dLHXqQe3MmGIL+tZKGrfSvys0CuMfD50AWtEa3715Y7PUOOmJlOnD2Nq2gXWm
	t1N9IC+SjMUCrowRS+gDWF4l7b/RBbMVgApQT6OjXmuVOnGyFeT/CZoKdLK9i6NVxxMvcnegD/e
	/+D+3A2lu
X-Received: by 2002:a05:6402:320e:b0:6b3:e89b:128f with SMTP id 4fb4d7f45d1cf-6b722466c43mr1643975a12.9.1794174241711;
        Sun, 08 Nov 2026 13:44:01 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea3b27sm742043a12.11.2026.11.08.13.43.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 13:44:00 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Sun,  8 Nov 2026 21:43:56 +0000
Message-ID: <20261108214356.95406-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com> <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com> <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Sun, Nov 08, 2026 at 10:13:03AM -0500, Willem de Bruijn wrote:
> Pushing back on another design choice: the UAPI change. That both cannot be
> undone, and is fragile and laborious, requiring manual admin arithmetic.

Thanks for the valuable feedback.

On fragile: a wrong value never changes the packet. If it is too
small, the push reallocates, as it does today. If it is too large,
locally generated skbs on that device use more memory. So if the value
drifts from what the programs push, only performance changes. The
software that loads the encapsulating program knows the size and can
set the value at the same time.

On manual arithmetic: user space already does this for netkit. Commit
b9ed315d3c4c ("netkit: Allow for configuring needed_{head,tail}room")
lets the Cilium CNI plugin compute the headroom and set it on the
device.

On "cannot be undone": the IFLA_TX_EXTRA_HEADROOM UAPI does not block
in-kernel mechanisms. They can write the same field later, and the UAPI
stays a bounded, explicit value.

> The RFC patch mentioned two other approaches: explicit headroom requirement
> labeling for tc and BPF, and dynamic adjustment of this field whenever a
> realloc in the stack is encountered.
>
> They are left for future work. But should those instead be implemented
> first? As said, this manual hackery cannot be undone. While in-kernel
> mechanisms can be refined and built upon.
>
> It seems to be that this series is trying to address a few related
> situations and argues that no single solution fixes all except for manual
> adjustment. But likely a combination of the above (and more) will.
>
> This does leave the veth peer to solve, but that does not seem
> fundamentally intractable.

Regarding labeling for tc and BPF: it is also a new UAPI, and a label
increases the value of the device that the program is attached to.
That is often not the device that the skb was allocated on, as in the
cases below. If we have to add a new UAPI anyway, I would prefer one
that covers all of them.

I looked at what dynamic adjustment would take. The kernel can find
the device to increase in these cases:

- XDP on a veth peer: veth_xdp_set() and generic_xdp_install() can
  increase the headroom of the peer to XDP_PACKET_HEADROOM on attach
  and reset it on detach.
- A TC egress program on the device that the skb was allocated on: a
  check around the tc egress hook catches a head reallocation, and the
  kernel increases the headroom of skb->dev.
- Stacked devices: a vlan leaves its tag in skb->vlan_tci, so the lower
  device can find the vlan with __vlan_find_dev_deep_rcu(). macvlan,
  ipvlan and team keep the dst.

It cannot in this case, which we have at Cloudflare:

- A service in a network namespace sends through a veth pair. The host
  forwards the traffic to the uplink, and a TC egress program there
  encapsulates it. ip_rcv_core() has already orphaned the skb, so the
  kernel can only guess that the veth peer of skb_iif allocated it.

Even where the kernel finds the right device, auto-tuning has problems:

- It grows too easily. Background traffic counts the same as the main
  traffic, so a few encapsulated health-check probes increase the
  headroom of every skb on the device. A threshold to filter them out
  would be one more policy value to choose.
- That growth can move skbs into a larger kmalloc size without anyone
  deciding it. On x86_64, for 1500-byte MTU UDP over IPv4 on an
  Ethernet device, 194 bytes or more moves the skb head from
  kmalloc-2048 to kmalloc-4096. That adds 2048 bytes to the memory and
  the truesize of each such skb. The IFLA_TX_EXTRA_HEADROOM UAPI can
  do the same, but then the operator chose to pay that cost.
- It only grows, unless it is reset on detach. A reset on detach must
  find every device that the auto-tuning increased, which can be a veth
  peer in another namespace.

So I prefer to keep the IFLA_TX_EXTRA_HEADROOM UAPI. If we need
auto-tuning on top of it, we can discuss it when someone actually needs
it.

Thanks again for pushing on this. If you see a simpler way to do
this, I am happy to change direction after discussing it with David
Keogh, who posted the initial RFC.
