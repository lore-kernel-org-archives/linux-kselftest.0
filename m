Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074529E10F
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779759745; cv=none; b=OHc2ZON59bpgJP2WLiWud2ZoxaGzPYT6+H2F4exCHCayeYMoEQlMihfDPW7n1HG3n9KRZPnYyqUrmjLYSZgBFLDkC/gMUA6HECOy+AP2s1ltScF+b3Ud51lg7tr7C+RLG4Ren6SIqbmdo/WUcJRF9RrI1ck0VwdLIusLylQ3EtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779759745; c=relaxed/simple;
	bh=3k+4/prxIu3sSF4ZXZ5KU7C6MaPJice3RG6ToJs2Y08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5ZKEaaqYN6tvhgD+GoZUeVG4hVJy7RAtDL6HWhpDXIhvP0vyK2zLzGDUKoc1oN46/y7ypYPNIYFpuhfLjBfaVE0sylSGzOJTWNY2fOsz8uK3/tyHgTVDRBMNmCelWolKsMRrz5zKGqiLKAkQjfLnFNNyDpCjH5Im8RYJW70UYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w2eB7PzJ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w2eB7PzJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779759731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdRbc9N0KyI+C4TfluCvSP2H+w3ISxsXMdimQER6nhk=;
	b=w2eB7PzJGG9hF8oYI4k8BAZeQagLmrggi2rM1C3ng19DbH3ROA+yjA7a3ZW6sKBsa6ji6R
	5ZVLcydv+0EWfxtqsAVjIipurUqpSzAGxQ/RGuC379DHTkkNmQNmhGK8u95wg37dpf6Pqp
	3Qcwr+VHglyDu495mlEBmVK4aPoM1+I=
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
Subject: [PATCH net-next] selftests: net: add socat syslog for PPPoL2TP
Date: Tue, 26 May 2026 09:41:47 +0800
Message-ID: <20260526014152.532505-1-qingfang.deng@linux.dev>
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
 tools/testing/selftests/net/ppp/pppol2tp.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
index 5b592785f1f9..96786267ccc7 100755
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
@@ -80,6 +86,15 @@ ppp_test_connectivity
 
 log_test "PPPoL2TP"
 
+# Dump syslog messages if the test failed
+if [ "$RET" -ne 0 ]; then
+	while read -r _sign _date _time len _from _to
+	do      len=${len##*=}
+		read -n "$len" -r LINE
+		echo "$LINE"
+	done < "$PPPOL2TP_LOG"
+fi
+
 # Recursion test
 RET=0
 # Delete route to LNS IP
-- 
2.43.0

