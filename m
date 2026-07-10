Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B83F0A9E
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672310; cv=none; b=Hd61ZZlPk4mr9x9BiwwB0N6vJ/+LZE+Hw+2FdhQro4ri9KHiuK0N9JXiXXRZNUAU6ncIQVA9h76dQi1cKXy8gVud2uu8S0LZ0hrbWg72Php2ecSzzdPCrSUpZoQ9nfTYe7RLph8RaTIWDKUeUjDrQr/fXiLLoquzuivpzBmTMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672310; c=relaxed/simple;
	bh=B82fUdr3FIRmXEGo5N2knauT/Vi17F2UJb4hCihO1wk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l27Sl8UOBcaljxmQGzXN37w04wM8eExXxJ65AyVM1driuBC3y9XbtfU8erpF72toyTrxnr5tAf3NNR0vd/5wheuV3j2B9fixecJiNAZ2sEZqakvgYw0jgvYrhUJ6Xt+KoBeUMSNhk4cx55bopjyXoLBN8SZWpqizAawQ5JRZPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9CSv6kM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvcip7TD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9CSv6kM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvcip7TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783672306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4kQemOIUwz1M/CXyOgmbczAyLfNUg0B0dvAv2SyUZZs=;
	b=g9CSv6kMOEWxdGFTkfs6Bv8l/5UPAbdJgBSVw8WO/Gr5Ub410j9vTehwVZ5sFKB/PFq6rk
	UBudwPF0ieJ7jZ7rT8ZpRKAsqzA210Lsuu/FGjRxpPGs169zjE1Urd3n3m40v1DNIZUkL3
	8u5vt+eDCK220Yl+qGCDAyW7sJRV+sI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-07YJwV2pNDKAOC437bmTdA-1; Fri, 10 Jul 2026 04:31:44 -0400
X-MC-Unique: 07YJwV2pNDKAOC437bmTdA-1
X-Mimecast-MFC-AGG-ID: 07YJwV2pNDKAOC437bmTdA_1783672304
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493ae2a6a72so7645085e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783672303; x=1784277103; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kQemOIUwz1M/CXyOgmbczAyLfNUg0B0dvAv2SyUZZs=;
        b=fvcip7TDOjyOF+FhvhhUCr6OoTn1DRV0vSnCUjid+Gg+Z3NyKdtR/5tMc8ycumGg+J
         U61+kigE+yZayyGc5EZcTsnKuEmlMgbjKhIdpNNQfnlv78e89bmbtuia3yv3KVTHt2NN
         ahK9Y0xQX3Ecw69ikoLxzWmXexnNdfgksmmQaD5MaDbHtnbviCakgUk/Uc7biZTxb9k8
         WaQvlrsf5q8tYx8pcVHlUGw5x8PCEu9wFP0fyzhv1vQxICU/edijIsFTTaAiCrguvyRC
         gMTJ9tOQ5UVVOwHhBfaiFBOa5mKfzqOKnvjHZRLfqckND+QBki8SLS4iaB5malGFNE7T
         SEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672303; x=1784277103;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4kQemOIUwz1M/CXyOgmbczAyLfNUg0B0dvAv2SyUZZs=;
        b=b2wH3isnGtmy77C9MXSaMAulCWqVF1LZlaATQniLncrXzS+LVlaKciJ9YTqHol4Nr2
         zITrXi6CwabvAAMswa68ocTPdD3rk8dOmC4deaWasHWMyG8kxtKDSOH4tLVijAw6lVsl
         A1a78a7VM3ydnZSlC8zqaocMz5CP9fLxMM1rzS2R9Mo8RS0sWytxrY1q5FgVS1rxQQPc
         mqFGOV1vgG7b0s8jr+OQItDs57uN4ypWNWoK84TVIdZ17Z8AZPxmGanBx/2u0jtMM1K8
         wMboU5XRgxVoiDaN7twzho2dgFAvkHQ6lU3gpt5oF7LzBBmQrD1YgPwCmXb8IvTBFvpa
         qP5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoIQqaWIzcxUWI/0gD2H923E050WVi6BNKyKKmq+xw7wp7XMuGXWx4/Ydi9dmk2q+za7SgKuSmaGdMmLU5dy7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6nSfiHCfqaj9rrpL/0AFFtSRBZTy3Ngqs2A9x6VIVq2H55BAZ
	HXEznrW+HZt2TlVp2zPqJ8eEcuAUFGXUxLOrqu0a44eif7IYK9d0pXbUnuU1L3iCMDsXj9OEVeJ
	BEwO/jcTGeOYkD4k4+tzhyAKgjoR2HOYnfkM0X8zzuuPzm29WGwghuc2YrV7mUpms5SaUfA==
