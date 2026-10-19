Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1762E266C
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370025; cv=none; b=Fvsjn1MttPJe/TYwqiB63hnwhvdXlMVdS3LX3NVu1R0al/HVM40IzFqn8bacVNAkUGCLpQGRC8gD2zd7k0Pj48lw5lRL8L2ICRGiTgGU3S6LfA2dnvwT5nUU6mSW2mr393bDiF5CMKaznGZ13yo1EkabmoNaIpPoUpuEJlwLY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370025; c=relaxed/simple;
	bh=HZkA8SDHue5Y450hQGCufHdAi8YP3S4vOtjG0PEnPvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFAv15LsGH2rQ/twxmvwClhw353ot0C+0uUdr7rpuSaUlSTXo270VUXAXzpEfg7QGa5xfuphaqfKyQVWf38rnsouaLRnBf/7khVQqu83yzs2/HNrEzU9yh2x2WzMDq4Eld566jK25boJwp4c832bpSLmtc1nRTFRdJaEZjp4bNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Cj16Ysw+; arc=none smtp.client-ip=91.218.175.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cj16Ysw+"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HZkA8SDHue5Y450hQGCufHdAi8YP3S4vOtjG0PEnPvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792370020; v=1; x=1792974820;
 b=Cj16Ysw+mNj531KO1FFM2aTv8PmJOPkjLTNGR0FfsNizB1T9fU8Gmk/ActT6Bd9OJdOruUc1
 s3KLaEXY6U0NmZFzB0KQthFkVcCn6P40uL5Ih/VknJ1CZWaQGAyJ8SO2uhRXxqnKFXKKJllFAXk
 efBR3WDmLo7QVmYG8yF2nWEg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e47ba85f2e4f76c7;
	Mon, 19 Oct 2026 00:33:40 +0000
X-Mizu-Trace-ID: e47ba85f2e4f76c7
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 08:33:34 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next] selftests: net: exit with test failure status
Message-ID: <atVlXsbU3YNwXmrH@fedora>
References: <20261014-self_ret-v1-1-6b5a95ba6106@kylinos.cn>
 <20261018114821.GA2470373@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018114821.GA2470373@shredder>

On Sun, Oct 18, 2026 at 02:48:21PM +0300, Ido Schimmel wrote:
> On Wed, Oct 14, 2026 at 01:32:24PM +0800, Hangbin Liu wrote:
> > From: Hangbin Liu <liuhangbin@kylinos.cn>
> > 
> > fdb_flush.sh, fib-onlink-tests.sh and l2tp.sh can print [FAIL]
> > subtests while still exiting with status 0. Their log_test(), aka
> > log_test_expected() in lib.sh, helpers record a failure in ret, but
> > the scripts never propagate ret to the exit code, so a kselftest runner
> > treats the run as a pass.
> > 
> > Initialize ret and exit with it at the end of each script so failed
> > subtests are reflected in the exit status.
> > 
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> fib_nexthop_multiprefix.sh seems to suffer from the same problem

Oh, let me update it together. There is no need to bother another patch.

Thanks
Hangbin
