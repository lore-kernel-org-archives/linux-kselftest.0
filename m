Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA146A5F0
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612324; cv=pass; b=nsHT1tRTIwktPCcwypFxC4yNRTAYsBNI6sQ6JsUMcJgiSkBZGENQVkMr7fwuHJ43xTmer1izzTuC6yanq2G3fVXnm133dsFa2i28KWSeNfBg34eHVFMjyVs3kJgWD8ZpXYU126C9zniN06FhPSjbSq4OT3GIciFlg0Y4IQCYTHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612324; c=relaxed/simple;
	bh=fBWEGcX5+6BMMIJlFafz91zXoPt1lhGtk3Zdv3Oy89w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiB4Fottlw0tJjkP7XI1Gnk2Ak6rWndO2VAvz26o7VZ3AFVcw9F8Wms3ujUUlQpHX5xpn5XQ5UMogk/a44USCI1DOi4YeAwmTNcaxcLyJv3jostyi8nSXhuy+n+hF6fA5V47Wroe7MnR+glFshTGsv/5t/Gxwi2EKwY5s4EK4Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac/h074N; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac/h074N"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so2738679a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 05:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788612321; cv=none;
        d=google.com; s=arc-20260327;
        b=V5kgKhbt5pT3rB9gUuWJKukzmGEoLp82N0KndRsUNS+wAXxiX1k47kLUVVsIrAG7jh
         ekIFPevXTM4rZxvqK1+f05KUx2/2uH+06Wm0aM9RPHNwusyeuyfQIJ4OVbSZ5HU4RoGK
         GrjBxT5wm9p+rA8fTOju9TrgtNwtavsV6qwnNspRSX3dhqZbLenhyAUGKLrm84q8Ss9O
         kEuFAqrqnv8YvYluAKORN09uFDL5OkJWw3M7RKmcPDGS/C2YfDt6+HPFIovDtMwdkVJO
         pbNYgloclBUmonVB0iuUGyrUDqJEc0dVQe2JABFaMOmDf5dh7UU2hUrP57+iQ4YlIyWY
         lUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        fh=5XXtioDnruP5oHyxEo4xZGgogCfZzDlA0hJkXlz3vwA=;
        b=ZngzWCnfb7x3PChaIG82YgrnrZYpdgRrh3K3hs8B51J0yEn2Zmt5TFLzRxMeW/z8oS
         tPQ2UsbnYrB5nrQ+Y8cgbwON1kwI8atk1hPSpvX1uq/qtljpGGCS98LWKM9lliEsNUNY
         4Di6vRBFDniLazfHu1G/ciOp2PsDPkRmumu4BkjoUyGBPFB1cvCrJLumc+8gZg/8yisA
         kML6kkmcww+pVkXc/raDP4mYLcM7LEonxpZealk86lgTqsmVVlH/f4t50Eso6/g817S0
         s9ImKzPZrSOqPRmaIEwWILkVtNCCPLzlqP/AhBtnZCjt1xvXjKKKrU/f1yGToxNjofS2
         U5Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612321; x=1789217121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        b=ac/h074NI8wTt5Gt3eW3DYI4LZIW64GQRms1hZWpU6wQMdG9BBdG+CEqG41kMb5u5o
         rq+QDEZFYpxaf81HWKgmMDCsaEBxt+UTzi/fWiShz+0BrfwjY1dE8IfX8PRAI6Bclhb1
         OcpVd0K/CUF0KVo6YgVeSNxwGnU1Y4ZSo6Xx2Dn/STxbSbkbGxZiYnZfQY1aZbOo5T+r
         7dH5yIJnFn23gj3L2CFHTSztIZbot4kSt5iJq6PvWzcbXTY8AM973RR3eH36DLxOxGqF
         8+uCFQ9oSVZoFuu2dXUsyl5she7+LfwrOEXpyJIDhlaUQgAFZJX+sudkP6cYC0pVY6Z8
         9w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612321; x=1789217121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGM/0WGqNNlVNkDUUKOgVaHbElh413E3DzLNpPh8458=;
        b=qxTnbeTgHBGquIDJ5wPRHuGxi46d5o3iNxPPGwNsinx/HnA8sqaOVXgh0jJp/47xka
         hsvD2tkkGKYCgmJonxFxFQBDvKqwt9fjTGlNxNdScrqcqqM+DPpzrBDH4Rp1nmnelX8j
         mF9Duk3jxw3xmqeZdxngHB7uoMztHb47cTYjoxwfxv4CArco9QfmVAygYkc8Q4v3DC6Y
         J+XHEpMr82L7NdjlpWvbREAuuN6UPjgzXFJ/eG6cMiEjY88iCnw8o+9Sqhyvn1j/b8O6
         0HrbEKFjw5BviMq9hxuh2lfGZX/AcFqzZmLN5BN9fN5nX9HDP6PNY33N0kqaDQpi/z4b
         Qr6A==
