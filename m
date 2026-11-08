Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148956;
	b=1ME/7S2uLiSgaoh7PtnV+hkQZNw1FjImRcx+XmprUgb057yMkapv60j7kqTu+OE2yv5j
	 O+P33PvlUNpltlPBvUjtKT/5bCU4hhcS/4+2Q7ZoM7byWHbiBHyD2W5pzlnBUyt/XYKap
	 7xXpOj+at9MYxfhLNXsqo1mIuBOG1GoR/YQf+lBoYSneLoUNgxCRuNXpXMg0SS9xMvhTL
	 XOXikyEgbTlQ/I7HFk9xAtmNFIBw2j7LK0R8zPIV51dA6i/b05+iSwD6CgnMvrWVsmCHS
	 KLNOZ7N4ENi+Uoxa8MaJ7bcqXVICDH5syifZ+DVNugEH5aNdmOO4AowE9EgcId6CoLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148956;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=H/OqecsM4H7XpDWZ6E4XA1Q4MUakL/V9/gwmFPjLQ2W8nW+DH2d3cEGvsvbF00wgWJhU
	 f4Vuqsg216Vd12utlK3klyNfVBLT5HjB/amUh0hlPBSonb6k/jWn5NThLqpFF6sN0Wk9n
	 ZIxLlSnr+9QWZ8VPBXluKvAec8YucX3a2sIIh2o1UoRDS8x+NSuOTizB9RnXf+ARcQlEK
	 KKzCZe4lNYJLAoc0pxGNJjdt1FggometIfMoLb5dWt5dz58pw+KgSBXKsJwkmpGhKaTpf
	 UU8xFxWjlOc4oX+O0JzUeXGo1oJdpCh8lWjyeLilpeytb3NTEEK/bivxJCif1aJixNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CD7O+Wdt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA43606A31C;
	Sun,  8 Nov 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CD7O+Wdt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593BA1F0089F;
	Sun,  8 Nov 2026 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148956;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CD7O+WdtocnZxBlrXJLtAhC1+VcQ2Wymm4I4HJ4A63CNg6a3gvuzyCyM63TC+OKkM
	 9IsA3jvh2HEb8tbM5ZmCR76WMzVEBWVUdza0Kgf/tNys43YDoRS1LBfB8i/rcdv5AA
	 Df1VqI8lK6HwFja7uGmeYi335R+YbdlcaBNF805WWq5aa6TNQUIHdPjES7h8XqpGLW
	 MyRTg/Zul6ZwBdVgHfnFtVP5vUdmt2kbq7F17bF8HEbUdWe9gmP1ychbM4wyLBCxzS
	 08qfUkL/68xfHdtJEefZLUTVVj2RHyXsKG7r5IOT8dlIU+zabhLYdz+u/a5ETumYU4
	 efBdDZ1xAOiqg==
From: netdev-bot+sinfo@kernel.org
To: Yongjian Wang <echoowall@gmail.com>
Cc: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com,
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org,
 edumazet@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, panweiping3@gmail.com, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
Date: Sun, 08 Nov 2026 14:42:34 +0000
Message-ID: <179414895487.488859.839196891969031483@kernel.org>
In-Reply-To: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
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
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
