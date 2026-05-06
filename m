Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7530AD1A;
	Wed,  6 May 2026 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778085618; cv=none; b=ozx+Mo72c2MFq46Cl6CIzoi531ZtoE4CgWoC9RkQENdP2BhD1aIvmK65DalOvLMcb/+0W7lt5o2LNvVqXUNf5YGMMxFyQkFWAPfYq6toldrA2M0+40kp7+akMfW78r2WuukAWYxnWC6S6Po+zq/mFkYU3ojtOyQZ80NxW7YRR9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778085618; c=relaxed/simple;
	bh=WJgk2Ud143ybxxwA23ONGYfK/rf/ODmAVezDf2d79qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRtLCHVlvdBXSXAhtcZYjL7Dm2Q401bTeF5vi10BQ0DSWWlmARi2ZLQULZOZde1ozUU0RjMwm35If39nAkC8bNpbC7IN+thefZ9o8ktNsV7LVwb/pyER9FT6eUrVMTI1uL/QV2Uix0UHZQyjdevrzIZG5k0PX997t3SzqA+pXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=lASLo3Zh; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="lASLo3Zh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=301ybvqyl9q5c6ax1tiRGijMUv+Dhp/XnNZ3B+v4SMw=; b=lASLo3ZhQBeRjN6JXWVmKr/747
	xJWox68RHNlUQDeFObP6ej1v1QiF2FasB1cjjB7/zF2dD7kgM2paj3zydPUVYxkkkNGFGTYmHzfDz
	E3BQd/DyabdetjHlkHz24kH0pQIT78qcTjdUhFbHk+y5DOIj6JJPhJ6VRYDtcGQroLgt1ZJiDLOj+
	xiMFyWBER41xeWAOThqvbnzrhtcusyIC6WPDNZExFW3JG4KbCI1oXFvGuURVTxKFzvRfpP1V/DX18
	faCP7YuCSYyIpdr6n77+IkkjRiLV0hFzwj714vyGKhEPiTg3NCTF1l4jOFLCJ2qfJyj+MQTVoLXdv
	EcBYoA2A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKfIB-003jKB-28;
	Wed, 06 May 2026 16:40:11 +0000
Date: Wed, 6 May 2026 09:40:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 06/12] selftests: drv-net: add shaper test for
 duplicate leaves
Message-ID: <aftup9Pe-RnDZVUi@gmail.com>
References: <20260506000628.1501691-1-kuba@kernel.org>
 <20260506000628.1501691-7-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506000628.1501691-7-kuba@kernel.org>
X-Debian-User: leitao

On Tue, May 05, 2026 at 05:06:22PM -0700, Jakub Kicinski wrote:
> Add test exercising duplicate leaves.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

> diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
> index 11310f19bfa0..f7872c931bf6 100755
> --- a/tools/testing/selftests/drivers/net/shaper.py
> +++ b/tools/testing/selftests/drivers/net/shaper.py


>  def main() -> None:
>      with NetDrvEnv(__file__, queue_count=4) as cfg:
>          cfg.queues = False
> @@ -453,7 +471,10 @@ from lib.py import cmd
>                    basic_groups,
>                    qgroups,
>                    delegation,
> -                  queue_update], args=(cfg, NetshaperFamily()))
> +                  queue_update,
> +                  dup_leaves
> +                  ],

Nit: dup_leaves], on a single line matches the surrounding style and
avoids the dangling bracket on its own line. Not worth a respin on its
own.
