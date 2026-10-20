Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518851;
	b=wIyHZTnnGCPIgK4TEDvyPadFmAIyXkgVFG0A2uUxhCjjf72Ma0WIlOU3ANd9V4otBf9d
	 kLBhAzDzRObAsoit5wr+eyEzHYctEIVev24GB6+XxMD6m6UWBf6OKwUq11awHf53f8d+w
	 wnng6OPIpdi1ORLFBL037H7k+j/zirIIUTLMGcESyjEcT+monctdMNxP0NecmU1LhFnh3
	 kvw21kJGzGIq88NO+d7ckHJr2y/YQk1o/bGCXTa/ZCniSfcNsZvAY1OQk9b012qoWwQ7U
	 Gqm345GOn+vufY3tTW+wa4K+JdAjUBQ0wsNnyAFHu3wHJ4BjRCfGVhfV/f/OY7/jXfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518851;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dQfMDuwqb54plXCUrcom+x2Un56yiP19qBWF69WSeCY=;
	b=s3jgBOvv2b+/Zx7L2lZYUAfg+X0HAc0YAdKEgphPLlcnBF7gBQF+Kh2nkED5EJp0aZCC
	 kCI7STBfrkXjNY+m159Kl+kv8Xks0ZpCG7XKsXbkBPxscvb447va9mjqMmVnHffLO9ElG
	 AzcT/8teHzYFA69CBG/qKYSV4qDjEy0eanZo1BqW+cWayN+Wfs0UwZovukcZ7bxb134f1
	 N+WMnr8s480HBmDgTOeeqxv41fSyn2Ng/aIPFcn3f4zw0f+naF1X+SEYfQM3fVFbenQuh
	 TdZ0aRh/I0HhPxUseIEjCU9SXJu/VZKpApEZrk7dYVdGMRs2FVppU6YzRoijva6nIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH2NLpqF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CE606A319;
	Tue, 20 Oct 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH2NLpqF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70FA1F000C9;
	Tue, 20 Oct 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792518851;
	bh=dQfMDuwqb54plXCUrcom+x2Un56yiP19qBWF69WSeCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CH2NLpqFzgnQAbVp8xpa0ohibW7oVpwH36dGs3Qk8BXoI84rYxuX4QxuIVaOZddlK
	 rsDuY6aWz/S3UeGKSYrDpN/2ZjeLDUl/80Z8Gwcd289mEwwBwZQkgR2ZzSW/qwrybr
	 vS1gnZl9WVrTDdvq7odvjRy77nzFW0Bqfnm2J/P5Ba1VLeD1VAOcgcQlWpILsOG5Qr
	 rXhmuKyYdptCaScjYZTpy3zRcEvcM247S29QUB2WQykaWcKGY/rXpbVK7iB+AZrjtm
	 LHRbNZ1TASjfCF4tHxM2WTUG3c4fLDa7z59qdGD95TZD700G0Bl/8YxmMkHZkYMIT2
	 eqG5LmrYtWXyw==
Date: Tue, 20 Oct 2026 10:54:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Omar Ramadan <omar@blockcast.net>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 00/13] amt: add an IPv6 outer transport
Message-ID: <20261020105410.7dccf739@kernel.org>
In-Reply-To: <CAEx2XGxxsFKL8f3sCQdPor7ZzN1h6VWEn8SdLnF0vnK00Jdgog@mail.gmail.com>
References: <20261009122426.551178-1-omar@blockcast.net>
	<20261019162817.0855e1bb@kernel.org>
	<CAEx2XGxxsFKL8f3sCQdPor7ZzN1h6VWEn8SdLnF0vnK00Jdgog@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 15:45:34 +0300 Omar Ramadan wrote:
> Yes. We currently use the existing IPv4 AMT relay and gateway
> implementation in a multicast delivery network (TreeDN
> <https://community.networking.hpe.com/blogs/lenny/2025/08/21/introduction=
-to-treedn>).
> Gateways on access networks send IGMP/MLD membership state through an AMT
> relay to reach downstream receivers. The IPv6 outer transport work is
> motivated by gateways whose access networks are IPv6-only; the inner
> multicast family remains independent of the outer transport.

Interesting, thanks for the context!

> My experience with the existing code is from operating and exercising this
> path, including reproducing the lifetime, authentication, teardown, and
> input-validation issues addressed by the net series. I
> agree that the patch stream exposed bugs in the existing implementation,
> and the reviews have helped separate those fixes from the IPv6 transport
> work. I=E2=80=99ll wait for net-next to reopen, then repost the IPv6 seri=
es with
> the net fixes as its prerequisite.
