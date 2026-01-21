Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177533375CB
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986823; cv=pass; b=h4/guezzSQ6FckqTKurFfJl+/S8IwkVIqwQcLouXrLYUw9ukT4CdUQ5qIeolp64MTuHsmXkQ9okfvzxFfbM9JJUmwTBmmLOqbobv0670O3pkfhDwhpSbgq1d3hQtvg2Pb5RKqW7o8WiMwWWGziTBxKl4FYpMdFLb7ORX3zrE9tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986823; c=relaxed/simple;
	bh=WKWfP1RaBX0RVAS4wSFXcf0VfJYSdUtTJxeBlkHPx6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNRFOqJxyCMinkPUaFbc4sbN9acSO1dBn1rnMkV9Wz8uVeqzHkuFQQmfMvXrz1N/hKbHARHpOYqhIgz3Ay/24J+sAHXH8g+KXl8McTXE81PMpH7Z/oxFOAcUyxMZCtlSLvAWksUF5KNo31BkKC/fzi1MbvhePxP8mttYRinv6jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtOVuOHp; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtOVuOHp"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-894724bc5cbso4690576d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768986821; cv=none;
        d=google.com; s=arc-20240605;
        b=SJ61pwVp1dLSZhzeb+29L7E1sei+sE3lNyPoF0w12TAIwTGXp3HKM/rApI8M3qJ+w7
         xJXUaZH1p6thTiwj74aSHMo39xYmIH6wlbaCvfu96ErrRQ/ipzFBrvIjcstyd0qp74Lk
         NG9157fAox8FIMNr3C1s4bJiO2E2tSo1UJhRpAkd58RsNixf6poQqkWgK4P3YljJGuyK
         MXnV+EkXdOZlbKS+/XGJLj9zM2MZADanAIKUiC+gyEBv7OnOwZTpMfWbNhnNnnbkPTwV
         qyfFH/ePqIEuhEBunw8+puOvhXBrF0Goad2J1ru1VEjqNxRVDHecI8oC9MEcV8t2sbAB
         oUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXUlmUroxR8oQVLNNfLWLNGYc+u7EVqJ1eq3MyqhUNM=;
        fh=JnD9FQkIi4um0UgjwXVNpOVxbvg9b731+4l3UfDb5BI=;
        b=cuk9D24y1cKKlet5jSgSh4S6BfsAjyRfJ658C4r3PlpTK3KZW6sTh/nDFfiTFKDW4O
         mwpzpamJ0hPrKrBCIOtVfOIjDpPtgIP34/ONa2X8ZGVzIEd56jY8D8IVecAVlOBBFH+R
         X0QziZdHB1LEERUisDcTbWGfg1oZ49F9kVkV/pqsJ0XjEaPJnHXrSXaGahAYCxkd5V1F
         UzVpQmFBXAVdcLNj57DCjqf6HmfugBqJBdvigYFKOEcN6QKy2Q8BluhdOTyfBNN3yra+
         +Ns/XSzbomIUlgyF4p8Vs2PgoIJzs9VuXthIP0ArtIEwwGIsX3onomZIKF7NwXwW4+YC
         4eMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768986821; x=1769591621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXUlmUroxR8oQVLNNfLWLNGYc+u7EVqJ1eq3MyqhUNM=;
        b=RtOVuOHpZnpwE9+AMohmVi1c+T9RWv3YI9GEWSNAYRzsHnYlOikcnOvOmRrzcEDULn
         r+s4oJCI0C/6G8Qgp31jftfBwA8vKmU0sXthOJFLl9ZGj5fAaKhGUHPV3iftc2sE+1vb
         DCZ/hsCPVDu5g62rk+byejhxBwz9ZoWvNcBYzrx/BD30wDEs5oQ6H9gesYu4ceqfjWM4
         c5dGCbEGy+CTcWAaCnT2WvgMo8+B6hY7XufOsHG5XaeSdqIsWdKvauHtVTlic8XLx//Z
         6Q1U+1C4fn/L6ZpZCANDUFFy3imuSZ5eZwBHDMJTrWjH+FYRaaYgPK+EuRv6etds2afn
         Zscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986821; x=1769591621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXUlmUroxR8oQVLNNfLWLNGYc+u7EVqJ1eq3MyqhUNM=;
        b=uA4qnTIrjDhwde44ONjZBM1OlxF3BzE9V3mpSpKVmebSK8wLdjWb4v7AYyXRK/b6tG
         7HxZtbiCXL1t0LMTZMDExorMS1lBPM4kdSmRYzGVIl6aNYe/KnFZh/qgL+WMj5rmg+1l
         Zfl/wYaKgfOluVC3wFi7Wl0XHhTV61yjWr7umbvNMsCJ1lBNK9D5TmZaB4IW8Ouwzah/
         jzVTFdTDy38yWZMykx4FRvUFGsqjJVUpDL/upLP/k0OM/ZwyMSLb6XIJOGoo30fKH1mi
         VKS+cODTivDH0rSciXxjT65dYl/2yRhsqjoP/CrHphE7aacVKkAvaI3f6WJkullnAxcu
         OfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJFEqfvLtXXS4F79BzpLzWDCpIRVWO6ceMcHy4x7Z3zV6J91kGlB/u4Y+qZoigY9KcX010SdZAhHf3Cx9+9Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1NVuOF5Y8j3kL2wQk7IiFVRLzl/1F+AloXugNyiP/QzvWobF
	jQqF+iACrTqGeK1zCkkmGfjMopLGizrjwXrkjbjXRYzdRtBxq3uIh0+oi1uJ50DYriRgOGsGgb7
	HcIvc1kOjwKKw3ApTHDmO3MqSwt9REg==
