Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41935348C63
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487315; cv=none; b=SgFAqqMVREmodpR9IvCF3WD+dPxxs5EpdJ5VFDUcRDIm1okhUpo4TqaAHlLY1BhxN75fChdRWNPk5e7JV8l28z4TJOTaKqZ21+vPBgM7iWIWVOhMt2AmMARgg/pDxegV9yhH4IJtl/8J27A9iEYlE4evVQn5mInGImnYrj3iRgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487315; c=relaxed/simple;
	bh=VpekPW+lER9wN5l4mPLLCT96aosom/Cgc2osOvqOym0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Cf93pl3rkwotqbLfEznPM4N+jeoYg/K5BbU3VRsUM0+/ewEAcwDyTclO5fUkWKThu6L21Rvt28JWBeHqIblupUo4UdHhi8gBfCsPjJWyMQwyjwLKPgmDWacpnBoXLoB2eBpX5YLutc/BJIDPF0BKiOdHdk6P3mZA7ypcRdZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z425sjj6; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z425sjj6"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so2205394a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487314; x=1792092114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyWGN8x92BFhClfZ4tQgIWkJPd/YlyiaqFtPEUdqMkg=;
        b=Z425sjj6z0aZOL+gNs6rZhChu94+xR68lKMIRPzr7bUKpW8AkrFYG958WRZPQEhJmc
         yCC5571oK04ZvaKBPg/15c4HPSmuforOChkzKpfXS6XKoEARqru07o+6A55DjSMRMWql
         /kXLvHLd10bZCKKYxmeEBNmtwRs7aFFVFVRXPzKjkdnVxgdUBok+BLJhLwzLLZXYIcKs
         obWXJWWq+q/W12TXWeleumDX0sFUldxGzIG0aoG8KmT4setvMAMaQIef17efw0XJSdoj
         9aQft9tUlqt1HfpItSRGFDprtTdCU3ucNOHMxWWgJIJwZ1Y09waQVJ6j4fl71HzVMYYP
         7d0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487314; x=1792092114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyWGN8x92BFhClfZ4tQgIWkJPd/YlyiaqFtPEUdqMkg=;
        b=gFVshwhMqrBfsSqcyDkcmmAjhVRWUaX4CEbDcV5zS3/034jnN5ruvmoSfT2lijulQ3
         iLn6j/Bb2Ce83uEAuVZLGTYhXHCGF0AKhgAljHmNgTSPEk9mVjE0/ccpSHxiZ0QjqwZC
         JyxYBg3//4e2yKAk35qySg7/Otb4jF12qMw1wlIrSuS094NAI1UQbIeSNZrzVEUZm0D0
         dr3GIPea73cfc1ydKhsIjqWv2qeVdF9zaL/D9OEVrkk3WUeSvkOa+Fm6n6xPKn0jDjxU
         fapgzJDtVMS8QvUPsuMT6vvDh1RX+WH/bBdL3n3+BoKFrNVxcDJV24mEajcQ7Rk9iCd0
         BGSw==
X-Forwarded-Encrypted: i=1; AKwUvBzwuWmkkvWbJnvH42a7WorOXagvDXSkP0lyVN5gjPNbir3FkBfnQN8zSW+RDU/cE7mtS5znZpsbprGvNyCdrW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzvP8NM/6MQ+j8dhDy6GeJctrF2zGKv7xEi9kkA3LnbzKlNryq
	WoD94pFdJB5CYWZkDpHtPSyP8lL258PShytrwxyy0ks6+yAPdP0vUEm+
