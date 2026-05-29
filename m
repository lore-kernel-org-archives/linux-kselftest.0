Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C335F19B
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780020737; cv=none; b=FfbDpXFGFN4+1ta8L4ocV8o6NHRvXnAzwsrO1aBJXt/EfL9g3hVWElsMRlgE3KzxvcD50INR2kj7veoCZwtjnXBVf8WRrF6WKQCO62prnVWzdRqIcpmKdzKC2eeZq/XEMzBL1pIOkueP9ATvuzXu5XgKMWKoXkfbR1cazq8Jn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780020737; c=relaxed/simple;
	bh=MF8FO56Msgy/cx81C5qSunb9zjw5ip5KruUP+aX4g08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdM1z3vopPNsmOoL+IIDLuwN9xRWqO+W+b4usFFXkxdmD5PqdMKdGRybpz0aPAA1JyqXWXSzDzstS823Qv5dc6gOAGOp6RUL0zgAZF/NGoYCyD227ElJMxEfplOmRKQkh8F5ZLN+1em04m9JiwrJQQGySaex6mvzqAU8pyjIoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lc2X7KCY; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lc2X7KCY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780020722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mQ7SFJ9UYfHWwn9AJeJt/zd1yG2GZC6kAhdDdPj35U0=;
	b=lc2X7KCYdxZ6YzxC72PCbcD8iy9PtqYThKq67VJlB3i4HcPDmqGpwz1DjqVhMXN4ZnoH8E
	E65o/S3+PgJ4oPoEKslk3rfunHX/RWdjOpj7+IJ7mPhdvtA4hav/n+ztsHkSP2J9qMwgYM
	jRdJcLF1zpoXvc60XqLIjnKmGeaZMqk=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthieu Baerts <matttbe@kernel.org>
Subject: [PATCH net-next v2] selftests: net: add socat syslog for PPPoL2TP
Date: Fri, 29 May 2026 10:11:42 +0800
Message-ID: <20260529021146.5739-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

As done in pppoe.sh, start socat as the syslog listener. In case the
test fails, dump its log to see what's going on.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2: move syslog dump to the end and use EXIT_STATUS
v1: https://lore.kernel.org/netdev/20260526014152.532505-1-qingfang.deng@linux.dev/
 tools/testing/selftests/net/ppp/pppol2tp.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
index 5b592785f1f9..37c4d56c5c6e 100755
--- a/tools/testing/selftests/net/ppp/pppol2tp.sh
+++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
@@ -9,10 +9,12 @@ OUTER_IP_SERVER="172.16.1.1"
 OUTER_IP_CLIENT="172.16.1.2"
 
 PPPOL2TP_DIR=$(mktemp -d /tmp/pppol2tp.XXXXXX)
+PPPOL2TP_LOG="$PPPOL2TP_DIR/l2tp.log"
 
 # shellcheck disable=SC2329
 cleanup() {
 	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
 	rm -rf "$PPPOL2TP_DIR"
 }
 
@@ -31,6 +33,10 @@ ip -netns "$NS_CLIENT" link set "$VETH_CLIENT" up
 ip -netns "$NS_SERVER" address add dev "$VETH_SERVER" "$OUTER_IP_SERVER" peer "$OUTER_IP_CLIENT"
 ip -netns "$NS_CLIENT" address add dev "$VETH_CLIENT" "$OUTER_IP_CLIENT" peer "$OUTER_IP_SERVER"
 
+# Start socat as syslog listener
+socat -v -u UNIX-RECV:/dev/log OPEN:/dev/null > "$PPPOL2TP_LOG" 2>&1 &
+SOCAT_PID=$!
+
 # Generate configuration files
 cat > "$PPPOL2TP_DIR/l2tp-server.conf" <<EOF
 [global]
@@ -92,4 +98,13 @@ check_fail $?
 
 log_test "PPPoL2TP Recursion"
 
+# Dump syslog messages if the test failed
+if [ "$EXIT_STATUS" -ne 0 ]; then
+	while read -r _sign _date _time len _from _to
+	do      len=${len##*=}
+		read -n "$len" -r LINE
+		echo "$LINE"
+	done < "$PPPOL2TP_LOG"
+fi
+
 exit "$EXIT_STATUS"
-- 
2.43.0

