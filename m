Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDD7329390;
	Tue, 27 Jan 2026 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530736; cv=none; b=Lc3tl512Xgr/y4vg3QQpksoocW85vKJszDs1mqRRvVGaWop6R0h9QK7SmhbMAhwTuuzDnGV8PlT+cFHdY//jTwn6tYeOz1kbvunoG9l/dZHUANBFKUGLRXECu/f9NFgl7A7HVq1HMb2zWLRJxo6pIqMdUOrYQKjwSQ7BlsBmFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530736; c=relaxed/simple;
	bh=gWwadyBFgXG7MuqFc8i7dcaxPwObVtd7YJckOPo5ibg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a77T37s2c5C9+VrgzCqPRUf0ZhepGkeG+lZVri2voPqJ0yguDmo1V/8gQ6yvVVDRENkN4Ot8W/K9WkO+JE8Re4HuusAsOBvohMEvkFFsTTM6AD56q4D3AtPA10WasCKeB3PTBk/RsU4MKNGV36H2pjWv/kecRtxQAc2/f5FBCxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuPDjHyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuPDjHyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D57C116D0;
	Tue, 27 Jan 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530735;
	bh=gWwadyBFgXG7MuqFc8i7dcaxPwObVtd7YJckOPo5ibg=;
	h=From:Subject:Date:To:Cc:From;
	b=OuPDjHygyo8BEBZqX8aGW/esnxqMgK4tRly3Te3r+w4JeNrBAbZ7kfMfj8vZsZjZW
	 A+2flRfgQPJ733mhmngX/mIk4FHGbgfkhaHcejbyolYWwfg65kgZSYtrR05KuqVifI
	 IoDfajB8JkKBFbE/SS3UV6XL8EWjzIiU3sMvdbSPOabp1Xd1uzjzvA1o+E5F5Hp5ae
	 x4E8yGePLYJZT/0RRgPmZJmmVDXe2u3N5K1EZPq7anltOTeM8G2G29Ok22a4yVpo+t
	 3JIE5IrC8YnMElU+anmcS/tY6UjyVObtOXbOSFS9GlB9izbzqOWyj5XLJXDIiCDtgD
	 d/de2/xNlNtDA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/arm64: Small fp-pidbench enhancements
Date: Tue, 27 Jan 2026 16:16:13 +0000
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3keGkC/yXNQQrCMBBG4auUWTvQpCWiVxEXTfrHjmgaMrEIp
 Xe36vLbvLeSogiUzs1KBYuozGmHOTQUpiHdwDLuJtta1xpreChP17PiESu0KsfMWUaPFCbOs1b
 WBRyis8fu1HvfGdpTuSDK+7e5XP/Wl78j1G+btu0Dp8UF84gAAAA=
X-Change-ID: 20260121-arm64-selftests-fp-pidbench-post-sve-cf627394bb31
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=623; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gWwadyBFgXG7MuqFc8i7dcaxPwObVtd7YJckOPo5ibg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVr5kN6zDlcyb04eJjyO/VB3/RJ8OW0kl9uv
 jgoRknr2diJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlawAKCRAk1otyXVSH
 0P2RB/9yTbG3FRHLDskVDlkgGgSYg7JhZ9cxiHeWRPj1ovt5lyWvgBLhuBM3HodqsBq4Ty/owzl
 kAjypCTuu+RzbzKmlw8HjGsCxSr/0EYJF0PvEwoszIpwBAvbUva0T0qH4AW9ogkbEW2HjtrtSwb
 dKRpRyNzVLXa898bfQQaFKWsAfDoB+EJcB1Kr5AASDiR74MXMbfFkdMPC8vPR6MpPyVHR/SmWE5
 zAFOqlZG+/qMI3sFHyWd6v54SAXgaQHmtEqIBj6A+EVIuo5PPhwSY/yXKvplRvPVcIWzag8Abh2
 2xPTBCR9SX8jDAwksTcFzM8mkSJgxm9fzHmtBdgf5ec/mjgk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

I was using fp-pidbench a bit recently, resulting in a few small
enhancements which it seemed useful to integrate.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      kselftest/arm64: Add a no-SVE loop after SVE in fp-pidbench
      kselftest/arm64: Raise default number of loops in fp-pidbench

 tools/testing/selftests/arm64/fp/fp-pidbench.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260121-arm64-selftests-fp-pidbench-post-sve-cf627394bb31

Best regards,
--  
Mark Brown <broonie@kernel.org>

