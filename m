Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793320095;
	b=3qmAAoqzWOFhIYtFKhJsBIJKlSbX2Wcw0IQaFv4JPZflxP2EDFZ8tCxu/ZIAARVKvbO2
	 lMCMUJuxB0RMoTO7HiPe7Id8mUVSCis++MtNJFdVSQUBGkz71MmVlivrcfPbAy8poCajd
	 aVHtMk4b/mq8pimG6z+ZNTu0ICjmieFEYrSXYEJNOM4iEXxs4SgUCUUc7E6+LS26Q4ySE
	 tsLevzHohGsN/x2N7+oHO7Vyv8S9nI8bfTz4C2lA7gujANUHlQi7HDLKKdYv8vjgKpK3h
	 MuKJ51VkVZ9KVp5LL2Aywmf+XkbKRtucmBIz9EMkARo3WClrsYaR9e0M3miLszCi10A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
	b=FRIMHyIms1+Rm5gwJwz85Z6+/2O8OG1gQ48UJbB+FrD75d5lK+lSWSd7QEaAx7J0suyA
	 1ROTs8J3nZyngiEfC8X1U9NVlnYySrPn8nCqA0ytaRF/qjiY6pbd19Lj+7Mt0CKm0PyhS
	 55xoKy5bDtu9whl7lnLTQ+JtGwNDlu029Mvcl0qaFp5AI1V2OjOq0/BQkFdxYnYP0rSba
	 W1XLmXqlED9EnWWyGk4S0Ae7bo6T2dcou6gPPj/IPbcDn8fO7+m8ZmAFd78td3PaSMpXn
	 6em6STFyXq2I8kf5WxT9NX1vBzUI+/I05G0rXGy9h+GQba8MCKrhOjkcjsh8eUX+EJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2;
	arc=fail smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D7606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 00:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso15904066b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320094; cv=none;
        d=google.com; s=arc-20260327;
        b=cDGwcpEoThcQoAWpDRP4QH2Fftk+WxXPYIoP4pLNSk1wBbP1OTFeHo633sNYTGqx1K
         0o6xdDhSVY0VGiOsHS8I+uRIxl/qJAgqOFvfr3gB2wNwpPr9a7tUfVjOVO29Uw4oIbBN
         lt8i17xTGMIXvXhcrLDH7cin49Ljd/JPAte8UsmccNgV/8MynXImp+3OCREz5bGyPFUH
         z8oGenuj9HM1b404jgk3Knsxao+JfCNSzvtJHnu0dYFcj0FebsIFzLuAE/6CNW8efN/r
         LjUANrIcegT2zrrJj4u/O8tNTgS0ri7PbGRq6ue/3Hx7/kez9E4T13EAULdmE320Qrom
         hOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        fh=Ns6GbGxbLcJYlRANhEWUZ/XHZ8RLSn8N0TWpMiMQeg0=;
        b=Kz/fnDllI7hZaN39k0TschdYBuN1KR4CiHjqOT1PakHUchesrqY7lO2voNAHCurxaQ
         diI2f/IaGKMigtOLpaWmfRQgt8JePMtT/1HNaBNq8I3B25TE3bAXvqrL0wVKn6S1ZST3
         Mno+aCdU30aiWKAeE3Ai9PLq5KeJ7LGUUyUjCp17P2aYcZSY9007vBjZZ7Sl5MZE+aqr
         IrszHVyVGYAIwCIH5KyeoTXCFIxM8u5iPjL+C13b6QKZXDZqO0WNg2OD7QQMTEyDXeIX
         1TFinirbZqb7ScGe1TgmIUln11GMrl5ceHqDkNcFhq4rpAFrSMQRdtTO4Y9umFrBd9gW
         EB1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793320094; x=1793924894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=EPx92SD2/nlj7Gy51oiGKSuUhEEV6f/QjPP90GOkDFVvLeS6MkjDeipocwNmUYAOHo
         Nma4hshQFzy8X4MAfiLVXTjTch8fzebGbKsTHtFJVZmvtcJ/XLqiU+X5MXeqsCMVmIYv
         Za79hAeh1NeJmDlCqaGo8wCd2EdswfqWUwrXH4+pxbUG3u1MGAduayGdfH3uUrZKg2FG
         eri6QEgtNhdn53F3TkjFc1eyvmQSMpWYENciLq1Xsp6jUql6lXYYI0BBLIWwe3DleuAP
         Gnl0sybHD7FswrWEWSln9OeTt7tTQs+RyhYAc6FCxYbGnZJZKGP3TlK3uV0H5AyQZyiV
         9+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320094; x=1793924894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=z+56dVWgsS7oqvHmnFRMUTpRZvjwGNOfpHkZ4y50XsER7NrKLtMnDEAyFtua5V5Xfc
         U6C8vqRDLau1O4DME6OCSRcq+PtminuAYJN0DfDz5nTx7RbKLJKU8TbB6UzIpioqM3q6
         ykSoIcD5FPMjX+5zKVT4FOXmxijXvBZPUjL84PGva61hS10anavXPs8QmlPPydOf1XG0
         W5HZU/B+47X7j9dvoEnaVdjrSUWVV5pL26i0ykAkGGmI8qgOoZi3MLtQn19B6sgYCy6n
         nihmRc+Odr4NTxX0qV53scRsxecU3q4j1GdCZhNwWKhYvlne//yOBZV68+yUq0f4jdav
         HccA==
