Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55424BBF4;
	Thu, 23 Apr 2026 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776968222; cv=none; b=bIQFZX95NE5mINSN/n91e+1ci7DSCSToOVPjgZwXnA6M3ZfNbs5ribJMpC/TDowY52ObWS7qdUK51czXiIv1ooeM9+lspyRn0RBqRlljLWN2uZB4r13z/oJ+vr9Tjmc6ZB3h5CmuERm9hoOm4GMJ2CmUzkoCuT3SB/0l+Qvgq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776968222; c=relaxed/simple;
	bh=b1LL6ulHBfQwaDgZ4XLaE5+gWGEFezArPt1f3E+uDb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fNV26IbcO58eGyIQZ52uIFSpJFtj24e/MpDa2unTqA+dkrtfq2WtwqbOR4ySizQiuC2fWp8gEdfgvQyvdN4GFTQ0rOv8DNhvwcGSsNujzmopbGRsWZ6re3XwHRQBUuE4LN5d/zXVQ0kepTRvvv4cRNJsOD48BQzeHvGWPLp3m6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc4ybVF/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc4ybVF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D38C2BCAF;
	Thu, 23 Apr 2026 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776968222;
	bh=b1LL6ulHBfQwaDgZ4XLaE5+gWGEFezArPt1f3E+uDb8=;
	h=From:Subject:Date:To:Cc:From;
	b=cc4ybVF/qX0bkCNpPAOKSiFRElX7csIyBf51KZ9k10eLAtcr3vRLwYT0zglPvds6U
	 L236bhs6AYt7iaZNvDYz8aiyuw9FBdXtg1EoQYSrRNLPEKzv09YZNWntkrdIKuxbm0
	 /aox1WTJ8rh+T4n7nURWdtugFMsJml7C3lfXs8T7KVA+rrdg5dArFkx3TUE3LpAW98
	 aZKdmynb4+nQjzTcosIxe3X4BGYrohia9CaYMOc+crnyvJ3Z9wqwZxgSDgI7AmlFRR
	 OhcEK3uAOj87M967G+wRjxwMAHBCLL46xk11jKNrwlEckf6Tz1/Eeho5PfW/RtZWAA
	 6UhhifNHwu/gA==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v8 0/2] firmware_loader: allow firmware_class.path to take
 multiple paths
Date: Thu, 23 Apr 2026 14:16:43 -0400
Message-Id: <20260423-fw-path-v8-0-9426735330eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTU7DMBAF4KtUXmM04393xT0QC9sZNxaoqZwqg
 KrcHacSJCjq8o3mezM3NlItNLLj4cYqTWUsw7kF93RgqQ/nE/HStcwECAMSLc+f/BKuPQ/gVZI
 gtA+ate1LpVy+7k2vby33ZbwO9ftePOEy/e1wfx0TcuTWOdX5mA26/PJO9Uwfz0M9saVkEg+ga
 NAFBEPRI0W1g/IBlA0GCxjAxdS+30G1gQJWqJZXtbIkMnTJ7C/qLZQr1Bw4ORdFJlQ6yx00K1S
 AKzQNKopkQSl00u+g3UKxQtugjpZ8Uhhcgn9wnucf+F2ka/UBAAA=
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=b1LL6ulHBfQwaDgZ4XLaE5+gWGEFezArPt1f3E+uDb8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBp6mIXEbyvzTAb7hfzcmYQoOjKP0al54r7UT+5G
 whcI2RHHT2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaepiFwAKCRAADmhBGVaC
 FZFiD/0es1l5sVkLpL1s9VyWe1WTDmof60nrJIR3oOxJCkWydqXUYQUjM92BAdyYJwMEVbSROne
 C5tRf19iwXiGFeOSS2zHslOh6VoxQqWWiPIA+zTwWkrKnukCPTStScFmTQPFaiz0n43QMQvqPYC
 DkFZL0oA3bGHeVP648cnEnOMzzV3qW+LtBlq00m6RMVr1msgp67VzgEIJTTDEk3vE+591foeZ/K
 maepTRhDT+QBCSsUSWBVCa34rqFSccrR9611tVouz9CsnPwLuXZXwgbb1qZbUXwIcckXj9AtajH
 BMlwAo0PymVD2j8oDl9zNext/vBH3KpUK/ceBYCkzDP/GWijHIsn3Xik1pHVedwZgCybxENN9gb
 YB1Qaf1gKXdrvw6m0yEz2D1KWwMMgp1i5Bqc/4mimwluovDXsXsGt7lt5LmHypGECrHUHLaKEtD
 /F/45KI2KlJzDZTjmPQp/+m302oTwG1NcvaNE4fb2+jp0Va8cKTUGW30WAFODW9OFwGsehynqp5
 aDFmYSOZjJvBIaAPsFm11xPjIsqiB2ij/wyayGLx/uiek3EC/nEZS5Jrf5zpc1v2CKGRo+eTwTk
 XeRSeK4/4njL2oIp2FRjkAGT35ZO8di6gUeMlGyWtt4Jme+Xq8Ak1miVqtph44JNX6tV+U+N28a
 JXxSa+PpXt8NNOA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

This version just has a couple of very minor nits fixed that sashiko
flagged. I'd love to see this go into -next soon, so it can make v7.2.

Greg, are you ok with this version?

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v8:
- add newline to output in fw_search_get()
- fix test #3 to test non-present file properly
- Link to v7: https://lore.kernel.org/r/20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org

Changes in v7:
- re-escape emitted paths in fw_search_get
- fix potential out-of-bounds read in fw_get_filesystem_firmware()
- ensure all files are cleaned up after failed selftests
- Link to v6: https://lore.kernel.org/r/20260401-fw-path-v6-0-4ebe70441839@kernel.org

Changes in v6:
- Add fw_search_unescape() to make the search path parsing more readable
- Rename search= to search_path=
- Link to v5: https://lore.kernel.org/r/20260323-fw-path-v5-0-e88b2fe145f3@kernel.org

Changes in v5:
- Increase search= string length from 256 to 4096
- Preprocess search= path when it's set rather than on every firmware load
- Add selftests for search= functionality
- Link to v4: https://lore.kernel.org/r/20260320-fw-path-v4-1-7547e2f0dc64@kernel.org

Changes in v4:
- Move search path to new search= option that is tried after path=
- Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org

Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org

---
Jeff Layton (2):
      firmware_loader: add search_path= module option for multi-path firmware lookup
      selftests/firmware: add search path test for firmware_class.search_path=

 drivers/base/firmware_loader/main.c           | 306 +++++++++++++++++++-------
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 217 ++++++++++++++++++
 3 files changed, 448 insertions(+), 77 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260317-fw-path-a094c30259a5

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

