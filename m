Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C192EB5A6;
	Sat,  8 Aug 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207017; cv=none; b=gQsyuIc6KdQ4671n6tvgB4LvqIhpMWzzb/7u9X5TehT1WGZEXDaMukxUeN8iQR26rxXfAJgbRa5NAc5/HoJ/VnwN+NBiGanToGXAt5om0vdT647JHaJWCd3CW6hLcpKMLod0+xYpPwoQK0Olq4zH8QpbTFG3z7nBuSrqiQn7Nco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207017; c=relaxed/simple;
	bh=KTW5HHAxSy8+devikD5wvI5NFZh2VXrHEGd7+1/O1Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QumBbGZCehWjeRRTQGRvMESnNN0PziT1qA+NgN/rOfvO4CoKJ1VaLOIoMb00o+4JQrZqUUTCOW/p8U9JTjf6ONrJOIMlMl/mdeu+K4q3Z6khuhZ4rvhf7Ond24Ms3uFhFcjQjFebgSnSeEksCgOioeQ7KyNqlTBADerqaLcGVuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DazTQ9I2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DazTQ9I2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B159C1F000E9;
	Sat,  8 Aug 2026 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786207016;
	bh=LD5lem7UL2Ks2J7oX5RMQTUZ8aseMx7O7MiXkvF3lxs=;
	h=From:To:Cc:Subject:Date;
	b=DazTQ9I2+Jr3XJ9AVbc7IjpfBO62USnuRiiFflyzCYgSK6OAIWVwZYSBsZKFtzGVl
	 tT3pusbSewplhqiVqT3Y/NmAwMAJ4PyWsPDebP3xvdRr2ArYbebeWZFhroYfdSPaD3
	 GJjz5DhMt58DVgZnjtoZRXQZT5OZ+zPzvtT0lvYt/hNEKgzk2XOHWIA5jzaH/Zmb4J
	 m/OW4nqonlHWBdsGx0mjrVj+j2xdI7WyL/T3vET98hzFbIGVQHRn8WyVtGo4Fyl4OK
	 2aKytoeB9hKQCL/2oiq8diBCnbLAD4EQWfzIz60bY1SpotN4eiHMu6xtKoVgiUej0v
	 Kaz7OEnpdgfkA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	shuah@kernel.org,
	petrm@nvidia.com,
	ioana.ciornei@nxp.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] selftests: drv-net: pace ethtool_std_stats packet generation
Date: Sat,  8 Aug 2026 09:36:52 -0700
Message-ID: <20260808163653.2460381-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mausezahn defaults to sending packets back to back at the maximum rate,
which can cause packet loss, especially if receiver is running a debug
kernel. Space the generated packets out (-d 10usec), like ethtool_rmon
already does.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: andrew@lunn.ch
CC: shuah@kernel.org
CC: petrm@nvidia.com
CC: ioana.ciornei@nxp.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh b/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
index c085d2a4c989..1b329b3f60c2 100755
--- a/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
+++ b/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
@@ -43,10 +43,10 @@ traffic_test()
 	done
 
 	# shellcheck disable=SC2086 # needs split options
-	run_on "$iface" "$MZ" "$iface" -q -c "$num_tx" $pkt_format
+	run_on "$iface" "$MZ" "$iface" -q -d 10usec -c "$num_tx" $pkt_format
 
 	# shellcheck disable=SC2086 # needs split options
-	run_on "$neigh" "$MZ" "$neigh" -q -c "$num_rx" $pkt_format
+	run_on "$neigh" "$MZ" "$neigh" -q -d 10usec -c "$num_rx" $pkt_format
 
 	for i in "${!counters[@]}"; do
 		read -r int grp cnt target exact_check xfail_message \
-- 
2.55.0

