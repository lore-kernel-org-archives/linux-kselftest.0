Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58F37A829;
	Sat,  8 Aug 2026 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786206229; cv=none; b=s6zSyCrGFdqz9pXfT4EPQeqv4ruOdaV5oVyEWBwNC3KWK5+pC4i5KjzYtYZMj60/j7wgaL5u58cgSvjbejljJLegH3jZsn+LiQ4NvGUKCEObTSbM2J/QLUyjgjQ//TV2wggMs4fsWWBXCkLicTHxRvrye7l8glmCGJoY9AwxcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786206229; c=relaxed/simple;
	bh=QExZBJZ7lB9BEWrq9f/sOOGyqDVveyaYug5QCBhQeoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brPk5IGC7DUH44EnGXPVL3b/ss/4a2zdIryIL62Gbg8v4axCPyToIXJjDpzLIaGdXERTV6ICMo1dy+aYW7DD1nF8tOFPI9KQAWKixJKKTJVcnMOxajF3y1VL0fR/cCNaRg251Uuns4AT+ojhCgReFOdijqInQxYivdjLg2YkfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ah9gc5tN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah9gc5tN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CF61F000E9;
	Sat,  8 Aug 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786206228;
	bh=PxpQt/6lvtnajjgFX3wfQsLxwio/KrTkZDU3gWLbEO0=;
	h=From:To:Cc:Subject:Date;
	b=ah9gc5tNQYUzDKt/E/gOa6xiD9oLTjDaVXlsGOhamhHQYk4j+3R+Zbgo1mb6OkEL9
	 8kV5N75W6hVTEba/1rfSKXGtZXj9nzHVI5xkezo7uV4Uv9O9EQu9HzOS+j7lOkNxAs
	 Y13hfXIphH3BPGiK+cOcp5NDPQorV9hRkjQV0CE/f9F9VgFNJwXyVKSF3npo8dX2UR
	 loBTnaCkgmIBilEufzOMftuB+1foG6mLThwCsTdCcoo5WjUEWTfaRswCShUdUqxHnK
	 A2wLZcFpJYGmulKB2y8VIyb0tlX+1CZO3CuXtysGrZLPlRt2euVE7jQNveZAh/hyWl
	 +JSD43LQdkaLQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	liuhangbin@gmail.com,
	jv@jvosburgh.net,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: bonding: disable DAD for IPv6 addresses
Date: Sat,  8 Aug 2026 09:23:45 -0700
Message-ID: <20260808162345.2442594-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bond_reset() waits up to 2 seconds for IPv6 connectivity.
With default settings DAD itself may take almost 2 seconds,
causing flakes on debug builds. It used to flake once or
twice a week, recently it started failing once a day.
Probably some downstream changes to scheduler, or our machines
go busier.

A lot of selftests already use nodad, let's use nodad in bonding, too.
I don't see an obvious reason why DAD would be important to the test.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: liuhangbin@gmail.com
CC: jv@jvosburgh.net
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 .../selftests/drivers/net/bonding/bond_topo_2d1c.sh    | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
index 167aa4a4a12a..903c7a6c7287 100644
--- a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
+++ b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
@@ -48,7 +48,7 @@ gateway_create()
 	ip -n ${g_ns} link add br0 type bridge
 	ip -n ${g_ns} link set br0 up
 	ip -n ${g_ns} addr add ${g_ip4}/24 dev br0
-	ip -n ${g_ns} addr add ${g_ip6}/24 dev br0
+	ip -n ${g_ns} addr add ${g_ip6}/24 dev br0 nodad
 }
 
 gateway_destroy()
@@ -75,7 +75,7 @@ server_create()
 
 	ip -n ${s_ns} link set bond0 up
 	ip -n ${s_ns} addr add ${s_ip4}/24 dev bond0
-	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0
+	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0 nodad
 }
 
 # Reset bond with new mode and options
@@ -97,9 +97,7 @@ bond_reset()
 
 	ip -n ${s_ns} link set bond0 up
 	ip -n ${s_ns} addr add ${s_ip4}/24 dev bond0
-	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0
-	# Wait for IPv6 address ready as it needs DAD
-	slowwait 2 ip netns exec ${s_ns} ping6 ${c_ip6} -c 1 -W 0.1 &> /dev/null
+	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0 nodad
 }
 
 server_destroy()
@@ -124,7 +122,7 @@ client_create()
 
 	ip -n ${c_ns} link set eth0 up
 	ip -n ${c_ns} addr add ${c_ip4}/24 dev eth0
-	ip -n ${c_ns} addr add ${c_ip6}/24 dev eth0
+	ip -n ${c_ns} addr add ${c_ip6}/24 dev eth0 nodad
 }
 
 client_destroy()
-- 
2.55.0

