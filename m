Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491A38836C;
	Thu,  8 Oct 2026 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483474; cv=none; b=orJlHW+bsk16CTmmoEQvhvGqyYoKtwucXoVbkufDG3L5s9iqL2t7k5jfBmPMUZLKbDnvQkkXGW+EdhNVREuWCjMHD69qNUdsCJ3GIu+iYbSK5rb4hwvAvUwiL8/MSbC12SBetAnxNeOW3lRV7L3/QS4V6Y4tkm3t2Ch9T29tfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483474; c=relaxed/simple;
	bh=Gx4ilfMhQUF7cyVqxlycVnXjjdeLDQtz1EYjm8vSauU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erhq/dyzUgE7/y0AKiMsNv4LrA4Sz8Ox0vhsRaRft7k6g1Ihir0oibp8+vAfv16fbpEyvCQ2w96SgmMT2O7rZ4k7cb2DGG1DM4FLvcQ99yQFn99gqFhlpG9yI89bOvYEK32wPduD6wBUKq++SzaGAuE35isBkyYYzbQIpksCmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MCFOyzn0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MCFOyzn0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NIFjAQDly0W7GvmafYnFnRQ5IyNA9GxyxzUzs3G7GY0=; b=MCFOyzn0Y7uJkjI3WYMmHmj3iA
	QyQkD+3RKsrzlJPuXv3fV66hYqWXZVwhMAnYfmOZ5IPj8XMaIB2DjEjK4cW1pF/BcvkZtVlEwlCCR
	bKeDTMP++Kc1pj43qMcrp9MWYvvV7bHJCj8iCXrBMBbaT4xw0KfsLmEv+3NUHBpQ4DyCOhbx0Gkxf
	8YCTdgOge8Oz35JbnD4W9nXQasRe5oZpFn+5t8qc0aJq0PrY4WjKAqlPIZBc25lw+rDPoXceU13Hm
	GKiU25vM9Uu0va02GLeH5xsAuqfwshw4Fy0Fo3CAKthAZXLhayBOXOTthIglspmagy/mCF7fgMr8p
	9McMzPMQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsgd-00000004r2R-2GzP;
	Thu, 08 Oct 2026 18:17:47 +0000
Message-ID: <2621089d-f087-4b0d-89bf-3cd1218b5f66@infradead.org>
Date: Thu, 8 Oct 2026 11:17:46 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] fuse: add negotiated per-inode open and release
 suppression
To: Stanislav Kinsburskii <skinsburskii@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
 <20261008-fuse-per-inode-no-open-v2-1-39c60fe97728@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261008-fuse-per-inode-no-open-v2-1-39c60fe97728@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/8/26 11:06 AM, Stanislav Kinsburskii wrote:
> Filesystems serving cached content may not need per-open state for most
> inodes, while still relying on OPEN for control files. The connection-wide
> no-open behavior selected by ENOSYS cannot express this distinction.
> 
> Add FUSE_PER_INODE_NO_OPEN to INIT negotiation and FUSE_ATTR_NO_OPEN to
> inode attributes. For marked inodes, use the existing zero-handle defaults
> and normally omit OPEN/OPENDIR and the corresponding RELEASE/RELEASEDIR.
> Remember whether each handle was opened locally, so later attribute updates
> do not determine the release behavior of existing handles.
> 
> Retain RELEASE after a successful remote flock operation, even when OPEN
> was skipped, so FUSE_RELEASE_FLOCK_UNLOCK can clean up server-side locks.
> Servers negotiating remote flock must accept this RELEASE with a zero file
> handle and no preceding OPEN, including after an explicit unlock.
> 
> Keep the release argument allocation for regular files, which pins the
> inode while asynchronous I/O completes. Honor the hint for internal opens
> used by file-attribute ioctls as well. The capability check excludes CUSE
> before accessing its non-FUSE inode as a fuse_inode.
> 
> The per-inode hint does not suppress OPEN for atomic O_TRUNC, since the
> server must perform the truncation. CREATE retains its existing handle
> lifecycle. Connection-wide no-open/no-opendir behavior selected by ENOSYS
> continues to take precedence.
> 
> Update the cached hint from LOOKUP, GETATTR, SETATTR and READDIRPLUS
> attributes. Preserve it across STATX replies, which do not carry
> fuse_attr.flags.
> 
> Document negotiation, cache and handle semantics, and the server's
> responsibilities. No additional access-time or open-reference accounting
> is introduced.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  Documentation/filesystems/fuse/fuse-no-open.rst | 49 +++++++++++++++++++++++++
>  Documentation/filesystems/fuse/index.rst        |  1 +
>  fs/fuse/file.c                                  | 26 ++++++++++---
>  fs/fuse/fuse_i.h                                | 17 ++++++++-
>  fs/fuse/inode.c                                 |  9 +++++
>  fs/fuse/ioctl.c                                 |  3 +-
>  include/uapi/linux/fuse.h                       | 13 ++++++-
>  7 files changed, 110 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/fuse/fuse-no-open.rst b/Documentation/filesystems/fuse/fuse-no-open.rst
> new file mode 100644
> index 000000000000..4526512d358c
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-no-open.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Per-inode open suppression
> +=========================

