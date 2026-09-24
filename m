Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2862826C385
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234316; cv=none; b=optw/BbM8nXbzMr8qRIeJLN7aPBR7FzbrKBfnbi3GFNXWUKkyv/W4Ex7uFruuByyYPapnUTHfEwERbR8v8CjuY8viA6yjh3tnpMatY8gC4WsWbh5O+kzS4ccXneAzxduTqoH/cdPO3hm3sfCOvlC7gObgDBTlS952JhqxTzFzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234316; c=relaxed/simple;
	bh=tiND65YWQ7WExP2YCttwYf58Qou97Hr6bJr+s79BFD8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u7LB2x4QNMQMHeV85QB0S+WBwI2GIVJ8H/FuSZlvo/Na76lT5jBGqOmbVieVtMGQQwxvV4i4NhZhU//Jiy5cOS0SCMitFZ8sfDjkLEfn3QVo3POAW2OlOI7f7viOGssjEkZqMsgWIFbznPp/svBqDT4bqWSf/3Bv2oP+6xpdMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rxkzlr1g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcz8hB9o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rxkzlr1g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcz8hB9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790234309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
	b=Rxkzlr1gerfi4rfbdqWK8VZLvHRIBbGSHUVF5zS9wnpCWiDdLuIe6xd6dbBWi+X8GyKcYD
	IzPUqKw1X9ylZbtmveDp/nGddtGTzzOv5BvptKBd/oWEd9ar0YBFc7wXfLaEtAZx1Wrjmj
	OyEjvoiowEdgby3/k5i1tt2tbnbyYeM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-jd3hCED3Nt68vwFJy7-TXA-1; Thu, 24 Sep 2026 03:18:28 -0400
X-MC-Unique: jd3hCED3Nt68vwFJy7-TXA-1
X-Mimecast-MFC-AGG-ID: jd3hCED3Nt68vwFJy7-TXA_1790234307
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-487038bc9b8so905478f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790234307; x=1790839107; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
        b=fcz8hB9oX0RwftFfCJk4jHxOOsXfCYSgP0H7GDBsPj72J5R+xJmt9xNuun0vvTdCLa
         wabxJQLq422a28lBpLcYEHok58t4U2XDSPMVpImf3miu+4LEm3LxNOFKQdhP2noB5/L5
         en6BtOWt2eFjSJ4DLJIIxwsNqYOOXEPYx8WryN/z3oEqqYCGJtzD9m6jQq1hLk9e/xms
         rwkJCzHlrfyZodNwszFtuxwPwyaA5HFXxO3KsvlO15daNIv3BPNlbqOh0Qi8MM6k3ylu
         uUOXjSxSVkgpTtqFpQLJeNKYPk78nUHcjTncYiDyZg59auaS+xS2wh7ZDRsMRhfIozwH
         GbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234307; x=1790839107;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
        b=AmD1Q5Bkorp2buLybFHW6X6TN5NxOngcgeX0/n+oaSFcO2Q+t1dGBGTvIuOQNMcWhr
         bajv10ePnXsf2B7liRj8XYo6GnBvvgeJiaxuq4RlUxT/Jbv2fBLtRTpLrZ6h0KV40Pep
         czRYOJMTeg4BsUTSjnjSSti1Z9m8W09+0FLX7kjxZafXHZq/bXN2wyqZNyPHjGzopiAF
         71PdYpFDx1D1hWxehtCk1e7qHcjwMHh/7EwXheRWgSdbbEnv6BKijGOF2JyxdGSNISAl
         A9HoNzXddVpk6f0I5iG59DhshbzfiMMqStdpCZw2XN30zKcP63w3vuoFBvGAfe0iRLKU
         t/Jw==
X-Forwarded-Encrypted: i=1; AKwUvByoPWUHTYwaBTUqkuOyiiIAgOSGliWh9uIPwdJmFOMbo9WQg1ZhRDy3Qd30sOZ4wJxFvuUZYCk5fZRlvK1YKJE=@vger.kernel.org
X-Gm-Message-State: AFuF++nSwZTE7xO2Ie0XK6+LyNJcMffLGgdooXgcy41S1TbLYcnYZB0Y
	ildnmagoDO+RbPJyNBPlh+Y56SUzY/Yt0a8i6HjIk658Liyxhx81CPrjZoftdMZn5Yta6kWUHS6
	nMkZDSLMK7CFQui5l/Dawb7rEktuKqzv3Rk3PQNj3zW2aVhm3s4dEhJVlwHfAU5b2Qegy6wBxFc
	t1Xg==
X-Gm-Gg: AYBFou1bS28U/HeFDZ81DX/6hPG/KLXRlvFpauQGIMFZWXprMI/4rqCme3/d0t0ey65
	Nhus6SvketRmI/7pM5DNzZRc7XU4OF+TSe/lvkgKimPF7S/a//brjVyL2w7DJWl5aoRXanweu74
	V5D8I+Qf2ymHLIE2snZnpfRPUHrnu3hwwy8Bj/kGRWODCIgZWDoVAimoUp014lAP+KlkLt1xPXU
	bqYiGDD/ihJN4L4KvbrgCM32vKHRk6AFK5PZQ0y8pjgxik/PnEkWQ0bnHlcgsmVNflZc1sd9T1d
	FAJqTRP9xhVzWpBFtQHBQDeatPtp0tboWpzQTxoXypdAMtJYCKtigd40HHfEWs9BnW7j+V8fHPP
	ah+aXcAKL7lhal4TI8o08Rk7rCMxh4CWakIg5Xms=
X-Received: by 2002:a5d:5849:0:b0:488:5535:415e with SMTP id ffacd0b85a97d-48871728c76mr2575377f8f.25.1790234306876;
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a5d:5849:0:b0:488:5535:415e with SMTP id ffacd0b85a97d-48871728c76mr2575344f8f.25.1790234306488;
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm11499823f8f.7.2026.09.24.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
Message-ID: <c8bf231a39b5303bb283b12648a9e23b5c4bd07e.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 24 Sep 2026 09:18:24 +0200
In-Reply-To: <20260911123439.463052-4-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <20260911123439.463052-4-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> With the core facility in place, hook it into the DA/HA layer so that any
> per-CPU automaton monitor also reports how long it lingers in each state.
>=20
> Pack the automaton state and its entry timestamp into one word so the
> transition cmpxchg updates both atomically. This prevents nested events
> from attributing dwell time to the wrong edge and requires a native
> 64-bit cmpxchg.
>=20
> Account a transition as soon as its state change is committed. An HA
> constraint that rejects the transition can therefore reset the monitor
> without leaving an accounting window for nested events.
>=20
> Add a selftest that enables a per-CPU monitor, checks the stats file
> appears and is populated under load, and skips cleanly otherwise.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---

Sorry for taking that long, I could just have a quick look at your patches,=
 the
approach looks fine but I'm going to need more time to check them carefully=
,
likely after the LPC conference.

I'm not too fond of how you split into patches. What's the reason for split=
ting
1/3 and 2/3 ? It seems they both add the new functionality, one step at a t=
ime.

...
> +/* Edge statistics pack the state and its entry timestamp into one word.=
 */
> +#ifdef CONFIG_RV_EDGE_STAT
> +#define da_state_t	unsigned long
> +#else
> +#define da_state_t	unsigned int
> +#endif

Also try to define things in order, da_state_t is used in 2/3 but not defin=
ed
until 3/3. This doesn't break builds (the header is unused until 3/3) but i=
s
just harder to review.

I find it more natural to split it into 1 add new functionality, 2 wire it,=
 3
test it. What do you think?

Thanks,
Gabriele

