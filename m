Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BDA35AC3B
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682560; cv=pass; b=CeyKqEZAtkdT/RDe7U7/j9/HuSVvWwvxec97DWaMeyUtrEPoMHJBNH9r3rLgsyVAOOZccGQJ4oRNz34UP7g8CYGf2BOgDDsk+QpSRbvUnmK6U54vAjprFNuLFEEYm5Xi5OPYmvkxLaO/jsK74S9+vWPb3AwqOv3PQIZm0oCaAXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682560; c=relaxed/simple;
	bh=KM/lcUx7z1exuS4n8yi/+58q3UUBVKsLFZjGmNnRgok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRmNvw+I1cFQADMLFb7liSOIZJ5Ac4ZPWBl2fMoW085/Eay2lTjaN3sqmrCfIGwai+BscLZ1hlJM/y6ZpzS0vrc+mhUHFUC/tZShemcj0KXDq+gf3tLylUYMKB04KDaWj17lDk9Pr4T835stSwXOxX3NECCFfRuIc5DP+ny7iIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZk6FCrg; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZk6FCrg"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8534d507f59so205778b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 11:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787682558; cv=none;
        d=google.com; s=arc-20260327;
        b=ht5TgqTj3N8P6cnY8keH8KZ74CxrL8ZwefWkGD2uliM6w/2RsUw5EnlbhSGgKkiMhI
         2Kkj2HpXnx+azkz0+82bkwYoi+URoDU4js+gmY2HW0jXXXZo7JWGNTD5YfBLhLNTm+5J
         BgpMZiOK3YEvexxyprrXt9ikoTlsPX64KwfKUbrgIRiFf8WWNM6GVIJCFHugizMnqqNi
         yBdh9ONalkUnMEcS6MDhc7+aCkj7SdMpQQKCOlqcv6vdYvbjQggo/1vLSNjn+jKG3IuQ
         6xQpAAHAQgy/3aSaT6apKiD1v70UCkSTEzX/HtYq8w9iNoZ0hobaqH6VzHzBRAyKdF69
         Y4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KM/lcUx7z1exuS4n8yi/+58q3UUBVKsLFZjGmNnRgok=;
        fh=buFjFEbToFqEhG/gdK/0SywcRxegqV6WBo2yKgR299U=;
        b=oFJNk66uU/+xkBk0vUJ3LHujv8WMndMwpzJZaO+FCqx3roYwliSaLW2XBhr6llU22b
         GveZzQvRnO5IZu9dsv9ie0+mCoWZQO6Nd77tbgZjF/4r+kUsKfjK+0SqoI6zUFbWqpFk
         oTSOJajdlrQzC/YTwQW5bDHveXTjSGFpj/sBCVg8esz4T35NreoD9s2MR+W4lxh2mGHM
         pgU8qzzu5s64j6E1matCcyz01nNLyg8aQkWS87/zQqhzlFuP7j7wUdvDQLkYp5kB7VRs
         Rzo1K4I+I0OEkN9lyrr2b+qjD1ElaexHhzm0CIyg5LeRLd/ggRtm1/k1IH+CL1kJwi+J
         kOcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682558; x=1788287358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KM/lcUx7z1exuS4n8yi/+58q3UUBVKsLFZjGmNnRgok=;
        b=hZk6FCrgUr78TVbmhz86dvdyqVsyHrc56YApspCjFbks/9vPXyypDrt8lwZ1A8oKKI
         NT8vQBhVk8Po5cO+FzgexxHfSWs+klPmZ8+iJzp9i8RfX6+u0Px0KLF+WvB6RpMrmKVq
         uJwlZiGykogdotTvA71NH/VWClxixr1c8U1kUreH+qt9yMv024O1+/5VnRdciyxWDprV
         YsacYbAznIBU/hG8nvRaUsuq9V6wZ+bqSlwGAlTyYPotBwg2Nkvq/kDsh5HA/g+rP9ad
         MQkLVgZ25/+z0WYZ/Zji38U+jyQM2hXGr686qeUCFXK1YwkiMpjVSM0B3SKYroHy8nl2
         mpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682558; x=1788287358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KM/lcUx7z1exuS4n8yi/+58q3UUBVKsLFZjGmNnRgok=;
        b=nOEVzi/4gtU8JZqIda0nANwrV9D3B3cyVyY2EJH79eadBuAy7f6vnKpo0XkMMcD9Y6
         e9lkYRZ4jTwV91xkzxmzFQxN7XMc9ITf6Qv7UOMjkEuTE4HESj6bOgrOUtuNp+yAime6
         cuxYS3NW7uDQYbIYhBJShCZQ9GQVcwreIfeOssPXshbbtFY+ZQACY2NTz+J5PovOD/Iv
         Co32KbR0gEkTXOgcgvzcwUcZ3yRYPpI2hjlBFAqovKFmiShaEaIxj4fSwoG3N3TF/PvU
         Xg+xEtWT1Fca+EaisD5DisX66EobiaADG6SMdpCiA5ATX60TsZ8/yWxpJdI3pDzjNd5B
         G5lA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj4RrPOnpU0VRjYFkK07iWhMJO8Ck8OwzA/e105BhqYml4Eujia0JQUgpVeM9owxABSSIU56Ig16wPwF4y+kI=@vger.kernel.org
