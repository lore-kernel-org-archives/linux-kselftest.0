Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A833BBA2
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683271; cv=none; b=mFyUwqPxvyNGG5wgHYlUtDxO6EhqB3uHD4MkcLCCYBK2fC5WmcWf7uLvhXBn6rtrZacu12BDZGbxLBGyJl9xAAKOJyTmQkNM+TwoEBeaCUcZcJ2C8ASFNtWZ5r1HUTCHTfXSP7elRiXm6rEMuM3VJKhQx+TMwbmpJZVYJ6+CjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683271; c=relaxed/simple;
	bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PstHdvMx/UuLvg3FDTtJyPu5OWqPrfe5hEzWV22B2pSKWD1P+tR8RefF3B14ScA8cGMwGOkvoquXe823df6hxngAjFS4ytjx0jC5yywrhaqBUmzurHmEt/mAy4/udrqbn4A8QuKa9fKdAJaoA0lu5KWki2JDSYqmvsi4MVxYi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BCuJU6I3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeLjPWdE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BCuJU6I3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeLjPWdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773683269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
	b=BCuJU6I3FjN+9PvTqPmWPZjGLvNWptUTA8Qkv1LrSTwLgkDnRIl3jhR1c/YAdtUDWPxgau
	WvQNW2qI3o62V2MwK4WQkXwfXZhXT9/t9Zo+So8aw2fDQq8n2AYJ3+P+ykb8nvjBN8PBHy
	WjIgOcHtp70iGxa9JiftseVvP72qrUc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-mEqwLt0cOdSBTs5445uOPg-1; Mon, 16 Mar 2026 13:47:45 -0400
X-MC-Unique: mEqwLt0cOdSBTs5445uOPg-1
X-Mimecast-MFC-AGG-ID: mEqwLt0cOdSBTs5445uOPg_1773683265
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b3a0d25d8so1407452f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773683264; x=1774288064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
        b=UeLjPWdEbLMPJO28dH2NeRa+MttSHYudFRa+KhmsIdInbNh44SWTBvolw470a8An1T
         TK/Rpnas9g1FszbJ/HY+Y73fAMjjHg8VzPkbH3GPzz5CMcuHNqafM04j70ESxAAPWMnu
         A+uKnEGx1SXrGDqAFMN4tIH5rO3qxuCE/xdOiN/DQ/cPXNWzQPBnovtJJZg9LAadB8a3
         cBQt4Fh5Bj+UzrXzfwOEvRhmd425vSJc1OPJTj2Ba+Ri+A/es3ZQfwqUZgJIy5qUwApt
         176a8PfkWaR65l7m1z8uKDY5efTfjWc8rxGqqDnwtx/4FNbz/wDZHw6Mur7cVp/VtgQM
         /ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683264; x=1774288064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
        b=PXnpvqn+BYCHOEgKtQfuGk4TT1nOjqhcbt9IWH9Fxp9X+YQjPbbL8DCOlh0oeBYQU1
         NNKqqcBrz7bHwerz1CCLWcX+x0S+yJ5nhpy5dvbf2pWGSkDOuG1tcVrqQ3P538IKebHW
         w9Tw8TSiixjJ56MbRcc4d9ZQChkT2OLXgxazWOeTs8EX7GWruoFmHhsMkajnnaCaKqMK
         nAGTpHLd2MRJNE2cOmVnJlXvCW6HehxHaKo4wvUocO0pgQwnQBiwpM+jI/0bNipUvmC6
         ppX9x9WHJ/Cz3li4bgaOulxBETqYh9943WzRN8LIyIA5yyA11212/Ijx2PbicHhTXbPU
         M4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstBrVYrTb7cfKe1O/vcoOjIekOcSWB/IOvFgwridISPqUzm1JUqsTZV+VFUPS5ZUFSeeLyNgANtkwNJ+MJu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQuWZrCyjCbnxAmkk85ZWm4t7Vrnm5sFj1l3oUUBRFcyy+rhk
	JC9sgNTkQXQnU34moxwW4nQLlqC9hVg1RyutDbZ34nUxzG6YdMMD6FI4ChfaN5fWBZTtop8sjBz
	Epsr2Jz8dEYC1M5Js3mbOpzx18FV9bwF0lHtEpbwiVXw4doY/sRPVzKH4PMrW2syYnEwtag==
X-Gm-Gg: ATEYQzytQEZdIOnG8zJAYukxloBM1Ebhm+U9MdPQo9ORge2CvkkTiK2yhnF9bZimYvz
	8pSY0WuW2KBR8P9wFR2Dpy0P/Lho4qm5STs6LCYedTrSFSh9IvfaMJ4lBqRGGan3S0qsFkkeAd/
	L2ivf0YP1f3tgKPoHASyo6vtRp5ZkqCtrCQFs4HlDfu1m8uv/eRPqwJkKOv+elJCHbzMkvZgUa6
	iRQJ4vfVOukzCsr+T/1HiJ1yKCk8QZ66Rr7OSCSlXPSqvlZ6zVNYEgQ6ZJE7R907/uKq7FqPMOV
	x9rIjXVM1zTUR5SFbLtBKu1TRL2IvdISZhayR/s1p5JsVm8dyno7ZmvV3qsnD4HcJd+aSmOh4Sb
	WEkZ9kQP4U5SWqXorSMAvsJrEv/DyKM23FGfVxvnhvI1kIuJstwBA57s=
X-Received: by 2002:a05:6000:616:b0:43b:4352:1bff with SMTP id ffacd0b85a97d-43b43521da3mr8977665f8f.43.1773683264551;
        Mon, 16 Mar 2026 10:47:44 -0700 (PDT)
X-Received: by 2002:a05:6000:616:b0:43b:4352:1bff with SMTP id ffacd0b85a97d-43b43521da3mr8977613f8f.43.1773683264127;
        Mon, 16 Mar 2026 10:47:44 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41ff92a6sm17659188f8f.11.2026.03.16.10.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:47:43 -0700 (PDT)
Message-ID: <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
Date: Mon, 16 Mar 2026 18:47:41 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, ncardwell@google.com, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 mptcp@lists.linux.dev, dsahern@kernel.org, horms@kernel.org,
 kuniyu@google.com, andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com,
 jasowang@redhat.com, skhan@linuxfoundation.org, corbet@lwn.net,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
 <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
 <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/16/26 6:29 PM, Wesley Atwell wrote:
> The strongest real anchor here is the already documented regression
> around sender-visible rwnd diverging from hard receive-memory backing,
> rather than a general receive-accounting cleanup.

I likely missed some of the prior discussion. Could you please share a
pointer/link to the mentioned regression report?

When posting on netdev please:
- use plaintext only messages
- avoid top-posting

Thanks,

Paolo

