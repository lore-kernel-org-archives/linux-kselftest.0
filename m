Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67A2C21F7;
	Tue, 21 Jul 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638558; cv=none; b=lOZascTv3I3R1QXIXVRkqXKNwQx9x2yeI8+BQoC3nJcqNdxN8Y7lEBWhvNwX7UkDcNeqSHCD7+Gb6ICBb+XreEpk45AnziJsVog+QsQsCiyILvimWUP5dGeGG8A6yeT7RZxVTQFIJiHxRh36czZzEHjqupjUzli+tKU8oY5rmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638558; c=relaxed/simple;
	bh=ECc4R7NrHDdT9OAZu1lbblao9vm8puDOMd6xT1KUKKg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H8Hzp3UUhKwvrc2xH04Z/acCoATEBj+0XWdrrMGW9AeMxItjqULtFBEwWLoMcA/NNR+p+oyMiMnw7kMtx2N8wKZPr3spgYM901KG3QdFALUKK/cvkPiisA1nwqPwFLQYYHrdXbo/Yxr0sB0+4cVs4/y5VA41CKIm+VLOyVxIX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qBeKQgzb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qBeKQgzb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=ye6A9cCdxjRalTatU3eNmjfU4hPlM0O9mLlCxRvy90Y=; b=qBeKQgzbTzf+cLn9Gg7li5gWrJ
	/CixF/DnZ/J/yZIf21KgD0zLjPwNOLZqNBZCQm+R13CHCMIi9KE6e9AQvn83BTnfgovc0YdMiECOG
	WMXPu3ME2RCN1X3nSaPOa8oCrnomm+nUx8M5obNiAJLpIDwEtjHrjRRkCTCNx9YeLlkK8oTeknFxR
	9MXxW2FJI2pcJCDDYr04zpy0Sj285RtBnHXPrXk0EUmYXPgxihyS9erA39W4NkmnfVpkXJlAWABTT
	aa0QqcLDezIHIYAFKxiweFFtQKx6I29kmgk3eqaW0zEG+EUa0AZvmugiWOIpXsgZ1YHetdnxzCz2x
	+wm321Tw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wmA0i-001bkQ-G9; Tue, 21 Jul 2026 14:55:48 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Harvey
 <mharvey@jumptrading.com>, kernel-dev@igalia.com
Subject: Re: [RFC PATCH v1 1/5] Documentation: fuse: add document on caches
 being used by FUSE
In-Reply-To: <CAOQ4uxi=mcRf7wZdbXjCH9+doh1f1rxpZ4sxjg0MDLz_dirrYw@mail.gmail.com>
References: <20260708131122.2917-1-luis@igalia.com>
 <20260708131122.2917-2-luis@igalia.com>
 <CAOQ4uxi=mcRf7wZdbXjCH9+doh1f1rxpZ4sxjg0MDLz_dirrYw@mail.gmail.com>
Date: Tue, 21 Jul 2026 13:55:39 +0100
Message-ID: <87v7a8o62c.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Amir,

Amir Goldstein <amir73il@gmail.com> writes:

> On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> w=
rote:
>>
>> This new file aims at documenting the caches that are used by FUSE.  At
>> the moment only the symlink and the ACLs caches are described.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../filesystems/fuse/fuse-caches.rst          | 86 +++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>>
>> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentat=
ion/filesystems/fuse/fuse-caches.rst
>> new file mode 100644
>> index 000000000000..52b2558b5a68
>> --- /dev/null
>> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
>> @@ -0,0 +1,86 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +FUSE Caches
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This document summarises the different types of caches that are used in=
 FUSE.
>> +For each cache type, it attempts to document the rules that are followe=
d to
>> +insert, validate and invalidate data into the cache.
>
> It looks a bit misleading as if the list is complete.
> Maybe list all the caches: attribute, dentry, data, readdir, symlink, ACL
> (anything else?) and then say that documenting them is TBD.

Right, I can list all of them in the next iteration and mark them is TBD.
(In fact, I do have some text for some of those other caches but that's
still WIP.)

> However, I must say that mentioning attribute cache in the context of ACL
> cache without a minimal description of attribute cache is a bit confusing.

