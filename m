Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEB72BE05E;
	Tue, 31 Mar 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935027; cv=none; b=icrmBzC8VI9u9krBelBKv3UE6LXInHCCxpH0E2SQSVa7qWbnGNG4HOEEzE3CSrtOD5A72L0dxTu60Tz8nvz/l+s+DlQ6K5hbBkbAEcg1HbtvQlPScM2D/C+OceqAlxIGmYmHvlDGLMxuANrkO5e94YijvVUUBY05sgUIlVSKlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935027; c=relaxed/simple;
	bh=awxDJnAQJUnZuYVgiLZKewBA9gUakStcl3tPHpT91BQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Fc8AgYrJ0hnaA0Jmke+0WL+ekuR67gfmLZIgy7KDTKMZmovFoF7v/gctz6J/HAjLgrdujs+h07SztXOvEhgIw79ssS8JS0GRXlFoxAdXCakLkkYagMCTWIujCIXQjMNynxLfI/AUHj68quzV1A18oqzaxUkqOKZQEeV8IR+QcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jAULHBCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jAULHBCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4CFC19423;
	Tue, 31 Mar 2026 05:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774935026;
	bh=awxDJnAQJUnZuYVgiLZKewBA9gUakStcl3tPHpT91BQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jAULHBCc+krXR3vE2jMC8wyXP1v4K2VYX5ohuEcmlrDTmy3y4VT3x8LY0uIx9EPs2
	 zTnheCGPyLk3BhTtUI8y0YTylgq6LnMpMMWFp0fozHKnlhlQZabcn43GDUrIydAojf
	 fF+X8iT5pNOIQdw7+w7d60qUcaTSgM9snfv8+glU=
Date: Mon, 30 Mar 2026 22:30:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] selftests/lib.mk: set PWD from CURDIR to avoid
 wrong extmod path
Message-Id: <20260330223025.4ad1cdb9b79e242f01d8b83d@linux-foundation.org>
In-Reply-To: <20260331040156.119158-3-liwang@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
	<20260331040156.119158-3-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 12:01:55 +0800 Li Wang <liwang@redhat.com> wrote:

> When running selftests from the kernel top-level (e.g. make kselftest-all),
> sub-makes might still inherit the caller's PWD from the environment.
> 
> Some selftests use $(PWD) in recursive kbuild invocations, which can
> then incorrectly resolve to the kernel top directory instead of the
> current test directory.
> 
> In that case, kbuild may generate an external-module wrapper Makefile in
> the wrong location, potentially clobbering the top-level Makefile and
> causing recursive include failures ("Too many open files").
> 
> Export PWD := $(CURDIR) in selftests/lib.mk so $(PWD) always matches the
> actual current selftest directory.
> 
> Reported-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Li Wang <liwang@redhat.com>

I couldn't clearly figure out what I was doing to cause kbuild to
destroy my top-level Makefile.  It happened three times and it wasn't
fun so I Stopped Doing That.  

I tried a bunch of things *without* this patch and of course, Makefile
is still intact.  So I cannot confirm or deny, sorry.

I've switched my script so I'll henceforth be running -j100, shall keep
an eye on things.

I have no comment on [4/4] - it addresses something I haven't seen.

I'll assume this patchset will be handled via the kbuild tree.
