Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE3D4C77AC;
	Thu, 23 Jul 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817682; cv=none; b=A/aYrjYJEjzX9tfZYgONW+B0SkFBQm9i3J/j+/jCxnAms8ulM8r3mUzxmJgmt+I3FYCyT8pFFP1fhguhA58dXbE2GVY/9WwhR3iG2ef1Iy2XAGbRwvI2DAm6LU6+d+uhZDpvL8qXRSr2Pfk9Ixqw1ve2XycIV9kKGZNQdk2AwSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817682; c=relaxed/simple;
	bh=j3yLMFsLZpflbFk23sjEU+HBJ9chBKgVKrBfsnkACNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhvTeLS37gMBkfkC4OtTpRZE6bUYmGDTnzSHA7tji8hLSk22kmhQcBkizrRuU54Cg1h6VPS+hGAITkqw+sDpkSmk7Yw7lbpLUOtGX0G9T/BDVfRG0SUiXTGqZ7IGBRYF0RjFMr8bczAb+8cINwzdpJ1HXs/wrCvopVj7z3BqL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3B11F000E9;
	Thu, 23 Jul 2026 14:41:06 +0000 (UTC)
Message-ID: <c45460b0-86b7-410d-b631-9fa4414b46b4@kernel.org>
Date: Thu, 23 Jul 2026 08:40:52 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/3] net: nexthop: add NHA_DST_PORT for fdb
 nexthops
Content-Language: en-US
To: Jack Ma <jack4it@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-1-46e3a2dd88a3@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-1-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 7:17 PM, Jack Ma wrote:
> Commit 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries") lets a
> single inner MAC be reached through a group of remote VTEPs, with the
> kernel flow-hashing across the group members.  Each member carries its
> own remote IP, but the UDP destination port is always taken from the
> VXLAN device (vxlan->cfg.dst_port) and cannot be set per member.
> 
> Some deployments pack several receivers behind one underlay IP and tell
> them apart by UDP port, so they need a per-nexthop destination port to
> spread flows across (IP, port) tuples rather than IP alone.
> 
> Add a netlink attribute NHA_DST_PORT (__be16, mirroring NDA_PORT) that
> carries an optional UDP destination port on an fdb nexthop.  It is only
> accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
> nh_info and echoed back on dump.  The attribute is named generically
> rather than fdb-specific so it can be reused should another nexthop type
> ever need a destination port.  This patch is control-plane plumbing
> only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
> is unchanged for now.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  include/net/nexthop.h        |  2 ++
>  include/uapi/linux/nexthop.h |  3 +++
>  net/ipv4/nexthop.c           | 20 +++++++++++++++++++-
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>