X-Gm-Message-State: AFuF++kjhC0AQmi4HJRjtEIO024X4juEYopVF994kzfBFrRGf9kEpiOv
	A/7MI+evyL4RJo2x90B4YSv5xlRLslmUePJ4g7aHISwGkeYimbbkwTN47oVmdVZaR1wMldcAbKn
	VF98YcKbIByLi9VoJxt9pkGZDNA/kQ1g=
X-Gm-Gg: AR+sD12ptshnQiOPrx2d1xPauS4C+9wnDW9WqnKhCVyqYbl0vIarQAp2JAVZddV50HI
	8owOGpO0ufPHF5WrkhJxQuUbbnOSJ8Nq27k0zZcvNfTtZ8Df3/e4lKLLuUViA2tqqwyZuS9iDxR
	nBDb1mId8PyI2XQZgF1TSDOX8/h4R+AALU0O2zsnqYo3k3FilbggV5JKxUpPFnGty2uvyapecbw
	j6MIHCBBue4duzX9HI4neuycwbAnyOEtRyQcZ4kqO/HF54VHtOgX/k9DOoEpcDm6EmNAsc9EROK
	SaSU2F54wHnyH4oxPox/zp3IDKPTT4/KUGw8Mk1X9QenolkarO27TPPv6iXMStZzD/h6tC6N8Tp
	ZNJz8Tic8EuaezQyFSrlFc319gCHBiWCtNy7xecKAtw==
X-Received: by 2002:a05:6a00:3c8d:b0:84f:b01d:3693 with SMTP id
 d2e1a72fcca58-85374ed1b07mr1103841b3a.15.1787682558435; Tue, 25 Aug 2026
 11:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818153202.90714-1-leon.hwang@linux.dev> <948e7ff41f942519880f9789faf6ca8ed9d0e2cf42eab5b9e1567ead5367b830@mail.kernel.org>
 <a1b1c6ee-ad7d-4972-a15b-f567e7787a6c@linux.dev> <CAEf4Bza6X9SZmnyqdZDFKJG5nWchuaEuFyC-MbuzQCuZ+dwq+w@mail.gmail.com>
 <90bbc900-21cd-4dfb-a058-13930378052f@linux.dev> <CAEf4BzZY-C3WtoRkdi+U7XFAMv59JeJ2R0yMi8+FGM4sLTsnQQ@mail.gmail.com>
 <b8f1e71d-0fe6-47b5-bf59-0e077e5806ad@linux.dev>
In-Reply-To: <b8f1e71d-0fe6-47b5-bf59-0e077e5806ad@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 25 Aug 2026 11:29:02 -0700
X-Gm-Features: AcwNN1XyrrP9zNTFIOW0jz_xCJcy9v-63nFUhyb-nd_k_Kn4wLwg02AyJIgkoCc
Message-ID: <CAEf4BzZ__H1Qy5gk_aQcKdMNKFBnx9UbHTg8HTfF4T0edwz88Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Avoid flaky resize value test
 for percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, clm@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 10:17=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 25/8/26 04:04, Andrii Nakryiko wrote:
> > On Sun, Aug 23, 2026 at 10:02=E2=80=AFPM Leon Hwang <leon.hwang@linux.d=
ev> wrote:
> [...]
> >>>
> >> It is to verify the mmap change in libbpf's bpf_map_mmap_resize() for
> >> percpu data map, like those subtests in global_map_resize.c.
> >>
> >
> > this didn't explain much, but I think what you are trying to say is
> > that this won't work for PERCPU arrays with PAGE_SIZE=3D64KB, because
> > PERCPU value is limited to 32KB today, is that right?
> >
>
> Right. Limiting PAGE_SIZE=3D4KB is to avoid the
> test_global_percpu_data__load() failure due to PERCPU value 32KB limit
> when PAGE_SIZE is 64KB.
>
> >
> > so maybe actually model that in the test itself, expect -E2BIG if
> > PAGE_SIZE > 32KB or something, and otherwise check the resize?
> >
> How about skipping test_percpu_data_on_cpus() when
> test_global_percpu_data__load() returns -E2BIG? Because
> bpf_map__set_value_size() has already been verified before calling
> test_global_percpu_data__load(). Afterward, it's unnecessary to check
> PAGE_SIZE value.
>

let's just add a comment about per-cpu limit of 32KB and why PAGE_SIZE
of 64KB or more is not going to work, and skip the test

ignoring load failures seems worse

> Thanks,
> Leon
>
