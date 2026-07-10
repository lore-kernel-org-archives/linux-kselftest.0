Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2513F0AB7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672895; cv=none; b=uVAU4KtlMlfIBhTCqZowY7a/38E7dm1ekfopqkkgY9j2k4dvUfu30Y1t78aLLIqlOROfG+/wSBOdJfy9yhBSbKpS1TtgEMNVM71OTzLUOXAXEDu4+ZwyiNmJppiToJWByJJl/UHiT+gNTKFcEF9mDTUWUP5iQ+azw8rsIVLE31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672895; c=relaxed/simple;
	bh=OI6vZMxTu6pN9CeOFlTYwvTpQF8ytBKQzoHYrEpHfxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CNyPYIQ4vU+90WItmMr7iSmUjFG/5a3NRg38v7wlb7tv/vsx5pCsRAEylUNpWp1Tw+fd9JAQqg0DUgf3khkhbUQkN3tCEd6jesbcKhDavRYhbLsO27Dg39i2UXRuCs6gTXwrFczHhCYoNUrStW2TpzqpM1N7dDh1Ep3NIJ3aAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YBZDBdkT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8gU1W1k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YBZDBdkT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8gU1W1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783672893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OI6vZMxTu6pN9CeOFlTYwvTpQF8ytBKQzoHYrEpHfxA=;
	b=YBZDBdkTFnQRyP3NseX4c9Z8qW7I/L48TPPTnBLu3HN4f+xhrMUm1OcDGL+GEZpTgQjgz5
	xu+HL7H5edsDx5NFED/qdUP4QPLhDzjTOPlA7YPGo4vwC1kgLE5uGUDzT2L6VBNEwyjOSX
	bHBkZd91PhyUPYF9phNvBpThNLYVaPs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-5EanmxLWMWa32XIivln7Pw-1; Fri, 10 Jul 2026 04:41:32 -0400
X-MC-Unique: 5EanmxLWMWa32XIivln7Pw-1
X-Mimecast-MFC-AGG-ID: 5EanmxLWMWa32XIivln7Pw_1783672891
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47dee8adf4bso726263f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783672891; x=1784277691; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OI6vZMxTu6pN9CeOFlTYwvTpQF8ytBKQzoHYrEpHfxA=;
        b=M8gU1W1klufWB9YWST7wEF36H6mX13GXvY3B/lx/U9BpqR+9yfpqnwvkP8vzF447Qk
         ZH0gZVHx+X7hcdAgu3cyRVTbSieKEvEsxwsETpzcsBQC6wfTPN3dkiMb5Ha7EOKH1g/7
         8kRAruzKLK8ZVVN6QGdMLIeJsXCqlyZbubodcoY3xO27WuYXmm/uhS5NjsB6izIqbpvF
         C6Gr10hDKwQgqmcX7UDu5tQI0Ym9Lzu7GKR4VLp3+GNFrN7KSfnDpjcTAwRdqXotRbwo
         +74YEuvola1RKJQN47JFg5rZLlQMPb6oD9PLBN6/N26pSsfRr4fKvJefTMGnoDbjBxNh
         Acmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672891; x=1784277691;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OI6vZMxTu6pN9CeOFlTYwvTpQF8ytBKQzoHYrEpHfxA=;
        b=bqO+vCUQmtNjp+R5fOG0IHeHWnHECWIeA7TLPWpmRR4vxxGly1OXVT30srAAHM35ER
         jeElOAvd55VX24ohg05d1/HP4Pjoyx7UluN7n3QnVnKJGDwK+OTygmycKaEb5J8yde/6
         9Wk5IJBBiBZHw7GfihNj8j9GVHx5iVa76CfsLDMLO+boPQ/mLXq81p1kT6+Wtt/1q4Db
         YoPtNsC1597iJKqqXNCtKRu8JslBq0afobnqkwz6HBwLnZSC1ecp+x4PFkefd7sgXs+x
         +3Z+QhZ7RFUKEhVeR3aejx16klizuTInvcOVPrnrYs23JjxwQFgyo7fnM64sMicy5aog
         0J8w==
