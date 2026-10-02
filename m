Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F133E2771;
	Fri,  2 Oct 2026 18:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967363; cv=none; b=bWh8cnZ//tPRCtU8AlOD3lMPIX9fb6iUECyP0SjRfZ34L3bS21nCMrmVQCPtPmr43USvNYft2Xbvw0GhcTGlcOEemSiI9bxoh8rRfvs4T6WX2/C3j7YebD973iz7twu6Efo4UvlrcgI1Te1QMp4YtEKTEEcP8Z4NCnasN7OEgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967363; c=relaxed/simple;
	bh=ZxwKMOOvmrfGgtZgwQPEiVdQ3xPZwGfN2W3kmQxgemc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCo8vs0yQ3AYz2VpMqORHuvIevdNInXfkaTYACqR6ZKWG9xhFldrt9zHpDiCOLs0kBblx+1yS2wRbJLCSlLQ2wnOLpt/AfoGRh12etwrkkAlnzKCwneziHr+inNG+dTreo8MUenG1lRBxKAFRrqaHsFUJtYPAlWa3YBURhciM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naBtS+AI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naBtS+AI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EBC1F000FF;
	Fri,  2 Oct 2026 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790967362;
	bh=0+fy1k/FTgNKjVO3WlIWR90qWFOxGe1fwcU4uHmJ++s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=naBtS+AIPsfSrE5BcNQ1Zi33yx+/tTwg0tt/VobHkuWWljZUi3mor2m8UIgDUaVFs
	 g1XOCyT31LALkpGFvi+VLey0ibZUmrwQ51rGq2S+b0CsAwheQy2ZqwvTwWiykgJlxh
	 n5JBWbtnSYTDHBc9hUD0KEONNXlvdcpuObp3B6kkYgYnQaRopftTuAUoJeTsa8Noiu
	 jAn1mBhMX/c8j7+o4PX8ed9yb+D249oDuAjS/E2yHHlHA5HwwyPMgtqOXNKcQgeMyV
	 Xq0f4dDVIOVm84BOYF3exj+hKCrLyLWYlzQO1qPMLJSv9vsr5qABECQI6td28+1Hec
	 7BbLpqerulZvQ==
From: SJ Park <sj@kernel.org>
To: Aveline Noir <jm5905938@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: mrelease_test: fix retry limit
Date: Fri,  2 Oct 2026 11:55:55 -0700
Message-ID: <20261002185556.41533-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CANOyQmFzsssM_BXHUDrV+UuVD5SZMBmSkg3UQnmw9Ns1PV7GCQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 23:00:27 -0700 Aveline Noir <jm5905938@gmail.com> wrote:

> mrelease_test doubles the child allocation when process_mrelease()
> returns ESRCH.
> 
> When size is already MAX_SIZE_MB, the current <= check still allows
> another retry, causing the allocation to grow from 1024 MB to 2048 MB.
> 
> Use < instead of <= so the largest allocation attempted remains
> MAX_SIZE_MB.

Makes sense to me.

> 
> LLM used in discovering bug. Changes were made and reviewed manually.
> 
> Fixes: 33776141b812 ("selftests: vm: add process_mrelease tests")
> Assisted-by: LLM
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
