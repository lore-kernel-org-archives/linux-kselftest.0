Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175751;
	b=pEOmJR6apk0JrvmzLnxYheT4XnREM8T7PPK7VD9DGWnRsTHnjShFBSlDxmGsIsyoMIrG
	 PqL/6VECQwNc6jlttFzvHytDvZ09AJcS9RdjlKyysxL1jo9S5itjqkSXUoT1fvrbXcMm9
	 WVfCLtxXEZSlZRtwOquTtNk4XiNh1p+jD/NliZXMSDeB9z7nFdq59KNkK5zilcc2YfCwz
	 rm7TM6apFWf1PSizerz1iD4ZZz0wCWeUDCP5iJoWcg38PfztGKZXkQ7IVlcapYb4tmq6w
	 QlAJMbnzFPOf8t5VlYVdGIEkPx+kOejGhSvJsSPRBWKGjpmQAQO/yt4U9ILzOj+Y/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175751;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=P3gyj12NGt5BrOAVOnJOGDgKEsVMdz42lpXGv/yZrc4=;
	b=rz51vlDvPqLKhJODWJnoEcUxgk0H6FZ2+YaX/ac7h2mnSaNvpOd+EBHcsEayyQjn8F7y
	 T2fY4DuUIpd7XzC4FvTQQ6rOEkbjuqhNaoS3+8seKk+llPRtQ7qB2gann+N64i5yBuOu8
	 ycZY95oU7uWEjG4WRVKFuIBqS4rtmvjRbRyCXkMVtq2Ml8gwsXM60TAwuXIoplKl0gkgu
	 WlMfDPHxR9W3tnXFXiXPRzCY7SmZ8jZH0CqUjM18P0U33ZzlFDsfRH3G/806psYhdV1Qe
	 l1yAUUrL0gICFA136kVCy0XA0JvJH+bn6xpD6x9sm989bPeC+EVzFT1xEMxzlddIpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRmupP+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884CE606A325;
	Fri, 20 Nov 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRmupP+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF9F1F000C4;
	Fri, 20 Nov 2026 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175750;
	bh=P3gyj12NGt5BrOAVOnJOGDgKEsVMdz42lpXGv/yZrc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XRmupP+OLijrmAtsyFzXXifwkuMS8W6gNVR4LOQJPmUXO7GcnqLiZxj7w2peSSlsu
	 QMq1FxF6ebx+N5vGd+gPCfWv/hQdtBeT2ynxnVrf00EB2x6ercEW9SIcOTFr6/Gg+0
	 +0VZoq0mBHSiGpSUMlOovIy33ZXnen4fS+2fARU6pJbnmbFK3EAr2ic61lpeGjOwQf
	 iFH9PTAknNIhVdp95GGo75mLA233YHUQfa4N6a6X+dOkSuSfPvhInvrsgbZRJm5kOG
	 X4YITabmy70LoUjGg+Mx9siucKp0Y9fW03PE1MjQGJywW/z58DOrX5l+Ovs5sBRMsQ
	 9qqDxMCNtyI/Q==
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
Subject: Re: [PATCH v4 09/19] mm/shmem_luo: Leave freeing the preserved
 state to finish()
In-Reply-To: <20261111002358.1842967-10-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:47 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-10-dmatlack@google.com>
Date: Fri, 20 Nov 2026 11:55:44 +0000
Message-ID: <2vxz33sv3ef3.fsf@kernel.org>
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

> Don't free the serialized state in shmem_luo_retrieve(), whether the
> retrieve succeeds or fails, and let finish() free whatever is left of
> the preserved state of every file. Once retrieve() has restored the
> folios, it sets nr_folios in the serialized state to 0, so that
> finish() only frees the rest.
>
> This fixes leaking the preserved folios when the retrieve fails before
> it restores them, e.g. because the file has seals that this kernel
> doesn't support, or because memfd_alloc_file() fails. The retrieve freed
> the serialized state but not the folios, and finish() then skipped the
> file because its retrieve had failed, so the folios were never freed.
>
> Preserved folios may also be in use until the session is finished, e.g.
> by a device that was preserved with DMA mappings of them, so they must
> not be freed before finish().
>
> Fixes: f85b1c6af5bc ("liveupdate: luo_file: remember retrieve() status")
> Signed-off-by: David Matlack <dmatlack@google.com>

I think some of this is already fixed by [0]. It holds the folios until
finish, but only in the success case. On failure to parse seals for
example, it leaks them. Except, as Sashiko also points out, in
memfd_luo_retrieve_folios() the folios are freed.

I don't think this is strictly related to your series so can you please
send something on top of [0] to fix these bugs, and perhaps drop this
patch?

[0] https://lore.kernel.org/kexec/20261110175855.2437084-3-pratyush@kernel.org/

[...]

-- 
Regards,
Pratyush Yadav
