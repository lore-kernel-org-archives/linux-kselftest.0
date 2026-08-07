Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4C13D8105;
	Fri,  7 Aug 2026 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085360; cv=none; b=Xc3c486IARBiSxfon+bc/Hh0Pl4EX21pQdwIQQjEx0ovsevmcg8XZiJVQkpfOGsSSmTqxBcolICqp+OrgA0QR4NLLnDNOU9EcSp437OS0KLOKOqDFo53/RrDxatqzaVOFtDhOuD5paVaZ4ikkTQWP8wmU8Kb3MNWhOVqTp3AUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085360; c=relaxed/simple;
	bh=rAnJDWZOjgQZGj5vdiYX+LKXqnRLkVN1h81pn8OofZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLSAQXZ69k0rivmTBz4bISO23Xt+NDoaQB02NF3xwDF75xmeX8KjcCvsegglHrdXwquALGd2tC/yATPBabynb3v3HzN7KWHaekAlQVQGGl2aPQ8+cp3kJ/T73u5oDJH4nM21fqdWkyg4zo8sFgkmPONdU4dwPQDEzJ9f6Ne2D7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iriP9Ww9; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iriP9Ww9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o+
	pQySnj2tke+BcxYstuQ/c3I+18MgXYsNi289JUnaQ=; b=iriP9Ww9MTzaujkqVP
	W2yemald0eM4CBiRaXCezot3axCfl1EFGoMRZO9eDx479M/XJwppD2HWpEMJz4ip
	LU6NAr6T6zDFReSk/vqoU705SveAfwA7tmv+feKJpU/jdnSW+D4s3/6EMb3A3+uw
	VCVRvvaKFQmAFVwpdv7Tr6vDo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAHDmCyf3VqlTqDMQ--.260S2;
	Fri, 07 Aug 2026 14:48:20 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH] selftests/net: ovpn: fix socket leak in ovpn_socket() error paths
Date: Fri,  7 Aug 2026 14:48:16 +0800
Message-Id: <20260807064816.53811-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHDmCyf3VqlTqDMQ--.260S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xtF48Gr15WFyxXF1xAFb_yoW8KFy7pF
	s7Ga4DtryxJr1xX3W8trW8JF1I9ws7K3y7C348Kw13Zr4DJrnYq34FkFWq9Fy7CFs5Xw4f
	Zw4xCFWYvr1DXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pipVbPUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwhQFz2p1f7QgJwAA3P

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The ovpn_socket() function creates a socket but fails to close it on
several error paths, leading to a file descriptor leak:

1. When the address family is neither AF_INET nor AF_INET6, the socket
   is leaked in the switch default case.
2. When setsockopt() for SO_REUSEADDR, SO_REUSEPORT, or SO_MARK fails,
   the socket is leaked.
3. When setsockopt() for IPV6_V6ONLY fails, the socket is leaked.

The existing err_socket label already handles closing the socket for
the bind() failure path. Fix all other error paths to use goto
err_socket instead of returning directly, ensuring the socket is
properly closed on every error path.

Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/ovpn/ovpn-cli.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index f4effa7580c0..81b81d5fc162 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -507,7 +507,8 @@ static int ovpn_socket(struct ovpn_ctx *ctx, sa_family_t family, int proto)
 		sock_len = sizeof(*in6);
 		break;
 	default:
-		return -1;
+		ret = -EINVAL;
+		goto err_socket;
 	}
 
 	int opt = 1;
@@ -516,13 +517,13 @@ static int ovpn_socket(struct ovpn_ctx *ctx, sa_family_t family, int proto)
 
 	if (ret < 0) {
 		perror("setsockopt for SO_REUSEADDR");
-		return ret;
+		goto err_socket;
 	}
 
 	ret = setsockopt(s, SOL_SOCKET, SO_REUSEPORT, &opt, sizeof(opt));
 	if (ret < 0) {
 		perror("setsockopt for SO_REUSEPORT");
-		return ret;
+		goto err_socket;
 	}
 
 	if (ctx->mark != 0) {
@@ -530,16 +531,16 @@ static int ovpn_socket(struct ovpn_ctx *ctx, sa_family_t family, int proto)
 				 sizeof(ctx->mark));
 		if (ret < 0) {
 			perror("setsockopt for SO_MARK");
-			return ret;
+			goto err_socket;
 		}
 	}
 
 	if (family == AF_INET6) {
 		opt = 0;
-		if (setsockopt(s, IPPROTO_IPV6, IPV6_V6ONLY, &opt,
-			       sizeof(opt))) {
+		ret = setsockopt(s, IPPROTO_IPV6, IPV6_V6ONLY, &opt, sizeof(opt));
+		if (ret < 0) {
 			perror("failed to set IPV6_V6ONLY");
-			return -1;
+			goto err_socket;
 		}
 	}
 

base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.25.1

