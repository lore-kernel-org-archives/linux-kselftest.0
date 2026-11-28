Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825610;
	b=Dhg4dD+moOkfiUMOWlleG8xee4AICFAMM9Q6D+pHhDaVRc+s2fAPJ/CIzrpjaGD5Qc7L
	 4B+SXL35t+LueeSMLNX099mYWwE9w2fZnxnJZmBU+14xlc2IY1I7Qi5sZZIKMJOwTa02/
	 9gWwqRm89ab1ovA9ABYFNhboR+dtl+94oV9cqS6H6Knv7J78He+s3IEJvIUbL4Ax//++m
	 ZRXZm+sOMBHIbSm0kYebFNKilWvQbxDClAMSiwVe85gVAZqDFnzMqDiGR+lRcAy7YVcO3
	 n+TNiDsSb+FIkDI0ngGZ8NfXBow1ygfBytXPB76V/xQnrzMDtu9LWp/u7lwOBql9exw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825610;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ABybapq55FqvbJkvtP3uamYyGzXCYZHrbWKdOK5dFC0=;
	b=EFw2wWtoqqEmVUNDAvXHjDMqtNCioWrNrxtv6O79/fjjZRIz65L3/GBamCbdUhUc0B2d
	 mFuwt2GCn+gNEJPfNuPSfW/HXPkWzrUC7PfzBdWHEQa0RQ4zRE4Rn3Sh8xokrOLT3vei8
	 1jKJDPaBRLWjdHVpxiLdzsMrY/PaMCmzYvG9weBAPOg6/HFG0fn9kpbha3nROcYxePMtM
	 JT21JuMcw256u9DAyQtj4ZI8NwlKAlK60uRRj8WW9x0tad3b6HmiF2DmiFcubm0hDhDch
	 CCBdkjUEUvRVSLtSqVPu+PcIuZV81PZ5ITynILERZsWsV2QcDTl5D4Gy1HUzJzCSONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ke0ZFa+e;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2871606A31C;
	Sat, 28 Nov 2026 00:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2871606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ke0ZFa+e
Received: from L30177.local (unknown [IPv6:2a02:8440:2604:bcb1:f5b7:22a4:6087:fc04])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3666113F86E;
	Sat, 28 Nov 2026 01:26:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795825602;
	bh=6xuunTwk8s9nzGN3zpOQxwbIi5m+uXRPmm7vN6fZ02U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ke0ZFa+eGJmx52/ko6MLSebhG8pWqCkTdmFua2NodJxMoa05LsDF5HQVuawR0DMS+
	 T6vM2fbSB6A4qhYxzquEZP/9+HWbTGwYPP5pxDQ82HgEi14VveT5omzSPE9L+IXeiK
	 ayVBjToq7xfppui9DfBxpDH6tYjb1XKX1xBV9d+McgjL0Dte1WMo+lgv3dvR/zvhf/
	 s+/nui2tcWrxEGS6ufycSiAB2aXooo2boa2idslWt6J3FdBkX8Yk6eWzJwZJ9Xecul
	 EkvSg0AOWLe+qXm8kg2IyeWRZ+2pQrJ27VwYI494AiolLR8Mr8+NmSHwgQCFsXj20R
	 nCHRVwz5k8X/w==
Date: Sat, 28 Nov 2026 01:26:22 +0100
From: Vincent Jardin <vjardin@free.fr>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
	nicolas.dichtel@6wind.com, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] lisp: add LISP (Locator/ID Separation
 Protocol)
Message-ID: <awofrlJOdFwFqj6e@L30177.local>
References: <20261126-for-upstream-lisp-v1-v1-1-7382a4bcfd9b@free.fr>
 <179581834896.3135.15923750690737278293@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179581834896.3135.15923750690737278293@kernel.org>

Hi M. Bot,

Thanks for the review. All the comments of the series (including Medium
and low) are right and they'll be fixed in v2.

Thank you,
  Vincent

pw-bot: cr
