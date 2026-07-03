Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02213016FB
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101432; cv=pass; b=XDs1oeyfMlEVGllO6TGYn6LuHy2uQlCmkLKYhN/wq7xPT8W45bcMg9tvwTW2CJ0NdcbmFcqyYJ0OnDuCJo7fDNHtaCvgqnG68TxeM1ztdP+tozn97Gl6Pt50TEPZbbWeSyLpgUH1bYMXH8qasqEZ7yvoxUIv5tAZXj1E4JRj8aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101432; c=relaxed/simple;
	bh=jYcBMUsEf16lB1gSKJT1q30+H1rv8CvgUFQ3Cpw3r0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek4z2xhmIj6t8etyjlxs0fy1iijBXnCyKjep9CQ33rd3jYCEHjbh0y4GJGq8/FwNbQnwyOc4FB87lm3wwnusGujTMEZU5g0POjnr/7n0pFZNYRRkc5ncSe+iTysnuV2r9USAIQJgMeCyFhL/mdenhYIj7LSTohulJd2tDnllsPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFlfiDqi; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFlfiDqi"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6647bc8f900so945663d50.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Jul 2026 10:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783101429; cv=none;
        d=google.com; s=arc-20260327;
        b=egt0GeuysssWi5YNv1ReHsV4Jaexu/5PbmC7rFk0McSEMVc9WdGUphKrOsiznSXt5G
         rmubD9lIMC4VM6UvXDQYQV81YS1zjxfuOLDyVAmzRdeyZ2xJi6gf8b5xfhsiuWDV0VUE
         /s5xguqn2lIoJgIdn/Dch32bqgdS1kzIyXUiY0N9hlKz3M9Znqd0Ue6qX39meMtOb7eG
         UTtFVFvcMjoX+2+NjauHWTgNT1KvGgT8Vg+bBJkMF1s0HryjVNgkAFO9TKrUl8xxKQiZ
         KUSt0mowcAg27u9z5uxODNkj77ZH1g08R1r4Y7GNJaE9T/2eB2u/bWkZJDa4OMESMxws
         3BZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+wCeRX4PM1cy9pj31y6w69soFSedp2CdjVACBoJy82Y=;
        fh=ZvzRr+3dSxBCqta7pSze/nDzuNqi0o0+j4gdsUw6xWg=;
        b=FB8aqpSvTYaDh8ZZKbl+Nnt7wPT4krjJ6kx0YvXT+H6V+DkwuCSa+cMirxCYo7D9k8
         myz1gc9v7T7ts0s+0iPD/nwdl1b09srdbB0BlNHMY+mEFk1S7tlwfEa27F+T6pYlREd9
         o12jZFgxHLzHbsPFjYUrMyAEFS9qA43q0UmWJ6VWsg03/l6Y3OGJwiVhD7R8Ztu+Smxb
         9GwR/3QOIhKgieFT2G6xoo9/6hta9pHXygB/39XFttoUU1WttY082U8Fv4VLW94Jb9nH
         mdYceAN8lYSUngv+T/qrZegORlm2NHlr/fzi81FwNAU/BBlathf0c5jYXzfI5waA+nge
         6lfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783101429; x=1783706229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wCeRX4PM1cy9pj31y6w69soFSedp2CdjVACBoJy82Y=;
        b=oFlfiDqiyIycyNGH+cVcbvmFX/RmhjrH5sPMfRT7k1kn8A/WOwoJgAfGBdX2peGT+F
         Cwgapy48tixM3/WTyQjHJ9PNKAhiiz1IlBQmwArtP8AHYu7Kacv7j0gw1AFvaYsKiJmf
         0Csd6PfCuMih79MkIIjVPS3xziiqXSQPxCgczadAOPlrt4XprBXwa9bn9LNy4UuzIpjX
         GvUkTyMoxaoCUIz4JHZkDvYgu5FJdUfiLNCYIW1UQusCA2K+3Nk9+8DSdT5LsYyEC9NK
         LrJPrHxNmyT3jLDBM+sLnXQiSESI1I9fMGWPcz0hzQQasGGzujIgLGSWRjq0H8fN1Vf5
         xbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783101429; x=1783706229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wCeRX4PM1cy9pj31y6w69soFSedp2CdjVACBoJy82Y=;
        b=DMhwFDKT7K2BGW/5R3B3GvIm1wc+flXITkrVkMuCR+zXhXUsnP8WiHYKC6d7jA18np
         SNYNy48ACh6gnk/tD0aLb+lkl52+37j19WOfK79nNXc3aqM5shuye5axvcfJp3pCz0SD
         b5lgYliqS453huLIiUfwSVRRtivMfzdXxatCdy36Olac8IO0dvH9NGDOQG50di1IvjhT
         KeiVaWMepZEloqE2LXO0/wftr1eJ5F9ZVTrFzkj628vSIresIElv9mB8U4XIr3ZcTSwq
         cUQ0B1eOiROemVa1dADjxrTz76/bgFnuZjHRrcPJW+fHgaOZUu+/Cux/z+lZobeHRH7x
         rzLw==
