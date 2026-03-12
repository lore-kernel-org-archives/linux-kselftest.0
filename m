Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272A3F661C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773340382; cv=pass; b=SIjJhrsmBDueFjalmXD4sOMiGFvNeHkwypRmUBeWKHFlXujG5yZIWAJsxKc4dXgcrrv3DzdH8xUPYVcNMaqW+7ljUJn4EALyR9o8N4mAhfiuiOC3qw9wVgcC1HfnsVBAcMS3csKnxJnE+vkMDbhrKlSbqnQ0h/E2SycWA/Ssg0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773340382; c=relaxed/simple;
	bh=JRuTyxdaH1TnJhSnAPH8KYCVxs+Z65YcJBweNpx6z9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsOLL19Q7Wx4mZuj/bqEwhI462LyosnpdzeFJA5N+UGTkq3HOvr3qvFG9/PquxLOOAWh6kJ7h5jdAtPEjzKL7haQmoqMBHfh/olFM6toS/UBmCYUZ5ixHToXh08O07Z778RfwXEHGw8uDMKFl56CXMXQLx2zQQQKOe4P9tCqe70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGr4mnaJ; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGr4mnaJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485445e80bdso11864285e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773340378; cv=none;
        d=google.com; s=arc-20240605;
        b=flfmHsxBCzwTxvpXNMAH1zuV1bNcv4Qg//ROWuM6aNWu3f4o2fK7Ll9zQ3AckjhQem
         UOK+2/aZ1BW7Xj3OFi9RFu3FuwQufubDZhl/sJwppUjGHtRsPnoF2oVCsQ5cwWlaq+3Y
         BgqfwsY+0FFB9pnmgiyFWflzm/Ehriy2oyUztVPVoZuBXO23Beyru4n1u0dPch9m5I/+
         DXjCjrF5po/zU67geKAovjUhNkRTRB0G/ZhKkvX+qqYeaiVqsGVKPj0B4jk6Tk4Mc7wc
         TfueUjM6PxfosSMAfLh5XOx0lWzt4ZdffknHfXYESqJI+dcK5fSSkpmWs7WziXTx3VQa
         s0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLCydgmsLZopSIxYCWTXr6mj5+UWpP/7itYlUReBj3Q=;
        fh=WuilCRSltAX81N5CdUFNR9Vl5glJ7UFwQ33bdbOwAdE=;
        b=ealxwc/hUlUV1lIXdPi9J5Alre/K0tHxYk1G0WKDCqNGvQi5Cts+p6uga+hEtahXT8
         khdUu2plnOoqwIRRZitYBaLVH7MbjA3vzwEF2g8e6xGy1dKPg699n40MBYV4n/rJ1j2Q
         HmyMLMabEoTR+gbDSvM5EaGhd3LvmfoX3ZXrzRxjHCNvQk6O+uNTnkMUAmdGnqLrmhU6
         YkFQFaSPdV7OTDD83FUo6YodsxUO6cLOzIycQ6WCv5DLOS0fbLNPZCv1a27aL8wxkTLA
         qqw16OGk1mSGzqfoDwcnRrCEoL1jzApZkERWe7Gp2THqDqGxIgaTxy6jgC7PTZ+JDEGb
         v6gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773340378; x=1773945178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLCydgmsLZopSIxYCWTXr6mj5+UWpP/7itYlUReBj3Q=;
        b=YGr4mnaJRxFEB8IV/fzI59nFZhDzOW8+ykMoVZAm1kXyZNgPTuyw07bWqnJLDFFg7v
         OAFZe3FzZXm7WKMgKhoLOh6e6+W+2e3av1XVcT8xc7hcBx51Leb+00NdDA183Ap9UaSf
         YjVJuJzyNOiLmKoLIkduspPsgCwi/RfKmpSOLqzQxuh67Fs1u/Xa53KXGbnJm8Z/GWCq
         TZyjrSA5wlXd4AhKQ8JV/HkmBq+PlriqfmnK1hJy91F7sCVZ7JconDrDzBE1VwTuzbY9
         QqZU3P8rrUph5KGRma+225QIRvYVQ0jDP+Q6WioMCeJvujFCXwTnjQw3B2z9a9yx2ayY
         Oopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773340378; x=1773945178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLCydgmsLZopSIxYCWTXr6mj5+UWpP/7itYlUReBj3Q=;
        b=rRXhslknLozENYV3J5apwsadP4wO0d6L3yv5y6e/i2b2X4wZdpxorIPjCzotUo9Z/U
         2IC8i4jy1P2pnmtUciyerMvSllpFvoxygb6h7prCXqkCAkpcaDIgHH05zK/9A+buFpNt
         otKqD/A7obDELPUomM3f4A87UiNjulhO9YBMlMMukreWm6suy4iuHKMOTaHrCtWW8WyX
         pxA2JC/K4zfPdGFJAL8rRjEKctUgIFJhkNUcXOirLBDhogLB6Y3OdJqxdw+7zKtDSvlQ
         QZb1FJ6mvwigAnsOapAjEQ7UirmR0pPFwUmvw5PnSjbVGgKrcbQvREcrh2GyCbj4oYjo
         qMhw==