X-Gm-Gg: AZuq6aJTCd0CFEIEKv/mxpkC8pYhvcPQhgWe9Sj0NYNn1izl+zZKAf6XhnANRTukSAS
	Cdh5Gf9ysn1sFodDFJsSPUPEHUbbZqpZaYGAhxJ9YQk6ZUG4fUGcI+SoIQringgBEqUYaDVmWPw
	ZsBCF3u8RP+BOIu1NNPFcvX0QvQSiizoiDI4Cmd3IEdC6O1TAaV4LVaEHjqenWtY+M89bpPuPiX
	bCst99SvaZga9f9uWnRWKO7vdiGFI55W1ZRPtOKjO+kq7k9vhhh2Y+g96FvBYRAmncMfw==
X-Received: by 2002:a05:622a:11cc:b0:501:40b2:453d with SMTP id
 d75a77b69052e-502a15fe7a7mr213507581cf.23.1768986820954; Wed, 21 Jan 2026
 01:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120091201.1718-2-qikeyu2017@gmail.com> <922f96dc-9093-4f7a-9cbb-32c230856247@linux.dev>
In-Reply-To: <922f96dc-9093-4f7a-9cbb-32c230856247@linux.dev>
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Wed, 21 Jan 2026 17:13:30 +0800
X-Gm-Features: AZwV_QhLo5IuWx5-uvEvPcL8ZW323VIAEzaMtY7jVEzXjNwHrypN1xXKqO2e_20
Message-ID: <CALEuBakUhnkJjXxKe6CUJzCdoW05r+XJ1Kdn2fH9crBsg4Fg_Q@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: wq: fix skel leak in serial_test_wq()
To: Yonghong Song <yonghong.song@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, shuah@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, yatsenko@meta.com, bentiss@kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the review.

You are right. Modifying the error path for wq__open_and_load() was
incorrect. My intention was solely to fix the resource leak when
wq__attach() fails.

I will drop the incorrect change to wq__open_and_load(), rebase my
work on the latest bpf-next tree, and send a v2 patch shortly.

Thanks,

Kery Qi

Yonghong Song <yonghong.song@linux.dev> =E4=BA=8E2026=E5=B9=B41=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=BA=8C 23:48=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 1/20/26 1:12 AM, Kery Qi wrote:
> > When wq__attach() fails, serial_test_wq() returns early without calling
> > wq__destroy(), leaking the skeleton resources allocated by
> > wq__open_and_load().
> >
> > Fix this by jumping to a common clean_up label that calls wq__destroy()
> > on all exit paths after successful open_and_load.
> >
> > Fixes: 8290dba51910 ("selftests/bpf: wq: add bpf_wq_start() checks")
> > Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> > ---
> >   tools/testing/selftests/bpf/prog_tests/wq.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/wq.c b/tools/testin=
g/selftests/bpf/prog_tests/wq.c
> > index 1dcdeda84853..b32e22876492 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/wq.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/wq.c
> > @@ -17,11 +17,11 @@ void serial_test_wq(void)
> >
> >       wq_skel =3D wq__open_and_load();
> >       if (!ASSERT_OK_PTR(wq_skel, "wq_skel_load"))
> > -             return;
> > +             goto clean_up;
>
> This is incorrect. Just doing 'return' is correct. Probably
> rename "wq_skel_load" to "wq__open_and_load".
>
> >
> >       err =3D wq__attach(wq_skel);
> >       if (!ASSERT_OK(err, "wq_attach"))
> > -             goto clean_up
> > +             goto clean_up;
>
> Your patch is not on top of latest bpf-next.
>
> >
> >       prog_fd =3D bpf_program__fd(wq_skel->progs.test_syscall_array_sle=
epable);
> >       err =3D bpf_prog_test_run_opts(prog_fd, &topts);
>
