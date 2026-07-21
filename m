Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2431F999;
	Tue, 21 Jul 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638698; cv=none; b=DXeOdPV8io0MUAOiyUP8hUWS6riZuhgXv74WVc8F9s5fdUaXNj2kNoYzuIXFJaSKUcaNUNRulYrGroBNvZC0qJ3h3/bKstz+6WkvRuxiy4E5/c2TzIbX6qPl838whzuRvzicxPI0Ap37bIJeMerCEOvkbNzg0/ygs0onjLcujwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638698; c=relaxed/simple;
	bh=JQmqrAUk1ZwGjMIo7GgtkT9jS9A2MoD2UpnjJhq+oP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WrwNcvdsp+clhnbSPXP4ZKKe94ufFvqpQ5yLrMbBjzl/m68GehbGpSW2BVn2Pk5xWUG03pPqE0WY7JLCsnaA7umggnCAyiPGo/o1dPO6t4LhDk3B9DeDaZc7wih9W7JZ4dkg9pTVKPa/zqOONX9x0BNbZLf2AZImNH2M5A2zxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jGi2yUkf; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jGi2yUkf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=EVH5eSMZjbI53wn96cmF4UPKnZJsjhXjwtt59ZAf/Sk=; b=jGi2yUkfnmiAdfihqoEcpG/Pw3
	S7fsZAeNrfZWcd4hwgoXX1G5vpaJDrw5/vfG7kSWG0yHu2nqgkcrsjXCo99EX+U8aX4VGpUvOzWEN
	0Lt4C3+9SSFdCejee8ntYDpUHQGCqLULA4TdQvN7sIPTX3W/6oM8upOescbIWGSQHlFUm4GIpUbEC
	yn9SP9gV6f7gdnWTrb8vEpGaTN8kII9b2r9hfayy3VmTSXitp87h0oYxYgYJ992vc067yoBbHzv8i
	RoL0zK5U1rkBZ7g8MGK/rvhyNjX1oq/PLIdKzB/17C2ZhXrad5oQ0/EqJysJXJFIA9H981ZkoJMRS
	adV4Mxgw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wmA31-001bn6-EZ; Tue, 21 Jul 2026 14:58:11 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Harvey
 <mharvey@jumptrading.com>, kernel-dev@igalia.com
Subject: Re: [RFC PATCH v1 4/5] selftests/filesystems: add fuse symlink
 caching test
In-Reply-To: <CAOQ4uxiOqkXfySiFcYhWUR_c1_UeAA62vK2Py-ML=TpQyrUbCw@mail.gmail.com>
References: <20260708131122.2917-1-luis@igalia.com>
 <20260708131122.2917-5-luis@igalia.com>
 <CAOQ4uxiOqkXfySiFcYhWUR_c1_UeAA62vK2Py-ML=TpQyrUbCw@mail.gmail.com>
Date: Tue, 21 Jul 2026 13:58:12 +0100
Message-ID: <87qzkwo5y3.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amir Goldstein <amir73il@gmail.com> writes:

> On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> w=
rote:
>>
>> This patch adds a simple test that allows to verify that, when resolving=
 a
