Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F52254B03
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642257; cv=pass; b=oixJDq48Yf2Pc4IJrhw997MqoYHR99pyCXES80ZTLJpPax6HXzsGDhOaMjiXw8T6yl+t+uC1Di3uuJP6T/CIcZOWegQuxLH7ORILEso0l42F11/lnr3Scl5mZvxBL97q6ZEQ8gOS6DBiPgdKSjlwC5Ep8wR/JyoZGVy+QCD8o5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642257; c=relaxed/simple;
	bh=s6VS3DZLpok0SPOelwlOCDclFr77MQbpRNGV0W8z9+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqyEJvGjMRg0wTvo8a5zf/oYuXStbuSlNe3KdjstmACt4f2QrlBUM9c2ni4S0zffwTnWGNqBN/ZJhQuFBeclniKkng5ms8fWd2wTV+sg1tksehmMEtn+U6YqeNpLuICbfcFvxwGuHq/f7FoNE7B41oxMvPrNq4QYSmjtsjXY4o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kq5WAbDU; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq5WAbDU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c252e703fa3so332069266b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 14:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788642254; cv=none;
        d=google.com; s=arc-20260327;
        b=caB1cAQPWts+GmNQ7Akhd4wIcLiOnSpXMZRQVSgF6Yjj3ZLLC/ovlXa9JaMc0xOgqU
         CSM63s9tet2SymPzP6+xsm3izcZd321W8qh0EvlP+tv8aMjK18QCEN7vq042dO+jB/rp
         Bf/1d+rDXAYrKlkR1879qQ2TeuGc2I0DbsJIxij7lvf67CcZoeK0D/2AsgIuhHmV/uwI
         RcTCYoL02jY/cDVAeci6aJ1OsgCB/Qyb/viebG4MnyPjdPDYfT1PSTJyGkYBL5E7AwFj
         46q9ElRA6z36wyHeNJT3JQxHiXyLP2KawM4kZ7R3FtFteAwk2jF9L1eXFarN/OGumn39
         SHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TaGKzrCfkUb2Hi0Z+kKUJZ0adsD2jRJ+dpt5bj+rlkY=;
        fh=X+w8bBSJp4fktHWqhWMBOc4m7akHOkrulV8jd/2txmw=;
        b=bsUQuZepgIjidCZ5cqowIvB4z0GlwDrR/4slN/bedojw7d/5nDZqQkIUNidCRrhz2y
         wznfEif9h2n6qNEVEtPvMHpNBnghQWidks2vGbHWslRap45+WRRMmkD4BITN46XuZS3B
         36v53b8Jn/iJkLmkejtondtUEs+gD8ZwhKDQdHaogF3zVwYs8wyfxW93mp1hqO1PZjrU
         W3cNqrPkg/QaPrjKbwMpZW6PuAKzJC+x34GkCHvZfjoXqM4xKh9iqkfWtCX57ClmOzFQ
         zSzB4HIADwQGk/RPVl1P0ugR//A3DVc77CaO5uIa4sh2cyhD13DqasNmgGZ5gCXv58+F
         pZGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788642254; x=1789247054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TaGKzrCfkUb2Hi0Z+kKUJZ0adsD2jRJ+dpt5bj+rlkY=;
        b=Kq5WAbDUggSKUp9GMmzUZB5aXBccauWqZ5TBVQZw2bEEQWyXp1gZnxqq7BIv1FOgqw
         ZJtm5i94KsOHnPXVVYJ6OvUgj4/4GnWmanoVyg+tjwYKw0gZeqKJFGdy6EzJKAOpfT+4
         vnXGFSKmVzIFy1/LscrsRNcLpMFw4JaFfd3ig+R3RpyStj7fhttURb/M/krE/ZpX0uoE
         VcsCT9RvA7lEJKXhJL7ObkozS5JIYiiWRJPGdXGUkBqG4Xki6m880/QAiDM3OqwZw6Ov
         LDlv4evbI/3bcXVtSeD5CLQVi5/+3CC530TS5/KDcdUQV8suECAt8Z/HukdWjvdViAdd
         JoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642254; x=1789247054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaGKzrCfkUb2Hi0Z+kKUJZ0adsD2jRJ+dpt5bj+rlkY=;
        b=ln0ZeI7ThmlAvQG+kpy74DSap0ndWC4IJegh9nKpdRSsJ5nVc04/PDrCZeUfZwgn7X
         GxWL95lupY3xNU4pUe6l77EDrQmpeAOac/e0vMWuyndSUAdAI+rz0tVEwf8zD747HxPs
         xYorz9VGEQ/tr4PWG8wS+n3G2tD74OzltxtTzcb4sbVbVy9ILRYPk73Qz3vfyM7zENBv
         29c330zx8P+eFJwsrRMKzoflyHsdhlQB01J7tZ4z82twWSKAtcBAd3q2ULTdqiTNe0qf
         7XAX7xjQ9eV/Us/48a+3oaubGnRB0LRAUApm2Wxr1bqcWdm0rC7WhixdvbXeYeNqjk4J
         YAKg==
