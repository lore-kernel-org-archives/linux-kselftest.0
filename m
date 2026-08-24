Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532638CFE8
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601881; cv=pass; b=Xk+WJzcEEpUopGhydlx7wVOFH/wYAVFZHmLaUr3BrRGZgjIuNR7RmL+XtYS3FDJSGNH81fV93uedBlN/9VNFbLdon8FCkEloPY5FMwqU3I3YXf8PY0wNjANz3GyFY0f71xHfouRyrbZ+qP5njPOmlRl3+2glbQa7EUYF8yJa/tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601881; c=relaxed/simple;
	bh=ztc7AZVbqLvil6lnkmXQ02g+FumferD9nAfzbJDieJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCbUchFHH4puGTVyJyQA/1HklXEBUKGsylPqtBpvi4n5vT5Pf2n9CwNwNv4Cu2duK4EAIZ1D0BXIB+5FV8az/tUHYbR7+BKEFwrHSqxJer1MeRfxcBBY02zXnUL2WLUV6n+huX6813u9GeqaoHtfb+BMT+SJWth35myFlC8T6wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5wAx0J6; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5wAx0J6"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf433a99so3788512a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787601879; cv=none;
        d=google.com; s=arc-20260327;
        b=d8hfpskvINO3Csri8Xnd6idjePXDcCUiPwNcY4lRRI0hShSOlBJOV4EAXCZKfyGCx7
         j6VDL/XK48cg+EcbktEzJ9Xtpxf8LcdnfYHWAlS2aoNRp6/LCiJO0arqWDcbu1uRfjTw
         TayIhmUv1y6H05MIBiMofqOjgEfxcly9IO6bXwTF4oLopUj2Vxfy4TXjerKRvCoSOPwu
         Duh2zwl8boZoDXR7PzCewdBmwL+qjqBMnhpyGP+lm3+rYkG4YdUNNNkISXK0U0dNs9B4
         sD+LD+cFTpDwoPg/C5UHmf8ead4gkzZxcjXt54euRqqFa8es3AaS5NrfkR+4agv12UHJ
         8pQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGyM7k/N8T57GToXJh7KwKOn+OZJUTS8V18VDRU/6iw=;
        fh=Ld2nRw1zqTT42ChsAJLRzyQUHAjMbSCKYiiINHFcW8g=;
        b=cEZMlSNpC+JsQVZdoYkHOZy2WjZIOidr58iRzivbU4JRgKhpu6deqpZKYz2RSUnT0P
         SV9QobZEViqFl1+tKyvXxZD+GtQ8PwxyUzkBE+21taKuX7C04IZHLA2pDUUGWaZp3W8E
         UH8QQcpFhL06DBUxwKGGJtwQjgoxJCnMqodN61EqnvnWRubp6UDwhceEp+PVAIu3ciso
         sxrDj1f4Wd2sXmu9J0CcIMDRBvaXEpjTnM+/S63tVubSWEm4Y9T5u5WINsk/wJSkE0Qu
         4iIN4U1Ugcj6MPrZVXWSXQMn6QDu+c6bgGv2htzdUISUC+T7nkMsG2JVBuUL+cYWMx2y
         2hXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601879; x=1788206679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGyM7k/N8T57GToXJh7KwKOn+OZJUTS8V18VDRU/6iw=;
        b=K5wAx0J6UuK2PzaQ45AB8OghiCjAA48kc20vILrEyxz7AQ7zXpJdajQ140kxh4r9W7
         vWBSR+jYsgV39MxZVEGAJ6gf+70/5eNjhPGW++ZrIebSCyA5ljYdT8cNH4uk45pZh1a6
         lUhe+TstSMXImzqtgnfmuGf60t3oWBCqoi7yNMgFjb6feHfkjJGR7a5g/GZsTGE565We
         rtaiDo9BTl7fqymwDurS7OZDAY7V1Dwu49eFkGgqsLk8jjcP7GD20uoWLyr9ljdDoL3H
         ZK8YlO0MXScJkb+MB5cGipFEt9XM4cjFc73Mo19j/WDBkrj1MyGHXpCzIKz+eRVQppq9
         sGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601879; x=1788206679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGyM7k/N8T57GToXJh7KwKOn+OZJUTS8V18VDRU/6iw=;
        b=sNFQh8I7qwrGkg9CbT390lRdBuHg9HjoVArS+uqhXzxw3DVbqrLXjT4oJyu8i3m0M2
         kyeEeVf8F9Vu5E5PZ/OngHKQ9t1XyzHOuXYdLi0wIQZsn+sKUQ3/re3iTyXS+QNKIe79
         qGZErIHci7QFCUyswpST+rJ7isMi63XSqUEkkADr5XwXqQ0mcu8jTl1bmhUc+8nofYT0
         3sDR7U4qLXy3aVBiNBEk1v8tG/MwBZU3gqA5vZGd9zF1L0KCvdRQEdT9EvxVW/RRbAEi
         SLiiQ8nXmv58xa0aD4Re3cyir2RQ53x0x1Qp+3qr4WjKB70Muj0SGhmoJxhMK0E0NObS
         YPxQ==
X-Forwarded-Encrypted: i=1; AHgh+RraptGEX3qfubEo0V3r0AvCymo7/lr3kJtrKlyP5m1fAV1MT8wQQfmdeZq2XKwnD3l4Yb7XsKpinAuJzifIuiA=@vger.kernel.org
X-Gm-Message-State: AFuF++nPBVKa/75toOOLA5EFNbb1UOVA7r+82jXH2IpNJ7bMJOjU060P
	aD+a7fcs6zo2VBp/Vi04+MdoEEyp7xen6cMXvSlfy1JZ6diq+KGL6SxcBofvI4i6BXiBaN/JnUb
	2r6ppfzJI3JJB4S2fQ5VpMvwMEIaX6Ac=
