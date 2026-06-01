Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192A349CFA;
	Mon,  1 Jun 2026 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302256; cv=none; b=K/7cHirQp6ZNcD+qYzUR3Tx0iM3qNL3rv3E48uKueQPGlMETmOMEQdEzXAk7bP1ej/QJ5KMWXdcNtA9ima8DcsV5xjwNIuvopZw1spxZ4AV5dDbY/d6jj+G4/WyoMiSXPySsiHrNuSqSpQ4NKmsXSE6OTLoLVYAQ57Mbr+3+gl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302256; c=relaxed/simple;
	bh=zPU6w23aFER8IWg/Fvfyk9aQxBddnpE2+iGO4vOHv1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAohLUe0dJhJ0OI4qrWi1zGiBWl5iGap1f7EwmsJLMu9fVKlYIs3wxUY//5zR72zvYJy6RH4sEDG0Vf0orY49DKrQMpexs2heqMrfAuPbS4w2SIJLGG+iM+NlqGiN6g1hnoAhD2PkLRBNOItHV8HKsUXehJDL0vDvFibb0bl31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FGUS5xvc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FGUS5xvc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FsbCYVgNlFSNbUTHLiQSiCvVo3yyBrqSr9aK6qXPioE=; b=FGUS5xvcNp7+LmeoKZ///0wb/s
	WEXN7hGr7VkgTpU/5Hhiqjf/6GP3AFUJhpMDeIEdEZUwoNvS5YWwDn+DmsYdwSzvRlozy/wPwhATz
	LgJABgr7GaLvZHkF32SJNeORY+B6xqwEO1wfkaV8nmKdc/g/atTvQZAVPD4D1al3WGQ8Ohh1kfl7j
	3WMBxfCz3pO61lXboprM3A8blB7Q/+SRgST5OOCEF3vg194iL489VMaAjE8Ur1pIqxGi74Iridi1t
	L3fsqjDcKIXGs6sVyA/vYNdLrT96eXgcO1XGYjx0miyjSwuo5rOLSDlz12IVibOJ2UDG4PwLQvF/N
	MTJMReBg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxwO-0000000AtDg-1UOg;
	Mon, 01 Jun 2026 08:24:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C7490300454; Mon, 01 Jun 2026 10:24:06 +0200 (CEST)
Date: Mon, 1 Jun 2026 10:24:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Wake Liu <wakel@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] selftests/futex: Migrate requeue, NUMA and robust
 list tests to harness
Message-ID: <20260601082406.GJ3102624@noisy.programming.kicks-ass.net>
References: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>

On Mon, Jun 01, 2026 at 06:51:19AM +0000, Wake Liu wrote:
> This series refactors the requeue, NUMA, and robust list futex functional
> tests to exclusively use the kselftest_harness.h framework, completing
> the remaining unsent functional test migrations in this directory.
> 
> This eliminates mixed usage of legacy ksft_* APIs and high-level harness
> asserts, preventing crashes on older kernels, and ensures proper thread
> joining.
> 
> For context, the previous wait-related migrations are in these states:
> - Series 1 v2 (wait_timeout, wait_wouldblock, waitv): Sent, awaiting review.
>   Link: https://lore.kernel.org/linux-kselftest/20260526010635.23980-1-wakel@google.com/
> - Series 2 v1 (wait, private_mapped, uninitialized_heap): Sent, discussion ongoing.
>   Link: https://lore.kernel.org/linux-kselftest/20260525092002.3762888-1-wakel@google.com/
> 
> Descriptions of individual patches:
> Patch 1-4: Migrate requeue, requeue_pi, mismatched_ops, and signal_restart tests.
> Patch 5: Migrates futex_numa_mpol.
> Patch 6: Migrates futex_priv_hash.
> Patch 7: Migrates robust_list (and fixes an out-of-bounds waitpid bug).

Does this affect being able to build tools/testing/selftests/futex/
without having to do the ludicrous batshit 'make headers' thing?

If I cannot build the futex selftests in a virgin tree, then they're
broken. The selftests maintainers have time and time again shown their
incompetence and I'm sick of it.
