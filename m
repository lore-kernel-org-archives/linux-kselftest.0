Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B421CA03;
	Thu, 27 Aug 2026 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790677; cv=none; b=X3SMAf7KhhCW0QDA5WvfdnVMzrcjnTxN1yDCYYBRbCLWY1yGtfLoIhXse8IqTI9DsDtWBFmY8lyAl3pGMrYpJO9qlyhvuPM998XahS2W2xINRy87khbY1HqzUlB10ElRfRHrt+ml9YbdTDAZD7jYatODdTwuept2VPHcAsiYRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790677; c=relaxed/simple;
	bh=KicPRVD0HniZo1UeAnqzJMkvy4ZktGDzI/SsoCO+y1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8ym1yl3mEuzOfMxzWZsJFOM0IGBKMUpNxvGG/OUyZLWB7p453DUeP6wMSEDGBbc53MyMEPC/MlRXBatSWp5nqobeVWUL56banrmax78xbXCWGuVIFK8jSxp1v3r+mDz6jvc8LP0RxkCrj2pXySmlf3NR8AryUqTNE/hUsO/+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYHO0fSr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYHO0fSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFED1F000E9;
	Thu, 27 Aug 2026 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787790674;
	bh=mqB1m/96VTfRYII2vqeYFGWVPKUc3lqcw0NbwfK9VNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oYHO0fSr8SyrOOkaP9GXUjf398GK+3yEI1OysuNO/GlArC7PeB6xLUseKHLBIH7Ql
	 fzUPFspXTr4IsF/XOkVZN7oKJ5vFLppAF301EF5IQx19cEutRw3lL5auxxuT0ObBmi
	 ax76vgMszl0TbJi+m/9f+g/kd+IMC+nc/dunpgVCA+6oJrNSK7JL5rJlVdNVVP6jiT
	 DxmDm5TicLGgKq4myhCbWkb3CqS0Xvs7ITPOiN2LQD41gyWfGhWc7n66sehBo5/OwU
	 N5cNPImDpWlqGYHIcm5h9wG5meIPnjtAucXhJeBjBoG0TfMjrxlr2mnJcKmpU5a/ve
	 0XglS0R/I7YGw==
From: SJ Park <sj@kernel.org>
To: Anshuman <anshumantewari123@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: fix line buffer leak in mremap_test is_range_mapped()
Date: Wed, 26 Aug 2026 17:31:06 -0700
Message-ID: <20260827003106.82479-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826061300.14038-1-anshumantewari123@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 26 Aug 2026 11:43:00 +0530 Anshuman <anshumantewari123@gmail.com> wrote:

> is_range_mapped() uses getline() to read /proc/self/maps line by
> line, but never frees the buffer it allocates. Every exit path
> (parse failure, match found, or reaching EOF) returns without
> calling free(line), leaking the buffer on each call. The function
> is called multiple times in this test, so the leak accumulates
> across calls.
> 
> Free line before returning.

Makes sense to me.

> 
> Signed-off-by: Anshuman <anshumantewari123@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
