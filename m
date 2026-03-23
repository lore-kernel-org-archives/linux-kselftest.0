Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E5C2BD00C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298629; cv=none; b=P7gSoYjJtRFhFmwx1ADTU4h/pjddVovKwv6TbAffElNl6WED2mM3EYmkeAGw02GQmVdUpNQbpy9B81qVC0LZ+P4duI8T1f+3Bmcs4tO4jOmzVeN4bBCvzxFkQd8LlY2736X5ZapJZU/6sO2bu5LnShQJXdLdn1qYKa8MRqSPk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298629; c=relaxed/simple;
	bh=yAD2ucoLlY3NeatOfUyKvy6VOnV5067pVR+1CqISHzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH++8BiAh2w8mMtsBl2Dnb+Krnh0JaMAnyGrqgG4rOOjzOMRqBq5oIJgMDzQWY8C63m3QNTKP4WswhvKXU/9hL2oDGZAkMV7gft1JTH5abNHzBnI6YwBcmghKhwDVMofsh3vNndSZ9F14/xQbtnNS0MzQOcmOoOTbqzLE2IDa4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FcWaCfRA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FcWaCfRA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b052ec7176so7005ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774298628; x=1774903428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jv+paj/zuCW/4wO6DwQaFbEbko5bvaSd+BgnRg2Mnpk=;
        b=FcWaCfRABhevnlEeiblIA/nvVZdWwSSULv11Hw8ZNr7Kang8XzjCwMDrMRxOJ5xvQ3
         v+URfnLqpRyt0YSuZoMgpLzCQdHl0O8UTW4YkyeKy5C5UIVQgkQq4YlhIQgGBVCiufIW
         k8qfishvIze3Ct/89grLCxyvBPi2Coc+qN34eXJJ23ZT/uKk7UlwzlJ3v2fZw3UFZkUg
         5Drp1i8VuyHfNwwJTHI7ZrQoRtWhePoiHdBOCz1Im1gIZWDAwOX9wjJA0RlJ+iPtH6kp
         XWnPlYr/TuaVBfhOhOojgK9uU1TGc4q4Nl9WXjQogW2LFvf3JxdaAHSsePYhb3oTUWzv
         UUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298628; x=1774903428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv+paj/zuCW/4wO6DwQaFbEbko5bvaSd+BgnRg2Mnpk=;
        b=iHkrb3EmDndESJJqjW2I02WcVfWXJ5zvQbf3vIOvzGyk80wkmpmdLDMH0N8BcVbZxB
         zwRcaOb8ElgYgzN0+EHaRVl+Fg1fpfbgkZzknQMertbMZO6MZZRAERSOhQSxpLyKduMp
         6ugGdxpQ0TW4450ODzipxrtSTn/AuTlP/uQb8zWPIBUjJAQxx3fD4JANW9uqeVkzqoJi
         TuNYhekc29CWL5pjzIjcA/dtF2O+blstuBUbRSmllNrm4JShNMy7ZUKOtZNiq/wZfZWp
         SKCQ5Eg1akG5rTb2Q264ZUYP0GCcJRyEvwoi5SqdKJpR+7Fp133hVIqtcyQvAjV1Z2DG
         IrzA==
X-Gm-Message-State: AOJu0YxzZlWvrhCAgc6m3ArjaWEbYpbotV0EDQ7ge8zi2MvrUv6qjdr5
	/VnhcBdOMKxgexBKIOJ3j4zHvpVIwWLSwlT6B/L2Ed7l5nDtusMBsfqFcCa7YGoF+w==
X-Gm-Gg: ATEYQzzVZxiX6oXLJFwT3RaAt1y2h1IUAGoC0DW3ZlQJm2sO0ZHeI6+4fz9naDa7ziN
	u3IkxBK7X/jn6zA2RO4ojVXTna24Noqc4jHwQm2HnjR7KJjcHNUlYvKX+pqFNX573Vq6vd/sdCz
	J7z7HrZL8Vd5vYrSdoLjd1HbJ4DLiGOak8gYv389Dg2yvQp2ojkX6ZyYciMoATo4VIbFo7ehmaF
	h24XmqweaVHP8XIVOmN/r61rb/n6NeRm1puEfYxsOVpStceSSiiso8NGFxhraJcNj9CRX31midy
	1Z5amA25bplNMjEpQ3W7ygi9duaUTmfEmwy4akqBpGuZ951yWhc+b3cUU3KT3Osp/+ioUuu0Muu
	p2T1t3qv7T1XAYbusMUKvkRyWTUk6/Qpu8fxCnowUKPj9O4Q3LTKgtuLYvc0C1uyL0PnIQ/1vZR
	3NDGREX5S7mL2h7ZlwRTjmBxs3nMmVICAOlwt2yk/sKt9w4OE30lQVP2/MLL/H9w==
