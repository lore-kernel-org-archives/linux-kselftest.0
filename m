Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367657;
	b=aorDWbYbuZTxVpHmtlKn6t1fW7WkflNNhVJn1vqo8ALUrdYK29AJS4xx36FGEosVin73
	 c+hMftphWA5jUzgwBr/NhCfGuB4VlyYk18uoWDWT4ERMc4h1JYll8V9HDsTkoPdAhGCst
	 HxRlEwpCBO1/QoWr8OZOK1I0yUqUxolvuEZhmtOHf6JJHTA5uRCfhgh6+Sn7QbSAn9EDD
	 mLmbV2Ka7tEQrdZUkIe9fcmpBNyFhUfzy1Mxsmr02v0BHAsq4tFCaMg1qoQg5ObxwwaGO
	 NaYGKdXSTqqcEj6sb+3UeVEjb7I7ZcVAIph6Vj1VfxkFihsPvQlAxFGZuP6bMWqvzMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
	b=Cm1cTb+5BVS6FXN6ya49ZgDMe/t+c1wD0LhUZIVZ8siR4EZZXf2DfchvrPWwfi5Pgowu
	 ZfKrgRxX/xAN0szR9TDO2ngUk9likr0Kew8ONPbNM2BNwp6mv8ohnTgVG7ofseU82E98G
	 lO899Q9Z378p7R9XJJGShWpwh/wm3gMVWkR6AC1+q46fd2M67mfSrDHdqEVjQUA09Iui7
	 Cg0QXp9nEgqd63gKm+InthM0v/eAemsNta+rPuM4H8pDyD6tsZVigCojBbfPFMWyrREYd
	 7QDwa5kvpknxmtu6FITOexqYqlvwI24jWFczFMZE2dsTHN+LQ88lRe9Qe+yOa45/g8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gs27mUwN;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF692606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 03:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF692606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gs27mUwN
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac01ff101so971716e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 19:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367656; x=1794972456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
        b=Gs27mUwNykVEwrA3DiBS2V9/b/rXJOS2VWp/xhCQT45S5oHsdWjcVvPPEmcibkVEcX
         na3SoKaPijfWx2N9UFDA2yfziwAl6fpEKGH/vOh1kVLenaKb3p+ykPWwpQOtvrOEOm/k
         /KkK1qVt+6PHvR/r2W3Ob8i7A+odPqqB3vjp6vJq3ytQHQiJnj+7j3ZBhGKGc5+YOAFY
         YRJ3z/Q0EqrPUeIPp9SWqMfUStLMPadMe6AYvgA5OJ6ihREIlvcv8V0AFPI8roljyJ3P
         uYBniZ6b5vySVHJru0SEN1GymH6mYPuFJNDFQmOFEPxmjQxLk2VzEw45P2j7ghjS/kT6
         w9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367656; x=1794972456;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
        b=mpn5g18quxSuyBAIRZiy+QL4gi7G7AmtoBsM2kSa8jC6lEwTmZFXVEw8tIMTCohoIq
         o536Npyz6Ai3iUhYHPjeqWGTLt3Z9ydVvIjDa2dcOZwbKoNtjLhmU6xmb9JSYH9NVw0v
         +XMng/9fe0cgSVTUTAr0NZ5UIIcxrx43l008HhNSdzHOXXexXX55BKiykJdvVRiZo9P+
         rFVvo3jE0pbWa9UeCSm1WWCLUuBa2s84by5WVUNU6IAmokgUZfhyaqOgR7vqx8kDPFRx
         87B5KDb4IH2hd2u9rwiZ+8F0QB7G4GnkD6d9WB8rN9GaTquI+ASP487ZG+c0skxcdK1m
         vEXg==
X-Forwarded-Encrypted: i=1; AL+hErHqMbTN1fWgGwN69tzanX4fS8wcTjsPvmw1wbzTTOcUWC+bU8QABuy3PWAXyX80ggUX2qQnwEjNd7rj75xWxP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lug5H9J1EW+GY2amzJfJ26eaY/kgLNQB3t1cAsrRGYn/z+JvQ
	quNF+AjJTY43I2aX5vo7j3btcEjnU4mnQKUw0FeGWt+kuRn3Bh8S3yBn
