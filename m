Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895539DBF9;
	Tue, 21 Jul 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644688; cv=none; b=sDkQoVAVgFJ/9jkcSoXeq12nXoQoIRGgTAE61l1wgX3rf2qO05Klene+8sKQE2fPKy8huglnhHSSaq6gDXoCnjlvJe4aDv//jFZ5mMjGxj01W26sdhCmrg3QQuSelVtTqCbQ13+q3/QWKW3VCG0yp53QFibaVtrjlQ6ERnr/VVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644688; c=relaxed/simple;
	bh=WE54N0XttuHohF9S3o2EIxAbsPRA/FIuF3w+w9TiVxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oier+ao6RLefFm3fO2kmReI5ss2Tch4w4nqnBEWLRjmOGMxKTmdT1VLoRtZ3Hs7Xhmon/TdeTWI0YJ00NkLzs0KRTcPy6bcX7WzPA/CNOI9ygQ+TzKiPQCoOrW2plEMCYxFAz/KJIMPxKYCXtQup7PRifPqKVWFxLNuiVtsl1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from equinox by eidolon.nox.tf with local (Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmBbQ-00000002JYT-3inB;
	Tue, 21 Jul 2026 16:37:48 +0200
Date: Tue, 21 Jul 2026 16:37:48 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Simon Horman <horms@kernel.org>
Cc: equinox@diac24.net, pabeni@redhat.com, kuba@kernel.org,
	idosch@nvidia.com, dsahern@kernel.org, davem@davemloft.net,
	edumazet@google.com, corbet@lwn.net, skhan@linuxfoundation.org,
	fmancera@suse.de, lorenzo@google.com, maze@google.com,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, furry13@gmail.com
Subject: Re: [PATCH net-next 7/9] net/ipv6: support RFC6724 rule 5.5 via
 subtrees
Message-ID: <al-EPInqzpka3zi6@eidolon.nox.tf>
References: <20260714094030.136317-8-equinox@diac24.net>
 <20260721135013.387122-2-horms@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721135013.387122-2-horms@kernel.org>

Hi Simon,


On Tue, Jul 21, 2026 at 02:50:14PM +0100, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> https://sashiko.dev/#/patchset/20260714094030.136317-2-equinox@diac24.net?part=7

Thanks for forwarding the Sashiko reports, I was already aware of them & am almost done addressing them.  The external nexthop stuff is "inapplicable" since the kernel refuses subtree routes with nexthop objects, but I've made that more explicit.  Other than that it's relatively simple oversights on my end.

I just need to make it pretty & hit send, I'll hopefully get to it tomorrow.

Cheers,


-equi
