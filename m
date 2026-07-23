Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FBC33C18B;
	Thu, 23 Jul 2026 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817884; cv=none; b=XUk+caCMmD/XPQaoQUDf+5xoCj5LEdt9f+o0ttxWc0fN/AuLhvdfQOvIT8tkJrvcsBtoiIJSQOpk+a9Kn2ImM0XGvgzDohsbeiz057nTEQmUN7zTfnPmn62seM/IcEF3qjj0UC9hdMEe6a59RRuYFqQyW6ZniqEjK/z5K7wvJSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817884; c=relaxed/simple;
	bh=lIRlM0/NAn82Ix55Z090CpPen7/V1KYAWWr3ljr0M18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+lSTfRylEZUUyNBmpw+z7fOELN3YA0UJ3ew23omyA/qiW0cQ+hAiT7mi7SH+gvp3djZfcGLFH40uzrNHCSnsfcMoT5bRun9hOZTdRYMGjv/TL7I4/grYWRYbrAeaTVV6iQU1kDVKuXw6JQOWWille1iDVkor/pteDfdU57ewWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251E81F000E9;
	Thu, 23 Jul 2026 14:44:43 +0000 (UTC)
Message-ID: <fabd753c-0159-4b70-8009-d14e5b3c6710@kernel.org>
Date: Thu, 23 Jul 2026 08:44:24 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/3] selftests: net: add coverage for fdb
 nexthop dst_port
Content-Language: en-US
To: Jack Ma <jack4it@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-3-46e3a2dd88a3@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-3-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 7:17 PM, Jack Ma wrote:
> Add coverage for the new per-nexthop VXLAN destination port
> (NHA_DST_PORT).
> 
> In fib_nexthops.sh, new ipv4_fdb_port_fcnal() and ipv6_fdb_port_fcnal()
> tests check that a dst_port is accepted on an fdb nexthop that has a
> gateway and echoed back on dump, that it is rejected without a gateway
> and rejected when zero, that a group may hold legs that differ only in
> UDP port, and that a portless fdb nexthop omits the attribute.  The
> tests SKIP when iproute2 lacks the "dst_port" keyword.
> 
> In test_vxlan_nh.sh, basic_tx_common() gains a second fdb nexthop group
> whose nexthop carries a destination port that differs from the VXLAN
> device default, plus a flower filter keyed on that port, to confirm the
> per-nexthop port is used on the wire.  The test now requires an iproute2
> with dst_port support.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  tools/testing/selftests/net/fib_nexthops.sh  | 81 ++++++++++++++++++++++++++++
>  tools/testing/selftests/net/test_vxlan_nh.sh | 34 +++++++++++-
>  2 files changed, 113 insertions(+), 2 deletions(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>


