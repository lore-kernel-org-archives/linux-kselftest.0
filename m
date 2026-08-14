Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3A39020C
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739856; cv=pass; b=Ohfh8OvXarEEfNcjpyGdiQpJHc3v0TLmXsnkYoagCXdMv/6RI0poaJLhWFOqXORd3Tybcii26PQz02+YBD/zur0FYLpmmqLrCOOlrr5CEvu2Sp8uNoUPkTkmSTbtqAegEW4fJlc1DUA10XnIaDv5DUr1vx/2LPcFV4JZuu8eBHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739856; c=relaxed/simple;
	bh=z9JNilwsmgDiP85ztxzf9GGPteMVUxvleIIDOUywAzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4OtgiCrrFyUC0P+dChmxBMreZMR4o/PccWEw9zJl7hAGRlbfpdiKy7p3Rl777SV5HpwxistVNyZ7PC4VrotFciU3XOOFrf0BeIbprbPgJQX1G87A+lsl87rgQ+eTLWdjYeL5SQ16mkQsOhkZoyWGhpsgTumkAe0yheDG7TxofY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geNLKTqq; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geNLKTqq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1022609b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 13:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786739855; cv=none;
        d=google.com; s=arc-20260327;
        b=o4X47BCESIDUi0PC0v9TdvxoQxgWSR6LTXwLbOYRxinUcl5E3SBPcAnMNWJxNNYqT4
         Yra4AANzjl7pAEqlapo34Z2V+8khCDcLkCsriMipMKUI7W4SJmy2+1ru/mQDf53ghnUe
         OqKtCj1HkksSOqFsQhkgz0XA2nCPCWvFxdmTRwoL6z2sQ0XiblYYLZFb2afcPj9BCmoP
         spNJabSQA0UOBKIBfyy5+WizDTYD45J7MrA4FJ/pyRJC9b37KLLY+o/4b8yCD5vyiPy4
         O4fURp4+mYDhP5utO3jM6WCrKtXZY7PpSnz+EQLBq1d8V/eYxq12KpQlNljKQZJmR1ne
         jPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZaBi3+qW7LdKraIcgGbIr7kPFRKjPyDOF9NpBaNJJGs=;
        fh=mTGSth3h2ydIE2qlwA/w+/VdYcq+X92uRq6UBFpxsl0=;
        b=GnH3iAXB2NGoMekYP9AuNo6D7SoP+1t/A0czxVetaVTVxTIRvOJLpPshdHSUt0fNr9
         iN1B4oFL2aNvuiSRMJuIqpw96Kez7vqEkAN9E4xP3H5hocl7w5Zn0EdHbAAC2xJXY0hy
         oRe8f5SFd8mjViIbDiwf2IVoYADu0h/OEXfoLYe6vmnGGODa4mUy+LULyFcA8ygHZ3+o
         NVvKnwh1LYX/YcFGTsUocd8jdGGsgXMmmlj09/iyRiBQ3WsTL0iUu/mfrfg/zjC9FF9v
         kkWPB6hSpXbScQdZrB5FK+XuN4EWwar7QEbIMkVcGuLcFZv21YsChn04QmMixpU1dW6f
         kdjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786739855; x=1787344655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZaBi3+qW7LdKraIcgGbIr7kPFRKjPyDOF9NpBaNJJGs=;
        b=geNLKTqqK655c99Y3ZfwCLr92P3L0p0/Uw23QB4IwfXO/0ADlZgLfafCha+sSjkZGv
         auJkaSPmjf3LVCCO6TGW/HvE1kGEsf84DraNwTyKqCExpmIc8QS5HfML9bp7n1pl8J89
         SOFCJelGOMjPlm2bdKLdw+5DEoINZ0SUJ3hHC/faINrWiLfVWJqg5e5y7OXtjLPZSNfN
         MWEjyG0w4chMXVcTCaHLf85+gc9Zqe6RdpmRm1/g/NZNh5U7g/cXdp7mbFmjL1NpLxaI
         6vt2hZUfp3Geyc+CoL7EPAHV5QZCNa/6u0wwtqMh9wCAMgMBFCijGceRtnfFgTtwoXyP
         1pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739855; x=1787344655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZaBi3+qW7LdKraIcgGbIr7kPFRKjPyDOF9NpBaNJJGs=;
        b=dtVcd86PHiL2LL6M3Rqcv07Rfxk8Ab9O4wJtuPKLVaOTGNN8reH32QCCC/UfGSvob3
         aeEgFeMkp9d5lD5CnUEdr6iCRmi6QUNsqaP24f8wYzPD3cp+DSNqtpfEgGym+M2nLmlZ
         P47IR/hZS/RUGJL4XmyXpAbMt86USw6haKwbIt+G5IEjsT0gmjABX7EqFm5ZWpgtSe76
         nQL0/guiWOwFHvG3zIH+A3iRazcq/z7dYh0gKcWJ2cefwwHj9CnzKaXjMznhau0TwiHN
         uF9HaAhYtMrcP6aqARH3woCO1ICmWvJ7KUEUubA2zVV8b7F1/qCf6Bg6SB+YvOMxqoQn
         BEeg==
