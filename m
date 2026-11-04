Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810758;
	b=U/WBs/5Mcg0FXfOtHB98bvBoghhLk2glCK8F4PCHtJgSXbZoPO8qJCqQZvmzfhUijPLn
	 F9GHIY6mis5nnPaDekqSVcbQFarFtXxELJ02xQFaGYpjC1pj4+Si6ImevvMunV8RFzNEo
	 D+6LgzE8+zAT+9BQv6dr4LfuNr8l5hg59prszL0yiSk8I7r3n1XLOg5cAQPPvgkjzQhbE
	 gUwCLvHPilHvtguCYymC2Eln6u26vY1Jdcz9dy4P1gHG8iNOyhePv14/Qc8HM8ry4heCZ
	 5iPpSQz9bR10S8p9RrLLFbeiXOG3EM2IHe7OVFACRwacrlNFwCsbbRoQKHUG5osDQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=dMRlEbt6cHro/1IG77teEVtLiLDMtq9tpaJD/wmZeq8=;
	b=z085NtBr3+35rc6SaFSxuLQOj4bB/Tf4DUkxcvZNex+VYZeb38UO95aW3HPh/bOFMXEx
	 hghHePp+5/5njOHtS/BybsydQoO1x5pf6nDYCMnumBETWcdtQKzEGrQvV2wgqLbGD1XRB
	 EwAwewM7lXqjJGjHLdWDAIRWg2SUVF3gxVFaEXqwYhOrCJ+wMaXiboxnt73cmRzgZYRlG
	 p8bFNE4eSPpTvvnW0Ugt+eyeEVj3UMU1bBqbHEc8QutSrn+9cw6GlHUyehLUtpPFK5nOq
	 q+iPL09rxg9b3DHTXZ53c4LmrQadgXpjik4DMj15nwTZpEjy4S90YQBI9maro1rCP1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvMQyH0f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED5606D808;
	Wed,  4 Nov 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvMQyH0f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6296E1F00A16;
	Wed,  4 Nov 2026 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810758;
	bh=dMRlEbt6cHro/1IG77teEVtLiLDMtq9tpaJD/wmZeq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IvMQyH0fvGLwwH3rDmeWMLfCLYAGdIbnCG7AOu8FUrXpcI70IKaVwu29p1G8lxanC
	 qUOeAK2OnjpXBnv2US7vgM90DOjtp52wtMBTd3//9mHUWaamJQGkqBwlP2RBMYmki6
	 jf1VFR4XDyT+sYFzB9eEt1mMGb/7sXTdpPJoeALrFdo6tMxCoSpD0MGcMLBSF5Oskg
	 12jrVbegBjbo1u0Xoaa66/zOFOLBdGhyc6qv8S7xo6wIhvUCnvw91utT46e4QcgkAE
	 sDhLQVOM9U5RvpQ1scMUIV3w11TSDzscUg76rCdIH+1RbNg98eZkKIso3/Sw7tl5Nb
	 kLzFUfNWcGCug==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files
 that are still linked
In-Reply-To: <20261103010216.3447716-9-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:14 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-9-dmatlack@google.com>
Date: Wed, 04 Nov 2026 17:45:53 +0100
Message-ID: <2vxza4nok0ji.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi David,

On Tue, Nov 03 2026, David Matlack wrote:

> Allow preserving tmpfs files that are still linked. To preserve any
> file, require permission to write to it and the file to be opened for
> reading, and reject append-only files.
>
> shmem_luo already accepts any shmem file without links, which includes
> unlinked tmpfs files and files created with O_TMPFILE. Accepting linked
> files means that userspace doesn't have to unlink files to preserve them
> and can keep using them by path until the live update.

No, no. As I wrote in the previous patch too, this is a *bug*, and not
"supported". Please don't treat it as such. Tell your LLM to also not
treat it as such ;-)

This patch doesn't do "Allow preserving tmpfs files that are still
linked", it does "Allow preserving tmpfs files".

>
> The path of the file isn't preserved. Like other files from tmpfs
> mounts, a linked file is retrieved onto a tmpfs mount chosen by
> userspace, which can then link it at the path it wants.
>
> While a file is preserved, its size is frozen, so truncating it,
> fallocate() and writes past its end fail with -EPERM. For a linked file,
> this affects everyone who opens the file by its path, so a caller that
> can only read the file, e.g. a world-readable file in /dev/shm, could
> use it to break the owner of the file. So require permission to write to
> the file to preserve it, for all files. Like FS_IOC_ENABLE_VERITY, don't

That makes sense, but can you do it for memfd as well please, as a
preparatory patch?

> require a file opened for writing, so that binaries that are being
> executed can still be preserved through read-only fds. Also don't
> require a writable mount, since preserving a file doesn't write to the
> filesystem. If the size of the file can't change anyway, because it is
> immutable or on a read-only superblock, also let its owner preserve it.
> Don't let others do that, since the size could change again once the
> file is made writable. Like FS_IOC_ENABLE_VERITY, reject append-only
> files, since their writers can only append to them, and freezing their
> size would stop all appends.
>
> Also like FS_IOC_ENABLE_VERITY, require the file to be opened for
> reading. The retrieved file can be read, so otherwise a caller that can
> only write to a file could preserve it to read its contents.