X-Gm-Gg: AYBFou2fM/J9JDXQ0EJDA63Jv16fZ9Y0mPglapx3I60GpzQZkJz/zbrysPSOrMZHDHf
	E5mZnNlzMtpKGc5xLCB0K3rhm0s7MhAqrGn73kbajeOF3u7HYDNGAqDp7Lg+aTlWpF541iFiz1g
	dxjgMd09Cio4wEYUStWYOf0wm133C2kqS8LLLjZ75E05V47+AYJk8DVRkXIykgtY8n0skTfvubV
	AnYB+9IndTFL3qtfPCEHAjxB1L8NzTptiaDCfw+SqUMcVV1Vd32wLWVgOA6a6b8zAlR5YWgK4Ho
	UVAT2MI03o4xV2CoOuoxWMvqKoaeqeg+amJ3qy7yOlM6I+sXmHCdKK7ryaoCvlXtqqMIZxERSFS
	VxctpB8xUF1n7XXwJ52H6XLn8vJbBeEAo7kJF6utxvlpNXqEaz8nMh8kULYynQBmPUi3ebMuxhS
	n8mwBax6nUWWfPnJ+6CsUAr0eIt8r7Hzrfi3S1OQgCA0DNGWHOZDUxlSX2cMGJC+pjruo4OIVVk
	A==
X-Received: by 2002:a17:90b:3bc7:b0:3ab:22fe:b142 with SMTP id 98e67ed59e1d1-3ab22fecf9fmr1055731a91.1.1791487313011;
        Thu, 08 Oct 2026 12:21:53 -0700 (PDT)
Received: from skinsburskii ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm74973a91.4.2026.10.08.12.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:21:52 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:21:50 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fuse: add negotiated per-inode open and release
 suppression
Message-ID: <asftTiSldKhdNEYA@skinsburskii>
References: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
 <20261008-fuse-per-inode-no-open-v2-1-39c60fe97728@gmail.com>
 <2621089d-f087-4b0d-89bf-3cd1218b5f66@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2621089d-f087-4b0d-89bf-3cd1218b5f66@infradead.org>

On Thu, Oct 08, 2026 at 11:17:46AM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 10/8/26 11:06 AM, Stanislav Kinsburskii wrote:
> > Filesystems serving cached content may not need per-open state for most
> > inodes, while still relying on OPEN for control files. The connection-wide
> > no-open behavior selected by ENOSYS cannot express this distinction.
> > 
> > Add FUSE_PER_INODE_NO_OPEN to INIT negotiation and FUSE_ATTR_NO_OPEN to
> > inode attributes. For marked inodes, use the existing zero-handle defaults
> > and normally omit OPEN/OPENDIR and the corresponding RELEASE/RELEASEDIR.
> > Remember whether each handle was opened locally, so later attribute updates
> > do not determine the release behavior of existing handles.
> > 
> > Retain RELEASE after a successful remote flock operation, even when OPEN
> > was skipped, so FUSE_RELEASE_FLOCK_UNLOCK can clean up server-side locks.
> > Servers negotiating remote flock must accept this RELEASE with a zero file
> > handle and no preceding OPEN, including after an explicit unlock.
> > 
> > Keep the release argument allocation for regular files, which pins the
> > inode while asynchronous I/O completes. Honor the hint for internal opens
> > used by file-attribute ioctls as well. The capability check excludes CUSE
> > before accessing its non-FUSE inode as a fuse_inode.
> > 
> > The per-inode hint does not suppress OPEN for atomic O_TRUNC, since the
> > server must perform the truncation. CREATE retains its existing handle
> > lifecycle. Connection-wide no-open/no-opendir behavior selected by ENOSYS
> > continues to take precedence.
> > 
> > Update the cached hint from LOOKUP, GETATTR, SETATTR and READDIRPLUS
> > attributes. Preserve it across STATX replies, which do not carry
> > fuse_attr.flags.
> > 
> > Document negotiation, cache and handle semantics, and the server's
> > responsibilities. No additional access-time or open-reference accounting
> > is introduced.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> >  Documentation/filesystems/fuse/fuse-no-open.rst | 49 +++++++++++++++++++++++++
> >  Documentation/filesystems/fuse/index.rst        |  1 +
> >  fs/fuse/file.c                                  | 26 ++++++++++---
> >  fs/fuse/fuse_i.h                                | 17 ++++++++-
> >  fs/fuse/inode.c                                 |  9 +++++
> >  fs/fuse/ioctl.c                                 |  3 +-
> >  include/uapi/linux/fuse.h                       | 13 ++++++-
> >  7 files changed, 110 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/fuse/fuse-no-open.rst b/Documentation/filesystems/fuse/fuse-no-open.rst
> > new file mode 100644
> > index 000000000000..4526512d358c
> > --- /dev/null
> > +++ b/Documentation/filesystems/fuse/fuse-no-open.rst
> > @@ -0,0 +1,49 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Per-inode open suppression
> > +=========================
> 
> Documentation/filesystems/fuse/fuse-no-open.rst:4: WARNING: Title underline too short.
> 
> Per-inode open suppression
> ========================= [docutils]
> 

