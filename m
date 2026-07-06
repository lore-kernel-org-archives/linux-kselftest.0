Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106F3AE1A8
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363674; cv=pass; b=To956Ly9qj/7aiS7RE3u1QB6TXhL2Xj+pjRBBGnGT/xZXGLy0zfcLs54yT7kaTu00WAlfZPFiIDX3Ke3tfPCRNPTy0eBedl0X0+pdEDz8gdqSS+rLYiZ+VrHYWruHyexYRf48+jh1iJY8elgafb/sNDvSg699Yq4g3zF+wPEhMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363674; c=relaxed/simple;
	bh=3CpDeh3U/Ub/nnGgM+FSJgwXu2F8sXt7Wd9OJeF59Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfKnIMjrSwNvgKpHsTWUtIclQZaDXxQQsP6wQtp4cjaVDGP7pAEB10BXnnpYznORosq3b5WiexONJiotcVctAlNlDdhaOLK92Y7vUmJYEbP7LXC2qZoOLSjUn+DqfDFEUD9/VZrflbuCeEcAEhX5/1O13LP9JowyxaFt3IeqK2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWaJITAl; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWaJITAl"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so93716a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783363661; cv=none;
        d=google.com; s=arc-20260327;
        b=QxC7f3sH78EHRyZEnPFLpAFO0qbyvXiQrM+WWIrkpzwCF/R3Lr6bYkOvovFFV51IQg
         YogKYQRDTGPCJ5+Qr/NAlNuNYG97bf/VIqCd2BnMpJDjr/eo4dvEE9nr5IOHvEMF0gZW
         XGiKIath9eGV7a0GZRPgtAzFcSHfQz7ZzGmafYCYJbCYBi0PuoShLawsGCbGOu1toyl8
         9dh4yL4KPMf8TijTaLeO09CFN0kO4eZBpVYOLZUz2iDmaooH5KgP7lxDl48PGwfVAYdW
         J1k1UGY30eZd21nFnxW0UTuKykQ32dHg+reZZGJ9N9SdEKgaXfIr1zR2oalaFQG59dMS
         y9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlffmDV9amnyG4+2I/tHJmLiSsgPapi2+hDODnkkvEU=;
        fh=GAHC+L3MNG6wkyahrUBzWDxzlTac8ddTtWbThUf4c8Y=;
        b=K8IeOwyGkIN9vm5W/1VTvs4/BtJvhCEIYOmdEYnRWBx4PsJlgl03cLjju0Dl2s0cnd
         nD71Q5potsNxDTjkjZX/h/utMX/CvAR8DwIZMXzUY3Ri5o/ufnpxVAaLyMnpBg1Y9nvC
         eujrUQP+QeUxDyahTy0RrdczzYvzhrl2KBeYURD5/t0M8CKl+oxKqQ/xUIGDfycxRyqp
         jQp3GWLnD+QS4KgZgsPspJQ6IYGzgQLLQ9HAaCnbPQATQNfDe+7bq1I1TwzwnVNZIriI
         jH+KYyg5YnUC+D7sTfaUhfIDjP/HCB5uiEa/r9w9V4J1RoojSrvdq7AD74oNEbevn92o
         qZhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783363661; x=1783968461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlffmDV9amnyG4+2I/tHJmLiSsgPapi2+hDODnkkvEU=;
        b=PWaJITAlEzGGz2WTVzpcEOc2cooyZPVAP31hZ8ORyeDkvc7//oZc4TtkQCz9jtYc2T
         ZwScLNDk8VJQYF06n4ytgai0kT9d7qu8HCOeJ9Swktyl3IedqOmbRpeDsmDHCAhUzl7Y
         2GIOuqAV87pPbxtOf+ckzeM3/ehrTsfUGLjogB4cKjNNFev6QeYoUq2CRVUhGPc6mXni
         Rq8MBk3i8TTPzOMASZaCrE0pxVttxws7kwhui751oA1grYh8mSGjx0y6gDwkEraa/hcP
         T9eR8ACWJOivCLZDU65Os31RL4aoWpr8+tAY+dahdS1cN49QjaCgwk2DxJ9MRR3PI0dQ
         1W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363661; x=1783968461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlffmDV9amnyG4+2I/tHJmLiSsgPapi2+hDODnkkvEU=;
        b=Bxtb41fTiKUq7plxUxrvtZyzVhy90QfcS9C+PLw+K27Ic3pGhbyRivgRxsiqsZUACX
         qtoXyMEtwgBc4SpT5tiihBy1T0zrKQ5owwjnUNlXCLvDuHzRJJjVxLfzLuvofUDuULJm
         2hMqw+Rac6EfuJPJUXh6GOUXCo8tVFA9eAOY9bdurm4WpySvMmVXKdy6Ez+9EwUv2sIH
         HIg8MtWxy8vz68ceSwIJRPAhnOJ5dMQF1c2QLziIbq5aZt/b7E8fk4NnM39wLNG9Mza7
         WHe9sR5fOqOcNixxg2r11UQHimUtuZZz00CIvtTRLeIJJf4zultel9tWiuDA0nvZv0XD
         uLkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6K/Mgj1h9nT/td2sGu1Nv12NKNTCela/tgTzz4hDN630vVn6WSWk8l6od/PZLfQNlkrYodu3pZOebYTg+CHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytqMfSnLf/oFjd5dV0J9ULiuUE1ApTNSdxWiLF6C5sv1nWp+F4
	XDt4DyVm7mOAOXsVZ1YT6NGtUuesIG08iQC1VA0k90llNb9GB3q7t5FbyW0bDtbEJtJyXPrHls4
	/Cfi5tdPJObfgTrJnh2R95sa17Jk6LjHCqbNCIE8=
