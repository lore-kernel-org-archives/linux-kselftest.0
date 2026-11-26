Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709964;
	b=BDX53zS1520s7PJ7xd1RC9xtPcuDsU0o1gHLCmDoqqfAVAXbrCCWYwCdCDCpSkRFBe6T
	 I06GPwCiV+uH73F+JFJmgaWRGLmu8zfydQCqC255BEY9gZjyqCCinQMbLaejFr6BNBKiX
	 5rkdVO/w9zBGDCLb1Vu2P6nv6PP21C7LTwtuUHrlWmJIFv/dlj+V+Og3Q9z5hbj6StEb2
	 eoXwspQIRtDyCYLfN8pbOPoJd7DpaWkLreyq2g1HBUnPJbDed4wZGvx5mlfMwoRN4tTyq
	 Mft3tQuPTxQHA2K5lEp7ofsJk5fdrIPnHqhT65XQnCLKWjj24avVAXXQd/z/wIGvK4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709964;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qbYUQnraIR9RiROQnfT4JURPWt6f6uoEIDxWbSfFuL8=;
	b=SjRDCrTHB9O+Cs/NOFoHMvKE1MsWa4iOn4O/7OwxO7fVjYqUUQ7opShBRf3lglRfkh6f
	 Xay584Pfd3kZnIdrpCOCeCBZJ14BEge/Sdy3OHlBoSoR9z7lpAuciZ+Z2mPJQ0v2bRbLC
	 s/Q5DjU4XS5QxKmqPkOomFeeOlzUfE6eCdcQmNYEG8kFtYc2jQu8NuJ6b6o0MYjb06nWB
	 B35qADgpBkNvJTpwu6/OihOjrLXIidufr/ST38HKyQgwmL6BI8yvzPAoEuncv9slV/Vau
	 P6qhMCLhVXV8ou4N/n57rNNZmU+Yq8GfDyRRv+fC0o2StxVDwQ+aKki898zYCcecmLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qulIGXwJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74C9606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 16:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qulIGXwJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6C51BA8;
	Thu, 26 Nov 2026 08:19:20 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDA4A3F86F;
	Thu, 26 Nov 2026 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795709963; bh=+1cJobFx/hmnyVcD3xqPnhuB7i0y5kiN28v6vnttq4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qulIGXwJ46lk8EKkfjw7bm3rSRREKytZAsyObgI/DstFralkoSqrrdb4g3sbT+Ihw
	 tZO1QS8NdE9bkevlNJYbgoC05KS86LorIedHR5Pf3Fqk5PzGLvt3M/HN+0bGoKwAa1
	 bRZV8Nv4nXeHbadXlUoJTiOh36PmXpbyoIREgppA=
Date: Thu, 26 Nov 2026 16:19:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Long Wei <longwei27@huawei.com>
Cc: will@kernel.org, shuah@kernel.org, mark.rutland@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, hewenliang4@huawei.com
Subject: Re: [PATCH] selftests/arm64: signal: fix inverted feature mask in
 diagnostics
Message-ID: <awhcB558hdejyj66@arm.com>
References: <20261114081013.964933-1-longwei27@huawei.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114081013.964933-1-longwei27@huawei.com>

On Sat, Nov 14, 2026 at 04:10:13PM +0800, Long Wei wrote:
> When a testcase is skipped because an incompatible CPU feature is
> present, test_init() reports the feature set with:
> 
>         feats_incompatible & ~feats_supported
> 
> That is the set of incompatible features which are *not* supported,
> i.e. always empty, instead of the incompatible features which actually
> triggered the skip.  As a result the diagnostic prints an empty list and
> gives no hint about why the test was skipped.
> 
> Use the supported set so the offending feature is reported:
> 
>         feats_incompatible & feats_supported
> 
> Fixes: 32de73e89099 ("kselftest/arm64: signal: Allow tests to be incompatible with features")
> Signed-off-by: Long Wei <longwei27@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
