Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C5318B9D
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731524; cv=pass; b=MFQYst4TaOLv7liG0LcY9DwtX34GGgwjdaDPJpgxU7SJAPSmxtn/ZZfyIwM6G34xzTEQ4WGBQeltbrUKtV0ylWaeUVx+l6tufrF6MKIpASFInx5PemjqHm3bwIlLOnBsovMFfIFi7ORlxaU8Ks/HmG259e85+gVVnnFOns8rpWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731524; c=relaxed/simple;
	bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFE7UXwRgwOJ8U4JAGCMC1jzyEo7ur82adGlY99SAc7t/GV62ouJB38xfbsDM3NKvKAYPv6C+KySj4EQSvfolYTAxvpCzgx/5fINWeg+clxz1XKSTqqalyx776hkaqnkLF/T80/Hydq0X3GospQtLMWK+C1Qn3htSrDV7bu2pJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OppDLcB6; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OppDLcB6"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304559733faso241786eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 10:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731522; cv=none;
        d=google.com; s=arc-20240605;
        b=c5VMn2n8/ZXNzCvkhsQ7xd9ie64ulvxTO3hqNjLAmn+DGPAUMb/mnN0A+zLh/vWK7/
         9h7R4hsfX3huenDIkwDsR28XdNkUxGcmLRwOYQr9NSv+HcYI1g97DOP2md1l60OGYexi
         MwUHhVgUA35iHJBy8UVhdqxpbn0dgG74hp58pBEoGHrllNXcqg+wvjQXorWENRpcKHY1
         XEZL/sFeLHnsDaT4fn+JqaC9ifXR+eeY8om9nv4ZuONmCy65pWt7SlADr3nImtWVLOyN
         OPOmM7GifXb+l+SssL98FQ/tTmoNzI4cQ1FCeeYNMUvuaf/CrZpoIb+FiQz9B7l0ZG2l
         7OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        fh=O8/NdHYYVziz1tmOMi6J7zKyoT0hSVydYF8Ks+99jZM=;
        b=iPngk2nhfblo2HrKF3HiTJCcS0TYTPHHYB+4c8iPdCA4UsEUDxo0Y2bjsDtMMRhcTl
         fnwxvgpes+B/H5PlkT9Hn2sROnDVXoIlJenE/pIA42ZjKjAaNHIoE4PyWaM82MgQ8POE
         /mRjLEfWuA5wsGQoXQd85rtUJoRN90nMe1GG/sDNWm79+nY8Mhc/OmtAyaT3AieC44nN
         U0Tu9j0gr8oTvv8b9fX6EuTCdS6+GDeJI5Y0EcS460Gq8Py74ZoC2MdiEtoGFmtikg2s
         wQfJvHQEEOgOEdX9mA0xiYKv4Yh3Lq89QBAR7/Byh1246wWztVRgHy9V0PvnNxiEYFTs
         WyLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731522; x=1780336322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        b=OppDLcB6u+4hVFF0nRgLbobmYXoTLVQJl+Z8xPBBHmHFhvYb8RJRiF9YS8rMNI5nCc
         7Y8Mv0RdAOhQbay8yY1egS3iRvlzguBb1ZAA5/XLhVgteYSK+JiGxyk3//MN4458SRo9
         RnPLdCXmz6BGOrsL8jz/xmx2khl/zkRtjFrmwzlRIX1cARxKH1ICKY/RTZN9zD9UCIY4
         M0RsNpnlmJzXox6znyWLgimAjUEKTjik8ZAFNZ9+ZZRRE1MRZ555L/2pLG3E12eCKfoW
         DO1NfH6+ROopBpWoGmUixJGU0ztsptJdzJY2XF17VDZnzj9mul7XxWDgSEvcG3nfxPpi
         nZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731522; x=1780336322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr6z8jUXJs76+Hb66TPj5wAIPCr19WpDG6Lp2ByKQGw=;
        b=HpfwTv3G55xNQTBfJK1to3b+5OKnGKzfVqByErKl95zTTQ1mjVb5FPu+9tZsIrZ7k3
         JGimfwYpnGnxpDvRo56PmI3z06Kh1cBSJKtVw509mOYBrHOXEC3yxmOaSiRj4aIfpQi+
         fyhQlT3E8LCJh6OFrPpDPR0snzC0tudaf/C8CGbQYlxVcPWtiFw1zbWjXRUjL/cTGtC8
         8bJveDInak11jilczccQM7ggPQGV2U88tQ2YjTaNsNZgSxM7tCTy0fExkUQCqxqtla09
         qaGm8PrPrAqGGFSG+PSpZbjwpmWDCCb7bBncQQAFL8XCDvuaJKGICSwVYTWhS4rY2tju
         Gisw==
X-Forwarded-Encrypted: i=1; AFNElJ8YbF66mPw6lDyWOVTK/Wz/nFjzeqNLsSx7SKQbWHEKb221YBV9i0tvtu0r0aqxdVKg1FwN9czvnqBfPn3c898=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkr+nkr+6VPAGy7rEbLqHgbG50j/iPGRr4anTovlnTmLL/jAI0
	DX0hyhcI78F+aksqNOIC7Y1fVCki+S9mA3n5ngl7NSj2x4vayBBgTvmcAuad8h7/xpCmxxy2lR8
	VLQrQ4Ns0GTs04RU4304TZUheUWN6eS0=
X-Gm-Gg: Acq92OFkhU+EL9QMDLEtwRZZIk8rn6Wq0vrXFbUl3PYvfyhvrxZbVKGh1RsSkiohkoD
	o6rB7F63toefOSwGLFf3qNe7wK5u1HVeUr3T9b1vu56FDaVIhgOaPgCveNd0CvrjnvQiociBtEW
	LZDL21YVMQNS1xrWqnHX12VaYEdCe7Dub3qSYYM0FOXDEbn2t40tiAzsEJ+0O7nnh4cqCBEPDu8
	uXJGa7qPhEGqtfe6ZKItMrZe3byLamkR+qPo5amgs25D06eGEqHJfBTj2ZyHImDCWnnLggnZHbO
	YxxbpGYpCieK9u0eCHjp4pxhq9NFZuPHwInZJXnHHpJZKnHJPclpacZN1KRu2icYg5SERBxQK8L
	RN8L64qq4JB9CGp/X15JFS2o=
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr2954662eec.0.1779731522166; Mon, 25 May 2026
 10:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:51:49 +0200
X-Gm-Features: AVHnY4Lj-A7r4aYA8iAqKIKO_8AgbVe3NWs2TYf--zAM-mIaOF-qUbEBAdoXyqQ
Message-ID: <CANiq72k3cjgHiimYqGfuQjPy+A3oOUEoMxUJCS-FgBm25D4MLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Adopt the vertical import style and drop redundant imports already
> re-exported via `kernel::prelude`.

I can take this if block and misc Ack. The changes are straightforward anyw=
ay.

Thanks!

Cheers,
Miguel
