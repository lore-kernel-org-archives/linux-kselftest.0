Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51033396585;
	Wed, 25 Mar 2026 23:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774480446; cv=none; b=AsxudanGHVumgImSPKD3MDF+V+VyyGt640kOK01By8yqkaLS8mg2CibP365hNuzMMXjqsqHPNrTvH2IWvsXL9iJA1TA+ZJtgBFmu0frkK+lrtxMCIhGhTr457QzSAX3L4t269/DVW4pIpNlQmeYo4JnwB72tO5y4Dd8oTDQ+8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774480446; c=relaxed/simple;
	bh=haZVXxeBGIxeTbMGR2l+K3ghTX1dn/WL8wdUhji0HaA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Stmf1zhhm2rXUa95V1gjtqpgzjNE73jfPHM77mxiVzKj78RXgi6TRq/+E1EHb5YFjO6P01BWTRYYCote2GluAATUoW3tKrbBPNk5KVcdTDTmF16ACS6Os6/T9+2UA/zbXRhehnEsO4Wo9lvtWlyGxEjs3dmoS/InaYvEu8gtXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DzPlWLZ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DzPlWLZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EECCC4CEF7;
	Wed, 25 Mar 2026 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774480445;
	bh=haZVXxeBGIxeTbMGR2l+K3ghTX1dn/WL8wdUhji0HaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DzPlWLZ1jCtwp23rJXoQing7SVhZ2BAEcteSdO5u4bi/w0SRokpfrVIW08GObOv/V
	 xJ6G3WOL84PORYN9lDn+Q8f7wJmOAwP+udoI5mryoNhLqR5oBTUtFqY+PqWOcMHKhq
	 gbwKcCZqcJ6qaEgzuFwOhCqvCTBPEQ/c50zX9Yag=
Date: Wed, 25 Mar 2026 16:14:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, dmatlack@google.com,
 pratyush@kernel.org, skhawaja@google.com
Subject: Re: [PATCH v3 0/2] liveupdate: prevent double preservation
Message-Id: <20260325161405.0840dea1549b13c5a1653462@linux-foundation.org>
In-Reply-To: <20260325182026.467307-1-pasha.tatashin@soleen.com>
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Mar 2026 18:20:24 +0000 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> Currently, LUO does not prevent the same file from being preserved twice
> across different active sessions.
> 
> Because LUO preserves files of absolutely different types: memfd, and
> upcoming vfiofd [1], iommufd [2], guestmefd (and possible kvmfd/cpufd).
> There is no common private data or guarantee on how to prevent that the
> same file is not preserved twice beside using inode or some slower and
> expensive method like hashtables.
> 

I updated mm.git's mm-new branch to this version.

> Changelog:
> v3:
>  - Renamed luo_preserved_files_xa to luo_preserved_files (Mike)
>  - Added xa inserts during restoration, so a file that is not yet finished is
>    not preserved at the same time. (Sashiko)

Below is how v3 altered mm.git.

It appears that some significant changes are in the works.  Please lmk
if there's actually value in keeping v3 under test, or should I just
drop it?



 kernel/liveupdate/luo_file.c |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--- a/kernel/liveupdate/luo_file.c~b
+++ a/kernel/liveupdate/luo_file.c
@@ -117,7 +117,7 @@ static DECLARE_RWSEM(luo_file_handler_lo
 static LIST_HEAD(luo_file_handler_list);
 
 /* Keep track of files being preserved by LUO */
-static DEFINE_XARRAY(luo_preserved_files_xa);
+static DEFINE_XARRAY(luo_preserved_files);
 
 /* 2 4K pages, give space for 128 files per file_set */
 #define LUO_FILE_PGCNT		2ul
@@ -282,7 +282,7 @@ int luo_preserve_file(struct luo_file_se
 	if (err)
 		goto  err_fput;
 
-	err = xa_insert(&luo_preserved_files_xa, (unsigned long)file,
+	err = xa_insert(&luo_preserved_files, (unsigned long)file,
 			file, GFP_KERNEL);
 	if (err)
 		goto err_free_files_mem;
@@ -334,7 +334,7 @@ err_kfree:
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
 err_erase_xa:
-	xa_erase(&luo_preserved_files_xa, (unsigned long)file);
+	xa_erase(&luo_preserved_files, (unsigned long)file);
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -378,7 +378,7 @@ void luo_file_unpreserve_files(struct lu
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
-		xa_erase(&luo_preserved_files_xa, (unsigned long)luo_file->file);
+		xa_erase(&luo_preserved_files, (unsigned long)luo_file->file);
 		list_del(&luo_file->list);
 		file_set->count--;
 
@@ -622,6 +622,10 @@ int luo_retrieve_file(struct luo_file_se
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
+
+	WARN_ON(xa_insert(&luo_preserved_files, (unsigned long)luo_file->file,
+			  luo_file->file, GFP_KERNEL));
+
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
@@ -717,8 +721,11 @@ int luo_file_finish(struct luo_file_set
 
 		luo_file_finish_one(file_set, luo_file);
 
-		if (luo_file->file)
+		if (luo_file->file) {
+			xa_erase(&luo_preserved_files,
+				 (unsigned long)luo_file->file);
 			fput(luo_file->file);
+		}
 		list_del(&luo_file->list);
 		file_set->count--;
 		mutex_destroy(&luo_file->mutex);
_

