Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B6314B63
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939270; cv=none; b=OjH+9n9lagW7nx0aTiTqkpyHL3Y/TtsyaTafJCg2Jq3DVuhT5kJoUIybs0oWa17bG3fW0LtumN7Ud6eKFrURTgb6aLgX6Q1FPqq+xZILz8ZjLCrMJU94APs7Ezz2s8ujIqKcRKnpQ6wfh+He8skSbdOOXCEAlaEYZbkFUG0O5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939270; c=relaxed/simple;
	bh=pflyARrIC1PkECp+vY/Xn1BVY0ujTQ/JDr52eHmBJF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxFpjlEetJ1CtTy9icW7oiZhUN2Ot/RZDx2gpNmEabdCdSpwHyd+i7cI9mekilhlcEqwkOq1MRbt/zeTjVvUImZyW+Yn45wp0zkxHte7FpdTmTL1/qwV+7g6OE7x/u3eHTcuCni9B1EXqlP/di7RxNNizxcuikermGZP/YQ0SRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bP5Y1uth; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bP5Y1uth"
Message-ID: <75aafe76-fa22-4985-b277-fb51debf8852@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782939256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTSQsuTdzdnUYTD7BTPntQLkPU6l8HPheSNnHeBOHHQ=;
	b=bP5Y1uth5XwlVbKmRMA1yvUclZCCZcHoAQdvdFQRqGGeW3y0luZx3MAiC8IP9y14Z/U4gQ
	bpnlxzMOMOJjiyVRS/Tlp3I0aOLPSj8XDkLexvIfGXcrXvugY/SLz00wwQyddbRkT60fF7
	msh/WM6xC58NsXos//1rGdxe5gS/big=
Date: Wed, 1 Jul 2026 21:54:13 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/3] net: ipv4: report multicast group user count
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260630110207.37841-1-sigefriedhyy@gmail.com>
 <20260630110207.37841-2-sigefriedhyy@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260630110207.37841-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 30/06/2026 12:02, Yuyang Huang wrote:
> RTM_GETMULTICAST has been part of the rtnetlink ABI for a long time
> and already reports IPv4 multicast group membership through
> IFA_MULTICAST and IFA_CACHEINFO. It does not report how many consumers
> hold each membership, so userspace still has to parse /proc/net/igmp to
> get the Users column.
> 
> Add IFA_MC_USERS as a u32 attribute carrying ip_mc_list::users in
> RTM_GETMULTICAST replies and entry-lifecycle notifications.
> 
> This gives iproute2 enough information to migrate the IPv4 part of
> "ip maddr show" from procfs parsing to rtnetlink.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>   Documentation/netlink/specs/rt-addr.yaml | 4 ++++
>   include/uapi/linux/if_addr.h             | 1 +
>   net/ipv4/igmp.c                          | 2 ++
>   3 files changed, 7 insertions(+)
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
