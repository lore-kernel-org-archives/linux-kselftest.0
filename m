Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA927355F53
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254882; cv=pass; b=Neq3TqlRDnfr2zsM0RPsvj7GXUXt7eYYvCH/KyF4vA+4e/YSR5ykK41YUpwWrNqQW8Qk5iLX8vqiglJzs1mXLw+t/VhEtKYNrVToY9niKPjOnG4kWnO9fOZSw1l8stkfmOh55ZQg3c+Gir1hS8H0IHli4nbkRahB9wfI3G2Qqqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254882; c=relaxed/simple;
	bh=T7kuCnGv+MPhajgFi1ytSn4Nh0USvlRRcKcpeiEc3aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZBMwQG4dlvTFend5XBR2CmT16JSK/foCrozHvKaqAhlUoJAolRp2mu0sYkwJMV67I0oXtAfFEe2wmIDhSlWp5+FEBfXRcHjlmLI5gTGfN7kVh6dRaiU7cXfvQ2p8bbM2b2XXtH+oZwdq+z9vAAbYhD7M9BDEHiE/mdhyz8S4EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+85Onll; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+85Onll"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffe0a56b29so66444137.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773254880; cv=none;
        d=google.com; s=arc-20240605;
        b=VD1/Waqj+C5khizrXCdcPAVZHAyKCipkKO7A+HKNjcoXJLWhAbwzOd60CNFoF+ub1P
         PZveEXuL1+AjOiS7K18kgqpZq5ZLPXFEEIIbSACVRtrhBGvVJYfqv4LMqH5RJT/Ik0XH
         Z+2W+ulqzNQAcxju+zmMQM+fTwgdGkVaU+ssZOj9FMjB9MHLpSDk4Fz7ZttHUWFAbdKC
         jUUPofOh7jTE2KfxgA47anh97yAljZy3BdWZeVUs9PBM0o9Ma/bGbDK1NaqBGI63wqiD
         k3PxAi5UOUcUlAgRDESEOrBsCtO/qLjM9PuGkJl3YU3CZ7VOKtu4tODERPrtFJQ6OILI
         /UZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAxpEJ8kY7+FRgHAo3nQvpaEqdFKu/X+ltjWb2tMaRY=;
        fh=y9AwH/+rDfvEJUaHCSu1emqoSC0AhfY0AzO5q+VFeTA=;
        b=iK4QXGJc201agvSaggeaMD5W7y9ljpumkov+zz51OctIug61f0M+Xo7VXN90MweghZ
         biva6TVUV26zG94htjRG1BFNlK4xpCOZyTulozWZT9/OVod+BVMmNBSnA4GinGbjQ0kg
         b70mCHK5nE1C600wE0xX+Mm8AVFBlfV6ff5uBfSi4pnrvr3sfydNP4oJ2k+dgXOqmvxo
         ZtG9KsXahkoJY886+jCR4p+z6AO89AUcLmhXhJ0pEEIaEj8d2X/yS8HYPE1l51CEyoi1
         6o2cJrfedIQ9J6V14FjcCrKA53kxyEkvFBP+vUowG1lkEa9WI5tDw1+DOfOOjnknU61Z
         NGig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773254880; x=1773859680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAxpEJ8kY7+FRgHAo3nQvpaEqdFKu/X+ltjWb2tMaRY=;
        b=g+85OnllYfNAAar0xlIjsc3zUQ83BO//dPMmtsfQZ19pJ1A2Zz5tBJW76g9FE8JuHT
         UY7RLGcmgSqXa3K66wwN7Ehyw9GIi9+/mYhbHLVxksvIl20US+mmcuwqWSVMUSW8ZFiE
         v40qY8hPLDYysZdk8F3fg7sCym8VQOwrNWlFN9VBAGf8QAwU8N8Tzm76F63jdFOSkck7
         itw4rQfxvYF3mk2gZHjHokz1+3DUbD+do6ZkKire1HktFdr4s1pA3n9K8Lv826x2xuq8
         GbgYOFjQFBuQbHlEoXtkHk3lzl0M6cJhJVDjLFz4b9Y8a1muxTCi5OWkpxKKA54AHG8M
         QMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254880; x=1773859680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAxpEJ8kY7+FRgHAo3nQvpaEqdFKu/X+ltjWb2tMaRY=;
        b=GEDfs/K3dN35ueiVzn5GhtqCpdts38YWEloPBwGUNWR9sWuyO8zROkNXkjNi3TGIFI
         h6nPucqi4o1qWkPNf2i9W1DbFvrSzJEy0shodJJB+ptBaeXNIWxEVk37RYUWPyH9YQSF
         97KEp4AWWcBbpreo6JU58zLttTIHXhcdUTqSCHStOr/5O4/Rs/YXfaVVojLKMxuH5586
         yXRNNZjPmUYfvQ9i6SSxp3fBUTAyHNDpp5te9ynhl4l435B0dqziyK5A1vC8ZIxBQ967
         k9ybA7GHCVhRPFPb7vdA8fv9HPAcVnuUHDhB18ZkJnqhWAxrtU+FhXhj6zJTC9zeGdkB
         itlw==
