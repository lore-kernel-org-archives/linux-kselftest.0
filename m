Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2B2C21EF
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185297; cv=pass; b=QvKlvFj53RYxJa9sViCWQjMOlU0+38Z6YPpO/T39GeRyEqManSMYMGruzJ34qGHXbwIE7QsD+iVn03VizoQBUAyq/9qBZfVldWNEuWlk9WDyMYdbIHmKGmS2XXPiSH1A5U2x3UMfje+h3KMAJ+AeUfXQA7InCL/Qg2zM0sslL5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185297; c=relaxed/simple;
	bh=cJdkYRcxnUEL397UI1OS3MXqry0cR6kyDUerA84EGyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaPEDnvmWyYAEpXo8prBbR/yh1M70WgF6HhzN49QGA734ez343Hfnw+2dUnhjLcpyZyRaaBmM9usHdjzO1E4pmgofDP17yELp7i4cG0Kg5rx1qTEISwYLJupkZouBUf9ARXI9BUuH6JQ7dDUSEgMO0fSBAWPxfmRWwtwKFCqSjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IQep+ysG; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IQep+ysG"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233985e56aso209385c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 08:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769185294; cv=none;
        d=google.com; s=arc-20240605;
        b=GdNGQokWfrv8LD+kxs0acTcfS/TSvj9ao2CJtuIvUfIOhovf2yvFi9eu1+Qlu4ba09
         7axH1RxoCExtCo8EugMBecx0pN6s/ltsSA4c42russKx2KHERNW6bxRQs9RInjMZ6G0U
         AO7mUX1hFLHEcWT4zv+jI1B3cANEShmf31+YoRQzIX3KYEXMhlCY2xhAP1ajD/tl9Bbi
         xpXem/qGvvIfLqXDy9Uq08Idd/HHU/cCevZFk1nl6GeqDSL5ClQPnzKIPfrRKoc3xKJ2
         eZg38vS/FSoBt3OtrsoglzwVKZ28RKpTXRJ+ScFO0pvyIP1DoxjkgJlMRBC8kNTvkaV7
         4qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxNTeWBn5w9lqozNLdO3vzm/ZdxHMZsH4CX0i7ouB0I=;
        fh=IijnizgXtQZ5xbQ7ybVlginqZHBdtI/in+I6Ut/8Ap4=;
        b=FgmWJQbcbswxoJF7SopTuEfLt779f/kHRFXVg4LJwmLTr+qBB0/U5l6X8+fN9seZjt
         BZBDgILhm4LI4CnuuIUcY6By2ayTRP7AK7EHVP1Mz8pPkmvhM4MW6b47mP+PKEhnUjiM
         171xJ+91eA3ub+1m/iOZ+PsMxy2ULRd2mVvcVq6Ivr0/0FTKfIs0Uq4Su0CTFTa+5g50
         /N0DqPhqm1IpJ9iyNCLfIZgHUzdabJdQOWmGcVvMcNSYus2BFrXEUQVsfbAOLs3x8hl+
         hQCOC5HEQTWXWZbTIZINO+NtRHUtD03NOFj18K28naijnJqkAZakWimtMGcPKVOtgnf5
         KOVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1769185294; x=1769790094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxNTeWBn5w9lqozNLdO3vzm/ZdxHMZsH4CX0i7ouB0I=;
        b=IQep+ysGrRgSh0XljatBMco2bgUEUx/HqoQbMYiRbBas3ydLTJa++TfPnBjfqBT69x
         vpTbHt4+8T/R4OFcDVLfQQlFnech3oL0bBXOeD5GbdDCaChc3xxTUrJ6PdIMZNiwfl8k
         j9TLNZ2rkf34VCwJcVEIowSLaM5v0rwkbjxNdugtSX7h53+kv5O6fPFPbWzRq31l+8p6
         MYw/iAPhpSd0dmPwzasCsvtQM6lIY66HU3QlCUFg3g+1xEj9+UlWDwXB1qo4R33FXsMG
         o0schVYUACUHXd/e8xo4JRvVz6pLpQnX4VWmLnYFz3QsYeo23KztVJcLsN0McvHBqnCu
         /0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185294; x=1769790094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DxNTeWBn5w9lqozNLdO3vzm/ZdxHMZsH4CX0i7ouB0I=;
        b=SvyXdfvxx1R4vbAJZooieXxVuAHLCvvuBoMY++mLDCWzd6KnhkCvO6vZX6twH7x28l
         ne11qwez0uFe24OXKJo5JHu0ahWOJwg2BJPS/u6JrswnpdLEonVBX8y2mWWtl6PGI+2P
         A2m6r7XZyS/BW8/H5F83epm0QnjIouBPjtUp74Lkl0vXMB2ITaiiTXWiovwsz8MCOehE
         ftIfJC6EI6GZe7c0Qo1D9i8BUvZIUP1iVH6N2/0sB6ktHTek6BWv6OWWX8hJhY2nOwDI
         I7ZSb461kv3vEXB514T/6oxUj+eNdW4kR/zqfbJPoJaHYzKjHZI7F0JjCHftOtnDx1by
         SWrw==
