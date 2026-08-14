Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D364379EF5;
	Fri, 14 Aug 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735256; cv=none; b=P9f8rw9/DB1bTvWSVXtjaiALe8i+xsVeCQqzO15HOdCCAsqGYqAJ7QNyhAHx53EQDX6C/U7EfSfIhs1iCOFPJkX6dWlecZsfZURtzioFVOVmbhGbmTNRrLDSjUZitU/ve8Tc/bgaIzWfxaaLWSgP5Thzwk+D4WQU5pq3SoKyhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735256; c=relaxed/simple;
	bh=YNgCyGkPACSwj8j7pWmhd6pzDErbe0eZ8rpAOgDNFXg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NByDGPIB94+2WFFqx+/JQa7W8uyPGza0ATzkkxsIG3d/9GxO6OicKy7gi1ycu/Vj3Ho8al3jx5HplVR/X7vDgsYi2f1O5aRSQ5uuN3e0NLiT/N+m3qUPTswAcs5QEvJjgFhOd+r508d9MmMjDYWE8wqBYZrXaCurdqQEr94Lp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDCd5SN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDCd5SN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A571F000E9;
	Fri, 14 Aug 2026 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786735253;
	bh=tWP2rYPUHpBbyiRVcfJYoIPFTktxR+SCIp0f69f9IXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NDCd5SN5t4kFVLVKtqhPZC2qj7qXuYx0lc0cjvzgEHHTNhIM2Bg6fjQpZ3LewHJ9a
	 WNlSD2TP/0tkISxi+q0Y2Bfuw0skJ5JibD845pJp62jzNrGqsYl1F698+ok2bVTHov
	 h5xFYqlZsOYZTfwnAGTxEZLTifD87e2c+wNsxd359Zvb/FvEDaD9vawWeEz/MaWni9
	 7oa5M8v+G/42wPCNq8APzYLFZ5Zq9VzRzjztK67ImDU0s8I/wncUjRGKFK/d1TIYWj
	 KdtcuwCpSLSO8ZcUPcO8Nv8kcDjONxjLW+2WlU+LAl4PD14M+8bvNLocMaNrzKFhcQ
	 yveTRlvC4+7/g==
Date: Fri, 14 Aug 2026 12:20:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, Tariq Toukan
 <tariqt@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next] selftests: drv-net: bump the timeout to 15min
Message-ID: <20260814122052.0be7243e@kernel.org>
In-Reply-To: <fdb9ff70-07d9-4966-a893-11dd7c338e66@nvidia.com>
References: <20260812171302.1888667-1-kuba@kernel.org>
	<fdb9ff70-07d9-4966-a893-11dd7c338e66@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 11:04:15 +0300 Nimrod Oren wrote:
>     NIPA RUNNER TIMEOUT 600 sec (graceful stop)

Blah! Well spotted, thanks.
I thought I fixed that but turns out that's not the timeout I thought :/
Hopefully fixed it for good now (it's an internal runner timeout, I set
to 20min). Let's see.