X-Forwarded-Encrypted: i=1; AKwUvByuXC95mtfJTcYKuB/mfUN7VDHGJ1WOvbmEuhQFIZgU/mNmIh1PPZL3QLrpqTaw6UFx74Wp7nWUJ8pn+YraTco=@vger.kernel.org
X-Gm-Message-State: AFuF++kS01MbZdOZuydr/AzMjj4s9+nBftzPRp3Bc3QoFAWgH2SCYj5Z
	5sZb2OoUCqDwa+tkl9DdwxnyLeeEtd4BRbHJr+gnCcZaQksLuCJpMKTuPgJbRySFpVVSQ5hmE/u
	rSIxTGa0LDJhPzRmpZgUxDDix4aa9E0I=
X-Gm-Gg: AYBFou2pS3tmfltQqtAzDDGl7u7bZ1Y//sJlecJhcuKeU6wEAoXrPn7vm2oC3dwS0O3
	fwUoBvPr0wa+MVNVK3mfb6/BTmxt6Rj0AvHxxkdxv6Gt4LVOoIgOmcZGCdfUotwHDyV8DnZXBuc
	1cVcTnCshCWWeNwlq5DVBslU3SClaK0oz+ZxdujtqRr0+xv6lCMd8O4r5sQ8WaaRabhgv09+yGU
	zo0fDFBl/N7noXWlkLJVA+MCcAMRi8Md30mx1ANRJRJ0O0S1ydRQ++X8Dlp4u/HzrXQNbkejd/E
	TbQpcf+FDRN2UkGadxrLPR/P/nztbbEAEp15D+7PlNjT/Q==
X-Received: by 2002:a05:6402:a547:10b0:6a7:f25e:6db1 with SMTP id
 4fb4d7f45d1cf-6a7f25e6e51mr2032344a12.37.1788612320869; Sat, 05 Sep 2026
 05:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-5-luis@igalia.com>
In-Reply-To: <20260904103920.4471-5-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:45:08 +0200
X-Gm-Features: AcwNN1XW76aTEzUfZkegLGWoMyxaeMkdHeOExTNGv0PjSuMsOiLdN22V8KyQ1vU
Message-ID: <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> In order to reduce new tests setup/teardown code duplication, factor-out
> these functions from the existing acl_cache test into a new fuse_common.c
> file that can be reused in other tests.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++----------------
>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
>  4 files changed, 100 insertions(+), 55 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.=
c
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.=
h
>
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index a3ee9b3a2f5d..7744f796eb06 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
>  VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
> +CFLAGS +=3D $(VAR_CFLAGS)
> +LDLIBS +=3D $(VAR_LDLIBS)
> +
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> +
> +EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 2411a6e285f1..12cbf9753d03 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -33,23 +33,15 @@
>   */
>
>  #define _GNU_SOURCE
> -#include <errno.h>
>  #include <fcntl.h>
>  #include <linux/limits.h>
> -#include <pthread.h>
>  #include <stdint.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <sys/stat.h>
>  #include <sys/xattr.h>
> -#include <unistd.h>
> -
> -#define FUSE_USE_VERSION 31
> -#include <fuse_lowlevel.h>
>
>  #include "kselftest_harness.h"
>
> +#include "fuse_common.h"
> +
>  /* ---- ACL binary encoding --------------------------------------------=
---- */
>  /*
>   * POSIX ACL v2 xattr format (little-endian):
> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D {
>         .getxattr =3D fs_getxattr,
>  };
>
> -/* ---- Daemon thread --------------------------------------------------=
----- */
> -
> -static void *run_daemon(void *arg)
> -{
> -       fuse_session_loop((struct fuse_session *)arg);
> -       return NULL;
> -}
> -
>  /* ---- kselftest harness ----------------------------------------------=
----- */
>
>  FIXTURE(acl_cache) {
>         struct fuse_session *se;
> -       char                 mountpoint[PATH_MAX];
> +       char                 mountpoint[MOUNTPOINT_SZ];
>         char                 file_path[PATH_MAX];
>         pthread_t            thread;
>  };

