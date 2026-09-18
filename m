Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2443191D6;
	Fri, 18 Sep 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722943; cv=none; b=TZmp/B7a7umVvOpXoMDZY5GranjH5n1Y0G/v1DPzZTi17cGbuQkJqO6pZKYTHy3e8FDNpkQsKt5IyujcpulkAn4Zya8u6vEXGON8tju1Vvbt24i4O5OFU2fe0CUl52SSMea1OCayKs46JDr9jmwLqLyRp9SALodxVe0khvBIX+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722943; c=relaxed/simple;
	bh=A1h4kC1T7dfRaWVqhU0+2qj29ASuahdCobD58dIuLEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dbROTdOa06kqG5aCGQaBpypyoNSnjXw2BDoFMrClrVgkfDfmIMQg0oYBU00dgR4smXeeHcAi3A4LWYDHSDFnE80t9W2FoCtLheg6kFOxneg9AJyk5OO719KBd1yBiYga2MssN/1jDuFkf1RPU20XHE0JPbmT9G5J2vUD/f4InlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=om1JOGOO; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="om1JOGOO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=e0iblB/xd0bKyqJQCHwHSoDSJbGjYAfM5ex62TtVuKY=; b=om1JOGOOEPD+kovLlVVZHQuV01
	btKeH0+/69t8mp1Wp6G6QUkRJNalDE+0r6X1VifWHI5jV2elmWBpVmAXQCfnQ3fiIu1vA09kb7Ew2
	OzCDDT2cbeqouJMQDdsT/sRhET3GAgoLCiyj7pD14qpjKyLl08UPL6xUPeAQwFcS+6CKSoOwWxTxz
	IUQXSClSbvVZDCbQkzvxs31cZvCmGTI8SrJVY9qKufThtAmz1GjDKReBA+CG9YqEnSN7goKKkonGe
	Zuc3tvjr40jSnLruxqqcPmHHPpSml4CHu1sy04G3WJgNq76HlUhkOsQm6YBbwrAZ+m25aKyMnSkqj
	XZSbbKbg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7Ugq-003rMZ-BS; Fri, 18 Sep 2026 11:15:28 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v4 1/8] Documentation: fuse: add document on caches
 being used by FUSE
In-Reply-To: <CAOQ4uxipJkiiy8pURxRFdKYbruBM8wQxArd8uAiv2Dh=tPwNhA@mail.gmail.com>
References: <20260916155629.32421-1-luis@igalia.com>
	<20260916155629.32421-2-luis@igalia.com>
	<CAOQ4uxipJkiiy8pURxRFdKYbruBM8wQxArd8uAiv2Dh=tPwNhA@mail.gmail.com>
Date: Fri, 18 Sep 2026 10:16:26 +0100
Message-ID: <87o6du6hsl.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17 2026, Amir Goldstein wrote:

> On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> This new file aims at documenting the caches that are used by FUSE.  At
>> the moment only symlink, attributes, ACLs and readdir caches are describ=
ed.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../filesystems/fuse/fuse-caches.rst          | 148 ++++++++++++++++++
>>  Documentation/filesystems/fuse/index.rst      |   1 +
>>  2 files changed, 149 insertions(+)
>>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>>
>> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentat=
ion/filesystems/fuse/fuse-caches.rst
>> new file mode 100644
>> index 000000000000..b133066429b1
>> --- /dev/null
>> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
>> @@ -0,0 +1,148 @@
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
ions. For
>> +example, upon a user-space request for invalidation, through
>> +``FUSE_NOTIFY_INVAL_INODE``, ``FUSE_NOTIFY_INVAL_ENTRY``, or
>> +``FUSE_NOTIFY_DELETE`` requests.
>> +
>> +FUSE uses fine-grained invalidation masks rather than invalidating all
>> +attributes at once. The principle is that each operation only invalidat=
es the
>> +specific attributes that the operation could have changed on the server=
. The
>> +masks used are:
>> +
>> +- ``STATX_ATIME`` - after reads and readlink, since the server may upda=
te access
>> +  time
>> +- ``STATX_CTIME`` - after xattr changes (including ACL set/remove) and =
rename
>> +- ``STATX_BLOCKS`` - after a successful flush with writeback cache, sin=
ce the
>> +  server's block count may differ from the local one
>> +- ``FUSE_STATX_MODIFY`` (``STATX_MTIME | STATX_CTIME | STATX_BLOCKS``) =
- after
>> +  writeback completion (without writeback cache), since the server may =
have
>> +  updated modification metadata
>> +- ``FUSE_STATX_MODSIZE`` (``FUSE_STATX_MODIFY | STATX_SIZE``) - after w=
rites,
>> +  truncate-on-open, and fallocate, since the server's size and modifica=
tion
>> +  metadata may have changed
>> +- ``FUSE_STATX_MODDIR`` (``FUSE_STATX_MODSIZE | STATX_NLINK``) - after =
directory
>> +  modifications (create, unlink, mkdir, rmdir, rename), since the serve=
r may
>> +  have updated the directory's size, timestamps, and link count
>> +- ``STATX_BASIC_STATS`` - as a full invalidation, used for server-initi=
ated
>> +  invalidation (FUSE\ :sub:`NOTIFY`\ \_INVAL\ :sub:`INODE`), interrupted
>
> What is this odd subscript format and why? Please remove it.

Oops!  I use pandoc to convert the text into rst, and looks like it's
misbehaving here.  I'll investigate what went wrong and fix this.  (And
next time I'll re-read the doc in rst.)

Thanks a lot for your feedback, I'll incorporate the suggestions below
into v5.

Cheers,
--=20
Lu=C3=ADs

>> +  setattr, and interrupted link
>> +
>> +The full set of invalidation points can be found by searching for
>> +``fuse_invalidate_attr_mask()`` in the FUSE source.
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
>
> This Also, feels out of place and unneeded for the document flow.
>
>> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be=
 set to
>> +``ACL_DONT_CACHE``.
>> +
>> +On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an =
inode ACL
>
> This OTOH, feels out of place and unneeded for the document flow.
>
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
>
> This OTOH, feels out of place and unneeded for the document flow.
> Which text is it referring to? Anyway, text seems better and clear withou=
t it.
>
>> +situations:
>> +
>> +- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is s=
et),
>> +  previously cached ACLs for this inode will be invalidated.
>> +- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` op=
eration.
>> +- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is =
sent to
>> +  user-space), the user-space server may have also updated the ACLs. Th=
us, any
>> +  cached ACLs for this inode are also invalidated.
>> +- Whenever attributes are refreshed from the server. For example, when =
while
>
> stray while - please remove
>
>> +  revalidating a dentry (``->d_revalidate()``), or when updating a dent=
ry during
>> +  while processing a ``FUSE_READDIRPLUS``.
>
> stray while - please remove
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
>> +will be cached by the kernel and reused for the current open.
>
> I understand what you mean but it sounds confusing.
>
>> +``FOPEN_KEEP_CACHE`` is about keeping the cache on **this** open, not o=
n some
>> +**next** open.
>
> Suggest:
>
> FOPEN_CACHE_DIR determines if readdir results of this open will be cached=
 and if
> readdir cache will be used to return readdir results during the current o=
pen.
> If FOPEN_KEEP_CACHE is set, any readdir cache from previous opens is pres=
erved
> when the directory is opened. Otherwise, the old readdir cache is
> invalidated on open.
>
> If you accept this phrasing and fix the style nits above, feel free to add
>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
>
> Thanks,
> Amir.

