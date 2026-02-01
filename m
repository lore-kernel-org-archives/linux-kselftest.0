Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9B2D8DC3
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769941588; cv=pass; b=bdW5OFUr15JoR8mwd7NURkzmEnh7QDFZvbsy0fND3I+usEGN1JASe8m411veH2WHkYpXA4ER+LNZ98Wse0kvay9npbkW6hXosXrESrcHyM9xxEukY9S3ynAPUfINtTwTMtJz24fP6b6Cd5kSxwQmGbrq9h6+jHR2Dwvnf7ofm3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769941588; c=relaxed/simple;
	bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPxjWMpZJB4LsTeJ9eJh6evd4vWRflhcMIzqe8xRlHxOAatTfnZktC1haXFAXFOGb4/INsJdlsI/wMnGSserNEkJAy6+ylZC0AywlVAUILzj+N0IDVlYrreInmO7AsSCLu76Qa7hg0hFRB79kktnEGbLZ+BpEIHuf5/w4GIR2P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tjWXVEIk; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tjWXVEIk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-503347e8715so42315621cf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 02:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769941586; cv=none;
        d=google.com; s=arc-20240605;
        b=jzwhkdoLZnM1fcYqgWYqXCURvqfi1DdgKxv0fA+ZXYP7BVWuoLTfgWzjpr16XYn9yG
         SKHCmN9TtaJXsFX7Ggm743skdfDSyc2uzqyrqz/K7nB5iEKolps9onoyik5UQdIv/wQA
         mVamnlCl4QEv1wO9n6NDZtZrrDw1LV1bUJpWbEUWHZzZilWctc16S/0pxatkJqvv1rgh
         AZXIIn6o+pkTyk9LNtR2xT23yFbTE+aBLpeZRzHaqsKpXf4q4FDAZQqxtuYXEN3S1k4Y
         THwXKBz4l5a/MZVNobUF9PqxZ3JqBEBEhi9Un2YPsQv1QCh39bUMEsBrOtJL78t6HxCT
         BVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        fh=5uVAMNKZgaIHSUfuSnIT6B9FvTeCF8L7eBmx4V/9Ah8=;
        b=jTFQQ1AR8AwnAm+kGI9Yai9hxBlDRtC/FlWt6S1KJ0rSbARhQzzEp3MqfEg2FQbVVy
         J2ed4qDdtkMDyu4OAMPzb5ZLzVGa0p1MwlPEbF1Bob9w1k8wGOQ1NqD793HyXerrZxKf
         qQOauhutFEV6b7nJwf/QYOyql7gBflTZGfBuY8DrrSqSjU/BKpk/cswo8519DFLXEeIk
         ue0mexSihR9TwhV5qGAK3gN6v9zBYY6XmpNGZHPRL4qEimofGu5G1Y9PZxeNRGEs68RO
         ywKoHPMJ+4cPDkhvmzQiOVVBh2v+NSLuJMDApWrQJBZbcN9JwXkreyb2KUx8p1tqRH33
         AnTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769941586; x=1770546386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        b=tjWXVEIkwuWlA/YmIFxQycJ590x8iPoVszHh0oOmLhIj3YUMioygV1KM3fv92WjZ0F
         SHY5wx3LeG4cozL2PK8A3mbNvXvCenltELpXLUGtNCU+BuBeWX16hGri2tPTrLZ8KhA7
         NY+/rato5A/jMf5EUPWojk+ie8GJKNXyqrNyarsXyGaq2NqyMZOqHH04v9EnZ0d5O50B
         aBN+h5xgvWuY8k0S6atOqamEFKP/lARddKxU0NexaiEf8rzDo8icLpaWWeJvkRgM1ya1
         oitFZWauwURHO+nFbvtOrYPd6O6Bm2LyGhcwmgYMKRtTMt0fjP24A+hYD8DxfWyiDfSn
         bv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769941586; x=1770546386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        b=V21nbBFRk1LsUJ2hvEwOR+pQkKjSOVWHxziGmlJGQTK9Ji+Pb1Rg34NNrtRTSgy25b
         Qv9HYow1bLvs0j+bM7yxskG6BJXmwmqDWvXhcsKrrIuZMhjFsjiNjq8zWQ3HiG44ZrjC
         c1LaTAmNwzVo/zkHVD9uD+7l6V7sAXDdwQViZcyKH41qrAoQzsjg+JjGgckn0u52TOAj
         6SgnrySzrRtdhMORsyTeikNg9Jr7llX0MElDL5r6CAn4KjSy+ianQSw2DpD9mDP9SNah
         ZRCHRHRM4fVFlEDSK0bNjjXFx7PZdsoG4tWgzRY0mcwstUJ4HXyOjaRM2jLpRsKg48xe
         +OSA==
X-Forwarded-Encrypted: i=1; AJvYcCVYvr3mfuGQIm7KD8hIPrXPMYP+zI74XqVHQYDdssy1C2IYPE4vfP8mt4foH2DnMNDlQ3AkAy+xqENiSWeb1k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztjqsoQAlZwX42gLt/S6VV8E0wm2Q7OyOQpD4tIAteSknOCPIt
	5qT/EU9kTLQxAuAJnhQEI6/7nny1gt3jKxF38GFIzHJ+PKH4RmQZSdg5KGQSja8+ketaNVSMzRn
	MROwKQ5SLQZfPaiHXItXsGFSl+ABUeTPiW/DFzgc2
X-Gm-Gg: AZuq6aJ4ELVzmAtaS/Cj0+4WYUy10gY4wBD8ITHqsEWxi81gwHHtc0JYoOEwu6hoB/V
	kYDF6CrKSWNM8RTrPB+YdiooM5aNVOohIEtrLa+cloTw34VK2LTQ+xOkzSNtogPgLLrhoPTMa9Z
	zcCPSQ4iGZ8XvZxY3Q7fxEkIiYcNHd6V0gV0kD3lmwxv1SMWrc5E6MFSkMoKx2iQhRo+2SdukUr
	x1HsX5uJXNTo7GvKBCIGNNrB5WXps0BpBj8fBgcOmOUUzKfEmM9Gn8K18jEtrCc8ty/UGc=
X-Received: by 2002:a05:622a:1aa9:b0:501:3c88:131 with SMTP id
 d75a77b69052e-505d219e7aemr108573901cf.22.1769941585616; Sun, 01 Feb 2026
 02:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com> <20260131222515.8485-16-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260131222515.8485-16-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 11:26:14 +0100
X-Gm-Features: AZwV_Qi7N4AZtgtvbxnXQyIYVraEeuRtL1qe-JczyTuupqULFqmqcdCuYubvvbo
Message-ID: <CANn89i+F8Hmx3-DoOBcW_tJnsyqeeKHZm+_jC1nk5hrnBWN2Jg@mail.gmail.com>
Subject: Re: [PATCH v13 net-next 15/15] selftests/net: packetdrill: add TCP
 Accurate ECN cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:26=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Linux Accurate ECN test sets using ACE counters and AccECN options to
> cover several scenarios: Connection teardown, different ACK conditions,
> counter wrapping, SACK space grabbing, fallback schemes, negotiation
> retransmission/reorder/loss, AccECN option drop/loss, different
> handshake reflectors, data with marking, and different sysctl values.
>
> The packetdrill used is commit cbe405666c9c8698ac1e72f5e8ffc551216dfa56
> of repo: https://github.com/minuscat/packetdrill/tree/upstream_accecn.
> And corresponding patches are sent to google/packetdrill email list.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
