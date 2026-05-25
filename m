Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49722D6E44
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731381; cv=pass; b=PoHs6grh8YUYfY7oVfSbE46puXCZAC7PER2wF1eJluMLqBRCBO6aK+8LKocvBSPSLsZOq+iUr2HkTaVi3oJHfd1VcrgNaJmuPKshoSd15I16IGS+mF0BheYjYStK2eAK4PIWgHjD12TPjMFfBGbR8Onyjr0wu2XBlFZLo6cdaj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731381; c=relaxed/simple;
	bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvQlzlKyzlLGiLxNs9asblJmpcJ2TR7aWD7P2Fzw44NKSRUAjnGzMKvXgE1EpRdr8qUdWaaZ3tUo0TkVV+1tyzmoR0Rsbx8Zi/sTXWSgGMotL3ROvVqRGtlLbsx52hZ0wkf73SkGS/Ja9UV4mzhhRFOz9rEWGEs5rzn0bQkzdTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQO66wcL; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQO66wcL"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so816071eec.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 10:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731379; cv=none;
        d=google.com; s=arc-20240605;
        b=YbaoJO2wWBhswA22zLBwK4O4j7+MvNHgFXI0+M+pBBRUiiBqsD3mlPNrK1cWrSd3DK
         Axj8ydWVunmCBiLTCZ1cRBUiw8TbX3PQEq89FA3jRtx1b8L5Jr+GS2fEAub7J8/5ezrr
         bZxniEe1tK6XUffBpIKpR4FCcHTLz2y4NGUyCUI69sEFYtaZLLw6EuYwmKIpx4YGo2Wx
         IMLLGJrIaNKKFKkyrB80B/+nhW+r+5pVsAf2VZjEQ12UQHuLvxW36KES8rZ9DohPNwra
         5CeiL1BvJly0d3jwZRCB49W7ZEvYW+JCyi7O9TC0jQE5K23g9X77UbYLOnLLooyYbgnh
         5mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        fh=ZK7XDQSw8jPj6d5dD13s4Dr5oWUxmSSXNWD1UKtvrIg=;
        b=O5eSxvJshaH01BTRUUMposIC6/nh8bASzXE97z/2GjDUqzwTTFmAa/23fq5SlxK1WH
         EfwrL7Y2majGwj5EW70oK0kgsO1KsPiWlKyXmhhhGDgBNbr04a0TodKs1wdpyIarnJCx
         DVqkDKRAuNnpDqZ/mSLBBdiu4MnRGvpcWrGxACZDsuL3XRWqm0RfKVwX9RLZ6stYOxLN
         a/EGoIxUcoBojvST99+siV1JrUI03Ptgb3phRXiicwSIAn5k9w7WhmwMnNz33cfclDee
         0TBqa0xFNf3bbwsCEaWGKE8NEgcYp1uDIJrVwotJxT8n0rwljcxmV2KPzC0oBOhbxAHY
         Zpaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731379; x=1780336179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        b=bQO66wcL0z5zIcTViNJ6I+iYlBR2dPiXphTnVWtmozZfsrcMcdzzAJMPyi/GvWzVz2
         TpQ7owXGqOJp+jQn7YVo1gEZohNSSdN9ICna16a2FvH2O4cdNpYaSlBcmCzj40Xd+7dB
         SkJQAFGd3EwiaELikkJ3gTg5uUf172Mdbr6WpGXfn3Kxdk2LA08LPtaYhkQ7Mtd+zwih
         XE8hnA4xzaIWawMqGXGYggXeuCAD87RjZ6s4hkaVGcMkNF0fN+ch5BTic8gy4uR68WPA
         x78IgDifhAvgfh8cDpIeYLrAr9idfp0UQLBKuB9eFAp/nztVgjLYzbBZCh377XUZ/UNu
         +nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731379; x=1780336179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        b=qqpzDYSQBHM/dsQJAeR4teXH3j4LLj2bLqT0RamxKD7rt57PIR2aTlz9+JASKWRZgI
         ABMWO7ETUfO94a/YInJkIDbwt55AMNl1rPJj88FiBi1xKnj0YC6u/g0y9my8IMeBuVS7
         OsifGAs9OZC2LsjYXGTZENaNfR8SGJQLISA0gJ6GGHN75Iop3ses8cYdgosWGz+yRRyg
         YpQmwZdhgedcv7EzQnPU/2tF2JEjD9V2fJhfFcATuxeqTC4LzUnQf7BrsL1XK6iWb9l/
         JQ0TLf1XdyDWU4oyL+9IH839ZibTuyqO7wdWz3umngB1NwI68mgO63ZGwa1IObAL5gYT
         VonA==
X-Forwarded-Encrypted: i=1; AFNElJ8YUHoklO6eIVfq1To5pjiXx2kwcnJxMIgSKS//nf+GT0aJq+55Yf4QeI51+LPZbWsKxom7qd5wr/+jLot+b1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXS4XfIJkgECH1BcaX8hLlzoGdsXZQtHVHxdBqotyggwQi90hU
	fx9wGLtxNqqCEo/TS8bSpsNuCach2CSdicGLjrnHLI/bGV/1fNHOArAdWvcyZoMVqyTlUCBeUrE
	GcfauEDIuA2QorzpNFf9TVDl7R0VDRQ0=
X-Gm-Gg: Acq92OGq/F7yEx63QIUzzCb/s6bkj/FGpFyjFiNnp7ZHcWjpwE4TaCUE7Qbgn3kYqwr
	54vk3/sUROBa5J59RYOhxQoeEFzh4aVlOyOS1P9OzZlddLJWzrKsQ8GYIZQEIUMx7cRoqgac9x7
	1kVcoTB9Eqj0KrnFK21Nz4tqv4P2owUaJlN8cHuH3Hs+rkponGs6UWuwaYv9l9n9HPUTMYzA8gK
	1keEPxUHln2GeXCBgTstDPock17giA7GcK4hBPsmz2zX9TBlD5mu20NvBdAOCimOmCpiaE8H8al
	O+BFPGZgZZ9pad1AXhCv6AQf5/sM/RWJNv49IMNzvgCC2B+F7lEtICHPQJjHWsJYOmZ1R3c0GJZ
	f/OugQf+wVovf2hS8cXM9M3s=
X-Received: by 2002:a05:7301:2b06:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-3044921564fmr3206406eec.8.1779731379003; Mon, 25 May 2026
 10:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev> <20260521-miscdev-use-format-v3-7-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-7-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:49:26 +0200
X-Gm-Features: AVHnY4IGS4NWge_5oO5mtK6gWsE6gPd3PI1zRry3kpNJ_3QwcbAxHC9OP1Zg3x4
Message-ID: <CANiq72k7p23yTLL2Mq5nVr74oWCCCNuxWSdscU3YgO+2sYCEhQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] rust: doctest: use vertical import style
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
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Convert `use` imports to vertical layout for better readability and
> maintainability.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Please check the titles used by previous commits for files, e.g.
"scripts: rust: " would probably be the prefix here. (No need to
resend just for this, maintainers may fix it on the fly).

The patch looks OK otherwise of course, thanks!

Cheers,
Miguel
