Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD81A683E;
	Mon,  1 Jun 2026 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323390; cv=none; b=Ag8ivuQBNgWvhSjhDQwShYOz7xNnWhq73P908vJTrGII0vauPEmTvBNYfq5FtvvqmX7Gzf3Kxtb8H3jYX3r3fu0lDu1cZCWbzLD8rW//Ll9eaeUB29qrMThXy0+JDfM3RiLIVbgSrmiigqpt1GPXay+YcMkswRFf4+9FtWRQ2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323390; c=relaxed/simple;
	bh=o/6qERB9za9DV1IL5m4fyg8HgTGIRQ2ksKFMbDq/ugM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JX33K9YDFuI5DEVPzofgSCK75H4z+DeASHa8G2NREhUrDFa1qRxAR3uZupNT0xPifQ2kXLcUVXyvRHSdqlwDlNptBoztCqSb2lWw8rwv2h9kCRQrBH32i6i/5fNzxUfdCNZNPxi1RWiQaxYrzhIg1lssRLEUNgqSIiCLHMshYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyV1ioMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyV1ioMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57311F00893;
	Mon,  1 Jun 2026 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780323389;
	bh=9VT/rV29GtgCByoYfuOFThPGA055lDO6NINlnaI0eUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CyV1ioMeC0MrkZO3l5+K8ePNL09lvyi4xXcudGdAXLNG9IPjHzE+0g7eMJPAm6TQX
	 pB4yBliMwXmEYVa/q/5S76gybE+X5As99r8Sb8MB2B5754y6xz2GEwTyCgKq+xWnlr
	 Hz0f5N7FkH1AnxnLOdgG4rnYPHIjHSaicTSORO7MMJUfsezlOUeP0WSvY/El2cvDTN
	 7WXQpq7XLNwSU4egIBcF6VcBssJyPCsVEAKRfHClh073Snmf+UPzTKiXoR56gHJlF0
	 aDqNLY0f/vsQfJ4hXxX9BePyRwvH3vysXoo5/h9fQHwdXDbrMTNNVX+T54Pg5AcyNu
	 rZ9ohj2uqhqFQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 10/13] liveupdate: Remove limit on the number of
 files per session
