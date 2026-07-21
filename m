Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD33BADA5
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630377; cv=pass; b=KhWSxds/bt22zgQZhNb3wstEgwnzf9+ZKA8TIBHlgUhnuGb8fz4oZTz1sYQex72jdlC0ulJxzuRmi7x08oLD6lRYuX2tdp+I2wTOMDckDK6YMj9eWVAm2buNKkG4O/8B11aGYitrzxiBnnH7OGF5FojZn51j8eftqSctOvXb4jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630377; c=relaxed/simple;
	bh=XZGHCmg6TBJYjgMIect/KToxzi5RrtqxOX1ZKL7mmsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/s+EhBAKC8nTwGR5R2TSHFlQo1Ak9yhA88wOyf88JeCY+tuCO/5hwgN4ZisxHlauCtbcJyXjwqxF+X6joYlet4mVuMVMJGKu+5WLXiq5rTUJDc+ZCL6Ig4Gx0nCW+mzMiEpwsgijDHa13VbK9yFiCz0r7FA0Smk1sb9ioGxH5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfN3/aEE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfN3/aEE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so20434286a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630374; cv=none;
        d=google.com; s=arc-20260327;
        b=c42kPvZhAtTNyeqruJfZhWjXvw5DNjLWsxSZYJhBSJTDNWw/FdNogs7evHSKaKFuj2
         vubbqNC0aISUXlJkB4M3Elb+y2jMWap9/2XaFOIi63BPpc5AJw7bhWhtHwpsuBIY7LIT
         swlKtVGg7bneoW9cYAa/c02Rarm1K93fZOV9zyaJlDDJ4JbuC7eYaG3f539ZO0iLDJaJ
         jQIr3GvfDfuQ8PlJ5IA7x83pj95xXnzYQDvvgSPfroNlo5VKVT2oqCnTHfOwUzyQ5Rak
         arfE3vP6y+ghTGRrwl6z7nTb8g7m3KHm+Q8bmCQ8C0JKpVIRqtknsn5CUgtextCgxpdH
         eeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        fh=HsZ0vEHr3VwgW10DxuF8goLvkRuz39ZpuEtEWEXS1zk=;
        b=a4qEv0/G+FLkrX9VJTKo1w5LO7iRSaGIsJ9PE2oOkxQp0meP9z1F97/viNGyTA7s3G
         q3dMQUZVFRj1SCEZ29yg/4XbpUd8H1BEWVlrhFzLoTKZ6wNvxG7cn3LzJ9NjBMqAmnMQ
         xtreWhcOfgbQlA1aWZjJz3nWp2mE+iFSQd5P3jlWw794C0jo0ovnS4RH52cki1RQWHgw
         8qkW+2QI+bzaK7cl0/Ww4Cs5WeL0RbG8qrqRG2ksND4dQHNW/U7Qe+notk8205H+0797
         iIdGLR+ViKUoOhlCXpYy7O0ErUzbgfSQsUy0n+lv/iKtd3Lb8hACftkuA3sbccGw6GG8
         638w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630374; x=1785235174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        b=AfN3/aEEPr/tG1mf0KqI1xXHnbIt04tmQNtj5ZYcW3mgihynhHv54tR3f+5D1mguEF
         vX5jeCi+vLZvUhZUX/K415uWkMS4VsUMZnririoRX/vR9AsDhSvfBB+xCx39//ov/DjW
         CubxFsi1TeJTTUOCWhLH6xo0wqj6L6QSUT1eVDk6jcBqH5mc0wy6Ox6qDECpLxsPDL6I
         AnYgDDWZ2HzuI8YxzqMn+e/5i4OIU5KMXXOrGOkkKNact94W04WcKvX75lxZUdtpAMU5
         t9ISdcY9R1ICFNk6wx2okqmuvg3TZ7MLReM+I+BG0iffPocZHw0RZfLVh1SG9VbVerBS
         G/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630374; x=1785235174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+juJHzVoFamh7S+C2xEheDkvInVCn4UAMogNf2TTBRY=;
        b=PvQghAPeq/JHwpW+up7qvEccuvBq/tNxqT/AXqxc6/NGHY4363YJi80lIekiYtpWI/
         d2yOA7qiHCTYr4njNmsfNKtw3XhoIl1IOHwq65jqsUb8J988RkMmH9ZF16B8omMgr47/
         uuNx5jWmko1ZW/MJky8oyxehlidp+Gq4HXGAQinrWBmKEThBxlFHxOt5qwKg9Ob3ngl+
         ngeBvz4E+shNyBkDH7lK8Htwa7c2r/0SSfthWuagLiuvddLAnQpHMhIkc4S/4ouX9s1t
         g2HOzXhTkGHyW5DA54RwI78y5HttpClt0c0XdKspqBZ/S1tviEml0Vmge92VOaWe511q
         2NTw==
