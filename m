Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227454;
	b=ZEWASawjUCzSGPJ6bFhdgMbLOUVpOkLsmV9vTGZ6/G93fq7qJa7yLNLbq+gQ/fWPUPyU
	 Q/I4OtxdLusU3eKpIhEu/WKJ14rgM/73vMYvGFjP6mCToR0pV3jnV03k+pBEeofq1/wr7
	 IGTZrS8ymYgDnV2Im27t7sjuSR0lqBUlE08tc6Pt5uyCnNOFg55dzMZx3tAj/vVq00Glg
	 VwdGXo6jYUVz+nQvKeTqRrfGvdgdIDvHYUBL81DEdxcIisbtzQCGmDpMLGW6Lpa2S/2xn
	 H1eIjuP5fbnsw0W6r+BYjdcuHXhtXPgOLMUVSUx8uQExau4qS0TQP5oYjOpldUOCCAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
	b=dGzmOrSvWUTwGP9lYg2rVeh/yXquVRpKVBATB6ZEP5AtXw1/njropifHaMxalNxIxknN
	 g/PgWeZbbP8+5gnrrN0KYpgEFmhv938chS2fCALQgoso13ecs4wv2G/RVw9Qr/i8GSuIL
	 6LL3cncRwzhn2znRPt/DexuE181E+4ymCZaJEs+hNyhJjE7LmZap7BWlrnaeRDRXXR7K7
	 wBVYc/Ry+bzKl0e7M1FZa2j5Jd52bhQaM9seIs7KbusxDhfZ6lMB06NBhhPQEJ1Pz65eV
	 2l64ElQjt3mlONhSM5WaX6jP93qQVQgnG47onM1aM5G30jwl54IUVAo1Nxmqtgp05Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D1606A32A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14e307f29so773555e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227452; x=1794832252; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=Y58DbjcnkyPQ1CZRralTMZTIGZBHupsTH/Og90s0MQFBmBQYwYdDQ7GQnuN0UWK+Df
         zL1rszlu1x9PSyXNo7wZHtrTF0m4lfuq1Ni1lvH7SAA+eEKiCSSjrFd/u+uIw/vwLALH
         sDdKpfomvP+ZwGpfyz1gP9S8x15+nQ8MmIVOl6gU/Wv0XQAC9FpewRQivFm4Nuk1M6NC
         8L+KDCMHsM7MUnd8w08/FeT6DEoouBOfI+sq5029haSyZwdqcPYlWaplHFbiD1mQCMMl
         tkt2v39ZU9yuV1j97WoskoirDA1lHKrBZsKMsDDt+NSnSaOh6s34fjijnid4W2ajqUnC
         Vleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227452; x=1794832252;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=i9wp/gCJJ5jk+rlFQtsOhAKGV4BcciJsTn48aiK7sZFidvUs9Ps0Y04c7MqhDg/GE5
         f7aarGeDnQ7LAefKbsdCS6H85/k3Sq1m2QbGZMCOLGfRzXjABzsWu9vGzl+P104pGjQn
         WPOJ/F/O0WVLScBd05D3Yu0JlJeFjGPTP+ZfryqvaoXzBqIlQ0kO6W+z6k9HFAbdloE/
         d9JQvPkZX97qGADY9RCsDYdZ5FZJss92L+rbVqbXu0nvaWgKCRGmPDwfPt1j1SKq7eY9
         OPeYCM/p8d13pO6DX4S9UhD/xhiQ/CQnCF97JWULp7OaPPJHIt7ITpPW6IumWWpWV/rN
         GBIA==
X-Forwarded-Encrypted: i=1; AL+hErEh4Jqfr8eierUiHxfOYjiYni4NF9x31MlW05eusbgvdLXr81fNPkFSX8FT8BL2Banwm/G64v0460eKOh5aDzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rk0qwjVF4PoDZWGJx0Ybnae6egvqhX9iZyuvue5d4ZE2/nvRP
	GfIzpqtRp8rHMQZSZb18T8QLY3Vxzkc8yeun7OSHHfZaPx7Dvtjh6/QJ
X-Gm-Gg: AYBFou3tMFMgaZ2kZIVignFGk9xcNn8CdygbbSyQh5DWfTLJLoJrQOXu5gb570vJ/O8
	ASHej9Ibr7OeZciCHrh2zENI7U15cIlAQ1lfOL37pfCx7BDTHSkC/B0BnT/3Wfd5ghz4JDa3S9C
	h8SRmZYtBPDx2hwk8kpwjzw3zu/gGghXHh6tI1D2ESJMYTrVlaOLH+qYPTv1xqxFH1SR24HH9vP
	4QY61G2h1sZ4bRntFF6KbKwS56/kcj5ww1WKqvYxkJqZy+17pGXfcDayWIXz41jfjaX/dwqOeRd
	QvwcS853/SB/gxlhe5xR44UlJ4TRh9H+dFc3Z7E06JhSrXKFCyQAS9+mjT+gbNDaDYQQkw4Bh1X
	GRHxC9IpopoxCZx1n6gNJB+dYWZHwaWBw5tnAVBzKJqEoNyc/oafW8B6TQB4snGS5JrBYXiA4bx
	6KtOIV5mFlvp4NOE5c4aSNbusTMRLuU72hMUho2AOsMhmeLgF2B4IyQ3xv5gF05xFg56G9Z4XRi
	psKn8SFMtR3V/JkIHDrwzT8FOEGD+I5ewz0p3S3iXsPToDyhxOTGRGpzDivW9rSDBgy+HIgNay0
	g9a6zWrKZKCS6Y1uT4RFivqfvJw3Xxc/xa1O+sMChpG0P9pB/qBvsxQ=
