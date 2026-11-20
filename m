Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168704;
	b=tiTSXzJjD9lUoHuumeXaoLKaOAHHKZDqed7sUXcCepB8lfZzUEfLgdtyKHa8m/h7gXMI
	 ktgY8nc8dB8CJ1MPvusKsjP0e5U0c9rndJnPHfb6OFuqDVA6ZstKfnw92e+xL0qFKTce5
	 qUSoJSayu50rLMs9m7Paqj5Q3oGuDjJ9n+Qk0T5qC7JRCn3vSlmHVpqDg32c+cD9t1Oxj
	 W78ZlTqQduUSIOkGGhrT5ZU/Lzw7XhcZhq7dUDXHhKAB9LLH01Wb4Z6nJ200acnPiE1Dg
	 PnsgFDLRG19uzLxQ0yNzGqu0mjqpX/+atIa/p4u7z3DY6gTy+6035HajOQXUocarugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168704;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=E6d7w+bAYSu5dtWtl5fUZsUOR40mrhZ84JxkLfa82GE=;
	b=EdRwxqvxX2y+KKM9ViQFpDaJBdio6lQt6jh7W+BmNQ50NilfPd66B07CoGkd+R1d2xH6
	 RwTr+Lao8zGQVjQwkIzDiukGYwspApmP6BS0130wKQsNnt6gCR8+9Uup0Q2XwLtdrhBwQ
	 4NR+vg8NkkZT4xBXPvPJUsT6w9HM+ksB3cJH3MrU7AWXbF1UlU8IOF5uniBKfjZgxDh21
	 dcWqgV5/FGlAh0q/f2w+2Li4ZoRY3Ep/NlyhU7BLLLV4uELjEmkk9DE8+cUm3qYzW+KOY
	 49pVF+KNQ2a62h18/3wdWVCVOj9SKb2VlWWU3qe2xfBIdGRlb00yHDaaZOdTEpl1eNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIWH6Hg6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DE606A325;
	Fri, 20 Nov 2026 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIWH6Hg6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC3F1F000C4;
	Fri, 20 Nov 2026 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168704;
	bh=E6d7w+bAYSu5dtWtl5fUZsUOR40mrhZ84JxkLfa82GE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VIWH6Hg6ZngwRI0Sh8L6RPMEKJzqjKamjETcbLDxmQ9/OCIxXv4eFzXJ5hekmLDAI
	 /Dj0EoHYcLqjlUjJ5/DYPr/SnUG01jX+yRhY4UkBBvYa0U25SDar06EnekwxgaadyZ
	 DXfc5VfhhA/lGEvjZ2XGV4xYeB937AG2HyEqmZgvlQYHNYammlo9aT+xuBrwu4KAFn
	 kOOFTbrmmS86ONpWUk4BoEIOEB2CMXrLzM1SaG0Rq3BzlvqsS9jYldZt07fV5x7yH0
	 Lb25Xu/a+zFhm5K2N1kB9boAfhUAEpAicLLJZRNE10w4xM0RL2gsxThMLZ0/xW8HpF
	 xCJFZBIft5zMQ==
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
Subject: Re: [PATCH v4 06/19] liveupdate: Don't WARN if tracking a retrieved
 file fails
In-Reply-To: <20261111002358.1842967-7-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:44 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-7-dmatlack@google.com>
Date: Fri, 20 Nov 2026 09:58:18 +0000
Message-ID: <2vxzik1r3jut.fsf@kernel.org>
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

> Handle a failure to add a retrieved file to luo_preserved_files instead
> of triggering a WARN_ON(). Make the failure permanent, and keep the file
> until the file set is finished, like any other retrieved file. Only warn
> if the file is already tracked (-EBUSY), which would be a kernel bug,
> since a retrieved file is always a new file.
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

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
