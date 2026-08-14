Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED03A9630;
	Fri, 14 Aug 2026 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736541; cv=none; b=gs7Q1b9pMWf/ujYiczkebh4TasYrOkl8BE7fEf2h4Q+yEnetE/fQvbQUPrW47BxERq8E0yUlZl+Dgdtws877DkXB8yw/BbNn741zulwGC6zHMqv7gMI+F9R+byNIxl1TD2tE3EDcrJR2ZpXz/wMdoYkdp94i/6ugfbX1tvatBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736541; c=relaxed/simple;
	bh=0ywM2roDD0ctvBmfSUcBcjCy+BLYjSbJkC0OhW9tzn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4500ZPFe8gfHd0a6uiHBrLbjl9Mgxo8Q6d1fIyBnv7BIJrCxRAELHdidjgi3TTPJx/9WJ2HUrzudiU5rAt330EQiXA4TpzhngJS9NLjd55UL/A6GISo5BhZFPo1FNO6ib99t9OI4vuqrWSF/aq+v8fK1ksKoFsj9QsyTbNlFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=QYnGfrx9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c4B7NOZa; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="QYnGfrx9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c4B7NOZa"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 00D8B7A006C;
	Fri, 14 Aug 2026 15:42:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Aug 2026 15:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1786736537; x=1786822937; bh=5QDnVhol1yrhgCtO++tOu
	qhdI7gZej0pxJiDrpXcHGM=; b=QYnGfrx9qvgRZm1m7ShTM0Pkm0sace3KMVJUv
	eI+DYULTkrhO7FjRFvOUq+MkqQhnp8ORouqrpt5uOjv3R6ZcwhbIc0H86/cIxUS0
	sh3sb4hLnPttgVNC1JIFeSvbCDXR6xBIfTAbAz5LbWqw3NU9TOeAFYhiCkjD9kox
	T4DLVK0sOBMOk9fg9A0zsGq9H09Ag1cwOmH0bFfMdFmlHeSxOf0KpQTk/shy1Tyh
	r/wPPaMOblh9iB8SAm37nxqNFT+iSH4+haPxKVGow023qXMiFya+p0Ybh3Dfnd2Z
	upki4LufBKuuoBOcm3JpPdjsAEsKmV7kMueaI1Jp1JVKpiOgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786736537; x=1786822937; bh=5QDnVhol1yrhgCtO++tOuqhdI7gZej0pxJi
	DrpXcHGM=; b=c4B7NOZaDmJPNR+npfasUV8i2v/412H5fazeGyS3jEEmC8mGpQT
	FmUWfF0qokPcB8FF+1WigvVhfbY9LekBkdoNDdKmj4Ut9MgAA77rGydwv5I2ZYiF
	QBrVmxGF2IsCzziqsFkcURd2sSYKFIPQdPmwFGsgJIWd00AXYZeoKwmB2skMSBuc
	owdGKd8AFMnTFMIJFFgOhMc/Z62gTQmPuG5wRXBkHj1sdqn5oRdOY2K7X3rkzdjo
	qI7b6phla4qocB3MkpHcBQvFQG5rSvl1BUaSDoG2YXQs/vJJXhdkl2PibphHY+2n
	/DOg3lyEcUaOwUGGMbB73OQPDsdjyPxHg7Q==
X-ME-Sender: <xms:mW9_aoEBy0osUIPgQdvi_mnX3vEEiiisQn9n_hst53dSEd2LFr10aw>
    <xme:mW9_akaLKq2AosP4u-Nx-3xTllwq7GOyb1mCWe7B7fIHicmKUd4hF9KygIBqxuPAS
    mlUeH5O-X02gFY6K4p_aQJDd7jlE1K9704LpTOfTpozXxMDC8tr3O7T>
X-ME-Received: <xmr:mW9_aswI5Gh20Ab4lev0Mu4qQdDeSqatngwZD_PuM0LhqfkpNRfitbSgb8b29A>
X-ME-Proxy-Cause: dmFkZTFKdqwCuSSHU4qarfW0UmjCtV/B/1ABPlxCc/ct+Mn8t5MMFzcMQmrQHOblE9YMHz
    YGPLSmqtVYvGnk9ITpMx5Hu4gE0NWa89U1/SUYqIdQIIuTGA9Mvax35+laDVFcYggIQlA6
    KuNnI22QUH2hDZ156RT24xAdxUjIxiRpynN226+0aZFfvBq45Bh6OaZFaLdbd1uDYHFgz0
    1U7aJPFCJTDOf5F6o1B8d29vCnx5K+U5ySlbrXST+SEbGSR/8PhWdlS6Q+ZuSTuHltEWMH
    04krYq1P/0SO9qmlSECqc9blmmA2Ru4W8jQtzwBcB2D9bXqa1WDqGK8qYHkBcoxs/yhdsv
    Vw7mfDiE0PGfwm5crVaq6N6KiBmjnbSofKEU1uZdN0lGe0Svag0JWWlyhTkYmRHUjH9LP2
    Vx91Wd4ioKGFsHGgU8YCmPILOx1yeWs+ur/iDjLj9AIk+K4uh/lpAJFmwgEFhFEq2UA8Uu
    0sMlLRiSwb/Rolfzg1EuCWUf8erhebvjotbtSU41PTsfmqwzvFs8Xks18fj2o7MGPBrqc6
    y87Hm/oqVOedT85usfWDRAceevw9ouJjTTJQ7YUA7TBJhoKC3Q6G5f16v7Hrd4UdwNEpaV
    vFpD5CFMoH7vseFAzYjduHUvvI2TGWhgVR31bbACtI0c8lZendukonbNhvsw
X-ME-Proxy: <xmx:mW9_amR-EWaOCSXWRcuMu5HkYsvoG4QwVnNMFZHpzmJO2g4eGJlIZg>
    <xmx:mW9_apIR8fyhgt74-k7NVrlNjcdC8OAO1lAVTwvPVGgK-p6o4-z4ig>
    <xmx:mW9_atW3d9llz1J5bQ494z9We0a7gukr_esBICC6vNMPviqLnaxpzA>
    <xmx:mW9_atRl-d4ebZPTguJXVxyyYQ6OVz8kHuxCbggoZ8TpUodw9AqN9w>
    <xmx:mW9_arMI2q-n79hiMzpXacQpw6XwkFyNtEZca0mX14MCBFdqcO18Zh6D>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 15:42:16 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net-next 0/4] Improve stability of big_tcp_tunnels.sh selftest
Date: Fri, 14 Aug 2026 22:41:20 +0300
Message-ID: <20260814194124.3102581-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

This series addresses flakiness of big_tcp_tunnels.sh discussed at:

https://lore.kernel.org/netdev/349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com/

Lower the thresholds to avoid failures like this (number of packets
below the threshold):

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout

Tweak tcp_min_tso_segs and initcwnd to avoid failures like this (BIG TCP
doesn't kick in in slow configurations):

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout

Alice Mikityanska (4):
  selftests: net: Wait for netserver to launch
  selftests: net: Lower threshold on debug kernels for
    big_tcp_tunnels.sh
  selftests: net: Lower threshold with csum offload off in
    big_tcp_tunnels.sh
  selftests: net: Fix slow configurations in big_tcp_tunnels.sh

 .../testing/selftests/net/big_tcp_tunnels.sh  | 45 +++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

-- 
2.55.0

