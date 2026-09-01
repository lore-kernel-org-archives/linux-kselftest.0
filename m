Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534E468C2C;
	Tue,  1 Sep 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293267; cv=none; b=iIX7JtYrrUc4rrznH79Oq/EH+iQu2hLI05qF9TkTUXEPV/vQf+j5t0eLk70dcGXwOncwEo5yJ+Rqwv5pJhmDUJq4FXSTy9MFHlivzMf9KJ3tFK5/9D6ydaykMjrvKILqWBTqBV3Dqt5WSKJrTVmJ6qtou+O6CA2BbtVuEMQL9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293267; c=relaxed/simple;
	bh=7lKVh9OmFsPklY3rhE4vdZXtaaPqDe984nUYasZh1Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7BmJJjIU0nzpk3Rp9rtZbC4WWWFonbyu0NJjskvoKOhEX/iZGn7L512UtHjykMDOV3I+Gkd4UUTF2xkVVN5GwHjoLXf5l34d72NBwLOXQtdKC7aFCy/wVR+wN0nujs8k+G8Til61h/0qK05wx/BLqAb51W+swIJ+mYmP3Q45Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1QRtm0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1QRtm0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84C11F00A3E;
	Tue,  1 Sep 2026 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293265;
	bh=Qk4us02hm2HpM5oFPMUr0my7vlB4T/dEk8EpW7oE4h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E1QRtm0erZOvd75DpJGjGicPlwFKi4/YspzS8BX2KxE+hZ+8lrDJg7GWJwtQW1rvn
	 X7Tv4lhDxFGm9jilFJfcOFV1V1ND1Ee1xJqoOx5EcufIFcvOe+kApRsy++GwFDmIR7
	 zEE7wwy3NzdDsdPYmRZXpBAjVXLXXmSgTj0vPqm/qpWvg4fkbDpFcWZqdg3lc74aum
	 KKVlk+HkvIMV/DvUOO+AhZ4SI4vvJUIbTE+egU+Dw6VHQcpnCrRRzOqNswPvaUOSrK
	 QM+DoDxxP5Glrv338F7NYHuzcMy/oKjGoPxVi1b055cIYitCC3r65J7oOiequogHfn
	 oL7k8HW9zBFOg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org,
	noren@nvidia.com,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 3/3] selftests: drv-net: bump the timeout to 15min
Date: Tue,  1 Sep 2026 13:07:28 -0700
Message-ID: <20260901200728.2063720-4-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901200728.2063720-1-kuba@kernel.org>
References: <20260901200728.2063720-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XDP test takes 9m30s on the slowest NIC with debug kernel.
Let's give ourselves a 50% margin and set the timeout to 15min.

Reviewed-by: Joe Damato <joe@dama.to>
Reviewed-by: Nimrod Oren <noren@nvidia.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/settings | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/settings b/tools/testing/selftests/drivers/net/settings
index eef533824a3c..e2206265f67c 100644
--- a/tools/testing/selftests/drivers/net/settings
+++ b/tools/testing/selftests/drivers/net/settings
@@ -1 +1 @@
-timeout=360
+timeout=900
-- 
2.55.0