X-Forwarded-Encrypted: i=1; AHgh+RoUEH+unaM3Wua98jmOvg4JSiyLzIOfYxWXke4qdkidUEMnOCLTfUpj5YySAUjEkEpjDzY5JT1DNRjj72VxMAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIKWl4RzrOBuMYVRoWoONDAYD883R5RJrpEABcc0CWx1pWjvx
	LYrZt6wNP+lwzoaG+P4TtpsAfiNkQ7+apdBEBo4jnIu8e5S4M36gZc+QOj2DpfzwD//ybcy+TnK
	WhUn6iv+KZ4XyNj3RxZmILWuTogHBcPwmH2ISS0fPuHDuTo/Cm/OoKxQNzQZQmBpFABpAMA==
X-Gm-Gg: AfdE7ckeu6JMszLXUURDwsvZB4s4WsM1b4QMukZUbxtMSdfd6gbPJLcbXf6dXfyrzpY
	EdFfzxvSiI/fNnhLtZe0s2DGgm0fJcHz6+Qjj8EUcLCaDVoPMNrhUzKqC4ps7TA6knTa7h9MYaK
	yE2PqkwFXTzqeMcXyn0g/DDCNJcv+/ZojWetTuqZkljjaPBo9XwZa7o0fg418ImuHOc/jQSflks
	Y6aGk+KW0MqRmowNChJy0U7ZKgFALoS1ydz5l449uplVO/m1wrh+R0YqTJ+phCsOBYeZmPDAKa7
	SkHXpCM5lXnaYCd2nNJK72Bo8KiuQhwHD+kTq+Ddm4wA97XJT987G467j51bQPpgP1p9cz73NK6
	tMFInN11kBirGFBaitpqjLQhO6ZiSU0fnUWv7N1/aDACmAM+2W6HKKw/sB1KiHFHxWGr15RJ0CX
	57+wTv
X-Received: by 2002:a05:600c:828c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493e68ee07cmr92567745e9.31.1783672890917;
        Fri, 10 Jul 2026 01:41:30 -0700 (PDT)
X-Received: by 2002:a05:600c:828c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493e68ee07cmr92567485e9.31.1783672890572;
        Fri, 10 Jul 2026 01:41:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm119685795e9.6.2026.07.10.01.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:41:28 -0700 (PDT)
Message-ID: <dc79a18f0ff50c4715a998c00e249255dae7b7c7.camel@redhat.com>
Subject: Re: [PATCH v3 16/17] selftests/verification: Rearrange the
 wwnr_printk test
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Thomas Weissschuh <thomas.weissschuh@linutronix.de>, Tomas Glozar
	 <tglozar@redhat.com>, John Kacur <jkacur@redhat.com>, Wen Yang
	 <wen.yang@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, Shuah Khan
	 <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Date: Fri, 10 Jul 2026 10:41:26 +0200
In-Reply-To: <87zezzxt9a.fsf@yellow.woof>
References: <20260625121440.116317-1-gmonaco@redhat.com>
	 <20260625121440.116317-17-gmonaco@redhat.com> <87zezzxt9a.fsf@yellow.woof>
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

On Fri, 2026-07-10 at 08:18 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
> > Simplify the test and run the steps expecting no reaction before the on=
e
> > expecting reactions.
>=20
> This requirement is not clear from the code. I fear a new developer who
> wants to introduce a new test case will easily trip over this, or even
> us a few months from now.
>=20
> Instead of this, how about each test case discards or ignores all
> previous reactions?

Fair points, the issue is that we are hammering wwnr, on some systems we ma=
y
still see printks for long after the monitor was disabled, I tried that gre=
p -m1
trick to mitigate that.

To ignore all previous reactions reliably we need to wait for the buffers t=
o
flush, something like waiting for a full second for nothing new on the
ringbuffer perhaps. I could think of that or at least make this more clear =
with
comments.

Thanks,
Gabriele