X-Received: by 2002:a17:903:22d1:b0:2ae:c566:bd99 with SMTP id d9443c01a7336-2b0a54f45e4mr765685ad.22.1774298627093;
        Mon, 23 Mar 2026 13:43:47 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04108a1dsm10366461b3a.54.2026.03.23.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:43:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:43:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, pratyush@kernel.org
Subject: Re: [PATCH v2 1/2] liveupdate: prevent double management of files
Message-ID: <acGl9KqueRpnbpQY@google.com>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260323203145.148057-2-pasha.tatashin@soleen.com>

On Mon, Mar 23, 2026 at 08:31:44PM +0000, Pasha Tatashin wrote:
>Currently, LUO does not prevent the same file from being managed twice
>across different active sessions.
>
>Use a global xarray `luo_preserved_files_xa` to keep track of file
>pointers being preserved by LUO. Update luo_preserve_file() to check and
>insert the file pointer into this xarray when it is preserved, and
>erase it in luo_file_unpreserve_files() when it is released.
>
>This ensures that the same file (struct file) cannot be managed by
>multiple sessions. If another session attempts to preserve an already
>managed file, it will now fail with -EBUSY.
>
>Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>---
> kernel/liveupdate/luo_file.c | 17 +++++++++++++++--
> 1 file changed, 15 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>index a38ea4975824..5f48c3c8c561 100644
>--- a/kernel/liveupdate/luo_file.c
>+++ b/kernel/liveupdate/luo_file.c
>@@ -110,11 +110,15 @@
> #include <linux/sizes.h>
> #include <linux/slab.h>
> #include <linux/string.h>
>+#include <linux/xarray.h>
> #include "luo_internal.h"
>
> static DECLARE_RWSEM(luo_file_handler_lock);
> static LIST_HEAD(luo_file_handler_list);
>
>+/* Keep track of files being preserved by LUO */
>+static DEFINE_XARRAY(luo_preserved_files_xa);
>+
> /* 2 4K pages, give space for 128 files per file_set */
> #define LUO_FILE_PGCNT		2ul
> #define LUO_FILE_MAX							\
>@@ -249,6 +253,7 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>  * Context: Can be called from an ioctl handler during normal system operation.
>  * Return: 0 on success. Returns a negative errno on failure:
>  *         -EEXIST if the token is already used.
>+ *         -EBUSY if the file descriptor is already preserved by another session.
>  *         -EBADF if the file descriptor is invalid.
>  *         -ENOSPC if the file_set is full.
>  *         -ENOENT if no compatible handler is found.
>@@ -277,6 +282,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
> 	if (err)
> 		goto  err_fput;
>
>+	err = xa_insert(&luo_preserved_files_xa, (unsigned long)file,
>+			file, GFP_KERNEL);
>+	if (err)
>+		goto err_free_files_mem;
>+
> 	err = -ENOENT;
> 	scoped_guard(rwsem_read, &luo_file_handler_lock) {
> 		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
>@@ -289,11 +299,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>
> 	/* err is still -ENOENT if no handler was found */
> 	if (err)
>-		goto err_free_files_mem;
>+		goto err_erase_xa;
>
> 	err = luo_flb_file_preserve(fh);
> 	if (err)
>-		goto err_free_files_mem;
>+		goto err_erase_xa;
>
> 	luo_file = kzalloc_obj(*luo_file);
> 	if (!luo_file) {
>@@ -323,6 +333,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
> 	kfree(luo_file);
> err_flb_unpreserve:
> 	luo_flb_file_unpreserve(fh);
>+err_erase_xa:
>+	xa_erase(&luo_preserved_files_xa, (unsigned long)file);
> err_free_files_mem:
> 	luo_free_files_mem(file_set);
> err_fput:
>@@ -366,6 +378,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
> 		luo_file->fh->ops->unpreserve(&args);
> 		luo_flb_file_unpreserve(luo_file->fh);
>
>+		xa_erase(&luo_preserved_files_xa, (unsigned long)luo_file->file);
> 		list_del(&luo_file->list);
> 		file_set->count--;
>
>-- 
>2.43.0
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
