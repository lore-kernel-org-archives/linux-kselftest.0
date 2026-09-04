Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1824A8FDD
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530628; cv=none; b=rTH1+aJ2k0qHU9Lv3a52mAWlzSjNVuWypY5GRG3B0/J5x3CcM145DG++gJn3oFkFfHYPa5asZA3kuSH8l4zZYi7SDXgiHc4ACycBYmQ02PsaBvYPB9kv2NJZcg3EJID8CxNsHg99hE7U5iE6dZPQNo/kKyaZdq3mQGeNTBHgVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530628; c=relaxed/simple;
	bh=l1T/TPElEBIBckbkV0zkS+lAJ3dGZHogNKbOl0Tkkoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFxGxyzTfNvvnC5ADIaYr7XHHWvN3BEw20xpAI0tWRgVRQb818chMzR0C3Vt3i0Gk95BNaxqfq9i6caTCmAKYZPoAqC/0aFlvXI5b/GLFuKyNbSdilb8OP5B8zFIb/L9pjy5HxUte6PxBVEarRKfpt0X0RE611wPghdDxAfUrs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=K/rG5fTJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="K/rG5fTJ"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 90A7F42956
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788530617;
	bh=3DF+MIyFr5r6aUv7sE4j7TVrrTvo12iD8pFcT2yVbKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=K/rG5fTJMt7RAqpR97Bj3x0qUnOcc/98nFZUbQq6O4+sx6PYGZBdi4MID1Gk9niZ0
	 J0TomwoDBEu1rLdy5NnVnIrLmrLFKXQVoS05Q5ALQIT8vJwxiEVZAz6coIEOjw5Ou+
	 Xz1Qb8xrSVEO55tcE7donEIakXGwQ6jPJTUiFvCtqmUqOWFJGPpa8nPQLLewMXGcjt
	 GFuhY1YDd7ETlP+pYHtpOAC60iZ+HLmx/V0qCGG1ngPIc4AvqxOaRy2gJn5YVwLlli
	 3QKWgeeJ+zETSaKv3Vmh0gSjfxRLN9w4GFf41Tm0iVwaoU/nNFRi6UeNi6xjLXdmUP
	 K+ukQKray9iKI0jncaL/YNSlOWDn1QFI3M7P/gx+IT9RKG++eY5Gmy/2ceFdrDUFUh
	 rn/lWIpi5G6Y8NzI4TFvHIr895BKfF6bbYWrM7qKjy5WAfgDuHWxSBoRAQJyWgJ+Ss
	 Lu09gPdye8Xv9MqwuZti+9fYT/iNO/ZTycsAqHNGd/KiuZ9Tsf9ZLphts5KMUT1mRp
	 cldzf5+ey85xFG1UiRoXczuyGCqXavLz+VPbSEBXu5NV1zdzfxNW1o53Ze2w/6ECft
	 5ngfL7+hQ35TH7C4ruCaBw00rpsm16B6Qc4tGu72iSJGoBPm33MtGoAy4yA6jh53UY
	 708BOzhIe1NhEiEe+I+nl3eI=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c217f249fa1so110302466b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530617; x=1789135417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DF+MIyFr5r6aUv7sE4j7TVrrTvo12iD8pFcT2yVbKU=;
        b=g7RBLRtnk831pHhwqcrn7S1IMMMdAAAi2M9657sGE+6Pvys8OVnf8qoE8rMbzxpqQT
         OXw7x2xux9Tm35tzKJKaV+ijCfDo2nPSbJxpyHdcZjlIFtaWxBHAJINtYygfg1tTQCbi
         uHCINDD7HtZ36F+RinChJSvy6+N0ZpEw40zRUPutoGMN/t/TlaRLasffAUVQ/jVi6ZDK
         UrexOM4uCNYe1lBf5OGQon/IXg60TyqqUcZ7O5gcntfr9PqfiZq8D3UAzM3rzZ/9H/4R
         +XnaSAVIT8ot+PcDafVT2PHjPaMwq7rIyGJjbCFGKS+MowQ1WsX57Kp2JuaUkdpVH3gb
         s3Vw==