X-Gm-Gg: AR+sD13ek65nWpt3HDnpBaoVATDdkFPasA2Xgtd72bqT5pn3sGdK7FPUsMkFV3xXyZM
	2EWsBrX0L8yS4Fr0K4Q1isCCaJdVrzoA9jIQUUupFyfdXoWwmHs6HAAVH7iluVu9oao6HDcD90z
	C1XI7B2hfbPtNu8YkzcOxGarOuKABjekhDBqGWxyXstDK8I++jKlTkrRv8acOWzg+YLWF/Vquir
	Mh+oagLA5pbKou8xlvrgkCeQjjjwIFCdWKvfM9AyVA/muSDzzVpsq7iO9Yy4iSfEYh6sKCnzOST
	a4y4Xo5l7u+uN9KLY7CFOSbPkdhSWiGQJUnQHB5tXSG3xtztvJL5vSnlNIHjTD1ru/T1K+nGTN0
	GKk7yWiN63vOjqsqnKzEaBDFkkGwLrjWN0av62eoaKg==
X-Received: by 2002:a05:6a20:be8f:b0:3b3:216b:2743 with SMTP id
 adf61e73a8af0-3cd9103c931mr2714237637.4.1787601878895; Mon, 24 Aug 2026
 13:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818153202.90714-1-leon.hwang@linux.dev> <948e7ff41f942519880f9789faf6ca8ed9d0e2cf42eab5b9e1567ead5367b830@mail.kernel.org>
 <a1b1c6ee-ad7d-4972-a15b-f567e7787a6c@linux.dev> <CAEf4Bza6X9SZmnyqdZDFKJG5nWchuaEuFyC-MbuzQCuZ+dwq+w@mail.gmail.com>
 <90bbc900-21cd-4dfb-a058-13930378052f@linux.dev>
In-Reply-To: <90bbc900-21cd-4dfb-a058-13930378052f@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 24 Aug 2026 13:04:23 -0700
X-Gm-Features: AcwNN1W8by1xeiM2nS0uP-BSqlnh6x8cTG7aWUTePlGmeIOdHofEa_QByHGxHoA
Message-ID: <CAEf4BzZY-C3WtoRkdi+U7XFAMv59JeJ2R0yMi8+FGM4sLTsnQQ@mail.gmail.com>
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

On Sun, Aug 23, 2026 at 10:02=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 22/8/26 01:58, Andrii Nakryiko wrote:
> > On Tue, Aug 18, 2026 at 6:44=E2=80=AFPM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> On 19/8/26 00:15, bot+bpf-ci@kernel.org wrote:
> >>>> diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init=
.c b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >>>> index 5671c31085cd..2b69290bcc3e 100644
> >>>> --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >>>> +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >>>
> >>> [ ... ]
> >>>
> >>>> @@ -236,6 +223,57 @@ static void test_global_percpu_data_lskel(void)
> >>>>      test_global_percpu_data_lskel__destroy(lskel);
> >>>>  }
> >>>>
> >>>> +#define PAGE_SIZE 4096
> >>>> +
> >>>> +static void test_global_percpu_data_map_resize(void)
> >>>> +{
> >>>> +    const __u32 desired_sz =3D sysconf(_SC_PAGE_SIZE) * 2;
> >>>> +    struct test_global_percpu_data *skel;
> >>>> +    const int arr_value =3D -1;
> >>>> +    struct bpf_map *map;
> >>>> +    int err, prog_fd;
> >>>> +    size_t data_sz;
> >>>> +
> >>>> +    if (sysconf(_SC_PAGE_SIZE) !=3D PAGE_SIZE) {
> >>>> +            test__skip();
> >>>> +            return;
> >>>> +    }
> >>>> +
> >>>> +    skel =3D test_global_percpu_data__open();
> >>>> +    if (!ASSERT_OK_PTR(skel, "test_global_percpu_data__open"))
> >>>> +            return;
> >>>> +
> >>>> +    map =3D skel->maps.percpu_arr;
> >>>> +    skel->percpu_arr->arr[0] =3D arr_value;
> >>>> +    err =3D bpf_map__set_value_size(map, desired_sz);
> >>>
> >>> This isn't a bug, but since the guard above already pins the page siz=
e to
> >>> 4096, would `const __u32 desired_sz =3D PAGE_SIZE * 2;` read more dir=
ectly
> >>
> >> Will change to 'PAGE_SIZE * 2' if the next revision is needed.
> >>
> >>> here - and is the unguarded `#define PAGE_SIZE 4096` preferable to th=
e
> >>> `#ifndef PAGE_SIZE` form used in sockopt.c?
> >>
> >> No. PAGE_SIZE must be 4096 here.
> >>
> >
> > can you please elaborate why do we care about specific PAGE_SIZE
> > value? it's a bit weird to guard test based on page size...
> >
> It is to verify the mmap change in libbpf's bpf_map_mmap_resize() for
> percpu data map, like those subtests in global_map_resize.c.
>

this didn't explain much, but I think what you are trying to say is
that this won't work for PERCPU arrays with PAGE_SIZE=3D64KB, because
PERCPU value is limited to 32KB today, is that right?


so maybe actually model that in the test itself, expect -E2BIG if
PAGE_SIZE > 32KB or something, and otherwise check the resize?

> Thanks,
> Leon
>
