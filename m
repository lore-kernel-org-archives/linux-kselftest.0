Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804712;
	b=oJDY2fDQqnzz4WctCUf2w47BoCafPkfnmBPhMX7+saAoi6o3PPXlBEMmZuVemM3d9M4Q
	 BtkVR51yWLzdTNOuqPoLx1craeWIwHx5WYJN93qwuMtRqAkssI6NAjwU3uC0aXt/z8wF7
	 GHL6l+StPlbf+SJVyPsRxDBYO0HX5c7cqQMmvhj6kphGaPupeno8b1+9wsQ7Na9MileqG
	 NBfxgJFd+u3kwU7MDpf6pqhP50jwRzHV9wWy05/lfa106NZwuQYoxIszD/svosRUF7Y8F
	 3CVpDabBgoj48MVGnQPYoP7gvtJPSttBtBYZ4jrf5d9cNcOV6wi6gkRr3HteKZfVx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
	b=3uah43IUhH3ivampQatclDYZ8CzTEfJZLxWYdTXWynAJnatzom649r8Y+NDvSI/aembg
	 K0urrl9/BK6PuKOqpxVYfBr9+2YwhqodGnoX5eBDNVZnzTjxf7EoVlanWYkjT148hKWVu
	 kKf9Cmf3/4gYlHq/3Tcar1eBxhUyWdNha/jlrIn82KPj8nwLQPLJjxdV3Li/QY/GMDH78
	 lD5EEXtGD1IE2EZonOWgPChNztIbFXwQmqRnsxWM85i1ytYx5QaVXjM1FaadFi13jF62V
	 AnmAVakR0SRf2PsVO9HQKRx7RUyInN8VEMFfDGCZKUMUsyU38fc0Y2LpNt7JSXwuD5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9uMG0sh;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F4606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9F4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9uMG0sh
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e942864693so25308265ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 20:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804711; x=1795409511; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
        b=Q9uMG0shsjQL+u25gEioGMriGdkjPwXQL+5xFLs3BpJN9/lu5iNK6xJCTRdqzaVo5n
         d9qIjaheY8Sw4SNzemMBpyXWzwDpGL+2DUGvdthUsK5bqlxbmvwhXPby7xVBSckSGUx2
         A5P6dOPRHR449xae40tDEHvQSxWdGTApunX4iuvlVkVkbcPFv2ympFYjpBuLBdHbwFPX
         hHsSi0ExiGK17YBMPV+Tk6EimN8j7iNHmFYj4JUle+Z++KdZRzpbA0dPu4Aphd4h4wWm
         3ULZboBKGMvR28nAEPHHojGsL06gRTFhRBEOrNIKjXaFHRhi/Pc4ukzFpYurIpprgR65
         N9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804711; x=1795409511;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
        b=2qwnDNT8Uoa3n0Om88ZGuxgm4W3hDA9MN2MdtM4doY8SWloxZVSi5AjHVhN3J+0L+Q
         3lOOcxhdn0M+FWNpn9ip6j5PrPTDlJ8ghqLlN1vKUmQMfQSIhXoePof9LuxzSfoRX0lc
         +rUJKHii0kWLCqNfuQUxd987Tcvkl6LVTgQRGPXg+ua1QsV4x61mky1vTXE0/lH26Yt0
         U+IL9FPqCa/UhWOOxR7nnSY2XOl658YDRC0tsvpB9lSKpJGpTxh+x4kwqWRphqqKlrKV
         p37uhtV8gWuEaPwKcJWAJLw1qI+QQ/QPuK4GWlvThzgMic7M0Ka7aCcMsqQ4RFwq8Zj5
         sVKA==
X-Forwarded-Encrypted: i=1; AL+hErFzEma2w8u7IK6WIbKcDA0qewvJEBV+GPqqhFW5C3As50vUFBUlAjQUFbyLlghDoX6q+QlwILOYPNlbaQwbcEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XEwOLwikP7+60WENOUS/9i/746fSG0Z6F/kFieJwP4uHCReWB
	6dM5pbe4aXDlbOQYzK3UWfwkhb9DEzzjlZavzofodVGkMmXREEMz7osU
