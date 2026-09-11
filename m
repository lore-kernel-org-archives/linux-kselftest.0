Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3D2701B8;
	Fri, 11 Sep 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086500; cv=none; b=pcqsjz8ReRi5xHb+vZw/W3DmSe39764P9Wkf0AciuQT59ba2ZsNcABPIB2CiW/5aybKubKPeJWJRet4HuLn7kGJ6yPfGpAnjt2/GS5j4yC0TDjF2LVt5+qUTT27+f/i1YNr1A0hKk9AWfXluVg/uBDgvhXPqt+InPRDMRe70RPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086500; c=relaxed/simple;
	bh=p8g5VrUpIuEKVVnXEQEgwR8igbHjP7RQR+4PhHiY2h4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/wD9t0rIXmH/Plj+vSvLpn1yfhFyCCO40g0fqc+tR3rUMv9oAx0uNm4YliPXdBOYs5xOlzOJr1rpDEQLcD8xb6aRYrZ2emNo25owDVO0E1mJWGaaS8KB3vxQNp8sdFpXnUkXf1yo9jIaKJ+smrFUQfZdepJTs7msvleY18v42c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3+1lB6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3+1lB6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66471F000FF;
	Fri, 11 Sep 2026 00:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789086499;
	bh=lpsX0Oc1YGa6GLcre8+okKUHqG+8JZN6/9SM+zvBL6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=A3+1lB6MIvsMnAShyeWBTwcP3EIE4ehN51veJ66y+OjW3Uc4mAc+gJfmC7lqBIniV
	 QxxSBK/7DnJXm92APVsw4/khiGz0u23oyD/3ekDBpiL0Sf9iB4WsCTg53RDxI2Pb7n
	 tDtWNj0aLmR2lOtMcm5Q0iFCEI+oG+TbSe0b6wqaN5cl67i7dGxHJ0BYaewIuiCT/X
	 t8PFqAc/3SI040fjjQYPTyrnhXDa7d4VztvuyElJS2yKZzhpYzoz94tZ6GU6aMz8f/
	 hGG69xf/AYEfg21DQckWOCCfB3UJkp2oN3ewlVF5aiQwaOnbn6E5NhtweMLPjAy7Xp
	 phS2i1v9m6tjQ==
Date: Thu, 10 Sep 2026 17:28:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: edoardo.canepa@canonical.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, xudu@redhat.com,
 po-hsu.lin@canonical.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests/net: run tun tests in a dedicated network
 namespace
Message-ID: <20260910172818.2a6f5f7a@kernel.org>
In-Reply-To: <178900177532.219967.8601375686974800395@kernel.org>
References: <20260905085318.3416670-1-edoardo.canepa@canonical.com>
	<178900177532.219967.8601375686974800395@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 00:56:15 +0000 netdev-bot+sashiko@kernel.org wrote:
> - [Medium] In the newly added main() in tools/testing/selftests/net/tun.c
>   (lines 989-997), any failure of unshare(CLONE_NEWNET) is treated as a=
=E2=80=A6

Seems fair, at a glance it seems like we just need to add this code to
two setup functions instead of creating a real main().
--=20
pw-bot: cr
