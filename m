Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB112D94AF;
	Thu,  3 Sep 2026 01:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400042; cv=none; b=Itaoix9heHERr9DOlbKP7T88KkzbN/w3qm/ksaeGQPq0ndmHTGwUX74txl8PDGwPT4m9+6JiMBAJRQ0wfH/Eb8uwW3sak4SHUkihDHeDt4zNd61rJhonDhkc9IiqdkVH5PCFdtNffFDy2M7ZSKVcSR2seBrKDaYRp1F+UPo/WyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400042; c=relaxed/simple;
	bh=ktO3+1Tov7EwwMfECSQRP6d3Af1pxD6V2fnWoWEW0JA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZCmn8ByWphEyWTxapiswULip2HhWlwIqD3cSVT4vwJZFxcixVqnVuh3BqD08Maa1lBZuVh8BVaP3U1Fo5DwLTTokZijIeqOVJ9is5JDTUV5ZJlkM0BHm99CZ3bFp06lj4G2xbRZfGPwA1foRl4tC00js6JePA/1QD5/blF3E3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De5swYGw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De5swYGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4941F000E9;
	Thu,  3 Sep 2026 01:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788400039;
	bh=xscfesyfmJUPU4hxg3U6XENxkivMVVeJFHnLprpN1/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=De5swYGwhwh/tRh55cfoOUMHR3vdfWj9zse5xzyUGsqbhY0VSFark2/nboSvMPwGY
	 cJy974EbPw7sGO3cWl9NOKsSdw5ROapxqMl/NuOJYoy22ngFxECgsZ0KYKXlE1j5aM
	 cGAzX7KQymmDCPg/ZkXmX80UJE+fw3oFR8BtM2UTS/3JGtPeHqRq0XlQ1HL8sB20ks
	 6UlKIykhXhVK+zpUncY280P+bDyrKMz/XfszjWxroj46j9KP+18FuHHHGyw80+rFA9
	 pU+N/DW62TmyufbIRNvQZQsC5O5nukG7azfA4m1/GgARVG0Ic8UlB3D7FED/6YbA2v
	 xRxVMyW/cFF4w==
Date: Wed, 2 Sep 2026 18:47:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the
 generic RX path
Message-ID: <20260902184718.64ddca2d@kernel.org>
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
> +	SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH,

This name is way too long, maybe

	SKB_DROP_REASON_TNL_CFG_MISMATCH,

or

	SKB_DROP_REASON_TNL_OPT_MISMATCH,
?
