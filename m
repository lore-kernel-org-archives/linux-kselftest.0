Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866146983B;
	Mon,  7 Sep 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777495; cv=none; b=qnPMlyCJOLSivvlfcaV8mScF9JocjVRiU6mrxNa0ulKnEo1OBO/6NeJdhg3d6agA6SqD4gpimjtMtxCON0av66vTl5R1E+wOzkudQEj1ueek2fxsjhTTdTtbFmnoVR0ouMlWFw6NOrGTEDukEcdk9wygfx2OzY6g6w+ONQoX2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777495; c=relaxed/simple;
	bh=6NZOHra8lTsFun8t90P8HBwi7g86kXWmYX99yHStxLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LcAKZ2qDpZNwDp6fwD+6Dyr1IvTqFjC6SbXOyYdcsDJyip1WAQYGCn3NXEiTyMclxurfvIzUMdoW+sDThfFq65wH64TuZaDdUCsxYqBeiczR3OB8B9k3mqVYyfchbVM9tfmB/9ic6VITT5E0uYB/BW7KhP97W1PPSwTW66ivfMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Kk9scPP/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Kk9scPP/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=oTUGssR/3r0/0f908oP42rFSS/z7JA3CnVkfo5DPhZA=; b=Kk9scPP/hJfrzZO+OrcmurbVIB
	P77F0bzJyDALFQt1qhezO1HRqYktXP4SYcyazy+6vj02luGcxHoa7tLKBOnf3cXrbKyDDH0iGyeMR
	uaAvN0f1+FdMgaKenRhnHGGl7lROJJAWxuim+u5SXUsJKswVbOEUfPmS/977M3jSw72DHiQwoih0I
	iMtmpe5/3Dl1zkD5BdtFWHxCNmXWOVqFZyMn5yQAZ3HMsT5WRHl43xgge5pu4cGPEpIcAphTRrEby
	LuoUBqAKRfRXiPai5uf4QWwzkiGEJNHDSTyZRW4o1FiHsoEK86HUcnGnjOXmEBSsA5CCNH8ZopbfB
	y+bXZ2eQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x3Wja-00FzHa-LC; Mon, 07 Sep 2026 12:37:54 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/8] Documentation: fuse: add document on caches
 being used by FUSE
In-Reply-To: <CAOQ4uxiZL3yVxys8ZE-NdAvhG3qFqpPjM5gW_r2csLFBW1y6QA@mail.gmail.com>
	(Amir Goldstein's message of "Sat, 5 Sep 2026 23:04:01 +0200")
References: <20260904103920.4471-1-luis@igalia.com>
	<20260904103920.4471-2-luis@igalia.com>
	<CAOQ4uxiZL3yVxys8ZE-NdAvhG3qFqpPjM5gW_r2csLFBW1y6QA@mail.gmail.com>
Date: Mon, 07 Sep 2026 11:38:41 +0100
Message-ID: <87tso1firy.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Sat, Sep 05 2026, Amir Goldstein wrote:

> On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> This new file aims at documenting the caches that are used by FUSE.  At
>> the moment only symlink, attributes, ACLs and readdir caches are describ=
ed.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../filesystems/fuse/fuse-caches.rst          | 158 ++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>>
>> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentat=
ion/filesystems/fuse/fuse-caches.rst
>> new file mode 100644
>> index 000000000000..e9f60355d7ff
>> --- /dev/null
>> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
>> @@ -0,0 +1,158 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +FUSE Caches
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This document summarises the different types of caches used in FUSE. Fo=
r each
>> +cache type, it documents the rules to insert data into it. It also docu=
ments the
>> +rules for validating and invalidating data in the cache.
>> +
>> +symlink caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Whenever there's a link resolution request for a FUSE filesystem, the V=
FS will
>> +call into ``fuse_get_link()``, the ``->get_link()`` inode operation. Th=
is
>> +function will then send a ``FUSE_READLINK`` request to the user-space F=
USE
>> +server.
>> +
>> +The server can ask the kernel to cache all link resolutions by setting =
the
>> +``FUSE_CACHE_SYMLINKS`` flag during the ``FUSE_INIT`` negotiation. If t=
his flag
>> +is set, when the VFS calls into the ``->get_link()`` operation, FUSE wi=
ll
>> +immediately call ``__page_get_link()``. The first time this is done for=
 a
>> +specific inode, it will result in sending the ``FUSE_READLINK`` request=
 to
>> +user-space. But the result returned from this request will then be adde=
d into
>> +the page-cache. The next time this link needs to be resolved, it will u=
se the
>> +link resolution already cached, and will only fallback to user-space if=
 the
>> +folio isn't up-to-date.
>> +
>> +Attributes caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Inode attributes may be obtained from user-space by different FUSE oper=
ations.
>> +For example, ``FUSE_LOOKUP``, ``FUSE_GETATTR``, and also several other
>> +operations that create file system objects (e.g. ``FUSE_MKDIR``). These
>> +attributes obtained from user-space are cached by the kernel. They have,
>> +however, a timeout associated and once it expires, they are invalidated=
. The
>> +next time the attributes are needed, a request (``FUSE_GETATTR``) will =
be sent
>> +to the FUSE server.
>> +
>> +The ``FUSE_GETATTR`` request can be sent to user-space in three differe=
nt
>> +scenarios:
>> +
>> +#. if the attributes for the inode aren't yet available in the kernel;
>> +#. if they are not valid any more (timed-out, or have been invalidated)=
, or
>> +#. if there is an explicit request for forcing the request to be sent (=
for
>> +   example, by using the ``AT_STATX_FORCE_SYNC`` flag in ``statx``).
>> +
>> +Regarding the attributes invalidation, they may happen in several occas=
ions:
>> +
>> +- Upon user-space request for invalidation:
>> +
>> +  - A ``FUSE_NOTIFY_INVAL_INODE`` will invalidate ``STATX_BASIC_STATS``;
>> +  - ``FUSE_NOTIFY_DELETE`` and ``FUSE_NOTIFY_INVAL_ENTRY`` invalidate
>> +    ``FUSE_STATX_MODDIR``.
>> +
>
> OK from here...
>
>> +- When setting (or removing) an ACL on an inode ``STATX_CTIME`` is inva=
lidated;
>> +  if the ``FUSE_POSIX_ACL`` flag was set by the FUSE server,
>> +  ``STATX_BASIC_STATS`` will also be invalidated.
>> +- On a ``->rename()`` operation, both the old and the new entities will=
 have
