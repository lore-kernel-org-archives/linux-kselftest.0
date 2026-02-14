Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48D1A08BC;
	Sat, 14 Feb 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771041126; cv=none; b=Y3RD6ZgUc7nJeiDgnemK6CL0S16ErOqTZRkCDi7Phagim/5/J2vrBkl89J8HiLG1+k4ZYfTcR/fRxwj1k9Fo9xeZZ6aWdPqhoBBfTLNIO5chqbBPx8nN4xhy5YxPfdkil6H3LXdo3mkC/sfGZnbcwOmXLSLK16mVbNLOxFVnLrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771041126; c=relaxed/simple;
	bh=NNv76efq6rzab8lAjjuUf6Im5mxt5aPETWbq0bymPIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SlnBIPNbosRPNe4f6CArazxlttKvmsqAs4S2jUtZxdWsxUeI7EvzWkXzbdGDOqFLQp0LjG0P+V7FSHN32D9Mh9B17EaLxXkQeG1lo2+lIPS+A9SQ5yEsoqrYokt4CuFnRE+xJ2AbLMMLXG3gK4hqLh5eXEUxcCD5x3OZ8q+4LHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzsV8WOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzsV8WOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F879C19421;
	Sat, 14 Feb 2026 03:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771041125;
	bh=NNv76efq6rzab8lAjjuUf6Im5mxt5aPETWbq0bymPIs=;
	h=From:To:Cc:Subject:Date:From;
	b=GzsV8WOf/oGfVAvV8qb3aYTtiC5E58JnK0RXeiSJLI/8NSRtwd/Zg+1ZgI5kaVBre
	 //arCNzr5tLMYsIyrtnUDgZBzBGAlzV3qMMbPA/ZrnKkuS4WLVTHVdaZakAQ6q8o7c
	 dR1S63xJRc1DiFGrPksiTVmXWJKVALNnIWKUzePcAl8iT2dJsqzh07Lp4tEiFz6qAf
	 cl5d+JaaFr0GY8Dmf4uKDFzRHKuEIt+0Fm4m0NwU7iz0yKwm6o2XMqLAJP9E0tY3JY
	 nv+5tzi2WGv1gf/UesFrUVokJQdhKEtMj3IcCrovN9oT+2QxjyWmNlVgiqH39jqYhv
	 SDk4/N9lm7amw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	marcelo.leitner@gmail.com,
	jhs@mojatatu.com,
	dcaratti@redhat.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net] selftests: tc_actions: don't dump 2MB of \0 to stdout
Date: Fri, 13 Feb 2026 19:51:59 -0800
Message-ID: <20260214035159.2119699-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we started running selftests in NIPA we have been seeing
tc_actions.sh generate a soft lockup warning on ~20% of the runs.
On the pre-netdev foundation setup it was actually a missed irq
splat from the console. Now it's either that or a lockup.

I initially suspected a socket locking issue since the test
is exercising local loopback with act_mirred.
After hours of staring at this I noticed in strace that ncat
when -o $file is specified _both_ saves the output to the file
and still prints it to stdout. Because the file being sent
is constructed with:

  dd conv=sparse status=none if=/dev/zero bs=1M count=2 of=$mirred
                                ^^^^^^^^^

the data printed is all \0. Most terminals don't display nul
characters (and neither does vng output capture save them).
But QEMU's serial console still has to poke them thru which
is very slow and causes the lockup (if the file is >600kB).

Replace the '-o $file' with '> $file'. This speeds the test up
from 2m20s to 18s on debug kernels, and prevents the warnings.

Fixes: ca22da2fbd69 ("act_mirred: use the backlog for nested calls to mirred ingress")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: marcelo.leitner@gmail.com
CC: jhs@mojatatu.com
CC: dcaratti@redhat.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/net/forwarding/tc_actions.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/tc_actions.sh b/tools/testing/selftests/net/forwarding/tc_actions.sh
index ea89e558672d..86edbc7e2489 100755
--- a/tools/testing/selftests/net/forwarding/tc_actions.sh
+++ b/tools/testing/selftests/net/forwarding/tc_actions.sh
@@ -223,7 +223,7 @@ mirred_egress_to_ingress_tcp_test()
 		ip_proto icmp \
 			action drop
 
-	ip vrf exec v$h1 ncat --recv-only -w10 -l -p 12345 -o $mirred_e2i_tf2 &
+	ip vrf exec v$h1 ncat --recv-only -w10 -l -p 12345 > $mirred_e2i_tf2 &
 	local rpid=$!
 	ip vrf exec v$h1 ncat -w1 --send-only 192.0.2.2 12345 <$mirred_e2i_tf1
 	wait -n $rpid
-- 
2.53.0

