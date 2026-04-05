Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237B22D5C91
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417525; cv=pass; b=O2oZRFOl/A1pMUo+xTlQhckCt/WgxRUM/J3fm+lBvkGCYazG/Kmqkox5Yp1KZxbJZdfEPwjnJtvZk2LMzV5FxebjoU7Aae5pQ7SAevuKvNdTIqlelr3WMkbTP3BcXoCIst1UDhabcgcWMEF4A7Co09Mf62ZbyPefVjfX7836Sps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417525; c=relaxed/simple;
	bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bT64Mz24nNjWTuwJNJ4x3Tg9DOsImOYaKq2yNGJa5RERPF10Ns4badDStptYPsYnZFG4cZh1bU5oZ1Z8kuycBkmeqCj/fk9gNTkfnOg6X5Axn1L8SQy/l10IWYObWK1r6FCuen2Sh754cwWnHNtP4CWvS3LHKA8+sCd2TYFsVCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTQnoJHW; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTQnoJHW"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127148c2112so185053c88.3
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=B2rwjhZ+d7vGNOXMGWsaFZ/SLaZiMHmtEjnr52OgTdgo811OBEVaMhYhY2TJ8UHWoU
         TpGYF5dT1liQL4dbEoUp9JXY7oslN9P9OrtJrp7/ziUH7DSbQ9/y9A37n/1goslpjfit
         TEdHSyMT7PWF83Oen90i3lFQrlBO3leXPz/gfm09/agMnJkgrz8vJdylHTTaVSDAs+SB
         ctzdB1vQv5hRt7cth3Ea5i/dCHatqLvv24mxDFhoGqjfFkEe8n1g8Mipcigj/2sMaH6s
         754kTA2Aft0Yno58md5o8s5zgVPp0dAy/2AEGkgw/6XbkCG4qPzVegGpPmWCMWMAZxDU
         RJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=35K0L6W9Ij1W+zmWkxicYhBIQh5IzKl3rKeqxy/Z2TE=;
        b=XTr3rjIk63oFkzJVGVA85Qvu0P4rrDRVUf3teV5SE4m2C4aTXw4ztrXCeVR3ilARW2
         H18if+n2xwEHGLvABsYiLioMlnMk0NdljCOK0DzIeO2kT6iKli5pBqc/beyuXUAF5HN/
         MVgV8q1ajs2JDFgru+qxvCtEjyo2S0hsKprza9+ND7TzCvnCCQndJeS5h3nAunjxc5YL
         9+2EolUjvPgeQ+2v4kf7oeACq13QFbkdsmNr644g0zIT4VioVp5nfg2Ipai1Ov2sabtL
         IYbjxdWhfkR+CRhnaTV7AaFKTF1XblViErQ/TJmqJSlyuMr2Ax+DZ5KGdXncFZT76gUf
         PPFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=sTQnoJHW55XIOLQxTa/0ehf0g7O/5fqfreTXKUXc2JHcCniV1llpf87rmHdA4lOpTC
         MwB2O2JOTBUGOcMHQdnTwRc+9zDCTBVqj6jol9Gj88fkUJzP7xdqlqvAczMbkihun9pk
         tOyyu5TtBT6dGhanj3/xCmW4QDFclZUZHVQpnHDkn851pqs9Svq58p4q40XfzrXhsMp2
         dGofuYw2zhZuLPavKH4QgFYvPnQ3LgvcdtlzMuFvWkOfnu+AHqQVFjusoSm/+1uMnJ2h
         DZMwoGLm2iYuPXj5zMAZwDu7uZcKqLlyCVgtI22iva9fGR0cKL14VDNzzyKNZUscIkM+
         PmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=V84aZutJQdutDjAshrYESXgIi2075meTzF36vs/b7tjsCIRDTpdnFMEQhBJQqtnB6F
         9Gg4B6Afcy5gdKAC7BCH1SwM17QgpWsFD8c70LSLOS/U1PBRB+GH+kH+GuimiBPn/OtN
         D7rJGzpgAkICu6NNvLze5mdnUMRzQZlLuIctAHM3WVrIgDkCAMGFghecE7nX5Ey6RPo2
         CYDwDl3UBMBrq2RGtCtG+gg++STWnb/GIpExbQSUsJ+SZSKw0/Zkp1eJ7FnbKb9CNmZU
         8WxWne3eGj0Am5Chpc+WsYQGBsOk2Q3iWZAlh9nn0A8rarvmkbi5xMsw0YsgRk42muZX
         mJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYjnGJDlhK/Yh9EDdFS1HuySMXg8Oq6LBxgLC4u5cjSK3bwg3CK49H2yQN4O09keJxJH4tLQy8yzQfzzFfMgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqNmsAM4cUxHvQAK6Zx7GEP5iZupDeTP2/jrpmn21XCDwp4sSC
	1IWoH55twT5v8GFDaqAlwvV29Khw70AmFDZZ+FGl4Cf2MFTXpYzhj3GcQdne0IINq3jiPzusiDb
	kL0JtjD0UObbgWZW970Beo5vp9h+ooIQ=
X-Gm-Gg: AeBDiesmpdaS2s5pGARgn6IFohSlXzLKahXEYfN9JdpoYQzfQvGKYI3Zy3zL9hxyr2b
	RByQJmzJD+VAk/a0K0wS/4qed0DdHb1wDm3Nv7QBWH8B7TZKMaFMYoDxozCvY73WlU3kycyj2/n
	zbrvqK+MB0/phbLjevGn2nIEmCgjq5sHznxES/mN2DMzuNvX1mux76gALb92+YOaX9B7GlpXIMD
	nKEFBtWKPu+54NaZuXR+tzTJksOJS3ZajcOPbYQnMaeQ12YyQ9cXGg5SOlZ6IWIBQLOzRH1nuHy
	DzH46zpPctbWl3yvtU5e+O8qT4on8kVZbb23HOP90eEunwXTLqiQBqhIKtsB1mgNmLrsgiL69QS
	J++tnHU5MxtYTi/9uYe2m71LwDS3PBi479w==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Some citations pointing to the upstream changes would be good.

I added a couple links as usual, plus a reference to commit
7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target version")
that has most of the details.

[ The comment already mentioned the version, and the commit that added
that message has the details, but I agree it is a good idea to add
some references. ]

Cheers,
Miguel
