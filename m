Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DADE568FDC
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967751; cv=pass; b=i8blulLyO5tvJesjBcw60B4yU/SalMmNQzxrCk4Dl7XHn3CmcqCoeKvy5HL+Jr5hw5V0x9Db0byPfzB06OCDr8E7Kyn5cKQG2fMWPCWthQ/v+izklOUM5wOoPvlXH4rUvniJc90MbQ0ywuAhHbrMFwJ4vYCl8FNxvOyJCSxjczk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967751; c=relaxed/simple;
	bh=xw814y87t87quBntQJcxdp2+tqIAOOAp3DWlfXczkJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGzs7qABaX51wrkDxE9iqeXQk3gyrwwJiXgLRJY1VbBjYXL+u5Zr4/0swNmeshKiRW9Ht55yHaixfL1jRPYk/jDtvLi5DqbDGeULy2mg3TqbGSZE6+uNStY+Z7tG1+vOAN93wiQSQl2SVAQJsM7Y5Nv9foAwZzv106plmLUxyj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MesJ4WCX; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MesJ4WCX"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46abc23339eso176004fac.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967748; cv=none;
        d=google.com; s=arc-20260327;
        b=VxcB70cZdkkNwsyHtu2t+ozdVTaaXlpTdkZaS4NXkwOzVX1Yh4jgwVMNyKH5RmViT6
         23s7bWv4qVyOdhLzMdt2lcRc/RZB8HnIpBHVzCzqfqXbz8WkCR5gGRcnvV47myP4NiZR
         2XeHoJm8+b1Et9qslESmTJDFq0KEFLR/mO+6ly78+YbmpB4naZbrrAMvkvLXE7IQNhmZ
         dC5L598HysXyfikBR2m83GZ0aDuJ1Pk1hHPGWZUaWTyguNoIC8M9Lbf6wbAvcB2QI3LU
         2UtLPeeSkZtl0tumyhVIrRSSS1swMPT+ht9QnSgi0nVQu6hGQe16CR6j3qdfcgOwMePS
         qUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        fh=88CSPqKpDm2xDmKmMtt7Ra/5FhvDu7jP+T3AwAubr7w=;
        b=KtE6F1qy3t4EIsLW+gmHm/I0qK6v4/4IZ7dIUMyvka6qVuQ8h+CT9Jk/BtB3VANdV5
         A8fxAqAOw/jdTcK6RL9TR6q0rsb4npTetRLPIGOmwYK3Qp7cGrdFfaxjn5PD+lDMpSFv
         erKrsW3iXWpGVDf6hCz7OQO2JlMsIAOxQnPRZdsOq9UGV2I9azvBQjn2wYKyRD51aRK2
         QzekAdizZO3GS+FkthvNdKQDHVXzPSo5MFrsoY3VWP9UZRN/BRBTJ+dYRUKXvjMORkVH
         srizTUbLOKGoAajULNjq06Qrz4+fD7aGTV45QOhfcXnsF4JJ5xjUpePhC2iSIJqv8aSm
         fmjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788967748; x=1789572548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        b=MesJ4WCXa2NT4ezY0jTvkShOcaZ9Ppjb6I9FdvfcXOHJaI340qM0TgKvslkPsvzetG
         1LFYRTCsnxFliHIA8vTibp74KSDKq/PB5QjXsxKTUjHi4C/ZJ7mDOfVW2iQT1IDDF8YY
         M4n8HRFkOL3ULfyNvzv3bt52aG9ZQWYhBXSxWID/MGKQ0dFBHJfdXLv0Wh/JZdynjEHb
         9WZ6MYct32b19IZpBcSrqG+lS++xuFc9vo7PSIB2qkkZ9jO099MNkgsnbThfTVOXQ3x3
         vk5q8Pf9csSt/1YE7RJHStqpnqFGzQNCrg6YsOnwg+G+IsBvjkE5DLYCVAkf206A32I+
         3Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967748; x=1789572548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        b=iXg7laY8k0bV06vGE9qKJLrik21ofpnC7ROnx+J/naQKFcQbniR+ftJuQtpzKfAYy8
         CQpAADbQnvZqcMsvFlyD4bPcwvUCfH2MURXGMLJj0kk8xV6uvGFDu6Bfp3gS/nWuMk7T
         cW84Hq+XjnO/WzcEDr11Nq/ayLmaaVwaoo5/cUZ0BnwprPXi7vaVKAeVTk1G4ClhkRmr
         YgIjV1KUE0NA3f2n2e9lmnKd4VYwKkpK4FAJ2EmjN/XswJAdqOpQWAntIjE2xkeSTQRV
         u8azjNypYXndLSsQghlD/XdPKDEN36f10cAvBm7FeQr/bqq/UtHnv8OHLHgB34SLhBWm
         H1Fw==
X-Forwarded-Encrypted: i=1; AKwUvBymwILofOnG+f27fKvsouZSKOsVkeCbaXy4ynGAcGn8AMV3rAMoHNDPumDdBzojkE+z90KUqoOPU1k2DjnQueI=@vger.kernel.org
X-Gm-Message-State: AFuF++kK3/3x79ie8asOzL+vr+3+P6bTdtZjnyCcY0IXw16O0HMqTgtS
	Q4BBl2mtIpHpLMXUotVCCoOdjVjSVHRbNMnt06mqOg3i/uc/EEXMwAkWJVpZnMG6iXQnTBm/Dyl
	/Urebb3At2Q2DZrbDx7R1qjjLE3dY34eLSGhHmQhoig==
