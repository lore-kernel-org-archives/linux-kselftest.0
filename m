Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802313;
	b=yJtu3yXwwiz4jbtqHNFRHqGeEkMsuo4h8JNIDZoV5ptcO+g4bB4hEudArRN3LGfBtFW0
	 y7U5+jNBUK0hy4/BJSj1XBVYDDzgLwuor3F9XJsCiS0WjuKGnj0fq+Ana5ZU1mC71s3TC
	 EZIdyMsYcQMl6Yw/QTekwCIlA6pcU9Rsv70CM8oZHOFK84LdaH/KWpRKsMZpuzoTZkRtq
	 FsWRyX4DedYVHfBSK3dmb46aerW97MOQwspGqp4uB7z4OR3HLwX9X3cznPS/hNJNLVEhF
	 JQCzkq8zFArXlBOvMG7f3YBrNBY2qzzONkkSkjykpe19Vwtq1lFGt7NnyL39oHzROoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802313;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=tZW6BR9vwrayTNKI8W7w9kReBz4l5H0o0D9sCFw8bAc=;
	b=0pfwTA+rciTDR03zqmz7OjcIvDxDAveEcVKnZd0eyW+xUXlBcISRGmTguzdoT87e8EsN
	 s+MOaaFydjOHPLBGLhJTjoQ2E8iVCsCnhHQ31IboQx9AwftvyKY0SquekeWvyvGQSeBWV
	 eQQ+9cfc9BEaOgfdhqLGphOejP8OCwtNVUMzLvKRbZ2XDD6yhPAGlfAV3NdAdciFTnKkO
	 vKYmEL2tZGLRRwN+4vp0vX3+pkwjw6DUL3h6MD4trkmgIFkmyqCDqQ4YqfFc85ZHd4RFF
	 x4MmHRyg1ul5GF1/mwigg/lbEKUXmv4/HoUjmpVqm24IX0zudh5gCg/HC7UrJcjoeCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bABADEyK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733E7606A334;
	Wed,  4 Nov 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bABADEyK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA41F00A16;
	Wed,  4 Nov 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802313;
	bh=tZW6BR9vwrayTNKI8W7w9kReBz4l5H0o0D9sCFw8bAc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bABADEyKkYq/reQcFV5A5OykrD/wWoqqHZBgx0Szo9PbBI5tzJy/dZXWQvg2Znfqm
	 cflloeK9kR25Chxa9tAsmFgj+p+k0cCGvh3/9RCbOAIRfiMoBg7EGjsH3X9JOYfr0+
	 yB+9+dDSJ1ZQI3jInQk7zdTkXpXVaU8vJWJe0H7ejwtozZVFoDQhacUZ4b493LVl7I
	 xURyeQf86+6Ec2VztQ7g4gywOAqevw/7/AmnYzAf7L6+eI8HtmQldkvLL1NwOMI1l4
	 47C2WZk92rcr8F55j+CCG0lHXt8qLf0kk/seS/g7cjgwDMFgFgN/hka9xRHjt8LFvK
	 6ctdlGadIMgMA==
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
Subject: Re: [PATCH v3 04/10] mm: Rename memfd_luo to shmem_luo
In-Reply-To: <20261103010216.3447716-5-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:10 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-5-dmatlack@google.com>
Date: Wed, 04 Nov 2026 15:25:08 +0100
Message-ID: <2vxzqzh0k723.fsf@kernel.org>
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

> Rename the memfd Live Update file handler from memfd_luo to shmem_luo,
> including the source file, its KHO ABI header, its documentation and its
> Kconfig option (CONFIG_LIVEUPDATE_MEMFD to CONFIG_LIVEUPDATE_SHMEM).
>
> The handler preserves shmem files. Today those are memfds, but following
> commits extend it to other files on tmpfs mounts, for which the memfd
> name is confusing. Preserving memfds created with MFD_HUGETLB, which are
> hugetlbfs files, will need a separate handler, so naming the handler
> after the filesystem that backs the files also avoids having to rename
> it again then.
>
> Don't change the compatible string of the handler, "memfd-v2". It is
> matched against the preserved state from the previous kernel, so
> changing it would break live updates from kernels that use the old
> name. The serialized format doesn't change either.
>
> Also clarify in the documentation that memfd means a memfd created
> without MFD_HUGETLB, and name the ABI documentation after the handler.
>
> No functional change intended.
>
[...]
> diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
> index f50daee8eff0..9a1c49e2e0c4 100644
> --- a/kernel/liveupdate/Kconfig
> +++ b/kernel/liveupdate/Kconfig
> @@ -69,7 +69,7 @@ config LIVEUPDATE
>  
>  	  If unsure, say N.
>  
> -config LIVEUPDATE_MEMFD
> +config LIVEUPDATE_SHMEM

Update the description too?

LGTM otherwise.

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>

>  	bool "Live update support for memfd"
>  	depends on LIVEUPDATE
>  	depends on MEMFD_CREATE
[...]

-- 
Regards,
Pratyush Yadav
