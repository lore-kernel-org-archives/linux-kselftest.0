Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269147;
	b=vCRDMHUh6Vn2Ek+gj/bbb475kP+5n7jxItwu6n52VmywaIemxnl35zRziDDaXITEimnA
	 kfx7X0dH4Wzjygq50K/Tl2uniDFDGRe8ysfunQ7wZmnGsDW9JkfIr30mHda2MDuPy0rED
	 hRf8uMqHri+FFhUTLfj1ELEqQpHOXZOZXYRwFPnwPLqXURjnkcfPwcx6wyOaVBQH6d0hJ
	 Lf6jtE6w2VkDiMN5/ebkf8nVlq1ujaF3Z7SKdqg82Gs9RqGONF5nU2xyeHpsAJoy51Kar
	 8efAd0smTIgbFEpfFDM7aO1WLHcrzN5W1wtyTyKZaG3VtXLig333PlRmPlRSXu5mPTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
	b=DC1i/5rmIKlBwoPf7BOuNXDqGtMamSOj0Dxus9sL5ypwF4Ci+oaqMnOjMIqhTRz5rmMJ
	 zmCa8vEwi3RkzF2yjelrkFWAwG0Tv7X4FqgPQUeVLwd3asVjvcu+ODNtEoauFMEGNGz09
	 Hwhj02e4tK700N1pnuLMjlxh0KIP8Xiq+Rb8bEfiy+yRp4jz0Solh8jjLyjUP0hLog+7N
	 vUOLOryZnU/7Gq/4vMum0cOWXPziBABrMrsGx6QOaw7OqTs8onQX8wCzphqJ02l7G8w81
	 BUk2c6hMCQK55f89FTN2akCzVefbjigqmKE4yurfR14cEF//OOmAnyQlRMR5SryYSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zH9z4kbb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB77606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB77606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zH9z4kbb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20161155e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269145; x=1793873945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=zH9z4kbbMg0lkkb/HqgCLaFR9vONpMS7UnrW2ezQXaMot4yuVlvx8b5AsRhSxwcAbi
         Q4V4plM0s/t0NDmjNPggc0m3ZhTaJqh16rAqpGi9MHj+RiOCp8gednbCJjh+al/OBh3J
         k7dr5f93QI3uvgi5N70JgAPgUqm5BbmDSTg4+7OuWMyvYgfA37I5zYTduwmKcfRgttzJ
         kjcY4e0V4EKRJbYh1+4WRLNTrxvUqyF0Wh6n+2CKqJa9D29js7cu4+6Z8dPMKadEGaoD
         kMgHq+0nvRzb+a+PbaN9D/ZrUsU0nRFfB6YPncLGLwQk91Qn1/Z4TSQbNgEhroKs+9x9
         ox+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269145; x=1793873945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=HyXG9ZHrjY0+76GCqR6NGU8uCRddOboc/4lu719CTi3ZOtONVbr9Vej/ZPolL85YIU
         Gj2rU0BrgpMgQhPgj2di7uunazOuMYcATwx7nzCJtV7i/COlGFkKHS0HwCTt+lKooAs2
         D2Tp3AUE+xXLVDy3DG3lSdvG1VsBSFjI//EG/V0dKO58s63c57Ip1Tx/Hg+pCFaTA3Y2
         553aEmRe1mvREdJbWV2aNb7U7U/1qWzAoNZYa3PRwW70EqI00lrsQBhQU+p0dqGM662b
         f43nABurJOFzKKxtDyfX0AhCIFuxDE04as4VebP/by+JXxt9crW9a9aGthBYKYRpEaCZ
         YBag==
X-Forwarded-Encrypted: i=1; AKwUvBwkHYzbYixmf12rH2U5ReIEZ0dAKR1+BLyeXP1Vt59qx41MRY8iVO5gy+PkGgTc/wa+TmUFaO5pr87/54PWZRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF/HWcUhMXSVyok/QQcOUIg5/e8pZ8wndLJ2VZJB2q23sif5TV
	mUTTbJJtmTs5Fl5GXRN8BenFdjxU61kuauxmfjAqIhJ2qbp1FqlCu8LJ
X-Gm-Gg: AYBFou3NJT7zg/pSRL16ZA6ONuD6h7kLW2OH0vmAie6R2IP2uWzofUrFSi+sBGns+6C
	5b2YtHTb6aOrvS6x7iouPGdeVvqOiso450Pa7bysRNEK96VrTn9jIUTSBJ4D5mDySYNrznA/ENI
	a0OP640I56P+VoRI2/c3eap5ZNwvrB8HrqCOk1DKIZ0bZRaEFGM7GiV///z85B8CM/m9GPsgd9a
	nodI/uDhQAbSUswYBfCdAprPMMRL8pb1XvFIg77quUIqrHc5Mdcjp00w12VchusoIaCw87OtKsY
	e4nvvHF2L/dDSOyoqceQOxt6X3nc9FCDxnS6C1Q0f23C+gzHWAKxYbrKo6i5xysiQ/+Tb4AcQJn
	pZOR9hKRZcPaAvOEbKV63sbx3T5sfH/+9o9bJtng9QfQ2xJA0Wdl+OeWyzNrmelvBrhYlVIrhXu
	KtK188Nd1TkLOrRpDjE1p8b7r/E9UnU75azVoeaTupRGqdrqLYWzMi79nD5GMYO/fyNDcAT3ytD
	ul8ebLa7nzkKAkyJ92EBQ1ckpKcOatu0zp7eHSjhJAZrFPwrIGUo14lQi6pKrC7msGo1zV5Iv7L
	feVQ8yyQPAgW9yodCSxlT6z3vjk4GlAwY649XsQYXxJm3L8yW3KBBdFXN5D7xUMLjg==
X-Received: by 2002:a05:600c:6088:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a9677ca203mr118445565e9.27.1793269145060;
        Thu, 29 Oct 2026 03:19:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31946023f8f.43.2026.10.29.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:19:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:18:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Cc: echoowall@gmail.com, netdev@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, Shuah Khan <shuah@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029101859.6893f1a0@pumpkin>
In-Reply-To: <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 15:23:09 +0800
Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org> wrote:

> From: Esko Mobius <echoowall@gmail.com>
> 
> This reverts commit 2640e6419594 ("net: advertise TCP MSS from the
> configured MTU, not the learned PMTU").
> 
> That commit stopped the learned PMTU from lowering the MSS we advertise
> in SYN and SYN-ACK. For symmetric paths it argued that "the peer runs
> its own PMTU discovery and usually already knows the real path MTU".
> That only holds if ICMP "fragmentation needed" can reach the peer. When
> the peer sits behind a firewall that drops inbound ICMP, its PMTU
> discovery is a black hole (RFC 2923, section 2.1), and the smaller MSS
> we advertised was the only thing keeping its full-size segments off the
> narrow hop.
> 
> Inbound ICMP filtering is very common in enterprise and carrier
> networks, and it is pervasive in mainland China. We hit this in
> production after the commit was backported to 6.12.111: TCP connections
> that reach a server through a relay with a smaller-MTU hop complete the
> handshake, then stall as soon as the client sends full-size segments.
> Clients on networks that let ICMP through, and connections that bypass
> the relay, are unaffected, which made it hard to trace back to the
> kernel.

If it isn't a silly question, how to connections in the other direction
work?

I'd have thought they'd need that ICMP message to get through.

David
