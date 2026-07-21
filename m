Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B499408622
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615058; cv=none; b=UvVqGrH50D8UnPskk+GNzEkNdvMschi1kvsj4SGKHBoHOzy8nHajhjM+HUwBzRWKk4efy9AtwQrjwbvIpsSj/CTCfYV8GGHYh5do25ROq66NY8I2YE8RTgMAevwbK+riw74+wF+TTQZ2XDL2vnxSzKg6Z/LHB2AcarJVEHDRe04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615058; c=relaxed/simple;
	bh=JzH+ufdHv0YE/R37scie7GwtyRB4pzjAQJdBbInKddo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VRX5zluXEYUmuBGcXfRGy9UjyQW/pCd5pFeA/7wodd1kBcc/kqpDHvbK48Mz2U3ClIZrxi0RGVoU8gr4y6U+XpDPSpPX1vr0QyskHQ/D0gMf+vFsTR2RiUpaFzmYs32al61bIhP1BFSij+ztwq1MG54bWBRSbryo+hwmBe4Bq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blQnOxBZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSXME/YG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blQnOxBZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSXME/YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784615055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jYnrNqtg0uUUimLa3WE47ERp3Pp2BbcEKlJ0al7yA2s=;
	b=blQnOxBZHzNYtn9OBPpZv5PbYKHOj55kAH1IaoE5pxCXK3/R84Y+CPV0u5rC5PBOcU+wsW
	rvoht1LERZzPMiMs0wrZbvDvZC5qOHd9Olf2J/Eu0yU9V9z6tycRp9/1rEUV+Ug0xObvgB
	XFB7TJ3buGmIuOGKu1rkSXZsvZvMSK4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-EdjbMY_qPUytvbONZ1jY4Q-1; Tue, 21 Jul 2026 02:24:14 -0400
X-MC-Unique: EdjbMY_qPUytvbONZ1jY4Q-1
X-Mimecast-MFC-AGG-ID: EdjbMY_qPUytvbONZ1jY4Q_1784615053
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-69ebdb9390cso2897576a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784615053; x=1785219853; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYnrNqtg0uUUimLa3WE47ERp3Pp2BbcEKlJ0al7yA2s=;
        b=iSXME/YGJP0RWnWR+ChnDKgIJ4AbYp4gN9Tll1GqmJpZkAa/YGiqiqdoQKijN9mXY6
         cScF9fcxIUoxJVB8LUoMQBX2w9btofXoWj3iqiskQe5MGJg3FN4KYuxzd0CEXj9Xie74
         0InREP4xSk3YGxIkF+yNRQfIGIO+EyaleXvtq2EtCg/P9wVvA1shUxwON05sxv5aGo3W
         +2siFhm0KlA5OfseWJlA8s7PCaZHVQNt+BhOdijn0TPdVI5ZocSa+71cdbM0nWZSJMXb
         ZZY85PmjhPp2lN7CTulvl7kxfq4q8u0RQUenhaBDGY4oK6QiL1GBtcgwGb0HAy700Dcg
         usug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615053; x=1785219853;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jYnrNqtg0uUUimLa3WE47ERp3Pp2BbcEKlJ0al7yA2s=;
        b=VX8lDMF3kjJzHhGaYFxVm2CmTqZFkdJC1nNBguG5OMUKFMoQDROSGFXbIfFoMy1gAE
         TcFMlRJwS0+pE6N3aAhMnI9l6bbs/QOaaGgBx952MXJUhf2ams3waN0jQKIeEtWYzBvG
         sWLWY9PRl/XTuI5/nIA/TtYYG8c+gpIOJ4+IJZLWbJsbE/ckeLmK2io4dHStJP2NixyD
         T0q3XhkwqlrCN2bmDONIhfryuawEstb6/we9xG5rE8P6VTLhlWNLias8HvEvoQVAYhYf
         8ngPv2kANYgnw6TQhb1OHIE/MatRYyxjpZFh7bfg2j5FHtL8VVYPUuqjo9INhjYy//2I
         nA6g==