X-Forwarded-Encrypted: i=1; AKwUvBwVevaqR0Xt6Pm1MLs0Kbux7hJGWny3tbewCxxdxjIXCCthdEv+d4JI/nz1UaUUI+V0wDj6VqLN2QtIDDnRDEI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGzrnh5ep42xoFsG9mZlgX4nxeX5p7ng1FLZm+M7wYJgAprgUp
	C8SYoRCaEzi889GVc/wbgzu+gsF6qTlkwKbapPJ7spX9cwdZ8A8CqGvdQYOay1TL5UjFNV6NW7C
	mSvkw4Xp+vSaKerOYPrJV0056bGmp6sY=
X-Gm-Gg: AYBFou1G+SI1+cTogU5cUb3O5nFdTxzG/YjoYQQNam6nHpnqZX9FqjYCrfLEMyplcTb
	j77nqBfoiylkhM/nccuOtMVcddWs6afy1ptkaxQFkhV59HhEwj7kbfPHAL2oPLquxYaOfMEHWHi
	BWJqm5KUGlSp+9EMKNJme1ieFn+CxtC4lgOm0f+hPJNyDWGZHTPxgSFfW5V/kc4UflkzbKot4Br
	2FvZINroiUNcUOW0Y0XFcHWmi/eIHjddi9C3sScGLcTEwVt1g6AG5UBxXXQfBKEmQWn+8SOR5vr
	vEp2uivCU2zE4EpA0viQLM3LzM096fm3WCruMW/xxMaHvZ4McM24IppG
X-Received: by 2002:a17:906:c154:b0:c25:378c:6262 with SMTP id
 a640c23a62f3a-c260ca388f9mr507742166b.22.1788642253449; Sat, 05 Sep 2026
 14:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-2-luis@igalia.com>
In-Reply-To: <20260904103920.4471-2-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 23:04:01 +0200
X-Gm-Features: AcwNN1XnYRQIgKqlUssZabistQLhTMEWSDeJ2X4w6TLt8SE5yeXbaJjHLfbLIsY
Message-ID: <CAOQ4uxiZL3yVxys8ZE-NdAvhG3qFqpPjM5gW_r2csLFBW1y6QA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/8] Documentation: fuse: add document on caches
 being used by FUSE
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
> This new file aims at documenting the caches that are used by FUSE.  At
> the moment only symlink, attributes, ACLs and readdir caches are describe=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse-caches.rst          | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentati=
on/filesystems/fuse/fuse-caches.rst
> new file mode 100644
> index 000000000000..e9f60355d7ff
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -0,0 +1,158 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FUSE Caches
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document summarises the different types of caches used in FUSE. For=
 each
> +cache type, it documents the rules to insert data into it. It also docum=
ents the
> +rules for validating and invalidating data in the cache.
> +
> +symlink caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Whenever there's a link resolution request for a FUSE filesystem, the VF=
S will
> +call into ``fuse_get_link()``, the ``->get_link()`` inode operation. Thi=
s
> +function will then send a ``FUSE_READLINK`` request to the user-space FU=
SE
> +server.
> +
> +The server can ask the kernel to cache all link resolutions by setting t=
he
> +``FUSE_CACHE_SYMLINKS`` flag during the ``FUSE_INIT`` negotiation. If th=
is flag
> +is set, when the VFS calls into the ``->get_link()`` operation, FUSE wil=
l
> +immediately call ``__page_get_link()``. The first time this is done for =
a
> +specific inode, it will result in sending the ``FUSE_READLINK`` request =
to
> +user-space. But the result returned from this request will then be added=
 into