Nice!
I think it would be even nicer to have struct fuse_common_ctx
with the common members embedded in the per test state,
but I'll let you decide if you want to do that or not.

Thanks,
Amir.

>
>  FIXTURE_SETUP(acl_cache)
>  {
> -       char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
> -       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +       char err[MAX_ERR_MSG];
>
> -       g_ds.acl            =3D acl_a;
> -       g_ds.acl_size       =3D sizeof(acl_a);
> +       g_ds.acl =3D acl_a;
> +       g_ds.acl_size =3D sizeof(acl_a);
>         g_ds.getxattr_count =3D 0;
>
> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> -       if (!mkdtemp(self->mountpoint))
> -               SKIP(return, "mkdtemp: %s", strerror(errno));
> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> +               SKIP(return, err);
>
>         snprintf(self->file_path, sizeof(self->file_path),
>                  "%s/" FILE_NAME, self->mountpoint);
> -
> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NUL=
L);
> -       if (!self->se) {
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_new failed");
> -       }
> -
> -       if (fuse_session_mount(self->se, self->mountpoint)) {
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_mount failed "
> -                            "(missing fusermount3 or insufficient privil=
eges)");
> -       }
> -
> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
> -               fuse_session_unmount(self->se);
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "pthread_create: %s", strerror(errno));
> -       }
> -
> -       fuse_opt_free_args(&args);
>  }
>
>  FIXTURE_TEARDOWN(acl_cache)
>  {
> -       fuse_session_exit(self->se);
> -       fuse_session_unmount(self->se);
> -       pthread_join(self->thread, NULL);
> -       fuse_session_destroy(self->se);
> -       rmdir(self->mountpoint);
> +       fs_teardown(self->se, self->thread, self->mountpoint);
>  }
>
>  static int do_force_statx(const char *path)
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.c
> new file mode 100644
> index 000000000000..3a91cac25b81
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "fuse_common.h"
> +
> +static void *run_daemon(void *arg)
> +{
> +       fuse_session_loop((struct fuse_session *)arg);
> +       return NULL;
> +}
> +
> +int fs_setup(struct fuse_session **se, char *mountpoint,
> +            const struct fuse_lowlevel_ops *fs_ops,
> +            pthread_t *thread, char *err)
> +{
> +       char *fuse_argv[] =3D { "fuse_test", NULL };
> +       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
> +
> +       strcpy(mountpoint, MOUNTPOINT_TEMPLATE);
> +       if (!mkdtemp(mountpoint)) {
> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno)=
);
> +               return -1;
> +       }
> +
> +       *se =3D fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NULL);
> +       if (!*se) {
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
> +               return -1;
> +       }
> +
> +       if (fuse_session_mount(*se, mountpoint)) {
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
> +                       "(missing fusermount3 or insufficient privileges)=
");
> +               return -1;
> +       }
> +
> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
> +               fuse_session_unmount(*se);
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror=
(errno));
> +               return -1;
> +       }
> +
> +       fuse_opt_free_args(&args);
> +
> +       return 0;
> +}
> +
> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mountp=
oint)
> +{
> +       fuse_session_exit(se);
> +       fuse_session_unmount(se);
> +       pthread_join(thread, NULL);
> +       fuse_session_destroy(se);
> +       rmdir(mountpoint);
> +}
> +
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/too=
ls/testing/selftests/filesystems/fuse/fuse_common.h
> new file mode 100644
> index 000000000000..77d5eb58550d
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
> @@ -0,0 +1,25 @@
> +#ifndef __SELFTEST_FUSE_COMMON_H__
> +#define __SELFTEST_FUSE_COMMON_H__
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#define FUSE_USE_VERSION 31
> +#include <fuse_lowlevel.h>
> +
> +#define MAX_ERR_MSG 256
> +
> +#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
> +#define MOUNTPOINT_SZ 64
> +
> +int fs_setup(struct fuse_session **se, char *mountpoint,
> +            const struct fuse_lowlevel_ops *fs_ops,
> +            pthread_t *thread, char *err);
> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mountp=
oint);
> +
> +#endif /* __SELFTEST_FUSE_COMMON_H__ */