Probably that can be fixed by having the descriptions in the correct order
(and having attributes before ACLs probably makes sense).

Cheers,
--=20
Lu=C3=ADs

> Thanks,
> Amir.
>
>> +
>> +symlink caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Whenever there's a link resolution request, the VFS will call into
>> +``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request to=
 the
>> +user-space FUSE server. However, the server can ask the kernel to cache=
 all
>> +links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during the
>> +``FUSE_INIT`` negotiation.
>> +
>> +If this flag is set, FUSE will immediately call into the VFS
>> +``__page_get_link()`` from the ``->get_link()`` inode operation. The fi=
rst time
>> +this is done for a specific link, it will end-up sending the ``FUSE_REA=
DLINK``
>> +to user-space but the link contents will then be added into page-cache.=
 The next
>> +time the link needs to be resolved, it will use the link content that i=
s already
>> +cached, and will only fallback into sending the request to use-space if=
 the
>> +folio isn't up-to-date.
>> +
>> +ACL caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +FUSE has allowed the usage of POSIX ACLs for a long time as they could =
be set
>> +and accessed simply as extended attributes. However, it was only with t=
he
>> +addition of the ``FUSE_POSIX_ACL`` flag that ACLs started to be fully s=
upported.
>> +Without this flag, ACLs can still be set, but the VFS won't use them for
>> +performing permission checks - that would be the user-space server's
>> +responsibility.
>> +
>> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by th=
e kernel.
>> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be=
 set to
>> +``ACL_DONT_CACHE``.
>> +
>> +On the other hand, if ``FUSE_POSIX_ACL`` is set during ``FUSE_INIT``, w=
hen an
>> +ACL is accessed the VFS layer will first check if it's already cached. =
If it is
>> +not, FUSE ``->get_acl`` operation is called, which will eventually send=
 a
>> +user-space request. Future accesses to this inode ACL will then use the=
 cached
>> +data.
>> +
>> +Setting an ACL in an inode, however, won't cache it immediately. It wil=
l send
>> +user-space a request with the new ACL, and the FUSE server may perform =
some
>> +modifications before storing it.
>> +
>> +On the other hand, ACLs will be removed for the cache in the following
>> +situations:
>> +
>> +-  When setting an ACL in an inode and the user-space server has set the
>> +   ``FUSE_POSIX_ACL`` flag, all previously cached ACLs for this inode w=
ill be
>> +   invalidated.
>> +-  When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` o=
peration.
>> +-  When ``->d_revalidate()`` is called for a dentry that requires a loo=
kup (e.g.
>> +   it has expired) and that lookup operation is successful.
>> +-  When the VFS needs to check access rights for an inode (by calling
>> +   ``->permission()``), attributes may need to be refreshed. If that ha=
ppens,
>> +   any cached ACLs for that inode will be invalidated.
>> +-  After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is=
 sent to
>> +   user-space), the user-space server may have also updated the ACLs, s=
o any
>> +   cached ACLs for this inode are also invalidated.
>> +-  While processing ``FUSE_READDIRPLUS`` and a new dentry is added (unl=
ess this
>> +   dentry is already being looked up (``DCACHE_PAR_LOOKUP``))
>> +-  In general, when there is the need to sent a ``FUSE_STATX`` or
>> +   ``FUSE_GETATTR`` to user-space (e.g. because the attributes have exp=
ired).
>> +   This may happen in the following cases:
>> +
>> +   -  When doing an ``->llseek()`` on a file with ``SEEK_END``, ``SEEK_=
HOLE`` or
>> +      ``SEEK_DATA``.
>> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time (to
>> +      automatically invalidate cached pages), and a buffered read
>> +      (``->read_iter()``) past EOF is done on a non-passthrough file.
>> +   -  When the ``FUSE_WRITEBACK_CACHE`` flag is set at ``INIT`` time, a=
nd a
>> +      buffered write (``->write_iter()``) past EOF is done on a non-pas=
sthrough
>> +      file.
>> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time an=
d the VFS
>> +      needs to read a directory contents (``->iterate_shared()``) for a
>> +      directory that is allowed to be cached.
>>
