Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA5353EEB;
	Wed, 22 Jul 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682327; cv=none; b=riCDzexiPhm9dnSZ7kjnpDrJk4OcinD0n8mFLzGrfw6PQxpcHMrK6mny5Qbwbo+Cf/7EKP05jRyD9R00hsmK9/lE/wRwdFgXIurBZk4m/n/SMxKAQjFDqi7Vf6eYHUG35aFeuGdIz2e+qUO+WDYLOmb/2XmCZBbTn4T2Uj+OU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682327; c=relaxed/simple;
	bh=kxWvSzVcUnsPJTrDKz0TDkW2QgL/4/Bp5UDmfGNogVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B//+WaKtBPLfFoUHXcVn6mcA5ZCBxfZt1hQ8zyYLvqhRWo6TbODmkVIJeswODPfVflEY5wzMt/loPeBXxsKxQ+WygIMQvMmSe19LmlQ7ax/c+rBTqGq/0pKzBK/Fif+wvqyj2vayUVpBs2+gdaSNaTM2KCpGMHcqixQsZ7fEyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvtY/pFv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvtY/pFv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0801F000E9;
	Wed, 22 Jul 2026 01:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784682326;
	bh=kxWvSzVcUnsPJTrDKz0TDkW2QgL/4/Bp5UDmfGNogVY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NvtY/pFvhYwcmEVJsgQLpcxfunpcSVEmsIgr7rVhe8nTci2Jja2ffFDxkDuB3yQW8
	 QmERn+lQ1YzXOVFYw4cO89HVpwABSVW5SNsegBJZLybqloJXJfviM8mrUAVYfPm9Js
	 q2uQHcPT1d+k9ILha1PRn22+0/154s3tquYNiQMU6bHwlRJd4mV96LDF7nSxbKdaDk
	 uJGt9vvHiFsxYrW/6nAyU8nYpi0447atadd3eDrgRiaPaU1v74RdzDIKFKPXJPmwK/
	 LIXxFIoQ7tvGpV8/vPvRkDjEApDqoZUsMOGfQGSCashwdvtNeu6hPqpGBuNRmjDPFT
	 yyXqEcMouxTiA==
Date: Tue, 21 Jul 2026 18:05:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] net: nexthop: per-nexthop UDP dst port
 for fdb (VXLAN) nexthops
Message-ID: <20260721180525.197d9a47@kernel.org>
In-Reply-To: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 22:29:49 +0000 Jack Ma wrote:
> A matching iproute2 change (the `ip nexthop ... fdb port N` keyword) is posted
> separately to the iproute2 list.

Where is that?
