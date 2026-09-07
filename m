Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6E1468C12;
	Mon,  7 Sep 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778073; cv=none; b=oeW3UF09tPfIBwjrnedgrEUra66zLM3qR2BDH8CByykObzD2nBwNMfRW41HP5cs1htY9nOxPmG6Tv26gtDncnPOcuEJ+4oJr+B29vEk722uabVRGfpVJS9Ck4due1TR+nCWWgtpw/OVoVUrRlGysbXckp+2J1CPoqZUNrpvC7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778073; c=relaxed/simple;
	bh=/RWIyNjqirvwWI2Abb5gX+Ifo8vToD5ewLeveh1ryi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qb6PM63zu/dIbgHK+R3V5ADQyClNVmCF0nTK80bHNu9NI+Yf089lTzY7F/yaJnSCxLkxAlcnrREhN1KUFdzKX4MToSXmRWFkHJgCzQwM85CJ/0+NZFxNFlLlU6+L7b85Xhg3CqxJMpKiY7IPNac7ojjM7JCZPSqd4zm4MtIgREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=byeLDi3e; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="byeLDi3e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=5qGJhtGKVj3/RcTbVVEoXO+DeZ70o5gB9nKQMuv0DTA=; b=byeLDi3eEpRHu4evu1vxBP+prC
	S+vmEc4Vi3Od4sqlsP4CYpqGWp2Fn+SS01KRtdMnCJZTbXsHllxaVlhxfvYW6G+SuMHxWcEuop3gw
	23QGorKscyYJYxpuimEyuMMsByp4soB7xdHlfZd7eY2QBsvPC6yHI0O8WcQGIrSiBaYA7+aMAfluA
	OLts/EdWPLaOVPi12SjveLahrGyhaiq1UlV0dr6ChD2fI/64hyUeFormm61VW5qKsKXkDxMlL3M3q
	0BehW0cZSc3E4AYb/U5wEqXJSOTTYaMbHjyI+YdIOnd2SQhW9ZyFjGTibODBK5kP/i55YJoI/zAXd
	2mQdzA2Q==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x3Wt6-00FzTt-QF; Mon, 07 Sep 2026 12:47:44 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 6/8] selftests/fuse: add some extra ACL caching
 tests
In-Reply-To: <CAOQ4uxhF6qaAxLFt0UP8nBbZTWVVYf_Y7zgL8Lu9xEnJzg=GiA@mail.gmail.com>
	(Amir Goldstein's message of "Sat, 5 Sep 2026 14:38:24 +0200")
References: <20260904103920.4471-1-luis@igalia.com>
	<20260904103920.4471-7-luis@igalia.com>
	<CAOQ4uxhF6qaAxLFt0UP8nBbZTWVVYf_Y7zgL8Lu9xEnJzg=GiA@mail.gmail.com>
Date: Mon, 07 Sep 2026 11:48:31 +0100
Message-ID: <87ld9dfibk.fsf@wotan.olymp>
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
>> This adds some extra tests to ACL caching:
>> - Verify that reading ACLs results in the expected number of requests
>>   being sent user-space, depending on whether cache is enabled or disabl=
ed
>> - Verify caching behaviour on some caching invalidation scenarios
>>
>> While there, add test binary to .gitignore.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>>  .../filesystems/fuse/fuse_acl_cache_test.c    | 179 ++++++++++++++++++
>>  2 files changed, 180 insertions(+)
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools=
/testing/selftests/filesystems/fuse/.gitignore
>> index fb51603fe419..f7f3dd345a50 100644
>> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
>> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
>> @@ -2,3 +2,4 @@
>>  fuse_mnt
>>  fusectl_test
>>  write_extend_eof_test
>> +fuse_acl_cache_test
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_tes=
t.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> index c2d6658ff7de..9608a0adb967 100644
>> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> @@ -83,6 +83,7 @@ struct daemon_state {
>>         uint8_t        *acl;
>>         size_t          acl_size;
>>         int             getxattr_count;
>> +       bool            cache;
>>  };
>>
>>  /*
>> @@ -91,9 +92,17 @@ struct daemon_state {
>>   */
>>  static struct daemon_state g_ds =3D {
>>         .lock =3D PTHREAD_MUTEX_INITIALIZER,
>> +       .cache =3D false,
>>  };
>>
>>  /* ---- FUSE lowlevel callbacks ---------------------------------------=
----- */
>> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
>> +{
>> +       pthread_mutex_lock(&g_ds.lock);
>> +       if (g_ds.cache)
>> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
>> +       pthread_mutex_unlock(&g_ds.lock);
>> +}
>>
>>  static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *na=
me)
>>  {
>> @@ -115,6 +124,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t par=
ent, const char *name)
>>         e.attr.st_ino     =3D FILE_INO;
>>         e.attr.st_mode    =3D S_IFREG | 0644;
>>         e.attr.st_nlink   =3D 1;
>> +       e.attr.st_uid =3D getuid();
>> +       e.attr.st_gid =3D getgid();
>>         fuse_reply_entry(req, &e);
>>  }
>>
>> @@ -175,10 +186,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t=
 ino, const char *name,
>>         free(acl);
>>  }
>>
>> +static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e,
>> +                           const char *value, size_t size, int flags)
>> +{
>> +       int ret =3D 0;
>> +       uint8_t *acl;
>> +
>> +       if (ino !=3D FILE_INO)
>> +               ret =3D ENOENT;
>> +       else if (!strcmp(name, "system.posix_acl_access")) {
>> +               acl =3D malloc(size);
>> +               if (acl) {
>> +                       memcpy(acl, value, size);
>> +                       pthread_mutex_lock(&g_ds.lock);
>> +                       if (g_ds.acl)
>> +                               free(g_ds.acl);
>> +                       g_ds.acl =3D acl;
>> +                       g_ds.acl_size =3D size;
>> +                       pthread_mutex_unlock(&g_ds.lock);
>> +               } else
>> +                       ret =3D ENOMEM;
>> +       } else
>> +               ret =3D ENOTSUP;
>> +
>
> I am allergic to mismatching {} in if/else statements.

Ah! Ah! OK, I'll fix that.  (And I also admit I'm not consistent with
this, which probably means I'm not allergic :-) )

> I personally think that code will be cleaner with a goto error
> without all these multi nesting levels.

Sure, I'll refactor it accordingly.

Cheers,
--=20
Lu=C3=ADs
