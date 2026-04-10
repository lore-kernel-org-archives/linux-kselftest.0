Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB8344046;
	Fri, 10 Apr 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825827; cv=none; b=deMbakQwHDwEpLD0/WTwMXkl9u15qQVvak3CRqBTAMnxWHmq6U6DFd5jmlBnh4FDwfo5f4XpU8giMQYj9mHr/mENKCqF29iL7p2j4Usi8nITqn0NfFLNWwY5mQal/1u8tQoAgIaEeRNkSq7EA3TrjKE/k1BqjivdsJYC0sXFog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825827; c=relaxed/simple;
	bh=+piJVeyJXuhTxPNrF2LnF2730ZGIpo/3o5AS7f3Pd40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aorv0oJDHhu/+xvqNgwImXH4e8MBb3dB3l9zISTqnyf/P0y77Lmr4YXpzkQqnCd+cbJCbVdmj9sv3f540YdIV4JZvhm6z3rmrY5mJ1XiBnS9C6cox6MEZ8Z6jQt2mjjTpagb2Fudb5tAOtlr+FtRZpW2BUPgR86AbrK3P8zFImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H84WK9un; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H84WK9un"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uVN+nAMwIPn7XGcHV1aE/lutYAaI/1O/TZhSItPjAsM=; b=H84WK9ungbdxfmMBb/vo7dG5vT
	fiFRI/t7uMxyL9MQGNeJgtkk1H1hhWiqyypUL1ldQyvxmW2VjYv6gEC1Hyp2ng2dtotxdu5LCLAKb
	PhV8M6rFSP6Ld24/+keyiDW+3FR2hdlH1qjJrn73B7yqJ6N//5fT2l78joD51OF2Xp8vhYeArtTVK
	MhcPxiunZlks5BMdPX7hwNBWGVfUQZuDucWZNYgu98qX8SQsNHj7zTg2P9AhDKVj0v6aE2IfpuLYy
	XFIBrLmkOcB+yEOGxPf1jmHQTLk1SUZJBFSXa7LP2+2zLxtW8Zb4noTwO5+ml904axIex2+pm+Atb
	w7lKj+gQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBPt-0000000DWZJ-3vcu;
	Fri, 10 Apr 2026 12:56:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB94B3021A4; Fri, 10 Apr 2026 14:56:55 +0200 (CEST)
Date: Fri, 10 Apr 2026 14:56:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aniket Gattani <aniketgattani@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Ben Segall <bsegall@google.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted
 commands
Message-ID: <20260410125655.GB3102624@noisy.programming.kicks-ass.net>
References: <20260409212223.2072418-1-aniketgattani@google.com>
 <20260409212223.2072418-2-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409212223.2072418-2-aniketgattani@google.com>

On Thu, Apr 09, 2026 at 09:22:22PM +0000, Aniket Gattani wrote:
> +	if (cpu_id >= 0 && (cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id)))
> +		return 0;

Did that want to be:

	if ((unsigned)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))

?
