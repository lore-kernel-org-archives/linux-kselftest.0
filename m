Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39A489FBE
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539935; cv=none; b=mGeB8x8QLu03hy6ZpNj0t1gV6eoyaLg1PtKf5R1gMpdoTW4mwXiQbba2LpQOy5P6n6nvmgdYGlD4EeVhMTBqQ8yq/frmH0dyvw/cSRBIqQlrit6fSQHJ/Xy+NaiH2th2/QHeI+aMaeuc3scuONGSlrbLHsOVLyEPobpkrICYrNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539935; c=relaxed/simple;
	bh=qhW4DsstDxHDNS4FdKnEy+MnjMpUAMEn0mq0LakeoBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bg+PiYl40rRjRfQZ1on1qgkd3qVDFHvtqRS8dRmJTe3Xxqf5CNhFOJxO3zug9AQa09xgltG7Gx5z98AbZNSt+9diaTCrP5NWaXYHd1eF0YTE7EC0AZvdrxWxlKYq4vM6gfRx5YaAH9Vkhi5bHA+csQrk4IZO9KnDgwEFu+ruxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LAndHGBQ; arc=none smtp.client-ip=95.215.58.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LAndHGBQ"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qhW4DsstDxHDNS4FdKnEy+MnjMpUAMEn0mq0LakeoBk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539930; v=1; x=1792144730;
 b=LAndHGBQT6am7gbAb2uYDB3ZHZspPpbQ0TQPM7X+FsyykNtc+EYMI7VDJ1iNLYiQCob4RVuK
 4oqcwrKBiottTjAjSN5lF95ivXRdvSjm6eIX8d1DfQiV9Qu3BUU2UWdhaMfFwgcUPfy9tq90Evt
 U1EacZykec+u0GBSdJpfZKN8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ab1867499928d1b3;
	Fri, 09 Oct 2026 09:58:50 +0000
X-Mizu-Trace-ID: ab1867499928d1b3
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next v2 0/5] seg6: add End.X PSP flavor support and
 selftests
Date: Fri, 09 Oct 2026 17:58:36 +0800
Message-Id: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQqDMBBFryKzbkoSotaueo8iYpOxhsqkZCQok
 rs3eIAuH4///gGM0SPDvTogYvLsAxXQlwrsPNIbhXeFQUvdyE5rwTE1w7SMKUQekNwmOnPrlGp
 cLa2BsvtGnPx2Np9AuArCbYW+mNnzGuJ+niV1+j/dpIQUxkllZW1N+2ofn33xFPhqCfqc8w+br
 AZ6vQAAAA==
X-Change-ID: 20260922-srv6_flavors_endx-9489116d50c4
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

This series adds End.X PSP flavor handling in seg6local and extends the
SRv6 selftests to cover it.

Patch 1 splits the final forwarding step out of end_flv8986_core() so
RFC8986 flavor logic can be reused outside the End path.
Patch 2 uses that to add End.X PSP support through the same
end_flv8986_core() path.
Patches 3-4 refactor the PSP selftest setup/cleanup so flavor tests can
be added more cleanly.
Patch 5 adds End.X PSP connectivity coverage and updates the selftest
policy parser to accept an explicit action field.

The goal is to make End.X PSP behavior consistent with End PSP, while
keeping the selftest structure easier to extend for later flavors.

Run all srv6 selftests on debug kernel. All passed without error.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v2:
- rebase on Andrea's "seg6: ensure packet data is writable before modifying SRH and IPv6 DA"
- Patch 2: Update end_flv8986_core() comment for End.X
- Patch 3: Move ret check in this patch
- Patch 4: Do not remove noflv route
- Link to v1: https://lore.kernel.org/r/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn

---
Hangbin Liu (5):
      seg6: split final End process out of flavor processing
      seg6: add RFC8986 flavor support for End.X
      selftests: seg6: move SRv6 End PSP setup into its own helper
      selftest: seg6: add explicit cleanup for SRv6 End PSP test
      selftests: seg6: add End.X PSP selftest

 net/ipv6/seg6_local.c                              |  27 +++-
 .../testing/selftests/net/srv6_end_flavors_test.sh | 165 +++++++++++++++++++--
 2 files changed, 177 insertions(+), 15 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20260922-srv6_flavors_endx-9489116d50c4

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

