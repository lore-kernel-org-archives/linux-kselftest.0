Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320378;
	b=rYwcb1yz3MSjAfrrsX6tpxjAPqpnhY9bNiJX+GZ4yAcxBKIRv2FAMLd1K8AY+qBK/MnK
	 OfL5IYysVtAoWacgOWTDCrjaaCW/yiBqAxPZf+dr3JRmi8/legy/ItHAy3czif1FWGPZC
	 thW6dfv6DGi2mPdZgwpEtpJ+XSb4v6jCiDFBJ8mlZq+C1Cvu7EtWqg7iBxUzD504Gl/Ow
	 0BPBnOcCJugmhN9VOAW2EvC2gnJvY42yVzMGgkwRnXFKShLzPutYUT4Yvl6P4FrHctGPU
	 VRY+fQJwQWEsn3cSouRf+u8J9aA9BXie3N3WR0imNRIKPe6TUMkp+xJccw4BUagHWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
	b=X35v+FSjYJNFPxQwAbS6utU4feTh1fKZss2nE3XI76TwIC24CUS3qkHMIW7iwkCfaD/q
	 3p5ltX8DZ2sUGypE0do5rD1zUbliUdUwUBo/NHxv809cgdJirzS2U93qcQXy5DHtRsBOq
	 8KF8tULJCmYU7SgcdkIDsHtkVctFfZUJAyJakGrbrHjPrAUyBHbOvyIKDjHhh6TLvsG58
	 sabZod7n2BJcS76al8xgF42hnd5q3tQNITR8DEOS6M3a7b5B5IeDE5ZQTCkjA+396EZiV
	 DY67CJMkrqfJWxNDZyUQJYPoz8XwgLAcRDaR1jRJWOGU7ZInO4FmSbILBIE1ezfupbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D560A262A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328D560A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so4266159eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320377; x=1794925177; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=Cb5rpQ0SFbtE7iVU5JJrjmydsGk7fQZauZJUDx/CyNH+pJsYAimE8OZSEEKzT7mbFa
         BkBlXzp357MuT8HOEY+f1MmwQIAMGvzs9ADhkjTP+7AQzStaPUoa/Si/omQkovNWnZe1
         EO43/NjZJAmwyAoorZgIHLGI0GmzemVCRzQtOoo8SVBfpMnUAfE9FjDCmn/fkZFuVICR
         RjdprPYrAcq19eVR1I/8Y5vFRg5YhDuQV9i2faQy0HeOS6mxyF/zJDrQxIDyYN8yppb9
         iozLnV9ajlgDuO6ydVuz2CHNbB1DYVrBFgP1leLeULzZ8Hog2IMLowDrG32rkYtOwC6P
         R1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320377; x=1794925177;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=cpCMfY3zV4/Y6LA5Vc17uToCvnlvCe4tZ+cbZQ05psxaCkJkbrKWgspREWGMH1uN8d
         Yh2JZvl4U1TIQ4Z1sGtAwS5Bx912AMe95gPs9ASYKknWNe0D8sCfApGEDzFRclKZgD4l
         NKxwJNr6bV8RDSfBv1mMvoKSTHzyebfhDodCqp75pOWmTlfK1pY6CdHCEDdXNvgmatHH
         tf2/ICSSiDSsQVEtaiUZ6hE75CAc3uJ7eKEiE14ZwC0kliIH1fIe5ASF40nwZyKXSbFx
         eWTmpG+e+7ZC3KiMm8o4y0219+7oHJOgYc5tquA+ow4T6crKr468SaldiY/1JTEmaRjD
         mFXw==
X-Forwarded-Encrypted: i=1; AL+hErFOW+iqLg7wNYnZ+MvGr8PPepRHZybGYwzaJV4ze3QHLblAbFiWxerV77HihERyuLEUm3JyOEX4EDrab5yjmgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wR4RnRSYVZrZUS+ywCvGd7exKh3aIORSuUqiUP/7JyfD4WyyR
	ZSrFf6CYNBMZNkg/MjH8ocAoFK1BZ0gCDoJmq/U4452kPtUwPFNXOfM=
X-Gm-Gg: AYBFou03IrADC0qX0BDeAS0s9RmSFQ2LWqhsldyYnhSYrJwKg/q5QqZbNd64qjrPZt0
	TMDzYfb9AbWwAVSwSgGhpTuRSoGwgNyaNIADVA01AGK4PafwqA/QWhbCBzdlARmpUb4OpngHoxt
	b7GlUhXuFmiCHcuHgjo7B57LSF0Lq2NHAPtMJs0Vgyt54YORs4LljJp42QNr0z2IW1Z94D6n1da
	s2bxXuI5Jao0MzJEPgmvXSTH2yeWAsQPEp1SaVaiDn9MOTOqZZK+PVDDQ3VEEhLzmcs0XKwbaoC
	R4+8ZuJJVPKZT4d252GK0yBuIzKJmd6m2nTPmcIAkn9XdlDeNwk17ROmVNTuTaZiNXjaKhpRipK
	YAn+B32c6GHLEoLjbr1LTovuSZeeDQ7SwdwphSUflMXaG3UtkZqH4FPV2ZGRD9ztKYn5rmHYZOr
	5GR338PWfNUFfxNOSviQM1fp4JnDZAZ2Dg161yEGd60k2v0MzjwgpT5/mm5H+5ONI7y1g2EtLZN
	siKtP6zvX1xcv6smtvYbgjmto4HN1OYLudDjZxBlZAJeAB7VBvLzws6clvtRUTcI4Nfv2TPC0Uy
	d7BcMIx5FouWYm+xzFfHMP+6XHOtKWnTNDXBl3tMHkilw0zW/esX9TWBXh6Q/1rNAJ94DPQoZ1q
	HFM/tiff18g==
X-Received: by 2002:a05:7300:cf91:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-375212ea575mr3560699eec.33.1794320377066;
        Tue, 10 Nov 2026 06:19:37 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm7225373eec.28.2026.11.10.06.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:19:36 -0800 (PST)
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
Date: Tue, 10 Nov 2026 11:19:32 -0300
Message-Id: <DMRLHJFMIIJF.1B1Z21J2B2J7R@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
 <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
 <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
In-Reply-To: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>

On Tue Nov 10, 2026 at 11:01 AM -03, Miguel Ojeda wrote:
> On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> Yes! it was to match the other one. Since there are more tests the other
>> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
>> have also the #[test] attributes on top where a #[cfg(..)] is present).
>
> Yeah, then let's use the existing convention -- that other change can
> be done in a separate patch if someone wants to do it.
>
>> It was on purpose, I thought it looked tidier separating it (but it is
>> just personal taste :P, gonna revert this in the v3)
>
> So we generally try to avoid those unrelated changes, though sometimes
> it is just easier to do in the same patch.
>
> However, I was asking because that removed the line (and you say here
> "separating") while later you instead keep it in
> `owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
> change.

I read the change wrong, it was indeed an spurous change, sorry for the
confusion!

>
> Either way, yeah, it is best to not include unrelated changes to avoid
> confusion.
>
> Thanks!
>
> Cheers,
> Miguel

