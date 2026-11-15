Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773559;
	b=LEyQ+T8ebxdBjE5IL10tZkf1VuT/QIiaD4EldODsCbiAuHjNgNI1hy9UQm997EmgOj3x
	 rUAOcB1OkQOGVVyTCGXvp9fr2TesCPx8dr3wAaQKPRZ8fnAea3SjwELOZ7W2WdnTAhiZi
	 Q19x2KDvS6+Rz4J5cbR0YXOiNqN+epu/TS2MVDCX/mU2jgeKr73JvKKyI7lJwcpFO7+Ls
	 v8+VrUjV6GGGpsURz9vl7kM+7ERjvaCdTFVBtrCuKWz5BX+yJpHaKhPTkS0Mg/1MZVpg8
	 d01epyOseKLHtSPyKb5hOyrPAkTSQ/82S6ANEAHRyQyTe7llCJR+lrlLgii5Vnk2JAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773559;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=dq7vEWpwWp/hYu4NkwAvrzGKK5ITVLfVc04snUIEgaVbjo7kj4aPc3DqtAQ9/F1lekwF
	 QjBOVav41hTo6qTdwPW7slS6yC16z25H2muKwxScul1aTnp8KVZyDHK9Ao2kCeS+HvLsp
	 KqpszE2IvEg1iCWH3Lv+xGz6+xU1c0tvybq3KnjmMNk9kL9YpLv+C3YQmmV+TDVRoNHNv
	 U2nte8MfFcdEE92yPmBL/tldJgqgr/4loBZoeq5wu7jIFZ9hyOwvRDxXf7RFGQnTOtDH7
	 JEVF3B+KPJ7cfc/wC1BySktKf3L2A5WIm9aXjOo4fDfmsruVdeSOY82MLu0iT0zZ/Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzARKehS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32F9606A31F;
	Sun, 15 Nov 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzARKehS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C941A1F000C4;
	Sun, 15 Nov 2026 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773559;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SzARKehSDPzvKXn6wz0JKGbc/ovlYkS78C4cOFPTQ6dWJPVEGSAuw8FAlk8nc4bMy
	 rCHStqvf9rAigIxgNkqR0J2MrBU3mj9QqeTe8Xwr/djvagXoahYe3cQJtBgm2dkR//
	 OzfGcNPpHuE2voBxj7THLUTd8jEt9GEJhdi4Cg6RekSiiy+9Yt4QkYx7cb38gAtqTf
	 fC4QifJXzYMtTdZH62E5d8tLDWLyd6vV1CzPtGBHfYbKP4vQ09aurmilOLuzh1nsKz
	 ENwxmbUf6Iqkvcx5E1Lhi+XbR/9g13/qqzIHhqHJyFBvWs76ufjzuwFZOz2xK4zp8/
	 sry/aOxl8lypA==
From: netdev-bot+sinfo@kernel.org
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a
 failed change
Date: Sun, 15 Nov 2026 20:12:38 +0000
Message-ID: <179477355840.3291.10898450599671542519@kernel.org>
In-Reply-To: <20261115163134.3202677-1-houminxi@gmail.com>
References: <20261115163134.3202677-1-houminxi@gmail.com>
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
