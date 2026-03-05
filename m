Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30530364EA5
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 23:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772752228; cv=pass; b=HpY8lA+JYaNvI9svyUiZrQNUBStHj/ytAuGzBn28Ry0UfVcwomxQAKa3qONjFV+ZzKYja8qLb/yLohqXq1DqORStxvVz2VosNhK+v8Nd9C1MMuH4ylFWLhZYNLt6TvfQCCcf5FiJu5abevMjUHN5BjAQzuOMBQv4ep/rAd5S3PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772752228; c=relaxed/simple;
	bh=IvQTQSXkN/lzrsH+20vLWipAyAWK++OMIxCINlKGieE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgdtuhxOA53MEQMiI2y8+zbr28lU4h7uSPqi373w0WbBOJJC+3cJdjDvRtOFKKSXr6dxO2fmB01M8sYHp6RD6/OdkHhoJi0sbjkVVQT9YCU1O0CWv9k1nqlYxO2rLLf0sJy/w0bumqIrT6JhWsDSPBib+J07bQ+LtIIzwNLmMZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JD1x4dJS; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JD1x4dJS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae5423b02aso35489625ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 15:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772752225; cv=none;
        d=google.com; s=arc-20240605;
        b=Txv3/3Fmkl/Fntj8r0SpJLbXR2LrpQwGkva02i9rj0PklR/zyPw9bQ1rd6rDvPffgt
         9Nex5RNec4wb7nY/hwUAkHL00urs+Y/v2LLQcFyzfMqVBXLmJ3SAHAdGTh9Pu5kxmBkE
         PF5fy5ur1/A2mb7N0XUAL8UrTHdRutW/rmKI7XklIuoL1adK1MhEWpkLFnV/okxgXQ1l
         BprsRM+8155LB13ctIMSUeIPQG898VvhY8A+JUBP5GP7A2Jbfucz1AU+sYNAxVECraqK
         QfniPnzOvQqJ1YoF4VDpHNmi7IVzS56L5Q8J5A57qDU6ay8F5eAQTk5Lu4xoTkp/H5eF
         F3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oHYogqidDxqmpzWYl8t1n7jPajQf/LegJQLqZ82v8Fk=;
        fh=pUsEXy8SICtS7ig8PgJfvVOjzhW3oX3lCNgx/InyC5k=;
        b=Q5pleFz/ooRsKKSaf4QP/14tbt4Tkebxht+5TAAlgpfH8so6rFyjb44WekJXDj9hxP
         K/n5VB4oJK/HEKiKDN++uw5V7MXrfCi07xl18DJu7tvhUhH/eP8WX55rWmrVz0gYO4s6
         gieVU+iF5LsWVt3Q+euVPMpL7+gv6vP2OhFmcyczMxPOlteW3fEsnSnecvrdatn3vlSY
         lWeKXp15+XDQ8WkEh9kLFxZZYfRSA9G6ngpIzaLcL7UpF+Y1R4OpDUxNXvDgcbdGzafT
         qyhJmXNDxJlnXBokQcvDFsKSLrtTOYbarF5rwwfwaWkLX8rCoXcDBxwu6bAg9roT1n91
         wAVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772752225; x=1773357025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHYogqidDxqmpzWYl8t1n7jPajQf/LegJQLqZ82v8Fk=;
        b=JD1x4dJS4Qbmcnswx2cyDf7QNIak7gxnG2Ne1qV1qq3uJ6yeXeaFGuT/blFD7pb5O/
         dVKmmnC/sYK9FAcIIrNTMk7CODK7Mi7lldH1zO0YfOE6JmOHAzUT3NzFbufOUKvGYSfH
         qvX3uaXddurNBATsH/XnVkkGcvQUIgp9JI1Lwv2tfu50XE3sf6rIX8PzxLZWpTKAokgT
         qhn+4DkK6ZojgPCkrLK7iMydUdwXtlH3OduD9PSlqfFxWIQk2EuaZaaNHzXq8yNCCMhy
         /kd7oajPe8wtEOotB/Da5+7jzwdH4bEdJ1w23GDbvkKKYF+o8LD4zRh4fhpK8545sBfn
         RXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772752225; x=1773357025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oHYogqidDxqmpzWYl8t1n7jPajQf/LegJQLqZ82v8Fk=;
        b=AyKrRi453k+E7Yd4x0jWt447ImKisGp7JIKqXr3go8NKhYERyVdwzqJMtSeKV/AkAW
         0MPQNdMW11XRPmWgXVzzTa4CDQ/t0yoBFnVPw2iU8lB5kNkF66nsjcwa79hgICEa66lh
         5R+1W/4/tZ0sKdwqADdPd6Up10p9Xc1VZ9Bb4pW8ir8Dw+l4Zimk9NMz08Siib8Ci1pB
         okCuwPXch6vvTyBEqgMLX+zn1DBygJ/VW3qIUxMUA7zkaoCM085X/xl2HQLpNVZaLJYv
         nQBzFzq5vbhPOT2zaH85h2PF+1dW/eohp3vZiWP4RI/+Z+HBPu/vfGtSm9Ln8GA+W7zs
         wLzA==
