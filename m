Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2E4823DD;
	Sat, 14 Mar 2026 22:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773527524; cv=none; b=tDCv7VnguRqjEIKsFDw4kGdTjIY2m3niB5ku6B6H1hVw44ygwXOWf15JXZzNDMzyNfJustGZ3rBAhb3YJzO7UGIuWjcruZnHecIhCxtRrXiNSbBPLev0Ao77XZk4RkKtKfrylPexgROjzq9flCre9081QFnMDc3u/AMjmRxE5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773527524; c=relaxed/simple;
	bh=W++djRxDoKo1QubUSnYfFq7DlvOv1yn2EBPJdIh2cyo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VgEE8xMP0oc1wIIINimkHrczdqq2DYZfPpksIQB0se/zuzsq6JLblVj8YThH7iYAvd1fic4HX0dhUbW6TEmQLM9rcVSKR7LSZWGS/vbfdC3S+lx5U3HleBskjzO46JcxKxh5oEwQVVquaoy6vhhyAL2oXYhWzH6Lev4VvCWKcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=clXEltE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="clXEltE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D109C116C6;
	Sat, 14 Mar 2026 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773527524;
	bh=W++djRxDoKo1QubUSnYfFq7DlvOv1yn2EBPJdIh2cyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=clXEltE4Q0rwKPvvOPSyWcV9RNCNqITssDacHWIwHKGefUhuMdvFSkXKt6S77Yh/U
	 a6i3Cv0miEIWjdNvCVSnVmBCr3UhH5wx7vzeTf7T/3UUgSYw/QugWlEY1zubxP3eRI
	 QePmw0YkO5g8GrpqLwLUblNaC1KqosHMxStZaL3k=
Date: Sat, 14 Mar 2026 15:32:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>, Oleg Nesterov
 <oleg@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin
 <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn
 <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 0/4] pid_namespace: make init creation more flexible
Message-Id: <20260314153203.cfae7d3f420d2da050870f4d@linux-foundation.org>
In-Reply-To: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 12:09:38 +0100 Pavel Tikhomirov <ptikhomirov@virtuozzo.com> wrote:

> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: Christian Brauner <brauner@kernel.org>,

Actually Christian is much more pid_namespacey than am I.

Christian, a MAINTAINERS record would be helpful?