X-Forwarded-Encrypted: i=1; AHgh+RpXOjLYQxveLrLd5mBS8m1F7ySMK7PYufvMzGDRnLjmSfR8x7uN2Vil7dxRBI/zyRwiz+Y9XQoPIHiNtuzvBg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHlEp7xR5uohCT6oekbNc0V6gbETDx83hgM2953Yfo1Asm9MTg
	oJ6tQPIXJ3qIN0O/Sx/JZrduHVI5It2EEDXVtUyPrwoEq2YEh9mr1jN0IeChDqlRKQ8dWH2QfrT
	caz7K1PQaQ8lObtdRbjm4wDPzbaUI4cQ=
X-Gm-Gg: AfdE7cmzDp1INGEt7B5EDs7+UpQzVwfmaFbpTH60+vgiPD1GyO031wmWP9nvkHhCRUH
	dUhEl31WOP3eyLgkvVDUVhuySCDUpe3Ee6VckwUO0RouI13zE7CI40qhUnulaWgS4cXt636TjGL
	CZNRsW0YEVXwg6pKB0gl1+fuTRpNCu0gS20XKNMg2WzIbDmRL9CCx+tpHWAqSDjuRPN3t4gG+7/
	tj87avmdItL2XPEMQq41gccEtTdd81TVbFAVcGmnZF21QEAKsau6tFOubmHXfG+fLb88QmW
X-Received: by 2002:a05:690e:14c6:b0:664:8376:fd42 with SMTP id
 956f58d0204a3-66652ea1109mr98370d50.39.1783101428823; Fri, 03 Jul 2026
 10:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFftDdrDgoHCopx9byaupea8GB6P=qSAY==6QQoXSJcJgn_04w@mail.gmail.com>
 <20260703120951.1622491-1-wangyan01@kylinos.cn>
In-Reply-To: <20260703120951.1622491-1-wangyan01@kylinos.cn>
From: William Roberts <bill.c.roberts@gmail.com>
Date: Fri, 3 Jul 2026 12:56:58 -0500
X-Gm-Features: AVVi8CdSPVEbVI_H4mhzLOXB7QTVgXg_PLL4YqyXE43yr2FhcrPKm3ONR_hrQhI
Message-ID: <CAFftDdp9TF3Jp+4yff9aJLnKBbzSzy6BK=og6+m+CXG9wO=OsQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/lsm: Fix memory leak in attr_lsm_count
To: Wang Yan <wangyan01@kylinos.cn>
Cc: casey@schaufler-ca.com, jmorris@namei.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	mic@digikod.net, paul@paul-moore.com, serge@hallyn.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 7:10=E2=80=AFAM Wang Yan <wangyan01@kylinos.cn> wrot=
e:
>
> The calloc-allocated buffer in attr_lsm_count() is never released on
> any exit path, including both the normal return path and the early
> return when read_sysfs_lsms fails, resulting in a heap memory leak.
>
> Add free() for the buffer on all return branches to fix the leak.
>
> Fixes: d3d929a8b0cd ("LSM: selftests for Linux Security Module syscalls")
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  tools/testing/selftests/lsm/common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/lsm/common.c b/tools/testing/selftes=
ts/lsm/common.c
> index 9ad258912646..927dce4f04cb 100644
> --- a/tools/testing/selftests/lsm/common.c
> +++ b/tools/testing/selftests/lsm/common.c
> @@ -76,7 +76,7 @@ int attr_lsm_count(void)
>                 return 0;
>
>         if (read_sysfs_lsms(names, sysconf(_SC_PAGESIZE)))
> -               return 0;
> +               goto out;
>
>         if (strstr(names, "selinux"))
>                 count++;
> @@ -85,5 +85,7 @@ int attr_lsm_count(void)
>         if (strstr(names, "apparmor"))
>                 count++;
>
> +out:
> +       free(names);
>         return count;
>  }
> --
> 2.25.1
>

Reviewed-by: William Roberts <bill.c.roberts@gmail.com>
Tested-by: William Roberts <bill.c.roberts@gmail.com>
