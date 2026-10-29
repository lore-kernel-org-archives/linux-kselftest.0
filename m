Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271837;
	b=c0ZyV1SuderLCbdQtbBCwt5hyzGjRaly1n7HqxCseh8mszzYDZKZKBAP49odbXWGStgT
	 AUde3RKL9LSgXq5ll+HmVsP4m8F+5T8lgJfKbk0ARn5MU2TXl9898IcwqOAUPTh5EqTIU
	 IUj/9YZNlEcYzpmfzQctrPKqcZ4P0zI8OwXKSoOtY46ecVx+N38mh5DnbufPNJM0BeWCO
	 noBGN+nb5LGEW7yEkZ04t2pZOUD0ZM74C5CGQLpSDueJ+BXgbtE20tj9qD7l1kOzCYb0C
	 3WprQXt7k83bT2/Pe6MSM8x8NIAWXiwQYCkZz/an2IF4xrgEI0uHlmpg5JqYpJzTurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
	b=TJtYJKJRJsTAN1bB5sbgfuVLOOL0//Lg+Wnq3yE70MVRvBQvDuJ8NrmJ2wWia+iWPiW4
	 JvwxKGzoL4qmT0MqbshCbgXAfR8rHyWOPQ6u0dKQoHj9QaSm2H0/UgrO3xdw3cHX59m5M
	 XmpyJx74W3PP0KbcOye8Dbpwf9gp3lgk+6DdncGmyUcUQyIxbFFPuVwyZCRAqCnKMGLWd
	 smcypjBzrHzDAo0JPNEEzP224vU9eHNyNKcwzbGILlTffQpZzYaUv7wbWAzjJZ/BHOHO4
	 w7LSbxfECyWsa1Hn+YKgKcnuxfrsdWUCxng22PA2ZxBraM/YTbPlP3IodxQYxTE63pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qvHinnD/";
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1143606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1143606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvHinnD/
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f269e335eso228843585a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271836; x=1793876636; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=qvHinnD/zBOohgWrBCPjKhxrCzsM5HIs+nI4rv2uerlKKl4bAfAogD0nXVnEzVc6E7
         /QPewiKO5a3PhClnv8wrwJHy4hWNsd1N5JOXDhXrYiqwfGGWk4Eyi2PRTbkOn3EvNE3f
         bzHsuT9CuuNzS/XKGTdWov126Pyo/KycEqR3JkcwfoPBdxwZTjlGWmqDWC0IvPb+STt+
         vGUc2mxpeYiT/o6Tt64YokXfvgkLvmTzniUq9524kWyfOGfzXFS6Jlm7VFsqFI74uP8N
         glpJ7XJu/M2le5uQVgKOhgpK/u3vfnmihOyeM3U3AOTEBBR2+q1/ek6cNwxtoFZVYwLJ
         xtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271836; x=1793876636;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=ji7GU1H/wIBJN/1FRSpvplIYRiknPb23/5ld+UNLG7VTMlJWnENMhjmPf6X94Xbw/U
         N8xoFQiq+oGu9pFKQg0MEQrZ+azH3ErOJdnXEJAtQbft/3O8jELPu4khe1S57ZOUvJ7x
         jYhJ/SHhy2lbH9eanY8UMLvxXCLPrb/WEkUsbKFbxpgeE4yPLvv2I0BpLc6Sz+J4wUHc
         lgNg+NQXDnQH6QjNyODEJrNwZdcfPtEvGGWhCxuh6Xp0URH3uce5NgIzFpOoa7D6G7QX
         F/GzAScOt8spPnU6HTiuU+92hCk/A4Wufm5zFr69kP4erhPc3ka7zevXsAHCEura4Rz5
         vomQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIMFYRNF/OTrxj06Fd1eptlwahheQ29DCjwPpNvyJhHXvE0BRauW6YfyGHgzk2VI95mnMGsM36Bo/6l+sjoEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKODgbheckc8NPntJpaks9tGnEWpsAArsMCSkLLZk1yjQ7vDocp
	wMS0ZcT5ZhdVNMOwIyJ9q3HLyRDlPoZD71pCl6I7XuRMdeMlZFP3e0Mo