>> +  it's ctime invalidated (``STATX_CTIME``). Also, the directories for b=
oth the
>> +  old and the new entities will also have their attributes invalidated
>> +  (``FUSE_STATX_MODDIR``)
>> +- When creating or deleting a new file system object (``->link()/->unli=
nk()``,
>> +  ``->symlink()``, ``->mkdir()/->rmdir()``, ``->tmpfile()``, or
>> +  ``->atomic_open()``), the directory where the object is created/delet=
ed will
>> +  have it's attributes invalidated (``FUSE_STATX_MODDIR``).
>> +- If a ``->link()`` operation is interrupted by a signal (``EINTR``) th=
e inode
>> +  being linked will have it's attributes invalidated (``STATX_BASIC_STA=
TS``).
>> +- When doing a readdir (``->iterate_shared()`` operation) and the direc=
tory
>> +  contents is not cached, ``STATX_ATIME`` attributes will be invalidate=
d.
>> +- When doing a symlink resolution (by sending a ``FUSE_READLINK`` reque=
st)
>> +  ``STATX_ATIME`` will be invalidated.
>> +- When doing a ``->flush()`` (i.e. sending a ``FUSE_FLUSH`` request) and
>> +  writeback cache is enabled, ``STATX_BLOCKS`` will be invalidated.
>> +- When truncating a file on open using ``O_TRUNC`` open flag (and the F=
USE
>> +  server has set ``FUSE_ATOMIC_O_TRUNC`` during ``FUSE_INIT``), then
>> +  ``FUSE_STATX_MODSIZE`` will be invalidated.
>> +- When setting attributes in an inode (``->setattr()``) and there's a s=
ignal
>> +  that interrupts the operation (``EINTR``), then ``STATX_BASIC_STATS``=
 will be
>> +  invalidated.
>> +- When data is read from a file, ``STATX_ATIME`` will be invalidated (u=
nless the
>> +  file system is read-only).
>> +- When data is written info a file, ``FUSE_STATX_MODSIZE`` is invalidat=
ed.
>
> ... till here - to me it feels like TMI
> I don't think it helps to keep a description of the code in a text file
> There is very little hope in getting them to stay in sync and very little
> point to begin with. This list is not complete even now (e.g. fallocate)
> nor should it be complete IMO.
> If one wants to know what operations invalidate which attrs one can grep
> for fuse_invalidate_attr_mask().
> I think it is more important for the doc to explain the principles behind=
 the
> attribute mask and give some examples. Something like:

OK, I see what you mean -- keeping this document in lockstep with any code
changes would likely be impossible.  I appreciate the suggestions below
(thanks a lot!).  I integrate them in the next revision.

Cheers,
--=20
Lu=C3=ADs