X-Gm-Gg: AfdE7cm582P0vXTpkvQLza1LABudz0srBbMvytaH4jln4omj5h6jRYpWUYcf6RJFZVZ
	DScUWE+LxUIsUCV7YYs/hMgO6sqV6tphj9g8c2eQOfcyf2GipAsn4vqL55B3zpXMXmtgDleKi2E
	I4UQy/NLBxD9+KQQfpAgEovOwMHCpuiwyxVLwCuTbtGn3n/jzdEAOnkmEScpy25wmRGq1AvJfLX
	2b386j02fJiIk7HJYmTbITOU6/OVFwlcYHmTv66g0cZaJm4HmmWvUPZrOrfbBrY1s9RBPFOWciw
	4DyzVlyofDCgeqwXAayYqfJEF/lNMdA1Kba4TmaZ7b3qlx6mHgNyRLGSRKR7EMgz4dxkiFKfo/+
	Spn5iOMF4T+O0PuSDnx5FjX73
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id
 adf61e73a8af0-3c01cb9a275mr16216502637.30.1783363660754; Mon, 06 Jul 2026
 11:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702093915.2652638-1-yijiangshan@kylinos.cn>
In-Reply-To: <20260702093915.2652638-1-yijiangshan@kylinos.cn>
From: John Stultz <jstultz@google.com>
Date: Mon, 6 Jul 2026 11:47:28 -0700
X-Gm-Features: AVVi8CdHZQNS7AGlZBRWgQUJj3H5tHf1nk1Nxw6hrirjNm3_0kkmPayICBfy-pg
Message-ID: <CANDhNCrVv7KQNEY5V_K5b_JVbEWW+C8+WfbJWkUb3y0fw128Bg@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: leap-a-day: fix -w option and update
 usage comment
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: tglx@kernel.org, shuah@kernel.org, frederic@kernel.org, 
	anna-maria@linutronix.de, sboyd@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 13667453960@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 2:39=E2=80=AFAM Jiangshan Yi <yijiangshan@kylinos.cn=
> wrote:
>
> Commit 98b74e1f3104 ("kselftests: timers: leap-a-day: Change default
> arguments to help test runs") replaced the -s option with -w and made
> "wait for the leap second" the non-default behaviour, but it only
> updated the switch/case handling. Two things were left inconsistent:
>
>   - The getopt() option string still lists 's' instead of 'w', so
>     passing -w is rejected as an invalid option and the new behaviour
>     cannot be selected at all.
>
>   - The file header comment still documents the removed -s option and
>     an outdated default for -i.
>
> Fix the getopt() string to accept 'w' (matching the existing case 'w':
> handler) and update the header comment to describe -w, -t and the
> current -i default.
>
> Fixes: 98b74e1f3104 ("kselftests: timers: leap-a-day: Change default argu=
ments to help test runs")
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  tools/testing/selftests/timers/leap-a-day.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/=
selftests/timers/leap-a-day.c
> index 3568cfb3e815..97c8c66bea88 100644
> --- a/tools/testing/selftests/timers/leap-a-day.c
> +++ b/tools/testing/selftests/timers/leap-a-day.c
> @@ -9,16 +9,19 @@
>   *  kernel's leap-second behavior, as well as how well applications
>   *  handle the leap-second discontinuity.
>   *
> - *  Usage: leap-a-day [-s] [-i <num>]
> + *  Usage: leap-a-day [-w] [-i <num>] [-t]
>   *
>   *  Options:
> - *     -s:     Each iteration, set the date to 10 seconds before midnigh=
t GMT.
> - *             This speeds up the number of leapsecond transitions teste=
d,
> - *             but because it calls settimeofday frequently, advancing t=
he
> - *             time by 24 hours every ~16 seconds, it may cause applicat=
ion
> - *             disruption.
> + *     -w:     Only set the leap-second flag and wait for the leap secon=
d
> + *             each iteration, instead of advancing the time. By default=
 the
> + *             date is set to 10 seconds before midnight GMT, which spee=
ds up
> + *             the number of leapsecond transitions tested, but because =
it
> + *             calls settimeofday frequently, advancing the time by 24 h=
ours
> + *             every ~16 seconds, it may cause application disruption.
>   *
> - *     -i:     Number of iterations to run (default: infinite)
> + *     -i:     Number of iterations to run (-1 =3D infinite, default: 10=
)
> + *
> + *     -t:     Print TAI time.
>   *
>   *  Other notes: Disabling NTP prior to running this is advised, as the =
two
>   *              may conflict in their commands to the kernel.
> @@ -186,7 +189,7 @@ int main(int argc, char **argv)
>         int opt;
>
>         /* Process arguments */
> -       while ((opt =3D getopt(argc, argv, "sti:")) !=3D -1) {
> +       while ((opt =3D getopt(argc, argv, "wti:")) !=3D -1) {
>                 switch (opt) {
>                 case 'w':
>                         printf("Only setting leap-flag, not changing time=
. It could take up to a day for leap to trigger.\n");

Ah. Good catch. I clearly didn't find the time to actually test the
"wait for up to a day for leap to trigger" case.  Whoops.

Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>
