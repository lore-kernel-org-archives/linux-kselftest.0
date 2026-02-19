Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909DD230BDB;
	Thu, 19 Feb 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771463047; cv=none; b=Yw/WTdLGytaiVOxd8iTyiqb+i43+1A9UfZNC+Nm3V0Dntnr14Xi1ex3XbUXR14AdI98Va/sYyXQG6OuxLlzWiMjCbpSRmzIq4uPaFw8vtz9BkzIGQUKiX7NUjrB00WAwLdFeTzA6ywQ1KhCnfOfX3yBkjTC4PlycRBIMD+kgPt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771463047; c=relaxed/simple;
	bh=ELJFpYBMPW6NyCooS7WYiywWZpTw9pOT/6BVKExWtr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLHOw4z8tJgaRYKau8Fpg0IHJmPw6t91bTbuyHzEpyxIVERX9Jz0xRxpdUsfg4bbYPcIFUALfqTyz7g4MK1XawtntXG3otT183C5X485H/zhvYmJyLMX3oDftKkiCfoUIC5nkB/CZ1n53Mx6L7bAZxkg1CG+JKgw10rYKlvrhUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L32xS16g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L32xS16g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E49EC116D0;
	Thu, 19 Feb 2026 01:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771463047;
	bh=ELJFpYBMPW6NyCooS7WYiywWZpTw9pOT/6BVKExWtr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L32xS16gl5H8aHk6bLRU9WdpO7TPRkz+GTjha1vrvtR9K5BNc+kPUunqC97DMcOCN
	 tDc/0IuxFCvs85CvDeUFFtItdH9DqDTpe4pX7uckIF2xkZvZ6ik444VAC7dtsZRRry
	 xR8yoV9F0uSJDJ9cV+yFXtd7TerdfmXxdzWlWxRSH3DdjZ/Qk10Z/CkacxNuG8Z1ge
	 3oNLzKibaR3c+roA1iAAYgJnXprrvF019Mo5nqKrw+a4JiQCP+E9Qd8trLmO5QAdhg
	 wwUMwn61ldeWU69BW6FZ9dzAg0qP02GQiGKUhj+Bl2MieGdpBNe6tayp6TcZrJfvvr
	 mHCcCdJ0dTFtg==
From: SeongJae Park <sj@kernel.org>
To: AnishMulay <anishm7030@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip migration tests if NUMA is unavailable
Date: Wed, 18 Feb 2026 17:04:03 -0800
Message-ID: <20260219010404.2939-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218163941.13499-1-anishm7030@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Feb 2026 11:39:41 -0500 AnishMulay <anishm7030@gmail.com> wrote:

> Currently, the migration test asserts that numa_available() returns 0.
> On systems where NUMA is not available (returning -1), such as certain
> ARM64 configurations or single-node systems, this assertion fails and
> crashes the test.
> 
> Update the test to check the return value of numa_available(). If it
> is less than 0, skip the test gracefully instead of failing.
> 
> This aligns the behavior with other MM selftests (like rmap) that
> skip when NUMA support is missing.
> 
> Signed-off-by: AnishMulay <anishm7030@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
