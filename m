Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87442340A49;
	Mon, 23 Feb 2026 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871944; cv=none; b=IS+i3qzCAL0LZs2wbI6itDYCm33pDr0o7qo119FRUGoxM6K2eJgJOLwBv+BahckkPkp90TMVPMY6NHuK02ixSgjQaBCME0Eruuk5p5NWuxXdzwj44Bkmnii0AGiRwjrtMd7sBfHLrrjR1PiIf4FVpLLTwDFJijk+ORAq5hR/9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871944; c=relaxed/simple;
	bh=E0A4Jf6biMpdNqt20TPx2NqRcBGOxlwGa8WN69YcilY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQtv32ZibJ3+xolDAyyyxx9sqZ71RZ0xKxSLvqPUrcb+4h2EDLog0VGTx6qbPVfEWCfBuCgtzwgY3AX7K2K7jfAljUTFEgImBS0Lgpr3AwIg2EX5lygPlING3DRJc7pNZ4bxwHB2Zg2Wtkp3F2z9uBaBtW1u2Bvmk6KPJcj93Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaThNmC7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaThNmC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A844BC116C6;
	Mon, 23 Feb 2026 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771871944;
	bh=E0A4Jf6biMpdNqt20TPx2NqRcBGOxlwGa8WN69YcilY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EaThNmC7MLNo89kA7r3CUMf6yhlXZzcuohbvltdL3pAAKBRsTqs6+LR1ugt8mIJ6j
	 SXBsnYmoUCRUs2QTw0d87kTQGmDRJWp6niFu8y59DNeSS0ONbVi5TsiOgcAZTDR6qF
	 fD4K9BGXzTjjCoVp2TDWG7dgpa9hAqN6F8EmagPkO/GFfR71ykmBLWI1GqdDGca/DF
	 +++jRTRyHAisvtVIG8N54AtnLFrn8Xu20Vb3T7nTDYtA04UY36u4Z7gOzsC0M0Knf6
	 twlKZU0n1fhwEBNszAmW2bS/iWsaP4tZL45vSI3wY6k7qaY7fFG6bBciMphNqdOf65
	 WbrgIiki1dtaQ==
Date: Mon, 23 Feb 2026 10:39:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org
Subject: Re: [PATCH net-next] selftests: net: add ipv6 RA route to ECMP
 merge test
Message-ID: <20260223103902.4c06e85d@kernel.org>
In-Reply-To: <20260223150950.31904-1-fmancera@suse.de>
References: <20260223150950.31904-1-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Feb 2026 16:09:50 +0100 Fernando Fernandez Mancera wrote:
> +	# Prepare for RA route with gateway
> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra_rt_info_max_plen=64

This fails for us:

# 95.85 [+2.11]     TEST: ipv6 promote RA route to static                               [ OK ]
# 95.85 [+0.01] sysctl: cannot stat /proc/sys/net/ipv6/conf/veth1/accept_ra_rt_info_max_plen: No such file or directory
not ok 1 selftests: net: fib_tests.sh # exit=1

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/531161/10-fib-tests-sh/stdout
-- 
pw-bot: cr