I've stopped reading it by this point. Sounds too LLM-ey. Please try
to make this easier to read for humans.

For example, why are we even talking about FS_IOC_ENABLE_VERITY? I
reckon you have it in your chat as an example to draw design from, but
then LLMs have a tendency to leak those information in patch logs. I
usually spawn a subagent with clean context and a high level description
of the goal to review the changes and changelogs, to clean up these
things, and then of course review everything manually.

Same thing in your comments.

Please clean them up.

>
> Preserving a file also fills its holes, but don't require any permission
> for that. Anyone who can read a tmpfs file can already fill its holes by
> faulting them in through a read-only mapping, also on read-only mounts
> and for immutable files.
>
> Document the frozen size and the permission requirements.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  mm/shmem_luo.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
> index ecbeb37d33a8..0c012f242fc5 100644
> --- a/mm/shmem_luo.c
> +++ b/mm/shmem_luo.c
> @@ -28,6 +28,24 @@
>   * the file are preserved. All others are reset to default. The preserved
>   * properties are described below.
>   *
> + * A tmpfs file can be preserved even if it is linked, but its path is not
> + * preserved. Userspace chooses where to put the file when retrieving it, as
> + * described in "Retrieving Tmpfs Files" below.
> + *
> + * Preserving a file requires it to be opened for reading, since the retrieved
> + * file can be read. It also requires permission to write to the file, since
> + * preserving it affects all of its users, as described below. But the file
> + * doesn't need to be opened for writing. For example, a binary that is being
> + * executed can be preserved through a read-only file descriptor. The owner of

Why are you talking about preserving binaries being executed? Seems
oddly specific. I didn't know that was a use case we cared about.

> + * a file whose size can't change anyway, because it is immutable or on a
> + * read-only superblock, may also preserve it. The file can be preserved
> + * through a read-only mount. Append-only files can't be preserved.
> + *
> + * While a file is preserved, its size can't change and no holes can be punched
> + * into it. Truncating the file, ``fallocate()`` and writes past the end of the
> + * file fail with ``-EPERM``. This applies to all users of the file, including
> + * users that open it by its path.
> + *
>   * .. note::
>   *    The LUO API is not stabilized yet, so the preserved properties of a memfd
>   *    or tmpfs file are also not stable and are subject to backwards
> @@ -298,6 +316,45 @@ static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
>  	vfree(folios_ser);
>  }
>  
> +/*
> + * Check whether the caller may preserve @file. The retrieved file can be read,
> + * so require @file to be opened for reading, like FS_IOC_ENABLE_VERITY does.
> + *
> + * Preserving the file freezes its size until it is unpreserved, for all users
> + * of the file, so require permission to write to the file. Like
> + * FS_IOC_ENABLE_VERITY, don't require a file opened for writing, so that e.g.
> + * a binary that is being executed can be preserved. Also don't require a
> + * writable mount, since preserving the file doesn't write to the filesystem.
> + * If the size of the file can't change anyway, because it is on a read-only
> + * superblock or immutable, its owner may also preserve it. The size could only
> + * change again after the file is made writable, which is up to the owner or
> + * root. Reject append-only files: Their writers can only append to them, and
> + * freezing the size would stop all appends.
> + *
> + * Preserving the file also fills its holes, but that doesn't need any more
> + * permission: Anyone who can read the file can fill its holes by faulting
> + * them in through a read-only mapping.

Please rework this whole block, it's unreadable.

> + */
> +static int shmem_luo_may_preserve(struct file *file)
> +{
> +	struct mnt_idmap *idmap = file_mnt_idmap(file);
> +	struct inode *inode = file_inode(file);
> +	int err;
> +
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> +	if (IS_APPEND(inode))
> +		return -EPERM;
> +
> +	err = inode_permission(idmap, inode, MAY_WRITE);
> +	if (err && (sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
> +	    inode_owner_or_capable(idmap, inode))

Nit: can you move these conditions up, and directly return 0 there? Much
more readable.

> +		return 0;
> +
> +	return err;
> +}
> +
>  static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
>  {
>  	struct inode *inode = file_inode(args->file);
> @@ -307,6 +364,11 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
>  	int err = 0, seals;
>  
>  	inode_lock(inode);
> +
> +	err = shmem_luo_may_preserve(args->file);
> +	if (err)
> +		goto err_unlock_inode;
> +
>  	shmem_freeze(inode, true);
>  
>  	/* Allocate the main serialization structure in preserved memory */
> @@ -362,6 +424,7 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
>  	kho_unpreserve_free(ser);
>  err_unlock:
>  	shmem_freeze(inode, false);
> +err_unlock_inode:
>  	inode_unlock(inode);
>  	return err;
>  }
> @@ -710,9 +773,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
>  				   struct file *file)
>  {
> -	struct inode *inode = file_inode(file);
> -
> -	return shmem_file(file) && !inode->i_nlink;
> +	return shmem_file(file);
>  }
>  
>  static unsigned long shmem_luo_get_id(struct file *file)

-- 
Regards,
Pratyush Yadav
