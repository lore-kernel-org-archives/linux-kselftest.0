Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173341;
	b=J3Q+IJLTvwIVxZvZ3hb1uitw5AO66hvdcWsLgzXLyUSCVFbNSJyS+17uhsTeZSDv+qyX
	 V2wMHjiiUXGEkzPan2p5QjjvPv61eDbYnA5fnaeqaNjBTNIy9x7MtOmJa8z7H38UqnPaE
	 emz8dpVO6mE2FmRnxoFXL/eIAlOjNCABvkyHj1pQ3SnJc/wpnEN1fI9ILiua36Zx7F4z1
	 yiHex1zozAy8cfP6iUoGTok59u0swIIWVFjMye+fth9LzKZX1p9cB3r5EErjY1pv5wQ8g
	 mQZSL0s9zBiVajwI1inA/9zsWSbJkW/WerLftIevkKcrAQ3gONXdduzMO7rfxm6WofQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173341;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=4q/HAzNWIc8z/Kxp9yRP6YEkL7lf8pSJ0VxSvJc2osU=;
	b=p2zl3k9V1fsAg51qNzAUFjXe5uONU/HMHTl0n+7aWNfW8++KGWyllQt8hfG/RRXM1B9j
	 abdtFOkeRY2WpbCgAfYEsLvVMWicXq/J8TCLhYcrjBw/svL+MpJE7DMf39upXTVFBXV5b
	 WF9xkJGE/1e4sJUMf3BKa47/RSocttw2fE4a3c5/Yo/UCZkLtZif1JKVRK0ndy3qzKZir
	 N+zM53RBTwP29wS+aeifDWpYRydBOcrs58jEChT8Efl1vyjuxJxxSz5mO47mPQhCwyh4K
	 ju37C3h3AUBt8NAEzkFWfulNj/Ae2vMlwPz3LQ+XWYrbLnb1USilm+QQ1aovQ7eadhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiQFT9Am;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEB606A320;
	Fri, 20 Nov 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiQFT9Am
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631FE1F000E6;
	Fri, 20 Nov 2026 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173340;
	bh=4q/HAzNWIc8z/Kxp9yRP6YEkL7lf8pSJ0VxSvJc2osU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eiQFT9AmZXE80k4vQiQVbH6zGKuabiTwvqQFRzxu32eu1FITxzhp6ynTVFOKGWIYc
	 kdt1ABR1nlY1lXBi21g6qB4xy50TYfMLG9JmYyI3xud/sDdL0BZw9ANPtDHZLwQryW
	 CCpH0Hhfd8DgR8jKwZGeQedWSfEuCyYEqOcljny15MzC/AhsZEKPbyCj8I7Xxh0e7S
	 zUj9rDDS3ujW4FY2JfUfbNk9Qm+e3G/+IWEJNSMyMrAiW+P3glbGmOPyJLrc9jvroF
	 7BxRY3IzC/wbNUIiDAHAn+Kfn/hojteAjPxdyBf1vKZNdYdwr9rAyqQJN8eZxA0XXo
	 BMVJFKbr5u18w==
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
Subject: Re: [PATCH v4 07/19] liveupdate: Add helpers to track the files
 that LUO manages
In-Reply-To: <20261111002358.1842967-8-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:45 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-8-dmatlack@google.com>
Date: Fri, 20 Nov 2026 11:15:33 +0000
Message-ID: <2vxzbj7j3ga2.fsf@kernel.org>
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

On Wed, Nov 11 2026, David Matlack wrote:

> Add luo_track_file() and luo_untrack_file(), which add a file to and
> remove it from luo_preserved_files, and use them instead of open-coding
> xa_insert() and xa_erase() with luo_get_id() for preserved and retrieved
> files.
>
> The next commit lets file handlers make LUO track the file they retrieve
> into, which adds more users. The helpers keep the key and the -EBUSY
> behavior in one place.
>
> No functional change intended.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
[...]
> @@ -395,8 +407,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
>  		luo_file->fh->ops->unpreserve(&args);
>  		luo_flb_file_unpreserve(luo_file->fh);
>  
> -		xa_erase(&luo_preserved_files,
> -			 luo_get_id(luo_file->fh, luo_file->file));
> +		luo_untrack_file(luo_file->fh, luo_file->file);
>  		module_put(luo_file->fh->ops->owner);
>  
>  		list_del(&luo_file->list);
> @@ -668,9 +679,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
>  		return err;
>  	}
>  
> -	err = xa_insert(&luo_preserved_files,
> -			luo_get_id(luo_file->fh, args.file), args.file,
> -			GFP_KERNEL);
> +	err = luo_track_file(luo_file->fh, args.file);
>  	if (err) {
>  		/* A retrieved file is new, so it can't be tracked already. */
>  		WARN_ON_ONCE(err == -EBUSY);
> @@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
>  		luo_file_finish_one(file_set, luo_file);
>  
>  		if (luo_file->file) {
> -			xa_erase(&luo_preserved_files,
> -				 luo_get_id(luo_file->fh, luo_file->file));
> +			luo_untrack_file(luo_file->fh, luo_file->file);

This looks dangerous.

Since the previous patch set luo_file->file when xa_insert() failed,
this will trigger in a failed retrieve. Except, the file was never
tracked to begin with.

While I don't see anything that actually breaks because of this today,
I think it is a bug in the making.

I think the below is a bit better. Although this change probably makes
more sense in the previous patch, since that introduced the problem.
This patch should just replace the xa_erase() with luo_untrack_file().

	if (luo_file->file)
		fput(luo_file->file);

	if (luo_file->retrieve_status > 0)
		luo_untrack_file(luo_file->fh, luo_file->file);

>  			fput(luo_file->file);
>  		}
>  		module_put(luo_file->fh->ops->owner);

-- 
Regards,
Pratyush Yadav
