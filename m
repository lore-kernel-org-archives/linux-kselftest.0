Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6EC1F94F;
	Sat, 10 Oct 2026 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595404; cv=none; b=nWtAu5RpBJUX/RVxZfFOrqSWVPv5CkfKJ0ps1mNRImfNv3dZ51Qca8tcAvH7ADNi0iqGy2WPQ5C//XW3hU+bgkTvnXbyPU2FUI9eYp+GdFZB3O+RXvmE9uJw+ISyj/pzoU2yCVb5h7JK/57iv9+64G63RDqK/wg/tgtc68tIhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595404; c=relaxed/simple;
	bh=l7CxGjJWXy8Pcpa0KQ1MwP0kjqUzqmUg6iAPDCSp49o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wqdgo0nsmQvHrzfiL2wa+PplGMaBHxioa6gqKNZNOQntLb+4dnLbs9xfgm553K/oYeot+jK9s06z+E1KyxSTvBHjKeMdIcRM3+uPoo35szqs6zhBh9/IITKZxNWPcTThUFOcsDYogyLcSOe//EwQ/PgjUNsAu2yGoDmcoMETQmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=v79vjjFL; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="v79vjjFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=v79vjjFLhfUbfpiqrdB8TJWwdGTzwdYRXNcLOPdeXx9jjkJ7QqMmRvkJEka8X00nmf0Fv9J5u7Bo8
	 F24UX0LWD6mG26HLFq+l0LiMKOqqMVZrXYj9M9OR+XxRyeP61CFJfKTVN1fVaGbaMZtky9mG/ZtHWf
	 6kAYR8d8URC5hv8Y=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26ac9937fbf5-ff01e;
	Sat, 10 Oct 2026 09:23:13 +0800 (CST)
X-RM-TRANSID:2ee26ac9937fbf5-ff01e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ac99379201-1f3bc;
	Sat, 10 Oct 2026 09:23:13 +0800 (CST)
X-RM-TRANSID:2ee76ac99379201-1f3bc
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	Martin Varghese <martin.varghese@nokia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next] selftests: net: bareudp: Add stream tests with software GSO
Date: Thu,  8 Oct 2026 13:59:20 +0800
Message-ID: <20261008055920.1560930-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bareudp tests only send pings, which are not GSO packets, so the
segmentation path of bareudp is not covered.

Copy a file over TCP from NS0 to NS3 with socat after each ping test,
with UDP tunnel segmentation offload disabled on the underlay veths, so
that the GSO packets encapsulated by bareudp are segmented in software.
Raise the MTU of the underlay veths, so that full sized packets fit with
the encapsulation, as there is no path MTU discovery through bareudp.

The ping and stream tests share the result reporting, so move it into
report_result(). Without socat or ethtool, the stream tests are skipped.

