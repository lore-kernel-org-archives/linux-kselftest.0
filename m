Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724869;
	b=ofSNzfaIuk5bzvrMzfr4utEFdumT4F9aLMR33SRPZ0kUwkjDrTU+jTViM1RsQ9G1Jux2
	 UPUunWLwgcGHzGQ7ZyVtS8uxNMaKnBPhBwmcAuTnmTRRnWLBSCLrtrT2Hr8zlFI3ack/s
	 IIjXhAoi0vQWMkRfkawM6NDQT0OMTS/7r5Hp9G24sZhzYTa9mpEnCMYAgXC0QPQfD4baA
	 XnYdmUhI3bJNTxrBIVus7yboJKDg/AwQMQhRkHWb+hI7b1YEzaSQc385++WefRfpfb+Gr
	 JVpZWYv8Z042Jx1gER7BeAvafMXdhi31QHcvnpMQYv0U98Yf2Gxtpl1osmti1aX3Qxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724869;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VwLmXbxU91lRfKL2iRheEIften8r0BgVcs9fiXKoTcg=;
	b=WorUQ2nW+F3L2fJ5xss768wT+zKRIVOF5rj0IQV2VSh4V3ItnldX3Qu8gjGpDiDiRpDN
	 w2vj9fZB651ZJDkDGv+73DjB5EKbNxhcuSS6R5YP8lolh97GahiU+qc5QQ5Jk0vHEyhMf
	 9kJJ7CADblq5MhZ9C8X+XmAd2lQX+uTiEbG+NYqeXIdPAVXqwfwwA6XdzHh1nM5IlmHpl
	 jh4LmKJOfB1tQxx6a1doj+5but+GWL3akCiDLWBb0ODQtUl9ginf/TphmjPOzvMDL6UF+
	 fDUN4DyAQw+TLYqIZXtImYrqj1NOPTL87W20XWrBfxh0/6UOgd7VWkkk1r8NDUhl5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arrnO611;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F3606A333;
	Tue,  3 Nov 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arrnO611
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A709D1F00919;
	Tue,  3 Nov 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724868;
	bh=VwLmXbxU91lRfKL2iRheEIften8r0BgVcs9fiXKoTcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=arrnO611IZwyoWaY1V9AcfKmMhFFjczf4DebS4KGC9bTut5Itz8CLlrNwntO3Ng1T
	 6WsT4gpSk95fnKpY59ct2Oep+wPeFCYjLDZf3j8lXaDIbkfCelJxbrvRqBlh+BTEMz
	 fCP91wjx0eKlGR4ES73O9tURQ4EV0kIZT8vz5H5xMbM9MVQ2NzhfhN1xVESJO+gJes
	 BytgJVJDhW20+17/lRKt7SFsRI99U1I9KA31RkXzIBGEfDfSNSTBZ9H5yaBQH/jeQt
	 P+FAdWAStEgDiaa/Rbr9lY6mvs3PgCTpVZ2Bp0pYPx+8MUKpFcKgO/7LTvQ8OU/U4y
	 jVQ2M4G/6Ydbw==
From: Sasha Levin <sashal@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] selftests: net: tcp_ao: make the netstat column pointer const
Date: Tue,  3 Nov 2026 11:54:19 -0500
Message-ID: <20261103165419.687806-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103165419.687806-1-sashal@kernel.org>
References: <20261103165419.687806-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lookup_get_column() stores the result of strchr() on a const string in
a plain char pointer. Since glibc 2.43, strchr() returns a const char
pointer for a const argument when C23 features are enabled, as they
are with _GNU_SOURCE, so gcc and clang warn:

  lib/proc.c:61:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

The pointer is only used to compute the length, so make it const.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with gcc 16 and clang 21 on glibc 2.43; KernelCI's gcc 15 builds
show the same warning.

 tools/testing/selftests/net/tcp_ao/lib/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
index 8b984fa042869..50062b527a393 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
+++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
@@ -56,7 +56,7 @@ static struct netstat *lookup_get(struct netstat *ns,
 
 static struct netstat *lookup_get_column(struct netstat *ns, const char *line)
 {
-	char *column;
+	const char *column;
 
 	column = strchr(line, ':');
 	if (!column)
-- 
2.53.0

