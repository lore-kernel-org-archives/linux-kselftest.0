Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BA61A317D;
	Thu, 16 Apr 2026 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776301486; cv=none; b=RcVQzP/ek7tFTcRey6QgQmsOOsu30SP5P1+l3lF2d1p9pDmKLlfNaY5LLZ77US2feWFpNkVoIrJw/M0axFA5yqGBl2KDR2HyrohvIqaCacyU1yw9EJ56Vu3mJYR2fCAQbLNgAEt6jSGBTDfeFIydJiCSO56fpvnAbuR4Wnr0uOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776301486; c=relaxed/simple;
	bh=ylw3EBQB5bmUDkGUqiM6coiGIfTgnOFrvFHg3T3UN9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PvnywYe9pIHLz0OULIWrdivO3i/E4+Xji1d35rLykvqYWk7EzwolIq06Io/jgjRmumiQwsAVLMWF/CXAFd6jsrGbPWEVyxUw2ZzN+CUHS7wmorgrGemnQaTHR/g8PxhXH1HDZmTvFOFng1A561xMVzoAqRY1AtQFKRBojY8+SRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4BaxWxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4BaxWxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D20C19424;
	Thu, 16 Apr 2026 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776301486;
	bh=ylw3EBQB5bmUDkGUqiM6coiGIfTgnOFrvFHg3T3UN9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=o4BaxWxQ0HIJd8iD4ra97DcWoqxIOk3TeU7cy2cJX+5SCQ9WqxwSGw0xLtDFThUe7
	 3xqm3Pv2CyQH3TDbvKIEFxbURr8qmsu0CSVjTkw9hko5z9PJ9pN+klRD52nbpW5rel
	 RqucbUo8QVH9eN0iDN6SxjTKbg0kq/4XTBDKQK00XlagD7pqTivokR43v1SUOUXo5b
	 sqKMNfu3euvd96/WxjUKWo3CDBnxd0rgXXP2kYrFSx4qS7E0+AqaSyi+3zwOBH81vA
	 t0dUQ5aBBJQIx20RiovwarMMWN9rORRBCN6FZFtlOn7N5fxqPjVozrjHf8z0qYInXV
	 3D7gS1Kllv/zg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	fw@strlen.de,
	antonio@openvpn.net,
	matttbe@kernel.org,
	phil@nwl.cc,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net] selftests: net: add missing CMAC to tcp_ao config
Date: Wed, 15 Apr 2026 18:04:39 -0700
Message-ID: <20260416010439.1053587-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes to crypto and wifi made CMAC no longer
selected by default on x86 and tcp_ao needs it.
Add the missing config.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: fw@strlen.de
CC: antonio@openvpn.net
CC: matttbe@kernel.org
CC: phil@nwl.cc
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/net/tcp_ao/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/tcp_ao/config b/tools/testing/selftests/net/tcp_ao/config
index 971cb6fa2d63..f22148512365 100644
--- a/tools/testing/selftests/net/tcp_ao/config
+++ b/tools/testing/selftests/net/tcp_ao/config
@@ -1,3 +1,4 @@
+CONFIG_CRYPTO_CMAC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_RMD160=y
 CONFIG_CRYPTO_SHA1=y
-- 
2.53.0

