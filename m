Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E0409637;
	Mon, 17 Aug 2026 23:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787010373; cv=none; b=bhCSrsumYywQTMvreJn8ola83YSMxGHcV8417FwDMGD++3F7MJK5OuADiGFTasTCwlJe3au0d7JQrYy+Eg7f71E2u6WG6iwzwCHY1cpIDvWjAcxnUZTojFhoRcclx6x8ymYA8YtjlM88IOHusCN7Qkf6M3LNxI6CEXln09lCAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787010373; c=relaxed/simple;
	bh=uOqi1KK5mGJJgx8ik9bGJDUPgRd4vL6+eLlK3qYJnDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VC5zUpZQt4MFrfm5Ntl0bUYgF/lH3hcBlSUXwaHwo/iPmeSW8fbTO45h7pcoDY9tUKCgZpi6GrAfMXKx2mp4f0dxGzlGtOHmyWraAFQ62VQcU+lcBrqT8skY95+sfBC8K09jzah8ew1A1SSiMOCcX0hc9QeRHHCPf/MLZgnIEJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7up5Vcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7up5Vcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2160C1F000E9;
	Mon, 17 Aug 2026 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787010370;
	bh=R0iOb//jWmQR8dS9EaLHLtFHP+KXUq0tf+HQDRhXK1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P7up5VcvJQyljkTWRWFyREJuJbMLOqgPm5Tkw4YYqrbs5D17grkBw1AkwgN2Lc5+l
	 HaSK2lLtre921AsPHyb7EPSWPZhPhHpUTHbJfWJaYx7Cy+cTurAGh9nAO1FeN+2Zul
	 bHYKKcgpJPznEOW1M+gUDmuW03cBDp9UJSyk2G7jqzGifIp3QcMQuV/VIxU7558LZc
	 AlGsEdj8iIG/Ww62vBhni+8v6HpAyjaBoe9DFMGo1aVIN7hq0OZemGGKewYh1Qdncx
	 HIHTmaHg9c3rk3brKI09Q0XoIrjPb1ohnFzp0CtGngu+LJDpBxaJi3yCVkiKHHlVRn
	 lFfzL5L6VIuLA==
Date: Mon, 17 Aug 2026 16:46:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, noren@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: bump the timeout to 15min
Message-ID: <20260817164609.2c97cb0c@kernel.org>
In-Reply-To: <20260812171302.1888667-1-kuba@kernel.org>
References: <20260812171302.1888667-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 10:13:02 -0700 Jakub Kicinski wrote:
> The GRO test takes extra time on NICs which support HW-GRO and LRO
> (as it also runs the test cases against the NIC implementation).
> gro.py takes 6min on bnxt and 10min on mlx5 with debug kernel builds.
> The delta between drivers is to some extent due to their defaults
> (mlx5 sillily defaults to queue-per-thread, while bnxt follows
> netif_get_num_default_rss_queues()).
> 
> At the end of the day the defaults don't matter much - on larger
> machines all drivers will create more queues. We should bump
> the timeout. Let's give ourselves a 50% margin over mlx5's needs
> and set the timeout to 15min.

The gve runner takes 20min on this test. It's getting impractical.
Let me send a series - this patch plus a patch to break gro up
into subtests.
-- 
pw-bot: cr
