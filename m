Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691174E3236
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658353; cv=pass; b=FqiHMgmKQRUAiqCBHox4qyRWehIgd4dc4L2RxlOVZCjKcJbB5+tCGQQs7rueCfea2XB4oOEMhgInbCgPaHFLcI0Dn30mcdKNQNdQ88+wF6egsLy1EfHXS2wrcpQMSdGUX271/NDt6FyTJPt8lNScsoXnvpN1K0xgyNHVnkrt+88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658353; c=relaxed/simple;
	bh=wKBBpqxICSTSJH9KovkCmpB4Wf9jAq3IpKkz8RphBEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fag+qO+ABAifKlEMq8NG9NFfC2oF8Ql2822kPaCUmZ+BkKjnSFziAmnWxJm1nzLHOrsUopzdILSEiJfkNm9j8YFe6cV6XeEe9O2RESDS9UDJlC6xsR92jZd79wkk+ruLoJa3xD/Fx8EI4O4t2rEZsthTb2JoK+VkAEOkwUAw3Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdqhEleU; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdqhEleU"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso153340466b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 08:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658336; cv=none;
        d=google.com; s=arc-20260327;
        b=Mc+fWXoLm75M2FxLc84K8Q2DOBaII4VMKy+6+UohcxeFtG7k/OpAJQXdrjZBlQHPnX
         CcKqt+Z41704m60agx9fW6+k6ysYwt34CuvNtDsbp6CQfYvZPY/q/UvcUquALvFO0IKW
         Rc/s1KSs97/Hrq5xofu2DNMv83nkZzHTB9Q2csEwXPoEOelZH5VjnXVXmQtkabyY1wQC
         YwNc0z83r01nt/IBgpCHZaZxNAcYU3xpDSuetmd75+DMbCevmkvibMMF1A0mTQCZYGTQ
         w1o0ZkM+WkO/+yNwTNkQWg7hbRhJsN6UhNaWmigvYYSIu98vL8qH8+PWu9gxLrVeV99x
         V8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        fh=pUQfgKCs3wPgiSr/Dg2B4CnqMWB4efqZ17gChhEZrvI=;
        b=spXd034T58uEYM1/IDHxMvNHNdeuRc0c/sqncFSMPSxXvAiBodAM1nKZP+K2we9The
         IYfXqm0jiAdbFTimhLJ0gNeXZEy0qKA6CGUi8dSSyvsH55QCwBsKZO9QIeFJAUj+xBEZ
         4tKQSPrLyRYz3HKL9dyanbn6ZcVhxroZm14yxgHjs+sMHywCAWdwDhlcdwH06ndR9wpV
         BRKccQHllHGjaeaAE55ifZ1kUwadgJRjyfSSjCxxFK88KlexKYsx+3jIsRAEhK+qgrY7
         vZfW3hB07b9i1L1d2c2JA1QpuPXNS4p06JbUZXa+GQrswzfUOnhb/RCjJqYykmQwwDdN
         /W3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658336; x=1790263136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        b=PdqhEleUU9g4PrziBa7ayBvjiE4mOE6AkCIfbO+L1e4HmCFBhO+/EjuhtY/yteTavn
         RDDNuwcTHS5vu2+xRyFjuoUsSXMX+a/5klm+2fSdO40Onz3lrHZ7e8u4DmCH1r+O/OGC
         W69fYTgvuNNH/MXKqoBtFYIZVcVp5cVyrkC9vNNzSAtH+QBiGIOXlceQIHfoViGDEbFn
         ChcaNxgU6q9C9N6DD2sqDlq28swaHnbenBWO5gRX3cxyXRyw5lVYqQ9qvy/16YgPSHiq
         ZQQjBSaGTnFmjSkeVxBk1RRetRyLkfsfS1YYaubSirObOb6RaP/2gbXHcBxECHgH+T+A
         x/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658336; x=1790263136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvBiRaBEozWOEdoyBMPd97Z2Iz6BQFRDi2IwFNwZ66g=;
        b=1i9eZ5IS1a08OQd7Eqf1pWbpf6l+rpHC4LRgXyeRYpe0Xdt7xsLcpJ/gAuil6rcePJ
         5MWF1GXx5wGgkhOh18s180dJT96+lKAEQuysaeua9FkHwpj7SJkIawAE0XAk4dF0ILFm
         PnhNVIYYd8d5u40wCLAB+B0B3pbhkNQt3gdlyHftY+Ze3Oiw6XhqFV19cQI35KM809/M
         qYZGQzTEUqK4PMjYQQ+sL6kupj+VXATWG4F4OBToOZJfQGpIHemyjF9K715fsp/SAZYP
         jz88jgIZJr4LjMz1kj7Vp6Tse+xkrHUetdLcmvtmjUzwBrVen9ZtgmNeMKpv/C3jjICa
         Awlw==
