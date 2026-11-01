Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574975;
	b=HL4Fuzr49uwb7Apd82clZmcxNH5SbeQUFNvCHjwHg34qLPgwW+z00cbyb4hcxfgaIvfg
	 LQwdiBlWMpjbm3IuCAYeLE+c/zvyaXomXUMYbVucrF7Ew4TIa4i8zIkoRtZyxfcQGZvGg
	 mPizLx5vJqNIagdO/t3Qr2LP+iNH+r5HbI4vNJEQFkT59NbsiOIsun/zb9WnZ1yTvPMpl
	 A9gzVZIIDvpVGKwLuOqp7fQqaH8dDdORREtS+nbG0nyjFo1mVuCglcJFhwsZA54qZI8J6
	 m0ONE6bayRT/OZuooEU68YLau2oYt+y9xafk5MVRwfLJrpbTP3G74ALsrCcKIyNgDHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
	b=kVTZsqlmmfqIU3ZyuQUIpKIN5mv2CUx/VpMOP0+B0KIyvA6PWOoAUJNmt/yF/BzkqHTN
	 3perNzKd9J4PzpLCynj++6LV1jJ0oNhOezX/frMOofeMLZVm8m7Xqy2awgj0j6tZYXYah
	 +BbcfdQyVBWP3uluMsHmJ5gYWrFiptk+8/MDjB9mi3BXScxJQMJwjvkH7wj9GbtoofROB
	 gdz6+MJfsZV72MFoVHYLAijUNwbmJ/9o4uaeO5EEK80ne/Cu8jVnmMFJ8gqUDP7njtkSj
	 tTxU54zJBbujbuEi8YDt2EyoN3wIY/b/04mJA0/s8epABEeUIZzELdQn+iWS6TbTuXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B6eD/wO5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349B606A331
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 23:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9349B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B6eD/wO5
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so9325a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 15:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574974; cv=none;
        d=google.com; s=arc-20260327;
        b=CS1KaSwvo/PYWLzzA+ggnH8rYqAvg5zFqeE6P4symhpUCmqQQ+z2gt4qZpaLEmulDT
         5my+PzfHEyfWqSVwzdMq4R0p4pKIT4ppEO8bowxO0u3/JM/IHXqVgWS9uxU8NwuM2JHc
         w9PjEVCFmBOoqmm9UYnz/QwYLS3LXMMq3x7N6t3RW5pOSOdCy8wbnAWJ91+N/trLAujc
         WOaEhbGOLk5gMzFOaHjUiVnTU2vPbEkhOoUAuBh0DlDJfTw+RfmL1nriS9g/6wfjelas
         lX51Zz9X8pclwv0JxCXosuc3g7smkPJyC9guIr69kDZYF4R05V08PzrXGuea9ZpQn7Rs
         FwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        fh=D2tt68SCcyU7oWWuSueOSs1BWFnvnMmwlX+kQ+LCTzY=;
        b=rsgUoW3wej3SR9O1y8lQxFdVtsx/ByI4Zd7rIhNoudDMjKDOgWJoHXQ1eOxhp5xlby
         XdG51CoGuHiN1ge9nss6/jJ89fKLj6kT3B9v1RkqkxIoTtUwOA0cqreuOjW4X+4S5f7F
         1lYZzMXvNB5e5QfpOGcm6m8SoNp8vfeWd792JtuvubvCWQqwDVGT39vbuHAgO004/Dvc
         lGF0SvNJaBBSbcv4sKSzJunDNb+oXZI5JT/HQ4Ns5CGIVbMD7vWhidAMJB4h0QewEgYD
         cwwnqNkJ84+ZwSsJccsrq5tNttUWC1yG8NCIdternxUGqI0wE/Tyy0D8VZbvPgUNXIjD
         DVuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574974; x=1794179774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=B6eD/wO5t7w9cr5msgMFDILth1F5IYv2yTF+M3oN3LY5yBUCf8LbsX8b/EG2x90vMc
         o1ifbd35SU/EjpMruPB9UPjK5pHCrRD2cuHlsD4MZZQaolUEBfaANH7GMS3ZcR0cBYfC
         Pn/HQAGHTRAxbdUurIHjZmgux4R8Hl73PetNQjifvN5ayQO7L1PgUm3ExnpeEepNgAzg
         UDBfzpgqcd5dTvc37HDnF2segKwhVXFd4tJrk1GoygafHDKHc4yY44rDa2sFoitlIrgJ
         WnOMy7XyDHGR7QjkAlpTH09T83L+F3uzmZZLwA7BBZZ4ZKX06XcjrBbyXWiLg2e0uuom
         V+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574974; x=1794179774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=uk+oFDkhTwA4wo1Gf/PBhuB3roUMfiHfOpYS4wyAFU7TQU82w+k6EESkjhSeQRI7y0
         2h5RUizdRpnBeC8ms/dRl0+bVf7PAvE9lHdrvuiAXlLD1bJrdXalNVwxHZ0ursR+cTPk
         K3cHcCR/gl99bBGxHHWfZ7ZO2+BJXIxEIDXDrISuOcRW8cb646AxhNP7EjxSjEh6tkoB
         4bqFLGHZtJL3+AGE3hBmkx+wsmBaORApl4mrd9FRyjJFDB6lsSJ0lKPRS9Y6sYS2QD4K
         3imBW//T1NsQoeTP82A7/Y5cME6K88C6kB4UV5w5QFR1xyhwXgRAgrYiB/aw1CbzQQ8K
         mtPg==
