Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30F3911CA;
	Mon, 15 Jun 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558254; cv=none; b=s2/FVwlUW3iIvyrhEr48t9/qdtPsOeui2+uIFYYn6jLCNhZ4Wy3ctWrk2eewaRMSqFHg5l/AQQJ4Iyz5uB5lU03w9CkNLDQSzlzE4bQuYSjztyC5MOmiAa5i9b0VQWpTrM1CJ/ndMtpATeowiYYrxp19nw1O3oPSYSHhPV3fL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558254; c=relaxed/simple;
	bh=D1v+ghR6OKdZ/AgO5SBKlQuqc4n1Nlz54j6fnaM39yU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLYV3zlO8ofW8MOaE8epycoj22FTB9ZZ2gVYZoiI92QWKRcBtzTpi5GHuTngJsXGinv2BWT+rxbanizE2J21F4Jl8GQ9nst+rQ3fQuF7xvwfgzYrMKNZdTNG0xQgvDMzIGKSQtVVo1cLGApwgAK0KY60/Ci+Oa85daeiRLvNT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1XumR2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1XumR2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0021F000E9;
	Mon, 15 Jun 2026 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781558253;
	bh=MIHDpJmRX43dBNeW+4T0ftFA1mzDRQgOgPWtINiNFsM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c1XumR2l7pDU19PDGM6wQr0kg24GTrewOhEEibK6TWwFIrzGLMWQr+O9kHbkAF0/l
	 xA2V7UPtZ2iBb23WBqrRwtN3EIvGfIl2IJLMXOWE4SrtWRl4WsFgVjOfUGK+Tk468B
	 ybm5MCyd4qkn91s0OBWKGDJPloG9PkKgHUyRWB6ajifyiAKG8ayHgdSU/4W06iXu8y
	 xblaEPX0VDHHYpTLazYlpb8U371jpKBa6zmd/lvS2JAHMz+aCLgVmxgAicvtMOtXin
	 E0uf76kh2VL0iopCsSLcaZ9mOicUTtp4uMgYlXvckG00QroIaxJFQVUf2AHEDfHkie
	 poAMpSd6I7k/w==
Date: Mon, 15 Jun 2026 14:17:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add output
 truncation test
Message-ID: <20260615141732.54c60719@kernel.org>
In-Reply-To: <20260611162537.3082686-1-houminxi@gmail.com>
References: <20260611162537.3082686-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jun 2026 00:25:37 +0800 Minxi Hou wrote:
> Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
> verifies truncation in three steps: first confirm normal forwarding
> works, then apply trunc(14) which truncates packets to the Ethernet
> header and verify ping fails, then restore normal forwarding and
> verify connectivity recovers.
> 
> The trunc action sets OVS_CB(skb)->cutlen, causing pskb_trim at
> output time. With trunc(14) the IP payload is stripped, so the
> receiver drops the frame and ICMP echo reply is never generated.

Does not apply. 

Please note that net-next is closed for the duration of the merge
window so you'll have to wait 2 weeks with the repost.
-- 
pw-bot: cr
