Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF79384230
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486289; cv=pass; b=hLrZ4TxW1X4tKg8hLb9NwXrLwcGPxuxl9FEY27VjfK6y+YplHBtEFaV4BFCgUVuj3L7yhAeFACz/p5TKfezwr2Oel9ziYsI0OGLEi/EAh2Gd8I0e50bRkFz73mNDzoJqJ6NvFmrXUzKKqIaLK5mrJjlNmkiTEDiXj3qf86clGNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486289; c=relaxed/simple;
	bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hok8C0cBMrC5Y2sFN4BgVnzCZ8dkkzjuN4S17vW0Oclku6EbWyySre+y39/J3uVzdsFLvehGTTT++fie1fWkW0Q9PWQIwIoEI6jyu9KW6yT5uKn7GozM7r6ig48lvS0rwJ4uFYuLO7+Z7/fQGGqYYjmBeeXP2zZZXgpQe4l6jW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgwhN/LO; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgwhN/LO"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd801b4078so411740eec.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=Pofi6WAyx611A6jFepYkwzMPB5lGYQjCgJIJHDOP3/n71TFVY2086OkCJreAXcPTzd
         CMK1HM2kSYrGXidX7n4sXzgDNl28Tj+b++IZ2FDpVoT2hlfkhadWSxg3Ksf6Nos9uFmJ
         TeWGXVyeHJF3anPOt3iaeBQOUA3c1lih6UPO/LamplhhH7lvEvzCnnuTsKhmweq3B+St
         5qCe1wDf0CJOfHekFcLbWuh4Exk+odCZWPpQP1ddGtR1CAy8rvOyWiVK2agQtdFtGwrg
         Od2E1OfATjBDFgXhi7tXuIFlP3lBoDLsizamPV316OuGbrlougXbQ30VSq5O35acT/XR
         bPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=0oqj9PlOCD8cnroAjDvQLGXanHwIhmJquC02Q21kJNg=;
        b=fV3ECb9zldLTEVNbTIYCKTSgS+wsPhQaeSfz1ay5Vdp/oPJjiKqWQeyP6V/WbuUTsy
         Ib+Qtw1VcVmZxjrYpJima5SdNeXOJ/BBvBSmIWO5Eo8QwkL9ptvRGlkKHrKPXtfbLFQX
         rmWYHwGunXtt6IWR5eKmZcLZnevpgrVYwFVtbhUs276j54Q1lXPX1XP18VzDHIATb5Yw
         H9O+gHQL05jeWCm+kOiiwdLcM8FfAJY2ETApc+6bl5uQMFVtGQIJzt+zDnPIqnxcTHyH
         b6NcpB4RC8inSsa7VSxgERrs9hK4Fd8/RL+VqxGAiN0TSaP3+Cw/b9jFmqBHFQD+d2oK
         G/oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=jgwhN/LOCRUuz5UtuAxbMF3jgJnFp6nKylfYyZFBTJc1ux/cteBqbZhrHUpd0SVrJ6
         9hhlLqqaYpY1c0QaNN6MWPPAIwh5+uX2vnAa59YCd3Q2Ao03JARshIQClxScR2gU23q6
         1Yi78Tqo3Y4/iAxKQ+p+X62sVoaB+OFZJCt2n+9UhA+AY6ZbTDd1LWJ9E3QbIJgzyByS
         8zBdW1BmZbAb+cnapbsOd4q15lxIceJHUjgfEn/NiAWrxrT0gr1mHOyFTsaOq+RvDLti
         a6G+lGC7X5xWVSu975ZjophQliZNveh4HFzgRC1AO8zyzB4RALb+QOAALbUrIIiMWMGm
         AnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=h9dVa83bMFqjZxS+remCVzl+3ce4QHRou28nz0Ym+XtbOuvZqtMC0q0wYIXqv2ajI0
         SrSd81EhV4HpHIjFBBRn2tDr1Ec/QCwFDv0f3WhWNTHzfBpBkdbahJmmSGADXZfjPlvK
         ykRQ0DlPSpZxqXEFU9ImtGnWiVVl9pIJVHgiRgok1UrP4ZmACbNtic6+Higd4T6lAEDR
         fkXBSEnzGp2bQmUxJJIRU1hBijaOPvYYSD1Wq6wPG0NOOoeLhArac7rtCl0nHUeK4Lwd
         q0n5G9fg9ZTpEjRF2JB7pbAnziCO7hD/DzzSpjnre1NwX/WGv1kco6r8QnZ4LhQhkrlv
         oM+A==
X-Forwarded-Encrypted: i=1; AJvYcCWoYCOsM6blNQBLcl/HxnXCPDQlqT+oqRcxGQZ9pulWwBP78WA2/XuRXEu8RfptBh210eUB62XcNhIZv/5itDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vy0sfcLQG5hNkE4qt0m1AIrMMXaeF9wCaoOg10yGRhrl4JPp
	5ny7drxeJ5XtpJ1yO7nqFgZCmqz2Ais7aAWQkXKa/ypBRzeu0RbjsbbxiAUqSLu4Y3eTpQ08ufA
	6A8j+5x+b3dIMr5ixLPwTQF0MOKmJaf8=
X-Gm-Gg: AeBDietweHQMEjvrNYrPu3xjmWH6Bb//SIYviy4Moklv7SV4US2NNBIlPPB6GfVAgoi
	rz3jfQmxDd1YCJ7TJOjrb/mkCMzorJtYEa9d4ZMCdnPc1WMd3hVEKQNS39RY8d+8kKd4oRfG3s/
	Fox1ByGT4iw+KVPCUvm0NRiXDRSQG2P52dLFxeQDKpwDae40VDvoNpvitQ1mq22EszGI1TkpZnh
	K1ZvXW/UURlgOGpy2b5HrdAXTXAVBpFaIBxk4h3Dxz1LbGMiKe62frWavLqNeI89nqkzALvw3tS
	wveu+tbdseDRWTiVxP15j2a9VtKfhduo3cDqJZ0p0S8omvyLbqEHEVezEKoZgdbpm5TW9HjWiVA
	WFItTjSDWiEWwgt+LrbPoh+vXvYDjr8itCA==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
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

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel
