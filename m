Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961861D798E;
	Mon,  1 Jun 2026 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322641; cv=none; b=t7bmvALiR5zW2yZouUlVfMPtK7ThzYOMqZSl8OKTYKMYZg6df+rxfViW42jAyP+DjZARFKCwNedy1sKm/DXUaABooefHCO84R/WdIL7GGhsAKKRZj60UZ7fN/Jm0xl8MOeXceA1azzfK5uXo1pd+81Lyrq7PacMnKnxykaQCAZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322641; c=relaxed/simple;
	bh=d2x6uiRke/p2dPJM5PvWWoNFFutQPzNOWcDlYqgFXrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ccN6c4LqWeImAMlO92v4zxqQIAL3+rr5lz0mHQUvkUP5QyqarHAjJdpGEDoX5hIqT+ZqdQ8bh3wozlUnAkjloTTOm6nvvIkHDErK7clTKBah4EN7nE47bIuLvUglb0POSeF5SMd/PDvFG1vTYk07bRG+wMfqOT7zWXR9RPj+d/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7v5ZKnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7v5ZKnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93471F00893;
	Mon,  1 Jun 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780322640;
	bh=93c3I3ubLRTv9EP1rAjvzUBB3rvXuHxApHqCDxTcN3c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I7v5ZKnV/Qbs3YwWgfExlqOMIyS8FMffwjzB1hpdLnTlaMxN/pAY6yQGT1Qeg3Swj
	 l1JqSAzZi2cEjyAfvIubam+9HECaY7nhbTtT7aUa9gN5Fz2Bb8RhWpJGgt3iRrJ+KF
	 zhFWGxW7/4VmYSiUrMoM6Aka9E1Wra1rL79BXxSAV7Cvy9m837RfLymf7HpdOngHKg
	 Ot6iMsSm5j+qSMLfo1vsB2ff6CGjQY7Eei5vYWNrCv2QDvVKxLicp0AqToTDXwbeco
	 0loSOjiW7KETp8OetSdLGG2P7a9c5iTY3cv/9OwXlqPyin8cp3S2XAXWvZkZMtuWmV
	 IYAtVtIohPqEg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 09/13] liveupdate: Remove limit on the number of
 sessions
In-Reply-To: <20260530221938.115978-10-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:34 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-10-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 16:03:56 +0200
Message-ID: <2vxzfr36fjcj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> Currently, the number of LUO sessions is limited by a fixed number of
> pre-allocated pages for serialization (16 pages, allowing for ~819
> sessions).
>
> This limitation is problematic if LUO is used to support things such as
> systemd file descriptor store, and would be used not just as VM memory
> but to save other states on the machine.
>
> Remove this limit by transitioning to a linked-block approach for
> session metadata serialization. Instead of a single contiguous block,
> session metadata is now stored in a chain of 16-page blocks. Each block
> starts with a header containing the physical address of the next block
> and the number of session entries in the current block.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
[...]
> @@ -63,13 +58,15 @@
>  #define _LINUX_KHO_ABI_LUO_H
>  
>  #include <linux/align.h>
> +#include <linux/kho/abi/block.h>
>  #include <uapi/linux/liveupdate.h>
>  
>  /*
>   * The LUO state is registered under this KHO entry name.
>   */
>  #define LUO_KHO_ENTRY_NAME	"LUO"
> -#define LUO_ABI_COMPATIBLE	"luo-v3"
> +#define LUO_COMPAT_BASE		"luo-v3"
> +#define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE

That's clever :-)

[...]
>  int luo_session_serialize(void)
>  {
>  	struct luo_session_header *sh = &luo_session_global.outgoing;
>  	struct luo_session *session;
> -	int i = 0;
> +	struct kho_block_it it;
>  	int err;
>  
>  	down_write(&luo_session_serialize_rwsem);
>  	down_write(&sh->rwsem);
>  	*sh->sessions_pa = 0;
>  
> +	kho_block_it_init(&it, &sh->block_set);
> +
>  	list_for_each_entry(session, &sh->list, list) {
> -		err = luo_session_freeze_one(session, &sh->ser[i]);
> -		if (err)
> +		struct luo_session_ser *ser = kho_block_it_next(&it);
> +
> +		if (!ser) {
> +			err = -ENOSPC;
>  			goto err_undo;
> +		}
>  
> -		strscpy(sh->ser[i].name, session->name,
> -			sizeof(sh->ser[i].name));
> -		i++;
> -	}
> +		err = luo_session_freeze_one(session, ser);
> +		if (err) {
> +			kho_block_it_prev(&it);
> +			goto err_undo;
> +		}
>  
> -	if (sh->header_ser && sh->count > 0) {
> -		sh->header_ser->count = sh->count;
> -		*sh->sessions_pa = virt_to_phys(sh->header_ser);
> +		strscpy(ser->name, session->name, sizeof(ser->name));
>  	}
> +
> +	kho_block_it_finalize(&it);
> +
> +	if (sh->sessions_pa && sh->count > 0)

Nit: Why check for sh->sessions_pa? It can never be NULL.

Other than this, 

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

> +		*sh->sessions_pa = sh->block_set.head_pa;
>  	up_write(&sh->rwsem);
>  
>  	return 0;
>  
>  err_undo:
>  	list_for_each_entry_continue_reverse(session, &sh->list, list) {
> -		i--;
> -		luo_session_unfreeze_one(session, &sh->ser[i]);
> -		memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
> +		struct luo_session_ser *ser = kho_block_it_prev(&it);
> +
> +		luo_session_unfreeze_one(session, ser);
> +		memset(ser->name, 0, sizeof(ser->name));
>  	}
>  	up_write(&sh->rwsem);
>  	up_write(&luo_session_serialize_rwsem);

-- 
Regards,
Pratyush Yadav