X-Forwarded-Encrypted: i=1; AKwUvBxYZ4PwrHnVcbXWV8F1g3WArydrz5Ug49U93J7bTkscClkkZXnXM+HlS4YQ6lbeQI6hvT+BiexvMym3qGAOxD4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFypUOOWQsqqOOzX3PTAar8Nx8rQogmoeV3MFVnyrVmgY1DQC+
	u0PUqkzHkIK5av0mNMRUvK+C01zPdZW6i2iWl5e/DG89dgHNIUbUGdzHgq0AGSx+twxNkZGsClR
	uEpvTUMygEvoLqeV6N5+LTyT438FZaVc=
X-Gm-Gg: AYBFou1UyRiukCt6RpMaIgwD/cZB5+5xbUXiUWwPUvOiJ4X1+CdaMH9N2mb7UwD6Cgl
	mTaCLMPtdyrIfXXrgxSvArC4CrrxUDz8ckTxx616KMnoqcT6d3cQPYPy6IBnfHjPb+4L65GN/Xs
	SDkEyS2nCcAVoPNv+/OHaxDiMlIpaQfvNEuy8KW5+OZqkXlfY057ioQSZJIcFFq3nldhnNTbYD/
	GAOU4HIBi/jKgc4maqDV9NLYxpRy2A584FfCNxndUT32AO1y3H2SsGUYv1jxUi/a+xd9xhdArBV
	bnJbY01EEr7WBqnaVDqE7W/L0YGOxw4ZstYDLqEoh/MDAFLNiJYeXQ9TpNeYNUkj4Ys=
X-Received: by 2002:a17:907:3f17:b0:c29:dd71:7521 with SMTP id
 a640c23a62f3a-c29e52094e2mr503882066b.13.1789658336185; Thu, 17 Sep 2026
 08:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-8-luis@igalia.com>
