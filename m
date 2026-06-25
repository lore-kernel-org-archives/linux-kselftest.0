Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE63346E56
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782418847; cv=pass; b=ibchPmihXJs7cu+n0cahNAxobZLS4fN8NS7W2gvHYj23ZYTsAFWldQMIDzkO1B5btQCxcOSkKibSUrg1JYmiEjVuNaKjOOWnytmeRlUwpWAUSwZtNyTSYDIUfX4hJj1ug3T67BAci8E/7wnJ4632XNX7soXqLxG898EkVQiyNlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782418847; c=relaxed/simple;
	bh=p/iSApopAQ3Rwu8YiVTide2S0Vlj30HQ4DO34T4rOOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGWDk+8qxbDorkqhrgPKmY9zMXI3m5fOs4y/QmlujxRjwEVeFys3qLa4j/pcDWAxL7ZfIkCPas0HifGylv1VgJTayB7s8EsoIIHZWiXb7jBrvVnrWMtgr0Lii3MczYHBJJ7LpPdzPveYUNQl7KO33dWSZ+Vkfiw3slglsfbSsro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=himj4Fqe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nW9rw2dv; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="himj4Fqe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nW9rw2dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782418844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9smn6tBX9r8BEBMzWgVsnmCOgRodWWhLzrgqGf3QyjE=;
	b=himj4FqetWzIsQrFkeCy+EPc0t5+BHf3MgG2aQz/gn+uRohTLSJ3qdGu5kJGce3J4I5aTM
	A0vVGTShElrMdKn4oxHbd7+hz3AHaprZSOCSf6h2Kn23sdJIpi6mgFa5yv9+VUuCsftgs5
	Fp6FzaYKuPUMXodgqapo597H9IFbXbg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-h-BpO8ChOc6PYXQ52mo2rw-1; Thu, 25 Jun 2026 16:20:43 -0400
X-MC-Unique: h-BpO8ChOc6PYXQ52mo2rw-1
X-Mimecast-MFC-AGG-ID: h-BpO8ChOc6PYXQ52mo2rw_1782418842
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c081f1976d2so16975166b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 13:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782418842; cv=none;
        d=google.com; s=arc-20260327;
        b=fL734jfLnuPBN4eyV6CbisrGb9+qb1/r0bIb5+zbbX0xndxD604dfj3wyMkpmjxDgD
         SyHgA4jxlPkmtZRDhAa5BPYECuVZlrLZO1ChbMRuO+nPnGVhG7bk+asf8+gxmTTe3xt6
         r9M/xg4zDTRVSX2FWCksOTjzRRupy/2UpI6lYGluSZOnbjOxDvlgT3WR6+gjEkL2PQI/
         2ElOElO0c7XTPrg7f3qMpceihOKNunmyY/tYUp6V0oR6f8OaAVccwHCQlrfFzSPCIP5g
         h6G6RGYvbG+mK9yOLAc69n4sp/hO72AoHjiKiOrlLNHeuCrK/LpyAteWijSQuoGx8mHC
         EujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9smn6tBX9r8BEBMzWgVsnmCOgRodWWhLzrgqGf3QyjE=;
        fh=4gdWPEjKN3fnVq/xRilKp/Vy40PHKC0o+MuFjaQ7yb8=;
        b=ieUaaCzZ00FuJ9uqAxX1r3TN9Nx3a2sIRwkW9fKNeDqzO7xCDmlYUhAJoNkWLbY+Va
         cL7hdcJN8dN7JU9OQujgKsnoltKuKo4kZwL06nA82x3/H9loL5JE6iGNXi7onrDbmMLB
         vz06TA9sJIBjy1FFwIHs4JwNG/cqysjYCvzCnOj5w6wLrAx5ok/aUkyca6MlLEStACzV
         La+I1xyrp6Zz4kTYtYCXw/cg6yPdUmh5sf11g9d4qCaK+i8aJxrwTk32n8CFRN5Mh7p0
         lXPc0e9yXd4Kci3qmHgYs1IUGwUqohKqeFgc9TE6RDyF6YgUaHqDNW8QMJcpT4ex9Yne
         pK7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782418842; x=1783023642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9smn6tBX9r8BEBMzWgVsnmCOgRodWWhLzrgqGf3QyjE=;
        b=nW9rw2dvOFRW/IUzPJ6TI3rRBlTusGN22zJCAlaxWzO+43Mdx4xj6TuCtFzxe1yqBV
         hoUdRaeNVL0X0D22QR20xjBtdDkd6aUYQZqnxRLcsb1WjTKrD/UgtX/k8xCQ2ec7c/y1
         Jg+25hHUbVi6tE+cgrjjb7gQ2+DmcmVf5pHd0Ji7qqisv1WfqjHiIMz1CrjqXbAnn5CU
         FSb55j+www+kZ6QNumX4dF1FqYFspDxhHjb98GKRGvr99LJzeKichechTqhMuPp13Jzf
         YLu539smdodBUcBdrzbZvJQOYGIGDM38p/LGxy5JhAW7/doyTLXGcIDhdSTNBNxJnhiH
         aQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782418842; x=1783023642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9smn6tBX9r8BEBMzWgVsnmCOgRodWWhLzrgqGf3QyjE=;
        b=C5PG6SPooMS0+uNkXDg2TNWs/BWTpHXPTJbl5K9tPxwsCXytPC7nXL93m4YeG2MwDF
         yjDg6ESSnpeITEVTnbfthTRBlsxeapXEWYud34DLj8fyQ5K7GjlDyajjuhACgA7NA6t9
         iBb5whrd1mGQVVtzLhFIaodtM4IdA4xqOjKXAAWroyzKh8rT77BqJ74X3f+pxT228D3p
         1tKuJh5GFkPCV7b6MJA909XWLb8vP91/wXCSHM9vZz7DBUM3t9M+CXiu8Ksd/uQZJbsP
         wyhlumnEXCF6VX8KvVq4fKa561BmgkFI3K1hbr6d1Da181TmFxDjd2zboVEeBM8MzVWA
         AwPA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9O9Xq5uC74Zj+wzQ8VInpmbS2HeCaTvPD+ZozhWW31SH5xAhS6yKugLSFkYpdJVGjyrbKzWz1KHS3vVhJBUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2BpvxmA+kN3srm/T00tZQT7e9ZjxgYjKWMhqLeGfWbXb4yfC
	yw5CBaotxK5nqAXx50eVoHl3uIDYrqqmhXZ4QKG+PhV0858/Ao0FdpU8q8w6tQQu1gTWeXI4A+Z
	RpdKvycTRsd9kH1OhW9e1odAaCZOqVERQ2HNRD5HKdXpIEJgoWHoM1r4mReQATN+GtNunkBrC+4
	1Ve9thfa2OjyVuGiAm9UjHx2IFpRCDyAOwLMk/xJkUM4zP
