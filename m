Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122921;
	b=BmDxOA1G8ijo+4bJpAWJDL80JHDJDX19kvSmxeMUT0MHirRZ1CMg4q3TQnD8uv1YoL/t
	 N1a48O49TAd4wXfqAbHTB0xWe8km3pac7+RbYpVZQvo68uCamQFOqjx3pzN0cOFsdnkWt
	 UXell05+VFoVFVtNTWZMsHD5bO6+eQJvmgTE/QHTsLHRoZ+8bgdSj+XvPfDO68JDOvclL
	 DB02PQHUJyg0uPAGTdA8IaB522jqIF9HkmtUVbRamz6tZAPqUzD3IHdHv6Z/fpDdIsE/u
	 QRYiqfa+xZ2u9dfbeBg97PQjDVcibdMWoIj6pussIDzPtf/SomVDyuf+SSUtxC1ZY1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
	b=r22AZEM6eNRo2SyQOezc7hDy8Vftj5Fcrpn7m/0tIURr/1Wli560Oodal8Ju78aCtING
	 08xURQ7MQlCs4+CLTjoCC4NY1ifrBlstlGjwmAxTc7UQAghk56u+HDKXE040QoBe3TBxy
	 mtPOCwLUwtASamD48LH9Xfu5QKw/2FFFw6H3ypGt4C2Anjj+GokzLXhuTksU9Mk8W2r+U
	 3zGWthDP+Jvaa6KFsnvs/wEf/nrl4VPVVAcor9gs/aheKmbo21N99vnXGKFcR9DeQ2nCd
	 +/vNa+f6cFXnLWx0U0MlpcVBsbVSO503DYhntL0Jk08nO1H43Ba1ghI3ElkxHZRko+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370EF60A2603
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370EF60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5365d725440so2447571cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122911; x=1795727711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=YVWDHW7iCruiAOVwlcK6OzpMh2PB/0sv9z5Xf+JAVkcE/WMJg0GwVnSHXpXzus1PE5
         qUqRwEWgmFfXRut2f35BaM7a7fSfFj11mOFC8fTBL8hWjCNj8MyVjih7g+nx/+yosVyI
         VumBeS6oyLOhGSovEzCCCMnix/7RFsuYgn6zqOKKiBevPMpgW52zYEsTWfYviM/0/K+R
         94V996npreb830xbhrb/gmJJ/AtFIb0TINW2R/RCgGwbZif1sCDEzDk5xa5CHm/BqhLd
         CEs6Bp9PGpvlkI3zdqgR3FSqd9OOEnATMzUufQgSKTOiMotPJQPiHXAgQbp8PKffiD4a
         JoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122911; x=1795727711;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=xOkSuoHjgIBWOOjebijhPsYk4zAHkztXma+CsNaAw0ET3ppdDQtyssOEMGsd6n5KwC
         kayWwuVzkmOaIxN8Cc/I2tDVIx6ItYrl3Oqr0gbSzYWegsZYPTOQk5xiEjNjl42jPqSq
         +UEtRiYQjEopzyR6tieZFgpoBsalGoj+ebe0pFlbexu9QdMYoUPEDuF5DlLL9LMOwMtW
         VQCRMNzpLUmRSna340prBMRL4qBPK3gxWzQClU8huwrrYoLXcdMzETZWIdiG0/hV/HOl
         SuKj3QFevqSYakj8/qLH2iSG1wQwC+DnTVpW/7j46e13ajZnMXr5cQzK+VJOO/9P8PSG
         +drw==
X-Forwarded-Encrypted: i=1; AL+hErHq/wciW2z5rQWEWOQKlmOlvXsPQ5bLKi5VBpM/l8565YUDyrDYepjSV7TA7MJn8f/Eo6/y/6s3Ub6dKXtwUSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Mwc15jEmu7OjVTMM/8gTjkKv4wpyN43Axgn+78xBQbkHD0aH
	N5IhkC3qF8lDoN7CeMc70RaemgQ4jIE/kfMthVBHiBYIzXpcgN4Dz8IE
X-Gm-Gg: AYBFou1hlJxwyWicGoAT5fXi5g6y+YqBX2QmjybyKHiJv+MpVXZAcvd0gkRfyHGDmjv
	EDUX//LzolTG8s/7yyn5dZt+k23cJu0CMu+0eD3sa3G/DPvAK/3L6wsfjXOCVN4waIaA9yQGbQJ
	QYdP4dv805Yz4nFwZCbKRj7nWOIDKcK2iV0U6xcdTuV+Q4/6nNov+FG75ZfDjJmgirsEaqabIeN
	aCLGn/i/afpKzSPOjio8yAZEYzjGVS7uIJN7y8StNlbryr2ChNQgAUecIihhQEJP21EMhY9ixq4
	WaLw5BrBS6y3yFjYqewso3hKJ+Y/NJPaL8//XPRheNNs0sB3X1froBtn37F9Qry3K1e+sOx7jOk
	z9FHTwrZPEHhB+javimRKoXgWbAVhBBcH55XD5CnCUcJ9uxgGfm9VS1cwfzU2KHtaD9XaDY3L/T
	Ah/hKhPBZfY3LJ3HF2XesapZk2/wv6xtln7Qf1mwefZezpbO5iN7uWiR1rLTxEa8zXHpBNOWIjF
	PEzc93d9+vHRv40RgwdJpc90aXlDIb+80ABhiszIYxrg/m8ZOwHRs+FaY56+Eyh9Oo8i8o7rpG3
	fuhJ9r9yCEQU7lTF1JD7KGmvoln4O9vT6D9TOXIMRiJDZK83ul8qV7ToYA5Zuvd5H2ml4eIp7m7
	79hiuLhCn4D9dp7h636GsG+IGUIG7PMCSHNNDGIN2DyJ4M52U1zcrb2gunQ0sGKpO
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr21615331cf.39.1795122911021;
        Thu, 19 Nov 2026 13:15:11 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm5401731cf.4.2026.11.19.13.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:15:10 -0800 (PST)
Date: Thu, 19 Nov 2026 16:15:10 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.138e4ccd85cc3@gmail.com>
In-Reply-To: <20261119144241.360238-5-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-5-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in
 tun and tap
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

Junyoung Jang wrote:
> Add tun and macvtap write tests with a 512-byte virtio header and a
> 14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
> because it exceeds the post-padding payload. A zero hdr_len must
> continue to accept the same valid frame.
> 
> These tests exercise the common header parser through both drivers.
> On the unpatched kernel, each oversized hdr_len test accepts the
> packet instead of rejecting it.
> 
> In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
> selftests, including the new cases.
> 
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
