Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB883A14;
	Thu, 12 Feb 2026 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770859188; cv=none; b=QafB2bBniC3iC2UnQNGxIeB+6ji1klhswpiPq+74g8nZy0hL/Lnh6ZxTSUVAmT22cg7NzBq+hvEOq+3XhxRSba7yymzxb2T1rRqj2/fPmI6BhdtKbS0n+xDwb5TOmagSBcJZaoQxiXVbywvPoZeg3aIx52MlS+p6yvX+EcCL05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770859188; c=relaxed/simple;
	bh=CE0Ukx7I9S766e6wj0OwNacMGCL+IoK/RGgAuzl7dHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHld6DLCFGdJ+YyTvWBNsv7KDLXi5KZrC+csGAOokVbSE5HxCMs3E02L5wR3g3SUcCVPzZ0s/KQ3fpKWv5x7Y+oPy2KLP/sfcFrF0ilIbraofoEYwekgOlJ3lvYlsQm1fnsi+PS5x0WUJs5mb+TKVTPlkHKG+zQN2gy8AcBOG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1Eq9RLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1Eq9RLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F045C4CEF7;
	Thu, 12 Feb 2026 01:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770859187;
	bh=CE0Ukx7I9S766e6wj0OwNacMGCL+IoK/RGgAuzl7dHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1Eq9RLIFP3tyml+ksOkj7IqiyH7MmI2lkJeeDo4EshUBYrMVYUl1cJr8/vMcU+RJ
	 S0mmcBuk6K8XZU2KHhfi/f6jEh8PwtKxV72iY9g6fi5RpQnR9OWg9liMYrLQu+Hydj
	 OTvnbAXV7VA32LBkaGTiF3CZTFxxSb5t4w3kEGSG9DOw8pqWuLtTk5jHGImGmAl22U
	 vASxwx5MduqSXuWJBb+adhc5NaplkNBZ1IZ097UL5iaJV4d40vBkdyP1HpH/SnxhhJ
	 nyif5PSh4zYc/q28CTbnDVWbB5aBh4Pam0ed7eOMJsIvx+iGxnXTo9YgXT3K60NVhe
	 tHyvEipd5WzIw==
From: SeongJae Park <sj@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Remove duplicate include of unistd.h
Date: Wed, 11 Feb 2026 17:19:45 -0800
Message-ID: <20260212011945.72787-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211064311.2981726-1-nichen@iscas.ac.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Feb 2026 14:43:11 +0800 Chen Ni <nichen@iscas.ac.cn> wrote:

> Remove duplicate inclusion of unistd.h in memory-failure.c to clean up
> redundant code.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
