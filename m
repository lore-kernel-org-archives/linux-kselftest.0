Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706187;
	b=JS62SY5mmc+D5TL8imsmVNiQ8v72VzNKkYIQRlY3iNW5Z0BC0CtqUvE8IZmbZ7yAj5E/
	 HoDbf1mbRuzyauseQErPWZtZ4lsRevQIK5WQn2zuWSXWvi/nlPWdVgwrNOURBntv8XlHA
	 1xB0rPO5uj8asRq2dGTL8YHnGw8Rz8i7/x3gijXet7wjtZPkeGSLvfCC/B1MGdFPXWc6H
	 t8dKsV3IVtTBD/yL0qndyAnItm2j2gCuax/OqJBG+HkZ/iHr8/QX2UOg4duu+6Xic1DWD
	 mni8cgO/AHgq9Fe393kCtMtFB1ib5a0IuqBxDe8ehUw4mEASn0qfThHapJbe/d2Gyyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
	b=T+Wm4klvFIN8uOGlIDZGDporbr7udskkhedLdfHZZrNMqwHtf7Z8b7ggBnKV3e/ZOzJz
	 x0oWo3EhPXGG6EAiAVTjUQyPBKAhvZduo93jMh+GNCD12yiHnVLRF7fpG7GqZUKYE1Gw4
	 n2JaKQ/ujHkAF2IqqTwvEy3hQxktHEV0HYjlEEnpD3RSYRsYIrWyd4DciYvBmE/mURazn
	 QEseS5giJqVzaBGe9ZSTDGjSXeUsUf+oSZWAf6Z6PbAwU5OpKibptdZMuU+jKUBP+aEQ4
	 itLl5PjT4oJaLnau7g8j0J7hclbJvgxaky18VcaXx82dkAiE3DPG7rml+R9N/LGx8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDCD606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-980c4258105so4018976241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706186; x=1796310986; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=0bF0rIllZMds9r3Rg/X9Bi+iVHdHNqm+S1vsVtFnT5IDmowjopX6s5Jm6OZvmfydcf
         w5lvVkXo+toCwdm7KFyah1q0wvuXDdthl4mtV1SMGemFDmdUaV9OtHEJzjgNc31QkRUQ
         QP2gJ5cVLG7u5Nv8uQCm8VC/oH67MbE9JLud1EqvFxMpaMMjQ7Q8lA5/TkHO5H85HMem
         3q2/EbLhzaNpqlvkN9/vPueWbZyrRHUPorRN9t/t5ttzUwBv44QccQe1Tm1w4LMh/dh1
         7dTGRzrwRiAAyCCCvPvRbgc+3gzRd+mc53T0xG7X1PAECRZEYWDSMxWBOeh2Mgr2Oe/b
         PZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706186; x=1796310986;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=IfhQF0r/Q40S7OCRbCbR7VG4dcf0cYhfDq9iLoHl1Dx7NQMQq64vQUCjd6ZiGt7xNf
         i725t29UChii6uLQXkh27IfYK7Tw/C8xG5g6d0JKzVojnRmB8KkxYl2FxVMJoXtTKKhM
         38XLxbmppW5UuTnSO6XOWfKnxLu+6mcU7mt3fw4J3CYkaWViXh8zm8qtMopbB02HQZXZ
         /3imPd8jJaNMdOHYTb1Oh4ArxeIvmLaUslvgzdK0YTFtOc5aIuaUpJk1PZ2FgxGnZYUY
         9iWmnZTKRqsviA2X5iPuaiZPYWM3LzJCWVULBldriBjO312e80tc51PQrejXtU5eX42x
         cmMA==
X-Forwarded-Encrypted: i=1; AL+hErEBxaqFzmBkaUf4vtr09Rg3EnSoyq9h1/VVW6T+Hwk86jbU8K0WzoXXM5vJpwPeU4BLTCmM8jyI2oe1jrGgC3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EnZLxGp5UGGX9kOAyJdTTtmEB3u7fhSYZDz8f+gfZSL2ij4yk
	SfZzPbSzAb5XneCFi+j1NNr3d5OX5DIvpMMJOoIx6SXYSOc+r0YgxJM=
