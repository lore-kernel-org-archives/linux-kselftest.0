Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546D3254BB;
	Thu,  3 Sep 2026 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400059; cv=none; b=Tpx0C2PEHYTTZq50YH/Njkme+ZLD4YWF1lIJpY2kmOFqhO6xpk4nkpzJueyqbkBx7GX/RoHh6Plkt2dO7pJmkksnFQPiBZVk+18e3IZN2sRcMhh7Alofvc5Wxj7nI6w/8DLMNt33rBa63T89UnHd33BbqZqHTK+QxZxsI7Rxs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400059; c=relaxed/simple;
	bh=Z2vdgSWItcetD74S6X9ZsV6CPy0kPzH1zCMH388VmWs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OC5f6oLTBMQTbt03dSTU32fc495R0L/2OnaJ083V4mZxeGPJjAv35hw4rMBde7DYQflletk2Kpu1ZMn5hRcjWn+F8WnuEd0ymcpG0ucSwXhN/HR++fswcS0jMVWvovy5w3jXMk2oWU9ldtmhnqpUWhlRb62gnE0B2hZgRwq4P0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBsuTlba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBsuTlba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F31F000E9;
	Thu,  3 Sep 2026 01:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788400051;
	bh=hgosZq1frgpNB/Tk6pRLvAQCSSRGEoSPrEg6i1jaqys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iBsuTlbaXTIxoJRqzWYMk99BgEoiK4cyhWubvQ+rLvm+4hai3znt6mbVZ0Cn8+NCJ
	 oy9hjbO/o2Tmj/ibjEEbCtsWYIg+hC0z75ZDhqsvgPVAlfCgHK9izdMY8cypk2i8AX
	 LUi8VjtpMPzL8mlhG8C3rVpKNDRgCWlKxNxfEEAOlcPwfON8OMdaWinHDv/eZNfTy2
	 kgk5dkldNh0uVuTQUgGtojh+HccQK88b3WKYgk0z5EMkSmaPyUKVOGZOYFEO2e67E3
	 i+l13LGx+IuHnJFvbDvuvRtbjIX/6Ohd4AcfPVxeOjWoA2L7czPNzscyrkOuC/zOyX
	 AZWAQu+4BIzlQ==
Date: Wed, 2 Sep 2026 18:47:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the
 generic RX path
Message-ID: <20260902184730.304d2d34@kernel.org>
In-Reply-To: <20260831215137.549324-2-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
	<20260831215137.549324-2-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 00:51:27 +0300 Anton Danilov wrote:
>  	const struct iphdr *iph = ip_hdr(skb);
> +	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
>  	int nh, err;

reverse xmas tree
