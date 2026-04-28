Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578C19992C;
	Tue, 28 Apr 2026 00:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777335438; cv=none; b=NC73juS4J8CwTKwYZtKI40H+keIq/Yflnyt4H6kbSY05Y6vwJFV2E0Xav/AVcoMLYrbTXI5NIMs1g5x5fPfDTixARYKld8EoAhKsCjsPuI7imHFTIlEINh8To+8EPfPyTV6vwYKFG/DzkfZWXnbDI1U0aGbjfsWpnmpFaIAZ44E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777335438; c=relaxed/simple;
	bh=I+XvYRGSfHu9oMRa139qcOeamu3DjoTukAn+yztBlLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeRntyLZWiD0kKVnWejYD5W5aUBHa9+PzqC3sXtr27vsZUJLs9t+zikQsuNB7FebVnvbcheu0mhUmOuxedt/xRjfbVE4NPz8ugg6Boxyp2vXLxpP6ZnJOFoV/jh6qAc0cjO14hwFPHG9DDxH6qhN5ByDZpyBznOnAbyp7xsUbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y53ki4zJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y53ki4zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35481C19425;
	Tue, 28 Apr 2026 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777335438;
	bh=I+XvYRGSfHu9oMRa139qcOeamu3DjoTukAn+yztBlLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y53ki4zJYdMxBMLfhfsQFpV6wGt3v5oI5UYC01gnSmOhxFd3eSPx/WOYFokaekv93
	 y8pkuPdgGil5IA5H39ufdlsFYl+uy291YVGO4FGVfmCbeibmpYHSH+eOJvQigOwZE1
	 WRylEwcqGjPmE6aVbkG5YzuVMX1HuDHHpVTtmZWep276JG/jWjkPH4aOJOdlTy4ej9
	 I/2axOtWf2K8rz/pEBxjuEUAGJ4iAoGEOVziBeGaACCL0mndKRzmcxJ7VtRmNMwRmk
	 hJsoiRC/AAiDfwvWUTQfKBkXLIRzSJSq/GrHa75A6U44IEVff+Cy3zzpFKz6ri2ZRz
	 vNlFxifeRylcA==
From: SeongJae Park <sj@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests invocation
Date: Mon, 27 Apr 2026 17:17:08 -0700
Message-ID: <20260428001709.112783-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 12:03:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> Destructive tests should be invocated with -d command-line option, but
> this won't work today since 'd' is missing in getopts command-line. This
> commit fixes it.

Nice catch!

> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
