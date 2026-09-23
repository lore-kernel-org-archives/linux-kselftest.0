Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6594F361657
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128099; cv=none; b=dGjZx51fAvGKk+7IDFVGv1yOL4S7Hm3FQyjEoGd6jIsSc6LknnxudaIUbrIcIdrF1dQ42UpgIsuRvUfJCd4vR8wj9rZ/cdr7AYOfeM0IPt6hlW0Zd6lM1rFZbasdM3Qjre6I/fMUmAkluPCOOteOyLh1F0vyL9Dbv/+IiHEUjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128099; c=relaxed/simple;
	bh=u+X6/vxg2v3iHeoqAYncrYBLXI0Jh253vVMVoJ9VuHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgQZGlenC7Uo+lzZODhv4+IxJyHUkGQzFK1BHVVEFMp+jMEwBuEK6ZfxNPhdBCI7ZHOYcrE6tppOubBbiC74ApHzO1h9UuYmFE8I56WIRmyY9Hpjd7hSgzmPLClR39TILtOIJVcczypFoJB7jyA72FapGIvv2ibc8nBMVSZFVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qa/yn8YB; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qa/yn8YB"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u+X6/vxg2v3iHeoqAYncrYBLXI0Jh253vVMVoJ9VuHI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790128095; v=1; x=1790732895;
 b=qa/yn8YBih4LMpi3db42eaNAP2yLhX9XrHDF/GkwmL/BL0ekx+QcyJCEVavhSQBSJd2awIXg
 Rgs3ZeuuCzQk8JFJ/VEh+QBDCBCQziXWLgojLtxA+RYj9hX7f32SukLhOgmYiYUwhUySEAf6ADa
 R/Q2asSgaVCcjXcmqfMjNBz4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3968b3c81cea4a5f;
	Wed, 23 Sep 2026 01:48:14 +0000
X-Mizu-Trace-ID: 3968b3c81cea4a5f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 23 Sep 2026 09:48:08 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 5/5] selftests: seg6: add End.X PSP selftest
Message-ID: <arMv2FE49vEwM7BP@fedora>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
 <20260922-srv6_flavors_endx-v1-5-4d01c05c47b7@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-srv6_flavors_endx-v1-5-4d01c05c47b7@kylinos.cn>

On Tue, Sep 22, 2026 at 04:54:47PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> The current selftest only exercises End with PSP. Add a new test that
> uses End.X on the PSP path so the kernel's End.X flavor handling is
> validated end to end.
> 
> Extend __setup_rt_policy() to parse End.X action field from the
> router description, allowing entries like:
>   4:psp:End.X,4,2
>   3:psp:End.X,3,1
> 
> Since SETUP_ERR is not set in one setup function, and the middle test may
> set ret to 1, we also need to check ret before setting the result as SKIP.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
>  .../testing/selftests/net/srv6_end_flavors_test.sh | 83 ++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 52731983b4cc..e130d0d71b3d 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
[...]
>  
> +setup_endx_flv_psp()
> +{
> +	# Direction hs-1 -> hs-2 (End.X PSP flavor)
> +	# SID List=fcff:3::e,fcff:4::ef1,cafe::2
> +	#  - rt-1 (SRv6 H.Insert policy)
> +	#  - rt-3 (SRv6 End behavior)
> +	#  - rt-4 (SRv6 End.X flavor PSP with SL=1)
> +	#  - rt-2 (Route to hs-2 via nh and oif)

Oh, just noticed that I made a mistake comment. It should be

	#  - rt-4 (SRv6 End.X flavor PSP with SL=1, route to rt-2 via nh and oif)
	#  - rt-2 (Route to hs-2 with same subnet)

> +	#
> +	# Direction hs-2 -> hs-1 (End.X PSP flavor)
> +	# SID List=fcff:3::ef1,cafe::1
> +	#  - rt-2 (SRv6 H.Insert policy)
> +	#  - rt-3 (SRv6 End.X flavor PSP with SL=1)
> +	#  - rt-1 (Route to hs-1 via nh and oif)

Same here.

> +	setup_rt_policy_ipv6 2 1 "3:noflv:End 4:psp:End.X,4,2"
> +	setup_rt_policy_ipv6 1 2 "3:psp:End.X,3,1"

Thanks
Hangbin
