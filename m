Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F4D2EA73D;
	Sat, 13 Jun 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781367808; cv=none; b=Ho0z3neQx+tdRE+eU9xcD1hNzVg61+2SfgAfHlg3OOdelUX9ItpkTSUaV4WtXUCgyjBHF1pm1jLflabvn028GKkZ0lIoykyDIju2Bxl1by5d8HGmUSjXRO1JyXEZgS2zRqSZTPobzSlCOT2o0vmeP8RUTJRCzdzTBC0N1Pk4/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781367808; c=relaxed/simple;
	bh=ByqZdMR/5WyvyL12Y4HS3kvzcraQ4HFRtEgf2pzJt1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASOtUC/YFseJQZfeVJWGpP0eGpMyCw1iPqYk81Uew4dAzb1IYaNpfyWFSdiHsr62JWQerT2iAkR4shV2Jn8EBGTqML9jP8AX8JwSnWgqIcyXvGeqR0y4flf74IEnLZXnURpfvFMNCGC7+R8PkaUBT2IcW4o8eXYO2vrdyPSRkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnxKrZ1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnxKrZ1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A4E1F000E9;
	Sat, 13 Jun 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781367807;
	bh=8L2EOix+XLbzjEmmLbO6ehfNIZrFhGz9IlY3mcLL6LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dnxKrZ1P5q5UZ6zt5Nvs/4TCGcP8yHWWFLK/j/5h7545D9gB6mtxCw5co8LC0ga7+
	 +/KFloOiAtSbeH7ymKQ6dsRxn18rZeu36LZ0/jUU5YzX7y7zqV68sXpuSg7KpQGZbD
	 04+9hxv1TuQ9Y6Y5czK1MyF2TjS2lhT0MhBW8sVuabNTJKgaciUIFgCXxELnFrF1yT
	 6y7z6BUKPVTu4q90wSAr0d++vp2x9gBpRiaIX9/Kk9lQXYaLsj5K83b1fyjDOicF+G
	 tq1LnJgSa7QpMKTKh5Rti4y0mikJ/aAj3ySHNCOq01Utvzx75zxV1O1NHwF0hDBhJe
	 +0yoqD3hmPN5g==
Date: Sat, 13 Jun 2026 09:23:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Laika Price <laikabcprice@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] ip_tunnel: fix PMTU ICMP reply routing
Message-ID: <20260613092321.402921e7@kernel.org>
In-Reply-To: <CAL=tPgjhj0+8voK40ZPdsKyQ0Pn4vwnSg-JVqRK3qRSXLLB4Kw@mail.gmail.com>
References: <20260613-master-v2-0-061b70fd45dd@gmail.com>
	<CAL=tPgjhj0+8voK40ZPdsKyQ0Pn4vwnSg-JVqRK3qRSXLLB4Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Jun 2026 16:38:27 +0100 Laika Price wrote:
> Disregard v2 of this series.
> 
> Apologies, I'm new to kernel development as did not realise that I should
> squash commits that would cause the kernel to not build / fail tests. I am
> sending in a v3 with these squashed.
> 
> Sorry for the noise.

I'm not sure what build failure you're talking about.
Please observe the 24h cooldown between submitting new versions 
of a patch.
