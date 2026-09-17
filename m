Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D428A4D4860
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658503; cv=pass; b=sjmjmXLifxdfyuaSdkf1K7UuvkESu9PC+NV8+DnSzZVIFcSXSzrAxZJFfoNKL5qzOSoWrtFjSk/EKkacFcGnRWKNLqB0n1UMVm4fJDR+XElJBDXn5id0Ug6kuYY8+M+rng899qVNCAprFZdBLjyYcUMB5F0VXHw+J7qnyghoGJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658503; c=relaxed/simple;
	bh=9FMDsPvWFuaAQkxmti4fhgAl1YH9QRCR8rYM6KPLS7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfpF12i8qoXyfGDlXYeoPEKlOCERp9VwxKn+xt4dzCwFvu7Ejyh7CPVGcpYjMD8fXFUk5SmpELGTZjMkLCSeaYf/fnjcJRmnfRrgbDj5xNo3KO4rZUJlGnSGgsJvTnNIXqqZ7/dpDJPc0/MR9MfJujuOnRo275SWoeyJbkCCqJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9P3s4/O; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9P3s4/O"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1561017a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 08:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658491; cv=none;
        d=google.com; s=arc-20260327;
        b=gZZHti1CrTAAbQA2RJJCcEHhKV+5/1N7U/WDFPF8ZbSvecFu1KbsLSO2aLiu9F173Y
         MpQYR2tTSc2Y3YJKdqBr9r+SVV1NU/KAAU7dOOs/b9MXlSIldK0WA9GAmIQP9Hg7Tfh7
         bvVeT5zY3qmwwzOF4y0ZtosV34lzVE3ZYdDhtPK4MQT14iG9xYMQXVGdDw6I82+QrYDv
         XNas7Mfexe386/EP7etDXHhHSXTDR1IjKlNq+qR2n+CqGMDNJWvQUDpEvKhd82SG5zQ5
         fTm3X33eCOaBGBxBDiXe6N6PJqY1kc6z4ZxVYxd52dd103eSp0eR1pBv0xBRrtPZz74H
         /X9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        fh=pUfL2tW+cxNvGBeJt//PTLN26hDT4bJq5CLurNjz56A=;
        b=s/4JIzqd2JGMJI5+1i++oXj6kuvZDeP9maDhZ6C/0te9gFH29twb1ICVlDH6zMDq70
         G8nk/dubDpt530kOsjqlU4u5srfKJwCQS5GqU1AI+BkrdXBJnhLkH7dbKjJRiD67ksxY
         eTDy0l/ezTCsvcwDxQN14ln3fQOOzdN8r8B3uBvLGvbzm6c5wP+UZJi3JmdksxR99zbM
         OEXV7mcphsXZcdt3e8W7tcKK6x8dxjKkt0hIdUeuiUdDKFGM211JY272Ek/U43TcpF0D
         f355CJcwpXfzUgFH0dk6zRALIBh+ASmIbcIipCBSLuXQ9bJLKMIlj0xspT7aTYa7ozQs
         Pisw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658491; x=1790263291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=o9P3s4/Oc6pnc+2yY3YQJORWVZXVmFhSYqC5DImOjxXB4yeTvQcqSmk12GvcPGLg0X
         6k9teb8K+1jW4sRK09/HpB4VxJB3JTYbM4RfrxNwqX6NHgVL6PrDcC/ZTun0lYaolNCo
         EFIIDSuNRj5DTmgV2jQ1ozo2foJQWWhbKP9+YVgBJ8NwpHp/g9+5f1AYdXb/Pqel4Wlc
         uXGvJXnXobtFiYbbb/F5ropmz8Ixr1KSea6HFf5DT6b1w4JycPszbBHnqdCxXzo6dcZD
         vN1o/X8KdaIPvluKTU1aV5S32fkQzKJjFsbp5nIj7E/jll/Wh1PR5F1lcumFYu2OSgjT
         EOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658491; x=1790263291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=A3PYXB+vwT6fy8a6zlZGz46pzMJdH3dJN3BufuqT+/HTO+GC9NJbW6YSj7SkoA9h42
         uCkwBLR699PhceZ9CG3zCThFMqeylnToZQ5eGGWq4JrtcBhTqBlzUAmyTmDdTEXmrcga
         b9Mhbgz5PEtYSEZtrZ6iVhZxQ5ePdzPSmPXE/vKLeB5oku4qEU9zlOptVLSNBXOPNmYa
         1Mqn7PkuuYFeRITJueK2FuCnuTIUdK/fKo5oF/oQ/gYALrqGpYfZTZyIDO9lGe3Gpi/N
         Obq83oqVJHePf5L0FRSiTnepayHSedd666i7YJyvMcQq5UhW/ek6TPhrPPE8CXKBDyUM
         G3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzivNtyun3qVbN6En223zNrv3+TA749C6MMDFfAiJFDvI999eeUEHIJdqg5NdgQLIMqk5/tTW4E8kjd9wUKggM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCiYVBAIfS8DZvcFRnz/mS1pM8E4xfkYDe7Q6gu0o0YRJze9cn
	/ZbuRhhVwA82DFXW1+WckDlYAb7LvNFhrawOy0GH1WyrEH0if6GXtw2bq7W2D32FY3xnvk1nk6X
	czrsC+0y3NtNj1+OEbOatGbbNlVgtr8M=
