Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327792;
	b=aghejoaZcZxRgUnZOSCKF01P1mlqNuyuH4BZpjwdRRNXI6WoHb45hrWdy8BgHpYo6QAi
	 If1bg06Q483wnScOo9obCN37sGkHW3TJpAomn6ONEHieD3tc7Bm2SzTWWqRAHuN4MSU8a
	 kbsRQL9gdb3veZvuJINGBNw6phcL9ZjNoY3EZ/smKrSIDs5cwLWSnILWiakLcXt13OoSq
	 WQ0wfXXAM2AP//n08QfcHZThXexQUJ6DpYhUDdWeI6BoHM/5LcJaI72XRrJU1dGAjWy/x
	 SGzdkXS/ZT5EmGuDHg9ZZ/kw3gyJDo1E1EKyLeD1xWrbU6a34vSMBHyuEQ5/z8wq7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=42cpwdtrc4HrP4DqyvReN7gjWda0yb9ngByLx/bSiMU=;
	b=BHX+oMfryO/5sMkYAmKqBpKdJFqlwrw/OQBv98sanCklX94EdEUU0Q1NILfrsNdqABVU
	 2ErDQBHe64Eu++HBhoqiF9PViuppRkpbF+mZsf6LZhGAE5qzFBR0EabrHRW69BjFa2YgC
	 cGQH8ZwA2kqKaNcvkjmtpldTzr4shU6NszvsR9VBGcqev9O5MrLxZh30ka8pERUAmh3wx
	 u/a2Wnc8GEGYaay52Ow++p0pVuXg8cbYv+IwNMi0rwv+nTid/zALAu2GHViHJAFdPmS70
	 QMg1pYJlzroX+vDx7Z1vYx49pizATl3YzzNhNApv3/RJ5ZyMP0lVu45FhiDi/VY79OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k9jynX5W;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BD606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k9jynX5W
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e9528732b4so912185e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327790; x=1794932590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=42cpwdtrc4HrP4DqyvReN7gjWda0yb9ngByLx/bSiMU=;
        b=k9jynX5WUmAeD9j2NE6/ggs5zDZLdvScu7YwYXbqBbHL22S8jy8N7eEfyWdUvgcBpF
         8TAHUcgd9VnzhBUjoptLnC2COcPn9xKFLvBh2LvJTPkk9frz8XfKNrLC4YMk3T7aRsTc
         y5BqzughtJdwuo03qMeGDlzdpIWW9LTkAJVgO/wunOYTcgDRD8NE6D+4pTVaCLr7nUiA
         uo2X6xEjzPkrR8zphv7oYSD9b8iVKcnZpqlk+Xe11f1uXZIuVS3fF1qUgiJethGSaUS6
         wlcxLJaReAQCdUgdwFNR3hHlOpTVBIM7HJhltfl/pnlWIeN8VeVhcBWXaAwF/v0hnspp
         gNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327790; x=1794932590;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42cpwdtrc4HrP4DqyvReN7gjWda0yb9ngByLx/bSiMU=;
        b=srF4l4G0svrNqhTsh2/eshIwdpHvqSi894h4IMo+1G3+UOCFLFJibJJCixLCMiUKrB
         GDuzIWkUqBdzGqVQ9ij0TkSWMcKvyPn4QjJNdKBPWTB0hy6vY8165BdK0T8Kt1PhcvLA
         7biAr4oEQJqUJSKIGK9gJXKtIm8JpR8pqoLbD/JZnMqaYL1UxcbWeKTcs02EWT8CrCb3
         VA7HhZWLA3ZJOpK0w4fmDM5oa1Dabk4L6h+Y0ea7Dhe1/vxM5p2t6ktGseuQbiVg+weS
         3lyfUqGsQ7AI2fIjujXYK0gQjnUGFMnJKUYBAUIVxYqXi1tMuke59DxoTafvo3JxhUGw
         t2ZA==
X-Forwarded-Encrypted: i=1; AL+hErFLmlhkdF9/xYTZm0cI7+RLatF6PS9oYIQjj9nB8sRw7OoVPgamg8v9Ih7x/Tx7peWXUZ5Fwz26NjGv4rx+B6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c9D2IRjJ8DuFmhRC2qVdLS2zfhcyG0KqvnDd/UFPDcowpQ374
	P7yI26eVZvkHYuq1rgS7eaJKqVWCVvlEke+GNwIVcUF3GnYCspaKzm9S
