Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295393191B5;
	Fri, 13 Feb 2026 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969939; cv=none; b=r2RZEi7s6hdetxOp3yvgWxX+6UDzBrf22VVFg4zLi1B5ZlcqzberTLGXK2gfm3fHrSF8i3aSApwHKFkhubnV+vwdDiXQ0sRN2qc8bnf2ll32x0YaqaQZrEs1GqKwXv6OO7OW8xd93rba4+ICLyrSOxrR7l4JyrDC4sS4eiEa/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969939; c=relaxed/simple;
	bh=ngX3JK7vO6xawklzezntRxp9dOrD/CKwjyLntphzJ1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o7VZMBhoC8cIvu8/RYe2nwRAD7Dp2TqGXWA01cAMI11N2w4YYLTGKWq2ahaFKaeBieCd98sY3BYcd0qgSqNTWq/riRCkvYFiuBpVsfv5uCqDfeZKjE32vIPkfTx7uHx7dkrCAJfXAs71NlAzkRC9gjhaPtTuGC4Ra6//re4gq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIv+POCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIv+POCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB0CC116C6;
	Fri, 13 Feb 2026 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770969938;
	bh=ngX3JK7vO6xawklzezntRxp9dOrD/CKwjyLntphzJ1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DIv+POCa0aEy3/UbFKNlCmITwGuOEHyF3Wyp60YTSZIbS2Xwmys9yxY4+DTQIs20b
	 PrTtxNKP8teUxI+vpTXp8XNgaI/BqCo1i88wBQxDBIlarnGmreeYUuD/rtTbbfqRHx
	 hOyA8DeHKVJgRl2O7V6AEyzhMwwiNm2Oi0bPjgPaF8cdDYsUacdTbS4BGxDi3v+Edn
	 HUXfSWjD7jZMaqE0UibvVvSUHdBI+J/8BRg3kfqLmYt3HiuOjJkDWQdAdn/M/tO9BK
	 SdIYnKlNEOi+V+b1mdS7IrO8XwvKpPqlJbcjB1AcbhQ/LtuSxipk5nW10xht2TTGDl
	 VcsgIs3IWIuJg==
From: Thomas Gleixner <tglx@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>, mingo@redhat.com, shuah@kernel.org
Cc: peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
 andrealmeid@igalia.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, zong.li@sifive.com, Nylon Chen
 <nylon.chen@sifive.com>
Subject: Re: [PATCH v2] selftests/futex: conditionally include libnuma support
In-Reply-To: <20260210-20260128_nylon_chen_sifive_com-v2-1-630bcb707d7a@sifive.com>
References: <20260210-20260128_nylon_chen_sifive_com-v2-1-630bcb707d7a@sifive.com>
Date: Fri, 13 Feb 2026 09:05:33 +0100
Message-ID: <87pl6983w2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 10 2026 at 01:50, Nylon Chen wrote:
> Use LIBNUMA_TEST to conditionally add -lnuma to LDLIBS.
> Guard numa header includes with #ifdef LIBNUMA_VER_SUFFICIENT
> to allow compilation without libnuma installed.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

This SOB chain is invalid.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#from-line