X-Gm-Gg: AYBFou0gBpqx+oTH7nb1jsHY80nFJZ57HZjqsApTkHPnD4tNQjUw9pwqbC+4WjpsDAN
	kPnKZ80vJvjFNGIri8WmL256eJgeezwnEkJzcFxaHYIkixBg/P8M5nP865Bf0DnSTiQRy+iETKg
	5vTsVX3kr30xlUUKox5nF+Wkr53SqAhME+CFqqtNg/C8TW1ATKQ477UVyWhLkKE5a56MIt5lzqa
	4ekv6cigj9z4VEbQ/LcPRALMk+L4yH/EhKblcU4Rwmg3Bu4H8Uge+/EEbFttZzrx9ao2Udbm3iO
	EO+kpTuqBCFOOFlPe9uYwAxdu8ex3dtJ9KIabc2Inm3ITmwT99adekKx
X-Received: by 2002:a05:6402:42c4:b0:6a9:c0ec:417a with SMTP id
 4fb4d7f45d1cf-6aa2241bf59mr10245245a12.18.1789658490477; Thu, 17 Sep 2026
 08:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-9-luis@igalia.com>
In-Reply-To: <20260916155629.32421-9-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:21:17 +0200
X-Gm-Features: AcwNN1URwt29tlBxEkB9KVLT9efpa4yicFwd1VKtlhlpwfUBFhqmHoQc4ZfkvOU
Message-ID: <CAOQ4uxiEm5njmBUX6XEv9049RLgdEoj53vbhtmtxrpRBYS+R-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 8/8] selftests/fuse: add fuse readdir caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This new test will check the caching behaviour using combinations of two
> opendir flags: FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index ebfe7133d811..ffa356f23e8c 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -4,3 +4,4 @@ fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
>  fuse_symlink_cache_test
> +fuse_readdir_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 3a5a557dde7a..570ced181168 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -6,6 +6,7 @@ TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
>  TEST_GEN_PROGS +=3D fuse_symlink_cache_test
> +TEST_GEN_PROGS +=3D fuse_readdir_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -30,5 +31,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>  $(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
> +$(OUTPUT)/fuse_readdir_cache_test: fuse_common.c fuse_readdir_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> new file mode 100644
> index 000000000000..1fdf422cf75b
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE readdir cache
> + *
> + * It will simply perform readdir operations on a directory checking how=
 many
> + * times a request is sent to user-space using all the possible caching
> + * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
> + */
> +
> +#include <stdio.h>
> +#include <dirent.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define DIRNAME "mydir"
> +#define FILENAME "myfile"
> +
> +#define DIR_INO 42
> +#define FILE_INO 43
> +#define DOT_INO 40
> +#define DOTDOT_INO 41
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       struct fuse_common_ctx ctx;
> +       time_t mtime;
> +       int readdir_counter;
> +       bool cache_readdir;
> +       bool keep_cache;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       e.ino =3D DIR_INO;
> +       e.attr.st_mode =3D S_IFDIR | 0755;
> +       e.attr.st_nlink =3D 1;
> +       pthread_mutex_lock(&test_state.lock);
> +       e.attr.st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
> +       e.attr_timeout =3D TIMEOUT;
> +       e.entry_timeout =3D TIMEOUT;
> +
> +       fuse_reply_entry(req, &e);
> +}
> +
> +static int fill_stat(fuse_ino_t ino, struct stat *st)
> +{
> +       int ret =3D 0;
> +
> +       st->st_ino =3D ino;
> +       pthread_mutex_lock(&test_state.lock);
> +       st->st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       switch (ino) {
> +       case FUSE_ROOT_ID:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 2;
> +               break;
> +       case DOT_INO:
> +       case DOTDOT_INO:
> +       case DIR_INO:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 1;
> +               break;
> +       case FILE_INO:
> +               st->st_mode =3D S_IFREG | 0444;
> +               st->st_nlink =3D 1;
> +               break;
> +       default:
> +               ret =3D -1;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +
> +       if (fill_stat(ino, &st) < 0)
> +               fuse_reply_err(req, ENOENT);
> +       else
> +               fuse_reply_attr(req, &st, TIMEOUT);
> +}
> +
> +static void fs_opendir(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fi->keep_cache =3D test_state.keep_cache;
> +       fi->cache_readdir =3D test_state.cache_readdir;
> +       pthread_mutex_unlock(&test_state.lock);
> +       fuse_reply_open(req, fi);
> +}
> +
> +static void fs_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
> +                      off_t offset, struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +       char buf[1024];
> +       char *pbuf;
> +       size_t rem =3D size;
> +       size_t sz;
> +       int nextoff =3D 0;
> +
> +       if (ino !=3D DIR_INO) {
> +               fuse_reply_err(req, ENOTDIR);
> +               return;
> +       }
> +       if (offset) {
> +               fuse_reply_buf(req, NULL, 0);
> +               return;
> +       }
> +       pbuf =3D buf;
> +       fill_stat(DOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, ".", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(DOTDOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, "..", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(FILE_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, FILENAME, &st, nextoff++=
);
> +       rem -=3D sz;
> +
> +       fuse_reply_buf(req, buf, size - rem);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readdir_counter++;
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .lookup         =3D fs_lookup,
> +       .getattr        =3D fs_getattr,
> +       .opendir        =3D fs_opendir,
> +       .readdir        =3D fs_readdir,
> +};
> +
> +FIXTURE(readdir_cache) {};
> +
> +FIXTURE_VARIANT(readdir_cache)
> +{
> +       bool cache_readdir;
> +       bool keep_cache;
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, nocache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache_readdir)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, keep_cache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D true,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D true,
> +};
> +
> +FIXTURE_SETUP(readdir_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.mtime =3D time(NULL);
> +       test_state.readdir_counter =3D 0;
> +       test_state.cache_readdir =3D variant->cache_readdir;
> +       test_state.keep_cache =3D variant->keep_cache;
> +
> +       if (fs_setup(&fs_ops, &test_state.ctx, err))
> +               SKIP(goto out, err);
> +out:
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +FIXTURE_TEARDOWN(readdir_cache)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fs_teardown(&test_state.ctx);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +


With ctx moved to fixture, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> +TEST_F(readdir_cache, test_readdir_cache)
> +{
> +       struct dirent *dentry;
> +       DIR *dir;
> +       char pathname[PATH_MAX];
> +       int total_counter, rewind_counter;
> +       int dentrycount;
> +
> +       sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, DIRNAME);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       rewinddir(dir);
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       rewind_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       total_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (!variant->cache_readdir) {
> +               ASSERT_EQ(rewind_counter, 2);
> +               ASSERT_EQ(total_counter, 3);
> +       } else if (!variant->keep_cache) {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 2);
> +       } else {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 1);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
