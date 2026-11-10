Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318656;
	b=qRDxFKqFvmoYeHeie0CpfVi7C8bup75bCdwHH8HqbqMKGefB27kp9dFubxqY/eSlJKN7
	 ZBC4mQJvnlyoRaMx493PYDUgTEPfPAX7EQ885Iv+XLuRC4cSZTRGLA4z9p5Ndei1GmFFP
	 ZHHtDvpmJ/sfJkAd5ipFcnnbtPPidaJb1ATpbQWrwbqqZPkx38LdUws1Ot3o/OhtbWDZt
	 qnSMU/M7KmrLx1stmDNtiW0EI1q2aptdX48TckooZqgmLNHiVakgDtyP9rMycjPy5iPOg
	 p9H+JKFk104alztJ3cVz0bLEyaBAMDUGAYtepjdkCdUBngb7HjFUWLdWb+z7rEfub3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
	b=Lue2M0KdmA83md7BbQt+aQo+OrCgPInDu+Jl4gjgiZzwvPQI0PABQYBM1DDfyWrhwU46
	 Qum91lXQ1x11ypRp04JsVybl7QDC9W3aghRo1TXpm0HzKviTCVxlMYzVCOXmDQvFNf4He
	 eY4hoQoLUbrEriLpV5BqgJvHyYRUalVZtu+B1XrGiw7NFbBsNaM4Cotxz3iYrfRB7/BL0
	 0LYFz/s6Ru+N6XSAtNnQ4hDlEa3eXhCNkQznnnQz2cuHqnCJMywVtr47l2IbOjVy7k4Ef
	 ID3V10mu5mnTy3CAelYi4YAOvRT0xwQJVeXuKy+tGocHUWrMsMBM7ay/egGDpFl+S1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2FC606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b309147589so21759977b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318655; x=1794923455; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=rgZQ2PXPVrNCfsW0OegwCsJKX6gwPzauztRbfGffPyiPzuH9sgNOFZHbjQ2TPU7xHd
         HXnhXa/CInh3orIlh1j5T3FgG2yaY7i98dX3Z7aMte6sQntvLmkfWSYp2NqcP0OyOr6R
         TU9q1AQwcelJn8HWOdT4V7fFrlBU6HOe+3Wxd2xifEaQvyl9uPYjW/6QJ104kynOpVAC
         MuaW1ze5Xm7AU8GcgMXlK03ajGzPmnmXwZFSm0LBLQ856DiezSuINQxgnr8z8jbwnzHo
         t36Yv0MGurTmPRlXEZZ1A1ASMmOLgWgTxPCgLHQi8kg2IO5j2qJUw7XFZhm7N4s8aVtb
         kYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318655; x=1794923455;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=iRH1f4Ta/emJ8e/5pQ6ijrgngq5tgvg8/ndt0SzKD7fR/cxb7wOxS1cQl57SXnag0p
         u7cy6MnsYWOcYi0vofu1+ogmytS9HGlvbSBolYrPfm8VyUUEXWtVz0RpKzGuZIr1n9Tk
         IMWHQUo6J87EMrnSoW2S7zFOUYEkUgeVP8V+iySsibeuG+YkI7zP9A0iBiwS4AbUsW68
         TzhT69MK8JtmLm0yoEqLxt2NLNAwyYpr46t7DRjeenVXQluRY0OdtdaFyT/FsWaRx5KI
         b5RTItBXkaxmfswl3iNY87Y0Uxm8NYRnbUUmE52kFh2r3HEgjTxsL03T0x8QCLEaVAPA
         iQAw==
X-Forwarded-Encrypted: i=1; AL+hErE8OOCaX0ieY3IJLj2B6YSyoZ2eq+imNQerHDSp5CCaaWb5qUAsaKk6ir4uAeovDV0yR8BTM1glxPEzOPnP+R8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kr9z/pySKS/xj28/WwccaQj+HL+WERP6uioHhL1GifuNkCRyM
	MuLLKkYLpdozpmTFOUHPcKqIUCqqGt79/lGfJkQZfRdPFB4iK/S0dM0=
X-Gm-Gg: AYBFou2P5EqIeuxS3KhuKErNaPGWnhIki3XsztiY6Wfw8wpwG2pEEDPPJjmy1CJMcdT
	GRBYMvAxSfxg5U57d9mq1bc2C6b1TRtLfZrL6p9qcV4ae/0LoW+BAr/kPNtcxGFav6PoOLfx/gE
	PqX696ApC4GlxM0CKTvxPFX4L+6JrzvVXg2AAfdB37/FsOY3IAAd8wPTdJScb/5wzoikUIP86+A
	9W7hbzZ+0BR6TW5sYuWHHC/uVURxnfDbbMoL9R4AFwI2+dVSd09ek28sWuZrUNFjHnayb8c3gdj
	fwDWvVdPevJyTQsPy7r7g8xGeGhDVQuDClZKC2gXxzUMRisCUvRVm4x5KfURZ7sSopOlexsq3HU
	M1i1hhztJT4wn7dNiVlvrQsFj7qq3AKq8MYAMt4S/7uDD3ZLpHYlIKl1vjM0FtD6YbUss4VspOH
	zAPdjscchd4+yZZAjWX9hC2ep408CWKINGfsSXb1JHUPNxTnsMx7b1cS/NRyxnQjDwVZh6YwkgH
	b5VwnMGz9RVqJMkwoQHhbPDQPwldj+UBnZB11OgL7QcWUAznwGtdNd73URjc0cVqsuYwyAmFD5X
	7JqsI8HREyqMnBk630q2NHQn3wHM5ZBJKnLQqmQbrvpVrT8fI2BNYMHI2lXNMPtO
X-Received: by 2002:a05:690e:1306:b0:67c:332f:3fd8 with SMTP id 956f58d0204a3-67c565f716cmr1597436d50.5.1794318655428;
        Tue, 10 Nov 2026 05:50:55 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bf84sm19649867b3.3.2026.11.10.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:50:54 -0800 (PST)
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
Date: Tue, 10 Nov 2026 10:50:49 -0300
Message-Id: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
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
In-Reply-To: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>

On Sun Nov 8, 2026 at 4:59 PM -03, Miguel Ojeda wrote:
> On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> -    #[test]
>>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
>> +    #[test]
>
> Is this one done to match the other? If so, please mention it in the
> commit message, and consider whether the last test in the file should
> also be changed then.

Yes! it was to match the other one. Since there are more tests the other
way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
have also the #[test] attributes on top where a #[cfg(..)] is present).

>
> (We could do it in a separate, previous commit, but that is nit :)
>
>>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
>> -
>>          b.set_bit(2048);
>
> Spurious change?

It was on purpose, I thought it looked tidier separating it (but it is
just personal taste :P, gonna revert this in the v3)

>
>> +    #[should_panic]
>
> It is great to have this, thanks! :)
>
> Cheers,
> Miguel

