Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6930BBBF
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071118; cv=none; b=HqP3uLpXB44aNRJqM8OBIvvt83QPc+7FyrciJ+RkMOCfTkxRcrsNtoGZlA8eb28D3xUKyEicYmjmYnzvRFxmeGjCq3S4UhaN9/SX6+YObsorolYWE1ql60Q9Kihz0YgazjOm6/m0Bb0MA0LTyOKT+1IEtQw2/7wiWKbk5o2APy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071118; c=relaxed/simple;
	bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pj5hw3Heq7gougKLSHXImupxGOwJCfGENSRSZQSjzTzDKm5AxvaG1USIp4cjrhlLU25o+ytSzfOaPGpYlB4IZp3YqAu5HbOmUdmlnMpFKr22i+roqnD+L+II3GrmmXhJ7gQ2jBb6G894pyBXB/D+iuGQvnnQ/l7HGjFLX0dd444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jf+Z+SKU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNsHiQ8q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jf+Z+SKU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNsHiQ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792071115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
	b=Jf+Z+SKUqTE2tLwGJa+lIU0TOJxBAL4sUbZGOGpkGdTqhzFTRWq+nYiphXcrb/bntczpVj
	AixSIpObwI0mzKv8RruAZclmwv6uUUcIvayXJ7Np/mSRx7Q+7roc+g+hOqejoOfAxSbMAu
	udUfTq4xKlHVzfMniI3R8kxQ0J6L2sI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507--BZnHKf8MHO7iYAvG-jmtQ-1; Thu, 15 Oct 2026 13:31:54 +0000
X-MC-Unique: -BZnHKf8MHO7iYAvG-jmtQ-1
X-Mimecast-MFC-AGG-ID: -BZnHKf8MHO7iYAvG-jmtQ_1792071113
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6acb986a43bso6105990a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792071113; x=1792675913; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
        b=jNsHiQ8qtZ1AQbbAEY+pTUhXZLsnQqJAgrz9CQzNN0vlNBbNs1DXOrnL7QONZwJ3jt
         v+yLEEZ9Wiwr4AI0mYUfcVDGggC4lFVmrMteca3KbFDjE02oy28KU0x2g1/cCq5ZdmCQ
         FhbP1zIJS9q8gcM0qZWL03ssugBux7qmAxV9Lng79v/oE4pl1/ksi/39M/pgNtwx5wmF
         qfYPlyzuwlijxyIIR58hifT30hB0f5Kpw4uj9trlURGXQmaeoufcfOq1BS5G5/Zd3dTu
         so2NekgjcX5kQqwZWH2h11ZXCvwiKbQ99q315EH2ENIW3ikV5t59fICzdihhuua8PwaT
         2EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071113; x=1792675913;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
        b=1izIcXFTQUFPiWPzneCy2nlMR1n0t/G05sNnBcRmOHqDbxyUd6dctJkmmnbh2prRED
         NEinVTJd0cI61lERC6ziYG4jKzJuulCuRplGpp3m5uy1okkHNv2JyxleKY1l1H5+Uwzp
         QL3x7ycDrCrg5rkDmdhsligzBr1wY58mGIE1V/p4EjiJpCOln8/XWbMIEfic+Rzze8yD
         H1bF8W7ohygZPBKLKNuxmFNoYI/UAGUrGU9i5OiT4rPpD1R2s78m1GxolznMYwN7cqXX
         M4Zuw7pSSOqqhmi9J9daIRuBAtzICYQHsV49jB0kc7AoaysLdu1DHYznW2FY/nLdDEN9
         Ddkw==
X-Forwarded-Encrypted: i=1; AKwUvBw613Wa10c7c9fnubGm+Rc6PuXuPD4ueFTMvjXVnpQu5m6vGxC4JE+7vdr1KtvCS1+OPlBRzMika0GbrZAJ1fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsFV+BEpYbrxuuOL/4LFZgLZwsX85nd2DbCJHwpNbINMv6SDCj
	04oBXkHGkSI78r6oq/kPQvVmbVNEeFBliMexbxB9KNzsRAZ15VLam3hflagjGfiB3rx+LTMFgpM
	HjbXyo/kBAd6Sui7OStGvuSiuvu9s0SkeSYcxM6yJVuTtuNpEWyg5z0zyAVlDFX2f1m9eDA==