X-Forwarded-Encrypted: i=1; AJvYcCUKwLNj5RP4XHkUrPpHqBFgTdo8c0MaPrSodWZvqYUWyMgx4edXnaHTR/I2WZYcmgaapFCZ9UVcmGmoXzdj7s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj6ONh0JW+5YUy6zlIusFOp4WMEpumFko+m6oA4hRXs1BsD5te
	b5EfOQuDzFnuYFpwTMCfcKYnZKO49zy/ZviQSpEc3c8X2/OalUgoZfjq0i6kahxx41rCtBwekyZ
	3aTfpstQLQSGeoP9DldDfwPxGPVhcuEU=
X-Gm-Gg: ATEYQzwxBATBzi3ONyl9LTqj7ZNTGaMxryHDyd3vAACVZYECW6K+x4K7tlIqkh3HkOF
	KtuwyIei8S4nnEFU3X6q6fNZg69SqGc0kdzaRlUS5ZSxFCK/eBwP0nRNaEvj3FHXKi/yX3MvTdp
	JoZ/O+viIhiWNak/H/4F066nvISZefun2xiFyndNGtYiwEWgY2pyIkiJHedquyEn5wCfAW9n1uU
	yrk+FWS39SijOpI6cPyodTF8uzHuHxY7RYd51OhHFN/hA/XPkGRpubnQ6lKJ1TSBz9f2Ej20r1z
	drZVXwB7jSU7cxPW2GHF6/CHWQb3CEeshw==
X-Received: by 2002:a17:902:d54f:b0:2a9:e8b:5326 with SMTP id
 d9443c01a7336-2ae823a4d58mr1997775ad.23.1772752225422; Thu, 05 Mar 2026
 15:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226093132.437206-1-sun.jian.kdev@gmail.com> <20260226093132.437206-2-sun.jian.kdev@gmail.com>