>> symlink, user-space is called only the first time when caching is enabled
>> or, if caching is disabled, every time the symlink resolution is request=
ed.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>>  .../selftests/filesystems/fuse/Makefile       |   6 +-
>>  .../selftests/filesystems/fuse/symlink_fs.c   | 115 ++++++++++++++++++
>>  .../filesystems/fuse/symlink_test.sh          |  52 ++++++++
>>  4 files changed, 173 insertions(+), 1 deletion(-)
>>  create mode 100644 tools/testing/selftests/filesystems/fuse/symlink_fs.c
>>  create mode 100755 tools/testing/selftests/filesystems/fuse/symlink_tes=
t.sh
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools=
/testing/selftests/filesystems/fuse/.gitignore
>> index 3e72e742d08e..cfdc5ca3ded4 100644
>> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
>> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
>> @@ -1,3 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  fuse_mnt
>>  fusectl_test
>> +symlink_fs
>> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/t=
esting/selftests/filesystems/fuse/Makefile
>> index 422cd1b1688d..342da0878006 100644
>> --- a/tools/testing/selftests/filesystems/fuse/Makefile
>> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
>> @@ -3,7 +3,8 @@
>>  CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>>
>>  TEST_GEN_PROGS :=3D fusectl_test
>> -TEST_GEN_FILES :=3D fuse_mnt
>> +TEST_PROGS :=3D symlink_test.sh
>> +TEST_GEN_FILES :=3D fuse_mnt symlink_fs
>>
>>  include ../../lib.mk
>>
>> @@ -19,3 +20,6 @@ endif
>>
>>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>> +
>> +$(OUTPUT)/symlink_fs: CFLAGS +=3D $(VAR_CFLAGS)
>> +$(OUTPUT)/symlink_fs: LDLIBS +=3D $(VAR_LDLIBS)
>> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_fs.c b/too=
ls/testing/selftests/filesystems/fuse/symlink_fs.c
>> new file mode 100644
>> index 000000000000..1aee26c91b3f
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/symlink_fs.c
>> @@ -0,0 +1,115 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Simple filesystem to test FUSE symlink cache
>> + *
>> + * This is a simple FUSE filesystem that contains two objects: a file n=
amed
>> + * 'file' and a symlink to that file named 'link'.  Whenever the ->read=
link() is
>> + * executed to resolve 'link' a counter will be incremented.  A ->read(=
) to any
>> + * filesystem object will return the value in this counter.
>> + *
>> + * A '--cache' argument will allow to enable symlink caching (disabled =
by
>> + * default).  This means that, if caching is enabled, resolving a symli=
nk will
>> + * only call into user-space the first time.
>> + */
>> +
>> +#define FUSE_USE_VERSION 31
>> +
>> +#include <fuse.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <stddef.h>
>> +#include <assert.h>
>> +
>> +#define FILE   "file"
>> +#define LINK   "link"
>> +
>> +static struct options {
>> +       int cache_symlinks;
>> +} options;
>> +
>> +static const struct fuse_opt option_spec[] =3D {
>> +       { "--cache", offsetof(struct options, cache_symlinks), 1 },
>> +       FUSE_OPT_END
>> +};
>> +
>> +static int readlink_counter =3D 0;
>> +
>> +static void *symlink_init(struct fuse_conn_info *conn, struct fuse_conf=
ig *cfg)
>> +{
>> +       if (options.cache_symlinks)
>> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
>> +
>> +       return NULL;
>> +}
>> +
>> +static int symlink_getattr(const char *path, struct stat *stbuf,
>> +                          struct fuse_file_info *fi)
>> +{
>> +       int res =3D 0;
>> +
>> +       memset(stbuf, 0, sizeof(struct stat));
>> +       if (strcmp(path, "/") =3D=3D 0) {
>> +               stbuf->st_mode =3D S_IFDIR | 0755;
>> +               stbuf->st_nlink =3D 2;
>> +       } else if (strcmp(path + 1, FILE) =3D=3D 0) {
>> +               char data[64];
>> +
>> +               stbuf->st_mode =3D S_IFREG | 0444;
>> +               stbuf->st_nlink =3D 1;
>> +               stbuf->st_size =3D sprintf(data, "%d\n", readlink_counte=
r);
>> +       } else if (strcmp(path + 1, LINK) =3D=3D 0) {
>> +               stbuf->st_mode =3D S_IFLNK | 0444;
>> +               stbuf->st_nlink =3D 1;
>> +               stbuf->st_size =3D strlen(FILE);
>> +       } else
>> +               res =3D -ENOENT;
>> +
>> +       return res;
>> +}
>> +
>> +static int symlink_readlink(const char *path, char *buf, size_t size)
>> +{
>> +       if (strcmp(path + 1, LINK) !=3D 0)
>> +               return -ENOENT;
>> +
>> +       memcpy(buf, FILE, strlen(FILE));
>> +       readlink_counter++;
>> +
>> +       return 0;
>> +}
>> +
>> +static int symlink_read(const char *path, char *buf, size_t sz, off_t o=
ff,
>> +                       struct fuse_file_info *fi)
>> +{
>> +       char data[64];
>> +       int len;
>> +
>> +       len =3D sprintf(data, "%d\n", readlink_counter);
>> +       memcpy(buf, data, len);
>> +
>> +       return len;
>> +}
>> +
>> +static const struct fuse_operations symlink_oper =3D {
>> +       .init           =3D symlink_init,
>> +       .getattr        =3D symlink_getattr,
>> +       .readlink       =3D symlink_readlink,
>> +       .read           =3D symlink_read,
>> +};
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +       int ret;
>> +       struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
>> +
>> +       options.cache_symlinks =3D 0;
>> +       if (fuse_opt_parse(&args, &options, option_spec, NULL) =3D=3D -1)
>> +               return 1;
>> +
>> +       ret =3D fuse_main(args.argc, args.argv, &symlink_oper, NULL);
>> +       fuse_opt_free_args(&args);
>> +
>> +       return ret;
>> +}
>> diff --git a/tools/testing/selftests/filesystems/fuse/symlink_test.sh b/=
tools/testing/selftests/filesystems/fuse/symlink_test.sh
>> new file mode 100755
>> index 000000000000..546541c1920e
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/symlink_test.sh
>> @@ -0,0 +1,52 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +exit_cleanup()
>> +{
>> +       fusermount -u ./mnt
>> +       rmdir ./mnt
>> +}
>> +
>> +assert_value ()
>> +{
>> +       if [ $1 -ne $2 ]; then
>> +               echo "FAILED"
>> +               echo $3
>> +               exit 1
>> +       fi
>> +}
>> +
>> +set -e
>> +
>> +trap exit_cleanup EXIT
>> +
>> +mkdir -p mnt
>> +
>> +./symlink_fs ./mnt
>> +
>> +echo -n "Testing symlink without cached: "
>> +
>> +# When symlink caching is disabled every access to a symlink is expecte=
d to
>> +# result in a call to user-space
>> +for i in $(seq 1 10); do
>> +       readlink ./mnt/link > /dev/null
>> +done
>> +
>> +res=3D$(cat ./mnt/file)
>> +assert_value $res $i "Got $res, expected $i"
>> +echo "PASSED"
>> +
>> +fusermount -u ./mnt
>> +
>> +./symlink_fs --cache ./mnt
>> +
>> +echo -n "Testing symlink with cache: "
>> +
>> +# With caching enabled, there will only be a single call into user-space
>> +for i in $(seq 0 10); do
>> +       readlink ./mnt/link > /dev/null
>> +done
>> +
>> +res=3D$(cat ./mnt/file)
>> +assert_value 1 $res "Got $ res, expected 1"
>> +echo "PASSED"
>>
>
> As we discussed, consider doing this as a single c test program,
> but not a must as you wish.

Sure, next iteration will have this test as a stand-alone c program.

Cheers,
--=20
Lu=C3=ADs
