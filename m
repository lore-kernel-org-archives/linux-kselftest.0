Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6784ABBB5
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660055; cv=pass; b=fEA61nco8TtCe7oaevx4EFfknQAwjAaAJChfKUEmyRvEb7vcv1gZWDTwj1rAiYhBplJtNbVUHyifIsZkZaroGC+uKSwkubJUPdH05D+6sVSk1VWBT7lf6r1gIBaGiO6Zu/qMLoUsJs5K0+Fn6aNfvVOnzAoJ9MiWIsPAiLKrjnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660055; c=relaxed/simple;
	bh=y7iJTse76G4ucUZqi+M7vBGe+965ykVSunvIgxX0/3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMGJifuGIHztUkjgMKQ4MzH8YBPrXHV4H3ayy7mxlIyalATz8eJFhdG5Ba3LMgNj37afGjROiUzn6fFaHuBZyFTYOOmdxUI1Mzkx1yCnWTKQYf2ftb6pEcGRBC2ALa56AmBteqzUjzCPNQ3dccHU2UHqLqG9wzpMHulOQ6PLQZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jliweolY; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jliweolY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso179833966b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 08:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660047; cv=none;
        d=google.com; s=arc-20260327;
        b=SPCmGHzDWyIcLHfzzOB2oo07wogmVGuE/hExIU+6BQ2y4k4FAy0yvACz72g64yZKZc
         TnCFl4q1TBogMVYlu8AkMJib/E7Xir7QIOpYc5i0yxNul6S+HaqLbR/+BeonxBnVa2l1
         NbvyJIPBzt8UMY2lThpLNff2oh82YUXLmZw5r9+kZ+35p+JrX25hyAYhFORN9pNAiuoN
         GSV2qbrVrdH/f56Abt6KRnO9gby1YZF7AKCyJPk10tuIoa9da0bVNFFgMgzMvVrunPP/
         pc0sy7YlY0Y6GpeqSAp5Ttw0V4tkspgs6+fdsA6hwCKoVL7LE2OFXEyiIDNE4t3y0hh/
         ZgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        fh=CoOQKPJRwiOS6GQOymA0NtzcbKF7eLKP8eXj6YhIjT4=;
        b=Gduit6wpox8Jv3wCXB70eJ/u29eur6OQi2PJkbAlepqh827PGINV+oPvznM5vpwNiw
         DDfogkcJrP4FUrOdiPWNJLQ6xJk7w761a7vFItaLShC68k9Hwkc6puZZGZPNKYo3ylso
         srdcNwngvOlEYnmLJgvNtI8q4Znm2ql6x98NSopBea2AaCZ5DiVOa+0C8MAXiVT0qPxs
         nRBGVvEy2PGJSq08eO8cYQq1yH2dkpTVAZYE2nvOOxkNNQMtRsuc433Hc2oRkPhp/+Nv
         Bpr+PecT2kzeFlHNep492SGhICqQpq9kAWjVhtwpoGAFA/9lo6RiWpEVXKqxD6Sd/AL1
         RlrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660047; x=1790264847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        b=jliweolY1ovksPLUeLJxXu8fXR785nEQCDtGVAuLiWDsrfCTmz51gj2N2+XeaUfZxv
         boLGFLz8ZBg1hcwiego+zSMkfd/nBDNMNPTFgFr3CYmA0ap3JbkcWC2bAiPtpXMCItGC
         /KX/57NmOREmcNOh86IFu2cLumkq0M4vwzTxdF9oZ9PQxkIsMRE1+SoXO3mKyGCr2r0V
         AocfppH+V2C4aBIoLG7BTjpR9RSn6zbVQdZxtO+2j33j/btroezRF1cfnpZsalNAMEJ5
         Jazs1LJmhl1LAByYneZSec9PB4XbRdzizjiyhTJ4DBcV9zMdx1tLzPuqywVNNIXRhb9O
         4PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660047; x=1790264847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x6xW2hYJmzX0BckreNr2G2CFmLyrZuvybTX8QaHySY=;
        b=cn0+TD7akLvHnUSVrwRnWy32afwwrkOdfr5uheqcwNGmU52166AI+uQIEaWgs1z6VS
         b7Luwb/jS3gNJGOTnESjPd6ICr03QcbD7l2nuJ8AeKqnqkdGHZVrid6HtKdS82Lswy+S
         ynQUDaNDUJY7ayw5w37MAomWnh49ikM4AeNAPtED22a1NeVdH09EgY+Y7j80RlCGcjER
         3afJ80cH6ouGAUTU9HmKweyQsPyuMu0B6lYEJG1t7785wDeI5st2a8B+3/UBI2mKJdcW
         OnK2ntag8tlfRfmfVd2UN+bxGdUGuKIsrm/Xo7Y4eDL9HMaWSvCu5u4gP0SV2GtXA8ke
         qnGg==
X-Forwarded-Encrypted: i=1; AKwUvBzL7YS6sRfWsTqbAk32L/XNhcYsst1tZqVTFRXWMEeRRtzz7hVpGlJLlTS/VKbiIVRU0jvPj4qBp61UTbTvYWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSWDsuN7o93yiHsYF2OylbJdkQ784U8viwusPZbVx6R8fnMD55
	k/BnJFx/+ACgruOG2OFr9JWFsZqIHJ3F5KTW34zficWIVfMqR03rzwAr8hhxWrzSEp4u9GkFj/b
	pnzBoSyAGV0ic49mKmx/8UOz4QLFVee4=
