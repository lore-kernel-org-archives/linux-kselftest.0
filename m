Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215073655E7;
	Fri, 21 Aug 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282145; cv=none; b=Gjr1o3qZoFqFkGg/0D3Q1uFSnlBTaL1AjqLwqagB2EvXaEQV3Zv6OKZmw/O27d6CwWWkSfhVT8b4jOzxY/clw0N1ntdAgNwqZ0A5Fd/qjKK82N2Njz+2TiTTL8I1++Ixi/IpGODTu+jWRKPBxw6LVkLNWltK/Cgj3fwMYh7GcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282145; c=relaxed/simple;
	bh=8IfjYuihBECdPsO9RqaIXo9GXHFXSpPhZCvj429h7wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JG8WaAbSCXzDCKx1OzIfazcglJI+5tE0uWRFSh38hnA7VGngrhAFZlNMhauLCf/gw0JdibGlV1RIyqThpFTKX7xk89/qB8nHeGH1VGK2Pj7bWz/zQtr403xzoXl0G6qnnR6lvw+HkJKehANBYyYQN1Ek8WqkRWmiZv9rZxV8Sqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hSnSrRgz; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hSnSrRgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y6
	k9Nq10QBHJG6u1InnsnOBXdpZO9DcjAmWPItGobNY=; b=hSnSrRgzzROrSn2TBP
	sV9lPWeCBZ7lNSv5oWuo25bcQPtZelRT3t7Yj6ezxwdOak/USLHzu6TGtimrDoeV
	dJj9E5I19ZwaIAnVCThVjKibSDAb7tQ05MlTgIb/6ysS5o1Zt+EGQ4M1FaxfCPIe
	ZxJks7JGA1GYz6XSvM9uwmcHA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H5Giwodq71VORA--.62832S2;
	Fri, 21 Aug 2026 11:14:43 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	SeongJae Park <sjpark@amazon.de>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH net v2 1/2] selftests/net: fix kill() argument order and wrapper cleanup in fin_ack_lat
Date: Fri, 21 Aug 2026 11:14:41 +0800
Message-Id: <20260821031442.1124777-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821030922.1123754-1-fffsqian@163.com>
References: <20260821030922.1123754-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H5Giwodq71VORA--.62832S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw47Cr4UJry5tw1rCFW8Xrb_yoW8Kr13pF
	WfGasIkFy8Ja17t3W0k3yUXFyxXFs3Ww4xGr18Wry8Zas5JFy8WrZrK3WjqrnFq39Yg3WY
	vr1IgFWF93WDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pipVbPUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6QNVIGqHwqNbowAA3r

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

sig_handler() passes its arguments to kill() in the wrong order: it sends
signal number child_pid to PID SIGTERM (15) instead of sending SIGTERM
to the client process.  The call therefore always fails and the signal
is never forwarded: when only the server process receives SIGTERM, the
client keeps running its infinite connect loop as an orphan process.

Swap the arguments so that the server forwards SIGTERM to the client.
Guard the call with child_pid > 0: the client inherits the handler and
sees child_pid == 0, and a plain argument swap would make it call
kill(0, SIGTERM), signaling the whole process group instead of exiting
quietly.

Now that the server actually terminates the client before the wrapper
script's cleanup runs, kill() may fail with ESRCH for the already-exited
client.  The script uses set -e, so make the kill tolerant to avoid
aborting the EXIT trap and leaking temporary files.

Fixes: af8c8a450bf4 ("selftests: net: Add FIN_ACK processing order related latency spike test")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/fin_ack_lat.c  | 3 ++-
 tools/testing/selftests/net/fin_ack_lat.sh | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/fin_ack_lat.c b/tools/testing/selftests/net/fin_ack_lat.c
index 4117332eb1a9..98044e6f9f43 100644
--- a/tools/testing/selftests/net/fin_ack_lat.c
+++ b/tools/testing/selftests/net/fin_ack_lat.c
@@ -103,7 +103,8 @@ static void server(int sock, struct sockaddr_in address)
 
 static void sig_handler(int signum)
 {
-	kill(SIGTERM, child_pid);
+	if (child_pid > 0)
+		kill(child_pid, SIGTERM);
 	exit(0);
 }
 
diff --git a/tools/testing/selftests/net/fin_ack_lat.sh b/tools/testing/selftests/net/fin_ack_lat.sh
index a3ff6e0b2c7a..a8aa2238ab5c 100755
--- a/tools/testing/selftests/net/fin_ack_lat.sh
+++ b/tools/testing/selftests/net/fin_ack_lat.sh
@@ -9,7 +9,7 @@ set -e
 tmpfile=$(mktemp /tmp/fin_ack_latency.XXXX.log)
 
 cleanup() {
-	kill $(pidof fin_ack_lat)
+	kill $(pidof fin_ack_lat) 2>/dev/null || true
 	rm -f $tmpfile
 }
 

base-commit: 7f063b2f17eaba2a35e251aa53627f2a70d536e2
-- 
2.25.1

