Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615333121F
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630105; cv=pass; b=Ut+1K26L3lua9b99Psplvt9tNxHPQGNgDl/s14BG/GZlKE86IKsSMqMUT9hEL3CxH+umIXDuAAOQEHdaWiQrlV1QB9vgzsonjduhypdfkMohxIEduWWUQkZQoMijXbC9Qtt5q3NaE4ukuclka22sf/pToW2WDEN4PmTJE6CcAR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630105; c=relaxed/simple;
	bh=TqvASy5oHqcQJpgaY1PeP/SN6AO8XQJyq3SUDNCBQCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9uqFiZMW35w3nqwcsJHBMrZBP1d+SQD+wGxRF3yRU8sgOHsP815rvoNj+Pef8vNBnejgg/GqSTPGPPc6eMCH4exmno0cOkayCq7+cLg6+ZqQ1u7JpJbJa0YNoH5arHjNJ8mk9C7mxh1+5YlLH6O4RbgylJMGjtZqKXDHLAykh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe4jbqcv; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe4jbqcv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15b33f7b23so1630471866b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630102; cv=none;
        d=google.com; s=arc-20260327;
        b=QvU3zsZgSxJIwvG7iSVJ8bENlhxDrovRVOiw4ZjY7+scW93hUFRMvoXmI6UQaTincp
         2w7HsiFCyhWmbo9RBAP31MoPCuSAloiWm20g7dDDkRVm1xFVGt4lyEuPjlUV0TQXEVvs
         Tv7eiI3UVuZGc/JOrsHml+SrsRwsFnJc1IBNnfz5wB/JzjfbLwwnakvw0v8Am5NqqNVQ
         RAaqNdtrEq5rqHbCNoA4HCVhnhhh2/UKM6DjEA9IINYJkGB7aVIM/0t9ryaxMHtqS9bG
         jSaUiWhYsSRDeSl051Hrqk67tpOfMSHnlWdkqwaex16Yx6KwagHrfgpIvfvApPmod6ER
         zhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5FWMC9LbDIMIa0XTYNmKVwsDtOhMaV0TuIONGukZMI=;
        fh=ctGm0TLKHnfFImYU2VCPe1uYL1+NNUEvLt31IK8mW54=;
        b=JX3OBk3rvYn7auaujl2CIBKnKOs0y8ABlrFq5DB9k/Waf8GziUeDFqy3T+VlnrtZ6o
         15EJbCl4Sxgy4E7pTJnAi/887ZCRSeyPIsn8avJxvf2q16az/qPdnMG+sYMOqj5ZDBKC
         i6jfGAg1ucqmdZZWEgM/rzWaDmV2YdXwhphdSm6C3qhdi465rb/WrFoCMx2FR4RstPfn
         sihjUI9ydZlRLy5MQcxgFjJ+lZNLTS9Jw2eVRNPcSQaA9P76P1GXm34HwvBsOGx6igLZ
         cMy4ECQ+SPFyKyYJ3XgWU2Knz0ssdlc7BMie1QvbJunVKau/UMUN5O8YGTKZ/zx9sXfz
         920w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630102; x=1785234902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k5FWMC9LbDIMIa0XTYNmKVwsDtOhMaV0TuIONGukZMI=;
        b=fe4jbqcvIpmMIHIZ65RygJD8EAZuZ4c6fUR8bXJuciOeiYyTn754fBAq+te0dB/0aj
         QbwwqahtD4gOpPN6Z3DaJW0iAKwiZvZSET3t76YFPFL5NGSKv0VyJkRRZLOO7Tar80OT
         YHbxcZjX93fKd7hbHTuaC0Bsd+o/CH3Q9Y/WTHH4y3u285UOLUjEjG65VHH/Ns0NV+Ab
         Gde/kbum9PncsJfUW8MTYIjzid9OB4iht9GeKFUypdB2CqC4Km1mT4SuufAMH0cuv4eK
         grA11SuVfqcECCyqBg+QKXqtgVl2RtCh0er6bCl+IxQUsBPvgwdPO2jRmydYZdzT+z3x
         dohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630102; x=1785234902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5FWMC9LbDIMIa0XTYNmKVwsDtOhMaV0TuIONGukZMI=;
        b=cH9sZskGVk7Dzwe5DQzfXYxij6I+X1RpPpEmO8SViUb2Uax9/8cAaxsE+oHd5YQ6cZ
         xtpMeMqsz6KvdWIN7r4n/35cZDnhw+thc5lEPlOC5ywQFhx76wuDkTXVSu+8YRcNFR94
         wzRwDAkrHKci0mtLaAvES2odqc1ITBNzTLJYzt/Zn3AwY5P8c48frBk2WYcMPUJQ73+D
         692fRvXpS0eWynFPnZVWq1FRS2CtTImia/G5TG6Fr0k+yyD7vXs+9B6CqES1JRVCRZFM
         FB/mhIPNd5FZQd65zJA7ARRGJDKBM2ibU4fYbjnrVGocn+jB6xYHzuKJh+6vzCXY7aAK
         iFlw==
X-Forwarded-Encrypted: i=1; AHgh+RrOHMbGNo+2IHNO3g4yc/Xd2tS4uJdUGnG4Mk1KmF12lBYhgYGnxc4PYYrq0mbvpsQUOl2eCf3fhcCi25486d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKA8XoZCCYpc02n+cCmwnKX093a6CTlCWrI6W/aEO001S7BAxr
	ivRG+aO+PvYGbgO472GJfOEViCuBGH8Q35FthnqvVKoY31mcu8waFDGF64oMN6lpEtgSqNoLKsJ
	kYEo0SWT3o6bor/Bhy0+2jsF4ym2fxOE=
X-Gm-Gg: AfdE7cnfnd5K5Fc6AEp8ut8dPeiPYU2EVeFDI8YcZOwPIMflqF6061/hryeFjHiCdfF
	YeMqNp6HxVr99riKsuIMijkAOnFcowCsqpKQn55qaln88JL7Q0QaCTKaSsJ2VFMZKSLXx9k5yNO
	4z+FU7L5sgF9Tix1X0rdrWgGKZScHPEVz/LpOh7OD2/cQ+KKpA6qlTTlrruMsd/fE/lNkysu8F8
	nOUjmZ7m9gEr6U6DcnlcTD2BhJ1lL3FON5kUGgjWUQ0EBl4hAaaPSXddrwo25M=
X-Received: by 2002:a17:907:3ea0:b0:c15:f647:205b with SMTP id
 a640c23a62f3a-c16b47d83e8mr812528466b.46.1784630101365; Tue, 21 Jul 2026
 03:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-2-luis@igalia.com>
In-Reply-To: <20260708131122.2917-2-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:34:49 +0200
X-Gm-Features: AUfX_mwe-kr8_QLhqZNCl123Jf4668wp7ph2V3Nb7km4AvovQpW14T1tnnO5W8I
Message-ID: <CAOQ4uxi=mcRf7wZdbXjCH9+doh1f1rxpZ4sxjg0MDLz_dirrYw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/5] Documentation: fuse: add document on caches
 being used by FUSE
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> This new file aims at documenting the caches that are used by FUSE.  At
> the moment only the symlink and the ACLs caches are described.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse-caches.rst          | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentati=
on/filesystems/fuse/fuse-caches.rst
> new file mode 100644
> index 000000000000..52b2558b5a68
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -0,0 +1,86 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FUSE Caches
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document summarises the different types of caches that are used in =
FUSE.
> +For each cache type, it attempts to document the rules that are followed=
 to
> +insert, validate and invalidate data into the cache.

It looks a bit misleading as if the list is complete.
Maybe list all the caches: attribute, dentry, data, readdir, symlink, ACL
(anything else?) and then say that documenting them is TBD.