X-Gm-Gg: AYBFou3a7/r/RmAUVZwH5cKcdEzMkItJXsToTboxuhsXK4qRBpjwvViIeRCb2sEIwzF
	HDtCluMf6ziLtzKpBMkv16Yb6KVKK6stca+SONgWi96pSkJKECZTQ7VfFC5dcdCxu1S/8CUlrie
	saIJB2V4/C9u0UslUZXJ//Z65yD+S5HYdJ1OpHZvlW01r37yNJgOWIeo7YwHjzWfiD4ey4XqkZf
	r++FH1H6uDHzZbnL+TCxZslHnpL/bpHXODFFgE70ZC4OjLMD5j6Y/eyXc3c6ayDF8D5cVVHykWE
	DUP686k1qDlQhKJCyh9OyhKokqSLgZk2kgjU7VFEv0lqUMCpLSpE0j/DCWLfRyaqwin2BBmQNTp
	kXwG6uy7Arw9/wCCrWgw48JCypMrazV39GThkUigt447rxkVCh6VGGsmpZ0DSE7Q5/nPNTwiig6
	BjuHFwMHxsS6N2omPS6u7/vcw3EYnEdgdeKkIUVHtVXvyCc0dPGTHpw4kX1zJxfzdqfJVXTr0tw
	gURdGNgL63xECjfR8OTckaBdapj3De7/N/vf+ijFZprxb0jbpXJtqIsDvoCGyX4DwRveBYUi5Es
	HQIfdrM1q+ZlACHJp0BHPbrihMb+BUTpAmqXtn/W7JQjis/hNR8kMrc07EwggcsZ58//1nWz/7I
	b+EUoB5qFkqbwxDpw1qISIr80mo85UJFFUlDwFsHB7UfwewUpzz1YQzl2GIIDXYeejgAoPD0=
X-Received: by 2002:a05:6122:3d0b:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ee1c29a86amr335477e0c.2.1794367655542;
        Tue, 10 Nov 2026 19:27:35 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5afeb2sm3174383e0c.9.2026.11.10.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:27:34 -0800 (PST)
Date: Tue, 10 Nov 2026 22:27:33 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, 
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
Message-ID: <willemdebruijn.kernel.37fb7add3354a@gmail.com>
In-Reply-To: <20261110201250.95225-1-tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
 <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com>
 <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
 <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.935b9bf7f1a1@gmail.com>
 <20261110201250.95225-1-tianyi@cloudflare.com>
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
> Hi Willem,
> 
> On Tue, 10 Nov 2026 11:23:09 -0500, Willem de Bruijn wrote:
> > I have some hope that if there is sufficient reason, this backlinking
> > to the originating netdev (or socket?) can eventually be addressed as
> > well. Rather than work around it.
> >
> > The skb_orphan and iif issues are well know. But not set in stone.
> 
> Thank you for the suggestion. I looked at what backlinking would take.
> 
> For the socket, ip_rcv_core() orphans the skb, and after that skb->sk
> holds the receiving socket, for tproxy and early demux. Keeping the
> sender's socket there would break that assumption.
> 
> For the netdev, skb_iif is the last receiving device, not the
> allocating one. So keeping the origin needs new state in the skb,
> such as an skb extension.
> 
> Even with a backlink, the kernel still needs to know when to adjust
> tx_extra_headroom of the originating netdev. This brings back
> auto-tuning, with the problems from my earlier reply.
> 
> Taking a step back, IMHO it is more natural to set the extra headroom
> indication on the netdev that the skb is allocated for, than to have
> other devices raise it through a backlink, which can get messy.

As said, the problem with that is that an admin has to do it, each
time. Whereas the kernel has this information.

> For v2, I would prefer the narrow VETH_INFO_TX_EXTRA_HEADROOM UAPI,
> following what has been done for IFLA_NETKIT_HEADROOM. I will put it
> in the last two patches, so the rest of the series can be taken
> without it if you prefer.

Ok. I don't expect this to be solved in this series.