> +the page-cache. The next time this link needs to be resolved, it will us=
e the
> +link resolution already cached, and will only fallback to user-space if =
the
> +folio isn't up-to-date.
> +
> +Attributes caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Inode attributes may be obtained from user-space by different FUSE opera=
tions.
> +For example, ``FUSE_LOOKUP``, ``FUSE_GETATTR``, and also several other
> +operations that create file system objects (e.g. ``FUSE_MKDIR``). These
> +attributes obtained from user-space are cached by the kernel. They have,
> +however, a timeout associated and once it expires, they are invalidated.=
 The
> +next time the attributes are needed, a request (``FUSE_GETATTR``) will b=
e sent
> +to the FUSE server.
> +
> +The ``FUSE_GETATTR`` request can be sent to user-space in three differen=
t
> +scenarios:
> +
> +#. if the attributes for the inode aren't yet available in the kernel;
> +#. if they are not valid any more (timed-out, or have been invalidated),=
 or
> +#. if there is an explicit request for forcing the request to be sent (f=
or
> +   example, by using the ``AT_STATX_FORCE_SYNC`` flag in ``statx``).
> +
> +Regarding the attributes invalidation, they may happen in several occasi=
ons:
> +
> +- Upon user-space request for invalidation:
> +
> +  - A ``FUSE_NOTIFY_INVAL_INODE`` will invalidate ``STATX_BASIC_STATS``;
> +  - ``FUSE_NOTIFY_DELETE`` and ``FUSE_NOTIFY_INVAL_ENTRY`` invalidate
> +    ``FUSE_STATX_MODDIR``.
> +

OK from here...

> +- When setting (or removing) an ACL on an inode ``STATX_CTIME`` is inval=
idated;
> +  if the ``FUSE_POSIX_ACL`` flag was set by the FUSE server,
> +  ``STATX_BASIC_STATS`` will also be invalidated.
> +- On a ``->rename()`` operation, both the old and the new entities will =
have
> +  it's ctime invalidated (``STATX_CTIME``). Also, the directories for bo=
th the
> +  old and the new entities will also have their attributes invalidated
> +  (``FUSE_STATX_MODDIR``)
> +- When creating or deleting a new file system object (``->link()/->unlin=
k()``,
> +  ``->symlink()``, ``->mkdir()/->rmdir()``, ``->tmpfile()``, or
> +  ``->atomic_open()``), the directory where the object is created/delete=
d will
> +  have it's attributes invalidated (``FUSE_STATX_MODDIR``).
> +- If a ``->link()`` operation is interrupted by a signal (``EINTR``) the=
 inode
> +  being linked will have it's attributes invalidated (``STATX_BASIC_STAT=
S``).
> +- When doing a readdir (``->iterate_shared()`` operation) and the direct=
ory
> +  contents is not cached, ``STATX_ATIME`` attributes will be invalidated=
.
> +- When doing a symlink resolution (by sending a ``FUSE_READLINK`` reques=
t)
> +  ``STATX_ATIME`` will be invalidated.
> +- When doing a ``->flush()`` (i.e. sending a ``FUSE_FLUSH`` request) and
> +  writeback cache is enabled, ``STATX_BLOCKS`` will be invalidated.
> +- When truncating a file on open using ``O_TRUNC`` open flag (and the FU=
SE
> +  server has set ``FUSE_ATOMIC_O_TRUNC`` during ``FUSE_INIT``), then
> +  ``FUSE_STATX_MODSIZE`` will be invalidated.
> +- When setting attributes in an inode (``->setattr()``) and there's a si=
gnal
> +  that interrupts the operation (``EINTR``), then ``STATX_BASIC_STATS`` =
will be
> +  invalidated.
> +- When data is read from a file, ``STATX_ATIME`` will be invalidated (un=
less the
> +  file system is read-only).
> +- When data is written info a file, ``FUSE_STATX_MODSIZE`` is invalidate=
d.

... till here - to me it feels like TMI
I don't think it helps to keep a description of the code in a text file
There is very little hope in getting them to stay in sync and very little
point to begin with. This list is not complete even now (e.g. fallocate)
nor should it be complete IMO.
If one wants to know what operations invalidate which attrs one can grep
for fuse_invalidate_attr_mask().
I think it is more important for the doc to explain the principles behind t=
he
attribute mask and give some examples. Something like:

FUSE uses fine-grained invalidation masks rather than invalidating all
attributes at once.
The principle is that each operation only invalidates the specific
attributes that the operation
could have changed on the server. The masks used are:

