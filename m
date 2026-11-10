Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305288;
	b=1YifmAN55ep/Zf6RFAKAt7PFlAdkXi+xLShGqCwS9hcTVIggC7N0apwGuo5U4Gad9xV9
	 h/RieHUqURhPhj8IkF8HoPo0/QOmM6s908gd+pQvr2p6N+QgQVEpOQFEG2XOwLVLxsEdx
	 htcXvIn3QyB4LGIgLxpC2tkGvYdgqcaPRQA6nOXRv9c60TSzp9ZoJRKc+JD3USZ1PlLwz
	 QiIy6v98pKSn6BmWycpHz0+MY+Bj7LRuz7NjvCU4ZP05KnAHiu15zr/3URxHzipr8T2dk
	 bYF1iEqKvkX47ScaVObueTDjfGlNuidV4O6n8Bvyk8ufKLhGHGnV8xOCgNapzZXTbuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305288;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B48kL4WCEYqxwxvpvXJRGvWJeCoK9+ni3AEiglJSAP8=;
	b=tXKuyiAA1YvIbq/4BnZ/gHBb+DVSY5a0pS/MSFe3DlG/Tvf/T1DzcspDIq31B9J8OQcT
	 cdRGPAahcAWDofbXt7Cmr2VjBffwSe3HeXACsD8ZJnSQOBAWztKAv8kuwMABIGidp1l3x
	 W1VJaJgjn4y97DMvveppmSY+WhjcjUiXPh0W2fdhwfHM9XuOVwSXF9SxZXpdBga0n06rC
	 nResJ80BmH5XuuoD76jQ2nA0LGLsRi8sml2snOUbdWb/2XVtgHGO6/G8dP/5ujgLZdbts
	 2ipnG1PCr3vFEmF4YIgZ5A+ywMvZk1io8drV/2txQpGAeAbUfTps+9ly7loBIonKKcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlID3jga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF1606AA55;
	Tue, 10 Nov 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlID3jga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250681F008A1;
	Tue, 10 Nov 2026 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305287;
	bh=B48kL4WCEYqxwxvpvXJRGvWJeCoK9+ni3AEiglJSAP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AlID3jgam2bE0XzjRIAkHv5Kw4LKHa7v3jRobb3UN2iupex+SPzMdiMgESqD8vIxi
	 Bpt5CdJKUEtbp0Yp7bgApOyN+MPv8BCOrVYL96TAH0ZZvu18390yWHMerUsXxgzLbS
	 tyWW2MTSZ1Gx4rLGCKx5oQJxPPrlhRShYZgbOb/ntXTaOHdJR4K5otOfXWkYdWvLU1
	 kwnsl/U2xFuKdk76yvqjD2i3NK0zQ6PUe2DwJY7V1YRqilMvIu1LbeSDbE92qpvEXr
	 1bqjGQJEu+Ga+w0DkrJRo6iJsM9Rvqp9PAxStQMAXIK6KUKsE/4Kk5MjWOWE1YsRNy
	 t8+datQwT5aEA==
Date: Tue, 10 Nov 2026 10:08:00 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jinjiang Tu <tujinjiang@huawei.com>, Qiliang Yuan <odys.yuan@gmail.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Huan Yang <link@vivo.com>, Wang Xiao <xiao.wang@vivo.com>
Subject: Re: [PATCH v2 0/4] KSM: introduce only_merge_zero_pages
Message-ID: <avLsbZz0S7sRYIL9@gremlin>
References: <20261110074312.219847-1-xu.xin@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110074312.219847-1-xu.xin@linux.dev>

All-in-all this seems to be adding more complexity to a current major AI bugfix
target, in a cycle where we're not really looking for significant new
functionality.

So given [0] I wonder if this could be deferred to the next cycle? David, what
do you think?

In any case the code is pretty rough from a scan (I reviewed one of the commits
to have a mini-dig) and looks very LLM-generated.

It needs _human_ polishing before we could take it regardless.

And additionally, you are shoving yet more logic into already horribly massive
functions in dire need of rework.

Sorry but the technical debt does have to be paid at some point, so I think this
would need some initial patches doing something about that before the rest of it
anyway.

[0]:https://lore.kernel.org/linux-mm/a2f584f6-e382-4876-aa6d-d5a34de6ee59@kernel.org/

--
Cheers, Lorenzo
