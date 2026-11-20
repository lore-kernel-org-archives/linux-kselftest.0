Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177104;
	b=BQODGoczGFubpNoiAAqBvi1bG3ncCXomiBXEfBWo6vHTc7dP84yrr+qoWS4RkZoz1TK8
	 X0Ipc2RIzszdM+RcyAES+zlP4vQ8YZbLwvmon6jNv6gJMxx5TZUoQPt/hTFK4pTvOOAtU
	 Lo40E8p3ZQJRJI1CbRGQ9pUg24f5rBLVlBC81lQGcA9173uiuVa6pCbTzRgfnShHesZ+U
	 cEW0xgVKRwERrl+g7Ay+Y66pWFgqjHzI8tmz6Iikoxyry49NCoDiDko09IGMa9S+Ukypd
	 UCyhA3M9XbIwiG2In0UQgn10RehDDyzripgHU1k45gG2SLBymWe0XeAU5MezKRoD2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177104;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=PQ7877NM0Z63f03vb+VlOqlB28yBZwRNNMB/tP7aaos=;
	b=t8Po89SOillzqwlqImln6/9phYZeW8s4gP4RDx4chF2e4tkHu5EIJr6kSqleU4l69hUX
	 N9+Ct08r3AS3C3p3xUR+eSEEYAZawQnS3YR8nxS/YAk9Ku+ofBmjjObY7mT9o6vSh9GkO
	 u9XCGdwT081wlGsxc7omZ2cy5nOzs02WIcy5sVOmPvw+d7nk8CJpMBKfocotBchDCJ7Nq
	 QJG3/UGHUbj8r8EFoNwHmmiyD+vpqhWImj6befoFDinuNpSsdizcfcFbXzmc1nkylxR+B
	 EJdgvM8b7ED0AYsmZofjmCiWS3635v1hAWXObIx+mLMT1BcsJDBXTJpNODljTxoVq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3tSaNjD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E5606A331;
	Fri, 20 Nov 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3tSaNjD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D9A1F00AD4;
	Fri, 20 Nov 2026 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177103;
	bh=PQ7877NM0Z63f03vb+VlOqlB28yBZwRNNMB/tP7aaos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=R3tSaNjDrxS2buOBQuUnNft3p1BHdF0ka2s9xwRfQWYtaatHIYf/SIJftvDUBALXa
	 gnbmi74ZxRHOY8TDl38ZzpEYMermT6EUGtK8l3dyxnQK3T69h43DhYsDem5LunRyOO
	 dmZxC0Dj6rsbZRBqRW7NjwWYaBRddj6WAyj88uDgjTmtDybSyPfMn8ywSgvsPtmw4C
	 MLapjmkrXt6h0dWVWig53bBmuExExOROJrdvbwh99Z/zF6S9drRf2/N670iprfGybm
	 xXoX/u5l+pEqxFWpeS070GQxwIurW2WCDjb2Dl+S9+JV90SZJPceyVH5tBj+YKjaJX
	 KIbcGLf5t9ylQ==
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
Subject: Re: [PATCH v4 11/19] mm/shmem_luo: Require permission to preserve a
 file
In-Reply-To: <20261111002358.1842967-12-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:49 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-12-dmatlack@google.com>
Date: Fri, 20 Nov 2026 12:18:17 +0000
Message-ID: <2vxztslb1yt2.fsf@kernel.org>
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

> Require the file to be opened for reading and the caller to have
> permission to write to it in order to preserve it. Also let the owner
> preserve a file that is immutable or on a read-only superblock, and
> reject append-only files.
>
> While a file is preserved, its size is frozen for all of its users:
> truncating it, fallocate() and writes past its end fail with -EPERM.
> Today any process with an fd for a memfd can do that, even one that was
> only given a read-only fd. Requiring write permission limits this to
> callers that could truncate the file themselves. A file descriptor
> opened for writing isn't required, since that would rule out preserving
> a running binary, which can't be opened for writing. Only the permission
> of the inode is checked, so the mount doesn't need to be writable
> either. The size of an immutable file or of a file on a read-only
> superblock can't change anyway, so its owner may also preserve it.
> Append-only files are rejected, since their writers can only append to
> them, and freezing the size would stop all writes.
>
> The retrieved file can be read, so also require the file to be opened
> for reading. Otherwise a caller with a write-only fd could preserve the
> file to read its contents.
>
> Document the frozen size and the permission requirements.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
