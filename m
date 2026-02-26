Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014B38BF70;
	Thu, 26 Feb 2026 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144689; cv=none; b=VURLbUJl7PVRqg0O4zCOcw4Fi3QJIKv1oLydcpiV/L7MbNkUZCkzm4itFU2PcUgOVT9U3FIBEM4n2dLk/zUFuhZxRW7S40HQ415zD7xfhSDx2QJ59f8NJXTby+KVb0mTjIvJqrvGftRtc33eVYAfbSV5rHuUHwAiaeAFNHKMnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144689; c=relaxed/simple;
	bh=EDCQ0BnMH61KLb4Ps392T0LhudUVPpl4FwCMX5u7Vmc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fyiD/yS3gbnfRToJuELA6zdnNNsRzj1+C/OfXVOII7AxgEKpnbqdVOTkUPLjpQ/TbYd8y3lyEx5V/3+WvdZlIBcgVKQwf4Ai6uUm7ocnFlQsHHIRTh3xKp3kJc264/yTi1tl92M9AmJ8/DmJcMH4Es96PcfzobuvP5fL1CpJBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTiC7GoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTiC7GoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF64C116C6;
	Thu, 26 Feb 2026 22:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144689;
	bh=EDCQ0BnMH61KLb4Ps392T0LhudUVPpl4FwCMX5u7Vmc=;
	h=From:Subject:Date:To:Cc:From;
	b=nTiC7GoTN6cVO37TXwHX7A/JxQMQWj+tmq8g16w/cvpd3Y0+7HziCo4bPx41P5bmk
	 olk4KGn2kEjI3MawATPtywOrKXszoTv+mw4FdYTs5KeTVCF5cy+3+JQLHSZlnl5kD2
	 9HqCP1oBEIPJHO/H1ZVLS1pf7z2IAx/Eahlbq5ANAE2hdZz64pQa8y19vN1nFQpfbi
	 zE1AnNaTro4KdzxoE9X1Y22KXKwl1bDt3znwfcueS4+RSyMF3anuVhFyIH+FsfwaQt
	 1xjvle9nssHEbItmULZskxkatFID/EL1SWYR1CkVdCZRMZ7ScXe+bu6AK6RbATg+K0
	 +vUx6xEkPTCQA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/2] selftests/fchmodat2: Error handling and general
 cleanups
Date: Thu, 26 Feb 2026 22:24:41 +0000
Message-Id: <20260226-selftests-fchmodat2-v4-0-a6419435f2e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnIoGkC/23OwQ7CIAyA4VdZOIsByoR58j2MhwllI+owsCyaZ
 e8uW6LGuOPfpF87koTRYyL7YiQRB5986HLITUFMW3cNUm9zE8FEyRTnNOHV9Zj6RJ1pb8HWvaA
 GGChpQO2cJnnzHtH5x6IeT7lbn/oQn8uRgc/TtydXvYFTRs9KOkBkllXmcMHY4XUbYkNmcBBfR
 HOxjoiMOGFL0Ayr/N0fAh+EM16uI7AgEpwVmkuofpBpml6/FvqGQQEAAA==
X-Change-ID: 20250711-selftests-fchmodat2-c30374c376f8
To: Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EDCQ0BnMH61KLb4Ps392T0LhudUVPpl4FwCMX5u7Vmc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoMgtP7mdLpkaEbODhXXRKI/3O0Ka9IiRev5et
 WhqahKAUb6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaDILQAKCRAk1otyXVSH
 0BRCB/sGWZhqSuuUlKk6Mmx6STE9alep2ax55kJ/zuk4R4GCNxkLs/2q5ftm+r9HIy6WWRFoVF4
 bF+5cbnNk+X8xDjsxCEW7YCzP030Aq4VA1WvBIN+5DqgFFUSFMhilFqh46756rJJ0xP+hHgWIsW
 1zKLFnSiI8JcB4UGvJDvBBdqxwPj+su9q/5kDk+xOCNKpGAmyx+q/tvtxrDCYQc7E3VvUF7SXcI
 U66d4cBUYj4P7SuNlCYY3a0l67SuR4gmyyqj5EsVLfePKHIe1q6UGKxIaQZ3zEZwkxqt4kTcP9Y
 xZdF82nThbJXSjb48HpgUR4TTpHv7OvAatAMKkBJiKmk/E+/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

I looked at the fchmodat2() tests since I've been experiencing some
random intermittent segfaults with them in my test systems, while doing
so I noticed these two issues.  Unfortunately I didn't figure out the
original yet, unless I managed to fix it unwittingly.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v4:
- Rebase onto v7.0-rc1
- Link to v3: https://lore.kernel.org/r/20251015-selftests-fchmodat2-v3-0-f243fd281439@kernel.org

Changes in v3:
- Rebase onto v6.18-rc1.
- Link to v2: https://lore.kernel.org/r/20250812-selftests-fchmodat2-v2-0-f2d5380e94c3@kernel.org

Changes in v2:
- Rebase onto v6.17-rc1.
- Link to v1: https://lore.kernel.org/r/20250714-selftests-fchmodat2-v1-0-b74f3ee0d09c@kernel.org

---
Mark Brown (2):
      selftests/fchmodat2: Clean up temporary files and directories
      selftests/fchmodat2: Use ksft_finished()

 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 166 ++++++++++++++-------
 1 file changed, 112 insertions(+), 54 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250711-selftests-fchmodat2-c30374c376f8

Best regards,
--  
Mark Brown <broonie@kernel.org>