X-Received: by 2002:a05:6512:3e04:b0:5bf:d6b6:888d with SMTP id 2adb3069b0e04-5c14c00dd3fmr1236728e87.18.1794227451715;
        Mon, 09 Nov 2026 04:30:51 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc086sm849084e87.23.2026.11.09.04.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:30:50 -0800 (PST)
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
Date: Mon, 09 Nov 2026 07:30:45 -0500
Message-Id: <DMQOJPJ4AT7P.3DUQ9O213TZBI@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/5] psp: support rx rekey operation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
 <179408516544.994134.848767943937829488@kernel.org>
In-Reply-To: <179408516544.994134.848767943937829488@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] There is an unannotated data race on the new
>   psp_assoc::prev_generation field.
>
> --
>
> psp: support rx rekey operation
>
> This commit lets an established PSP socket rekey its Rx direction. It
> does this by creating a new psp_assoc that copies the existing Tx state,
> and it records the previous Rx SPI and generation as a fallback.
> psp_pse_matches_pas() now accepts packets that match either the current
> or the previous Rx SPI/generation, and psp_assocs_key_rotated()
> invalidates prev_generation as needed.
>
>> diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
>> index 410adb6718c16..5a7a518b9579b 100644
>> --- a/include/net/psp/functions.h
>> +++ b/include/net/psp/functions.h
>> @@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct p=
sp_assoc *pas)
>>  static inline bool
>>  psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
>>  {
>> -	return pse && pas->rx.spi =3D=3D pse->spi &&
>> -	       pas->generation =3D=3D pse->generation &&
>> -	       pas->version =3D=3D pse->version &&
>> -	       pas->dev_id =3D=3D pse->dev_id;
>> +	return pse && pas->version =3D=3D pse->version &&
>> +	       pas->dev_id =3D=3D pse->dev_id &&
>> +	       ((pas->rx.spi =3D=3D pse->spi &&
>> +		 pas->generation =3D=3D pse->generation) ||
>> +		(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
>> +		 pas->prev_generation =3D=3D pse->generation));
>>  }
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index f2cba3fa3a235..c1e38845f08c3 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>>  	 */
>>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>>  		pas->generation |=3D ~PSP_GEN_VALID_MASK;
>> +		pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>>  		psd->stats.stales++;
>>  	}
>> +
>> +	/* Don't allow SPI from two generations ago to alias one from the
>> +	 * current generation. Rx rekeying under the same device key generatio=
n
>> +	 * is currently permitted, so skip if the previous SPI is from just on=
e
>> +	 * generation ago.
>> +	 */
>> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
>> +		if ((pas->rx.spi ^ pas->prev_spi) &
>> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
>> +			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>> +	}
>
> [Severity: Low]
> Will KCSAN report a data race on pas->prev_generation here?
>
> psp_assocs_key_rotated() updates prev_generation with a plain
> read-modify-write while holding only psd->lock. That happens both for
> the prev_assocs entries and in the new active_assocs loop. Both lists
> hold assocs that are still attached to sockets and can still receive
> traffic.
>
> On the Rx side, psp_pse_matches_pas() reads prev_spi and prev_generation
> with plain loads and does not take psd->lock:
>
> tcp_v4_do_rcv() / tcp_v6_do_rcv()
>   psp_sk_rx_policy_check()
>     __psp_sk_rx_policy_check()
>       psp_pse_matches_pas()
>
> psp_twsk_rx_policy_check() reaches the same check under RCU.
>
> This means a key-rotate running while a rekeyed socket is receiving PSP
> traffic gives a plain write racing with a plain read. The writer and
> reader hold no lock in common.
>
> Since the field is a u8, it can't tear. A racing packet would either
> match the old prev_generation or be dropped against the invalidated one,
> so there doesn't seem to be a functional problem. The existing
> pas->generation update already follows the same unannotated pattern.
>
> Would it make sense to use WRITE_ONCE() for these stores in
> psp_assocs_key_rotated() and READ_ONCE() for the loads in
> psp_pse_matches_pas()? The later patches in this series don't appear to
> add those annotations.
>
>>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

This was a preexisting issue. I didn't want to move the exsiting
read/write pair to READ/WRITE ONCE as part of this patch. I prefer to
change all of them in a follow up. Also, as the bot notes, the field is
a u8, so tearing isn't possible.