X-Gm-Gg: AfdE7cnpmutkyk6TXyZOL5MDbWO3apUFDyOepeXnsHKO6jfoONJDgBOiHQ5AHvMZ2A8
	nIvQvs4KPhEwCVXqOtnA73clYs9j6OOdsIjYtL1asOTSnTcNwWBb7WlSH5kR9fmXMl/+MBhDMJ8
	LVJYOJlmP4DPSXFPycFacF/uPmqGQ9wSMi5ONY4T0dLQ6xXAEnygH8yL/1Fi6fv7OKO+YdZrzn/
	E7yvxX0X0d6H6ThUM3Ygys06MPpAeysVMm01j84KTYryhA45MdhlR0xc+5IdBVqIe9nOfwU+vNU
	EAzl6abE6ljGcnUafcFJ1UW3gxv51mE2JVOe4+h8ki77xLv3hczEbJxVtjFfZvPo4vV/5JSQ9t9
	rXTgDPuJ2gK2PJSAs27jIXLkEl3yhyoIdFPSXTvcMeR+rciqXnb0H8QPbp9SkMroThrQ4Fiebps
	GG96D6
X-Received: by 2002:a05:600c:4e0d:b0:493:c14a:a1ca with SMTP id 5b1f17b1804b1-493f3a5de04mr20017275e9.3.1783672303658;
        Fri, 10 Jul 2026 01:31:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0d:b0:493:c14a:a1ca with SMTP id 5b1f17b1804b1-493f3a5de04mr20016645e9.3.1783672303123;
        Fri, 10 Jul 2026 01:31:43 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm12792241f8f.16.2026.07.10.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:31:42 -0700 (PDT)
Message-ID: <b971748dea21a7a6eec3be8b95f4c18aec2d0552.camel@redhat.com>
Subject: Re: [PATCH v3 16/17] selftests/verification: Rearrange the
 wwnr_printk test
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wen Yang <wen.yang@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>, Thomas Weissschuh	
 <thomas.weissschuh@linutronix.de>, Tomas Glozar <tglozar@redhat.com>, John
 Kacur <jkacur@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Shuah Khan
 <shuah@kernel.org>, 	linux-kselftest@vger.kernel.org
Date: Fri, 10 Jul 2026 10:31:40 +0200
In-Reply-To: <cd0a678b-1eec-42d8-b027-0d27b9c804a3@linux.dev>
References: <20260625121440.116317-1-gmonaco@redhat.com>
	 <20260625121440.116317-17-gmonaco@redhat.com>
	 <cd0a678b-1eec-42d8-b027-0d27b9c804a3@linux.dev>
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

On Fri, 2026-07-10 at 01:08 +0800, Wen Yang wrote:
> > =C2=A0 load() { # returns true if there was a reaction
> > -	local lines_before num
> > +	local lines_before num load_pid ret
> > =C2=A0=C2=A0	num=3D$((($(nproc) + 1) / 2))
> > =C2=A0=C2=A0	lines_before=3D$(dmesg | wc -l)
> > -	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q
> > -	dmesg | tail -n $((lines_before + 1)) | grep -q "rv: monitor wwnr
> > does not allow event"
> > +	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q &
> > +	load_pid=3D$!
> > +	timeout 5 dmesg -w | tail -n +$((lines_before + 1)) | grep -m 1 -q
> > "rv: monitor wwnr does not allow event"
>=20
>=20
> Minor nit: could we add a small delay (e.g., sleep 0.1) before dmesg?

I don't get what the benefit would be.

The intent of that line is to run a continuous dmesg (-w) for up to 5s (tim=
eout)
but stopping if an occurrence is found (grep -m 1 would close the pipe).

Do you see a case in which this wouldn't happen?

>=20
> Reviewed-by: Wen Yang <wen.yang@linux.dev>
>=20
> > +	ret=3D$?
> > +	kill "$load_pid"
> > +	wait "$load_pid"
> > +	return $ret
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 echo 1 > monitors/wwnr/enable
> > =C2=A0 echo printk > monitors/wwnr/reactors
> > =C2=A0=20
> > -load
> > -
> > =C2=A0 echo 0 > monitoring_on
> > =C2=A0 ! load || false
> > =C2=A0 echo 1 > monitoring_on
> > =C2=A0=20
> > -load
> > -
> > =C2=A0 echo 0 > reacting_on
> > =C2=A0 ! load || false
> > =C2=A0 echo 1 > reacting_on
> > =C2=A0=20
> > +load
> > +
> > =C2=A0 echo nop > monitors/wwnr/reactors
> > =C2=A0 echo 0 > monitors/wwnr/enable

