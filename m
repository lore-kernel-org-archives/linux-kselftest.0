Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802729;
	b=I9Thh7UvT8njzFBU/r5Y2QVtYKdGXg++SbzqUd3zpALD9t1SuUGhoifDe6apPnY6cUMs
	 bFpMFVXUO1XJMZe18TtoXzrbb8Bh1IllBV1ZNvnTVuNu0sGj5lavVXc8K1k3r4OctU4vh
	 Q+7RWAO6Xxcbz5CF8N3zctx92QUo2/dKSwP36kwKE9JamWwjPxUhttqzkA9Vu0W8+pWPN
	 3Csm06sWDy29Rh/BwqG2chDghhfIVypkerSPrdroTStQA24dL5mpAznES86U0y9UOxD8n
	 n1kE39rxPr6nfuSUplZZwLbXTY5Du43O40k+WwhPFYYreoCUGO0s253tZGw34BnvvAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802729;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=ensURHApHSqZx6uOyzhFmn+kTScsXcNRPyYQC1uz1CU=;
	b=q0Ed9WAg/MWpG5hVIy9VRf0OBT8NpuhMRoAzPk56AE3qKBmTZ9mdGTJoVeraj14GVNvl
	 tCcj2tdCsVS56l7w/BXRA7bwP84ejOfy0zQXwPYiMuLfjVfdKVI9lR9OGrXfuf/0SD6rP
	 dyWhsUPb7SILMLj62KE8eF/Ikwdi8HU8Vj795j2K1VRgRH6ry+vYfxP4zqYvpECMWDjMC
	 lObghlvuZqjIoGyxpea/WFwFGMA6Y83YCwdjrc5lSrAQiDe5P/ubHmWSXuMYs44rjmDf0
	 lwHCWh7NZLoM7FYXYSNg5IVmAU0uCoad3qmJG1Y/P80FYus05g803GQvKPQ3llmp4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcOpgZef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C56606A326;
	Wed,  4 Nov 2026 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcOpgZef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753631F000C1;
	Wed,  4 Nov 2026 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802729;
	bh=ensURHApHSqZx6uOyzhFmn+kTScsXcNRPyYQC1uz1CU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TcOpgZefoJQDj0LMKZN2iBGkvhXFOXPKKWcv/EELG3wUHGxyUFmCRM1ItUL21vHPU
	 NL30EdFERhZSC/XY5znlGdQMZm3hLLB8tDKOgM7sntuTcodKpH25Nl4e8MahputugX
	 iGMxROzfrdCI5MWnXSfHTdb6BnKnjgcxrpA7aF11iws3kFyfpO2J9N2x0jW5LvDTHw
	 1Las9U1zCRWFyJBh+l9Tz6tJ6e3xFAroBm5WNtxAiFB2PQC4jsJo5mfffKhohxhdco
	 VgFwwZhMbiGRqPCJ/D1rhtDZiR9/MTBL0jU1idXwszX9SprqNES9MFPDmEX9CyJneA
	 hXNHIUwLK6FZw==
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
Subject: Re: [PATCH v3 05/10] liveupdate: Don't WARN if tracking a retrieved
 file fails
In-Reply-To: <20261103010216.3447716-6-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:11 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-6-dmatlack@google.com>
Date: Wed, 04 Nov 2026 15:32:04 +0100
Message-ID: <2vxzmrrok6qj.fsf@kernel.org>
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

On Tue, Nov 03 2026, David Matlack wrote:

> Handle a failure to add a retrieved file to luo_preserved_files instead
> of triggering a WARN_ON(). Make the failure permanent, and keep the file
> until the file set is finished, like any other retrieved file.
>
> xa_insert() can fail with -ENOMEM, and userspace can trigger that with
> LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
> systems with panic_on_warn.
>
> The handler has already consumed the preserved state when this happens,
> so the retrieve can't be retried. Keeping the file ensures that its
> resources are not released before the file set is finished. Finishing
> the file set then erases the file from luo_preserved_files, which does
> nothing for a file that was never added.
>
> Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
> Signed-off-by: David Matlack <dmatlack@google.com>
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_file.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 908ae124ea5e..5a82e45b9062 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -684,14 +684,25 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
>  		return err;
>  	}
>  
> +	err = xa_insert(&luo_preserved_files,
> +			luo_get_id(luo_file->fh, args.file), args.file,
> +			GFP_KERNEL);
> +	if (err) {

I think you should do a WARN_ON_ONCE(err == -EBUSY) here. Because if
someone can somehow retrieve the same file twice, something really bad
has happened and must be reported.

> +		/*
> +		 * The handler has consumed the preserved state, so the retrieve
> +		 * can't be retried. Keep the file until the file set is
> +		 * finished, so that its resources are released at the same
> +		 * time as those of other retrieved files.
> +		 */
> +		luo_file->file = args.file;
> +		luo_file->retrieve_status = err;
> +		return err;
> +	}
> +
>  	luo_file->file = args.file;
>  	/* Get reference so we can keep this file in LUO until finish */
>  	get_file(luo_file->file);
>  
> -	WARN_ON(xa_insert(&luo_preserved_files,
> -			  luo_get_id(luo_file->fh, luo_file->file),
> -			  luo_file->file, GFP_KERNEL));
> -
>  	*filep = luo_file->file;
>  	luo_file->retrieve_status = 1;

-- 
Regards,
Pratyush Yadav
