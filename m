Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670B2BEC5F
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502110; cv=pass; b=EEyufg0cxUTvQHz+gOhT3vtt5NsZ69ylQFUk9SmeZzoje8LwYCszLqd0S2CdSuZbQDv4RRPgb0XsRT9nTaw3EreSuHi4p8d+UmgbD62Z+O+4sdF2ev+VYuLW2OmXbwNsgy/+awvmn9BkYzR/BxWnt7fjwkli/6kV2YJhJBrs4cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502110; c=relaxed/simple;
	bh=WRVPBP1r3UEupcj81ppPFlfizIU+h6eu8Pvb+T1BfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsRG9egQvZ1SbIoIj8RUL1WB0yvy51LKnVf8YtIm/2wbdiUkynNlqiB2DA76b9hTe3NRhXm5eHrOyaJLDM+ysx9pdSXtHycAq4ob2ZffHO7Irj9qospbnDo4E28Or8S/NaI6ggKS5wvYakHZO7guQT21laDvenucHnpqPJI2mMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn7sFvfz; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn7sFvfz"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd5658b901so258255eec.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=MPPAxpi6RozkOkMZOke4GRlZqOE1M2MpnoaMKlF9NunAyfbad5KIZZpnwRt3cvioWu
         RR9TpLG5bTNx1D1t3ewHDKfUYM3oirD8mKKO8k4TN4Yg7XcBkjnHD9gnQlrQBeB4y0g0
         ypPgqv43PyQBQScu/laDhUe2AK7LEe+riSIpYF4UGsdY438ztqjjpbojN8xuoqq2aPYu
         bXjV3k++wAwVR0HW17wQdkvs4ceqy3RtT2dhJ42yeP9HyeInieK476Zrm8bCgEVDdNPJ
         er7PakExp4iUXhe/KMZwycL4urseHU7ZWrxU+x1MoVQD2MKUu3KfQAYW3Jq5/0+LGAa1
         FMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=WwRSnvMHrESy0pb53YRYFh/1h+Ji0m28tlsLXsXioQo=;
        b=eDXCju/EnP1CcxINgLl4nnVviROKAwnEb71W7QRe/SQePHEPkfyf/QUwQfSEtHJhm0
         GLVQXQBhsjR5yAXn9TZ+cjCAsO3A2v833b4uYLpdiZJcn27Q5/BFVOnDZMecxY+xQUEx
         CVYRNuDZ2BP5EfiOoOccg3R0oEPLIkj25TXfk7UGWm1H9DQRNh+cLprQKe0UFeqjnzq4
         vvggCsH+vt+en+j/R0zNPfvHP8xnRYKxbw0s3n9vqadH0AX7MPxSxFAhb51zJKMwIHCy
         cxtH6eSlXBw8yFQDwFZ4tYzellm/OuD5T1K+jq0dHCbLNcU1hgh6SFmloHokBXXr8Syl
         M1Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=Xn7sFvfzRt9G0FrCZPuRREVKeZOHqh/la5bppkaKs8mMh4RHCWrQNCcSCneN+bMK5W
         1Y/dTLBK8jVnry4fmyC6KTYSpgc/2nf0BaC/v1XafHg3IqhVICMt5dA6Bgy6J9hNN5el
         xKLZxlGoENIhb9GcLr1vkwEszZrHpge/OVzkiMhoB/2H24BFDaQ8OA/MooOP/S6tc0uA
         HwvkyesOG4D1To9WLTTQnWG+ixbv8ZGY9bYJU4sS3VHu24coyiphoELx1MtMKsppQzV5
         IDD9W7su2vaUf4wW4+NTW0vk42O5er7xMJR7a+4MWeoefRbQDYGiIN023PdpUsVkgia3
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=HfQvRLC0ldpVdzKHIsqa/6UNFnKjYEzMY6h3Pfjy64OybiL3vT4RNsRVxGhckgdWEM
         7kkDvFOVgA+865/xe9TfSaZI+H36BUmofdz10idV/+t9hY/YSOmWQ3zoZoLzJpA81x8O
         7gQ7Rxw/txJ2byo2isqw/0yCfgCOtbc2JzXixylzfEQNz56AlNZyTosM6YkdJXtrUXw3
         JAC+dmPKMWYcADnbVZVmO6dQCdL6W26gxO6ssP5z9ssZGoatR3AwgW4TxlJLuyHL09nf
         rERHOlNlx/g4mwG3PRyQD3De9+dGhFtEr1/6eJXJlqon2gRTg+tnpDUoHTHlbfIhbInd
         16xw==
X-Forwarded-Encrypted: i=1; AJvYcCV/sYW+hAURhyGhDDR9tOI8EDuvaVwoIrPNlnul/kW0l5Jnyv/tdjIOg3zmR/kKuuYye8XY7wF3OPsOHItn+zA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0gIEsXNRpMu4f2N2gM8plfKysBWiP9b34Ftx9KRzmBfRb16FO
	bbzyWqsin/YosP12OH2Dw1rXfkNu7kqgROQ5hDbHRpV/TMzHfrhwUFMNOgncSv1tCxjF3I5kueT
	mZ8SR/Bg03RJVu5GUWBba5SG9+8kB9Bw=
X-Gm-Gg: AeBDiesHxm8hyzzITxO17b1TxNnDSJRx9TdRhb8yDkRpalRPb/VQOxAmQvGl9Whcfba
	b3OCaWQxM6ljm3JSyZ0KBzTmArfhss+pKfE84AVEudrE2Ys1vx0mdsGpCS9T6ETy0T0b+Gc7hRX
	3ogmaC+w+LP6JYXDmI0mhEiwNmVsiMYHud19yx4Ue8RLvDI6CDRhM5IunyTw/GmFLi/NiWvREIo
	tU0dLOJKZ+wHHlO7JqC7CZ02lC5Bn3VIfVcf+4j6mva13AmogQAs1VuYdlghzk6oB69JcfdrDem
	g/Ei8I3cWAHy4lSoCBFvd0eB4zqDGQ5AnO8rCo+FBfei3TD2VW9sFykzNAWQgp0rmGYafh1ZdTM
	3T85QTVXzOR0bKhWYDqIfs+M=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel
