Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094EB30B509
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231243; cv=pass; b=NVfCpkWEX4DCx2Tzeu+y9YnMKhBkbmTEwCLD3T7VyzAnwph9YawUxvgNDT4iDbgcYOCQ03VBP/MBIXfvc/+vRMhX8iHmy+RFnfr4QRPOb/Fs8fzYWK37h3BmrmA8j/qnk0IkVCi48OnVNs2GkY0ZgKfxSf92mgjVlRGBQRz0Hv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231243; c=relaxed/simple;
	bh=el0/2s+b6n4ZhN1YxOnCHTqP1ih6HCpDLsM04EQFwdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YenW1qH7/Jlri+6REkU4zxWclJV5h7U7UrSJQFXO1a/5RPUF3bAxUKEGiwc9j0bmv2GlSWvgX16FqjsQUHI3mJFhEEp+iAPrKzsuIGYdQe2i23beVT8szvkHW8l4xlvf2VEb2s6CcHUfuP8w8PTzB+blz54Q2lnTGHGxX6dN0ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/jQhrU9; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/jQhrU9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso992745e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782231240; cv=none;
        d=google.com; s=arc-20240605;
        b=YCoPxH9sqQxwzRGlGccT1LUUsBHvptXomMK1d3X91lolgVMfcIEZ+kNhbRl8M8DpXC
         obHLxYFdSBf96YFsYekSDM38MUUFi9irqeJSC2VJb1/AmC6KWSbqS4DoFRVqG8Rq+GMc
         8vxugGQB1PWogpVaAzinha2RjlYsKoZWEMy4nAgzOQ3jXlS7T1V1X4273BxbHE3QA3PB
         FTwasb1Y2KRHBFBWPBG8bals0z1PzDAuTrJi/yCuRU2uNP0HNErqfydVgEx4IX7Kykhn
         +Tt+Yhe+T01mvVlC9lYY/GDwl/AxvVD7VOIlX5FSLvAXMIwmCzLGiI/zmX7dgbwZn+WR
         DZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDwQwDzvONAtx0EaM5WMpABAgDhtGeMeJ2yvy/pReek=;
        fh=14qlNpwUo4c4sUZu0dXGsqAbzZ4lQ62zfeL/BR5dzUQ=;
        b=c9fgwmLbKrND3YAH8GsynqoemUvbq/959IPTVuIPcOJDaRNjenlHsheGNYg3RvDjXR
         jksjauhkfh9FD8oL8XaxKJkknJqfOeLl+EBp9Qps13Q5KJFnMnHH/A0Y1jv2zaau5Prh
         xitpsDIUrpnW/zO46KCnwfs3JwLhijkHZW5wUcvTJcMlD5OOb4I2upb8FK7fwGTE6nJJ
         jTL738+X8nkgsBiSclJ3Giwl1PHOK3UHwPolACk8D6enXrBEQhumhY8b/3RwrrkpsHEi
         4BHrvS6EUIa/gwxFlVyNMH6esHL3WADUGwT/8xZIJcCO4PLJaFrynG9Wqvl+j+GFIIiI
         QPNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231240; x=1782836040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDwQwDzvONAtx0EaM5WMpABAgDhtGeMeJ2yvy/pReek=;
        b=B/jQhrU9/N+zKP2/efrw+rB0s5q/KevsnSJyA9U7z4+ZwPdi/RMKUKoT7l1r+3HOfK
         +N2lROWmaVCP12qiiecDHYhlMHHPi6IsCbPDszhdKLhwVAPjnI4KVacTmJ5aO495zqsD
         V3b/6LLXzRD5bpuyFXiR2M1zDJMolL0M0pTmwaKbT/NG1GfAV5CzyCg0BES3KN9a2IUa
         Xzx39xN8sC15SsBuI9Ulig+0Fb2Bi3apZviFiqAo2IaLzTIWNvBZfpVm22WDUh3rOzFo
         plSXHje2e6DqgdmuIvXgz4dsZfrN0cHEF2jq+HOJI+bDyG+/YgomApgAzlFtW+/XiQ6m
         yQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231240; x=1782836040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDwQwDzvONAtx0EaM5WMpABAgDhtGeMeJ2yvy/pReek=;
        b=aX6ymwtCGpSiJWKqRAw8G3WcgVPwHMLp8zYCowyhTGg07P8OOGEBBy41Ys26UL2sKW
         yGbiKRTTMQiJ+DdM8HSsKe6651NWlTBZ28olp2nqH3U8cmG5F8w3yLRthsJ99d5C//c6
         uUg50ROqgANdT2Ll2HE+c63CoZf5oP06/L7xJzHF9/R0V0tftyOkdM3Zcn1mKsX9ZKq1
         meCM7ghGpmY9kp0qKuB1H7BBSVyuMJGhRWfvIOFKoL1TeW6mBW1Gy4kk16LL1egsx6/s
         UJs/S50c3cFNnwB0S892BnSGHBSNz37I9qQIqJ2pQjgbOCtadVpy9nhXF8QISEutjklz
         RjeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K44e3azoSO3qI66lHbSRSOWP8X7rZNk0kDu5rdCdw80Naf5VrmrdvAxIiza7QCAr0ZBwTkI2mgv80fGXO3n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0tG+fuw+7QzYATwNhwvTv8nDi8kXOTAVdqvtDmEXax5j/oZO
	pYfufPpvj0W+d8HaNiV9O1dMtufKjeMcIt3smF52kh8ISvK+WsvT57vgfP1oxkNkaEJpARJKvdd
	yfuSWrsiUoqQjR8852sniVKYe1A/Bt+s=
X-Gm-Gg: AfdE7ckM1XKw0+4tHTSPXuxI+8scJ/gP88yJGiaVfFSSrnIQww9Cdd5PxpBpKqiWYcP
	p/8T+C9TYGZDQn3u3jppCCRfx0Z21ah7Sh6IE1hcqQYLOo+IH/pX01Q+WjFabUVD0R57KQ6C9Ln
	Ce3KqJuBriK/19BwvlEgALZjSJ0FmqiA+6QoKSExiQ9rVpg2dTXLDXdMR4ak41x6lyk46mVQvkF
	r3RPneLMLjWqDpL8P9RSCb1z8+jCCkyXX1VrLouhODBSqWhx+i8kC/jOdxGUeksPxcuCtyCl92J
	+39UKMo/GnD1O5qfD7c/LnbgCc5T
X-Received: by 2002:a05:600d:4452:10b0:492:4caa:e2f4 with SMTP id
 5b1f17b1804b1-4925b39c123mr41296185e9.36.1782231240208; Tue, 23 Jun 2026
 09:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com> <20260623111533.2285005-4-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260623111533.2285005-4-ptikhomirov@virtuozzo.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 23 Jun 2026 09:13:48 -0700
X-Gm-Features: AVVi8CcHejowD3jStN59P6Vi0fwypOnE949zrkPtRIHJOkgQQZWHlhkDWvN2F4k
Message-ID: <CAKEwX=PEE9=P-0=3mCRXArR9eL247P6SpDnYiGHp5zKZ4J+ETA@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/cachestat: add an overlayfs test case
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:15=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> Mount an overlayfs, create and write a file in the merged directory, and
> run cachestat() on it, reusing the existing test_cachestat() helper.
>
> Also bump NR_TESTS to the actual number of tests run: it was 9 while
> ten tests were already executed, and this adds an eleventh.
>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
>  .../selftests/cachestat/test_cachestat.c      | 75 ++++++++++++++++++-

Hmm this looks strange...?

>  1 file changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/t=
esting/selftests/cachestat/test_cachestat.c
> index 542cd09cb4434..1662d9817c50b 100644
> --- a/tools/testing/selftests/cachestat/test_cachestat.c
> +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> @@ -4,21 +4,25 @@
>
>  #include <stdio.h>
>  #include <stdbool.h>
> +#include <stdlib.h>
>  #include <linux/kernel.h>
>  #include <linux/magic.h>
>  #include <linux/mman.h>
>  #include <sys/mman.h>
> +#include <sys/mount.h>
>  #include <sys/shm.h>
> +#include <sys/stat.h>
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
>  #include <unistd.h>
>  #include <string.h>
>  #include <fcntl.h>
>  #include <errno.h>
> +#include <limits.h>
>
>  #include "kselftest.h"
>
> -#define NR_TESTS       9
> +#define NR_TESTS       11
>
>  static const char * const dev_files[] =3D {
>         "/dev/zero", "/dev/null", "/dev/urandom",
> @@ -294,6 +298,62 @@ bool run_cachestat_test(enum file_type type)
>         return ret;
>  }
>
> +/*
> + * Set up an overlayfs mount and run cachestat on a freshly created file=
 in the
> + * merged directory. Overlayfs forwards data I/O to the underlying (uppe=
r)
> + * inode, so the page cache lives there and not in the overlay inode's m=
apping.
> + * This is a regression test for cachestat returning all zeroes on overl=
ayfs.
> + */
> +static int run_cachestat_overlayfs_test(void)
> +{
> +       char tmpl[] =3D "/tmp/cachestat_ovl.XXXXXX";
> +       char lower[PATH_MAX], upper[PATH_MAX], work[PATH_MAX];
> +       char merged[PATH_MAX], opts[4 * PATH_MAX], file[PATH_MAX];
> +       char *base;
> +       int ret;
> +
> +       base =3D mkdtemp(tmpl);
> +       if (!base) {
> +               ksft_print_msg("Unable to create overlayfs base dir: %s\n=
",
> +                              strerror(errno));
> +               return KSFT_FAIL;
> +       }
> +
> +       snprintf(lower, sizeof(lower), "%s/lower", base);
> +       snprintf(upper, sizeof(upper), "%s/upper", base);
> +       snprintf(work, sizeof(work), "%s/work", base);
> +       snprintf(merged, sizeof(merged), "%s/merged", base);
> +
> +       if (mkdir(lower, 0755) || mkdir(upper, 0755) ||
> +           mkdir(work, 0755) || mkdir(merged, 0755)) {
> +               ksft_print_msg("Unable to create overlayfs dirs: %s\n",
> +                              strerror(errno));
> +               ret =3D KSFT_FAIL;
> +               goto cleanup;
> +       }
> +
> +       snprintf(opts, sizeof(opts), "lowerdir=3D%s,upperdir=3D%s,workdir=
=3D%s",
> +                lower, upper, work);
> +
> +       if (mount("overlay", merged, "overlay", 0, opts)) {
> +               ksft_print_msg("Unable to mount overlayfs (need root?): %=
s\n",
> +                              strerror(errno));
> +               ret =3D KSFT_SKIP;
> +               goto cleanup;
> +       }
> +
> +       snprintf(file, sizeof(file), "%s/merged/cachestat", base);
> +       ret =3D test_cachestat(file, true, true, false, 4, O_CREAT | O_RD=
WR, 0600);
> +
> +       umount(merged);
> +cleanup:
> +       /* Best-effort recursive cleanup of the temporary tree. */
> +       snprintf(opts, sizeof(opts), "rm -rf %s", base);
> +       if (system(opts))
> +               ksft_print_msg("Unable to clean up %s\n", base);

nit: no helper for these? :)

> +       return ret;
> +}
> +
>  int main(void)
>  {
>         int ret;
> @@ -361,5 +421,18 @@ int main(void)
>                 ksft_test_result_fail("cachestat fails with a mmap file\n=
");
>                 ret =3D 1;
>         }
> +
> +       switch (run_cachestat_overlayfs_test()) {
> +       case KSFT_FAIL:
> +               ksft_test_result_fail("cachestat fails with an overlayfs =
file\n");
> +               ret =3D 1;
> +               break;
> +       case KSFT_PASS:
> +               ksft_test_result_pass("cachestat works with an overlayfs =
file\n");
> +               break;
> +       case KSFT_SKIP:
> +               ksft_test_result_skip("overlayfs not available\n");
> +               break;
> +       }
>         return ret;
>  }
> --
> 2.54.0
>
