Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12903911CA;
	Mon, 15 Jun 2026 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558270; cv=none; b=Wo3yjfTlHodG9IQHx39uQtiDPlLAQT3DiTnm/AeH+RWJm68+tM2dJf2SrfqfTYafS+ycSSS3hgwVFMb9rUeyhdLYUhrGHkfY998YIkG+jrhj1GNZV2CFxFI/aEb6lBxl5tfwv9jqwVTzgUDoA4YeyJfMvM9RbVmNwcc+3e45aok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558270; c=relaxed/simple;
	bh=PGjHLy8gUmlEaxpU/sRE2uDEISa0evA0wO7LwE5fXQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wcn5fR4QsRRTB53T4RpM5UZM7vQCe3kBdf/gsBO02pvNeEITXAHSUEjHOqT5YtsaGsSfA69wlGTG84Bxy4XYV+MBKi7hPi0WhXmp6pBfeDxAFiubwv2zB2ZEuD1asFfuR1wpPdL8r6aqATGDevOR48pW6D+zwD/eD7kN9WW2xNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3J1KaSD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3J1KaSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C4E1F000E9;
	Mon, 15 Jun 2026 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781558269;
	bh=rq36+ejyps814ZAAfW2Em7q8ECHOQKpLtojfRHIy6lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b3J1KaSDpnrBYOvPqLhpJjeMDS5IVi+4kOo2BFS/A0VjOSb4MMfY7Wu+aMYn+jcZG
	 Oo1y2AMoajz4nVmFAuU/bS+LG7QO8dt4X6WGHCJGtwvm0x5aRGaXt6XpASSZxZbSI9
	 R1N/CeJJzyHGxMb0VeX02AhkS+wZOU2INca1gdYCBG5g4sxdooz+U9T+mDUvS8tJwP
	 DNCT1xf08JjgZdo5mLnM2cM4BaNG39iIxTDeh3yfHJ9EW89XWGVSPvt4owFPSDVWUV
	 cpikwGtZsQG3pMpL+4LuKm34pUvIL6U0yXpPnaSEvTvhaPpqKtMSDyStCgEg6op/ZX
	 ii9B1Myy6NZwQ==
Date: Mon, 15 Jun 2026 14:17:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests/net/openvswitch: add ICMPv6 echo
 type match test
Message-ID: <20260615141748.17887b53@kernel.org>
In-Reply-To: <20260615090507.3647256-1-houminxi@gmail.com>
References: <20260613141429.3084962-1-houminxi@gmail.com>
	<20260615090507.3647256-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 17:05:07 +0800 Minxi Hou wrote:
> Register OVS_KEY_ATTR_ICMPV6 in the flow key parser so that
> icmpv6(type=...) can be used in flow specifications. Without this
> registration the parser silently drops the token and the kernel
> rejects the flow with EINVAL because the expected ICMPv6 key
> attribute is missing.

net-next is closed
-- 
pw-bot: defer
