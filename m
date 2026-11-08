Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794167971;
	b=QsqopSRJUaI1pLHreUKFntfEqEOVIFaYqYXD2t4tlRuqMs5EpeEDLunrmmrxzp347VL+
	 JPa82p5lYttjTG6xUuzunlef9TMWlg1Lx9KOU4eWXxybzeY1ooXwLz/jcMcTRztnHLhU2
	 XhWHBCIY0+a6dNv3DQt4dEDNOesUHQ4fzFkzhn03mHLPmrL/GaV4WwGFvQIWUa0Ljmu5B
	 OMV+6lJasGMoiBz0rXwfSRsqYHQanf4ESf905lB9eCQS5PLNDazIi//VBQlQo+wIN4g1a
	 6pHwhWZQeq0YxkSEPKjYuxUmm6imFTX5KAJmHeqGkfjmCcYkEQOmRsrTA8wx4kRBoFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
	b=maD+4gPdHGRkgeUaZgvnRgYeypxJwPzwcAUobX1vT8OvgaFkVD/GIW3ZlDPnYw6Rj+G9
	 WLtlJ0FtcQ4Pyzv+xp9hm5Z30UoATUXto7HLED05T9vwfWQ05FYOulh8LLTKu+Jmgcow0
	 O83mVNceMdc1CaMOw7LJRS00LKbT1TYQd7SCwmF5ypSQLEVS0yuuN5uH5Q1H04eDIRgIU
	 qLtm3TWUIRi3oR6PwXMpJxBa1ehU+Faie2pbocecpluuBuk2kdtzqHmhT6aCw90T1bycF
	 W/ebDldqSRZLbllQjU648EWeBXONrnSr5wl+ceoxirxCFNwcWIp0B+NyjQbboQD0wEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9;
	arc=fail smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A42606A321
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so23411eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794167970; cv=none;
        d=google.com; s=arc-20260327;
        b=busqz5pJSVhxEo4TN6auT91MVx89Fw+6ZEyn2rcqORj6pRjbknHdm9pWtrB0e4cmlg
         dcYqlfBGmcZk9s/7VAtiJC9DDZINF2G9T1uuuKPUlUE3pPrpx4gMVjO3Mc5MB3RQn6bk
         1cg4Hjq1bQObmdC2bp1eAYv8mVrPC2PaIEtQABkytf1hGWaVz2IT0d1NaIOyl5ExBRFu
         foSbqIbDMPM2ATj3cGlFf0T9SdORDLAH/6YANwfIKqZK2DurGCqdyGDgmKTudw5PZ9MN
         L6qXfOnrhz9W0xOzttE6AoPOam7knKFMW2SglX4cQFNSkDMaNpFcnUG3gOG8jWNmQUsU
         MxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        fh=A8BfK1weOq2pvmO5BOchEF2tt/fs14d9oGflLpo2I8o=;
        b=pZSDLIrfR/LnUekUbKagW1Oo/GY+bdQVP56D2s36q9RFHXyD44AHJQhQ26ur3wuYF0
         5mXeNopyQCnPA0JUiuHO0E71hAkgTKzvVsVYKtACcCBAy2PkuDVfQv8UGlJXZxBR6eAH
         YucmGE6t17gq0uolKooBtgWRA0FxSGLs+ztDdVtQ7KdlfWq/hpeWcUnUiC2mlu+V0t5m
         9jyG0txwM8js8cmhrWeNi45RvqSc/tdYMGDRMGUWnm/ZfeEH78HqDOVEIVaNRsgm37Vw
         W6YtHs5AsA5cPgYiiaFIABIgMIxejTXsMU68hA1yedeorswiG+S8NyIgcVdAyql4oFhA
         w7sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794167970; x=1794772770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=MHU9Z+w9qtdjHnQktt3JQr8/UeWV072k1RPmYbRJRMs889bomwOl8dJxgVXlbfP/nc
         pCsfloYtrk1Kpfju5tKaC3PkKbAqtnSS7A1yjrADrdRkoG1x/h8wLQGMyNELJ6hQUvPz
         IuVjLBdZjlHkTadxck1FYnqucF3+wO8nLJzyPdvJJ//wP7b/K6Yr+3w5V8mhkSdne1GN
         1NIM6l7Kt+pq5n2UyPY8SWwIYK5CU78kzR93oSeptbvhyOhdqJ0/SM2fW6ObFqOZbTUl
         Qd+W3QFW9p9VrUCKviV32t9I0dI6Qpzu6Uvav1PowSd/RU0rI7lra/eoDnLYqXWHYivi
         wSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167970; x=1794772770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=e1ig7wUBMJYLPUJfFBvC648PdAJgjOgF4RDqtmMwsHe2fGeTtM259FTfrsSfeJRc/K
         Z8JHXYcrQbHIp4HRQwYq7KT6R0qMeOpWZF+uBGnW8XgV22kriBt0/Qnkj2sQVf0l6Fsv
         t16IZcCtVRxBzfzwlWdjdGpCDwrzjp4K1ZmsvH7zV9f+ltLL5YSY3LTP8K9Q6qjsnoX+
         /wcmEIC33IZbWIrKa4eOvpmex7XzzzxLc4wR7SboGRJjuY5QOSxMqVJAcbFMZg/2fPfI
         SYNkiGgb3XvL8hdXwe4hRcc/Uxfo2NYc553ejK3OVFxtv04l1p/MSntTwMCIq986Ry3o
         D6Uw==