Addresed in v3.

Thank you,
Stanislav

> > +
> > +A filesystem can avoid OPEN and RELEASE requests for individual inodes by
> > +negotiating FUSE_PER_INODE_NO_OPEN in INIT and setting FUSE_ATTR_NO_OPEN in
> > +``fuse_attr.flags``.  For directories, the flag suppresses OPENDIR and
> > +RELEASEDIR instead.  This allows, for example, cached content files to avoid
> > +open round trips while control files on the same connection retain their
> > +open handlers.  Without the negotiated capability the attribute is ignored.
> > +
> > +The kernel updates the hint when it accepts attributes in replies such as
> > +LOOKUP, GETATTR, SETATTR and READDIRPLUS.  STATX replies do not carry
> > +``fuse_attr.flags`` and leave the hint unchanged.  The hint is cached inode
> > +state; it is not independently revalidated on every open.  A server changing
> > +the hint must arrange for fresh attributes to reach the kernel and tolerate
> > +concurrent opens using the previous value.
> > +
> > +For an open served locally, the file handle is zero, FOPEN_KEEP_CACHE is
> > +set, and directories also have FOPEN_CACHE_DIR set.  Subsequent requests
> > +identify the object by the node ID and may carry a zero file handle.  The
> > +server must support these requests without per-open state.  Whether OPEN was
> > +sent is recorded for each handle and is not changed by later attribute
> > +updates.  An existing server-opened handle still receives its matching
> > +RELEASE if the inode hint subsequently becomes set.
> > +
> > +Remote flock locking is an exception to RELEASE suppression.  When
> > +FUSE_FLOCK_LOCKS is negotiated and a handle has successfully performed a
> > +server-side flock operation, its final close sends RELEASE with
> > +FUSE_RELEASE_FLOCK_UNLOCK and the lock owner, even if OPEN was suppressed.
> > +The server must accept this RELEASE with a zero file handle and no preceding
> > +OPEN, and use the node ID and lock owner to remove any remaining flock locks.
> > +This also applies after an explicit unlock, since the kernel records whether
> > +a flock operation succeeded rather than tracking the server's current locks.
> > +
> > +When FUSE_ATOMIC_O_TRUNC is negotiated, an open with O_TRUNC still sends
> > +OPEN and receives a matching RELEASE, so the server can perform truncation.
> > +CREATE also retains its usual open and release semantics.  Connection-wide
> > +no-open behavior selected by an ENOSYS response continues to take precedence.
> > +
> > +The hint does not make an inode immutable, grant permissions, or suppress
> > +other operations such as FLUSH, FSYNC, locking or data I/O.  Servers supporting
> > +remote flock must implement the RELEASE cleanup described above.  A server must
> > +only set it when its access policy and file semantics permit the default
> > +open behavior described above.  Servers needing per-open authorization,
> > +nonzero handles, direct I/O, passthrough or other OPEN reply flags must keep
> > +handling OPEN for those inodes.  No additional access-time or open-reference
> > +accounting is performed by this feature.
> 
> 
> -- 
> ~Randy
> 