In-Reply-To: <20260916155629.32421-8-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:18:44 +0200
X-Gm-Features: AcwNN1Va1Hx-ENLvFA82HWE6oaHaqZG_YKBqIXvUfSNMOWmG1KlMF0bX0RUSInc
Message-ID: <CAOQ4uxiSpFXtsfV8J+taEyCvsxcyp5dmMoOtSybK-3m4CUSu6A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 7/8] selftests/fuse: add fuse symlink caching test
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
> This patch adds a simple test that allows to verify that, when resolving =
a
> symlink, user-space is called only the first time when caching is enabled
> or, if caching is disabled, every time the symlink resolution is requeste=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_symlink_cache_test.c            | 163 ++++++++++++++++++
>  3 files changed, 166 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index f7f3dd345a50..ebfe7133d811 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -3,3 +3,4 @@ fuse_mnt
>  fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
> +fuse_symlink_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 7744f796eb06..3a5a557dde7a 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -5,6 +5,7 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>  TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
> +TEST_GEN_PROGS +=3D fuse_symlink_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -28,5 +29,6 @@ $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> +$(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> new file mode 100644
> index 000000000000..dd001736ebca
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE symlink cache
> + *
> + * This is a simple FUSE filesystem that contains two objects: a file na=
med
> + * 'file' and a symlink to that file named 'link'.  If symlink caching i=
s
> + * disabled (i.e. FUSE_CAP_CACHE_SYMLINKS is reset during FUSE_INIT), wh=
enever
> + * the ->readlink() is executed to resolve 'link' a counter will be incr=
emented.
> + *
> + * If symlink caching is enabled (i.e. FUSE_CAP_CACHE_SYMLINKS is set du=
ring
> + * FUSE_INIT), resolving a symlink will only call into user-space the fi=
rst
> + * time.
> + */
> +
> +#define FUSE_USE_VERSION 31
> +
> +#include <stdio.h>
> +#include <fuse_lowlevel.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define FILENAME "file"
> +#define FILE_INO 42
> +
> +#define LINKNAME "link"
> +#define LINK_INO 43
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       struct fuse_common_ctx ctx;
> +       int readlink_counter;
> +       bool cache;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       if (test_state.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       else
> +               fuse_unset_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID ||
> +           (strcmp(name, FILENAME) !=3D 0 && strcmp(name, LINKNAME) !=3D=
 0)) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       if (!strcmp(name, FILENAME)) {
> +               e.ino =3D FILE_INO;
> +               e.attr.st_mode =3D S_IFREG | 0444;
> +               e.attr.st_nlink =3D 2;
> +       } else if (!strcmp(name, LINKNAME)) {
> +               e.ino =3D LINK_INO;
> +               e.attr.st_mode =3D S_IFLNK | 0444;
> +               e.attr.st_nlink =3D 1;
> +               e.attr.st_size =3D strlen(FILENAME);
> +       }
> +       e.attr_timeout =3D TIMEOUT;
> +       e.entry_timeout =3D TIMEOUT;
> +
> +       fuse_reply_entry(req, &e);
> +}
> +
> +static void fs_readlink(fuse_req_t req, fuse_ino_t ino)
> +{
> +       char buf[PATH_MAX];
> +       size_t sz =3D strlen(FILENAME);
> +
> +       if (ino !=3D LINK_INO) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       memcpy(buf, FILENAME, sz);
> +       buf[sz] =3D '\0';
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readlink_counter++;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       fuse_reply_readlink(req, buf);
> +}
> +
> +static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .init           =3D fs_init,
> +       .lookup         =3D fs_lookup,
> +       .readlink       =3D fs_readlink,
> +};
> +
> +FIXTURE(symlink_cache) {};
> +FIXTURE_VARIANT(symlink_cache)
> +{
> +       const bool cache;
> +};
> +FIXTURE_VARIANT_ADD(symlink_cache, symlinks_nocache)
> +{
> +       /* Variant with symlink cache disabled */
> +       .cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(symlink_cache, symlinks_cache)
> +{
> +       /* Variant with symlink cache enabled */
> +       .cache =3D true,
> +};
> +
> +FIXTURE_SETUP(symlink_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readlink_counter =3D 0;
> +       test_state.cache =3D variant->cache;
> +
> +       if (fs_setup(&fs_ops, &test_state.ctx, err))
> +               SKIP(goto out, err);
> +out:
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +FIXTURE_TEARDOWN(symlink_cache)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fs_teardown(&test_state.ctx);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +

Here too, unless you have a good reason not to,
please put fuse_common_ctx in the test fixture object.

With that fix, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> +TEST_F(symlink_cache, test_symlink_cache)
> +{
> +       char pathname[PATH_MAX];
> +       char buf[PATH_MAX];
> +       ssize_t sz;
> +       int counter;
> +       int i;
> +
> +       sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, LINKNAME);
> +       for (i =3D 0; i < 100; i++) {
> +               sz =3D readlink(pathname, buf, PATH_MAX);
> +               ASSERT_NE(sz, -1);
> +       }
> +       pthread_mutex_lock(&test_state.lock);
> +       counter =3D test_state.readlink_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (variant->cache) {
> +               ASSERT_EQ(counter, 1);
> +       } else {
> +               ASSERT_EQ(counter, 100);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
