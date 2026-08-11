Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3B448BBB;
	Tue, 11 Aug 2026 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458413; cv=none; b=QL6EsG4FDY6GBYa8Wc5TJBSU+UGB/RBbg21lCw5tiBifsnYzOxLRB/+f4HTEk7Kx82zPCRsoYX1REG4vP6+ds+hwNahv5FtmojfVsKIdsydezm5vsXqIoYvt/UIClu4X6y69IlxnXQAM2hrPmYYXcihPfCCm/IlEi130IKccoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458413; c=relaxed/simple;
	bh=Ue8zue8fhHadLkzART9NdhJHTb1WxMohxR7tgvjXXS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uM/pMZucOud9Va6H5hWMMW6U6yt/dmsJvK7tbs5vz0MWxIN10Dnlv9Um0Y9O6lXXpO++t9EVSHtHjuUWBXKnRTKglmG3GVV30935HcMcEDoy2w059xsoDdZITmpjYJuPrx89qEjuCFxUuVNCDqHBWjhCb+YzTY8UBItd27VjAxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EN8nWxDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN8nWxDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791CD1F000E9;
	Tue, 11 Aug 2026 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786458408;
	bh=Jkaoy25yfeQmT1UwUUgywiq4xtGMPE2KHeNj2B4MqLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EN8nWxDwwq+3wP/wh8yscDbKWKUAMT+Zm5oyCRSqNlgTDwSzuQrIhVNIN2VVvsVMJ
	 CAD1gY8ilgPze7S/NPztJO7JYV5VPRQh/Tnd8pv/I/TLVoPPfTYMLzeA6yaw4qxfKt
	 fV8vCGQ0308ojkWpxAlc57KpXrqM4j7y1SgufUpD7rPig5WDfKgqErNoQz3ldVKrxv
	 qUXKnK1PUTQ01bSRdgCg68lFEcz/iJFitIcXBNBILyvIC4WwqAhcQ2FdVHuOAW3p1F
	 HqI00fwSHOh7/CErHWBgLiHVUwkjVqU1su49QwzO6dS3d37Aacs2DnpKzcbJVmOzVr
	 HBQo0sHwdep9A==
Message-ID: <a47b70d8-47e7-48e3-b0a2-331f38b665a7@kernel.org>
Date: Tue, 11 Aug 2026 08:26:47 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: let ethtool stats settle
 before reading
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, andrew@lunn.ch, shuah@kernel.org,
 idosch@nvidia.com, ioana.ciornei@nxp.com, petrm@nvidia.com,
 linux-kselftest@vger.kernel.org
References: <20260808163653.2460381-1-kuba@kernel.org>
 <20260808163653.2460381-2-kuba@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260808163653.2460381-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/26 10:36 AM, Jakub Kicinski wrote:
> Some devices refresh the statistics exposed via ethtool only
> periodically, every stats-block-usecs (as reported by ethtool -c).
> ethtool_std_stats and ethtool_rmon sample the counters immediately
> after generating traffic, so on such devices they can read stale
> values and fail with a delta short of the packets just sent.
> 
> Add a hw_stats_settle() helper which sleeps for 1.25x the configured
> stats-block-usecs (defaulting to 20ms when the device reports no, or
> a zero, period). Use it for ethtool std stats and RMON.
> The 1.25x/20msec heuristic matches what the Python tests do.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: andrew@lunn.ch
> CC: shuah@kernel.org
> CC: dsahern@kernel.org
> CC: idosch@nvidia.com
> CC: ioana.ciornei@nxp.com
> CC: petrm@nvidia.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../selftests/drivers/net/hw/ethtool_rmon.sh      |  2 ++
>  .../selftests/drivers/net/hw/ethtool_std_stats.sh |  2 ++
>  tools/testing/selftests/net/forwarding/lib.sh     | 15 +++++++++++++++
>  3 files changed, 19 insertions(+)
> 


Reviewed-by: David Ahern <dsahern@kernel.org>

