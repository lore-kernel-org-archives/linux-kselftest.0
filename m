Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CE1A9F97
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347940; cv=none; b=fKB6k8qNrbij0p0G3Z57m15Bzag9aURnP6kN5cKDTthIdzKS8yYnAP0vDsp/N3mZB8BKvos5q8IAjSVLbfKOuOHQytOME6kO6qH93Tf70jdc+IBMyc3bCZ9tHjpGOO2Hw/PU4Wf+FwuAvYIDQ1YMtoqMXVow0ufOWr8iNhkc8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347940; c=relaxed/simple;
	bh=xSM8fF4olsPKw6JgFp2JaUc5wkSnl2iYTe4p6ufJ+ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKEVg+EYxTuIM1VlpTxJp+9Pn3DZmh3ZgFvo6OwcuA7GJ4VSIdubnmJUMjyDhRT0OW/l/39t7AXEIcHgjGgNrabtmEbyMFLv6h6MYAYMvtJ8//aZZysKF9owR8IMc8srW/5jqCbK46xWe8ZYoyUPUDITXL4xr4cKs70wGhOPX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j4bSxBMM; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j4bSxBMM"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xSM8fF4olsPKw6JgFp2JaUc5wkSnl2iYTe4p6ufJ+ds=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789347936; v=1; x=1789952736;
 b=j4bSxBMMMJxcFRlh6uoubNN97JwS+XHi5vZhD2Hn9QG0nY8Z/9GxYK4GgfYG1l+eQdBYphPU
 4Npo+XPFA5sTR4nwEqJjozR0yfxtsfx0s13DRFRd/+6fNAWYDsiCzVOTLMCqhx7qCQeAFQ8owZC
 k6hjU7QREzgbk2mvkTg53Jj8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b4b117e4fe94f31e;
	Mon, 14 Sep 2026 01:05:31 +0000
X-Mizu-Trace-ID: b4b117e4fe94f31e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 14 Sep 2026 09:05:25 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <aqdIVYlMtg4xI4zq@fedora>
References: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
 <aqN2K7rAm-S6QI86@fedora>
 <20260911160812.3aaed4f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911160812.3aaed4f9@kernel.org>

On Fri, Sep 11, 2026 at 04:08:12PM -0700, Jakub Kicinski wrote:
> On Fri, 11 Sep 2026 11:31:55 +0800 Hangbin Liu wrote:
> > Hi everyone,
> > 
> > This patch is a bit too long for review, and maybe cause conflicts for
> > stable backports. I plan to split it into small frags. But there are 2
> > ways to split it.
> > 
> > 1. Split based on the test name. e.g. srv6 part, fib part, test_* part, and
> >    others.
> > 2. Split based on the changes. e.g. group the tests that using exactly same
> >    log_test functions into one patch.
> > 
> > Does anyone has any suggestion?
> 
> I don't think it makes sense to split this.

Thanks for the feedback. Then I will keep the changes in same patch.

Regards
Hangbin
