Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC6938E8CA;
	Sun, 11 Oct 2026 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791715404; cv=none; b=VxDF/YKofHNLLhbJmNDF6jQ3vYHF5b9kswHtxbrFXnS/waYg81hDqOyz0PuGFek5iCkIdEA+zt/3YGXhI0eBdrVkENRJeG1EzCUd9lTHrxG4B2r7RdfWdVEy9UElFVy+1VtNS/PL4rxEJOnM+/oobqq6g0q+oYAwDFyGh7Nbkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791715404; c=relaxed/simple;
	bh=MY3t7IPbmxk2jwHc9NJvGmvU71YyiKhEmlZ8CyvIFtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTmrKlByqcG0XNpuVrwK9dlVZZWvivTlUjaG2a9tLckn/691WnRZY3jlZJT9nCp+NWZO+Fl6GkSrDzznYeCdt9+dP//teKZdrj3arBZsA1aqSk/3DoTUTXe7A7Mf/b6E8LUl9eTGPPcpbxuG6PC5Krjk+dTV79GMklp1S3xo6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=uuOOJwga; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="uuOOJwga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=uuOOJwgasPRfMacVi56hXwlhDEt2VJHHQ7u3zwK9YRFXuM4ZZnCq34m1vQo1Tny/irtOVzc888uFb
	 IjJyTIrGuqSs4b8l42nJV+z0J/+NjB/a5ENtKdPkBhzSY54RploHU3+di4uD8KG48YQU4T7XRENdR1
	 HD6LMPaejGnntEnQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36acb683e544-9b503;
	Sun, 11 Oct 2026 18:43:13 +0800 (CST)
X-RM-TRANSID:2ee36acb683e544-9b503
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[112.22.251.201])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36acb6838c79-9a809;
	Sun, 11 Oct 2026 18:43:12 +0800 (CST)
X-RM-TRANSID:2ee36acb6838c79-9a809
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Martin Varghese <martin.varghese@nokia.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v2] selftests: net: bareudp: Add stream tests with software GSO
Date: Sun, 11 Oct 2026 18:43:00 +0800
Message-ID: <20261011104300.1606351-1-yanhaishuang@cmss.chinamobile.com>
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

Copy a file over TCP from NS0 to NS3 with socat after the IPv4 and IPv6
ping tests, with UDP tunnel segmentation offload disabled on the
underlay veths, so that the GSO packets encapsulated by bareudp are
segmented in software. Raise the MTU of the underlay veths, so that full
sized packets fit with the encapsulation, as there is no path MTU
discovery through bareudp.

The MPLS overlay gets no stream test: bareudp does not set
mpls_features, so MPLS GSO packets are segmented by mpls_gso before
they reach bareudp, and are dropped if mpls_gso is not available.

The ping and stream tests share the result reporting, so move it into
report_result(). Without socat or ethtool, the stream tests are skipped.

Without commit c57b2e60d4bf ("bareudp: set the inner protocol to the
protocol of the packet"), the IPv4 and IPv6 streams over UDPv6, and the
IPv6 stream over UDPv4 in multiproto mode, time out.

Suggested-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
v2:
- Drop the MPLS stream tests: MPLS GSO packets are segmented by mpls_gso
  before bareudp, so they do not exercise the tunnel GSO path, and they
  fail if mpls_gso is not available (Sashiko).
- Remove the temporary file before cleaning up the namespaces (Sashiko).
v1: https://lore.kernel.org/netdev/20261008055920.1560930-1-yanhaishuang@cmss.chinamobile.com/

 tools/testing/selftests/net/bareudp.sh | 92 ++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/bareudp.sh b/tools/testing/selftests/net/bareudp.sh
index d9e5b967f815..15f102143fd3 100755
--- a/tools/testing/selftests/net/bareudp.sh
+++ b/tools/testing/selftests/net/bareudp.sh
@@ -105,16 +105,27 @@
 # |                    (encapsulated with MPLS label 200)                 |
 # |                                                                       |
 # +-----------------------------------------------------------------------+
+#
+# Besides the ping tests, a file is copied over TCP from NS0 to NS3 with
+# socat for the IPv4 and IPv6 overlays. UDP tunnel segmentation offload is
+# disabled on veth12 and veth21, so that the GSO packets encapsulated by
+# bareudp are segmented in software. These two veths get a larger MTU to fit
+# the encapsulation.
 
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
+	[ -n "${TMPFILE}" ] && rm -f "${TMPFILE}"
 	cleanup_all_ns
 
 	if [ "${ERR}" -eq 4 ]; then
@@ -180,6 +191,29 @@ setup_underlay()
 
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
@@ -252,9 +286,6 @@ setup_overlay_mpls()
 #   * $2: the IP address to ping,
 #   * $3: a human readable description of the purpose of the test.
 #
-# If the test fails and PAUSE_ON_FAIL is active, the user is given the
-# possibility to continue with the next test or to quit immediately.
-#
 ping_test_one()
 {
 	local PING="$1"; readonly PING
@@ -269,7 +300,50 @@ ping_test_one()
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
@@ -307,9 +381,13 @@ ping_test()
 
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
@@ -471,6 +549,12 @@ check_features()
 
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