Documentation/filesystems/fuse/fuse-no-open.rst:4: WARNING: Title underline too short.

Per-inode open suppression
========================= [docutils]

> +
> +A filesystem can avoid OPEN and RELEASE requests for individual inodes by
> +negotiating FUSE_PER_INODE_NO_OPEN in INIT and setting FUSE_ATTR_NO_OPEN in
> +``fuse_attr.flags``.  For directories, the flag suppresses OPENDIR and
> +RELEASEDIR instead.  This allows, for example, cached content files to avoid
> +open round trips while control files on the same connection retain their
> +open handlers.  Without the negotiated capability the attribute is ignored.
> +
> +The kernel updates the hint when it accepts attributes in replies such as
> +LOOKUP, GETATTR, SETATTR and READDIRPLUS.  STATX replies do not carry
> +``fuse_attr.flags`` and leave the hint unchanged.  The hint is cached inode
> +state; it is not independently revalidated on every open.  A server changing
> +the hint must arrange for fresh attributes to reach the kernel and tolerate
> +concurrent opens using the previous value.
> +
> +For an open served locally, the file handle is zero, FOPEN_KEEP_CACHE is
> +set, and directories also have FOPEN_CACHE_DIR set.  Subsequent requests
> +identify the object by the node ID and may carry a zero file handle.  The
> +server must support these requests without per-open state.  Whether OPEN was
> +sent is recorded for each handle and is not changed by later attribute
> +updates.  An existing server-opened handle still receives its matching
> +RELEASE if the inode hint subsequently becomes set.
> +
> +Remote flock locking is an exception to RELEASE suppression.  When
> +FUSE_FLOCK_LOCKS is negotiated and a handle has successfully performed a
> +server-side flock operation, its final close sends RELEASE with
> +FUSE_RELEASE_FLOCK_UNLOCK and the lock owner, even if OPEN was suppressed.
> +The server must accept this RELEASE with a zero file handle and no preceding
> +OPEN, and use the node ID and lock owner to remove any remaining flock locks.
> +This also applies after an explicit unlock, since the kernel records whether
> +a flock operation succeeded rather than tracking the server's current locks.
> +
> +When FUSE_ATOMIC_O_TRUNC is negotiated, an open with O_TRUNC still sends
> +OPEN and receives a matching RELEASE, so the server can perform truncation.
> +CREATE also retains its usual open and release semantics.  Connection-wide
> +no-open behavior selected by an ENOSYS response continues to take precedence.
> +
> +The hint does not make an inode immutable, grant permissions, or suppress
> +other operations such as FLUSH, FSYNC, locking or data I/O.  Servers supporting
> +remote flock must implement the RELEASE cleanup described above.  A server must
> +only set it when its access policy and file semantics permit the default
> +open behavior described above.  Servers needing per-open authorization,
> +nonzero handles, direct I/O, passthrough or other OPEN reply flags must keep
> +handling OPEN for those inodes.  No additional access-time or open-reference
> +accounting is performed by this feature.


-- 
~Randy

