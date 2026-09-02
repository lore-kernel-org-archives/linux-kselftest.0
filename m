Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58CA2AD03
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314715; cv=none; b=RJGDXgQq4nIjxmHhRUIp6hFr+xxXhiyhzpe0qYaI69K5jYsNh7KOxTt8IKvrD1DdsTXo8K61+JdhoMyBwiH4+pzLhQ/v4Hk2Iz13M+m9P4xRiX3XriIYAk3vx3B95wdOpF2lgPEJhJee1nTut7tZ5DSyiQbvSOoPYDvs1SyxI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314715; c=relaxed/simple;
	bh=Wlz/5VXkhApLlA9u9ijOUa86PSR5+pOptPOZ9KM254c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsCmC7M7qaIhgnKC0S0bN5lj5qCkaZlxZK+XBofSIf8m0rLRMQASoi+dOe5nY1zHR5PjNgc7+KdSxBjNy0u0FejkQ9jvJegHSNsv6ktbT2aFsAyqRkblrF8dPV1Mzx+bEwJFlhLHNtqRf8u5xixLmh9mKKn2KpuxZucCuauKdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u7lmO78u; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u7lmO78u"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Wlz/5VXkhApLlA9u9ijOUa86PSR5+pOptPOZ9KM254c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788314708; v=1; x=1788919508;
 b=u7lmO78ucruYdWv3XoBwRHm2zzwC9LRJ4ykhR3LPIS9NAvflRZnLq/OFs3a0szPg4U9XXl72
 IvL5MHJSXXHxvZuqOue/UZWQRAeyuJLmDfhFoP5zQedUtHrVi1v2Qvpm5P9wB6mmt0KGnA94wtf
 VdpSabC64t8Sg/sYlXWICSJM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44a516d30585d350;
	Wed, 02 Sep 2026 02:04:58 +0000
X-Mizu-Trace-ID: 44a516d30585d350
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 10:04:43 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 2/2] selftests: netdevsim: add speed testing
Message-ID: <apeEO4xDjja7yd5U@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
 <20260831150642.68f28691@kernel.org>
 <apZzvvEQPNHTT26c@fedora>
 <20260901080641.45d02005@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901080641.45d02005@kernel.org>

On Tue, Sep 01, 2026 at 08:06:41AM -0700, Jakub Kicinski wrote:
> On Tue, 1 Sep 2026 14:42:06 +0800 Hangbin Liu wrote:
> > On Mon, Aug 31, 2026 at 03:06:42PM -0700, Jakub Kicinski wrote:
> > > On Mon, 31 Aug 2026 11:28:11 +0800 Hangbin Liu wrote:  
> > > > Add a script for netdevsim speed test. Make sure the speed and duplex
> > > > could be changed. And the speed can't be larger than the max speed.  
> > > 
> > > nak, this is not a meaningful test  
> > 
> > OK, I thought we should add selftests for new features. And there are
> > netdevsim ethtool tests like ethtool-pause.sh. Since you think this test
> > is meaningless. I will drop it in next version.
> 
> to be clear - the entire patch set, not just the test.

OK... Thank you for the clarification. I will drop this patch set.

Regards
Hangbin