X-Forwarded-Encrypted: i=1; AJvYcCXEiVsd5EP/L8RawaWowAINsb+/5dfENbDqBpj9OjRJjTeSuREDXGdnjod/G6f01J7MZxCH2XOOE2c0liHplaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnqrpA5o7I0eoUb/tpqfSCdT8GT06EKiX9b50kmSn5b7ZwpN6
	89onaW4azSmOs7ZdxMZUP3GDKdIyLfCOlNlwTHq0c2QFm1JfR0UbBHvB3bHhFCLWL7+C+0T7YNx
	Vhu9sVRs2KX/OHW5I6ijDCkVLNJLn63nIcy2LkS2GzmSS6gAaqe+0IOI=
X-Gm-Gg: AZuq6aKw3QRRcbkp/fAyRHX+1OQWsmGVlWL09iPGvew+BwnVUKf6KnDqk8ZQ4HaKx9w
	8TdfuLPpqNwAD024792FGJjzOgWxtG3zNStigWBFIFumL43wXoxBPpuu+5nHa1zmmEmaEUWNVzr
	T7/7lQjg858tC2kwzHhkSQbmx6SoWIC6BqzTCUKg6u8KgqBopAabiBLcQw23U5LscmQ7SPd6+WQ
	6elxcFN7axW/XZTv1q1jGtpSmx33yOD+ZmXbB/BtpN65YiudL46LNi1c8nni9CeudyuQaNO
X-Received: by 2002:a05:7022:258b:b0:119:e56b:46ba with SMTP id
 a92af1059eb24-1247dbf83afmr822047c88.4.1769185294328; Fri, 23 Jan 2026
 08:21:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123112913.1371323-1-alex@zazolabs.com>
In-Reply-To: <20260123112913.1371323-1-alex@zazolabs.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 23 Jan 2026 08:21:22 -0800
X-Gm-Features: AZwV_Qh3_0A3z74JwuZQxyRjNGjleQd1M4K5VH1qZpvE0taKw_h1Ly7vckZSHC8
Message-ID: <CADUfDZrtJO8AhRh1WbMo8_xPvwE6NBOD9K8bUr6_B+=mhiSd4g@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: add missing gitignore for metadata_size binary
To: Alexander Atanasov <alex@zazolabs.com>
Cc: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 3:29=E2=80=AFAM Alexander Atanasov <alex@zazolabs.c=
om> wrote:
>
> A new utility metadata_size was added in commit:
> 261b67f4e347 ("selftests: ublk: add utility to get block device metadata =
size")
> but it was not added to .gitignore. Fix that by adding it there.
>
> Fixes: 261b67f4e347 ("selftests: ublk: add utility to get block device me=
tadata size")
> Signed-off-by: Alexander Atanasov <alex@zazolabs.com>
> ---
>  tools/testing/selftests/ublk/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/ublk/.gitignore b/tools/testing/self=
tests/ublk/.gitignore
> index 8b2871ea7751..95052c32fa09 100644
> --- a/tools/testing/selftests/ublk/.gitignore
> +++ b/tools/testing/selftests/ublk/.gitignore
> @@ -1,3 +1,4 @@
>  kublk
>  /tools
>  *-verify.state
> +metadata_size

Maybe move it next to kublk (the other executable), which would also
keep these sorted alphabetically?

Other than that,
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> --
> 2.43.0
>
