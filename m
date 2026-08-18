Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD842264C0;
	Tue, 18 Aug 2026 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787012975; cv=none; b=WMdPBXeExD1l5MUnV0nAPGmxwrUPHuWz7+kYQbWyQvumJpPbRp9+tPW2RMwesx/YnwE41LkOaSOzYbwOSTE6u2klMfLfStRcgDUnxRzl0sS3U5PRoI3IiX12IXiNwM6H+pZCNVE9Ew1pUyz59GamKDQ3R8/OHBPLtsRVMf52hGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787012975; c=relaxed/simple;
	bh=XhkjAYtecOFIAj+vpXsdwcOKeVMWJc4I2HZ8LU9Rybc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3b2Eem3vcOXuOutAz8iedjtzvGmH3DghU2QaNjajual8zaDi0LSeeaaXYFf2Nm4ch2sSwWkN6Ia1E2DK1U3GwSUmw1MePlcZPdO4ZI0qkmdbiibrkik4MKCUMiURVI6Kdh1w/vMX452tNFLxey6jDYWihmarjNAuaFOo0iPqRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyjBkgnM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyjBkgnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DB01F00A3A;
	Tue, 18 Aug 2026 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787012973;
	bh=rtTQr5IlXtVj7J8XxXqZZ2zn2UeRMroo+5lXnZXov30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PyjBkgnMk7z2oJKXEmooUbi6w9qUTcBWX3EoLcwL0QCTYJI7LJiTDFj9JGUUvuJGN
	 aJRwLROuUx6vtUutCI+cj62cXpkF4qE7n5SBdDBESLgygkTHO0rvQ79qIgTBEiYKd8
	 YtphffrLKKUcvsRYucdmnzxqZJqijoJhh/c+sbboBsOvbdJEPyXMyRA+tsL6Lbs3Xk
	 mvna/Of1oAYmO7tQNTh523fsU5XkKWie44puph82NVZvqK3h2HOnMPkBqOoHUiHl0X
	 zTNf0eF2Zjyo75ELRxcj1yf50mQUSEVWvVmIkm3/m97L5BZARJbx+Rig72AdcmBgP+
	 3iqMY/dUB9p2g==
From: SJ Park <sj@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: Drop redundant open() in mprotect_tests()
Date: Mon, 17 Aug 2026 17:29:15 -0700
Message-ID: <20260818002916.87711-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260817080616.52946-1-hongfu.li@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 16:06:16 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> Remove duplicate open() for local pagemap_fd in mprotect_tests() that
> shadows the global pagemap_fd already opened in main(). The local fd
> is never used in the function.

Nice catch!

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
