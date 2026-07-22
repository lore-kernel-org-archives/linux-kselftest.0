Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C4D470E81;
	Wed, 22 Jul 2026 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748997; cv=none; b=NShILm5KMpaFc5PTZ6EKNMxgogIhgPIQxOv1IK7RWf1iMlTZypuTbHkYsV9BAzb/fzzN8LjlGNP9U/Txv7UdIYs9Nbs1QSUo0vndRSIWN7CZyEHRR7HtK7+jXwWu0PPXBlwDEkHnSrwxxsgzH2t2gh8Hpf8rzgtztycXxGSS8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748997; c=relaxed/simple;
	bh=jlF+vCBoAlCmeGlgFSc6OkjYL/7WgdlsNs5KgKBqT8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z58tVWYuS+mI3L3lZEw2Bcrw6jwELrtDBul7QftQ3K+YKQeMNE7PZJpe1shYEPQ0wZjRsWGvzPU+sX5ahg1sQC2K26JFZ9RvEs22iFZwuIR5mip88V/R6xTQcYgnQgBddgwoERuTxoWSJjqhc+dVSyZnp2JITvb5eHUTMZ/R8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gufLkL/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gufLkL/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195C01F000E9;
	Wed, 22 Jul 2026 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748995;
	bh=kIZGWeSUbmnp52+auLFMSKFWUog47SeIfvsOQwlBJbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gufLkL/7bu55mTAVunJt8Bvo/k1kv5RXR02oEiWlZEZ2spzoKe7kVJ+ielNiEmxIX
	 sYoIT8a8ZSDFdNCiLEzjY/mrhe3rF53jAK5VBFbDBnuqUD6hlpaVVR6/jOIHfmj5EP
	 nDFrPnEbP6gO74ccYX+8DKiacQupE3m5QQbORpNIr9/A2/mwB+npKNq/WGwhXUItAv
	 LSquOZ+ANPK0/+jP7aWRs7HbdyI8avobC2kWfCeRHWG38cifRldTnsqgQRMnRjuxT4
	 DINW+Xd2u6/X1Sdln6CbIvEHOqL1JkRG9vo8Q3Y0enznAGrS6/XImZVpfO+JqEnu3Y
	 H3kkA9a62NlHw==
Date: Wed, 22 Jul 2026 12:36:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/net: use ARRAY_SIZE macro in skf_net_off.c
Message-ID: <20260722123634.65ef3704@kernel.org>
In-Reply-To: <20260717062502.1016-1-yanlonglong@kylinos.cn>
References: <20260717062502.1016-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 14:25:02 +0800 longlong yan wrote:
> The ARRAY_SIZE macro is more compact and more formal in linux source.
> 
> Fixes: fcd7132cb1f9 ("selftests/net: test sk_filter support for SKF_NET_OFF on frags")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Waste of time. Please don't send any more networking patches in this
release.