X-Forwarded-Encrypted: i=1; AHgh+RpN/sJNiI3c1wzsMv9QCaUOeZ8kccoqP74uVS7WnycdO173Ds5S++2xqypmiL75uUxhvd49RBqfuDNGAcJ+yU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxug7JSMPNgMFdg/93TCGt4hmeBm649OwmJoSneBPqbykF8YDWC
	RBKxO+g6Q/X20Ozwa3BJ60F8Xry9nZdo1JVk0Vyo9oO3f/ynfQIrHNW7lfKqcKjpSAxc7hvJOXi
	ZPZAD6YLux4vvBE0nS2eKCSTAJgbamRE=
X-Gm-Gg: AR+sD13KXDojbdfOBnFE+VjTO5BGflt4MgM810NTRM6U2Q9SdMYbgGetNjrYjtjQr/r
	BWSxpdAhvWK0xpRZ0B738AA6DI7oB36WauvGJjXu4qO/+ZUDu3P64OCnwgWyW8i3VrOg+8mhed/
	ipgxhhpyYxDLk+X7fODN+BYrc/Lz6sXaa7wR4XTEV40Whx0kY5OjsU8thB0aQdZhv0eoHHf0K2T
	rqGybBLGn5wrhhwcm0YOv5en5btYUjVf1dLknwUD1vYsW3qTzJ/YJt/HHnmKjXqNdg/+jaOQX6n
	Jj+NanvDZMUyR50MHSTtdYgSb0xMOBguDTYCkfU9owmZ2IZWkz9zFLNeT+GjMk9IlIRXEu3PZOg
	qD2ap5+dKvsLD3ATDw2nrE7CuoIvRncsOUsvK
X-Received: by 2002:a05:6a00:4c0b:b0:848:42d0:bc91 with SMTP id
 d2e1a72fcca58-84fddfc1d44mr10226355b3a.12.1786739854568; Fri, 14 Aug 2026
 13:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814173206.93082-1-leon.hwang@linux.dev>
In-Reply-To: <20260814173206.93082-1-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 13:37:20 -0700
X-Gm-Features: AUfX_mwRDT2_se5uEyo-BZZXwxrC1ld0XB7XkABGEpse_4coMQOr2Ywwd005h84
Message-ID: <CAEf4BzZ0ZU_g6eHnkoBFXfD24rDOBSX7QQFVd60DyNS2S+2m0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/5] bpf: Followups for global percpu data series
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:32=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> Address some LLM reviews in
> "[PATCH bpf-next v12 00/10] bpf: Introduce global percpu data" [1].
>
> [1] https://lore.kernel.org/bpf/20260813152324.97937-1-leon.hwang@linux.d=
ev/
>
> Leon Hwang (5):
>   bpf: Drop duplicate blank line in verifier
>   libbpf: Avoid unnecessary mmap resize for percpu data maps
>   bpftool: Update comments about skel data maps
>   selftests/bpf: Avoid flaky resize value test for percpu data
>   selftests/bpf: Improve readability in iter test for percpu data
>

applied patches 2 and 5, check AI feedback for 4, don't bother with 1 and 3=
.

>  kernel/bpf/verifier.c                         |  1 -
>  tools/bpf/bpftool/gen.c                       |  4 +-
>  tools/lib/bpf/libbpf.c                        | 17 ++++----
>  .../bpf/prog_tests/global_data_init.c         | 43 ++++++++++---------
>  .../bpf/progs/test_global_percpu_data.c       | 14 +++---
>  5 files changed, 41 insertions(+), 38 deletions(-)
>
> --
> 2.55.0
>
