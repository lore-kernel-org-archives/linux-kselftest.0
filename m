Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5363CB;
	Sat, 26 Sep 2026 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383830; cv=none; b=urOj7cbBfiw5qkJ9MCVxHO1tTZ26BMQW66JG/7M0u+pU8gVYqFRPOPefg/3y/HhuOcNkLWMrPY5K8RX5Vwpnf6c7bq+RpajbSOhXT7Q7S9xo3t+dm6NEx0eeMWcyy69GOe3gcyViuKacoCwwfL3AzaOT0fu8FTYVMZ5RvqZkfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383830; c=relaxed/simple;
	bh=gfN6DcaczUwBQba0Y1of0D3CZOVOdBYLhT6bIIiG1O8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVukSOshuxiRUZTSU1IDPs3LfeXkGmYGIasd8E4RpJqN6h5nXTqcB0oJEulG4QAyNrEv8RjUqQjRwqLlFR3yBjv6QBBV6+sp72oTm8GD79zm2sdR0vudMQACcXdoE6CoCTSUr8EjHWCGgOOGHGW/zdLSirdUWK4wvHYoHEK6sbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAMBvbW6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAMBvbW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0E71F00893;
	Sat, 26 Sep 2026 00:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790383828;
	bh=10sWEEcro21rwvUdecqjZqf0lFSRx31Gw+w34m9zwTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gAMBvbW6PVUVHLxFbe4k9rn115pKrXvxcoQ/ARntq8RXwCAwqEsYiTirvLvYAoO0+
	 /aDKaVxR3j6Eik/bPmc0rnSxptgjQ4RsEokZT32YHwTpJlWPZgxVzPea2EdqAEgrLP
	 24wWal+EHeJuNU1g63Uh3U/Ejf8lldTS7pBKqSs7XmvOD++bQzTtXSU08ikjQ9ZF2o
	 /LxWT0k29ptnXKKCo21EEBcE8BM4Fq4xtEgZTxxFQkTn+f9HzYtiHb1p9J1DazmMvt
	 PuMO6WF8Ljise9AMlm2tIW8rt23aUIvqAxVQaafyaM9w7YZ+WMk1xMeBw9L/eRjI/h
	 MNsAr9mGEk5xw==
Date: Fri, 25 Sep 2026 17:50:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: hemendranaik@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v8 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
Message-ID: <20260925175027.07e8c158@kernel.org>
In-Reply-To: <179028363994.2160803.3084881967142411218@kernel.org>
References: <20260922205924.32173-2-hemendranaik@gmail.com>
	<179028363994.2160803.3084881967142411218@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 21:00:39 +0000 netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Should Documentation/netlink/specs/tc.yaml be updated along with this?
> 
> In the spec, tc-fq-pie-xstats still lists only the nine original u32
> members. The tca-stats-app-msg sub-message still binds fq_pie to it:
> 
>       -
>         value: fq_pie
>         fixed-header: tc-fq-pie-xstats
> 
> The spec has no type member, no class-stats member, no tc-fq-pie-cl-stats
> struct and no enum for TCA_FQ_PIE_XSTATS_QDISC/CLASS.
> 
> A spec-driven (YNL) decoder will only decode the first 36 bytes of the new
> 64-byte payload. It cannot tell class records from qdisc records, and it
> never shows prob, delay, deficit, avg_dq_rate or dq_rate_estimating.
> 
> tc.yaml is still unchanged at the end of the series (after "net/sched: pie:
> correct tc_pie_xstats field documentation").

Looks legit, please check the other Low severity review comments.
