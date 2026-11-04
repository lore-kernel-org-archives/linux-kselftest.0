Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801552;
	b=RW/LktQKImQiWoZd5k6+YVdx0altHAIRtV/49yRKD7XV3LzyMeauywuZyUlArCdoSp3X
	 WGTRHdL9qGTfZ0w11sGul50Ycv4JsAbgCorq57TzaSsGsJYReDPuMKBJf87sn0cm9HJ6v
	 Vb0jDks6z9cTmxH1og8NAkMj0LjDpsIcs7TYwEYpXvOyy7CHx4PBzDLgIJJUyrSXkRw2f
	 YPd2G0lrUGOzZu4n1UbSgLJawsXUpeXfUGhXV2S7y8uXGdVUjGAQVRxeFv1h2uPACYDkv
	 y4LoNQU5lytvIaNU/Bm15LjL5ii1wPdiozIMGNxiOUGrZ+/Pro71Ks5el3v8Rt7JUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801552;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=onQfzVmJC7HohmP0cLeGwtdRODbHCJknVIWGqjziqDY=;
	b=MklAjtYLmFkyuSMC1Nu8bY43xFgYegx+8MZy36up3IWo9laU9jyYlyxgJqojHWuXCERW
	 x7F7fZnsAKAcW/xWpo9KLFbM0tIRR4miE2cUJP096MmRsfe20N/EFYE5N33It8E/P8bB0
	 qP24MOr7TUy9ExzADWYxUALbZ06sY9IJiWgvx19dyfshhDxnM9+jBALGwWQEuOuCDIh6R
	 iFKXU/L8ypLnpCJNAANA8mTLyGJdVmyosCy6LCVH3hFPouVYTW79EoxLseqMwjxVUpGww
	 R3t/gbW2st8amTfIP8mm+d5YjRj0u7YwIJQQK/r6AB2FsU5SEQZJ6febzRorRu75OkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YL0mHBdN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8E606D80F;
	Wed,  4 Nov 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YL0mHBdN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432C31F0093A;
	Wed,  4 Nov 2026 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801552;
	bh=onQfzVmJC7HohmP0cLeGwtdRODbHCJknVIWGqjziqDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YL0mHBdNDiunlG8rrAEkkTaGCj1hrgX75U4z1Ml7hTgNdeY1G7/Lqev+aLVQR+Qpn
	 TdKK4Vzx6TtBRwXZ0bt3OeqzYSVcAzAuv0DOqjLJZibnLWMQIU/66PYdTMkEiIBUUg
	 oj0qzD5GM57Kb7BUN+tcdPhyVuRQ5maPjgC4q1aYirAW4HGo5HdtYvdCLd2VdgR5bZ
	 xrKT2Zx3kw/mDTMaP3mQK8OQ527/ncS5Cy74zMQDkUzrend2XgDr7ldd3EqnS2iipS
	 eCkX7zd4zq9sxqWgYQwz2VRR/vrIFIjwhVNMy7fdS2JG63WulEzNoe96K2ooNFMRV5
	 mw0Ektf6TZZCQ==
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
Subject: Re: [PATCH v3 03/10] liveupdate: Allow file handlers to mark
 retrieve failures as retryable
In-Reply-To: <20261103010216.3447716-4-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:09 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-4-dmatlack@google.com>
Date: Wed, 04 Nov 2026 15:12:26 +0100
Message-ID: <2vxzv76ck7n9.fsf@kernel.org>
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

> From: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> When luo_retrieve_file() invokes a handler's .retrieve() callback and it
> returns an error, LUO currently records the error in
> luo_file->retrieve_status and blocks any subsequent retrieve attempts.
> This is necessary when the handler has already partially consumed or
> freed the preserved KHO state.
>
> However, with user arguments passed to .retrieve(), a handler may fail
> early while validating caller-supplied parameters (such as a missing
> argument, an invalid or read-only target file descriptor, or a non-empty
> target file) before touching any preserved KHO state. In such cases,
> userspace should be able to fix the argument and retry
> LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
> .finish() must still run to release the preserved KHO state.
>
> Add a retryable output flag to struct liveupdate_file_op_args. When a
> handler sets args->retryable = true on error, luo_retrieve_file() leaves
> luo_file->retrieve_status at 0 so the retrieve operation can be retried
> and .finish() will still clean up the unconsumed preserved state if the
> session is finished without retrieving the file.

Should we give some sort of signal to userspace whether the error is
retriable or not? How would it know it can or should try again?

>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
[...]

-- 
Regards,
Pratyush Yadav