Without commit c57b2e60d4bf ("bareudp: set the inner protocol to the
protocol of the packet"), the IPv4 and IPv6 streams over UDPv6, and the
IPv6 stream over UDPv4 in multiproto mode, time out.

Suggested-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 tools/testing/selftests/net/bareudp.sh | 93 ++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/bareudp.sh b/tools/testing/selftests/net/bareudp.sh
index d9e5b967f815..4b6d3a64f3c3 100755
--- a/tools/testing/selftests/net/bareudp.sh
+++ b/tools/testing/selftests/net/bareudp.sh
@@ -105,17 +105,27 @@
 # |                    (encapsulated with MPLS label 200)                 |
 # |                                                                       |
 # +-----------------------------------------------------------------------+
+#
+# Besides the ping tests, a file is copied over TCP from NS0 to NS3 with
+# socat. UDP tunnel segmentation offload is disabled on veth12 and veth21,
+# so that the GSO packets encapsulated by bareudp are segmented in software.
+# These two veths get a larger MTU to fit the encapsulation.
 
 . ./lib.sh
 
 ERR=4 # Return 4 by default, which is the SKIP code for kselftest
 PING6="ping"
 PAUSE_ON_FAIL="no"
+STREAM="yes"
+STREAM_PORT=5000
+STREAM_TIMEOUT=10
+TMPFILE=""
 
 # Exit the script after having removed the network namespaces it created
 exit_cleanup()
 {
 	cleanup_all_ns
+	[ -n "${TMPFILE}" ] && rm -f "${TMPFILE}"
 
 	if [ "${ERR}" -eq 4 ]; then
 		echo "Error: Setting up the testing environment failed." >&2
@@ -180,6 +190,29 @@ setup_underlay()
 
 	tc -netns "${NS1}" qdisc add dev veth10 ingress
 	tc -netns "${NS2}" qdisc add dev veth23 ingress
+
+	if [ "${STREAM}" = "yes" ]; then
+		# Leave room for the encapsulation on the underlay, so that full
+		# sized packets from NS0 can be tunnelled without fragmentation
+		ip -netns "${NS1}" link set dev veth12 mtu 1600
+		ip -netns "${NS2}" link set dev veth21 mtu 1600
+
+		# Segment the encapsulated GSO packets in software
+		ip netns exec "${NS1}" ethtool -K veth12 \
+			tx-udp_tnl-segmentation off \
+			tx-udp_tnl-csum-segmentation off
+		ip netns exec "${NS2}" ethtool -K veth21 \
+			tx-udp_tnl-segmentation off \
+			tx-udp_tnl-csum-segmentation off
+
+		TMPFILE=$(mktemp)
+		dd if=/dev/urandom of="${TMPFILE}" bs=1M count=16 status=none
+
+		ip netns exec "${NS3}" socat -u \
+			TCP6-LISTEN:"${STREAM_PORT}",ipv6only=0,reuseaddr,fork \
+			OPEN:/dev/null &
+		wait_local_port_listen "${NS3}" "${STREAM_PORT}" tcp
+	fi
 }
 
 # Set up the IPv4, IPv6 and MPLS overlays.
@@ -252,9 +285,6 @@ setup_overlay_mpls()
 #   * $2: the IP address to ping,
 #   * $3: a human readable description of the purpose of the test.
 #
-# If the test fails and PAUSE_ON_FAIL is active, the user is given the
-# possibility to continue with the next test or to quit immediately.
-#
 ping_test_one()
 {
 	local PING="$1"; readonly PING
@@ -269,7 +299,50 @@ ping_test_one()
 	RET=$?
 	set -e
 
-	if [ "${RET}" -eq 0 ]; then
+	report_result "${RET}"
+}
+
+# Copy a file over TCP from NS0 to NS3 and print the result
+#
+# Parameters:
+#
+#   * $1: the socat address of the receiver,
+#   * $2: a human readable description of the purpose of the test.
+#
+stream_test_one()
+{
+	local ADDR="$1"; readonly ADDR
+	local MSG="$2"; readonly MSG
+	local RET
+
+	printf "TEST: %-60s  " "${MSG}"
+
+	if [ "${STREAM}" != "yes" ]; then
+		printf "[SKIP]\n"
+		return
+	fi
+
+	set +e
+	ip netns exec "${NS0}" timeout "${STREAM_TIMEOUT}" \
+		socat -u OPEN:"${TMPFILE}" "${ADDR}" > /dev/null 2>&1
+	RET=$?
+	set -e
+
+	report_result "${RET}"
+}
+
+# Print the result of a test
+#
+# Parameters:
+#
+#   * $1: the exit code of the test.
+#
+# If the test fails and PAUSE_ON_FAIL is active, the user is given the
+# possibility to continue with the next test or to quit immediately.
+#
+report_result()
+{
+	if [ "$1" -eq 0 ]; then
 		printf "[ OK ]\n"
 	else
 		ERR=1
@@ -307,12 +380,18 @@ ping_test()
 
 	if [ $IPV4 ]; then
 		ping_test_one "ping" "192.0.2.103" "IPv4 packets over ${UNDERLAY}${MODE}"
+		stream_test_one "TCP4:192.0.2.103:${STREAM_PORT}" \
+			"IPv4 stream over ${UNDERLAY}${MODE}"
 	fi
 	if [ $IPV6 ]; then
 		ping_test_one "${PING6}" "2001:db8::103" "IPv6 packets over ${UNDERLAY}${MODE}"
+		stream_test_one "TCP6:[2001:db8::103]:${STREAM_PORT}" \
+			"IPv6 stream over ${UNDERLAY}${MODE}"
 	fi
 	if [ $MPLS_UC ]; then
 		ping_test_one "${PING6}" "2001:db8::203" "Unicast MPLS packets over ${UNDERLAY}${MODE}"
+		stream_test_one "TCP6:[2001:db8::203]:${STREAM_PORT}" \
+			"Unicast MPLS stream over ${UNDERLAY}${MODE}"
 	fi
 }
 
@@ -471,6 +550,12 @@ check_features()
 
 	# Use ping6 on systems where ping doesn't handle IPv6
 	ping -w 1 -c 1 ::1 > /dev/null 2>&1 || PING6="ping6"
+
+	if [ ! -x "$(command -v socat)" ] ||
+	   [ ! -x "$(command -v ethtool)" ]; then
+		echo "socat or ethtool not found, skipping the stream tests" >&2
+		STREAM="no"
+	fi
 }
 
 usage()
-- 
2.43.0