STATX_ATIME - after reads and readlink, since the server may update access =
time
STATX_CTIME - after xattr changes (including ACL set/remove) and rename
STATX_BLOCKS - after a successful flush with writeback cache, since
the server's block count may differ from the local one
FUSE_STATX_MODIFY (STATX_MTIME | STATX_CTIME | STATX_BLOCKS) - after
writeback completion (without writeback cache), since the server may
have updated modification metadata
FUSE_STATX_MODSIZE (FUSE_STATX_MODIFY | STATX_SIZE) - after writes,
truncate-on-open, and fallocate, since the server's size and
modification metadata may have changed
FUSE_STATX_MODDIR (FUSE_STATX_MODSIZE | STATX_NLINK) - after directory
modifications (create, unlink, mkdir, rmdir, rename), since the server
may have updated the directory's size, timestamps, and link count
STATX_BASIC_STATS - as a full invalidation, used for server-initiated
invalidation (FUSE_NOTIFY_INVAL_INODE), interrupted setattr, and
interrupted link
The full set of invalidation points can be found by searching for
fuse_invalidate_attr_mask() in the FUSE source.


> +
> +ACL caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE has allowed the usage of POSIX Access Control Lists (ACLs) for a lo=
ng time,
> +as they can be set and accessed simply as extended attributes. However, =
it was
> +only with the introduction of the ``FUSE_POSIX_ACL`` flag that ACLs star=
ted to
> +be fully supported. Without this flag being set during the ``FUSE_INIT``
> +negotiation, ACLs can still be set, but the VFS won't use them for perfo=
rming
> +permission checks - that would be the user-space server's responsibility=
.
> +
> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the=
 kernel.
> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be =
set to
> +``ACL_DONT_CACHE``.
> +
> +On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an i=
node ACL
> +is accessed, VFS will first check if it's already cached. If it is not, =
FUSE
> +``->get_acl()`` operation (``fuse_get_acl()``) is called, which will eve=
ntually
> +send a user-space request. Future accesses to this inode ACL will use th=
e cached
> +data.
> +
> +Setting an ACL in an inode will also result in sending a request to the =
FUSE
> +server for setting it. But this operation won't immediately cache the AC=
L -- it
> +will only be cached after it is accessed again and requested from user-s=
pace.
> +
> +On the other hand, ACLs will be removed from the cache in the following
> +situations:
> +
> +- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is se=
t),
> +  previously cached ACLs for this inode will be invalidated.
> +- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` ope=
ration.
> +- When ``->d_revalidate()`` is called for a dentry that requires a looku=
p (e.g.
> +  it has expired) and that lookup operation is successful.
> +- When the VFS needs to check access rights for an inode (by calling
> +  ``->permission()``), attributes may need to be refreshed. If that happ=
ens, any

Isn't this a private case which is already covered by the last item?

> +  cached ACLs for that inode will be invalidated.
> +- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is s=
ent to
> +  user-space), the user-space server may have also updated the ACLs. Thu=
s, any
> +  cached ACLs for this inode are also invalidated.
> +- While processing ``FUSE_READDIRPLUS`` and an already existing dentry n=
eeds to
> +  be updated.

I think that both ->d_revalidate() and readdirplus could be generalized
to something like "Whenever attributes are refreshed from the server"

Because those specific cases are not related to ACL specifically,
they are related to attribute cache and to the unwritten dentry cache.

Again, the idea is to write a doc that explains the principles and is less
likely to get out of sync with the code.

It's fine to list d_revalidate and READDIRPLUS as examples to the
category, but as a comprehensive list of use caes, I think this is wrong.

> +- In general, when there is the need to send a ``FUSE_STATX`` or
> +  ``FUSE_GETATTR`` to user-space (e.g. when attributes expired).
> +
> +readdir caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When opening a directory a ``FUSE_OPENDIR`` will be sent to the FUSE ser=
ver, and
> +server will be responsible for setting the open flags related with cachi=
ng,
> +namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
> +
> +If neither flags are set by the user-space FUSE server, then every ``rea=
ddir``
> +will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request bein=
g sent.
> +If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``read=
dir``
> +will be cached by the kernel and reused for the current open. If
> +``FOPEN_KEEP_CACHE`` is also set, the cache will be kept and reused in t=
he
> +future, when the directory is open again for reading.

AFAIK this is not what KEEP_CACHE means.
It means keeping the cache from the past opens for this open.
IIRC I gave the exact same comment in v2.

Thanks,
Amir.
