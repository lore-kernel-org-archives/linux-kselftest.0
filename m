Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535058;
	b=lOa8i0lRBiOyG9tKq7oFeLGKkVNHKM1xvlpdZCwXMtxTJtQH5VquPqXHXy7j2syUdqQf
	 mwUCGt0rzmWz7Cu2gbICy+YF4Ek2DqetJfh4VpsvNytUbw5tfgsNO1WY97+JSPi2+OmeZ
	 rTV9/MnfYE+YBe8XcqocfSMz2D5YK1rHKG1nSyYzWGkRuNfbKGd79lYBf+s1j279HDzQn
	 7h1Znoz0k2HSvFbWLD5gA4DUdMtRMmXLxb4GDXjqNXYFUP3ORf5FIZb/JPoaNTnfI02bM
	 rGZv3A6bf6Q+fYFmX16HynH0RGZjGpYPleCeEmFVcOv8AhwgbULzYIZwuG/VMbenyZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535058;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=IDbUmybDpH6/fsWmOG0pilZ3vqZX4QH2JbML7+b3ATdvGHXlae5X0j7xwtUkPmunet5w
	 o6vErgxZdNGnVkGgGT8SdsLyzzhQXqRsXxJSHf/yveHIb7vZZLdy+IBP6sCY4+fHSaVPP
	 2kEqs/0WC/WY4WcQk5tljxS7z2P8n3Z6sgm4iSi/y9BxEE+ZNCHYBLBNZd3lrWMDBadGO
	 rf0MOlFVS0xgwmKdUs7GoddcOdcOwel+BKN1d16C1htS4dgaRWIe0opsz6ZR8SD3fae8y
	 tC1z1ZzzHk9NEdYoSLII+OnQUrb0EuVxCgT5NTNU2ecgoKfjdEgRv/bXT6vtsO6ihFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osQA8K9F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42973606A329;
	Tue, 24 Nov 2026 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osQA8K9F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5DB1F000D8;
	Tue, 24 Nov 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535058;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=osQA8K9FJ2oHcByg5S9Gh31bLnkKJJDICqtrw+En+EZdsrVb089DfMlYis74N3XJi
	 wID2EwyDcqXKfzJr80O8BSW0m0lUAZ0Dw2hVK/2BI4fvKQjWVAzZjy10H+biTT2sqw
	 /3yFt0uW4O5iO+1wjl9Wu+nIWbNK4RktvXfsdrDkQKqUBR3sgBBfbVTyAS8VKlxpZs
	 AcYuA6PIjOwROJpeYx83oY9CIJVp+71zLyxcRgwmC8xMo9UF5agG1Hpyxh0QQ16srF
	 GPQH+S81yUhIIFGaM0C6aILZn8rb624D/dDzb6kZCT7CYcnSSPvmOgrA/T77DCafUI
	 h1+reil9iLHKw==
From: netdev-bot+sinfo@kernel.org
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] ipv4: Don't cache a pmtu above the device
 mtu of a path
Date: Tue, 24 Nov 2026 15:44:16 +0000
Message-ID: <179553505696.3294.4594349466787129471@kernel.org>
In-Reply-To: <20261124153730.56549-1-deliran@verdict.gg>
References: <20261124153730.56549-1-deliran@verdict.gg>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
