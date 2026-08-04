Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784537F75E;
	Tue,  4 Aug 2026 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785801746; cv=none; b=kjWAwSqa1emLlZyMuQKzkqUTx2WEtYHqbOOy+98SAE+hefVSvM+tCpTSHVEsu3wcZLlVE16ki3Jh1MTPZXHMlEmv8YsFVUaa7tiUP2KWCpTpA0oZ8tC8NJy71OvGeZJi/Qn88Zv+dhnpKBCqPq3ofytgSo5OG1eV9/h2UGsHJQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785801746; c=relaxed/simple;
	bh=H4bfq9s1yX+PdfLRVKVy64vafK6Z7Son85+ayDp2HnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cED2o1KyVyBv8QCspjCFZTuDxjIVm8JfjyJGGnU8yjti1/M/ez9DEu95QYLnfujU6GKgdmmNqlr045wLYg89oJawFyQUHZbOXlJJB1fMB/WEbM50SGP3DIo1CN4F0ZIL1KkAk9J/1I4R06omtG2HxwIXglw27VJ7iI8Iy6CJ8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwYM55Vh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwYM55Vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9584B1F000E9;
	Tue,  4 Aug 2026 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785801745;
	bh=UrwJW94kDrg4+m+jnC59gn9JDVrDxdlujcdhUvF1Qqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mwYM55VhfbMkU/n3grzHTwZ6ADhGXEl3Cs9odiqF3bcMRAq8LFNe93Ru/RNNE30zf
	 DHIS1P9kFCDUmgM36OKE8VtU9hpUTtefPlpuwLihxx0vr0YffDftcdyhl5/nLTyiSJ
	 qbtgdfliPAL+JkMtGLC4Fa348VMWjN4GDxZ8sgJ3gfhRXeLBW6y3Pz7S7Gvuw2H397
	 xiiHRSkLlL0951SW4fsucIOkoAqxnfOFncLL7nScLUS02URdlf1qTbxPggR+gekPFb
	 yWZpSH7w/B7EjOGpTp71A0fjmdOJK7Gi9jMIMjos2lxUahQVXna6SB1bADCk5pqkFu
	 0VNCswPiCNEWA==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: pratmal@google.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>
Subject: Re: [PATCH v4 1/2] selftests/mm: rename local_config.h to local_config.h_gen
Date: Mon,  3 Aug 2026 17:02:22 -0700
Message-ID: <20260804000222.88232-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803235743.87939-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 03 Aug 2026 16:57:51 -0700 SJ Park <sj@kernel.org> wrote:

[...]
> I found this patch cannot cleanly 'git am'-ed on mm-new, mm-unstable and even
> mm-stable.  Maybe rebasing will be nice?

Never mind, I just found Andrew already added this to mm-new.

[1] https://lore.kernel.org/20260803230818.437641F000E9@smtp.kernel.org


Thanks,
SJ

[...]
