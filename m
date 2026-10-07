Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BB047C0FC;
	Wed,  7 Oct 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366713; cv=none; b=MfKW2n5KmbV9rDz744AbKxvK5VDdAuqhprhfSMqbamqbPQQ9wpkcCpXtyBtwxcQo3qoTGdchHOPXIId5vq7j+K/leARhkZmrLBw1unqT6KC9WYUDqidJTc2JLYQMuyjwkVQBrsy7UOmpK8WQ9aAD+n7GvR5OBy+C0aH1ZwzGROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366713; c=relaxed/simple;
	bh=YpmZSeHdx0gjci48tJqrrtCGp9fQ95iGiN/kNL2LXF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LAmaKeAEq5fM2UE+2rroc3U4xZpmfo9dRP6TkbMZt9U1TbtVkWWfJGqj/ud0kFgVvW/GYblsSSHf1DgopDr2oCONrHBhJRveapOBJ+fpIHSjUkO72PnX1Ce6TdfASwrI3A5cQgJzASB+EGLVn9tmKn7mUd0/+1HB/ooSiywKVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=WiTl/0xd; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="WiTl/0xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WiTl/0xd9r+XdumNmRJmphALYwhWHIJFIL73ZDByuA4JDGZORAlxgvvcUT5B5oy4Txna2mCB3Qalf
	 ELv1vcwZpeShRpFy9VvE1k7SE956BgJJp6DXlCTW2HQ3Bw0ZDc9aRW7wa7F9fxauMCR6yWCoF8Lnli
	 BmH69Vb8q2hleQus=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ac61625551-86ca0;
	Wed, 07 Oct 2026 17:51:33 +0800 (CST)
X-RM-TRANSID:2ee16ac61625551-86ca0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[112.22.250.209])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ac6161a04d-e490c;
	Wed, 07 Oct 2026 17:51:33 +0800 (CST)
X-RM-TRANSID:2ee96ac6161a04d-e490c
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
	Matthieu Baerts <matttbe@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net] selftests: net: big_tcp_tunnels: Fix the IPv6 route change
Date: Wed,  7 Oct 2026 09:47:31 +0800
Message-ID: <20261007014731.1277055-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On slow machines, do_test() raises initcwnd on the route into the tunnel
with "ip route change". For IPv6 traffic this fails with:

  RTNETLINK answers: No such file or directory

The IPv6 prefix route of the tunnel address has metric 256, while
"ip -6 route change" without a metric looks for a route with the default
metric 1024, so nothing is changed. The test still passes, but without
the larger initcwnd it is meant to use.

Pass the metric of the prefix route.

Fixes: 1d62b83fb751 ("selftests: net: Fix slow configurations in big_tcp_tunnels.sh")
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index cc0875e52fb9..fb43fed824e3 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -145,7 +145,8 @@ do_test() {
 			    route change 192.168.2.0/24 dev tun0 initcwnd 100
 		else
 			ip -netns "$CLIENT_NS" -6 \
-			    route change 2001:db8::2:0/112 dev tun0 initcwnd 100
+			    route change 2001:db8::2:0/112 dev tun0 initcwnd 100 \
+			    metric 256
 		fi
 	else
 		ip netns exec "$CLIENT_NS" \
-- 
2.43.0