X-Gm-Gg: AYBFou0X0DiXGbgwz85K9jhMYVc1MEqVeo0/OqYZ0nDk6xiJVhEJyhUEBhyIFNxhD+i
	s9w6yUDmfCukfKr2JhAgQJhssK681hmO42ndqj+eeP9pT5beDNpj8qkeIkidUVi1+G2gQ8tODBQ
	wxMhmVQ6pTD9OVej9CH0HpG/LGpu8eyJ5fbzFfQkx3dFnMAd32qxYAbDFsUopPipHaD/Gqkj/vR
	IrHQMEN+7uLqZUB2a+VgZDgoocSJvl1uopAU8mox8CLSdzXUWbCQfp9mbQt11T+hUYpqGBYzpaq
	bDgpG2eAHDA9zbhM0hYx2PtMjtvLugpfrsLcNHASj8q+WlUDTXngYpDS9r3KuYqZ/DvRB20iFcb
	ZvUzkXxBAsQ+6k5OB52P8+Zm5EGRujnYShwAGmFmVITkJSJyS5Ur/BLGSSYKj0i6YL9N2fNZgk0
	Md4lEJl4UF+wgMISn/PZF/okRajO9dApd4eKx4ZMfPe+4zZeB0ON/I6w7+NlJ89jWJpP00pjcB1
	Cybamo2Uo8Hz6HkI66cIdswRMufoyVj/c2kcGRvsgFNIFYS8sxvG3MeFh8rhg7I4X6q3vJp8Fr0
	NbwfrwYnYXBLBhxUtcqxttsZU4oOWffEBCj5f3uwNmHk1ukyQAUZyrPmHt5Y6v2xw5VTpbNqPtn
	GNHmh+xOVV0JwLlFKIAzyoKo43/ktwgPOhg==
X-Received: by 2002:a17:90b:2247:b0:3ae:2969:9031 with SMTP id 98e67ed59e1d1-3b1b0d08f2cmr9948935a91.54.1794804711394;
        Sun, 15 Nov 2026 20:51:51 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce460csm19648688a91.5.2026.11.15.20.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 20:51:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 04:51:50 +0000
Message-Id: <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
Subject: Re: [PATCH net 1/2] udp: fix reuseport rescore fallback
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Zihan Xi" <zihanx@nebusec.ai>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>
Cc: <willemdebruijn.kernel@gmail.com>, <davem@davemloft.net>,
 <edumazet@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
 <benh@amazon.com>, <kuniyu@google.com>, <shuah@kernel.org>,
 <vega@nebusec.ai>
In-Reply-To: <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
References: <cover.1794759652.git.zihanx@nebusec.ai> <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 15, 2026 at 07:55 PM Zihan Xi <zihanx@nebusec.ai> wrote:
> When a reuseport group contains connected sockets, UDP lookup rescored the
> socket selected by the reuseport program. If that socket did not match the
> packet, lookup retained the stale selection while continuing the scan. This
> could deliver a packet to a socket connected to a different peer.

Not since 6.13, unless CONFIG_BASE_SMALL=y.

> Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q

That's not a hijack.
udp_reuseport_add_sock() lets only sockets of one uid into a group.
A member of the group attaches the prog.
The prog picks a wrong socket of its own user.

> +		if (need_rescore) {
> +			if (score > badness)
> +				badness = score;
> +			else
> +				result = sk;
> +			continue;
> +		}

This makes it worse.
The unconnected sockets of a group have the same score.
So the score of the picked socket is equal to badness, and the patch
replaces the picked socket with sk.

Sockets A, B, C are not connected. A is the first one in hslot2.
has_conns is set:

  reuseport picks   today   with the patch
  ---------------   -----   --------------
  A                 A       A
  B                 B       A
  C                 C       A

Nack.

