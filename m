Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A637E5E1;
	Tue, 18 Aug 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068300; cv=none; b=KsiYsHYMQ/QblHXytijhwWHry+wShwP0IaEMDc9dVcSYYJ9iVCxexf8UWL24Ism3lT/QMBvnwakDAwCl6TKxP4nH7vp5a8lUhnI/4Rms38HIAnyHWoZVpD+WVHLnpzbL408aBh+4sAl6/R8LH8XaHSbatIRNFSAmX09vlvk/QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068300; c=relaxed/simple;
	bh=+1d5v2CBuauM3/6F0bvwpIVvmbkSlfo+1sxjTJflsf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pDNv5gFDJj/c5dBoUalSMOYKkW7Z9ARh8hPvFnVnKRhuN+QLyf5vDjWPRngOkMqTBV+D7TmjANiYk5uCjcO4v7K4Pa30i5u6rWwBhe3XjX9fSTdYNl2obEHIdDE8p0vl4nlk6Gl2ar9sU+nowTgYNh/BF6GwaYcuJo1sn7mzTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZKFIgGjp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZKFIgGjp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=gnneXlT40axUwbDle1+CcSKqMvwTRcpMejLl2emjkXg=; b=ZKFIgGjpwRuv09TV3prDB9QbPE
	2IDWxPL/hW9ThGHx2q5lygJ65nDYM7peN9R/anBwRJ6fLvUo8edkbVZP9TLHQ+u+cmrHspg5me8fY
	zROSlA7nCig8JXzCyGL4ZshIMeegYbOVqpbr/TgdQM6QAHZ30Cf6pb4ziXINz/32iuygnLZYsRw9N
	YwmlYMs/ixw8R+nSiVgjt7CQgx21qcf6cIs5/+2aHhEITltj0E6L+4w+ENxHwWHTVxDnlSX+kfOQ5
	9fAVjNnD54LsJOb+0Z/haPlEypbW8fKcZ18p+yRKL7fXV2xj2W50fKalgGbB88S+YnAg8dVXRHYcc
	KkIf7HLw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwM5z-005h07-PY; Tue, 18 Aug 2026 17:51:23 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v2 1/8] Documentation: fuse: add document on caches
 being used by FUSE
In-Reply-To: <CAOQ4uxjsx-Atq3tGsUeakGNZYLVHayVXPne1E6gM0J9tZp+f6g@mail.gmail.com>
	(Amir Goldstein's message of "Tue, 18 Aug 2026 14:40:15 +0200")
References: <20260817141156.6079-1-luis@igalia.com>
	<20260817141156.6079-2-luis@igalia.com>
	<CAOQ4uxjsx-Atq3tGsUeakGNZYLVHayVXPne1E6gM0J9tZp+f6g@mail.gmail.com>
Date: Tue, 18 Aug 2026 16:51:44 +0100
Message-ID: <87mruje8a7.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18 2026, Amir Goldstein wrote:

> On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> This new file aims at documenting the caches that are used by FUSE.  At
>> the moment only symlink, attributes, ACLs and readdir caches are describ=
ed.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../filesystems/fuse/fuse-caches.rst          | 142 ++++++++++++++++++
>>  1 file changed, 142 insertions(+)
>>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>>
>> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentat=
ion/filesystems/fuse/fuse-caches.rst
>> new file mode 100644
>> index 000000000000..071febf45d00
>> --- /dev/null
>> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
>> @@ -0,0 +1,142 @@
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
>> +Attributes caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Attributes obtained from user-space, for example when an inode is first
>> +looked-up, are cached in the kernel. However, these attributes have a t=
imeout
>> +associated and once expired they are invalidated.
>> +
>> +Thus, the ``FUSE_GETATTR`` operation will be sent to user-space only if=
 the
>> +attributes aren't yet available, the attributes aren't valid (timeout),=
 or if
>> +there is an explicit request for doing so (for example, by using the
>> +``AT_STATX_FORCE_SYNC`` flag in ``statx``). This may happen in the foll=
owing
>> +situations:
>
> "This may happen" what may happen? I don't see it referring to anything.

Yeah, that sentence doesn't really make a lot of sense.  I'll rephrase.

>> +
>> +#. An explicit request from VFS to get the attributes for an inode (thr=
ough the
>> +   ``->getattr()`` callback).
>> +#. When an ``->llseek()`` is requested to FUSE with a type of request
>> +   (``whence``):
>> +
>> +   -  ``SEEK_{HOLE,DATA}`` and the user-space doesn't implement the
>> +      ``FUSE_LSEEK`` operation (it has returned ``ENOSYS``), or
>> +   -  ``SEEK_END``
>> +
>> +#. When doing a buffered read past EOF or automatic page cache invalida=
tion mode
>> +   is enabled (``FUSE_AUTO_INVAL_DATA``).
>> +#. When doing a buffered write with write-back cache enabled
>> +   (``FUSE_CAP_WRITEBACK_CACHE``).
>
> This list is incomplete and strange. it has post EOF write for
> writeback which is the exception
> and leaves out every non writeback write.

This list was meant to list the scenarios where the FUSE_GETATTR is sent
(the "this may happen" above).  But I'll review the list again.

> If you composed this list yourself I highly recommend an LLM for this task
> if you used LLM I suggest a stronger model.
>
> Generally speaking, I find that today's robots are much better at writing=
 these
> sorts of docs than I am - as long as I sit at the helm and guide them
> about where to expand on and where to keep it concise.

Thank you for the suggestion (I did not use an LLM btw).  In fact, do you
think this document is really useful, given that everyone will be running
an LLM anyway?  (I've been asking this question myself...)

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
>
> Do not encourage this by documenting it please.
> It reinforces that this was by design, rather than an oversight which
> we don't know.

Eh! OK, I'll stop that sentence after the comma :-)

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
>
> No reason to repeat the reasons for attr cache invalidation that were
> just listed above
>
>> +
>> +readdir caching
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +When opening a directory for doing a readdir, a ``FUSE_OPENDIR`` will b=
e sent
>> +and the user-space server will be responsible for setting the open flag=
s related
>> +with caching, namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
>> +
>> +If neither flags are set by the user-space FUSE server, then every ``re=
addir``
>> +will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request bei=
ng sent.
>> +If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``rea=
ddir``
>> +will be cached by the kernel and reused. However, if ``FOPEN_KEEP_CACHE=
`` isn't
>> +also set, the cache will be invalidated next time the directory is open.
>
> Confusing.
> FOPEN_KEEP_CACHE is about keeping the cache on THIS open not on
> some NEXT open.

Right, that's true.  I just wanted to emphasise that the invalidation
doesn't happen on a close, but on the next open.  But I'll rephrase,
thanks.

Cheers,
--=20
Lu=C3=ADs
