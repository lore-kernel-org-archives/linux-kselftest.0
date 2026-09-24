Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE743D47A7;
	Thu, 24 Sep 2026 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218408; cv=none; b=Bo29p2GRceOdzvAvvxHzVIyZ0jin/IFSspf9akcLVpWYUZltQQuvFP/0519pHtSNljEu5KpXRiL9kZZXWwIgMY4KM3O1F17I241tVrB5Nj34y9OEbem5go94nwzwBJZKu+61X+Mhop82HZmlvrJ48WNdkzWHsN2xmFDl9GWIo7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218408; c=relaxed/simple;
	bh=jo8UbyN7KAelRZUW2CpZwL0s8fAElqq5/Ly7gu3XBgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I9zTUqn1erWQ5ibBbemOEyp49qx7HOjti5ozNDSymtZr4NZiRiW5EXJ7TQ3UdbnSM7cxCIU86pgqRmAT5MjOxzDF8CIeoh6BUh2dDzl3XP0PZe1Njk8d7UBZXYYkGO+4YYfZbZMmlAeZuEZ0SXInkJa4QMsgcuwY9XaQXNJo3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chh+0a9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chh+0a9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDF31F000FF;
	Thu, 24 Sep 2026 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790218404;
	bh=9cDGqhD2ZmnIg1cyOJLQzMZkadMmoMLAxqDfDX2ajLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=chh+0a9fTr9QNvbJ2jbvjo33H9qI+vh8D7FSPYIwzwkPakBP3yRE829hXDe+sP6iw
	 UzRy1V/HlN7yIG4+m5K9IEK0TPVsSO0Eu53vXxEruSwpjH/Auy/3TwLMasMEKeAvuC
	 vwVWSnLnhcJuJDlhEtFj9Lp7XLudMMs9mb6aVUfTH+u+kRgrwWx6yRNEyApHaeieHr
	 82egM7s8RAlBmDbW0BSZgxQ4WaRP51jfbsscODWzVZ4JCwcSY9E+CY3/eyS1Juy7lM
	 oeH9LHOJ/SkgiYsvBe1zDYrvAkBC8aDxj/cYEMDWCZnYX9RxWb6dIH5JRhi76lF9MR
	 ubmqrCvmAEVlg==
Date: Wed, 23 Sep 2026 19:53:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>, Victor Nogueira
 <victor@mojatatu.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 shuah@kernel.org, tahiliani@nitk.edu.in, vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20260923195323.5413f128@kernel.org>
In-Reply-To: <20260923040136.13432-1-hemendranaik@gmail.com>
References: <20260922180458.5c54ebb8@kernel.org>
	<20260923040136.13432-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 09:31:36 +0530 Hemendra M. Naik wrote:
> Hi Jakub,
> 
> We have vendored the temporary UAPI header changes into the GitHub 
> development branch (https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/)
> as requested, so it should now build standalone in your CI pipeline. 
> 
> Please note that this header sync commit is not present in the official 
> iproute2 patch submitted to the mailing list 
> (https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@gmail.com/). 
> It was added to the GitHub branch strictly for validation and testing purposes.

Thanks!

Victor, could you pull this into tdc as well?
