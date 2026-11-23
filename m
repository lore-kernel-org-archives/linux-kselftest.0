Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449312;
	b=si0HP7L9jek8QsruqPuEVFg07wPTM+ctamJq5uNC7CEZ1FtkQxBUfUPaJeCfkBRyA/BR
	 aHq23izQiRIPFBtW+cLFxwCjBIECmvsgPni613mI/CWLtXkOAVJEJZLoOIjmVjo3ZLdlv
	 S7hIlyTWvzYU2S1DugEGCarW+nBe1c3dGIRzALQ31tGu+4m/kkn4POxTHDlCPh9HKmtqt
	 6V9IufdV1HBZ0FGMy1jTZj1BeKNCSC0pmAklvVN/M2x0+BLDpW/aZEAWd/NqhsHfUbGMU
	 EP8aczOGlc2bqBPn0t57pCqb3teCLTyuAdrdr2EGUsyonmnC/+pzN/8DwZNuFm2cT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
	b=vF+cLL6vIONlkPxMl9XUscI18R1rHtd2Hvyhv8V5RGZSSs23I8hQfr71I54k4hTDh/0T
	 XhN4Glfv5lczl50NxB6Ac3MnboOkGAFrDh7tHViKbsYLDofnacxVmGwoH3FyJiUnvy/fi
	 kMiZqtP6ADOH7IrDG4zJSrAhH9cB9vakqt8SUhyl9e42XddCIgBLnsMYw/PbdANoPyoKw
	 JUXWbQwXV/3Ozfo2vBM7OF0aIWkv3kV/Sm8WFUwFS36jqz6ls7UY49aXLb8W2cDVpvBEY
	 oLOtyvMcQJ9YBAEx+J+oiHMF44Lsv83gFMNGKZi79koDDAA9Etn+SA7JDHC2w7iRxSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C24F606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C24F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38564b4b017so3695470eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449312; x=1796054112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=Oyi0sjgNBfHQvcu4yp0AJdAbkH6qJCsirLuyq5oQ+mEhfMcUdDF68DxUROhirp6zV8
         j7uQD+oYr8i/JjJul5XMI/HkCbjO5U6Dqub3rIxbrMNSX0+Ski8HfZZNOzlV8MQmUv3D
         tgW0hAf23nFZJSVY0rf01lI8GOPOlEFyn8KItGbiKuHaC7ZAuZxjiNN6UxAmevEI5svG
         QBFhRNrqTiXqp1tE5P2wV316RTKWp9aWjmwqJcD4DoC7ibSgNuLyFA+7ekM2JAJ7ICl4
         KnrUKKn19xTuSHAgWEzO9b4DFrx8k8943tEGikmv9Xw2BD5He7BbILG27+Ln8WngMac2
         m8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449312; x=1796054112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=rclhNlZ1Uy12YkG3cfs6IgeD/oB96di0iaEFJ6dpnsMPeWrPQ42B/cAD6KQ2NBzi7k
         9yqiy8Ky7KpD0ZAR5k+cYmd/APpAPyL8on739dQ6YBkHk7ACnVv2Gy5DC+L/xtnA69kF
         Zj5NCC5Iz5qC4WLat2jOstBYprXpj7GbxLxe9hGM75NgStUnyrC/D5DgX8MjVagK+uhM
         BkWRhDgQuTn4Q6Woyk8VAplITEYRn19hp+8hzP3tdkXdljlvbLVUuLgscXCtKD6TjNOr
         +2zzCw4Iydqj2M74oyNFTETHSqkOV4Zpnu+3dezqMMlhuNvVQtMRiYAj3Rf3CE6u0Ywl
         Jj4w==
X-Forwarded-Encrypted: i=1; AL+hErEmPgVMXJcMokoFTqq1k19lIICmnhluOlL3L27e/4kdi/QCwKeJ4ttWHg45abE4sfHN3jVAf0abCo+keHrfe1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vCT7UdmK1VP1NHGeMIHAfvWX4noi41MrGJpR57OFirIPQhe4q
	9sXWDI9SdtmwPXAZuUnuzJPl4rKMhoQJaC85XGno3DY7pX7vK8N2LgQW
X-Gm-Gg: AZFdTZfsaq3UdDLXYoyNvnj/WN8RjdPGf5eLo8q1aw+a3eslcfcSrs8E/Quprsh5MKo
	eXWghZzZthfz6ZWP2Symdvd4Ddb4DYyG5efk3hckm5EhSek90UtdcBljbJil+H9mWarED4y0sIe
	m8d/3o6m9msrkl2L90DnYsaGRKcQDAb58Q9ilH/CXt10JVja3+ojo/jbw6dyY4TVnyRZjLgULom
	AGjwL/wyyXW1NXJYXDW1qOM8AATtgCXqg/wZ9mRj3uY9p453J9bRuJOVd6rwE7ETfsDQdR+zVpu
	sC7LssPMqkYg38qnEu6okZVVw9TsIFXFBdn+n0ZzPVuUARFej/g3Xk23UQg5DM/l8AICSTJYlap
	8dSIDc8CWbt2sfP5+4RAjAxSnkCWuGyjARGWPv1qb6dGgwVPjPUcskg8UnYHd9b5vJQ9mg/qzlt
	Hrhkw7q/8n/UZXrt7VX2gsOTBGOSi+99M+y+83urjh/N637ZsHg83Z+Fd1+39Jn3PIfG0e9WtNx
	t4Nhy6eFO0egwIhKNia2dA43uyyle5SfAM2tGvW4z5br6fERybn6vGn/OJ+mqEEnC36E4vjtSyq
	nhdnGz/D+RuNMb5Zsy8v2u1O4LIl+B2IzMaSXpJcXjPZCJRcVpLWizjLMWzvyLbfk3B+jar1Wy1
	8UDzJfpM5htk7/kTD4yQZSkUwDRCPSqQ1X3dL4H5fJfQPFLnOxhjyenG+5gY8/tm/NC18Aa/v2w
	==
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr11669850eec.19.1795449311155;
        Mon, 23 Nov 2026 07:55:11 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:10 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v8 0/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 23 Nov 2026 15:55:01 +0000
Message-Id: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v8:
- In the selftest, read the group memberships in host byte order, so it
  also works on big-endian (Sashiko).
- Skip the selftest outside the initial network namespace: the family
  dump there does not list the families that are not netnsok, so it
  could take one of their groups as free (Sashiko).
- Close the selftest sockets, also when a check is skipped (Sashiko).
- Skip the drop_monitor check when NET_DM gets no group ID that was
  free, so it cannot pass without testing anything (Sashiko).
- Rebase on net.

v7: https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/
- Add a selftest as patch 2, as Nicolas asked.
- Say in the comments on the static IDs, and on NET_DM_GRP_ALERT, that
  they can be joined only after the family is registered (Sashiko).
- Say in the commit message that the unregister window was already
  there for the capability check.

v6: https://lore.kernel.org/netdev/20261112094205.1120090-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 6 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