X-Forwarded-Encrypted: i=1; AHgh+RrjXRCBrpMdDXmdotrkIbZRpVgjlpxmHPsFZ8Z80M3L41Y8PKdbUyKV/bRilyEzXS9w71rU8XFQDRcpS7Lk+CI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoziARSFGCiiZyWbfOtdmj8vO7KPy2BuIWGrmLYcGhli4PU6Qw
	jxBto9L4jMIignXqxvZtEiG3VVim/rZbQtqX1kcTWBWmRkxbJ6GvMpB1umbn7ZpdsUkAi2aFZSq
	lxEIiaRCxLl4uXG0hwZOaxJ8+wptTsXs=
X-Gm-Gg: AR+sD12maE1SUrhjao6ilQLjbTBB9R98b6AnMZT9l0drXVx6FDFgiXO2CwTTfk+KZy6
	Ll0weKu/2+v6Yqki/ObZzQclsP7CIvac2cFeNhpjB9nNcNW1AvdXmvBRb54+uLTSScz0/aYVw4d
	ga2cM0V0LNmdD2Ys7oc6gfxPFOXPPxH9PzF9Hi6wCl6++F6hPCTo37NaGp0bCQU6ZjsEr5v9x3r
	/iiqrUUgXymyeS+9TiPYZH8SR9XQutVt/B8JuvvI8wLMxEtVAz39KGKyARSBqg=
X-Received: by 2002:a05:6402:2547:b0:698:ad4b:abe1 with SMTP id
 4fb4d7f45d1cf-69e652b057emr6842578a12.27.1784630373641; Tue, 21 Jul 2026
 03:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-5-luis@igalia.com>
In-Reply-To: <20260708131122.2917-5-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:39:22 +0200
X-Gm-Features: AUfX_mw-as6l6Zy89-e3FLAF03oa9ZdPjmY0IaC2DMkG4PcsftqTr3WAv-bdzMM
Message-ID: <CAOQ4uxiOqkXfySiFcYhWUR_c1_UeAA62vK2Py-ML=TpQyrUbCw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/5] selftests/filesystems: add fuse symlink
 caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> This patch adds a simple test that allows to verify that, when resolving =
a
> symlink, user-space is called only the first time when caching is enabled
> or, if caching is disabled, every time the symlink resolution is requeste=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   6 +-
>  .../selftests/filesystems/fuse/symlink_fs.c   | 115 ++++++++++++++++++
>  .../filesystems/fuse/symlink_test.sh          |  52 ++++++++
>  4 files changed, 173 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/symlink_fs.c
>  create mode 100755 tools/testing/selftests/filesystems/fuse/symlink_test=
.sh
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index 3e72e742d08e..cfdc5ca3ded4 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  fuse_mnt
>  fusectl_test
> +symlink_fs
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 422cd1b1688d..342da0878006 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -3,7 +3,8 @@
>  CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>
>  TEST_GEN_PROGS :=3D fusectl_test
> -TEST_GEN_FILES :=3D fuse_mnt
> +TEST_PROGS :=3D symlink_test.sh
> +TEST_GEN_FILES :=3D fuse_mnt symlink_fs
>
>  include ../../lib.mk
>
> @@ -19,3 +20,6 @@ endif
>
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/symlink_fs: CFLAGS +=3D $(VAR_CFLAGS)
> +$(OUTPUT)/symlink_fs: LDLIBS +=3D $(VAR_LDLIBS)
> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_fs.c b/tool=
s/testing/selftests/filesystems/fuse/symlink_fs.c
> new file mode 100644
> index 000000000000..1aee26c91b3f
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/symlink_fs.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE symlink cache
> + *
> + * This is a simple FUSE filesystem that contains two objects: a file na=
med
> + * 'file' and a symlink to that file named 'link'.  Whenever the ->readl=
ink() is
> + * executed to resolve 'link' a counter will be incremented.  A ->read()=
 to any