X-Gm-Gg: AYBFou1wYjU11Hzb60xwfXCVkZmCF2fQZkLZFcoheVZjKXPi2cBLDd/Y6Vak7HOgU8b
	9uJCQOqa4GM0+ar4l3ICT4pSRhHsPFPJ3fXTzdiUWbs0Feyfdp8JckOES+6AoUkHPjqicpQMegp
	rwXNMdzDNHuslWyQ9fefWDZxkLaVCj/SiND9iC3GEHAYMXhHSLF/STHzDWK4ontWnmoiS/aTlcY
	AlmnAdCgQJ68ZjJG+69uK6QxFEwYlDf08x8k/gjHJbCpsLM50nyyQZKNRSiyhNRU05Kbv1a0BRF
	8EIoJ7nP08MPLnP+cPcKF4KIvX5j3YN2PO6psdeK6MKqQBJDB3ltuhfyKCNjDNGkWxl+9+Owt5r
	huXwd10AJ5i2oHXuZKlshLyDYKAFHYj49iXBSfVcPT9dQO1Y2PyHuWNGvD6SK/QoAwS4VimVvGr
	ExfxcaV0UCb4c0ucbYNGh7/ayJcRIM7BAGxD8q27o2I5tdsnRUq/cf22YnNREW0QVfBb/pv4SQU
	mWIZ0NxSX1XPse8VtwwCgMMLkS/kSjsKGnC40WHlJql4nxf3XScxvzMDOiyTeec6TUZtbhK5eH/
	ZrvKAZq/Anv4IJDEc0Z7thywdxIkuwe/iIohDTI9cL3P+nqfglL/bzCXlxaFzxZr3i9qPT/Mfq5
	i4WiTvwuV0sZhv4KtY4ndzGcMczZQWc0UjwS10cyXzjfPA94uP5QJP2LR+cb9d++Wa57GOag=
X-Received: by 2002:a05:6122:62e9:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee0d19e59amr1124633e0c.22.1794327790334;
        Tue, 10 Nov 2026 08:23:10 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200838f0sm2123832241.9.2026.11.10.08.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:23:09 -0800 (PST)
Date: Tue, 10 Nov 2026 11:23:09 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org, 
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
Message-ID: <willemdebruijn.kernel.935b9bf7f1a1@gmail.com>
In-Reply-To: <20261109154909.32748-1-tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
 <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com>
 <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
 <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and
 LL_ALLOC_SPACE()
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

Tianyi Gao wrote:
> Hi Stephen,
> 
> Thanks for the invaluable and detailed review.
> 
> On Sun, 8 Nov 2026 19:08:31 -0800, Stephen Hemminger wrote:
> > Since the motivating case is XDP, the mechanism should let the XDP program
> > ask for the padding it needs, rather than making the operator translate
> > the program's requirement into a device setting by hand.
> 
> The series started from David Keogh's TC egress case, as described in
> the RFC [1] and in the first paragraph of the v1 cover letter. The veth
> XDP case came later, when I found that the same field also avoids the
> copy for generic XDP on veth.
> 
> > Your own reply already works this out:
> >
> > > - XDP on a veth peer: veth_xdp_set() and generic_xdp_install() can
> > >   increase the headroom of the peer to XDP_PACKET_HEADROOM on attach
> > >   and reset it on detach.
> >
> > That is the mechanism, and it needs no uapi, no operator arithmetic, and
> > no stale state. I would rather see it implemented for the cases it covers
> > than add a permanent uapi that removes the incentive to do so.
> 
> Agreed. For this case, I plan to move to this in v2. When an XDP program
> is attached to a veth device, tx_extra_headroom of the peer is set to
> XDP_PACKET_HEADROOM.
> 
> > On the argument that program-side declaration is itself new uapi, and that
> > the labeled device is often not the device the skb was allocated on:
> > granted for the general TC egress case.
> 
> For TC egress, the kernel does not know at attach time how many bytes
> the program pushes. Only the program, or the software that loads it,
> knows. Attach-time propagation works for XDP because XDP_PACKET_HEADROOM
> is a fixed value.
> 
> Since we both agree that auto-tuning has real problems, a narrow UAPI,
> such as a BPF-side declaration, seems unavoidable for TC egress. The
> program declares the headroom that it needs through this UAPI. The
> initial plan is a BTF decl_tag, as Dragos Tatulea suggested on the RFC
> [2]. On attach, the kernel increases tx_extra_headroom of the device
> that the program is attached to.
> 
> > Which leaves the genuinely hard case, the one you describe at Cloudflare: a
> > service in a netns sends through a veth pair, the host forwards to the
> > uplink, and a TC egress program there encapsulates, after ip_rcv_core()
> > has orphaned the skb so the allocating device cannot be identified. If
> > that is the real residue, make it the problem being solved and argue for
> > the narrowest mechanism that solves it.
> 
> This case only came up after I started to look at in-kernel approaches,
> because the general IFLA_TX_EXTRA_HEADROOM UAPI already solves it. It is
> not a new case, and it is not uncommon. Cilium, Flannel and Calico use a
> tunnel by default [3][4][5], so the device that encapsulates is not the
> device that allocated the skb.

I have some hope that if there is sufficient reason, this backlinking
to the originating netdev (or socket?) can eventually be addressed as
well. Rather than work around it.

The skb_orphan and iif issues are well know. But not set in stone.
