Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974652;
	b=wV+kPG4IjvtJMgrjWzJomSDu+A5bQhYfeqqR+sGnWK0hHPzOTGpfq6qS/2g4Cl276pno
	 dLlOws7qp/zePPAQslLocjxJBjh9KYMJ2UG/lcyes/iM4W8T4xADRWOKTGi4Hn63mnxWL
	 EV8yQqrUBzJvzyRN8HHOP+evQYYlWGeiUGCKPJRKQfvmLVk+SZ01jPvHEk7UFdGGH1ebB
	 aoyRAQ5UyM47RH3FjTcA+DpaLj8r1GtCeQMsOxG3jakjNe3Vnd4l99j7EXc3E6JxmjWpu
	 /Op5trZpVw2bkhHPv2PbGncPyEki4j/Cpwzf5vTBWVWhPvzl08bxDMH1F3ixODfiz4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974652;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=C6998j54hMzCksQFziWwL93rZ04Tbfc01l4jxthA7xg=;
	b=tk1Xpq3i0yMEQR87aQSpYN4KaAiniA0g/6qQ3W4EHqYGKG39l6iLJHDrrX/KgDR4uGyR
	 YAkAk0RvmGzUu8sNocSGYMcaN79OqwGuaoeAXPNJafeampSiiN8io80GgByR+7Sjoye8I
	 eO3rWT7n3MIoFcV8j+FVN3uj5NxYp2KNCZ4/vn6p34pHy09CqpPaHO/kJhX7+7/O1gDWw
	 ZFOk2UOUl1Uurje2r90tYltRuC0nhjCwdE30X3zqjGE+XIocl91tw1LUidlpmqHMFHxHl
	 c/CYvp8C0P1++iVYdsSdDygH/iw/1aKsPhbN72BAHzW7Kcv32CMRWXWWmG3yo//bZbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkbDgXa9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C0606A326;
	Fri,  6 Nov 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkbDgXa9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25F51F0089F;
	Fri,  6 Nov 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974651;
	bh=C6998j54hMzCksQFziWwL93rZ04Tbfc01l4jxthA7xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dkbDgXa9u3oj+08Vl8kuBq+lpN1QTdOG+sLOcpaAGzlRd4w5evIO7OWT3Ow38XZN5
	 j4yVAXCZOuJ2Todjle2ykecaDL9Q1QzvDw3wcQiB6TxYBDULHGEFsOFIj0vZSXdSth
	 C5AblNYqXlnfe0VXm2AY7wUZ6NBr6wSym04VoSyB3KlzxSjBTeUfXZROojnEkBVlqx
	 F8ykkf8PnlExPRA2G4uGTUHcgglQDXcoz6uPHBc/znhq+9WH9AM2P05bvWGPvvaWNH
	 fZnDWd28yZQNBAg83dLkgy7C+iw5pu/mwLtgehBdmDU4aDZyy1owZ6mGJIwuVtdZ4Q
	 1cqLG39PLKq3Q==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105171801.2189772-1-sashal@kernel.org>
References: <20261105171801.2189772-1-sashal@kernel.org>
Subject: Re: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config
 fragment
Message-Id: <179397464426.9151.10517393467431591853.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:17:24 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Thu, 05 Nov 2026 12:18:01 -0500, Sasha Levin wrote:
> The split_huge_page and gup tests need debugfs, and CONFIG_GUP_TEST
> depends on it. Add CONFIG_DEBUG_FS=y to the fragment.

Applied, thanks!

tree: mm/core.git
branch: thp-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
      https://git.kernel.org/mm/core/c/31ea5515

-- 
Cheers,

David

