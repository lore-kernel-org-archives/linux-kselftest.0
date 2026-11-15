Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773336;
	b=1QZBzss5Ro2ViZhzJtHQwiWWQM3ZYRssQp5Vd5QbUb8mAp/VAMkqYwJ8eGdH1ylA5SaH
	 kyune2IY9pjT2xBpBHHgeJC8rNHF1HOZ5ZnLgKNRwfyfEV6UZeLGbptae3K94mwnt/P8F
	 NU/UQIScPjquFHNJ/E6fFCSBlUZGOT37sK5nhMel3a/enDHcVSiSLJ2XXgvomGR5g7tFm
	 DIIuhf190ZZYwyJB4WV16yaseeIKH8MOFQkSaHOyInVG5iDuk0Vv1oyk0HuOB/49pJVod
	 Of55M0JXpi5v1Yt28ObfcTXoC9NpgQiQoLwmfbikWNp1aMmVsYcZ6LBWaWqCajBucjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773336;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=CxP/rhg5EJJqMTKfegt1MeL56RJD0NBq2iSQqHcMNJoWukBseWk3FhHYI+1x3gtkLv2M
	 aVLxX9dJoH/R8ph+Fn3O8hfB3UBIBJCEc/4JZ9CMjuLiueyAOcNN2kofjHUuVU7EJuNPU
	 AvuslL31yoszbrhMoeT+McYw82xXqu17nFrMVYTduRQ9goYJUrNDZ208XnAM0FxNLfPsp
	 Q3xAQVrR/G+fbV6F9XLrxNf93BQUKTIGLPOXaLr/OBPy4DILQeshxzwY9xjOKO3Aryejm
	 wVPyPl9C0sjYW3WZwqTlUp9S4w9BPQMhh1j5OhppVnbkZzC+81RIJNmjlxCsbwFMUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mx0CXMRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8967606A329;
	Sun, 15 Nov 2026 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mx0CXMRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8017F1F000C4;
	Sun, 15 Nov 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773336;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mx0CXMRIWbjjJy+lRVNcK+/BfF4VOg+U+mnosucTCkN2PSob19mnpb96zuWzpQIlv
	 ckrUNwE5HXHITuW3c1MlKrm4eSps7kg1UHdP8Mwg4dt9VkVw9sZ/q7Qs3gIDwFXlsu
	 qoVq4ffj04RHP7CoUTBzwSPwLndVirTtInpjxu8NdIUtpESYWKZfRQQWrsVb6qE9Kl
	 c3ccBnkpGS46E1n+yR4qJgWyk50lxIz3TAslYCi+Grdkhl1B07ljtqJzasR6spoRqQ
	 BusW7ZaLHj2XOWujk4iK/YNaj5W2TPb8klKCdI0VlcRdZ3BT5SfboNmltQ9XgrHgNr
	 zC+FATBS5zjSg==
From: netdev-bot+sinfo@kernel.org
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next v3 0/6] net: devmem: support leased RX and TX
 queues on netdev unregister
Date: Sun, 15 Nov 2026 20:08:55 +0000
Message-ID: <179477333507.3291.8047663595939414550@kernel.org>
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
References: <20261115022607.348112-1-almasrymina@google.com>
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
