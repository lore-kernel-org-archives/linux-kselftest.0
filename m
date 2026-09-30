Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBAB78F2B
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729666; cv=none; b=EVH55qAFKAHTO9DhzE5n5I9uk/wva44ZyXbemN1kYpkUIdtPBaJ+ZUVfybmJvQwodALNyjALZq+5USutVTUFYIZhfhItB+lLxVxQnsod8s3CWxwV489eORPhnwRZBb9bcx/88oUEHWtxWitSwvmQoJv5pEObOTrVz4YL9jhW0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729666; c=relaxed/simple;
	bh=Z+KFjxZ/7VN7LhoM4Ek2PNsW+mvz4O9ijB5/9/MmV7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thzBdQ8Sbeol/NzDSXPVH5C20Q1/ZIIPn36pfY9ctAX3DjSNmCkK//cY483/kklivHOpOpMJcOGa+xAUDXFnv0hqUD3O4ajB5wxRf10y2dyzvap6CFtzNm9Xn7hzxFMWuEGOqce7P72Q3ZPPhtxu33ilBGSUn0I7LkztZlyd7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xqmVVf6z; arc=none smtp.client-ip=95.215.58.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xqmVVf6z"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z+KFjxZ/7VN7LhoM4Ek2PNsW+mvz4O9ijB5/9/MmV7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790729662; v=1; x=1791334462;
 b=xqmVVf6z8bFh06MlzcqtGRLUovfP9oYR2M/1ahZQRjT0rY9mpPrNw8YFydI1LZhv/lgn7kH5
 QioWy5MYVpaYOnHV3HX2d8z3esVw4cJoo78NR6IS8PiyM9fz8HAPGMQqtR07Zfeq5eB6LYT2yjT
 6vGgEvVWobJlVndixJmLl7lg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 752e7d1f9e23d04f;
	Wed, 30 Sep 2026 00:54:22 +0000
X-Mizu-Trace-ID: 752e7d1f9e23d04f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 08:54:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Ido Schimmel <idosch@mellanox.com>, David Ahern <dsahern@gmail.com>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>,
	Sashiko <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net] selftests: fib_tests: use per-test return value in
 subtests
Message-ID: <arxdshcuvddlf5WP@fedora>
References: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
 <20260929134517.GA832345@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929134517.GA832345@shredder>

On Tue, Sep 29, 2026 at 04:45:17PM +0300, Ido Schimmel wrote:
> On Tue, Sep 29, 2026 at 09:57:01AM +0800, Hangbin Liu wrote:
> > From: Hangbin Liu <liuhangbin@kylinos.cn>
> > 
> > fib_tests mixes use of $ret for both per-test return value and global exit
> > code. If an earlier subtest fails and a later function sets ret=0, the
> > script will exit with status 0 even though [FAIL] lines were printed.
> > 
> > Use RET as the per-test return value, as already defined in lib.sh. The
> > exit code ret will only be set in log_test().
> > 
> > Fixes: 607bd2e502f5 ("selftests: fib_tests: Add test cases for IPv4/IPv6 FIB")
> > Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> > Closes: https://lore.kernel.org/all/178961184152.22033.9267194009793243294@kernel.org
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Please target the patch at net-next and drop the Fixes tag. The patch
> doesn't fix a regression, nothing is failing (or passing when it
> shouldn't) because of it and it cannot be backported cleanly to old
> kernels anyway. I targeted similar patches at net-next in the past. See
> [1], for example.
> 
> [1] https://lore.kernel.org/all/20250908073238.119240-5-idosch@nvidia.com/

OK, got it.

> 
> > ---
> >  tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 20 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> > index b338bfb196a2..9ce5623b049c 100755
> > --- a/tools/testing/selftests/net/fib_tests.sh
> > +++ b/tools/testing/selftests/net/fib_tests.sh
> > @@ -369,7 +369,7 @@ fib_carrier_local_test()
> >  
> >  fib_carrier_unicast_test()
> >  {
> > -	ret=0
> > +	RET=0
> 
> Looks like this line can be removed (similar to fib_carrier_local_test()
> above it) given that RET is never used in this function

Right, I will remove it.

Thanks
Hangbin