X-Forwarded-Encrypted: i=1; AHgh+RplBcjLbH7GaVDNss8gATaYfbm41IiAsxTIqt1ca4dEVT0mDc7jgP/wcKUyPXfJXS9lOJHb+Ctm8VlQxl6cT8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxX5P/Orlk9b4ze5sus/oIqqYtmbWx1GVaKMA479y1d7qL6mhN
	BPu2Fif7fUQaf+tT4EiecyNBPnU5DQhiOzI4WmiF+LogUqeniOUQbsBg/WCruv3M5IC8t7eOTA7
	xpaTG88cs6sgqz0/IIOMBTO8Veh1NYJCYas8zlBWmOrKBNOvrfgQgZBWXYlPr4QAEZQh9lg==
X-Gm-Gg: AfdE7ckuDgS4AXt5DhkN9aovrMsjfR6Z1luII/dZRRxRUu15GV17+sSq82l2cZJyBN9
	GaOCdX370Tst4KoqLIKZVhyUjxK5Til5AOKjxOaupNHwSi40Rbsk1+BBlMOe27B+q0LX/P+ncTk
	x/icuCnatGT+mSpAKBx0qKRj5YNbM8IjX7irOC5UXk9rw0hbXPyytA2gdeyj6PquXZwl1K+IOnU
	u4V1dSAv2Ibr2v+6tnAS3PtWMooF6B/ZtH/gPn+DZ9Mc3UGEqxQIYwMxQ9HpIWd0ohltha/mgxp
	w6A07AU7sddexW0KBB3hOSEL7zJfJB7QKrNcWZNvN/xCuc/Ur4aLNpfydNqcp7pMQYigxu9y7zl
	vnNx9wkLkv8Xfg2Nl0YZ43NiV7RNqjTVCduQKjTzpDaOCyWN3fTyIvqn1Avcu//mEA7cgTg==
X-Received: by 2002:a17:907:8b8b:b0:c19:6ac7:89a3 with SMTP id a640c23a62f3a-c196ac790fcmr315190366b.37.1784615052977;
        Mon, 20 Jul 2026 23:24:12 -0700 (PDT)
X-Received: by 2002:a17:907:8b8b:b0:c19:6ac7:89a3 with SMTP id a640c23a62f3a-c196ac790fcmr315189566b.37.1784615052647;
        Mon, 20 Jul 2026 23:24:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae10fsm549472666b.10.2026.07.20.23.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:24:12 -0700 (PDT)
Message-ID: <3c4b83ceb8df81aaefd93404c4d69063db965004.camel@redhat.com>
Subject: Re: [PATCH v4 16/17] selftests/verification: Rearrange the
 wwnr_printk test
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Cc: Wen Yang <wen.yang@linux.dev>, Nam Cao <namcao@linutronix.de>, Thomas
 Weissschuh <thomas.weissschuh@linutronix.de>, Tomas Glozar
 <tglozar@redhat.com>, John Kacur	 <jkacur@redhat.com>
Date: Tue, 21 Jul 2026 08:24:10 +0200
In-Reply-To: <20260717154638.220789-17-gmonaco@redhat.com>
References: <20260717154638.220789-1-gmonaco@redhat.com>
	 <20260717154638.220789-17-gmonaco@redhat.com>
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

On Fri, 2026-07-17 at 17:46 +0200, Gabriele Monaco wrote:
> +# loads may flood the ringbuffer, wait for all pending printks
> +wait_dmesg_flush() {
> +	local last_before last_after=3D$(dmesg | grep "rv:" | tail -n 1 ||
> true)
> +	while [ "$last_before" !=3D "$last_after" ]; do
> +		last_before=3D$last_after
> +		sleep .3
> +		last_after=3D$(dmesg | grep "rv:" | tail -n 1 || true)
> +	done
> =C2=A0}
> =C2=A0
> =C2=A0echo 1 > monitors/wwnr/enable
> =C2=A0echo printk > monitors/wwnr/reactors
> =C2=A0
> =C2=A0load
> +wait_dmesg_flush

On some systems this may trigger wwnr's reactions and run indefinitely, I'm
going to send a V5 moving this after turning monitoring/reacting of and add=
ing a
timeout, just in case those switches don't work.

> =C2=A0
> =C2=A0echo 0 > monitoring_on
> =C2=A0! load || false
> =C2=A0echo 1 > monitoring_on
> =C2=A0
> =C2=A0load
> +wait_dmesg_flush
> =C2=A0
> =C2=A0echo 0 > reacting_on
> =C2=A0! load || false