X-Gm-Gg: AfdE7cl36ZOZ51/MQaZOKiu0qrFABF+Un55Ww0DQaQVFFszsftIwFIzShpqtKayNxPQ
	KS4RsYgKSV5JSwE6bdkyC1TAf9MSjk01DA+zy+0YbNJ3Hh5AEilw0orzxcZZmfY8xXD0KV2kN/D
	1UmTHEpQSTnWYiXdm8Xb13jX9FSwcReNBOe6ao4itxBGXUgPnvW68vf072vIcNL0C1h4M=
X-Received: by 2002:a17:907:3c8b:b0:c12:10cb:f3d2 with SMTP id a640c23a62f3a-c1210cbf56emr188874466b.8.1782418842183;
        Thu, 25 Jun 2026 13:20:42 -0700 (PDT)
X-Received: by 2002:a17:907:3c8b:b0:c12:10cb:f3d2 with SMTP id
 a640c23a62f3a-c1210cbf56emr188871166b.8.1782418841669; Thu, 25 Jun 2026
 13:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625195415.1102409-1-joest@redhat.com>
In-Reply-To: <20260625195415.1102409-1-joest@redhat.com>
From: Joe Simmons-Talbott <joest@redhat.com>
Date: Thu, 25 Jun 2026 16:20:25 -0400
X-Gm-Features: AVVi8CfzErqpSrYpFNh6HJh7HgdbzLx0r2Noyaud5h0mBLZFo8stK9QwxwigB8s
Message-ID: <CAAQBMsPXjFGbQFa3ufvDDHxjgdj+5_kD0PLGD7vn19YNsEV_Kg@mail.gmail.com>
Subject: Re: [PATCH v4] selftests/cgroup: Adjust cpu test duration based on HZ
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Guopeng Zhang <zhangguopeng@kylinos.cn>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Li Wang <li.wang@linux.dev>, 
	Sebastian Chlad <sebastianchlad@gmail.com>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cui.tao@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 3:54=E2=80=AFPM Joe Simmons-Talbott <joest@redhat.c=
om> wrote:
>

+mailing lists
+Tao Cui



> For lower HZ values a quota of 1000us is much lower than the amount
> of microseconds per tick which makes the tests test_cpucg_max and
> test_cpugc_max_nested fail. Increase the test duration to accommodate
> for lower HZ values.
>
> Link: https://lore.kernel.org/lkml/20260624160358.430354-1-joest@redhat.c=
om/
> Signed-off-by: Joe Simmons-Talbott <joest@redhat.com>
> ---
> v3 -> v4:
> - Use usec for adjusting test duration for better accuracy.
> - Remove underscore from static function
> - Use 1000 as the fallback value for hz since it's the default.
>
> v2 -> v3:
> - Instead of changing cpu.max quota extend the test duration based on
>   the HZ value.
> - don't call pclose() if popen() fails.
> - check return value of fscanf().
>
> v1 -> v2:
> - Try checking /proc/config.gz to get the actual kernel HZ value and
>   fallback to 1000 if the value cannot be determined.
>
>  .../cgroup/lib/include/cgroup_util.h          |  1 +
>  tools/testing/selftests/cgroup/test_cpu.c     | 47 ++++++++++++++++---
>  2 files changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/t=
ools/testing/selftests/cgroup/lib/include/cgroup_util.h
> index febc1723d090..8ebb2b4d4ec0 100644
> --- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> +++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> @@ -8,6 +8,7 @@
>
>  #define MB(x) (x << 20)
>
> +#define NSEC_PER_USEC  1000L
>  #define USEC_PER_SEC   1000000L
>  #define NSEC_PER_SEC   1000000000L
>
> diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/se=
lftests/cgroup/test_cpu.c
> index 7a40d76b9548..1f280c1db68a 100644
> --- a/tools/testing/selftests/cgroup/test_cpu.c
> +++ b/tools/testing/selftests/cgroup/test_cpu.c
> @@ -639,6 +639,31 @@ test_cpucg_nested_weight_underprovisioned(const char=
 *root)
