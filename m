Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071574F5EC
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jan 2024 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196763; cv=none; b=t8Du0KE6MCipZcEOwrEAHcI66ASvTc+UoMnDfmnliBvRkr9W5LrZ8/kDUt3+7HdCEfOxpuFTlBbdhSG+VS1MJTTCIfmQ1vAC/20xRv9E0iEwc6O/z533zgv+CmHdaRODWkjDRoigTmQpOvQeMHM2BlTW8KpAmD7vYzDJv/rOcLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196763; c=relaxed/simple;
	bh=WX55qrtb6obU9n+zBqneZj374blgH3zEv2tkR/PMhZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTCtnm8HMtla8uVpGR320phX+u0YnFH9HVMbcSCdoIBkiFA4hm+2x7caAHHkV/QaHykQtCyy+bS7t70tOZo2HBc+JZHvFK0UXjmdZaAhdbmacbxg31dGgiebtbY17Hj8tO/HJcCc3qY5Ar05nH2jugL3GDaC7NmkOeDUzWG5+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=SEr/5czF; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="SEr/5czF"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4TLPw35JYjzJW0;
	Thu, 25 Jan 2024 16:32:35 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4TLPw32FWLz5tg;
	Thu, 25 Jan 2024 16:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1706196755;
	bh=WX55qrtb6obU9n+zBqneZj374blgH3zEv2tkR/PMhZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=SEr/5czFbwkCSz+r2kwk8w205kQEuZHtzOvJDnEV2INYzqGSlYTWtudxLcAprxx2S
	 WOI5mA8IKqj0F6U/7ju8ooRJ4mSlNQfMPe8h4FMvP6tG/J8AxPzQhjAcumQ1w6EDcJ
	 dcomWpUJwnHexWcm6WcK7IV1hr38/DqTcQtSuyeQ=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v1 0/2] Fix Landlock's net_test for non-root users
Date: Thu, 25 Jan 2024 16:32:28 +0100
Message-ID: <20240125153230.3817165-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

This two patches fix an issue when the user running net_test is not
root. The second patch simplify test error logs.

Regards,

Mickaël Salaün (2):
  selftests/landlock: Fix capability for net_test
  selftests/landlock: Clean up error logs related to capabilities

 tools/testing/selftests/landlock/common.h   | 88 ++++++++++++---------
 tools/testing/selftests/landlock/net_test.c |  5 +-
 2 files changed, 55 insertions(+), 38 deletions(-)

-- 
2.43.0

