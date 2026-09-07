Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176434964F;
	Mon,  7 Sep 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778672; cv=none; b=C8ZhiHILNThQsb6SXp5+/UaAWJP8IAWVxzsW5c4loCXtSHNSw0TKhDcw/8mwYEA1LS4W8V89DoU2kYROW050IJwLvso9SY5XQgxbfDSvSGX8bJh4GfKi1XWr95avB6Tdk4ri8kwebsSPzxpFknjaxvY8/TBCD03Yi3K1huwtjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778672; c=relaxed/simple;
	bh=3PDFtlco4OcZygR+DrQDf/kVT7D/7gQJWD424nAICOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M53/Wsn7UpQeK/RKJPc+TdPLCvc2fQltMgwQ+27TQSsocTG3pPyuThoJ2vL4nAm6dRpesgOLEto18DMSRynkJuUrdYHU579pvjT3e4v33ca0IfMPzXt5QaMDcuJTR57gT3hy1lPcJi3hvNSNqWa+GOOH8/jXCm6hYBWsrUWmgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=e1WsTKHr; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="e1WsTKHr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=tf3EYimRWhnEVKPQh6ORuRf1OW6Z+eMnNd2CBmc1Gco=; b=e1WsTKHrd39a2DnhXC34g4utpo
	rBWi/Ar3pDwHYt1XiQtdfEOqE/HRl43R90QvlA+V+0gxDswhp3Ekjnbrq/Jp7rvxRWNujusKq5/aw
	4PFixqt77gETG69bd2BZqb/ssf99Pr18RCfG2yII5v3Zw0RSwKFNs74VrFpyDPxAWGOTyUsSq65TD
	n99nsMoR79liSCp6I2ZPe+xq4nSD3U/CFfvzQmk2IR3y23pki8L2f9eSwARjyvgK0OWeqiuYeUJL9
	JwjjjWtT5wealIH6n3SZpY6XVyac0Ge+6GSvDfRWSfT6WSQ9RJbihbyRc8NqSqVXXY8HLbPbjrTvb
	3S/9MqQw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x3X2k-00Fzg0-Rx; Mon, 07 Sep 2026 12:57:42 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 7/8] selftests/fuse: add fuse symlink caching test
In-Reply-To: <CAOQ4uxhFCKOLexyiP6DQ=a9t+8dhGn=tJLGyHg0NHPz=mPDkhw@mail.gmail.com>
	(Amir Goldstein's message of "Sat, 5 Sep 2026 14:32:46 +0200")
References: <20260904103920.4471-1-luis@igalia.com>
	<20260904103920.4471-8-luis@igalia.com>
	<CAOQ4uxhFCKOLexyiP6DQ=a9t+8dhGn=tJLGyHg0NHPz=mPDkhw@mail.gmail.com>
Date: Mon, 07 Sep 2026 11:58:29 +0100
Message-ID: <87cxupfhuy.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05 2026, Amir Goldstein wrote:

> On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
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
>>  .../selftests/filesystems/fuse/Makefile       |   2 +
>>  .../fuse/fuse_symlink_cache_test.c            | 167 ++++++++++++++++++
>>  3 files changed, 170 insertions(+)
>>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlin=
k_cache_test.c
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools=
/testing/selftests/filesystems/fuse/.gitignore
>> index f7f3dd345a50..ebfe7133d811 100644
>> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
>> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
>> @@ -3,3 +3,4 @@ fuse_mnt
>>  fusectl_test
>>  write_extend_eof_test
>>  fuse_acl_cache_test
>> +fuse_symlink_cache_test
>> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/t=
esting/selftests/filesystems/fuse/Makefile
>> index 7744f796eb06..3a5a557dde7a 100644
>> --- a/tools/testing/selftests/filesystems/fuse/Makefile
>> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
>> @@ -5,6 +5,7 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>>  TEST_GEN_PROGS :=3D fusectl_test
>>  TEST_GEN_PROGS +=3D write_extend_eof_test
>>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
>> +TEST_GEN_PROGS +=3D fuse_symlink_cache_test
>>  TEST_GEN_FILES :=3D fuse_mnt
>>
>>  include ../../lib.mk
>> @@ -28,5 +29,6 @@ $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>>
>>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>> +$(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_tes=
t.c
>>
>>  EXTRA_CLEAN :=3D fuse_common.o
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache=
_test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
>> new file mode 100644
>> index 000000000000..ca3c5cdaf578
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
>> @@ -0,0 +1,167 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Simple filesystem to test FUSE symlink cache
>> + *
>> + * This is a simple FUSE filesystem that contains two objects: a file n=
amed
>> + * 'file' and a symlink to that file named 'link'.  If symlink caching =
is
>> + * disabled (i.e. FUSE_CAP_CACHE_SYMLINKS is reset during FUSE_INIT), w=
henever
>> + * the ->readlink() is executed to resolve 'link' a counter will be inc=
remented.
>> + *
>> + * If symlink caching is enabled (i.e. FUSE_CAP_CACHE_SYMLINKS is set d=
uring
>> + * FUSE_INIT), resolving a symlink will only call into user-space the f=
irst
>> + * time.
>> + */
>> +
>> +#define FUSE_USE_VERSION 31
>> +
>> +#include <stdio.h>
>> +#include <limits.h>
>> +#include <fuse_lowlevel.h>
>> +
>> +#include "kselftest_harness.h"
>> +
>> +#include "fuse_common.h"
>> +
>> +#define FILENAME "file"
>> +#define FILE_INO 42
>> +
>> +#define LINKNAME "link"
>> +#define LINK_INO 43
>> +
>> +#define TIMEOUT        86400.0f
>> +
>> +struct test_state {
>> +       pthread_mutex_t lock;
>> +       bool cache;
>> +       int readlink_counter;
>> +} test_state =3D {
>> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
>> +};
>> +
>> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
>> +{
>> +       pthread_mutex_lock(&test_state.lock);
>> +       if (test_state.cache)
>> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
>> +       else
>> +               fuse_unset_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
>> +       pthread_mutex_unlock(&test_state.lock);
>> +}
>> +
>> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *na=
me)
>> +{
>> +       struct fuse_entry_param e =3D {};
>> +
>> +       if (parent !=3D FUSE_ROOT_ID ||
>> +           (!strcmp(name, FILENAME) && !(strcmp(name, LINKNAME))))
>
> You probably meant strcmp() !=3D 0 ...
> Did you miss this Sashiko comment?

Oops! I did fix one similar comment (probably in a different test) but
missed this one.  I'll fix it for the next iteration.  (And I'll still
need to have a look at sashiko again for any new comments for this
revision).

Cheers,
--=20
Lu=C3=ADs
