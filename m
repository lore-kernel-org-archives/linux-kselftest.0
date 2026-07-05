Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063CC263F4A;
	Sun,  5 Jul 2026 20:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783281895; cv=none; b=ZLUIxwX2EeFroyPYfpBD+KIrm6FMSnh6JO1Vt9FdtPInsAgfJgxN6D5K0UX4LRdXD1USZghe6qntgVXfnb9bi0sljOMLp3+fI06fVz6OYCjEs4/XF5AwGUUjxLCN1S4emDP0ZYikn/G+Otzo4CpqDP6EufNUqwg/rx9TgDX//4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783281895; c=relaxed/simple;
	bh=2sqy2aZLH/v0SC8TzpK9ShdGQBDuRvEuGMZytAXRlXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RK4P515JXP4SJInTwdA/NcaB9s2NpuSX4pvubs6hhV8yr4FELIOTeeGtlNv8QHTYQIPyjXLY7lLoPDYOuAudYx6OMcmxMYEQLKkyrEUdNd7e6Tj6cDeCpTsmFwqktfjZiUbtY5sZYveLpRVAJNBzElhJHVXQu+RN27dck55z2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD5WhYlO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD5WhYlO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132B31F000E9;
	Sun,  5 Jul 2026 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783281893;
	bh=pVn1bX2iRKKUn1/jaTQA8Ho6vRT9HVGPvQMn/YX2kA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MD5WhYlOaZ8ZoWq5aJfWL+pqiGNWD7uEEFqskf6YXyK1zq1lucuLjR86AjmF8sZ4W
	 GJ0qLFVY8nLxwQT5S9yuA/1LItccb1HS4u4aS7YANLFHZU8LURZUD54+gzk2FHpqTD
	 QJx/MRUr0aB4qfe++oFtoLdwbbiTYPLKujT1NdpF8kRxdxJflwLYiBLbiGJbEf7Bpl
	 nUaNnbDbRKmZ3kbp9CuWKLOL2h62xYapdu6ygvU+RBs8j2NmibfKjVqTT1g4j0mpkY
	 h4+6boFVwuYd6Uk9cPqz4zDpivg/9ciJ13Quwix45Cot6rwlLBMnc1uKq7XR7SuJnh
	 2/1nuzXxtvwoA==
From: Thomas Gleixner <tglx@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, andrealmeid@igalia.com, Shuah Khan
 <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Feng Tang
 <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH] selftests/futex_requeue: Increase futex timeout to
 cover slow hardware
In-Reply-To: <20260703032113.535-1-feng.tang@linux.alibaba.com>
References: <20260703032113.535-1-feng.tang@linux.alibaba.com>
Date: Sun, 05 Jul 2026 22:04:50 +0200
Message-ID: <87tsqdjj8d.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 03 2026 at 11:21, Feng Tang wrote:
> When running  mixed stress tests (stess-ng, kernel selftests etc.)
> on a slow machine, futex 'requeue_multiple' case failed randomly,
> with message:
> "
>     waiter failed errno 110
>     not ok 2 futex_requeue many returned: 0 Success
>     not ok 3 futex_requeue many returned: 0 Success
>     # Planned tests != run tests (2 != 3)
>     # Totals: pass:1 fail:2 xfail:0 xpass:0 skip:0 error:0
> "
>
> The process of 'requeue_multiple' case will:
> * create 10 pthreads with futex (timeout 30 ms)
> * wait 10 ms
> * start 'futex_cmp_requeue' case
>
> So there is an assumption that the 10 threads can be created in 20 ms,
> which is safe enough for normal platforms, while for slow platforms
> with stress workload, the creation could take more than 20 ms, and
> some futex will timeout and cause the case to fail.
>
> Increasing the timeout to 100 ms to cover slow platforms, which doesn't
> hurt normal platforms much.

That's just lame and it hurts because it makes testing slower. If you'd
had taken the time to search LKML for discusssions about this issue then
you'd have noticed that there is work in progress to solve that
properly.

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/futex&id=157a9b22ff769e1a657aec6210df3ea896600eec

Thanks,

        tglx