>
> FUSE uses fine-grained invalidation masks rather than invalidating all
> attributes at once.
> The principle is that each operation only invalidates the specific
> attributes that the operation
> could have changed on the server. The masks used are:
>
> STATX_ATIME - after reads and readlink, since the server may update acces=
s time
> STATX_CTIME - after xattr changes (including ACL set/remove) and rename
> STATX_BLOCKS - after a successful flush with writeback cache, since
> the server's block count may differ from the local one
> FUSE_STATX_MODIFY (STATX_MTIME | STATX_CTIME | STATX_BLOCKS) - after
> writeback completion (without writeback cache), since the server may
> have updated modification metadata
> FUSE_STATX_MODSIZE (FUSE_STATX_MODIFY | STATX_SIZE) - after writes,
> truncate-on-open, and fallocate, since the server's size and
> modification metadata may have changed
> FUSE_STATX_MODDIR (FUSE_STATX_MODSIZE | STATX_NLINK) - after directory
> modifications (create, unlink, mkdir, rmdir, rename), since the server
> may have updated the directory's size, timestamps, and link count
> STATX_BASIC_STATS - as a full invalidation, used for server-initiated
> invalidation (FUSE_NOTIFY_INVAL_INODE), interrupted setattr, and
> interrupted link
> The full set of invalidation points can be found by searching for
> fuse_invalidate_attr_mask() in the FUSE source.
>
>
>> +
>> +ACL caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +FUSE has allowed the usage of POSIX Access Control Lists (ACLs) for a l=
ong time,
>> +as they can be set and accessed simply as extended attributes. However,=
 it was
>> +only with the introduction of the ``FUSE_POSIX_ACL`` flag that ACLs sta=
rted to
>> +be fully supported. Without this flag being set during the ``FUSE_INIT``
>> +negotiation, ACLs can still be set, but the VFS won't use them for perf=
orming
>> +permission checks - that would be the user-space server's responsibilit=
y.
>> +
>> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by th=
e kernel.
>> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be=
 set to
>> +``ACL_DONT_CACHE``.
>> +
>> +On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an =
inode ACL
>> +is accessed, VFS will first check if it's already cached. If it is not,=
 FUSE
>> +``->get_acl()`` operation (``fuse_get_acl()``) is called, which will ev=
entually
>> +send a user-space request. Future accesses to this inode ACL will use t=
he cached
>> +data.
>> +
>> +Setting an ACL in an inode will also result in sending a request to the=
 FUSE
>> +server for setting it. But this operation won't immediately cache the A=
CL -- it
>> +will only be cached after it is accessed again and requested from user-=
space.
>> +
>> +On the other hand, ACLs will be removed from the cache in the following
>> +situations:
>> +
>> +- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is s=
et),
>> +  previously cached ACLs for this inode will be invalidated.
>> +- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` op=
eration.
>> +- When ``->d_revalidate()`` is called for a dentry that requires a look=
up (e.g.
>> +  it has expired) and that lookup operation is successful.
>> +- When the VFS needs to check access rights for an inode (by calling
>> +  ``->permission()``), attributes may need to be refreshed. If that hap=
pens, any
>
> Isn't this a private case which is already covered by the last item?
>
>> +  cached ACLs for that inode will be invalidated.
>> +- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is =
sent to
>> +  user-space), the user-space server may have also updated the ACLs. Th=
us, any
>> +  cached ACLs for this inode are also invalidated.
>> +- While processing ``FUSE_READDIRPLUS`` and an already existing dentry =
needs to
>> +  be updated.
>
> I think that both ->d_revalidate() and readdirplus could be generalized
> to something like "Whenever attributes are refreshed from the server"
>
> Because those specific cases are not related to ACL specifically,
> they are related to attribute cache and to the unwritten dentry cache.
>
> Again, the idea is to write a doc that explains the principles and is less
> likely to get out of sync with the code.
>
> It's fine to list d_revalidate and READDIRPLUS as examples to the
> category, but as a comprehensive list of use caes, I think this is wrong.
>
>> +- In general, when there is the need to send a ``FUSE_STATX`` or
>> +  ``FUSE_GETATTR`` to user-space (e.g. when attributes expired).
>> +
>> +readdir caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +When opening a directory a ``FUSE_OPENDIR`` will be sent to the FUSE se=
rver, and
>> +server will be responsible for setting the open flags related with cach=
ing,
>> +namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
>> +
>> +If neither flags are set by the user-space FUSE server, then every ``re=
addir``
>> +will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request bei=
ng sent.
>> +If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``rea=
ddir``
>> +will be cached by the kernel and reused for the current open. If
>> +``FOPEN_KEEP_CACHE`` is also set, the cache will be kept and reused in =
the
>> +future, when the directory is open again for reading.
>
> AFAIK this is not what KEEP_CACHE means.
> It means keeping the cache from the past opens for this open.
> IIRC I gave the exact same comment in v2.
>
> Thanks,
> Amir.
