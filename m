Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393334F247
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607210; cv=pass; b=l9NNouyEbdnS67UaDhLH03PvuqHF18oa6mFTbv3zEh6uZJIELvniKAknHAiYTWYWxM5auL8jEV2Z1mXV4BiY9suOLKkeWNY3v1wfDbbSqoX2LWvYdYQfJLXJkrjMQzsFmsRs2DeH3YHleiG0gwaICccODv22qZvyBqVyXDfYtA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607210; c=relaxed/simple;
	bh=UfmsZp708Ijy54fCK/57bC1uRgIZdRWU2UrdakwbYmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOKPhs/g4Kmwn5Wh9RSrOgVTqFCKeT1FGBPPyUsiv8inwzSd8uz+uXpJvjBLENS0YWcE3B3JmEVBxBgzTcbG00gAie+1akPF6ARjUSTVHzp8jlNA/Rm+mAg8mZgPjHStEgNipz+HKsXULo4PAm3HVYPAIpp5H8Z/5Oc/v0nvFic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9Ja+iYr; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9Ja+iYr"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so106511cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 18:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789607206; cv=none;
        d=google.com; s=arc-20260327;
        b=RTmvmJ3v/6/B5BnhTBQShroDstGDsrTxVKgbu3cQj01e677gPmqvqJUVGFCjtegeXw
         c1pu4n1ENJh/79E++RLmhYmiI5Nr6pBZL88pAwPDbmJvdaymWut2OkagvodJDN8W8Fqr
         Vx681zMEI/xt7PpPvTzOx+gl7Ck0j4LGQfeWCV/bdE73wh8+35xZ4pAwIGxesFe5KFhm
         cYfsDlYjpXa9V1u5Y/4a9cQgFCFb3ckhPHXH1W5zcR+FAfJDSxHWXdREcHVo8s1BWSsH
         dBiZNjjpnQ8Ixqzhb7rhmRnWypdcbLN6U8SeFUKptZM+p+82/YzZ7fuy6ZG87dK4XdUQ
         zDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        fh=4tiE8iGzGnwDotUv0phBiVls31yAmNESmxh0pGnyRQo=;
        b=Naq4X4KPmtG4CCrwaBZMLUzdJr3FgTHePg5iNkzP66k76oSqH2ZIXa3AKN1WD/vD3Z
         SpT9Zand60A2K5uBgqY6DALeipU9u1heLNXyli4sWJV/8w+P1vqRaqgIwUrjSzHTMLRq
         PG8aByBfhfF4IDWTcLobt0NtCZxwfGxcMAz6AoOHFI26awOYmKTDlEwVkIOCU+rTsGIp
         G37rrIQFmQXE/HBmO/Sam5DuZXHPRh94Qgb4Wl8936v+bcDhtY8k2vbQBE3SRFduCwF7
         jOMxshETErVbNx03udNoK1egV0oeYo3O6ASyTSsPV1maG7V9LhNwGfpOzVXqtRNiBPTm
         eIKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789607206; x=1790212006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        b=i9Ja+iYrTGq5fF4BO36dSNnLpRptWxPGLH6SXtT7gj+Cw5YBVAlrObueq2Bt18qX2/
         9XQHZ1nQ7pWh9tvDWO8OhlDb13n2yZ7NIBqOJ/JC6/62WMsCRYPXJhUr1jBEkm6cMRAh
         6uloYJIwr8CJe+FdYE1ADVB2eOnY34mx6LPXcrj0DbK+hggtBMydfwKXvmQJwyHRj0fX
         Ud6UFw0+aP7pEp8vRYK8qvaC4snzE+wXA7X07QqrwAqZkGdIYECW9/qoE9PkACD4LKsd
         RSSj8bydQIEUE9qworxEVBDOMpCmqhckOTbsou8+v+/exJQH71VoMW6+QhY/e6DePVgQ
         nVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607206; x=1790212006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVqnTRvwlJyUC6eESGjXw1fA+M9qex3i/sfxeqTQDo8=;
        b=PK/HfVzqPsgVgaLPjtSFDabvQe9JfgP3BolhCLM9MASjmYTjxKPBIQCg/x4Mg4Yg4v
         vcPF/4bJRamAq9YQNDB4jdTKvo0xGn70Qe1QXKRI1Tamb2rWLXDX2zxm35/wZxrAA4kG
         EVduPfDWaW8xVm2hlYODYZvRRvMgdg3vIVHQFDV9Rwgl2ZIJSuDIPjwaRDaw7T0cHx1Y
         emkpnlYXQHdprpXEy6LIezOz9tATmtSNO6akZSsaW8ARxTJp0WKHw7TRQb/lJgvNDlOX
         f8xUKt0/R/yaj2LDd/ETCDiqlrOpANhnX/boDKqeAknjlkwEWyr66c+is33iuKWlobqk
         tKig==