X-Gm-Gg: AYBFou1BmgeUEqRzUMiwKkN9p1fBNzqodfKHIpxthU25A+7qUFU8zU+BUwHBv6Sevys
	n4pFEZG7tUrBJbZ0XR/b51RF7BrM8vPgerIFs/7Om+YW3fHN6S9k+SSk9N6rmv6tvChwJV7aNqd
	orkPmXtu4KbynQYQlnLtRlZN7h4xgRb1L3nYWTU3TJrMeCJfG8Vc0rYCXkAHRhA0jRZILHpuENE
	/YjZNGC2CpXBEQnh3nTMRuCj9lnr92lmGKRJtkTbfbQcpNun1yA4LeJMdIEuWAdnpDsTDwSeF62
	u1ZQJKHHp9v4U3qJpDoYzikbq68lojbmmDYjFxTWUZoHRCYFabphuNw=
X-Received: by 2002:a05:6870:56a9:b0:448:70ac:44aa with SMTP id
 586e51a60fabf-47694bce4d1mr16666049fac.2.1788967747907; Wed, 09 Sep 2026
 08:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132412.8965-1-ruben@scstudios.tech>
In-Reply-To: <20260909132412.8965-1-ruben@scstudios.tech>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 9 Sep 2026 08:28:56 -0700
X-Gm-Features: AcwNN1XeVWtY4QT4IUSZDerLCC2KE5DhMESR2cfJmiq1YwTKtThhqVs4_2s5bgY
Message-ID: <CADUfDZqb+Tcxqd2GxX+0baFSsEv=+GH-adYQomcwPLzwABv4=Q@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: Reject excess backing files
To: Ruben Sutton <ruben@scstudios.tech>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Ruben Sutton <ruben@scstudios.tech> =
wrote:
>
> kublk stores at most MAX_BACK_FILES backing file arguments. The
> argument parser currently stops collecting paths when that limit is
> reached and silently ignores any remaining paths.
>
> Reject the command instead so that a test cannot accidentally run with
> fewer backing files than requested. Add a regression test that exercises
> the error without requiring a ublk device.

There are already plenty of ways to break kublk (try kublk add
--unrecognized_long_opt). It's a test helper, not a hardened
production-ready ublk server.

>
> Fixes: 6aecda00b7d1 ("selftests: ublk: add kernel selftests for ublk")

Definitely don't think a Fixes tag is warranted.

Best,
Caleb

> Assisted-by: LLM
> Signed-off-by: Ruben Sutton <ruben@scstudios.tech>
> ---
>  tools/testing/selftests/ublk/Makefile       |  4 +++-
>  tools/testing/selftests/ublk/kublk.c        |  5 +++++
>  tools/testing/selftests/ublk/test_cli_01.sh | 15 +++++++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100755 tools/testing/selftests/ublk/test_cli_01.sh
>
> diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selfte=
sts/ublk/Makefile
> index 5daf36c6c3..28ce542d4e 100644
> --- a/tools/testing/selftests/ublk/Makefile
> +++ b/tools/testing/selftests/ublk/Makefile
> @@ -7,7 +7,9 @@ endif
>
>  LDLIBS +=3D -lpthread -lm -luring
>
> -TEST_PROGS :=3D test_generic_02.sh
> +TEST_PROGS :=3D test_cli_01.sh
> +
> +TEST_PROGS +=3D test_generic_02.sh
>  TEST_PROGS +=3D test_generic_03.sh
>  TEST_PROGS +=3D test_generic_06.sh
>  TEST_PROGS +=3D test_generic_07.sh
> diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftes=
ts/ublk/kublk.c
> index 2400b46157..3af2f10ca8 100644
> --- a/tools/testing/selftests/ublk/kublk.c
> +++ b/tools/testing/selftests/ublk/kublk.c
> @@ -2525,6 +2525,11 @@ int main(int argc, char *argv[])
>         while (i < argc && ctx.nr_files < MAX_BACK_FILES) {
>                 ctx.files[ctx.nr_files++] =3D argv[i++];
>         }
> +       if (i < argc) {
> +               fprintf(stderr, "too many backing files (maximum is %d)\n=
",
> +                       MAX_BACK_FILES);
> +               return -EINVAL;
> +       }
>
>         ops =3D ublk_find_tgt(ctx.tgt_type);
>         if (ops && ops->parse_cmd_line) {
> diff --git a/tools/testing/selftests/ublk/test_cli_01.sh b/tools/testing/=
selftests/ublk/test_cli_01.sh
> new file mode 100755
> index 0000000000..e937b8e20b
> --- /dev/null
> +++ b/tools/testing/selftests/ublk/test_cli_01.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +UBLK_PROG=3D"$(dirname "$0")/kublk"
> +expected=3D"too many backing files (maximum is 4)"
> +
> +if output=3D$("${UBLK_PROG}" add -t stripe a b c d e 2>&1); then
> +       echo "kublk accepted more than four backing files"
> +       exit 1
> +fi
> +
> +if [ "${output}" !=3D "${expected}" ]; then
> +       echo "unexpected error: ${output}"
> +       exit 1
> +fi
>
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> --
> 2.54.0 (Apple Git-157)
>
>
