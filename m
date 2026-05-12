Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919F1FC8;
	Tue, 12 May 2026 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544530; cv=none; b=eVFHnh9hm+KKdSh64t4f2xieivhHGxjIbJ54Ib48J9phvbMDKuqmvLEOAw75cRYdGpWXmeNSqUIsGWluyJ2KIow1vIH33cOr73YpHUgTowHj5IMu3rVUNuUEewW637+QsDWFY49960LV4do1Mph67+e+qekzqqQhSt/YYDaM+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544530; c=relaxed/simple;
	bh=X/J3i/4zSRYs2FzjQn82U1t9+W0iDHKOMA9TgEygxro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfZ++IZon7SVAsnUqpTD5PmhUacoguxKHJmwOyBdVWE/jj966UKGmpn1HpUFr16I0oml0yYlyfpZ4NmBhqpwz8rIR0veNspRH/OM7arHNNiO4MTjYEROsRhzWm8M6qNfbBoQG9FR5jA7NhWhFrFQrfkLxm6/TfJ1Avz5KvhPOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIjQYCIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIjQYCIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE2DC2BCB0;
	Tue, 12 May 2026 00:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778544529;
	bh=X/J3i/4zSRYs2FzjQn82U1t9+W0iDHKOMA9TgEygxro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OIjQYCIzLZ4+2iist5eYnUix5mb+g5c8lFkOiPin8ahoucIg7TP3l5s7oq2xL5h8x
	 BsME/s170IvEkAcN+Vn0BrNgyE/M2v583cJz2BpwzKht+IdlUSbENtbQOlwHkp6MpG
	 p9uCZh2C7iGRttjoyagr0XYnBMaBIhc5nF0KOP1WoKa7J1A4pnWv5Nas8cYUZSNlfF
	 Pumim9o5J8CzTD1PjApjuCXw4qh+R5raYsfC5pZdEzNDbNKIaEGz+YZQYP71mcmUul
	 J5ibxo8UtRdN0KsCkFItSip7vLlq5+uBiO/KDufi61pMsPx3YO9eDAs1VOCQ4XdOrd
	 V9o+RO+vs/cVg==
Date: Mon, 11 May 2026 17:08:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 edumazet@google.com, dsahern@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 2/2 net v4] selftests: fib_tests: add temporary IPv6
 address renewal test
Message-ID: <20260511170848.756e9347@kernel.org>
In-Reply-To: <agIKdx3q9ewyhq7r@gmail.com>
References: <20260511122645.6233-2-fmancera@suse.de>
	<20260511122645.6233-3-fmancera@suse.de>
	<agIKdx3q9ewyhq7r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 10:01:00 -0700 Breno Leitao wrote:
> Should you check for ra6 before the "setup" above?

Not really. AI bots love to complain about this. But "ra6 command
not found" is as good of a message as the explicit skip, honestly.
And we don't want writing tests to be too burdensome.