X-Gm-Gg: AYBFou2N5jRIXU/XHvENdyfFiO/tY5KKpKHpZKKIPRr/Fmmom44FyBh1heTOVqsu5xs
	WPjFgVof1C/qrgHTlexaZsuQizI6waKK79ov8aDgk9E4bo91KltphbKMcp0gUjfpmH2b7J6nFG3
	tzkdqFFXrEstZxLEgFZCBLpVixG2MEjhFEGdWmMD2Goqpbl38aRYNlmBXk6/4UZBl9ZZKBCk8aZ
	aeGMlTu45I3SxGRiLLBtgnRyLvAmqHl6gFFU4U0orYWyUmNZ3ByKrjBZEiIIncm4BTedEZPwWOK
	MooZcbxwlQg910iw3OTu8UfmaPZlZ48Zr4A4ChHM6iRZWHvPS0RGGrwqDF1pRMKjD6QPPy2W8LJ
	h9tzrIEWY4/t7GyW+YneiCrS75Gus
X-Received: by 2002:a05:6402:2381:b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b17c2754e6mr13047927a12.34.1792071113196;
        Thu, 15 Oct 2026 06:31:53 -0700 (PDT)
X-Received: by 2002:a05:6402:2381:b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b17c2754e6mr13047909a12.34.1792071112780;
        Thu, 15 Oct 2026 06:31:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df2619703sm6019856f8f.24.2026.10.15.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:31:52 -0700 (PDT)
Message-ID: <5af5de33f57fec18c8026f20c131830924438dca.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 15 Oct 2026 15:31:49 +0200
In-Reply-To: <3ac898ad-b367-449b-bb0e-841a4fc6c190@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
	 <cfd7123a-e83d-490d-918b-154d45aad92d@siemens.com>
	 <aa16855bc9ccc6b776ba4f513b86e3eadf889f74.camel@redhat.com>
	 <3ac898ad-b367-449b-bb0e-841a4fc6c190@siemens.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-10-14 at 21:27 +0200, Tobias Schaffner wrote:
> Nothing generates NMIs. But from the linux kernel's point of view any
> activity of the companion core is NMI-like, since disabling interrupts
> from the linux kernel does not stop it from running.
>=20
> Our co-kernel keeps control of the real interrupt mask, so Linux cannot
> delay it. Most of the time what Linux disables and enables is a virtual
> mask instead of the real one.
>=20
> Tracing already works inside EVL, thanks to a downstream patch [1]. It
> is mainly fixing all the points that rely on interrupt masking by
> calling the correct wrappers.
>=20
> I would expect that we have to do similar for BPF. Some of the checks
> already exist to cope with NMIs and we would just have to make it
> recognize our stage too.
>=20
> [1]=20
> https://gitlab.com/Xenomai/linux-dovetail/-/commit/2fc39d2bb5d9ca1c0e8987=
94fc0297eb04cf67d9
>=20

Nice, thanks for sharing. Yeah you probably need to do similar things here =
and
there for BPF too, but perhaps some things (e.g. tracepoints) would be reus=
ed.

> You are clearly much more into the topic than I am. I will have to take
> a closer look to better understand the BPF data structures and,
> especially, their locking mechanisms before I can answer this.
>=20
> My use case is, so far, not that strict. It is more that the bigger the
> tool gets, the harder it becomes to argue that it does not change the
> behavior of the system under test. If the tool remains simple in the end
> and I can describe its behavior as deterministic, there will be no issue.

...

> It sounds to me that you think about moving the complete RV system to
> BPF. Is this correct? In the end I will try to follow if you decide to
> go down the BPF route. Possibly after some delay but nevertheless.

Frankly, I wanted to keep both representations and I'm designing the BPF se=
ries
to share code and keep both in-kernel and BPF maintainable.

But this was mainly under the assumption that some use-cases would still re=
quire
in-kernel and/or BPF wouldn't be able to do everything we need with the sam=
e
quality/speed/determinism.

Now, I'm still assessing it but it seems BPF is good enough, at least for t=
he
use-cases I tested, this assessment is going to take time as well.

For the time being in-kernel is surely going to stay and I'd really value
external opinion bringing other points on why it should not go away. I know=
 the
industrial/automotive use-cases are the strictest and if BPF doesn't fit th=
ere,
I wouldn't drop in-kernel support.

So now it's the time to line out and validate all requirements.

> Should I wait with proposing a v3 of this patch set until you made a
> final decision or do you want to merge this in the current RV system no
> matter how this develops?

The good thing about your series is that you're using very few dependencies=
,
just like DA monitors. This makes it straightforward to use your header dir=
ectly
in BPF with minimal modifications.
I'd say, continue your work towards a v3 and in the meanwhile I'll try and =
see
how to align your changes to be easily usable in BPF.

Realistically, DA monitor support won't reach upstream before the end of th=
e
year and after that I'd need to do the same work for LTL and HA. That's goi=
ng to
be more complex.
Only then, if everything is really smooth, we're going to think if it makes
sense to migrate existing monitors and deprecate in-kernel ones.

In my opinion, your contribution stays relevant either way.

Thanks,
Gabriele

