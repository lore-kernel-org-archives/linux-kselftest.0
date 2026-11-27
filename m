Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773589;
	b=bHI580/8nlBtXwfIlccQd5YzBJsE5HbEQKwWAyHxiMj8UC1EE7BYxcqDe1mKHCH0TGik
	 uCEElU29La9espkr3FXi5g2w80z+FlHxgOQkR0m2Zw7RemLQEoUFbyYY6PXv7ofyjVB0k
	 N/HPvDAzFY6ZAOOcEEzhDg+FVSi6CIBVhuOwyaZPq5V1efnVIQCQx/rBrY8QRbX7eeqsi
	 H5GK3nEaMJR9tOha12rmzX7710OI4d3aCvPc1kZaf1RlNibL17//69F/WIxXiEuPc3KG1
	 x+Zr0g0LeUt28c0TSoS9Xuwd9sqBHTrngGeIMlA+rqXAq7Q0r3UeKlz4OZV8phGrSaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
	b=j8RRlilywPxm4Iz5exN0nrsa0Y01Gy0XWfw8e+hODJTA5Mmt7/fdEfr4nYPRi9XBWrDd
	 zRXK42tQ99+/MJeSuXyomn+QhL3qgwseBHl/aaja1MuvN0xR/7wE77KIA/wpCesOjZfeX
	 RGNZgB1dDXTT9CWKiqX/JE8lcSefQzNuzXNqYIoqhnRfY6ucK8qAPLq/bm+vOKK5fVcrV
	 dZ7RtrsmelZizzKpH50geXb3/BoXilRzBsXje8ihhFObdzFM802HWgeyBfXs3cEzCFCR1
	 o42BBETpEbwaXqtEYE021UHVFFg5Pha9buNVWD8qS2Q4ZStAtvnDxism/6WhUPxgh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73F606A321
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC73F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5188e4980fso408775966b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773587; x=1796378387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=p1yox5AYNN2uipZQJnbpRMDXSaCRlxjVfqocWix9bJXh6U29ZRSWOk6AxAz2mejS5g
         Ev0B5+rw6V4ykP9QG+hqKg9XzXbvKqUQ5G51RFNj6bDS8STlvTtBldjL7ehBF7MbuhIY
         a9GqdncJIKydAShBiTz8UMqpgoo6gEsHwRL1OqblF/JTxQ7E6luqB4lwmU6tmLaotuHd
         ltuefe8RBlTO+xrsLjGDFpLYkvQ3/BAFdPYZMlYFKQToKxM0q8x+KzDNEODB4sePc4ag
         bu4bDv9TIAmAloS4bcxC7WUGLrxQGOAZBL8Hs1cBRPFatTW6X0YrKjSbcGLNTcFAYNQ9
         uPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773587; x=1796378387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=DvFtQDh3sffYoriEUIyaBMMGHckIMPLszdDljnTGY3xtme1uJtHAmUJg1Qc1XWjOZD
         DZJ/VB3lm6N3zwbDlNX/RefT01GyAB5W1viWm8a69BJTSbkn3cXCIdiJ2Rc8wDWoJ1TX
         keXst+LBOUPuQiLH5P/LOdujGzY4TFDkbh7nxj77ZO7Fqh2EgSEduWSm+zj0LtbUfpyh
         BoSYjt/J05h5EiH44+580OjjSH0iiao/JOxBTK0M9s3F3KUL/FZZOWFmoJgXOMaz4wcI
         sazwgPvZtNfThSKrPacpkhEoq+6B4hqrMiqHEFt+YSTek52gRygsUIwZkXXY8HOTODgA
         a9Iw==
X-Forwarded-Encrypted: i=1; AL+hErEzqnctShvzmuGvSkFrHN8eF+u2lvdbKmkDx/8UIunvSLsr41w+orlVu9HtMSty/lvTLKK0mpyzegK0f9a2Dck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FjQMhS1+tEAwp4fjVVuwPOZrepq/xRwy5tU0PMxlkNhE5tswq
	icUelSjJyO0m7dvs22UmWjG2KrXbtCQYeV8CQmPgUmEkfSz3fWWr7ZzNmUKg4im9
X-Gm-Gg: AZFdTZc8TT3qyMQn5ulFebD7Ch1YAqKUABn5NiKhWpwNzhRLW/BGfWxNKqt5TMu/grZ
	ZAXxQDXvLDXB5YqJAxL1nnwnCTs7EwJjbUkSAsyTCqw9WQ4uIfzjoCeGjSoZBoFx4K5sXzjkmnM
	I3W4t/8x4ewiV314XHab/54yvTOI+cXekyuNY07/ShO70GbXKiN2EqXFpcIILjKLNapMUToy2Z1
	p3WfrgAoDctrJVyjVV893uvB9kHLZyIX3wDn8waGrdiDfnaV3ssq/ETBWN2bqCYEOfVZLoinDkk
	yXPOdCl9sYU+hFJKcFfMGE7aWPK+/sqLeibhxMZKQut74JmJNP36LhPP4f6z790NYsa7b3QURkZ
	yrEcXOiXxvGGYGwlxkJYGYn30wUQy52HNEd0cMO6UKtD8yFF8aRtEzMycyVxwPsxpEEaYfB4RND
	+9ZJhhPHjwU82ji76pC8u3azcKF4rtYD4qlIO6Hak+xtbJNkSYDvuWaqfbPIUTxSh/tWljNHD6V
	7KAbYUTkIjeGMafapxtbUP42NjMN72z3z7vcnLTue+1SN9Cm0e/qV+DjH7kDQ40xj7yGMYPwrqr
	tk8+HelDicMRFdV8RipXTEkK6QIlx/AL4eHH+VttB2mkyD3n
X-Received: by 2002:a17:906:7944:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c513a41edc0mr2010416766b.5.1795773587030;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:46 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] wireguard: peer: free packets left on the per-peer queues on removal
Date: Fri, 27 Nov 2026 11:59:43 +0200
Message-ID: <20261127095944.17844-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288773.3135.10772290029017294104@kernel.org>
References: <20261126094722.73025-2-apasichnik9@gmail.com> <179577288773.3135.10772290029017294104@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko AI review wrote:
> [Severity: High]
> Can this purge of peer->tx_queue run while peer->transmit_packet_work is
> still pending or running on packet_crypt_wq?

Yes, it can. An encrypt worker that the second flush waits for can queue
transmit_packet_work after that flush has started, and then nothing
waits for it. Before this patch that was harmless, because the entries
on tx_queue keep the peer alive until the worker has consumed them. The
purge breaks that.

> Would a flush_work() or cancel_work_sync() on &peer->transmit_packet_work
> before purging tx_queue close this window?

It would, but the tx_queue purge is not needed at all. The leak I
reproduced is on rx_queue only: the transmit worker has no budget and
drains everything that is ready. So v3 will drop the tx_queue purge and
free only what the disabled NAPI left on rx_queue.

As far as I can see rx_queue does not have the same window: a decrypt
worker queues no further work when it is done, it only schedules the
NAPI, and napi_disable() waits for the poll.

> [Severity: Low]
> That makes the new comment the accurate one. Should the old comment be
> updated to match?

Yes. v3 updates it and says why tx_queue is left alone.

Thanks,
Andrii

pw-bot: cr
