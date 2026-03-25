Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504B3E022C;
	Wed, 25 Mar 2026 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452722; cv=none; b=oit4WJMiMfmApFf5BlChCMkFT8IYP9N9bp0jzINxYLDKuEirdOwHJ6fw4hYkiLECPOEwmZjcOTykH3yiqMD6zcNSR27G9EQ+iEFLPV7w8q+pPihYakfwcHh3HKKYRCZNgxkNelV2AZg7F6QcoxQrQtuwPt6ZV/F68Db3Jyuz8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452722; c=relaxed/simple;
	bh=zavK1MEnQ0juash2NLp1KSrYuJJR9QPka+RrrXclKds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrH/B57dOnTf2VWesZ1S3yLjFmpkLxp+7/nCb5MnyAHKb8nmkNRK4RdMaFEcB6nmotOp06i9YNowlBBOZI5wTC79VrymZh15FczBYhTfvwe6e8Y4MFlzsBJz6mPPdRBIIBhxlhO6u1nK/I/mIxUZ5UbiNcNzw3Ph/mFN1mpf3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsZWKOkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsZWKOkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400DEC4CEF7;
	Wed, 25 Mar 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774452722;
	bh=zavK1MEnQ0juash2NLp1KSrYuJJR9QPka+RrrXclKds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZsZWKOkJgJN6VqUXPGcISCukGP5honyevSk8AS/B+bWxtJFv7QZCDWQyCQsJHMc4U
	 2eV1QrnfKEu/+7oU3156EpQ6OMQPkpLOzJs4xJHucP4axS6QiqmaHSt8v5kF4U9G2P
	 EwWLmCyI1y1aIPv4tbkP2gMngzm1wnDi/wBedxOnDi7+shE+OFva9AcSYdHCzsCP+f
	 UNuF5os36XDfZ8hQ3pH1+oaQCoPFY99PEac9WklN6EJYe/CjHgMLgq6ir83VuRSYJy
	 xBFrAQtOrGFbqGhSPQTe3JALVvFMf98lgHfLzXqtRDTZwWKOwkQsbfdQtkbZ0rqyby
	 HnXPG4xNsJ88A==
Date: Wed, 25 Mar 2026 17:31:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	pratyush@kernel.org, skhawaja@google.com
Subject: Re: [PATCH v2 1/2] liveupdate: prevent double management of files
Message-ID: <acP_6wY_HVMyTLHk@kernel.org>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323203145.148057-2-pasha.tatashin@soleen.com>

On Mon, Mar 23, 2026 at 08:31:44PM +0000, Pasha Tatashin wrote:
> Currently, LUO does not prevent the same file from being managed twice
> across different active sessions.
> 
> Use a global xarray `luo_preserved_files_xa` to keep track of file

Do we really need _xa suffix?

> pointers being preserved by LUO. Update luo_preserve_file() to check and
> insert the file pointer into this xarray when it is preserved, and
> erase it in luo_file_unpreserve_files() when it is released.
> 
> This ensures that the same file (struct file) cannot be managed by
> multiple sessions. If another session attempts to preserve an already
> managed file, it will now fail with -EBUSY.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_file.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index a38ea4975824..5f48c3c8c561 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -110,11 +110,15 @@
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/xarray.h>
>  #include "luo_internal.h"
>  
>  static DECLARE_RWSEM(luo_file_handler_lock);
>  static LIST_HEAD(luo_file_handler_list);
>  
> +/* Keep track of files being preserved by LUO */
> +static DEFINE_XARRAY(luo_preserved_files_xa);
> +
>  /* 2 4K pages, give space for 128 files per file_set */
>  #define LUO_FILE_PGCNT		2ul
>  #define LUO_FILE_MAX							\
> @@ -249,6 +253,7 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>   * Context: Can be called from an ioctl handler during normal system operation.
>   * Return: 0 on success. Returns a negative errno on failure:
>   *         -EEXIST if the token is already used.
> + *         -EBUSY if the file descriptor is already preserved by another session.
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
>   *         -ENOENT if no compatible handler is found.
> @@ -277,6 +282,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	if (err)
>  		goto  err_fput;
>  
> +	err = xa_insert(&luo_preserved_files_xa, (unsigned long)file,
> +			file, GFP_KERNEL);
> +	if (err)
> +		goto err_free_files_mem;
> +
>  	err = -ENOENT;
>  	scoped_guard(rwsem_read, &luo_file_handler_lock) {
>  		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
> @@ -289,11 +299,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  
>  	/* err is still -ENOENT if no handler was found */
>  	if (err)
> -		goto err_free_files_mem;
> +		goto err_erase_xa;
>  
>  	err = luo_flb_file_preserve(fh);
>  	if (err)
> -		goto err_free_files_mem;
> +		goto err_erase_xa;
>  
>  	luo_file = kzalloc_obj(*luo_file);
>  	if (!luo_file) {
> @@ -323,6 +333,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	kfree(luo_file);
>  err_flb_unpreserve:
>  	luo_flb_file_unpreserve(fh);
> +err_erase_xa:
> +	xa_erase(&luo_preserved_files_xa, (unsigned long)file);
>  err_free_files_mem:
>  	luo_free_files_mem(file_set);
>  err_fput:
> @@ -366,6 +378,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
>  		luo_file->fh->ops->unpreserve(&args);
>  		luo_flb_file_unpreserve(luo_file->fh);
>  
> +		xa_erase(&luo_preserved_files_xa, (unsigned long)luo_file->file);
>  		list_del(&luo_file->list);
>  		file_set->count--;
>  
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
