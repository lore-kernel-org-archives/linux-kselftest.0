Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767442;
	b=0jbbKa6g1t8BD/LnRg8P9MKnIX6PiYO/oJsNYxum69WzRaomjyiH90gruOn2jQ/gbkDN
	 lFqFmJslgu9j4VDjk8NozjdfLZPM+98r9uODfJr96M8NYQ3du4n69BFio6GDwBo0SwQvK
	 GjxqwxOgjcG4XmXGzg1VvjLPYzwvsjcsVn31xk1OMzXu5gCGhsEK+2M+KqZCAH21pB6N6
	 qeUfgWbMJ+3+se3+xplOLwH1Dh8buuk791OMb3lJ8ZYAGii49qRbXvHf8oPm70zY6YFGW
	 9s3akYb20ldqGyi5uw9eqjKF4dnz26m0PCD2zHlY690gGcRI0LI2tymKdAUxNTdYdTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767442;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=0lwMOiNkthhctaKLDDOIKiUMr88TjVYuo1oUG7xr05Q=;
	b=vTcaWNj5Xazf0U6vakZPuJ1cZi6XDeGPTA3msMWlEla9HXTRY3YYwaSoPAfpHGYX2K7x
	 C3u9IJGNF21+sKQOT6xSLrxAhfBryXP6/Orv5SzzDGjPsDKLq0vfVDH601zQlPlSd8yra
	 S3oduMUOMtv7rHKZaeQWIVKOBt8J+m/ARvsufu3WPdk/E2oCUteEmCBVq4KNQzfvrnIlg
	 vRvhKUiOLY+GJjrLxzdoCjpz1zYf87WlvPMLwB0geuDyw/UkjnksT7+XZ8aU1pYuCSoBH
	 PMHoC7b+aoro5Ksgm/4V0WaIkiOmUBanLoUXWfZaZNRuQt6ar2E7lGSPbc26q+iKXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8265606A31D;
	Fri, 23 Oct 2026 14:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8265606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 81EF440EB5;
	Fri, 23 Oct 2026 16:57:18 +0200 (CEST)
Date: Fri, 23 Oct 2026 16:57:16 +0200
From: Gabriel Goller <g.goller@proxmox.com>
To: Hannes Laimer <h.laimer@proxmox.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] vxlan: keep reserved_bits on changelink
Message-ID: <att1fackTBBZxPgy@luna.proxmox.com>
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
User-Agent: NeoMutt/20260504
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1792767437956

On 23.10.2026 13:14, Hannes Laimer wrote:
> Currently reserved_bits are reset on every changelink. This leads to
> packets using extensions that were enabled on creation being dropped
> after a changelink. The first commit describes the problem and
> solution in more detail and the second just adds a selftest for this.
> 
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>

Gave it a quick spin in a vng instance, consider:

Tested-by: Gabriel Goller <g.goller@proxmox.com>
Reviewed-by: Gabriel Goller <g.goller@proxmox.com>

> ---
> Hannes Laimer (2):
>       vxlan: keep reserved_bits across changelink
>       selftests: forwarding: vxlan_reserved: add gbp changelink test
> 
>  drivers/net/vxlan/vxlan_core.c                           |  2 +-
>  tools/testing/selftests/net/forwarding/vxlan_reserved.sh | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261023-b4-vxlan-changelink-gbp-de5e81eed8d1
> 
> Best regards,
> --  
> Hannes Laimer <h.laimer@proxmox.com>