X-Forwarded-Encrypted: i=1; AKwUvBxIcnr9vNu13Phhs87nJ8pFe6HMgue4lHA63XgnfoILOcE2tVW0yfKoyWHpPnNyS/Na8fNvAPi11+lv0G6K/ig=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlkcKGdponrFTTvRDVccN6OJsoIPelukQAXp4luQL3XdaKqWy9
	iroTu5fG3+mkb0TRFDaxNrnAhx6ZdEne7vK/feYu06ljGe7lWh8KmGwUcAXn2frEqD/3H8PLiGy
	wXzwv5Yq8ohU5xFPvjuZj/fG7ogoDcjyyzPXv0XZj
X-Gm-Gg: AYBFou370aQwHEz/7k3IT4hiSr6XOFXBTw/LtXjrgBJYPeV7xcpzoA/d9UzpZ4rDcEC
	3RmsN2w0FmOnEtnWNR4XBe2AcPqHg/qyR8LX//7JxhVdjqqxSri/VSeTXn0/9s4c7AeKAg7YmSF
	v8Zt/ub6VNslO7nPfo4NZotKXeBGpySvqh9towTiSmknuNlITfVeQOxqpNaB/n1lJIapkA6wPJn
	ltQfbsZG0JEb6kJp6QdVg+eARP3oT2PrpUgQPkB6quYxeNoV/loArDqjjWj32kF73l6Kwjkux4Y
	RR3Zx1kfnk0NuZwFLtuGfJG4Xx8T+QTu5F1yKbcP3uVn9vvN6RBA1fDI0fW1tSH+5MlGVTjZuqE
	+gKEL4va+U93EHaz7lU/P8YuQrZ+ZCvZa5EcEHIZboxRunM7eeNSNpomt8mLI9nYhg7UFALM=
X-Received: by 2002:a17:906:730f:b0:c49:a849:cb90 with SMTP id
 a640c23a62f3a-c4ca7a9b33bmr56944566b.39.1793320093443; Thu, 29 Oct 2026
 17:28:13 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
In-Reply-To: <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:28:01 -0700
X-Gm-Features: AclHuK9TILtLrldY6faAGXZBT-kc2c2frEEMYWdaANb8mW26TierZlqcroORRGk
Message-ID: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
> >
>
> foo and foo.constprop0 are different functions with different
> arguments, so I think we should distinguish them. The only special
> case is .llvm.<hash> because that suffix is added by compiler for LTO
> and I don't think the function itself is any different from the
> original

[...]

> I do think it would be good to spend a bit of thought on how to
> support at least one-by-one pagination from the get go. The same
> mechanism can then be used by batch version. I.e., think what can we
> use to provide data back to user which they can use to continue search
> after the symbol we just returned (at least for fixed set of symbols
> in vmlinux and modules; we also have dynamic symbols added for [bpf]
> "module", etc, we should support those as much as possible with the
> least possible deviation, IMO)

Let me sit on this a bit and figure out how to distill all of this
into a clean interface. I'll keep the .llvm.<hash>, pagination, and
batching in mind for the design.

[...]

> user code can be easily written by always setting buffer size, even if
> kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> let's keep it consistent.

Ack, will have size in the struct for v3.

> also, returning actual size even if buffer is too short is a good way
> for user space to "probe" and increase buffer if necessary. unless it
> adds tons of complexity, this is a good and flexible UAPI

Ack.
