Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F63B8BA4;
	Wed,  9 Sep 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945575; cv=none; b=A1zobB7N+0f5iRu3+L7Ya2Vq+dsK3w4/6Edx2q51KOp2Vzej7DgI8i7MFuS0b+o1lzfE/J3czJSlridH2zNa1k1rRtrEF5U6uFXlg80XVwAG+MWQtRVBHZB+icRN90YK2rtOrNJz6ObobOh6Sy+K2nlvt/J0xfpE/qG5AsYy0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945575; c=relaxed/simple;
	bh=03xMmvpwNGlKzOXIPwICD2/yk4F9OWEokq4zEct6VJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSlcZIjRiCXinUHGEYVmerfR32d8HZCnYnwzsZLaXlEyVi75hNYkj7aCM1i75qEL6ccz7QYZOIOmHAR4g7VskSPI4H0J6qk1BljN6mm0sFjxF/7fY6M/OnRmyT0PVojWeXNKjgqABCEhlFoAtjcSF5Xr3MGGqyVBXFD/wpuPQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ExcRZHBk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ExcRZHBk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ilYvwF6vlfDatVeBN0E3LNo/stm8fqJ/Wf8Y8/ZMm2k=; b=ExcRZHBkhe1x0I17tzAWJvcAwm
	ytNbU3569tX/kjnfFdGuOKE/FJ7H0YfV4hcgR0hHwsi1pytdpovwRsXbSgUEZ7CAPAACNdHqKK5ix
	Q0siDVz58XfRIs6RwMYkAr/AzeXKh0YemSA/ZwdjwYRWoVyyvTc8od5OL58U3wpogBmbWsjLylqA5
	bKQh5+64pjGydRy0/2WbrvK1ega5ySDO3aVun9XiocnkuSsiQcebteK7qP15cMM4ioqzoXoasnWt8
	/RAPiHr0GTvDnLiTVgCMKl3lp8OY4Qt/Ba9fHO9zeZu8Rnl66+lFhB6R+Ebdlnwjy1Dh6CUSxzfYg
	w1qzF+dA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4ESg-002wt1-2u;
	Wed, 09 Sep 2026 09:19:23 +0000
Date: Wed, 9 Sep 2026 02:19:17 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	bobbyeshleman@meta.com, sdf@fomichev.me, razor@blackwall.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: devmem: set reuseaddr on
 the sender's source port
Message-ID: <aqEjHhr-4aXTV1M6@gmail.com>
References: <20260908183420.1369630-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908183420.1369630-1-kuba@kernel.org>
X-Debian-User: leitao

On Tue, Sep 08, 2026 at 11:34:20AM -0700, Jakub Kicinski wrote:
> devmem.py fails on the HW runners with:
> 
>   CMD[remote]: dd if=/dev/zero bs=512 count=1 2>/dev/null | socat -b 512 \
>     -u - TCP6:[fd00:2::1]:50051,bind=[fd00:2::2]:50051,nodelay
>     STDERR: socat[41018] W bind(5, {AF=10 [fd00:2::2]:50051}, 28): \
>             Address already in use
> 
> ncdevmem installs a 5-tuple flow rule which matches the source port, so
> socat has to bind it explicitly. The port comes from rand_port(), which
> checks availability on the DUT - but we bind on the remote...
> That said the failure rate seems to high to be random collisions
> (~2% per sub-test). It's probably TIME_WAIT sockets on the remote,
> run_rx_hds() alone creates 12 of them.
> 
> Set reuseaddr so a TIME_WAIT socket does not fail the bind. Collisions
> with a live socket are still possible, we'll see if they are frequent
> enough to care.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> @@ -201,7 +201,7 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
>      else:
>          addr = cfg.baddr
>  
> -    suffix = f",bind={cfg.remote_baddr}:{port}"
> +    suffix = f",bind={cfg.remote_baddr}:{port},reuseaddr"

socat_listen(), used by run_tx() and run_tx_chunks(), still builds
without reuseaddr. From my reading, I understand we don't need it given
ncdevmem does the active close on those tests. Leaving it alone seems
right.