> + * filesystem object will return the value in this counter.
> + *
> + * A '--cache' argument will allow to enable symlink caching (disabled b=
y
> + * default).  This means that, if caching is enabled, resolving a symlin=
k will
> + * only call into user-space the first time.
> + */
> +
> +#define FUSE_USE_VERSION 31
> +
> +#include <fuse.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stddef.h>
> +#include <assert.h>
> +
> +#define FILE   "file"
> +#define LINK   "link"
> +
> +static struct options {
> +       int cache_symlinks;
> +} options;
> +
> +static const struct fuse_opt option_spec[] =3D {
> +       { "--cache", offsetof(struct options, cache_symlinks), 1 },
> +       FUSE_OPT_END
> +};
> +
> +static int readlink_counter =3D 0;
> +
> +static void *symlink_init(struct fuse_conn_info *conn, struct fuse_confi=
g *cfg)
> +{
> +       if (options.cache_symlinks)
> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +
> +       return NULL;
> +}
> +
> +static int symlink_getattr(const char *path, struct stat *stbuf,
> +                          struct fuse_file_info *fi)
> +{
> +       int res =3D 0;
> +
> +       memset(stbuf, 0, sizeof(struct stat));
> +       if (strcmp(path, "/") =3D=3D 0) {
> +               stbuf->st_mode =3D S_IFDIR | 0755;
> +               stbuf->st_nlink =3D 2;
> +       } else if (strcmp(path + 1, FILE) =3D=3D 0) {
> +               char data[64];
> +
> +               stbuf->st_mode =3D S_IFREG | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D sprintf(data, "%d\n", readlink_counter=
);
> +       } else if (strcmp(path + 1, LINK) =3D=3D 0) {
> +               stbuf->st_mode =3D S_IFLNK | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D strlen(FILE);
> +       } else
> +               res =3D -ENOENT;
> +
> +       return res;
> +}
> +
> +static int symlink_readlink(const char *path, char *buf, size_t size)
> +{
> +       if (strcmp(path + 1, LINK) !=3D 0)
> +               return -ENOENT;
> +
> +       memcpy(buf, FILE, strlen(FILE));
> +       readlink_counter++;
> +
> +       return 0;
> +}
> +
> +static int symlink_read(const char *path, char *buf, size_t sz, off_t of=
f,
> +                       struct fuse_file_info *fi)
> +{
> +       char data[64];
> +       int len;
> +
> +       len =3D sprintf(data, "%d\n", readlink_counter);
> +       memcpy(buf, data, len);
> +
> +       return len;
> +}
> +
> +static const struct fuse_operations symlink_oper =3D {
> +       .init           =3D symlink_init,
> +       .getattr        =3D symlink_getattr,
> +       .readlink       =3D symlink_readlink,
> +       .read           =3D symlink_read,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +       int ret;
> +       struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
> +
> +       options.cache_symlinks =3D 0;
> +       if (fuse_opt_parse(&args, &options, option_spec, NULL) =3D=3D -1)
> +               return 1;
> +
> +       ret =3D fuse_main(args.argc, args.argv, &symlink_oper, NULL);
> +       fuse_opt_free_args(&args);
> +
> +       return ret;
> +}
> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_test.sh b/t=
ools/testing/selftests/filesystems/fuse/symlink_test.sh
> new file mode 100755
> index 000000000000..546541c1920e
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/symlink_test.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +exit_cleanup()
> +{
> +       fusermount -u ./mnt
> +       rmdir ./mnt
> +}
> +
> +assert_value ()
> +{
> +       if [ $1 -ne $2 ]; then
> +               echo "FAILED"
> +               echo $3
> +               exit 1
> +       fi
> +}
> +
> +set -e
> +
> +trap exit_cleanup EXIT
> +
> +mkdir -p mnt
> +
> +./symlink_fs ./mnt
> +
> +echo -n "Testing symlink without cached: "
> +
> +# When symlink caching is disabled every access to a symlink is expected=
 to
> +# result in a call to user-space
> +for i in $(seq 1 10); do
> +       readlink ./mnt/link > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value $res $i "Got $res, expected $i"
> +echo "PASSED"
> +
> +fusermount -u ./mnt
> +
> +./symlink_fs --cache ./mnt
> +
> +echo -n "Testing symlink with cache: "
> +
> +# With caching enabled, there will only be a single call into user-space
> +for i in $(seq 0 10); do
> +       readlink ./mnt/link > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value 1 $res "Got $ res, expected 1"
> +echo "PASSED"
>

As we discussed, consider doing this as a single c test program,
but not a must as you wish.

Thanks,
Amir.