>         return run_cpucg_nested_weight_test(root, false);
>  }
>
> +/*
> + * Best effort attempt to get the kernel's HZ value from the config.
> + * Return the HZ value if found otherwise return 1000 (the default) to
> + * indicate failure.
> + */
> +static long
> +get_config_hz(void)
> +{
> +       long hz =3D 1000;
> +       FILE *f;
> +       char cmd[256] =3D "zcat /proc/config.gz 2>/dev/null | grep '^CONF=
IG_HZ=3D'";
> +
> +       f =3D popen(cmd, "r");
> +
> +       if (!f)
> +               return hz;
> +
> +       if (fscanf(f, "CONFIG_HZ=3D%ld", &hz) =3D=3D EOF)
> +               goto out;
> +
> +out:
> +       pclose(f);
> +       return hz;
> +}
> +
>  /*
>   * This test creates a cgroup with some maximum value within a period, a=
nd
>   * verifies that a process in the cgroup is not overscheduled.
> @@ -646,15 +671,20 @@ test_cpucg_nested_weight_underprovisioned(const cha=
r *root)
>  static int test_cpucg_max(const char *root)
>  {
>         int ret =3D KSFT_FAIL;
> +       long hz =3D get_config_hz();
>         long quota_usec =3D 1000;
>         long default_period_usec =3D 100000; /* cpu.max's default period =
*/
>         long duration_seconds =3D 1;
>
> -       long duration_usec =3D duration_seconds * USEC_PER_SEC;
> +       long duration_usec, duration_sec, duration_nsec;
>         long usage_usec, n_periods, remainder_usec, expected_usage_usec;
>         char *cpucg;
>         char quota_buf[32];
>
> +       duration_usec =3D duration_seconds * USEC_PER_SEC * 1000 / hz;
> +       duration_sec =3D duration_usec / USEC_PER_SEC;
> +       duration_nsec =3D duration_usec % USEC_PER_SEC * NSEC_PER_USEC;
> +
>         snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
>
>         cpucg =3D cg_name(root, "cpucg_test");
> @@ -670,8 +700,8 @@ static int test_cpucg_max(const char *root)
>         struct cpu_hog_func_param param =3D {
>                 .nprocs =3D 1,
>                 .ts =3D {
> -                       .tv_sec =3D duration_seconds,
> -                       .tv_nsec =3D 0,
> +                       .tv_sec =3D duration_sec,
> +                       .tv_nsec =3D duration_nsec,
>                 },
>                 .clock_type =3D CPU_HOG_CLOCK_WALL,
>         };
> @@ -710,15 +740,20 @@ static int test_cpucg_max(const char *root)
>  static int test_cpucg_max_nested(const char *root)
>  {
>         int ret =3D KSFT_FAIL;
> +       long hz =3D get_config_hz();
>         long quota_usec =3D 1000;
>         long default_period_usec =3D 100000; /* cpu.max's default period =
*/
>         long duration_seconds =3D 1;
>
> -       long duration_usec =3D duration_seconds * USEC_PER_SEC;
> +       long duration_usec, duration_sec, duration_nsec;
>         long usage_usec, n_periods, remainder_usec, expected_usage_usec;
>         char *parent, *child;
>         char quota_buf[32];
>
> +       duration_usec =3D duration_seconds * USEC_PER_SEC * 1000 / hz;
> +       duration_sec =3D duration_usec / USEC_PER_SEC;
> +       duration_nsec =3D duration_usec % USEC_PER_SEC * NSEC_PER_USEC;
> +
>         snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
>
>         parent =3D cg_name(root, "cpucg_parent");
> @@ -741,8 +776,8 @@ static int test_cpucg_max_nested(const char *root)
>         struct cpu_hog_func_param param =3D {
>                 .nprocs =3D 1,
>                 .ts =3D {
> -                       .tv_sec =3D duration_seconds,
> -                       .tv_nsec =3D 0,
> +                       .tv_sec =3D duration_sec,
> +                       .tv_nsec =3D duration_nsec,
>                 },
>                 .clock_type =3D CPU_HOG_CLOCK_WALL,
>         };
> --
> 2.54.0
>

