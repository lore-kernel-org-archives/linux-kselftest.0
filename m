Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78453815C3;
	Fri, 10 Jul 2026 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706733; cv=none; b=fe9+SzKXcFpCInGYSItbnUHoklI4CDushTtFMXld3Lc63TuFf3MVDJCQi/nbK+9G6d6gAyuFjoAb4+7zduYeWRAm4/vOyHpEVI8fK1o+b+WVvea+D64coNsLVG5yrmfoe0Cotdp2VNgFbpWKeT6WGz+GIWOBNfljK+n2L4B/dGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706733; c=relaxed/simple;
	bh=eOYR1/8A9kllDNapHQJ7JqQxvyC5i4C16svrTEG3nYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkipCGHnsQUNJlO6oovqsEopBumaUDpxsmf3wKtmuGID7xUAf2G/ISRy5JB5DsNLY3c5m8F1LXcPTwBg8yfJOCCwcxZUTBXI+pwEwcJcKQQ0TXi9Ef1mz1MOrE4ug/7bylSuSh18YC0XiVTCg0m8o0VAuDyMw4aL8J2TOI6JL7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQO/lh4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQO/lh4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6421F00A3A;
	Fri, 10 Jul 2026 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706731;
	bh=kciwBDf/7w91AHy6DMhCTuHZYc7umlKDbntKijLsGKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dQO/lh4ndegPa2UyJOCXFvs2KJ9mmpyUdmg9TG9rpo/dmHkLN7o8wVgKgSMejtkH7
	 eWRyKhDqeUCrBYa/UVAcWZ7yhCe9Pfg4CuG+/QucbfW1FpTUkNUsTo+TUDBKKY50J3
	 QHyPPcjiR7yIJHAB38MF6OFTqT9C5Esluc5ZaC33XwmnVm5+/1A/BGXBd1L8zH4Y1+
	 cyhYzFjdn9zFCL8wE5X1/2vQMFJKfvh88U12PpHXv7arDWAoWT9/Xhr+6p1Jk+4L3R
	 uot8XqPH2RRQjPCtwNL+5/9jCPbr/KFps3c3iTqFd+K7ErWpBWA9Tay9rkayrma0Vy
	 CCJg1Ozu+5dBQ==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Fri, 10 Jul 2026 20:04:45 +0200
Subject: [PATCH net 5/7] selftests: drv-net: increase timeout
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-net-sft-fix-containers-v1-5-a2915c294ef5@kernel.org>
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
In-Reply-To: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=eOYR1/8A9kllDNapHQJ7JqQxvyC5i4C16svrTEG3nYM=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLICTSIu/eAQfCVaNafddX5TWustT5aV/be6k0/9aaxm4
 /5rs7W/o5SFQYyLQVZMkUW6LTJ/5vMq3hIvPwuYOaxMIEMYuDgFYCIVtQz/VB5JZnS03p04K3Dx
 Ib5ZCpfljFvyTsuyH+i4+uN0cYu1M8P/lJK/5bt3Xvi9Sv7Iu3cyAk4311XMOZ65wHZ+lcSa/t9
 bGAA=
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The default timeout is 45 seconds, that's too low for the xdp.py test.

Indeed, this test can take up to 3 minutes with some debug kernel config
on NIPA. Set a timeout to 6 minutes, just to be on the safe side.

Note that the Fixes tag here points to the introduction of the xdp.py
test because I don't know when this test started to take more than 45
seconds. That's OK because a timeout of 6 minutes is not exaggerated.

Fixes: 1cbcb1b28b26 ("selftests: drv-net: Test XDP_PASS/DROP support")
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
To: Andrew Lunn <andrew+netdev@lunn.ch>
---
 tools/testing/selftests/drivers/net/settings | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/settings b/tools/testing/selftests/drivers/net/settings
new file mode 100644
index 000000000000..eef533824a3c
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/settings
@@ -0,0 +1 @@
+timeout=360

-- 
2.53.0

