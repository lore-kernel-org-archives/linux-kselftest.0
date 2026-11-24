Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519779;
	b=tBGaE3F1Q9jgo2UjIQHHw3ezkAS83LlIla2KMBNzXw4mrBMTzEnSQG/sUd28P3+TB0Yl
	 nWyVdgrTKdCPWMPFfsHzPnPvhZT5luDHBWkRiYfOquntFuieh8Dp1enJi3/TUPYnB5L2q
	 GkSWTySxQus7vFTJHeWP4esuZi5ZrqOX3qZvSVQpBT4jnLNMbVw2NS1GuKSma6zj8vRey
	 ifqdSPaWyoaciiD/sdWHgzse/O32dyqDMrOWkvCBMYJRKyMFYtJ5CoEj1B/JW8nRDng7/
	 giyqIMVN7/shbb+PsPeq3Pp+pqizHzfiMrhd2CEeG9y3G5WYjsmdVva8mN5cqoM0BtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519779;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=q+lnCkiBEcQYJ6MFMA8AfN/6d7tiwcPEYx2fCAe4S20=;
	b=ubYxGTtM4pf82E4g04Z33IYehitNii3ePHnqntExnTVu8wKH1xfB2nfCR1YpM34u068z
	 MSTrLzTSzbelI+GkvO1T+U0Z8KStELOMIDTnKPGmJhXQ80Kikn5FJZwPlAC+jM9FsJdrQ
	 1P9bKT4ORS+ppHRC6vjp+i9nbg58hR/577fmR/q+WOLbNzAKyA/Ct56jSnwdNan4XJogN
	 uYfXbAxJ7lLO5ye5YTBTbbDS/KPmD8tLfK1yf+2hTDDbdLSoWICZvGdEjZFY8naSYaO+v
	 sChY5PXFORKTxXD3OQrzf4lKj0+fw1UBS/1m+IUQ9DILvfMbqo6/D8CtS6txr6s98YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V4jTK/sN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E8B606A31E;
	Tue, 24 Nov 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4jTK/sN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B50E1F000C4;
	Tue, 24 Nov 2026 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519778;
	bh=q+lnCkiBEcQYJ6MFMA8AfN/6d7tiwcPEYx2fCAe4S20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V4jTK/sNw+YyF8uQmYskkGeu9AjGoE7WROaFysPRvOol08CMHk4LukE9JGjQpFTBn
	 o0P8N7CRA+cYstcpxc5791J6kSU+JHgpVKIJsyDIVcdQeQsO58Iy5L1gzP3SjOm0Ll
	 tLEFhHToqaLeNxvJfOrKpks+575H9I2srjTpZytQmDlgllFKidbGO1mTKqzjYO8vn3
	 wEDLuWo5I4nJvGkZ/h5INoOCjPnGuFasbW1QmnRGVz8SW0gqLzBT3+KKueXH0pnOjg
	 Sz7Gx1UrS0L9qmLgzQTw0Fcy2sV77/6rgcbNittyzdblzQytay+gh8n7NXPDQgRjyj
	 +AdmVtMrbS7lQ==
Message-ID: <4148e81b-ec5b-4374-b74f-4f5cba175c7b@kernel.org>
Date: Tue, 24 Nov 2026 12:29:31 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
Content-Language: fr
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 23/11/2026 21:14, Maxime Chevallier (Netdev Foundation) wrote:
> The logic used to detect if the kselftest remote we're interacting with
> is directly connected to us uses link renegotiation to flap the link,
> that way we know if there's a switch between the remote and the DUT.
> 
> However the current logic is racy. It triggers a link renegotiation,
> wait for the link to come back up locally, and looks on the remote if
> the link flap counter changed.
> 
> It's possible that this entire cycle happens locally before the peer
> reports the link flap, in which case it reports that we're not directly
> connected to the peer when we actually are.
> 
> Solve that by reversing the logic : Trigger a link renegotiation on the
> peer, and check if we see the link flap locally. The current
> wait_for_aneg() already waits for a full "up - down - up" cycle, so
> it doens't really matter which side of the link flaps first here.
> 
> This was found in the stmmac CI setup, between an Intel I350-T4 card and
> an iMX8mp + KSZ9131 board. The Pause test was failing seemingly at
> random, due to the link flap occuring either on the host or the remote
> first.

Thank you for the fix, but it looks like it is introducing new issues on
BCM57508:


https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-24--08-00.html

Do you mind looking at that, and mask this test on your side for the two
boards you mentioned, please? :)

pw-bot: cr

Cheers,
Matt
