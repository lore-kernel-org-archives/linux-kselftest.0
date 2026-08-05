Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2C47279F;
	Wed,  5 Aug 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937876; cv=none; b=Y+8IH4I+yp7hY+fOA8oYl9SplzzpjtaOjUChfBgFuZpf8SDQ91/nZhZqgiww892/NXjqcIx/7LhDsaXnDhuOxCG9iz3rr9XjCKT90sNcFKRX/EX1tZBsjb9zo8ia2zm62Py3DclUxYm65ykvxRjE4TeIR6hiR/WJB7T+3mlQJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937876; c=relaxed/simple;
	bh=CV1Mw5jg1jTPO0Ill+Gs0ah6G4vcDgbkyC+4qWkrvls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbPrGYuaRTTRE/hsD/x+FEoaUEI7ACvECjsMwhHpUf9NUXp1+MlyRdIemQyAGWlN0DoqGbHlVV0rx2oVfLvHopyZ218zzxAoN6p920kTB3zFvu3638bgbrrC7AgoFb3d9s8yUvTsPDwNl4H/CK8Np6YJl+Cknz/fAQ5EIDEC5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=D6NVYV4O; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="D6NVYV4O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XD/2+nqkEeO47RjZPzgK8ealGasR5MThdOQjfKlKM0c=; b=D6NVYV4OVTaNUlFflsMFXA8bzZ
	roN/IKHEqFgpnvdxhvqiavLrbJEcjxPMdpw3Y4j85Z/1znuAAvTn4IeT/szG67uD4qxIsCvgGDKOP
	hOdiS0JMkycUfM7rlkfAWuaHfd6lmEz5mEqcywkiSx47DyFsoPXUIumy2WXLN/8AHmAFZuV2GnbwI
	WZjq2js5CbTmQ8wQg3Py5/CwJ41S3RlDN/sTkws5Rqmm5jqlkwJL9tn9LuUFaY7NQpzTNVF40nJ1g
	zuukI+s+QQIODW46GJW3qF4xyfUoR5LGBL2U3JRVETuxOqDZCMgGUZE9vPeLnpF8kVGshbxAgDoEp
	80xIIVEg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrc1K-00Dxio-2x;
	Wed, 05 Aug 2026 13:50:59 +0000
Date: Wed, 5 Aug 2026 06:50:53 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: hw: reset HDS mode after
 netkit devmem tests
Message-ID: <anM_pUDA3b8xT3A5@gmail.com>
References: <20260804151040.2755153-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804151040.2755153-1-kuba@kernel.org>
X-Debian-User: leitao

On Tue, Aug 04, 2026 at 08:10:40AM -0700, Jakub Kicinski wrote:
> HDS mode has confusing semantics. On GET kernel reports
> effective mode. On SET kernel expects explicit config.
> Effective mode on GET means that we know the current
> state, but we don't know if it's a driver default
> or user setting. This matter because driver default
> can change automatically when e.g. XDP is attached.
> Explicit user setting must not be lost.
> 
> With that in mind, we can't restore the HDS setting
> like we restore other NIC config. We should always
> reset to default ("unknown").
> 
> This fixes an issue with tests running after the devmem
> test not being able to attach XDP, e.g.
> 
>    Exception|   File "./xdp_metadata.py", line 105, in test_xdp_rss_hash
>    [...]
>    Exception| net.lib.py.utils.CmdExitFailure: Command failed
>    Exception| CMD: ip link set dev ens9np0 xdpdrv pinned /sys/fs/bpf/xdp_metadata_test/xdp_rss_hash
>    Exception|   EXIT: 2
>    Exception|   STDERR: Error: unable to install XDP to device using tcp-data-split.
>    not ok 1 xdp_metadata.test_xdp_rss_hash.tcp
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