X-Forwarded-Encrypted: i=1; AKwUvBwiJMabN64Nhq56hytI16gPIHBVC/7hJJAtKYFTET+c8a4syzi6hE/bkbsh1KEGboCBLnibRFwqnLKK2dAfMuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oa7P4xzcelsy6HxLCrMizMUU/oMW2yrITxMlBCDIhRs41fTek
	H36CeOWrlYYv+FtKrSZOxKTqpq1z1DgmytoDtjVCyXYeTTuOQjhLNY2EVMBXBqVnuf0NIueJG6P
	AkGo86/1C7kCiBt3CwzZ2dd9HNWno7+PvzBoKIQ0a
X-Gm-Gg: AYBFou2NDRaRrJFxgn6mTYM7Zr1OMmvFMR/YH97nK5DknR3kEwDIh+L/2DqV3PSRN5p
	aWOq6KQ/kjTx/1AV9hJKaOryPJd5J/beJkGxcMR7te9SzNbWg+kqidxRIj0rXNkX9k3cmanvB3X
	HNtr/hXNdPL2v2a57i2rSS8LzaEQ2hYA1Zp/UyY/ljV1AeFoPG8w/N07OfiPuBtmLMXZViEaPgi
	mf/Lg52S44Q4FRfjhKEj8M8T+/V4JLZkb+a13ivkXdVh7vLnKjWjQ7D/K26uy7r3HMSpgfchEip
	DVA3gRRS0xh2lwNp67O7jKyFG8xYcMgXegXv48QuLBTDOOGvAmmGVG9gFQ4136tABYeBTSbiVMZ
	LnBKOlbpqlotxWubzEh0muOhbn4H/yThm9agtON0=
X-Received: by 2002:a05:6402:2154:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b4b42a63d3mr252843a12.14.1793574973443; Sun, 01 Nov 2026
 15:16:13 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com> <179357408146.3131.2882435952119280563@kernel.org>
In-Reply-To: <179357408146.3131.2882435952119280563@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:16:01 -0800
X-Gm-Features: AclHuK_Z0S06xrAeAq_HAO4Ko_jHw-2goCa0w2rOFRiQDckpwHJNSPwxMM9jz2A
Message-ID: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The dma_dev use-after-free this patch says it fixes can still
>   happen for RX bindings made on a virtual device that leases queues,=E2=
=80=A6
>

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix.

 --
Thanks,
Mina
