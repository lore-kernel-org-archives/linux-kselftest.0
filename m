Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C1346A13
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383696; cv=none; b=CXKmC6t/CBjXY57IX+V6eu4NtXik8SI7S/CXaFAXJtQdJRjGvGIpXUYyz/Hn44rI22vZPSo5PlPcO4DQ6nwuhnOnWS4PBSiBK2o5Bot9MHCcRXMNEtAbIs0+oIJ8qnuZJRKsqvTn+PLpEClc9wHU1blCaqKd4RzNjEjJGpppo/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383696; c=relaxed/simple;
	bh=Q0wVQHhsmNqM24Qtw9M0BntfWCp5kq7h5Pk/AhbueeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4h5VubhQ1EXX90pqkEoAdSsNqbsD+JtYBT5O14s/YPwLssFPkchiDSvN6Ez2ptoYqoA7YZCX5S0eFynfRBHkFu/rp1ouGrwFKRxMl2lI+gy0ESHNBonjysrFnQ+ICZIaMtERxCsghoE18rvMFNjKty5S75V/1Btscsowu7AW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYZpciPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYZpciPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E0FC19421
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773383696;
	bh=Q0wVQHhsmNqM24Qtw9M0BntfWCp5kq7h5Pk/AhbueeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZYZpciPZUCP7DFkzMawgbl+7hjxu+d4KbtYEqLuY5RZofb4b+oRQoW7OnYKvi080v
	 r13iKoXUJ2Uy41wp5O7Nh3/++b4mtFuXFYge0GsC2zgugE95otf2/2H2GO2KVP0LEG
	 9q1m21WROtAtw4FYPKI1UQSVPzxT48UuhhOpFuQG8gU/tXuSblvhbCAHqkzOB+1VNt
	 a2Y2xfivFST5Q33zm8AQ0Q3lS0cqu/+MBaiknO2mmmp6Ef7NAm1CnzKEnjSCYHgz6f
	 v/jWoe3i41OEVZNZcQLK8ul4w4IUHZfv/r08w7Jew7GWskyhimH643jBxdCvr3rrob
	 EJUYV1roqbtPQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b942424d231so224053166b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 23:34:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUr/TiGGsPZDxOi4mqGicSu5oINI6h1aZkgRqj0PhZNvGGGgwHzUhKehIN4Kl672xp6UjBuCIyStquNtXQO2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwS1r5OfPK3xZk377iBmqX0h6xMVmTZfqBsyxx4P2cXrtAodV
	N/4F/RsIa62zNnQLRueyVHtRX1Vavyi8pxQxRZfF9VTz+Wszj5lEWBBV2UxGtpTKo06xNJndlDS
	sn64URfimBTkiFNX6o8FkS/vqCYcIN9U=
X-Received: by 2002:a17:907:7389:b0:b96:ee7e:a65d with SMTP id
 a640c23a62f3a-b976538221fmr83259566b.58.1773383694832; Thu, 12 Mar 2026
 23:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313043532.103987-1-liwang@redhat.com>
In-Reply-To: <20260313043532.103987-1-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 23:34:41 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
X-Gm-Features: AaiRm52d_LSDbxu5r_s7A_TjYxa-WyeCVfUKwcqT9K0KvGU83T161Inpfc6nrB8
Message-ID: <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: yosryahmed@google.com, nphamcs@gmail.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..e69d845d3592 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -589,9 +589,21 @@ struct zswap_test {
>  };
>  #undef T
>
> -static bool zswap_configured(void)
> +static void check_zswap_enabled(void)
>  {
> -       return access("/sys/module/zswap", F_OK) == 0;
> +       char value[2];

Please wait for discussions on the previous version to conclude and
give people a little bit of time to respond before sending the next
version.

I think this can just be be:

    char value;
    ...

    if (read_text(.., &value, sizeof(value)) < 0)

> +
> +       if (access("/sys/module/zswap", F_OK))
> +               ksft_exit_skip("zswap isn't configured\n");
> +
> +       if (read_text("/sys/module/zswap/parameters/enabled", value,
> +                                               sizeof(value)) <= 0)
> +               ksft_exit_fail_msg("Failed to read "
> +                               "/sys/module/zswap/parameters/enabled\n");
> +
> +       if (value[0] == 'N')
> +               ksft_exit_skip("zswap is disabled (hint: echo 1 > "
> +                               "/sys/module/zswap/parameters/enabled)\n");
>  }
>
>  int main(int argc, char **argv)
> @@ -604,8 +616,7 @@ int main(int argc, char **argv)
>         if (cg_find_unified_root(root, sizeof(root), NULL))
>                 ksft_exit_skip("cgroup v2 isn't mounted\n");
>
> -       if (!zswap_configured())
> -               ksft_exit_skip("zswap isn't configured\n");
> +       check_zswap_enabled();
>
>         /*
>          * Check that memory controller is available:
> --
> 2.53.0
>
>