X-Forwarded-Encrypted: i=1; AKwUvBxcqAqGtv6htZVFexOd0D8ZrIHH6GYvxlOBDs+VN4EcCcNK2tb/OZ2Z7AZtLr3Z8Dq+/D1+DkE2a2jmVHJZPGY=@vger.kernel.org
X-Gm-Message-State: AFuF++mvNf7RYP7cyEUWAj0KKgLR6WHeUxcOZsNgwED6CxC3Ftmyto+G
	/t4TlGYl9qEYwhwxRu6AB968BLh+8frQuVeFapd+mfy0Dbnv942PXRF6hR7wi8HHmukevUDxz2W
	+Vv6KODIVymuJvp1c3ZtMO/oqoPJwoyoInZU7Ht4AVy6bPtn5i32geg==
X-Gm-Gg: AYBFou13SL85inig5xBIj1ga/rEHom9uD3GzsKD4waEJAfuMPvrqzP0rOigSv6T9HVP
	8KySP3JtVRHC4lf0TJ7MW1eSX/gxWF5pWhXTfytuaGp1Mp8od/OcllH4K1Hc6mXXJH2otfXydqx
	KoCSTNSIv9c/lqSFxu3vtQZi59lf1CoU9daDj24/NY8BKd30UwClsPEtCK02qaLy4jOCzydZgiC
	Gf8ZGTO9O1kw7k4Oy19+tf0xVxBhnY1MIa7FC6gL5LVFvV7gZvJsz7jspDrdBdygsTH5/qwSuPV
	OZvOb4qptgEgh03MuotNGYDHnLQFxV+N9hJm4AtzZhCAVWwwX+ny76LTGvh9VZkOZspuW7YSzvw
	CwVlbFInkNh8gKZio9bt8DdugtlYhcJwpitxenNQ=
X-Received: by 2002:a05:622a:997:b0:531:2284:4b09 with SMTP id
 d75a77b69052e-5328f60023bmr5751171cf.11.1789607205250; Wed, 16 Sep 2026
 18:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909042433.1775591-1-tweek@google.com> <20260909042433.1775591-3-tweek@google.com>
 <424ef244-f0e0-46e7-bc27-fffee80f348d@linux.dev>
In-Reply-To: <424ef244-f0e0-46e7-bc27-fffee80f348d@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Thu, 17 Sep 2026 11:06:27 +1000
X-Gm-Features: AcwNN1UtZ3hvthqV8zrZe_2I0a-BHp5mZjUvG6bkreK5qsDS51UGzgeJ9gYHVWk
Message-ID: <CA+zpnLeRmo3RTAxmMUHepm+kmpG4nw+z_vhR_kNubqEEEAVxbA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] selftests/bpf: Verify program FD after
 non-autoload programs in lskel
To: Leon Hwang <leon.hwang@linux.dev>, Quentin Monnet <qmo@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:49=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 9/9/26 12:24, Thi=C3=A9baud Weksteen wrote:
> > In test_global_percpu_data.c, dump_percpu_data is defined after two
> > non-autoload SEC("?kprobe") programs (verifier_strncmp and
> > verifier_snprintf). Verify in test_global_percpu_data_lskel() that
> > lskel->progs.dump_percpu_data.prog_fd is properly populated (> 0) when
> > loaded via the light skeleton.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > ---
> > No changes since v1.
>
> The Fixes tags of v1 are dropped.
>
> >
> >  tools/testing/selftests/bpf/prog_tests/global_data_init.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c =
b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > index 7c539cbcf3a1..ebda60200b71 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> > @@ -214,6 +214,8 @@ static void test_global_percpu_data_lskel(void)
> >       lskel =3D test_global_percpu_data_lskel__open_and_load();
> >       if (!ASSERT_OK_PTR(lskel, "test_global_percpu_data_lskel__open_an=
d_load"))
> >               goto out;
> > +     if (!ASSERT_GT(lskel->progs.dump_percpu_data.prog_fd, 0, "dump_pe=
rcpu_data.prog_fd"))
> > +             goto out;
>
> When the light skeleton does not skip the non-autoload progs,
> lskel->progs.dump_percpu_data.prog_fd is 0, actually.
>
> But, theoretically, this ASSERT_GT() is not good enough to prove the FD
> is the correct FD of dump_percpu_data prog.
>
> How about running the iter subtest against the lskel? Factor out
> test_global_percpu_data_iter_fd() helper first. Then, add an iter
> subtest using lskel.
> When factoring out test_global_percpu_data_iter_fd() helper, pls change
> 'do { } while (0);' to '{ /* no-op */ }' btw.
>

Thanks for the review Leon. That sounds good, I can implement these
changes. I am just waiting for Quentin's feedback on the first patch
in this series before spinning up a new patch set.