X-Gm-Message-State: AOJu0YyCt2vTiuQggEqtwJrufCgk10SeSopJDwnsNnole6HaxZhDoWU1
	0dlIox/r9hvjLAiMPlMW4LBZej1cHWiNEP7TZiBFau5VGv7tcfocYMwlda8SgTjkwkwv83agCLE
	KdZfqtE3K7Apr8kDvwbJVOvTj3qJYBG6340EbsAXM
X-Gm-Gg: ATEYQzzlVTzHy4w/UKH6bdjkgqU2wtI+aWwA4gfXLpQmVoohbS2sYbRqefGqBuKhs7c
	RAzlo1YoE1Z+WewoHe08eaEQLo+4sQiLmJngeojxXtJdooAtzNKzVELBYt0k/g1MCibiFdN22t+
	3tMh0jgII7IdfJ3TKJlf86hHQRA5hb2LTiUp+TrrY4EH/XcFYZDQVc9ij6w5om5FBCrsHjB8554
	5r19Leofgr0Q8sVetkpGEwOA87qTcgZEfP/abDjjs7cC50g5kRLbg8QVe0Vwhp+6SuijwJSZCTs
	Zf9qAA==
X-Received: by 2002:a05:6102:d8c:b0:5ff:f950:2184 with SMTP id
 ada2fe7eead31-601deec184cmr1237874137.20.1773254879004; Wed, 11 Mar 2026
 11:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-1-liwang@redhat.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 11:47:22 -0700
X-Gm-Features: AaiRm53fRV2TmohY-D30EpYfhqzBFeER8Ei_LKLWx_mz9_j4_3BJLjVgC7rSGxE
Message-ID: <CAJD7tkad2Q5Dt4On91tgsXDcmORYQsBAB-CbM=EY270nJ5y_Pw@mail.gmail.com>
Subject: Re: [PATCH 1/5] selftests/cgroup: detect and handle global zswap
 state in test_zswap
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:05=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> test_zswap currently checks only for zswap presence via /sys/module/zswap=
,
> but does not account for the global runtime state in
> /sys/module/zswap/parameters/enabled.
>
> If zswap is configured but globally disabled, zswap cgroup tests may run =
in
> an invalid environment and fail spuriously.
>
> Add helpers to:
>   - detect the runtime zswap enabled state,
>   - enable zswap when it is initially disabled,
>   - restore the original state after tests complete.
>
> Skip the test when zswap state cannot be determined (e.g. unsupported or
> unreadable), and keep existing behavior when zswap is already enabled.
>
> This makes test_zswap more robust across systems where zswap is built but
> disabled by default.
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
>  tools/testing/selftests/cgroup/test_zswap.c | 77 ++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/=
selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..1c80f4af9683 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -594,18 +594,88 @@ static bool zswap_configured(void)
>         return access("/sys/module/zswap", F_OK) =3D=3D 0;
>  }
>
> +static int zswap_enabled_state(void)

Just zswap_enabled() is good.

> +{
> +       char buf[16];
> +       ssize_t n;
> +
> +       if (!zswap_configured())
> +               return -1;

Return 0 here, zswap is disabled for all intents and purposes.

> +
> +       n =3D read_text("/sys/module/zswap/parameters/enabled", buf, size=
of(buf));
> +       if (n < 0 || n =3D=3D 0)
> +               return -1;

if (read_text(..) <=3D 0)

> +
> +       switch (buf[0]) {
> +       case 'Y':
> +       case 'y':
> +       case '1':
> +               return 1;
> +       case 'N':
> +       case 'n':
> +       case '0':

Can a read really return any of these values? Or just Y/N?

> +               return 0;
> +       default:
> +               return -1;
> +       }
> +}
> +
[..]
>  int main(int argc, char **argv)
>  {
>         char root[PATH_MAX];
> -       int i;
> +       int i, orig_zswap_state;
>
>         ksft_print_header();
>         ksft_set_plan(ARRAY_SIZE(tests));
>         if (cg_find_unified_root(root, sizeof(root), NULL))
>                 ksft_exit_skip("cgroup v2 isn't mounted\n");
>
> -       if (!zswap_configured())
> +       orig_zswap_state =3D zswap_enabled_state();
> +
> +       if (orig_zswap_state =3D=3D -1)
>                 ksft_exit_skip("zswap isn't configured\n");
> +       else if (orig_zswap_state =3D=3D 0 && !enable_zswap())
> +               ksft_exit_skip("zswap is disabled and cannot be enabled\n=
");

As Michal mentioned, skip the test if zswap is not enabled.

Assuming zswap_enabled() only returns -1 if it fails to read the
module param (and zswap_configured() is true), then we should probably
fail instead of skip, as it means something is wrong with the test or
the module param.
