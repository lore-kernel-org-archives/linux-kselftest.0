Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C8448BAD;
	Thu, 23 Jul 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817695; cv=none; b=n/NgJDcOqadaHscscbomhISrfefIKLms9fDhIP68pQWuweUUWaMeyZdnvWUgqZ2x2QH5RMK+0rsqhJoQB7jz8YuAmA+Lvr4jKZC8UeU8ATVEIhHfleMcxXo6irke2h1XBGH4H6WGNGAPuxZn++3V3zZ1op6miu+rMoRM5yX29nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817695; c=relaxed/simple;
	bh=CcjJO3dvhwX1PWxpRqmYmCouSrIzBgvsF8nAijboAgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWBcRKgDwMX4trIV0R+rR0ZDj0BZ0SbM5/Ms7YQXKH+8jJ4LNhnRvtlynrJXSN+lcli+KnjeaxLH6Sjd1PXBv9s/BNdttI010ONHL1kKhkMKLPZYqhs6nQOQqdrgAIyF8DlLoLsGnJpYLO+6VJ+cyBM0ZwNorfmTWw6jUoirzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3351F00A3A;
	Thu, 23 Jul 2026 14:41:30 +0000 (UTC)
Message-ID: <991b7602-fd1c-4d17-aee2-bb60650cdbed@kernel.org>
Date: Thu, 23 Jul 2026 08:41:30 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/3] vxlan: honor per-nexthop fdb destination
 port
Content-Language: en-US
To: Jack Ma <jack4it@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-2-46e3a2dd88a3@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-2-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 7:17 PM, Jack Ma wrote:
> When an fdb entry points at a nexthop group, vxlan_fdb_nh_path_select()
> resolves the selected leg's remote IP but leaves the UDP destination port
> at the device default (vxlan->cfg.dst_port).
> 
> Extend nexthop_path_fdb_result() to also return the selected nexthop's
> NHA_DST_PORT (0 when unset) and have vxlan_fdb_nh_path_select() store it
> in rdst->remote_port.  vxlan_xmit_one() already prefers rdst->remote_port
> when non-zero and falls back to the device port otherwise, so nexthops
> without a port are unaffected.
> 
> This lets one fdb nexthop group load-balance a flow across legs that
> share an underlay IP but differ in UDP destination port.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  include/net/nexthop.h | 4 +++-
>  include/net/vxlan.h   | 5 ++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>