X-Gm-Gg: AYBFou1yyi1KVmrFsblke/Fk/SVmTlMgkXmnpcqAaoqYpoHCjjzwf/p77/sAXOK4a+b
	RfsPr7KJd7+k0SHkP/eufQr9NhKvXTjZ+J67IwkPdrGPOkVSbDEBNmgLEwZNP5sl+dOoN/mpA/H
	hEFaQmwq3XwpY6QJsBJJ6XrWksQ+79HkzIUDkbT9ag3YhY5xscV7WwItpLIZE7ALEOfV5cRWd1I
	6flHxL+C9t0E4/IZuIDNYUcr6W5oetPHxJGbUcWJH4oCOB6FVNZ6Hdu5vvFRIPy3RNKLCl6UXQy
	EqpY4kUN8Fn/gWKs8Mkr3R+UmiBn83sY0xRremMxscuPXDWSf5zPGZae
X-Received: by 2002:a17:907:9343:b0:c29:4490:50c8 with SMTP id
 a640c23a62f3a-c29e51b2d0fmr670404266b.8.1789660046479; Thu, 17 Sep 2026
 08:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-2-luis@igalia.com>
In-Reply-To: <20260916155629.32421-2-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:47:15 +0200
X-Gm-Features: AcwNN1VotyV4kfW8TwYaGG-9pXTuMI1MGuctXsFZpheLcejQzMscYoicIU6JX-Q
Message-ID: <CAOQ4uxipJkiiy8pURxRFdKYbruBM8wQxArd8uAiv2Dh=tPwNhA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/8] Documentation: fuse: add document on caches
 being used by FUSE
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
> This new file aims at documenting the caches that are used by FUSE.  At
> the moment only symlink, attributes, ACLs and readdir caches are describe=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse-caches.rst          | 148 ++++++++++++++++++
>  Documentation/filesystems/fuse/index.rst      |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentati=
on/filesystems/fuse/fuse-caches.rst
> new file mode 100644
> index 000000000000..b133066429b1
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -0,0 +1,148 @@
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
ons. For
> +example, upon a user-space request for invalidation, through
> +``FUSE_NOTIFY_INVAL_INODE``, ``FUSE_NOTIFY_INVAL_ENTRY``, or
> +``FUSE_NOTIFY_DELETE`` requests.
> +
> +FUSE uses fine-grained invalidation masks rather than invalidating all
> +attributes at once. The principle is that each operation only invalidate=
s the
> +specific attributes that the operation could have changed on the server.=
 The
> +masks used are:
> +
> +- ``STATX_ATIME`` - after reads and readlink, since the server may updat=
e access
> +  time
> +- ``STATX_CTIME`` - after xattr changes (including ACL set/remove) and r=
ename
> +- ``STATX_BLOCKS`` - after a successful flush with writeback cache, sinc=
e the
> +  server's block count may differ from the local one
> +- ``FUSE_STATX_MODIFY`` (``STATX_MTIME | STATX_CTIME | STATX_BLOCKS``) -=
 after
> +  writeback completion (without writeback cache), since the server may h=
ave
> +  updated modification metadata
> +- ``FUSE_STATX_MODSIZE`` (``FUSE_STATX_MODIFY | STATX_SIZE``) - after wr=
ites,
> +  truncate-on-open, and fallocate, since the server's size and modificat=
ion
> +  metadata may have changed
> +- ``FUSE_STATX_MODDIR`` (``FUSE_STATX_MODSIZE | STATX_NLINK``) - after d=
irectory
> +  modifications (create, unlink, mkdir, rmdir, rename), since the server=
 may
> +  have updated the directory's size, timestamps, and link count
> +- ``STATX_BASIC_STATS`` - as a full invalidation, used for server-initia=
ted
> +  invalidation (FUSE\ :sub:`NOTIFY`\ \_INVAL\ :sub:`INODE`), interrupted

What is this odd subscript format and why? Please remove it.

> +  setattr, and interrupted link
> +
> +The full set of invalidation points can be found by searching for
> +``fuse_invalidate_attr_mask()`` in the FUSE source.
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

This Also, feels out of place and unneeded for the document flow.

> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be =
set to
> +``ACL_DONT_CACHE``.
> +
> +On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an i=
node ACL

This OTOH, feels out of place and unneeded for the document flow.

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

This OTOH, feels out of place and unneeded for the document flow.
Which text is it referring to? Anyway, text seems better and clear without =
it.

> +situations:
> +
> +- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is se=
t),
> +  previously cached ACLs for this inode will be invalidated.
> +- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` ope=
ration.
> +- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is s=
ent to
> +  user-space), the user-space server may have also updated the ACLs. Thu=
s, any
> +  cached ACLs for this inode are also invalidated.
> +- Whenever attributes are refreshed from the server. For example, when w=
hile

stray while - please remove

> +  revalidating a dentry (``->d_revalidate()``), or when updating a dentr=
y during
> +  while processing a ``FUSE_READDIRPLUS``.

stray while - please remove

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
> +will be cached by the kernel and reused for the current open.

I understand what you mean but it sounds confusing.

> +``FOPEN_KEEP_CACHE`` is about keeping the cache on **this** open, not on=
 some
> +**next** open.

Suggest:

FOPEN_CACHE_DIR determines if readdir results of this open will be cached a=
nd if
readdir cache will be used to return readdir results during the current ope=
n.
If FOPEN_KEEP_CACHE is set, any readdir cache from previous opens is preser=
ved
when the directory is opened. Otherwise, the old readdir cache is
invalidated on open.

If you accept this phrasing and fix the style nits above, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
