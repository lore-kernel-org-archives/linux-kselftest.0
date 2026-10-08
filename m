Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C144C6EEE;
	Thu,  8 Oct 2026 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472930; cv=none; b=K8OZcgiKZL5uAqXZa53wB+RmKZW7EoZo61R6F47/1D4c18ecVJ9T/cQMtGBg8+AiCkZCPnT8xr5I5mcPS6y9RqJwIKhN2HJSS1WC30OZWEpux79hEdBiXlSBd1ap1s+PItnMlkqWswqP/zASKcaLdqLhMRyn9XZG9sjcfCFpBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472930; c=relaxed/simple;
	bh=I0mGzNDGBBH/5ToiLufW7e8PiS2Spvs+3WctJmnuqgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoXDrl59E3ZJB5FJVv8fDLMvguQP/IXJ9TWFfyI3gbnrB6KrUgXvnK1/2fYtOJtn/uYkM8V3oxK2trQZjt/3Xq34J4Eg2DFwbomRZdLKm5wcaQI89fGySNCE7yeQONtwCDlYq3scGPWJizUu4JkRi2WdROSrVaFT1O5JAJ4i5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjg061Iu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjg061Iu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6341F000FF;
	Thu,  8 Oct 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472928;
	bh=SATqFQzM7nW5mYhaVPL8jIh7UGmfBkpGUp+jcNmvFjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gjg061IuqXC0GHQXd/ibD8dfShsXbmXgqoGw801qHEWW1vE3CwDG/ki4/kdk0LMYl
	 2yVKohEIY3eNL9ipMAj9LuFViPYUUmw5rfvQa0GLhwro4vy5ASndCeNBdWU+aC2PM5
	 z6n0hHgyVKtDVgPT7nxfMbsSUdO2wDhfS4rYzqN0X3J7Ew4Yvv1/0GgPjqte5QTCXx
	 KoWcflh06gHGeKrUV7JykMsy5LaS3vSPeSaSFlSqogWqxcyPHNeMkuGLMX2IhvF8b8
	 h6qZuBPC4SzF0mGcZwlk97BcgkutWEfPz89hBC7VwbbjyEogh2qnkQgd4MWtonBXJY
	 jTwsYP09p4AaA==
Date: Thu, 8 Oct 2026 08:22:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/net: test generic-netlink policy dump
 operation ID
Message-ID: <20261008082206.23a5125f@kernel.org>
In-Reply-To: <20261008085434.3681647-1-sahaj123.sc@gmail.com>
References: <20261008085434.3681647-1-sahaj123.sc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  8 Oct 2026 14:24:34 +0530 Sahaj Chaudhari wrote:
> Check that a generic-netlink policy dump reports the requested command's
> operation ID rather than zero.
> 
> Request the policy for CTRL_CMD_GETPOLICY from the control family and
> verify that the response contains operation ID 10. Register the test as
> a generated net selftest and ignore its built binary.
> 
> Tested: reproduces the missing operation ID on 7.0.0-34-generic and
> passes on fixed 7.3.0-rc6-00063-g0c2669a9f4a1 in QEMU.

Why are you sending this? commit a87529034b9c already covers it
-- 
pw-bot: reject
pv-bot: slop