In-Reply-To: <20260530221938.115978-11-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:35 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-11-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 16:16:25 +0200
Message-ID: <2vxzbjdufirq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> To remove the fixed limit on the number of preserved files per session,
> transition the file metadata serialization from a single contiguous
> memory block to a chain of linked blocks.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/kho/abi/luo.h      |  13 +--
>  kernel/liveupdate/luo_file.c     | 144 +++++++++++++++----------------
>  kernel/liveupdate/luo_internal.h |   6 +-
>  3 files changed, 80 insertions(+), 83 deletions(-)
>
> diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
> index 79758d92ed5f..16df550ef143 100644
> --- a/include/linux/kho/abi/luo.h
> +++ b/include/linux/kho/abi/luo.h
> @@ -35,8 +35,8 @@
>   *
>   *   - struct luo_session_ser:
>   *     Metadata for a single session, including its name and a physical pointer
> - *     to another preserved memory block containing an array of
> - *     `struct luo_file_ser` for all files in that session.
> + *     to the first `struct kho_block_header_ser` for all files in that session.
> + *     Multiple blocks are linked via the `next` field in the header.
>   *
>   *   - struct luo_file_ser:
>   *     Metadata for a single preserved file. Contains the `compatible` string to
> @@ -65,7 +65,7 @@
>   * The LUO state is registered under this KHO entry name.
>   */
>  #define LUO_KHO_ENTRY_NAME	"LUO"
> -#define LUO_COMPAT_BASE		"luo-v3"
> +#define LUO_COMPAT_BASE		"luo-v4"
>  #define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE
>  #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
>  
> @@ -103,9 +103,10 @@ struct luo_file_ser {
>  
>  /**
>   * struct luo_file_set_ser - Represents the serialized metadata for file set
> - * @files:   The physical address of a contiguous memory block that holds
> - *           the serialized state of files (array of luo_file_ser) in this file
> - *           set.
> + * @files:   The physical address of the first `struct kho_block_header_ser`.
> + *           This structure is the header for a block of memory containing
> + *           an array of `struct luo_file_ser` entries. Multiple blocks are
> + *           linked via the `next` field in the header.
>   * @count:   The total number of files that were part of this session during
>   *           serialization. Used for iteration and validation during
>   *           restoration.
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 9eec07a9e9fc..a445b1950ca7 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -118,11 +118,6 @@ static LIST_HEAD(luo_file_handler_list);
>  /* Keep track of files being preserved by LUO */
>  static DEFINE_XARRAY(luo_preserved_files);
>  
> -/* 2 4K pages, give space for 128 files per file_set */
> -#define LUO_FILE_PGCNT		2ul
> -#define LUO_FILE_MAX							\
> -	((LUO_FILE_PGCNT << PAGE_SHIFT) / sizeof(struct luo_file_ser))
> -
>  /**
>   * struct luo_file - Represents a single preserved file instance.
>   * @fh:            Pointer to the &struct liveupdate_file_handler that manages
> @@ -174,39 +169,6 @@ struct luo_file {
>  	u64 token;
>  };
>  
> -static int luo_alloc_files_mem(struct luo_file_set *file_set)
> -{
> -	size_t size;
> -	void *mem;
> -
> -	if (file_set->files)
> -		return 0;
> -
> -	WARN_ON_ONCE(file_set->count);
> -
> -	size = LUO_FILE_PGCNT << PAGE_SHIFT;
> -	mem = kho_alloc_preserve(size);
> -	if (IS_ERR(mem))
> -		return PTR_ERR(mem);
> -
> -	file_set->files = mem;
> -
> -	return 0;
> -}
> -
> -static void luo_free_files_mem(struct luo_file_set *file_set)
> -{
> -	/* If file_set has files, no need to free preservation memory */
> -	if (file_set->count)
> -		return;
> -
> -	if (!file_set->files)
> -		return;
> -
> -	kho_unpreserve_free(file_set->files);
> -	file_set->files = NULL;
> -}
> -
>  static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
>  				struct file *file)
>  {
> @@ -276,16 +238,15 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	if (luo_token_is_used(file_set, token))
>  		return -EEXIST;
>  
> -	if (file_set->count == LUO_FILE_MAX)
> -		return -ENOSPC;
> +	err = kho_block_grow(&file_set->block_set, file_set->count);
> +	if (err)
> +		return err;
>  
>  	file = fget(fd);
> -	if (!file)
> -		return -EBADF;
> -
> -	err = luo_alloc_files_mem(file_set);
> -	if (err)
> -		goto  err_fput;
> +	if (!file) {
> +		err = -EBADF;
> +		goto err_shrink;
> +	}
>  
>  	err = -ENOENT;
>  	down_read(&luo_register_rwlock);
> @@ -300,7 +261,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  
>  	/* err is still -ENOENT if no handler was found */
>  	if (err)
> -		goto err_free_files_mem;
> +		goto err_fput;
>  
>  	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
>  			file, GFP_KERNEL);
> @@ -343,10 +304,10 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
>  err_module_put:
>  	module_put(fh->ops->owner);
> -err_free_files_mem:
> -	luo_free_files_mem(file_set);
>  err_fput:
>  	fput(file);
> +err_shrink:
> +	kho_block_shrink(&file_set->block_set, file_set->count);
>  
>  	return err;
>  }
> @@ -392,13 +353,14 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
>  
>  		list_del(&luo_file->list);
>  		file_set->count--;
> +		kho_block_shrink(&file_set->block_set, file_set->count);
>  
>  		fput(luo_file->file);
>  		mutex_destroy(&luo_file->mutex);
>  		kfree(luo_file);
>  	}
>  
> -	luo_free_files_mem(file_set);
> +	kho_block_destroy(&file_set->block_set);
>  }
>  
>  static int luo_file_freeze_one(struct luo_file_set *file_set,
> @@ -454,7 +416,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
>  		luo_file_unfreeze_one(file_set, luo_file);
>  	}
>  
> -	memset(file_set->files, 0, LUO_FILE_PGCNT << PAGE_SHIFT);
> +	kho_block_set_clear(&file_set->block_set);
>  }
>  
>  /**
> @@ -493,19 +455,23 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
>  int luo_file_freeze(struct luo_file_set *file_set,
>  		    struct luo_file_set_ser *file_set_ser)
>  {
> -	struct luo_file_ser *file_ser = file_set->files;
>  	struct luo_file *luo_file;
> +	struct kho_block_it it;
>  	int err;
> -	int i;
>  
>  	if (!file_set->count)
>  		return 0;
>  
> -	if (WARN_ON(!file_ser))
> -		return -EINVAL;
> +	kho_block_it_init(&it, &file_set->block_set);
>  
> -	i = 0;
>  	list_for_each_entry(luo_file, &file_set->files_list, list) {
> +		struct luo_file_ser *file_ser = kho_block_it_next(&it);
> +
> +		if (!file_ser) {
> +			err = -ENOSPC;
> +			goto err_unfreeze;
> +		}

This should not fail normally, right? Since we pre-allocate the memory.
Perhaps add a comment saying that?

> +
>  		err = luo_file_freeze_one(file_set, luo_file);
>  		if (err < 0) {
>  			pr_warn("Freeze failed for token[%#0llx] handler[%s] err[%pe]\n",
> @@ -514,16 +480,21 @@ int luo_file_freeze(struct luo_file_set *file_set,
>  			goto err_unfreeze;
>  		}
>  
> -		strscpy(file_ser[i].compatible, luo_file->fh->compatible,
> -			sizeof(file_ser[i].compatible));
> -		file_ser[i].data = luo_file->serialized_data;
> -		file_ser[i].token = luo_file->token;
> -		i++;
> +		strscpy(file_ser->compatible, luo_file->fh->compatible,
> +			sizeof(file_ser->compatible));
> +		file_ser->data = luo_file->serialized_data;
> +		file_ser->token = luo_file->token;
>  	}
> +	kho_block_it_finalize(&it);
>  
>  	file_set_ser->count = file_set->count;
> -	if (file_set->files)
> -		file_set_ser->files = virt_to_phys(file_set->files);
> +	if (!list_empty(&file_set->block_set.blocks)) {
> +		struct kho_block *block;
> +
> +		block = list_first_entry(&file_set->block_set.blocks,
> +					 struct kho_block, list);
> +		file_set_ser->files = virt_to_phys(block->ser);
> +	}

Please, add an API in KHO block to return the header physical address.
Poking into the internals of the data structure like this is not a good
idea.

I missed that patch 9 also does this. So please use that there too.

>  
>  	return 0;
>  
> @@ -741,14 +712,12 @@ int luo_file_finish(struct luo_file_set *file_set)
>  		module_put(luo_file->fh->ops->owner);
>  		list_del(&luo_file->list);
>  		file_set->count--;
> +		kho_block_shrink(&file_set->block_set, file_set->count);
>  		mutex_destroy(&luo_file->mutex);
>  		kfree(luo_file);
>  	}
>  
> -	if (file_set->files) {
> -		kho_restore_free(file_set->files);
> -		file_set->files = NULL;
> -	}
> +	kho_block_destroy(&file_set->block_set);
>  
>  	return 0;
>  }
> @@ -822,16 +791,18 @@ int luo_file_deserialize(struct luo_file_set *file_set,
>  			 struct luo_file_set_ser *file_set_ser)
>  {
>  	struct luo_file_ser *file_ser;
> +	struct kho_block_it it;
>  	int err;
> -	u64 i;
>  
>  	if (!file_set_ser->files) {
>  		WARN_ON(file_set_ser->count);
>  		return 0;
>  	}
>  
> -	file_set->count = file_set_ser->count;
> -	file_set->files = phys_to_virt(file_set_ser->files);
> +	file_set->count = 0;
> +	err = kho_block_restore(&file_set->block_set, file_set_ser->files);
> +	if (err)
> +		return err;
>  
>  	/*
>  	 * Note on error handling:
> @@ -848,25 +819,50 @@ int luo_file_deserialize(struct luo_file_set *file_set,
>  	 * userspace to detect the failure and trigger a reboot, which will
>  	 * reliably reset devices and reclaim memory.
>  	 */
> -	file_ser = file_set->files;
> -	for (i = 0; i < file_set->count; i++) {
> -		err = luo_file_deserialize_one(file_set, &file_ser[i]);
> +	kho_block_it_init(&it, &file_set->block_set);
> +	while ((file_ser = kho_block_it_read(&it))) {
> +		err = luo_file_deserialize_one(file_set, file_ser);
>  		if (err)
> -			return err;
> +			goto err_destroy_blocks;
> +		file_set->count++;
> +	}
> +
> +	if (file_set->count != file_set_ser->count) {
> +		pr_warn("File count mismatch: expected %llu, found %llu\n",
> +			file_set_ser->count, file_set->count);
> +		err = -EINVAL;
> +		goto err_destroy_blocks;
>  	}
>  
>  	return 0;
> +
> +err_destroy_blocks:
> +	while (!list_empty(&file_set->files_list)) {
> +		struct luo_file *luo_file;
> +
> +		luo_file = list_first_entry(&file_set->files_list,
> +					    struct luo_file, list);
> +		list_del(&luo_file->list);
> +		module_put(luo_file->fh->ops->owner);
> +		mutex_destroy(&luo_file->mutex);
> +		kfree(luo_file);
> +	}
> +	file_set->count = 0;
> +	kho_block_destroy(&file_set->block_set);
> +	return err;
>  }
>  
>  void luo_file_set_init(struct luo_file_set *file_set)
>  {
>  	INIT_LIST_HEAD(&file_set->files_list);
> +	kho_block_set_init(&file_set->block_set, sizeof(struct luo_file_ser));
>  }
>  
>  void luo_file_set_destroy(struct luo_file_set *file_set)
>  {
>  	WARN_ON(file_set->count);
>  	WARN_ON(!list_empty(&file_set->files_list));
> +	WARN_ON(!list_empty(&file_set->block_set.blocks));

Here too.

>  }
>  
>  /**
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index ee18f9a11b91..64879ffe7378 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/liveupdate.h>
>  #include <linux/uaccess.h>
> +#include <linux/kho_block.h>
>  
>  struct luo_ucmd {
>  	void __user *ubuffer;
> @@ -44,14 +45,13 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
>   * struct luo_file_set - A set of files that belong to the same sessions.
>   * @files_list: An ordered list of files associated with this session, it is
>   *              ordered by preservation time.
> - * @files:      The physically contiguous memory block that holds the serialized
> - *              state of files.
> + * @block_set:  The set of serialization blocks.
>   * @count:      A counter tracking the number of files currently stored in the
>   *              @files_list for this session.
>   */
>  struct luo_file_set {
>  	struct list_head files_list;
> -	struct luo_file_ser *files;
> +	struct kho_block_set block_set;
>  	u64 count;
>  };

-- 
Regards,
Pratyush Yadav