X-Forwarded-Encrypted: i=1; AJvYcCU7jZiokw9c6ympe4nzq/EXfPNKKaiZdKmiln6o3ivPLMQGo2IoN+VTxVrXqpdjAB1qSkPAYZ/UUSbCiXKtfJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4CJ3RVJtmHG6hnofCGgCXYvSNFttxK/rBu9Snhj8C4lKle4R
	7FuoXl/kWuxQn4iONa86l53zZyaMQHyo0Jm4bLcEbcCWYw3v7QwspZbrCxSEs3r2hOI0zkcx+FH
	TW7TIYWRoI4M0oa9sHXNpyPX2aCQ4xaA=
X-Gm-Gg: ATEYQzy3TN64kcU6a82X8FjIHL43AbqcSdM/iRwsNQjhJiM/cjElWFHfHsdCv5Y/KY3
	gljtpGCJdFRi+FDCRlo7cfRD04SOaiIuwkaVPBuQiuc5SZa8OUvucV0gc823rzRTx+IKYWXQnJf
	LPDhKtDEi5qZ3xU10QDN4QX9Cih2OstMS+3tw3zNhQnM8Sp1kV7ht6GwAcbDW4zZyOOs8OUWfRl
	GRzdapVFCru1J/27hz0PFwlWI5sDjxdVLJ7XT577edjGAX/QADc6J07p6LQ0TDCuRNgRgVQbNV0
	KgMAgNunBf21raADl3+zXnzlsEQqX36lfihcyCo=
X-Received: by 2002:a05:6000:2912:b0:439:af0e:57a6 with SMTP id
 ffacd0b85a97d-43a04da8280mr1300920f8f.36.1773340377966; Thu, 12 Mar 2026
 11:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com>
In-Reply-To: <20260312040627.55257-1-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Mar 2026 11:32:46 -0700
X-Gm-Features: AaiRm529J2z7GUFjqxFaqWDZiHrZWf25yuHp83ueywxtszNnB26OhIBqBJrPi1s
Message-ID: <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: mkoutny@suse.com, yosryahmed@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:06=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> Currently, test_zswap only checks for the presence of zswap via
> /sys/module/zswap, but it does not account for the global runtime
> state in /sys/module/zswap/parameters/enabled.
>
> If zswap is configured in the kernel but globally disabled at runtime,
> the zswap cgroup tests will run in an invalid environment and fail
> spuriously.
>
> Fix this by reading the 'enabled' parameter and gracefully skipping
> the test when zswap is disabled. A helpful hint is also added to the
> skip message to show users how to enable it.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> ---
>
> Notes:
>     v1 --> v2:
>         * remove enable/disable_zswap functions
>         * skip the test if zswap is not enabled
>         * reporting fail when zswap_enabled return -1
>
>  tools/testing/selftests/cgroup/test_zswap.c | 28 +++++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/=
selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..ec64daaa2f5a 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -589,23 +589,41 @@ struct zswap_test {
>  };
>  #undef T
>
> -static bool zswap_configured(void)
> +static int zswap_enabled(void)
>  {
> -       return access("/sys/module/zswap", F_OK) =3D=3D 0;
> +       char buf[16];
> +       ssize_t n;
> +
> +       if (access("/sys/module/zswap", F_OK))
> +               ksft_exit_skip("zswap isn't configured\n");
> +
> +       n =3D read_text("/sys/module/zswap/parameters/enabled", buf, size=
of(buf));
> +       if (n <=3D 0)
> +               return -1;
> +
> +       if (buf[0] =3D=3D 'Y')
> +               return 1;
> +       else if (buf[0] =3D=3D 'N')
> +               return 0;
> +
> +       return -1;
>  }
>
>  int main(int argc, char **argv)
>  {
>         char root[PATH_MAX];
> -       int i;
> +       int i, state;
>
>         ksft_print_header();
>         ksft_set_plan(ARRAY_SIZE(tests));
>         if (cg_find_unified_root(root, sizeof(root), NULL))
>                 ksft_exit_skip("cgroup v2 isn't mounted\n");
>
> -       if (!zswap_configured())
> -               ksft_exit_skip("zswap isn't configured\n");
> +       state =3D zswap_enabled();
> +       if (state =3D=3D 0)
> +               ksft_exit_skip("zswap is disabled (hint: echo 1 > /sys/mo=
dule/zswap/parameters/enabled)\n");
> +       else if (state < 0)
> +               ksft_exit_fail_msg("Failed to read zswap state\n");
>
>         /*
>          * Check that memory controller is available:
> --
> 2.53.0
>

Seems a bit convoluted. You ksft_exit_skip() for one case in
zswap_enabled(), but return some value in other cases. This value is
checked in the caller (main()) and then used to decide whether to skip
or fail as well?

Why don't you just consolidate them in one place. If zswap_enabled()
has no other callers, let's just open code it, yeah?
