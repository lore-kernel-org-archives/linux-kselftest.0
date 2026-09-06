Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECE31355B;
	Sun,  6 Sep 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699876; cv=none; b=OUBSyjBB1dOQtsAyRFTpl9k3KvxpKNyeBB9IdA4zKcgJn5KQ3CveGvuFik8wtRnXv/flgqtAG9x108gp7HDDFXFpqIOLC8mHWJ0ioJfrHkxVSHggYZURvytQE3/7QV6zMtf556sdyYBDGU/KRwqJ4ISxdj/Zw/p/osJSiWGsVAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699876; c=relaxed/simple;
	bh=n4Dy6NYC2MvWH30Bm8gMOVuhLEaDn2wSxuagR+3OsA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj6Pk7ujjheTjL/DcHZJGUp9YQ1IPNnhccnzsr7WZfCr3hshjtMrJk48IPlj6atuRVgIrY9FpdQ1/lguqPDN/Gwo4kSIo1nBIZgeWpOlotesVx7ZWdgRSMHgv/UnDEbhBqCFZ834KainIPA+VNDRJZ+tUn3IqjvJ0gyesFavFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obtd4NNK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obtd4NNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312601F00A3A;
	Sun,  6 Sep 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788699873;
	bh=vuHuzooQ4Dh6nue4M1OIRqKRrIWXdSV4gGiCzBpBbmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=obtd4NNKyL0WDomOgZw2V8GlWhOR8hrlYxo/Y8iYgmt/Uvrk5JGV0OXh6IW7VniM/
	 7NvQTrYC3k+v+BnKM0MXpbMHRmJB/76QQ8x/Oyienzop5AN+ZaeXHOSUnrS9eoAAHc
	 6e6Dumx0J22Wb+VaMiHoq/+s8uH1O9WpY2j0odXdDjXBkhhQ1xSxeIOYX+M1taGv94
	 +z6P8+Kn7LTa531e9rjUmVGdUdKnU6qsCUm0E8/BNIgJeRNJ9/x52TgzW8EpkxFUgD
	 6QzUPPRtRhCM7GNR9yejwIgMXmmVhCMeuhOwPUl/F43ROirOhwOQkP21NqOshAd5IO
	 XzIWuRqitg1LQ==
Date: Sun, 6 Sep 2026 14:04:30 +0100
From: Simon Horman <horms@kernel.org>
To: Chris Gellermann <christian.gellermann@codasip.com>
Cc: david@ixit.cz, bongsu.jeon@samsung.com, shuah@kernel.org,
	kuba@kernel.org, linux-kselftest@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nci: Fix out-of-bounds store on thread join
Message-ID: <20260906130430.GJ40544@horms.kernel.org>
References: <20260904095915.3372241-1-christian.gellermann@codasip.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904095915.3372241-1-christian.gellermann@codasip.com>

On Fri, Sep 04, 2026 at 11:59:15AM +0200, Chris Gellermann wrote:
> The NCI test collects the exit status of its helper threads by passing
> the address of an int to pthread_join():
> 
> 	int status;
> 	...
> 	pthread_join(thread_t, (void **) &status);
> 
> pthread_join() stores a void pointer to the memory location. On 64-bit
> systems, a void pointer is wider than an int, so the store overruns the
> 4 bytes of space allocated on the stack for the integer and corrupts the
> adjacent stack. On our CHERI system, this caused a fault due to a
> capability bounds violation.
> 
> Fix this by introducing a helper that joins a thread through a void
> pointer and converts the result back to an integer, which is what the
> helper threads return.
> 
> While here, also fix the logic in disconnect_tag() if the helper thread
> creation failed. Previously, it would have joined a thread that was
> never created when pthread_create() failed.
> 
> Fixes: f595cf1242f3 ("selftests: Add nci suite")
> Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>

Reviewed-by: Simon Horman <horms@kernel.org>

