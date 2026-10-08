Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CA3019D6
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 18:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483756; cv=none; b=PJSm4AhhXb+9/+yTn3kh2HtnxF275LEkhOhPHybHbmFO/xwZNGuYZJtdbkDC95cpJDBBoSudSEINUMK2sbiDQUcWRFfzw6jxMNjz+33dYI/pKQWYn0NxXBQOrSvn6s+dsV0JOQ13FUYkco6OLaKsTKsbJt5yzWlQtxQs7qDy330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483756; c=relaxed/simple;
	bh=8rUSdaxf9W4YrcR1xriFOiJ92/SffW9hVpgZebZWxMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu8BKH+8PHjafdxtZUPtSltAkEay7cJsIqi25ko5qVo5biN0hhMOlK8SmNB6PAFLg+k+sQu1/WfEqt9Ap7RD99O8CBnLRuUd32L+OtgfVRFRlQ6yXFu7eK0UbqpHEAZ/8HHSUrRQPLrST89HNyp+gwrVsdoQeqo0YAFHsqinNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pL8bbXOT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pL8bbXOT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a813079a55so661345a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483755; x=1792088555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffsyyM6jxRzDAxsxu3bTyU2I+QBaK/8IL6L7MNGURGE=;
        b=pL8bbXOTsbYKHDRgppHrRDKooZNP1TPOIKBGHtgefhOPpxc8vDQjiWc9f23asug2uQ
         u2Pe5WUf1CfaQy8TV4/H3SX/F/rk9eSxzs+9cCnKbCgC1ESWMCtuPfOX6az0v6yQ1YC9
         CeDLujXDRCIaVQbMhWPeS7jlpKEOwP64krt2GTFcV2TkZox9YaOcZ0NShRtQ5Iyewsry
         dD/ROx4F81x2a7/n0FeUKKoxgd/SFNMEdIchOAPBEyKVsrWXqlS2XptC2eGSTAN6h+wU
         raNjfGuOouL9ebTZoG13tg9Fh3Sb+AxcaraBTLNt22rlnNA0HtosDLLrdiDL+YOT3PcN
         d/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483755; x=1792088555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffsyyM6jxRzDAxsxu3bTyU2I+QBaK/8IL6L7MNGURGE=;
        b=sL3htrNMRjTqpULE56xSQLllmnz7bQH7PMHLopexn7eUdQjcYQsPgN/QhuCVYsGxRH
         oUujBJ+zE1a1kFsk8zlut0WVCJZodBKz9kkPm7daR+qz10WayZ/FPUHg1S5tM+qSd47a
         HvqVSBv0G8ghXGc5RqwdrNr7whSLBu3ULlEjaFp2PEQVcbzUDNUUkTVrwzcQFjTW/WJi
         ohleyW5WwNblgFlldQBiSsHxj3AXiH91SR0nsFiXNcB63JJqIHbEE/IkrN0BOzMu7dT+
         YXSK7TkGHLENK5EnPiC6zMFXhL9F4yTwW9MP+wkuxanXWf+MigOpktfxNws9PRtu6kjy
         V2sQ==
X-Forwarded-Encrypted: i=1; AKwUvByiXgXI0P4vSUgjinRXvTNma+ESiuvK03xBioW9ayB8/ccRwjdIi3VM+AeR0IgknRN+9v0lRO/VrkUiBDFuUmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyaOsYusLlyL4RVf3SkyGzUC2vvem0PEzGTNfNhJL7JypLOy16
	sBv6wYi4AIBg8f3a81vl2YVOxlrYt5MVnDWmK1dtH+2Yzt1LOx2+IeOU
X-Gm-Gg: AYBFou03yi/JU/CI5SR9T1VDWv8DUXQzkwxXei+EYo6XNT+D/tLz6PTYgWmKotRx6pG
	LPLByY09e7HQP5bqBrM2RaDyd97+AodJx0kYNtAajVb7vSnCuIK3kl1csTQZJWKclbygtZRgj17
	3HkoDc5AsUfqcSAPV7dUXvpLry0OYyKNZQeR29vLMyvlT/dF40zLZLOpBuWAl2J+UV0hdd/cfZw
	BzxLGYZQfcc+EuoX1TBgHglsL1A2wBRhEP6vSjVVQ+hGIqb+Cu476sw1vvTcEA8/lTURW4BbL1D
	pIN02v9b2H7ccbAbrDN+pK4GrroeDlzT80FXjrJ3U2uxL8PBKZQsF7LBZckrLd6TLL5BSLtMc/3
	CJaQ7PSZMxOyT4OVpd3Y1L5k0pRGmUJkvwVlRDeVacNWovfRm9Kqykvg9mf2hvSH52WHOLHuf90
	492SH41SW7/qLMcExyRtjJqUdbAfdGnuCVLtrzzCscXSJxnBM/hqimdpP06/SGhQAFrYbNxhGEP
	p08EsNRAx1L2g==
