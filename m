Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176178;
	b=HIl8fYKmduArC7mqSo8K9R18jZVThaYZ+ILVV9uM5FWJNQCLdnp1w70Lte3HGtGDh0Kk
	 tB4lzIiOEr2wZfUd8q4kY7Z/WO/G2Z+JIscyeEPnI3b8pCQpv51Q+B0rGSxaW8NKKo5WK
	 xUhEucn6bYy3Z+hPbwwTY6/vGEppplqcHfG43YUcUfI8qFQ0DHY+pDMPeUoQEIiH1mxh2
	 k1AFo1Eo0ZHR3iD09g9HGzOg4JBQJBvIt9uwNoyu5Kbh60Gn+GFOzP06LWN0H0b9pVO+c
	 /t/iQBdXYRsnE6valA4NH9gKB/Pko4ute4JD/01caVoB5IjiqePd/XWeEER/yKRKiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176178;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=a5J72X3HPA+7mSwk7L/JqiNlhfSlr+OpvNLs81RwtBM=;
	b=Chj4l2DHKlrYkzRKQOBK7yvpYFph8s2upm7q4YNIcy2FvhRgBopHW/Vhw2Jqc/Qbdy2D
	 WtvtuS+yKtzXSMGE24bzYTBpjnqax3PmqdDhWiafHs/LlvXlVmF/yv5J6vNrugqIpZtdL
	 Y4YpbF6EhTfwADY9XqNXhXFPFw3A1okhlUNu+IN93sce7Zlxg8LvYFSXPA5DOB4kKgstV
	 anWrsUpciMIP8weVftJeddYAs+rYk9Gw2C0qXCT8vBFHjPM07PyB6OyX89xYrIY1rAUct
	 kxhfy/OlJd5QUrWjBc3xG7II9FRj5d+mzuiFZ+TjjRJv7o9LKoLJFOPaQRqSxPomWTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWKv2sBp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C109606A325;
	Fri, 20 Nov 2026 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWKv2sBp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EEF1F000C0;
	Fri, 20 Nov 2026 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795176177;
	bh=a5J72X3HPA+7mSwk7L/JqiNlhfSlr+OpvNLs81RwtBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mWKv2sBppmiUSdyRqTHoLy0JiF4sgo0VjISutNKO+L9E1A83mmNl7o4OwDh61EuPA
	 pkCfeqgSsgrgpvW/wxbM5oLmX/qWpfSJ7NynQQUHRGPa3Q9jhYW57wuSAfo34EBEMH
	 BFj7Y0k92tluEyBqvMQkOh67LrqF5B1Nf3Enowz7pr9aLKaU8TYe76sGIE0FQUN+YA
	 qlAUT2yUVqmA2bJkml2+T686GxMFtvjN1hiizEyW3szH9eADb4nM1pUvd3H2vK1uNf
	 xb5gzP2YsZBAP82sRRbl9wKGk0mrFqfR1C5SzEUC0tu7o6LCIY3d7PNaa30kWXRK5n
	 Yd1rQsvYo08eQ==
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
Subject: Re: [PATCH v4 10/19] mm/shmem_luo: Don't make early retrieve
 failures permanent
In-Reply-To: <20261111002358.1842967-11-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:48 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-11-dmatlack@google.com>
Date: Fri, 20 Nov 2026 12:02:51 +0000
Message-ID: <2vxzy0an1zis.fsf@kernel.org>
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

> Mark failures in shmem_luo_retrieve() before it starts restoring the
> folios as retryable. If no retrieve succeeds, finish() frees the
> preserved state, like it does for a file that was never retrieved.
>
> Until the folios are restored, nothing has consumed the preserved state.
> Leave it for another retrieve, which may succeed, e.g. if
> memfd_alloc_file() failed with -ENOMEM.
>
> The exception is a preserved file that this kernel can't restore, e.g.
> because it has seals that this kernel doesn't support. Retrying can't
> help, so keep that failure permanent, so that every later retrieve
> returns the same error.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
