Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7623A7189
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611581; cv=pass; b=K+19Ptr9UrLBFbDvo5LZbCQd+QW65MoCoAZOX7nbDbrkAtO7dQi7+wqADaF30JaUny+azg2jVCuzi/89hhqei7i7l3JBTdxUBTfQ3fAGmfnFyAazce/4Bm3ov+f/pGLptxZ9UU9QDOEGXaNGEOBeSHXBgXiV3QKHeyxv7Gg+Dk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611581; c=relaxed/simple;
	bh=x6U/123YgrqcVQf2CeHxg1MTANfKyOHf3TPTf0tKoqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYlZ9T080rREq9Gu1wH2iEItsaZJYFFBXx3BeKBxuQSCBdYn1waNWT/xIckmjW5WaYJFyxkoFHGa0OAiKks1jsB9kQ1yl/lkw8nyv1FvkQEplUF94uH6dOxCD01QOnd39TY4964ct5uAs5J5O3XhqK6egDDr32bSqXZQUtDHn1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE3S76qf; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE3S76qf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so4270660a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 05:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611578; cv=none;
        d=google.com; s=arc-20260327;
        b=nj20Qfw5McDjAQHOTY7ecR4Lf+BY2wQoYi44FQ5CPXNVuFWscm4HS91eRb/gvsigdY
         ntFSVp9pIqTgiC7W6xiX8w2HzKJuPDqYhOu7+4LLUlfSDnsqoM3uKBG6NrSQx5vcOId9
         Xdc0Ylak5wiEk7hgXS7QdSBjDVorb8P9D2qPJuhrjJC+v8+NMa2iDofAnzUKwEnC5dii
         o1XEIIFZ3UmW5jMReb9XN6Ie9hEJKhu/CmeMaK0Ekat7RRQnYkC5sjGPgtMHBptVp6R/
         mddvSo9iWgab6ry7X0DWBO4H9/gke+0zInu71ggD2jhNX026tn+WKpoRnA+Vlih/Xcd9
         Zf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        fh=hI5TnUCy6vgPwO9CIXrwIvm/tN3BrWDKFf4kUyyoqO4=;
        b=ksNbvPHiM9Z3XhgDGA+t1hFy4lXvTdv3Kab6loMH6mVUkyu+hDhz1X0+a7gc8u9Xzo
         zfH2yH0Gip3fT4zCoLtF9/KoNl8TXX9iOB4i+l9h/iYex29dZdY86EWIjBF/R6BCat+I
         mz9lf78I6qENpLBQsfJA88E4wpkBH3GneY8BeuWtnf27TJHupe9SV5mJCfdp0/EnNFwE
         MqLIcJRa2Y8r1ny4s4WbirEZJwb5XoppiaBs9q00+/ZxxkzKfQ21+eDsCbHCjPgdFXrw
         zI82wR8A3AgNXvhQ3EOvHm7gwK1QHBVTTGae/Io29XrUoCZU3Z5eC+Zz1le5DaQv4Zzh
         VmUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611578; x=1789216378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=BE3S76qfzaOERBDuNPrsvZb618lyUQjT93PD5uUL5hU7UtMTL7ZmcOfyQ27NyWT2iv
         ALRJFpcXOEciwIHaDrui3TQjdBkqSvHQS8ko6wuTgmNzFLT1H12C37niBtoqmEakXz0/
         xQRtHOKjn3RfQ934//4EGLw9/XFDgneBiP6XRfos9ttVjWmeCuX1kYOQTDDwtUpyIgNJ
         CGpyrGjZizh8dcyema7S0H4Loo0tpq0smYWdJVKub6vWMzCbCQlR0/U6dR7BsKf0ZGBD
         WC5/mJFyCbaPXjJoRoyViZ8H7UwxnYVDlxWi/mhsmSJabbIwwKpT3V+JSSuF2mIUXZn1
         tJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611578; x=1789216378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=EJZV6aFAAo+nqso0UG74r00/kLrjz4KGSxSEDfhixG5j+AbPqu2VKJgyTWX5WkyjVN
         QoekpXc3fDjtumjuIwu4vW/Lw5SEstNj75cr+ir09knadf2ReOHbnbhzqBnXFvAaHwLC
         VOZNzCwXCB3O02l273/spyHi69wv+oAqc9veE/S/rMRrUPxMIxE8x90tequSClW7nhoK
         b+zBxGi1hP1j7F3KdU6+5qs3FLXBjM0nCLvP6h9R0JJXiNBNBBTnIzzNnoBp8OyTBT8+
         RxojNyIbB7QgEn3uerDu3yIUp+fe3OmVI8vQ/ZiRLR4xkN73qxk36lm0TQGX936egioo
         nOAQ==
X-Forwarded-Encrypted: i=1; AKwUvByecFoJ9L4SXJVtUMfjBch8m7ThPNVFoGCP3lEtOsF3dSA6W0Mm2fhUQzKLja8LN2OIoEifDjAqrSn/p25U0/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kD+gvC1x5NVyaot/FNiiK9N8QORtEBrL1v//UI8o/s8J6juPjw
	dY9/w1UxnrWfnuKdlkUoTHv+5fQmJG05mN3oCdSnfv8s6tonAfa8zWlenvpdhokhgBYiPo+tqbM
	scLf8C0xG1ICZ2SVffKoxBaW2viVJfkA=
X-Gm-Gg: AYBFou2EKFxOklhX1rsA0QWOfpbc0Oz5j+KLDIhl0WiPmlUXixbskKKabNdQqkSmRNW
	iMLFsm7IbQyOWnwBcjUvFsjidAkTKTIKharFwqLmp9bNeeZFQlA7wvlKCaIN2k4XFYj1/fDixlF
	PYutfPFP+7IGAQDLinBPBcjQ+7+gF0R0sQ2lpoUt9J2t2xKNov7yqL4xGSefaoOZTDx2/05AAkt
	0twpaFFhZyMZ546poX8BQOLh8ZRoM1YYiTMHK3VHU4LyDOp/zcpO1gN9evkHgu5GrSQhkbughKq
	+Rrw3nw+ipbq6Sx1M/XS171Fmj/m81rxYUjwZIfwHXij2A==
X-Received: by 2002:a05:6402:2023:b0:6a7:ef6b:6c7 with SMTP id
 4fb4d7f45d1cf-6a7ef6b0b9emr2296122a12.1.1788611578044; Sat, 05 Sep 2026
 05:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-8-luis@igalia.com>
In-Reply-To: <20260904103920.4471-8-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:32:46 +0200
X-Gm-Features: AcwNN1X-4hUbgOK-AYX9YtX0eCMKTuoBNYsFddSvoCKtiEjWVnCUplIuLJuxzAE
Message-ID: <CAOQ4uxhFCKOLexyiP6DQ=a9t+8dhGn=tJLGyHg0NHPz=mPDkhw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 7/8] selftests/fuse: add fuse symlink caching test
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
>  .../fuse/fuse_symlink_cache_test.c            | 167 ++++++++++++++++++
>  3 files changed, 170 insertions(+)
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
> index 000000000000..ca3c5cdaf578
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> @@ -0,0 +1,167 @@
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
> +#include <limits.h>
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
> +       bool cache;
> +       int readlink_counter;
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
> +           (!strcmp(name, FILENAME) && !(strcmp(name, LINKNAME))))

You probably meant strcmp() !=3D 0 ...
Did you miss this Sashiko comment?

Thanks,
Amir.