X-Gm-Gg: AZFdTZdLjyV4Pfxx6jnkY39J6h3wNzRCs3fwVJM0CF4lWfoYO7TrkGYLH+PGCLBH8Xy
	s4Ka2SxV4kDIOcDDAhEOPlvARXRp72KGCo8mfDZzvK3twOMouODsNPxmxpqdT2Pd/Iiz3ZCqowt
	T4IVJBWuBadBm4ESiSDdaG+20M+RjcwDBZ5khSlj+ecOB97vGoXu+x/ZqNbhqoAQcFBGgzXNBAA
	vqFKzrVmnXTVGfZuEqZPq/CWfPISRt8dCbdJzeOOJOA5md6OFxn74uECCSSyL4h7QxNq4Y6rCJ3
	kqtYday22L3/LcafvT0xU1wHMrAo4LqQA0I5Ljquz14iJ8goN/jIDiNTxio1LUlZoRRHwxErvFl
	Rwsx9hF57+KbGPNFMzLtGbrHaKlHwiSqLyoTkD7BcHmvdHbMT7VRtqBwYxCsLKBwW7E3EqA79kV
	KiLDCheEa/cTXZjPAaKcxGHgS//gjH2v2U7h+5L680eIc11MvghfQYUxYwzM5/GGKuUb8fMFtqF
	kOO586DTozAjhBNHPqSHnN37ZDmqLhKxXze3QP/YNSNBxx6bMbuiEqY0J6dB39CQbvgjMIneX1v
	OrPJUmFQlwdfyx6l4NKJ0Vv8rpd9JToM+O92uat/9RWs+BZow8njd+Vu+YYcbM83lA==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr12322188e0c.10.1795706186471;
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm19662910e0c.13.2026.11.26.07.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
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
Date: Thu, 26 Nov 2026 12:16:18 -0300
Message-Id: <DN58PQ0UNTCV.2C8E5QAXJ53I7@gmail.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Rae Moar" <raemoar63@gmail.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <kunit-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
 <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>
 <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>
In-Reply-To: <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>

On Mon Nov 23, 2026 at 10:36 AM -03, David Gow wrote:
> Le 14/11/2026 =C3=A0 02:20, 'Nicol=C3=A1s Antinori via B4 Relay' via KUni=
t=20
> Development a =C3=A9crit=C2=A0:
>> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>>=20
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>
> Okay -- this looks good to go to me. Thanks very much for all of your=20
> effort!

Thank you for the reviews and explanations! I'll be sending the
implementation for `#[should_panic =3D "message"]` once this lands.

There's a sashiko observation [1] but I dismissed it because before this
patch `KUNIT_ASSERT_NOT_ERR_OR_NULL` already aborted before setting
`priv` and executing `kunit_init_test` and `kunit_resource_test_exit`
performed the frees without any check. I assume that this is acceptable
in this context, but let me know otherwise!=20

> I'm not 100% happy with how pushing the attributes into struct kunit has=
=20
> balooned into all of the different kunit_init_test() call, but I think=20
> all of the other options are either worse, or involve even more invasive=
=20
> refactoring. (That being said, I do think this might be the thing which=
=20
> finally makes me look into refactoring how we handle the struct kunit /=
=20
> struct kunit_case dichotomy better... :-))

Yes, this was tricky! The alternative I thought was setting attrs
directly when declaring `struct kunit ...` (right before the two calls
of `kunit_init_test` in `test.c`) but I was not sure if it was the right
place (we would have avoided passing the attrs in all the calls if I am
not mistaken though).

Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261113-rust_kunit_v6_send-v3-0-0d7832c=
07166@gmail.com?part=3D1