X-Received: by 2002:a17:90b:4c42:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3aaed994129mr1821848a91.38.1791483754421;
        Thu, 08 Oct 2026 11:22:34 -0700 (PDT)
Received: from skinsburskii ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3107fccesm327838a91.4.2026.10.08.11.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:22:33 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:22:30 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] fuse: add negotiated per-inode open and release
 suppression
Message-ID: <asffZhOYDalaMd2i@skinsburskii>
References: <20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com>
 <20261007-fuse-per-inode-no-open-v1-1-be5229fe89f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-fuse-per-inode-no-open-v1-1-be5229fe89f5@gmail.com>

On Wed, Oct 07, 2026 at 04:14:34PM -0700, Stanislav Kinsburskii wrote:
> Filesystems serving cached content may not need per-open state for most
> inodes, while still relying on OPEN for control files. The connection-wide
> no-open behavior selected by ENOSYS cannot express this distinction.
> 
> Add FUSE_PER_INODE_NO_OPEN to INIT negotiation and FUSE_ATTR_NO_OPEN to
> inode attributes. For marked inodes, use the existing zero-handle defaults
> and omit OPEN/OPENDIR and the corresponding RELEASE/RELEASEDIR. Store the
> release decision in the file, so attribute changes cannot suppress release
> of a server-opened handle or cause release of a locally opened one.
> 
> Keep the release argument allocation for regular files, which pins the
> inode while asynchronous I/O completes. Honor the hint for internal opens
> used by file-attribute ioctls as well. The capability check excludes CUSE
> before accessing its non-FUSE inode as a fuse_inode.
> 
> Continue sending OPEN for atomic O_TRUNC, since the server must perform
> the truncation. CREATE retains its existing handle lifecycle. Preserve the
> cached hint across STATX replies, which do not carry fuse_attr.flags.
> 
> Document negotiation, cache and handle semantics, and the server's
> responsibilities. No additional access-time or open-reference accounting
> is introduced.
> 

Sashiko found a bug in this patch: https://sashiko.dev/#/patchset/20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5%40gmail.com

I addressed it in v2.

Thanks,
Stanislav

> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  Documentation/filesystems/fuse/fuse-no-open.rst | 39 +++++++++++++++++++++++++
>  Documentation/filesystems/fuse/index.rst        |  1 +
>  fs/fuse/file.c                                  | 26 +++++++++++++----
>  fs/fuse/fuse_i.h                                | 17 ++++++++++-
>  fs/fuse/inode.c                                 |  9 ++++++
>  fs/fuse/ioctl.c                                 |  3 +-
>  include/uapi/linux/fuse.h                       | 11 ++++++-
>  7 files changed, 98 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/fuse/fuse-no-open.rst b/Documentation/filesystems/fuse/fuse-no-open.rst
> new file mode 100644
> index 000000000000..314b5adb289b
> --- /dev/null
> +++ b/Documentation/filesystems/fuse/fuse-no-open.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Per-inode open suppression
> +=========================
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
> +server must support these requests without per-open state.  The decision to
> +omit RELEASE is recorded for each open and is not changed by later attribute
> +updates.  An existing server-opened handle still receives its matching
> +RELEASE if the inode hint subsequently becomes set.
> +
> +When FUSE_ATOMIC_O_TRUNC is negotiated, an open with O_TRUNC still sends
> +OPEN and receives a matching RELEASE, so the server can perform truncation.
> +CREATE also retains its usual open and release semantics.  Connection-wide
> +no-open behavior selected by an ENOSYS response continues to take precedence.
> +
> +The hint does not make an inode immutable, grant permissions, or suppress
> +other operations such as FLUSH, FSYNC, locking or data I/O.  A server must
> +only set it when its access policy and file semantics permit the default
> +open behavior described above.  Servers needing per-open authorization,
> +nonzero handles, direct I/O, passthrough or other OPEN reply flags must keep
> +handling OPEN for those inodes.  No additional access-time or open-reference
> +accounting is performed by this feature.
> diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
> index 3dada6c4057a..6dd9192f74fe 100644
> --- a/Documentation/filesystems/fuse/index.rst
> +++ b/Documentation/filesystems/fuse/index.rst
> @@ -12,4 +12,5 @@ FUSE (Filesystem in Userspace) Technical Documentation
>     fuse-io
>     fuse-io-uring
>     fuse-passthrough
> +   fuse-no-open
>     uapi/fuse-uapi-io-uring
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 3d209e2b71ba..6d57228acd1b 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -108,8 +108,9 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
>  			fuse_file_io_release(ff, ra->inode);
>  
>  		if (!args) {
> -			/* Do nothing when server does not implement 'opendir' */
> -		} else if (args->opcode == FUSE_RELEASE && ff->fm->fc->no_open) {
> +			/* No release needed when OPENDIR was skipped. */
> +		} else if (args->opcode == FUSE_RELEASE &&
> +			   (ff->fm->fc->no_open || ff->no_open)) {
>  			fuse_release_end(args, 0);
>  		} else if (sync) {
>  			fuse_simple_request(ff->fm, args);
> @@ -130,13 +131,26 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
>  	}
>  }
>  
> +static bool fuse_open_needed(struct fuse_conn *fc, unsigned int open_flags,
> +			     bool isdir, bool no_open)
> +{
> +	if (isdir ? fc->no_opendir : fc->no_open)
> +		return false;
> +
> +	/* Atomic truncation must still be performed by the server's OPEN. */
> +	if ((open_flags & O_TRUNC) && fc->atomic_o_trunc)
> +		return true;
> +
> +	return !no_open;
> +}
> +
>  struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
> -				 unsigned int open_flags, bool isdir)
> +				 unsigned int open_flags, bool isdir, bool no_open)
>  {
>  	struct fuse_conn *fc = fm->fc;
>  	struct fuse_file *ff;
>  	int opcode = isdir ? FUSE_OPENDIR : FUSE_OPEN;
> -	bool open = isdir ? !fc->no_opendir : !fc->no_open;
> +	bool open = fuse_open_needed(fc, open_flags, isdir, no_open);
>  	bool release = !isdir || open;
>  
>  	/*
> @@ -152,6 +166,7 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
>  		return ERR_PTR(-ENOMEM);
>  
>  	ff->fh = 0;
> +	ff->no_open = !open;
>  	/* Default for no-open */
>  	ff->open_flags = FOPEN_KEEP_CACHE | (isdir ? FOPEN_CACHE_DIR : 0);
>  	if (open) {
> @@ -189,7 +204,8 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
>  int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
>  		 bool isdir)
>  {
> -	struct fuse_file *ff = fuse_file_open(fm, nodeid, file->f_flags, isdir);
> +	struct fuse_file *ff = fuse_file_open(fm, nodeid, file->f_flags, isdir,
> +					    fuse_inode_no_open(fm->fc, file_inode(file)));
>  
>  	if (!IS_ERR(ff))
>  		file->private_data = ff;
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 87e2bd9d4bb1..76157a84db22 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -257,6 +257,8 @@ enum {
>  	 * or the fuse server has an exclusive "lease" on distributed fs
>  	 */
>  	FUSE_I_EXCLUSIVE,
> +	/* Server does not need OPEN/OPENDIR for this inode */
> +	FUSE_I_NO_OPEN,
>  };
>  
>  struct fuse_conn;
> @@ -322,6 +324,9 @@ struct fuse_file {
>  
>  	/** @flock: Has flock been performed on this file? */
>  	bool flock:1;
> +
> +	/** @no_open: Open was served locally without an OPEN/OPENDIR request */
> +	bool no_open:1;
>  };
>  
>  struct fuse_release_args {
> @@ -556,6 +561,9 @@ struct fuse_conn {
>  	/** @no_opendir: Is opendir/releasedir not implemented by fs? */
>  	unsigned no_opendir:1;
>  
> +	/** @per_inode_no_open: Honor FUSE_ATTR_NO_OPEN */
> +	unsigned per_inode_no_open:1;
> +
>  	/** @no_fsync: Is fsync not implemented by fs? */
>  	unsigned no_fsync:1;
>  
> @@ -833,6 +841,13 @@ static inline struct fuse_inode *get_fuse_inode(const struct inode *inode)
>  	return container_of(inode, struct fuse_inode, inode);
>  }
>  
> +static inline bool fuse_inode_no_open(struct fuse_conn *fc, struct inode *inode)
> +{
> +	/* CUSE uses a non-FUSE inode and cannot negotiate this capability. */
> +	return fc->per_inode_no_open &&
> +		test_bit(FUSE_I_NO_OPEN, &get_fuse_inode(inode)->state);
> +}
> +
>  static inline u64 get_node_id(struct inode *inode)
>  {
>  	return get_fuse_inode(inode)->nodeid;
> @@ -1261,7 +1276,7 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
>  
>  /* file.c */
>  struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
> -				 unsigned int open_flags, bool isdir);
> +				 unsigned int open_flags, bool isdir, bool no_open);
>  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
>  		       unsigned int open_flags, fl_owner_t id, bool isdir);
>  
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index cbb10e19e7e8..63924d95caa3 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -299,6 +299,11 @@ void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
>  	 * anyway. Its less efficient but should be safe.
>  	 */
>  	inode->i_flags &= ~S_NOSEC;
> +
> +	/* STATX replies do not carry fuse_attr.flags. */
> +	if (fc->per_inode_no_open && !sx)
> +		assign_bit(FUSE_I_NO_OPEN, &fi->state,
> +			   attr->flags & FUSE_ATTR_NO_OPEN);
>  }
>  
>  u32 fuse_get_cache_mask(struct inode *inode)
> @@ -1432,6 +1437,8 @@ static void process_init_reply(struct fuse_args *args, int error)
>  
>  			if (fuse_syncfs_enable(fc, flags))
>  				fc->sync_fs = 1;
> +			if (flags & FUSE_PER_INODE_NO_OPEN)
> +				fc->per_inode_no_open = 1;
>  		} else {
>  			ra_pages = fc->max_read / PAGE_SIZE;
>  			fc->no_lock = 1;
> @@ -1510,6 +1517,8 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
>  	if (fuse_uring_enabled())
>  		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
>  
> +	flags |= FUSE_PER_INODE_NO_OPEN;
> +
>  	ia->in.flags = flags;
>  	ia->in.flags2 = flags >> 32;
>  
> diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
> index ce1807704da6..7fc11bb3eee9 100644
> --- a/fs/fuse/ioctl.c
> +++ b/fs/fuse/ioctl.c
> @@ -492,7 +492,8 @@ static struct fuse_file *fuse_priv_ioctl_prepare(struct inode *inode)
>  	if (!S_ISREG(inode->i_mode) && !isdir)
>  		return ERR_PTR(-ENOTTY);
>  
> -	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir);
> +	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir,
> +			      fuse_inode_no_open(fm->fc, inode));
>  }
>  
>  static void fuse_priv_ioctl_cleanup(struct inode *inode, struct fuse_file *ff)
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 10a7f31c4bdf..784a641596be 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -251,6 +251,9 @@
>   *
>   *  7.47
>   *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
> + *
> + *  7.48
> + *  - add FUSE_PER_INODE_NO_OPEN and FUSE_ATTR_NO_OPEN
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -286,7 +289,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 47
> +#define FUSE_KERNEL_MINOR_VERSION 48
>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -473,6 +476,7 @@ struct fuse_file_lock {
>   *		with CAP_SYS_ADMIN in the initial user namespace (the same
>   *		privilege that mounting virtiofs or fuseblk requires).
>   *		Insufficiently privileged servers ignore it.
> + * FUSE_PER_INODE_NO_OPEN: honor FUSE_ATTR_NO_OPEN in inode attributes
>   */
>  #define FUSE_ASYNC_READ		(1 << 0)
>  #define FUSE_POSIX_LOCKS	(1 << 1)
> @@ -522,6 +526,7 @@ struct fuse_file_lock {
>  #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
>  #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>  #define FUSE_HAS_SYNCFS		(1ULL << 44)
> +#define FUSE_PER_INODE_NO_OPEN	(1ULL << 45)
>  
>  /**
>   * CUSE INIT request/reply flags
> @@ -605,9 +610,13 @@ struct fuse_file_lock {
>   *
>   * FUSE_ATTR_SUBMOUNT: Object is a submount root
>   * FUSE_ATTR_DAX: Enable DAX for this file in per inode DAX mode
> + * FUSE_ATTR_NO_OPEN: Skip OPEN/OPENDIR and matching RELEASE/RELEASEDIR;
> + *                   requires FUSE_PER_INODE_NO_OPEN. Atomic O_TRUNC opens
> + *                   still go to the server.
>   */
>  #define FUSE_ATTR_SUBMOUNT      (1 << 0)
>  #define FUSE_ATTR_DAX		(1 << 1)
> +#define FUSE_ATTR_NO_OPEN	(1 << 2)
>  
>  /**
>   * Open flags
> 
> -- 
> 2.43.0
> 
