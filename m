Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686762;
	b=vy3jxHcfJbvXHq6mSJDWS/TrVsHhGy/xujFfEfKfihQV97ZE2C7RFv0WuoQhSWbphUwp
	 EXnJhFzctM9tf7Zi+0U5pYNjR1NZ2Iscr1jhXajqtecZVzKKo1KVC3ycSOCOySgnHceg4
	 B+iprQD3r6S6hrIArZ1weqwXd+P2wUkywCXoOpMpIN3tNQFZVGwUwi/7EqEQiUjWhIc4S
	 3VvgDdlolV4CjblUrl+qHk4zKvKj+StXD+i6g3BuudRaRzwegRucnj2dbgHUjbf7QQWbs
	 A9kOTgBt0nY43JNXfWzW5J60Sy4aLZuTw1T55IFangFy3ww/Vzhj3klYUqpv85gVtFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686762;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=S+lloa/uL8NOzMjsT1DGxcdJOimEOfrNtYGnzJY+3uu6vha+oI6lUsUigl8QdFNDmhM7
	 ozl1/TWL3N3EQUO+idCveLpQw10JkXF/uVG9em7TMnev2Hp13NVNB/o3y1fQFFIIDpiOV
	 aIwJUTj2orKseaNYa7KB9kPIyeLIh3vY/gRnmrPRFBImOcUQ5nj6xj26DznsNpF8MZWwp
	 8I14SenrDTgWZj6aPcXIaJ7RR3Ht67PqSerWF2uAdd7i0nIsSzMsGfzgEh02vGaYtJAs2
	 N2Ou6CfiK122iIU8L/pHWBxDT8scCO5xq74M1HDCIIdywkQZVWFx6LBdVSsRjVbq83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys+wYQWG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3A1606A326;
	Thu, 26 Nov 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys+wYQWG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EB21F000D0;
	Thu, 26 Nov 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686761;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ys+wYQWGGcbJeTfBrLmhTP+DCqwejh61nwS9XuJ42hdUAgCf0XKaLCVc8BQaHMwFj
	 ZeLkzJ44YkASJ/eRsfBqP8zkFXxx6V+PHVsFbBETAeMujSBYOHtNSanP4T8WsH8+US
	 pgxB3j+vCeI0+fDYpCUNNU2k0aN29dpmOgOSngDfvrgGCaVIGrrztZmGM9WfVBlFMR
	 DCr8nPvyn0VEiTISX6WQj4HofxJF92QTDldWhgBgzQ5pAYBKQ2sb5gZNIQokxq703l
	 1B39hRBNB3Fw7QDh8crj0NCwLVqXwcVEP1JU3Xw/K8LPiliOU1uiVTBbbEcBm67Cz5
	 jpreiR6BS7Zxw==
From: netdev-bot+sinfo@kernel.org
To: Andrii Pasichnyk <apasichnik9@gmail.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] wireguard: free queued packets on peer
 removal, and test it
Date: Thu, 26 Nov 2026 09:52:40 +0000
Message-ID: <179568676064.3294.9567118397760540141@kernel.org>
In-Reply-To: <20261126094722.73025-1-apasichnik9@gmail.com>
References: <20261126094722.73025-1-apasichnik9@gmail.com>
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