However, I must say that mentioning attribute cache in the context of ACL
cache without a minimal description of attribute cache is a bit confusing.

Thanks,
Amir.

> +
> +symlink caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Whenever there's a link resolution request, the VFS will call into
> +``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request to =
the
> +user-space FUSE server. However, the server can ask the kernel to cache =
all
> +links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during the
> +``FUSE_INIT`` negotiation.
> +
> +If this flag is set, FUSE will immediately call into the VFS
> +``__page_get_link()`` from the ``->get_link()`` inode operation. The fir=
st time
> +this is done for a specific link, it will end-up sending the ``FUSE_READ=
LINK``
> +to user-space but the link contents will then be added into page-cache. =
The next
> +time the link needs to be resolved, it will use the link content that is=
 already
> +cached, and will only fallback into sending the request to use-space if =
the
> +folio isn't up-to-date.
> +
> +ACL caching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE has allowed the usage of POSIX ACLs for a long time as they could b=
e set
> +and accessed simply as extended attributes. However, it was only with th=
e
> +addition of the ``FUSE_POSIX_ACL`` flag that ACLs started to be fully su=
pported.
> +Without this flag, ACLs can still be set, but the VFS won't use them for
> +performing permission checks - that would be the user-space server's
> +responsibility.
> +
> +Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the=
 kernel.
> +In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be =
set to
> +``ACL_DONT_CACHE``.
> +
> +On the other hand, if ``FUSE_POSIX_ACL`` is set during ``FUSE_INIT``, wh=
en an
> +ACL is accessed the VFS layer will first check if it's already cached. I=
f it is
> +not, FUSE ``->get_acl`` operation is called, which will eventually send =
a
> +user-space request. Future accesses to this inode ACL will then use the =
cached
> +data.
> +
> +Setting an ACL in an inode, however, won't cache it immediately. It will=
 send
> +user-space a request with the new ACL, and the FUSE server may perform s=
ome
> +modifications before storing it.
> +
> +On the other hand, ACLs will be removed for the cache in the following
> +situations:
> +
> +-  When setting an ACL in an inode and the user-space server has set the
> +   ``FUSE_POSIX_ACL`` flag, all previously cached ACLs for this inode wi=
ll be
> +   invalidated.
> +-  When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` op=
eration.
> +-  When ``->d_revalidate()`` is called for a dentry that requires a look=
up (e.g.
> +   it has expired) and that lookup operation is successful.
> +-  When the VFS needs to check access rights for an inode (by calling
> +   ``->permission()``), attributes may need to be refreshed. If that hap=
pens,
> +   any cached ACLs for that inode will be invalidated.
> +-  After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is =
sent to
> +   user-space), the user-space server may have also updated the ACLs, so=
 any
> +   cached ACLs for this inode are also invalidated.
> +-  While processing ``FUSE_READDIRPLUS`` and a new dentry is added (unle=
ss this
> +   dentry is already being looked up (``DCACHE_PAR_LOOKUP``))
> +-  In general, when there is the need to sent a ``FUSE_STATX`` or
> +   ``FUSE_GETATTR`` to user-space (e.g. because the attributes have expi=
red).
> +   This may happen in the following cases:
> +
> +   -  When doing an ``->llseek()`` on a file with ``SEEK_END``, ``SEEK_H=
OLE`` or
> +      ``SEEK_DATA``.
> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time (to
> +      automatically invalidate cached pages), and a buffered read
> +      (``->read_iter()``) past EOF is done on a non-passthrough file.
> +   -  When the ``FUSE_WRITEBACK_CACHE`` flag is set at ``INIT`` time, an=
d a
> +      buffered write (``->write_iter()``) past EOF is done on a non-pass=
through
> +      file.
> +   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time and=
 the VFS
> +      needs to read a directory contents (``->iterate_shared()``) for a
> +      directory that is allowed to be cached.
>