X-Gm-Message-State: AFuF++nsdw4UWi4Ei8p3+JzYLb6aWROdHHJxGpcdJ1G4N51uAt+y9GIq
	/AzPAW7ERIXiG1PBBKK0q3kkXiwfnIl2Ujtg1OyQxensSllABfuzvZ1/mzIj65M7cZCLrxdtqpF
	wLaUOqHW9ZdmKAxgO/cF8A9sVNSVicv4MBW0z4QlSc0Cr08iyL+3jDpjVKv2Yn6s0VvOFswIaNe
	uBSPSi3a9Aig==
X-Gm-Gg: AYBFou3S+1RvoZDOkH0kyT5cLsV+pxER2Pwy1L0uX4ihvf9juIADRNgSHzXrPC+rcao
	0zhADnGZor1VkXVajgqRLcAhLZZZ/eYCV6w4xcgJF7ic8abAVUVlyhmpPY28/vJh6A9hM2vciA8
	wk1OecgqeOa3qaqqSS9FCUTVui3BwnIiicIwaXvsyX3mWHmqhb4zJiT5GTIDG1WmDhrWwtmDWYN
	fwf2jwjEf5cK4PX54sBDqIs2EABXhomnJZCBdVBz0WDawdq+7KHElI73zVkqa8xrQDsWG9uqXrS
	CcVfgZj8QLpEWZA2jJWrhfMokjwdQMx8guFElG+qgm4Ie9NWIw6q6p2vY+9go+DKfvKazE8Cu39
	GR4bie1Fx9NObIuVg/ak14i4401nigT+y1BVeSmXYj4LrELhCNk5l
X-Received: by 2002:a17:907:3f88:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c260c9e2213mr292883566b.18.1788530617048;
        Fri, 04 Sep 2026 07:03:37 -0700 (PDT)
X-Received: by 2002:a17:907:3f88:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c260c9e2213mr292880166b.18.1788530616630;
        Fri, 04 Sep 2026 07:03:36 -0700 (PDT)
Received: from P16s.localdomain (staticline-31-183-213-56.toya.net.pl. [31.183.213.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa5acsm111956666b.12.2026.09.04.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:03:36 -0700 (PDT)
From: Kuba Pawlak <kuba.pawlak@canonical.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	kuniyu@amazon.com,
	Copilot <223556219+Copilot@users.noreply.github.com>
Subject: [PATCH net-next] selftests: net: Skip so_incoming_cpu on single-CPU systems
Date: Fri,  4 Sep 2026 16:03:34 +0200
Message-ID: <20260904140334.562593-1-kuba.pawlak@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test requires at least two CPUs to exercise the distribution of
connections between per-CPU listeners.  It currently enforces this
prerequisite with an assertion, causing all test cases to fail on
single-vCPU systems even though no kernel functionality was tested.

Report the unsupported environment as a skip instead.  Check the
prerequisite before setting up the network namespace so skipped tests do
not make unnecessary system changes.

Link: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/2023546

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
Signed-off-by: Kuba Pawlak <kuba.pawlak@canonical.com>
---
 tools/testing/selftests/net/so_incoming_cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/so_incoming_cpu.c b/tools/testing/selftests/net/so_incoming_cpu.c
index 4740701f1..1b7344238 100644
--- a/tools/testing/selftests/net/so_incoming_cpu.c
+++ b/tools/testing/selftests/net/so_incoming_cpu.c
@@ -81,10 +81,11 @@ static int nr_client_per_server, nr_server, nr_client;
 
 FIXTURE_SETUP(so_incoming_cpu)
 {
-	setup_netns(_metadata);
-
 	nr_server = get_nprocs();
-	ASSERT_LE(2, nr_server);
+	if (nr_server < 2)
+		SKIP(return, "requires at least two CPUs");
+
+	setup_netns(_metadata);
 
 	if (NR_CLIENT_PER_SERVER_DEFAULT * nr_server < NR_PORT)
 		nr_client_per_server = NR_CLIENT_PER_SERVER_DEFAULT;
-- 
2.43.0