X-Gm-Gg: AYBFou3D/XJOF5vad/I1nEmHkvsxxeKNSmWx7Oo3ehRMJAME5mAc1i3ucBqtbwMko2Q
	jIoXujz3Clf1gF7sYqMyQnQ0xz2rI/wwqF/xgoZZ5VAt7hR5OTKYqhJt66FAGTpCxsIE7PCwhRh
	bWy9Rir3GT/iAPZs3TedCHB60TcJjHrNeC3qn7gLsJhieFQ/P7ZWX4V9l7HHijM/gF3NGEA2vYT
	Bs/Th+wTe3e5Cblh9Wu1KnnPUCWfg/DLP2bfbpZv6mk6jodyfWofWtJHGNq7A6mXCw+S9P37mIq
	a679T/gpH9thvBUyWXAAMtXtBAN7XUVP8HyOCJ5BB7GHtt1b68BwQl1x+qWHjkWioyWovLX9yMh
	aBOnZbBGFMJh0hAavTkOv/A2Gao6fGlSknHegRk6NYAIp8Dog6bl4/GdcZ//csBHm26T9b5oMqS
	PgtIFqRRUih8iNMxyawCTw6HtqD1lWo21CKuejPTX91COZhAIDzWLhSRdFhzrIVedJ3JukD/8aD
	38SpnYBFutMgmG/8DMLHk9PDFNHEqoFPAQqdSoSjPWoyoeZGYXydu0Je7pppOaUSPxGYptLP5M3
	eeKL8jsxL3prWjvAAzUI3AJXubC5ixAjJg==
X-Received: by 2002:a05:620a:3183:b0:93f:2c95:658c with SMTP id af79cd13be357-94408a7fa2amr789388085a.14.1793271835721;
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05af648sm1506079685a.1.2026.10.29.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 07:03:54 -0400
Message-Id: <DMH9T7NY96VZ.X2G6APCG51K0@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Kiran Kella" <kiran.kella@broadcom.com>, "Jakub Kicinski"
 <kuba@kernel.org>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Donald Hunter" <donald.hunter@gmail.com>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
 <20261009-psp-v2-4-5596ab50f677@gmail.com>
 <CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
 <20261028152950.6624ee83@kernel.org>
 <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>
In-Reply-To: <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>

On Thu Oct 29, 2026 at 3:14 AM EDT, Kiran Kella wrote:
> On Thu, Oct 29, 2026 at 3:59=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
>>
>> On Wed, 28 Oct 2026 17:16:17 +0530 Kiran Kella wrote:
>> > > +      -
>> > > +        name: tx-key-count
>> > > +        type: uint
>> > > +        doc: |
>> > > +          Current number of Tx keys installed on the device.
>> > > +          Only visible if the driver stores keys on device.
>> > > +          Kernel statistic.
>> > >
>> >
>> > Maybe it is good to have a counter that denotes the number of PSP
>> > sessions set up on a device, which is managed in
>> > psp_dev_tx_key_add/psp_dev_tx_key_del operations similar to the
>> > tx-key-count. That way, even in non-SADB drivers the user can know the
>> > scale of the PSP sessions set up on a device at any time.
>>
>> AFAIR the thinking was to also implicitly flag that the device has
>> an SADB here. So this stat should probably be called tx-sadb-key-count.
>> We couldn't think of a reason to count the tx keys when SADB is not
>> present. Rx keys? maybe, because of SPI exhaustion. Tx keys - why..
>
> Tx keys to just provide info to the user about the scale of active PSP
> bidirectional sessions (after the key exchange) for debuggability and
> for any other derived scaling/performance metrics.
> Especially for non-SADB drivers, where there is no device limit on the
> Tx keys that can be created (of course limited by the SPI exhaustion
> on the peer).

The main use case I had in mind was seeing how much of a device's SADB
was in use. If the usage is high, maybe the user will have a policy to
not even try rx-assoc (which always succeeds), just to fail tx-assoc
with -ENOSPC.

Total active PSP connections on a host is something I think users will
want to track. I'm not sure it needs kernel support though.
