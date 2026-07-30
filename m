Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB737475D;
	Thu, 30 Jul 2026 02:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377828; cv=none; b=CfJRBCih24xS1MOyLmz9lcNoCH6fXLD8e8HEx44KkNoJb1eweELMr132rxHVEn54yA2nawVx8/mUWSad6HeZYvwOCIhkUsXn6GKMSt8K0wMs37fX33XYQwID2kjlVfmaTPAZ8X1y2+H+fwgxhS+UcZcqlwg+XB2qA9uVPnDlRNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377828; c=relaxed/simple;
	bh=30cNrd4lFH9KzXqi3/2gD74bgunJldgiiZnALq+oh7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crGAGno5LHrj2T3Xyd05r6khVdY6xO0gw528EUkeUgufHIRN7aN/QHZQ/S33gYe+bh57GbliwR+RzBNdztLItVJal0DToPGYctCwnEzhUaR0nruaMvvL3D0O7Mxr1BfEKy7jog1MTpCL7MHmE2I/kyaTqae+bVH8KKtsDC+Mn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z12ZPJp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z12ZPJp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3771F00AC4;
	Thu, 30 Jul 2026 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377811;
	bh=6tGaLHu0EVxq2PjCuK3R5veUeuraNN9YsqvpMJewVOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Z12ZPJp011u3s3PDprGcf1a5zlmaiUeaUierOQGXq4dQfYMLMO/04zzgLXJkmCVym
	 StBAqim4ZI8cxUY+XOxoaXosmPgz8mnQvg6ALmBwvJjxqzOmrVkcWena8klv20OXIZ
	 kj8fSG0CgKyfnmkkMM1JQ/hBblyh+bmUtI7HRD/cW75OwlZFEv8cW49WVzYPIM7Gxs
	 dTl3PGH953kS+VotnYVDf1m+ThNPd2o5ddbEKXrGdq/B7OP19qkk6pD4KNoDBrEZhc
	 ZjwMfXUH3gx+t4Ne3u5UpcLW4KVA6+cXFy8r03U3rGWz8VPMpYsFE4iriobjTuG5Cr
	 sc3XohhZN0vjw==
Date: Wed, 29 Jul 2026 19:16:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <20260729191649.55ab7942@kernel.org>
In-Reply-To: <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
	<20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:21:17 -0700 Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add a new devmem test case for binding the dmabuf with rx-page-size=16K.
> The test sweeps RX payload sizes straddling the niov boundary to cover
> the sub-niov, exact-niov, and multi-niov RX paths.
> 
> Silence pylint invalid-name (`with open() as f`) and too-many-arguments
> (ncdevmem_rx grew to 6 args) at file scope.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Hm, odd. In NIPA we're getting:

TAP version 13
1..1
# timeout set to 0
# selftests: drivers/net/hw: devmem.py
# TAP version 13
# 1..5
# ok 1 devmem.check_rx # SKIP marked as disruptive
# ok 2 devmem.check_tx # SKIP marked as disruptive
# ok 3 devmem.check_tx_chunks # SKIP marked as disruptive
# ok 4 devmem.check_rx_hds # SKIP Test requires devmem support
# ok 5 devmem.check_rx_large_niov # SKIP Test requires devmem support
# # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:5 error:0
ok 1 selftests: drivers/net/hw: devmem.py
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

https://netdev.bots.linux.dev/logs/hwksft/BCM57508/results/755681/config
driver: bnxt
fw: 237.1.148.0

Any idea?