In-Reply-To: <20260226093132.437206-2-sun.jian.kdev@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Mar 2026 15:10:12 -0800
X-Gm-Features: AaiRm50Poi9eBlaCh0RKyEPdsL-FSf0gcFHcAZ2CKsbcpppBDOcAC4mBr8B4WFE
Message-ID: <CAEf4BzZ1B54Dsu_X4dyu6OH-4heM=NvWy6S6E6ayz2eWpwO3qQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] selftests/bpf: probe_user: filter by pid to avoid
 cross-test interference
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 1:31=E2=80=AFAM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> The test installs a kprobe on __sys_connect and checks that
> bpf_probe_write_user() can modify the syscall argument. However, any
> concurrent thread in any other test that calls connect() will also
> trigger the kprobe and have its sockaddr silently overwritten, causing
> flaky failures in unrelated tests.
>
> Constrain the hook to the current test process by filtering on a PID
> stored as a global variable in .bss. Initialize the .bss value from
> user space before bpf_object__load() using bpf_map__set_initial_value(),
> and validate the bss map value size to catch layout mismatches.
>
> No new map is introduced and the test keeps the existing non-skeleton
> flow.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/probe_user.c     | 27 ++++++++++++++++++-
>  .../selftests/bpf/progs/test_probe_user.c     | 13 +++++++--
>  2 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/=
testing/selftests/bpf/prog_tests/probe_user.c
> index 8721671321de..280dcdb5ddef 100644
> --- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
> +++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
> @@ -20,6 +20,11 @@ void serial_test_probe_user(void)
>         struct bpf_program *kprobe_progs[prog_count];
>         struct bpf_object *obj;
>         static const int zero =3D 0;
> +       struct test_pro_bss {
> +               struct sockaddr_in old;
> +               __u32 test_pid;
> +       };
> +       struct test_pro_bss results =3D {};
>         size_t i;
>
>         obj =3D bpf_object__open_file(obj_file, &opts);
> @@ -34,6 +39,24 @@ void serial_test_probe_user(void)
>                         goto cleanup;
>         }
>
> +       {
> +               struct bpf_map *bss_map;
> +               struct test_pro_bss bss_init =3D {};
> +
> +               bss_init.test_pid =3D getpid();
> +               bss_map =3D bpf_object__find_map_by_name(obj, "test_pro.b=
ss");
> +               if (CHECK(!bss_map, "find_bss_map", "no bss map\n"))
> +                       goto cleanup;
> +               if (CHECK(bpf_map__value_size(bss_map) !=3D sizeof(bss_in=
it),
> +                         "bss_size", "bss value_size %u !=3D %zu\n",
> +                         bpf_map__value_size(bss_map), sizeof(bss_init))=
)
> +                       goto cleanup;
> +               err =3D bpf_map__set_initial_value(bss_map, &bss_init,
> +                                                sizeof(bss_init));
> +               if (CHECK(err, "set_bss_init", "err %d\n", err))
> +                       goto cleanup;

don't use CHECK() macro, use sproper ASSERT_xxx()


and for email subject, stick to "selftest/bpf:" without extra
"something: " after this

pw-bot: cr


> +       }
> +
>         err =3D bpf_object__load(obj);
>         if (CHECK(err, "obj_load", "err %d\n", err))
>                 goto cleanup;
> @@ -62,11 +85,13 @@ void serial_test_probe_user(void)
>         connect(sock_fd, &curr, sizeof(curr));
>         close(sock_fd);
>
> -       err =3D bpf_map_lookup_elem(results_map_fd, &zero, &tmp);
> +       err =3D bpf_map_lookup_elem(results_map_fd, &zero, &results);
>         if (CHECK(err, "get_kprobe_res",
>                   "failed to get kprobe res: %d\n", err))
>                 goto cleanup;
>
> +       memcpy(&tmp, &results.old, sizeof(tmp));
> +
>         in =3D (struct sockaddr_in *)&tmp;
>         if (CHECK(memcmp(&tmp, &orig, sizeof(orig)), "check_kprobe_res",
>                   "wrong kprobe res from probe read: %s:%u\n",
> diff --git a/tools/testing/selftests/bpf/progs/test_probe_user.c b/tools/=
testing/selftests/bpf/progs/test_probe_user.c
> index a8e501af9604..4bc86c7654b1 100644
> --- a/tools/testing/selftests/bpf/progs/test_probe_user.c
> +++ b/tools/testing/selftests/bpf/progs/test_probe_user.c
> @@ -5,13 +5,22 @@
>  #include <bpf/bpf_core_read.h>
>  #include "bpf_misc.h"
>
> -static struct sockaddr_in old;
> +struct test_pro_bss {
> +       struct sockaddr_in old;
> +       __u32 test_pid;
> +};
> +
> +struct test_pro_bss bss;
>
>  static int handle_sys_connect_common(struct sockaddr_in *uservaddr)
>  {
>         struct sockaddr_in new;
> +       __u32 cur =3D bpf_get_current_pid_tgid() >> 32;
> +
> +       if (bss.test_pid && cur !=3D bss.test_pid)
> +               return 0;
>
> -       bpf_probe_read_user(&old, sizeof(old), uservaddr);
> +       bpf_probe_read_user(&bss.old, sizeof(bss.old), uservaddr);
>         __builtin_memset(&new, 0xab, sizeof(new));
>         bpf_probe_write_user(uservaddr, &new, sizeof(new));
>
> --
> 2.43.0
>