X-Forwarded-Encrypted: i=1; AL+hErErtULvWi0HRZ83GMXABScX5AVaPvD2bbE4xb6qM5EfmvJcMzYd5qPjtNHX2stVWo+5joH/dBpg/dCBV4lm/gQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87a8+uFsA0/J87DiGsYXAzNRPD1IaFfpa54hUCYAKQ37oIJuWK
	ihBJVgXNICjSSVtkF5rVYJYBi0oU2BpH9vuL7KmWXypbbPxicGmsOd505s7AUnehZkFJY57lYRs
	sqrU7ShMnMT8Kbs0qqcLPzhP5slQnCgc=
X-Gm-Gg: AYBFou3Nnf2ZLCGrHWbOhB+OUAz76InTWLygJCXjwRXwM8ycvYAm2YKFQSv6N0Mqn5n
	zyqp0AtbbO5JC3pittpk+v0xziPQsxSU0s+qIa/+M02VA97h2OOKFhxPA0URiQ8VDY6GoJsHo+x
	QnjdexXF557N7xt6zu9tGXiVdAwCqZmV4eXF+4W7IoTmFTmgjBJZiJFhxCRG4ytx2nV8xp+LvTW
	bfbkc8GjuGzoqWdxLo2gzigO1E+D52oOm7OWZqH7tXoYAr+ndcJrXpRFBUiZ/WxGKcHlqGGADpt
	O0W64FcKA901QX4yoFx3D9PNUQXQ8GukfpAXxkYz3f2wNNDYQlqXiUnbHgh8SLcrfjl+xDdDHGz
	vcIwHfiesvqQVlCrN15h5upmUTvPeczf/dzt49H+yNMg3MmABqhZIUwZE3Nq4K2TWWtPq5EUzQm
	NPPfavMtAmkO3WIxw6MsyuTbhufHor8Wt78/BS9IiHNx7/Xhl6atWb8s31ZFXoGUMJhQMQWfSxE
	h7fs0av3yRa6IH3vxM3UkqrTSFvVgXMFBN5
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id
 5a478bee46e88-3725024039amr6518267eec.0.1794167970321; Sun, 08 Nov 2026
 11:59:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Nov 2026 20:59:16 +0100
X-Gm-Features: AclHuK9jeLy5xXtIqSKPxHyksnUP7RPDUpLBrvvwrDuJgV1dxihT2q9FQbUKuo4
Message-ID: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> -    #[test]
>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> +    #[test]

Is this one done to match the other? If so, please mention it in the
commit message, and consider whether the last test in the file should
also be changed then.

(We could do it in a separate, previous commit, but that is nit :)

>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
> -
>          b.set_bit(2048);

Spurious change?

> +    #[should_panic]

It is great to have this, thanks! :)

Cheers,
Miguel
