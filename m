Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3494570D1
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390099; cv=none; b=nk+jtoyw4xutHQl/Nrirh+s+8dUTA0fG97sC9UFdVggyIsMjKRlEYfhoiTk1Jmk6UvciLUF9/LHxCTCFR1LWVikJ7xHBocB9nQxF2WLq+hjI7BXkWoGlwNmP05BXmlO1rS+TQeqzq0qOYp7oinP0R13QAHZz3B/zveH7R5WOrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390099; c=relaxed/simple;
	bh=RhRgkBeiEM5o/v9NM7SkiXJQPTZzpf6pbVeIeWURYxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dti3MtPsiafJjT0DZOwkPYhqfFAJrr2X+qe6DZ6fMmq74C16LaEWPoNSGkiJvHYJ/rUb+GIVjHeMECHEu9L/sB0vncXO3AUAG9jiDlsWXaYmE64ueGy4D9pD6oaxgbtahF7VWTeTSa5LuGjPgo3/WbBXtrr+H//0rnwUG5mm5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/MmwmGS; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/MmwmGS"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f18c0e03e3so906296a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390087; x=1788994887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOl+dZ+q7hvvo0J5mVJmcvzg0LjyI9SaWnMmTPJSwo4=;
        b=n/MmwmGSJKa0/eLNMSW8+P9xuYcXVC1vu/me2G4ZWJLsJP2qktKjEMCJf3RlywS8me
         FmNMsquODb/to33CpvfM9J/KOx4jQWs0Mp3fiAaDaOcUPyjwUv61RPJLnoWPv3WfKPkz
         9BgKbrJz0ETAMNtBk/6LJWDhpMYDv/VV88L2LpldX0lPcE2DJEEK57t7nk6qyZ7/vW0o
         wDdhDl4cyBA/Aa+vB6wgQXExDBLWYeNX4akuIGs9sCp4dqWzbKjcNgP6+qpLUrm7SRqu
         inl+xC/ekuC4kB2iCAnpIIu8He4hksR8/v5HS3TZ7fl65DEALZvCWxccvAufjsQKhzg/
         f07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390087; x=1788994887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOl+dZ+q7hvvo0J5mVJmcvzg0LjyI9SaWnMmTPJSwo4=;
        b=pYz4cZ8ZVNswpc0asBvGoUpCQyp9cwI1H1Vk6kTQKbTWEqgYQk2QGa/EVLEQDaiFBF
         bzr4CDLCTflG90t589gujH/aqQTR1Qi3MDGWatOQZjDHuXzpNdXGiWSiwIR1js0/Wyim
         XjFE+A8sLs14ZaEjbBbuxcySu0xvbuEDup9VglKzgDr1Bde96907aKzeD9b98e+gCsGq
         OiIaOLR+WRXm3ysVhJlJ4bulTinxEpv6wHK58FILapHmCEZht9asTeB6h2Au4Tm79IK0
         zPE72ogFvWLdvP/qiM1H7czA8IWHKruoo0Xhm5unv8rJ05g2hPzWsqB+6Rfg8ij4lg4B
         71TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzldfk+2gDQpLMYJkY/YXo+htNvdROuZvkb19BdrdSPhr+jSDmSY2NeR3AWyureXWxmftT6iUmy36nYf/DHv3c=@vger.kernel.org
X-Gm-Message-State: AFuF++kuAP+wltxI+B5K2oBD5iUqJBb+GDXg8oLoi+WoQFvdve/Mx8Ah
	fFNO7bXlq90JpxEst02QR7GrA3Hrs8nn8J3SB2WLDZjic0jCdFtZESk4
X-Gm-Gg: AYBFou2OeGH5JvcOn6nTJyZvflEYiNfP3DpugVlrF59zNPUIfO9xgGY06gNDvnUTqYW
	2iBEtBnDWonqdC+TyjoOzM5MgfHKpOMi2byn7d1CBmr/DFc0usbLlrlz75fR4fJ2mhJla73E7Lm
	eQxrwWAoRFeSIH3yo7jd50/Bts8E/b4yCSrTpmREBCdIlSnEtBAPXNYMFR46gflJi36uByJFfe7
	zk+fDteRgX8v8GqItl9aWt0KQjC+PJ27yjIw0RMsjb+2VO0D3HrSBlCXGCMtPCHfpovE5EVLfHz
	7dXBbNDzpSCF+vetqUbHD232MtB8qPZlRRrtAdi5ms83sdreRRUwug8VMifp3wFFJYibBgkYc3T
	S+6UuyFQw0J908Ih8zFwGOTvMND+bJewZSDHrJoJOHIJJsGrLwzHjNl1xEpEpFlSAp9wyO8uaE+
	2WxqFam0KpX8XAM2DQ+YPi1RXI9WW6H2INxZdKmhjQ6V6xAtq7+Pt6A4ut1UPTbZN7gbM=
X-Received: by 2002:a05:6830:828e:b0:7f3:fb71:a4cc with SMTP id 46e09a7af769-7f7819a0e9emr7714131a34.14.1788390087207;
        Wed, 02 Sep 2026 16:01:27 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:53::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74f8f7fbcsm3519995a34.23.2026.09.02.16.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:25 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 02 Sep 2026 16:00:51 -0700
Subject: [PATCH net-next 5/6] selftests/vsock: test the guest vsock device
 network namespace
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-vsock-guest-ns-v1-5-9995383e9a8b@meta.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, sargun@sargun.me, 
 jlinbox@meta.com, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add six tests covering basic cases and hopefully most edge cases: normal
transfer in both directions, namespaces being deleted, device movement
between namespaces mid-socket-lifetime.

The namespaces are created with "unshare -n" and held open by a sleeping
process rather than by ip netns because bind-mounting namespaces via ip
netns is incompatible with the guest 9p rootfs.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 404 +++++++++++++++++++++++++++++++-
 1 file changed, 394 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 310dfc2a39ad..53591fa07f1a 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -17,6 +17,7 @@ readonly KERNEL_CHECKOUT=$(realpath "${SCRIPT_DIR}"/../../../../)
 source "${SCRIPT_DIR}"/../kselftest/ktap_helpers.sh
 
 readonly VSOCK_TEST="${SCRIPT_DIR}"/vsock_test
+readonly VSOCK_ASSIGN_G2H_NETNS="${SCRIPT_DIR}"/vsock_assign_g2h_netns
 readonly TEST_GUEST_PORT=51000
 readonly TEST_HOST_PORT=50000
 readonly TEST_HOST_PORT_LISTENER=50001
@@ -73,6 +74,12 @@ readonly TEST_NAMES=(
 	ns_delete_vm_ok
 	ns_delete_host_ok
 	ns_delete_both_ok
+	ns_guest_local_connect_to_host_fails
+	ns_guest_assign_g2h_netns_connect_to_host_ok
+	ns_guest_assign_g2h_netns_init_ns_connect_fails
+	ns_guest_assign_g2h_netns_host_connect_ok
+	ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
+	ns_guest_assign_g2h_netns_old_conn_send_fails
 )
 readonly TEST_DESCS=(
 	# vm_server_host_client
@@ -149,12 +156,36 @@ readonly TEST_DESCS=(
 
 	# ns_delete_both_ok
 	"Check that deleting the VM and host's namespaces does not break the socket connection"
+
+	# ns_guest_local_connect_to_host_fails
+	"Check a guest process in a local ns cannot reach the host without the assign ioctl."
+
+	# ns_guest_assign_g2h_netns_connect_to_host_ok
+	"Check a guest process in a local ns reaches the host once the vsock device is assigned to it."
+
+	# ns_guest_assign_g2h_netns_init_ns_connect_fails
+	"Check the guest's initial ns loses vsock once the device is assigned to another ns."
+
+	# ns_guest_assign_g2h_netns_host_connect_ok
+	"Check the host reaches a guest listener in the ns the vsock device is assigned to."
+
+	# ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
+	"Check the guest's vsock device returns to the initial ns when its ns is deleted."
+
+	# ns_guest_assign_g2h_netns_old_conn_send_fails
+	"Check connections made before the assign stop sending once they lose the device."
 )
 
 readonly USE_SHARED_VM=(
 	vm_server_host_client
 	vm_client_host_server
 	vm_loopback
+	ns_guest_local_connect_to_host_fails
+	ns_guest_assign_g2h_netns_connect_to_host_ok
+	ns_guest_assign_g2h_netns_init_ns_connect_fails
+	ns_guest_assign_g2h_netns_host_connect_ok
+	ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
+	ns_guest_assign_g2h_netns_old_conn_send_fails
 )
 readonly NS_MODES=("local" "global")
 
@@ -302,18 +333,20 @@ check_args() {
 }
 
 check_deps() {
-	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter; do
+	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter unshare; do
 		if [[ ! -x $(command -v "${dep}") ]]; then
 			echo -e "skip:    dependency ${dep} not found!\n"
 			exit "${KSFT_SKIP}"
 		fi
 	done
 
-	if [[ ! -x $(command -v "${VSOCK_TEST}") ]]; then
-		printf "skip:    %s not found!" "${VSOCK_TEST}"
-		printf " Please build the kselftest vsock target.\n"
-		exit "${KSFT_SKIP}"
-	fi
+	for prog in "${VSOCK_TEST}" "${VSOCK_ASSIGN_G2H_NETNS}"; do
+		if [[ ! -x $(command -v "${prog}") ]]; then
+			printf "skip:    %s not found!" "${prog}"
+			printf " Please build the kselftest vsock target.\n"
+			exit "${KSFT_SKIP}"
+		fi
+	done
 }
 
 check_netns() {
@@ -401,6 +434,7 @@ setup_home() {
 	mkdir -p "$(dirname "${SSH_KEY_PATH}")"
 	ssh-keygen -t ed25519 -f "${SSH_KEY_PATH}" -N "" -q
 	cp "${VSOCK_TEST}" "${TEST_HOME}"/vsock_test
+	cp "${VSOCK_ASSIGN_G2H_NETNS}" "${TEST_HOME}"/vsock_assign_g2h_netns
 }
 
 create_pidfile() {
@@ -528,6 +562,58 @@ vm_wait_for_ssh() {
 	done
 }
 
+# Create a local mode namespace in the VM and echo the pid holding it open.
+vm_ns_start() {
+	local ns=$1
+
+	vm_ssh "${ns}" -- \
+		"echo local > /proc/sys/net/vsock/child_ns_mode" &>/dev/null
+
+	vm_ssh "${ns}" -- "unshare -n sleep infinity" \
+		'>/dev/null 2>&1 & echo $!'
+}
+
+# Returns once the holder is gone, so that the namespace is unreferenced and
+# the kernel can start tearing it down.
+vm_ns_stop() {
+	local ns=$1
+	local nspid=$2
+
+	vm_ssh "${ns}" <<-EOF &>/dev/null
+		kill ${nspid}
+		for ((i = 0; i < ${WAIT_PERIOD_MAX}; i++)); do
+			kill -0 ${nspid} 2>/dev/null || break
+			sleep 1
+		done
+	EOF
+}
+
+# Runs in the guest's initial namespace when <nspid> is empty. The command must
+# not contain single quotes.
+vm_ns_exec() {
+	local ns=$1
+	local nspid=$2
+	local cmd=$3
+
+	if [[ -z "${nspid}" ]]; then
+		vm_ssh "${ns}" -- "${cmd}"
+		return
+	fi
+
+	vm_ssh "${ns}" -- nsenter -t "${nspid}" -n sh -c "'${cmd}'"
+}
+
+vm_ns_assign_g2h() {
+	local ns=$1
+	local nspid=$2
+
+	vm_ns_exec "${ns}" "${nspid}" ./vsock_assign_g2h_netns
+}
+
+vm_reset_g2h() {
+	vm_ns_assign_g2h "init_ns" "" &>/dev/null
+}
+
 # derived from selftests/net/net_helper.sh
 wait_for_listener()
 {
@@ -564,17 +650,31 @@ wait_for_listener()
 	done
 }
 
-vm_wait_for_listener() {
+# Runs in the guest's initial namespace when <nspid> is empty.
+vm_ns_wait_for_listener() {
 	local ns=$1
-	local port=$2
-	local protocol=$3
+	local nspid=$2
+	local port=$3
+	local protocol=$4
+	local nsenter=
+
+	[[ -n "${nspid}" ]] && nsenter="nsenter -t ${nspid} -n"
 
 	vm_ssh "${ns}" <<EOF
 $(declare -f wait_for_listener)
-wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX} ${protocol}
+export -f wait_for_listener
+${nsenter} bash -c "wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX} ${protocol}"
 EOF
 }
 
+vm_wait_for_listener() {
+	local ns=$1
+	local port=$2
+	local protocol=$3
+
+	vm_ns_wait_for_listener "${ns}" "" "${port}" "${protocol}"
+}
+
 host_wait_for_listener() {
 	local ns=$1
 	local port=$2
@@ -1421,6 +1521,290 @@ test_ns_delete_both_ok() {
 	check_ns_delete_doesnt_break_connection "both"
 }
 
+# Send a string from the guest to a host listener and leave what the host
+# received in <outfile>.
+guest_send_to_host() {
+	local ns=$1
+	local nspid=$2
+	local port=$3
+	local outfile=$4
+	local cmd="echo TEST | socat -u STDIN VSOCK-CONNECT:2:${port}"
+	local pid
+
+	socat -u VSOCK-LISTEN:"${port}" STDOUT > "${outfile}" 2>/dev/null &
+	pid=$!
+	host_wait_for_listener "${ns}" "${port}" "vsock"
+
+	vm_ns_exec "${ns}" "${nspid}" "${cmd}" 2>/dev/null
+
+	timeout "${WAIT_PERIOD}" \
+		bash -c 'while [[ ! -s '"${outfile}"' ]]; do sleep 1; done'
+
+	terminate_pids "${pid}"
+}
+
+# Send a string from the host to a listener in the guest and leave what the
+# guest received in <outfile>.
+host_send_to_guest() {
+	local ns=$1
+	local nspid=$2
+	local port=$3
+	local outfile=$4
+	local cmd="socat -u VSOCK-LISTEN:${port} STDOUT"
+	local dst="VSOCK-CONNECT:${VSOCK_CID}:${port}"
+	local pid
+
+	vm_ns_exec "${ns}" "${nspid}" "${cmd}" > "${outfile}" 2>/dev/null &
+	pid=$!
+	vm_ns_wait_for_listener "${ns}" "${nspid}" "${port}" "vsock"
+
+	echo TEST | socat -u STDIN "${dst}" 2>/dev/null
+
+	timeout "${WAIT_PERIOD}" \
+		bash -c 'while [[ ! -s '"${outfile}"' ]]; do sleep 1; done'
+
+	terminate_pids "${pid}"
+}
+
+test_ns_guest_assign_g2h_netns_old_conn_send_fails() {
+	local gap=$(( WAIT_PERIOD * 3 ))
+	local port=12346
+	local outfile
+	local result
+	local nspid
+	local pid
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	outfile=$(mktemp)
+	socat -u VSOCK-LISTEN:"${port}" STDOUT > "${outfile}" 2>/dev/null &
+	pid=$!
+	host_wait_for_listener "init_ns" "${port}" "vsock"
+
+	# Send a message, wait, then send another. While waiting, assign the
+	# device to a namespace. Confirm the second message does not arrive.
+	vm_ssh "init_ns" -- \
+		"(echo FIRST; sleep ${gap}; echo SECOND) |" \
+		"socat -u STDIN VSOCK-CONNECT:2:${port}" &>/dev/null &
+
+	sleep "${WAIT_PERIOD}"
+
+	if ! vm_ns_assign_g2h "init_ns" "${nspid}"; then
+		log_host "failed to assign the vsock device to the guest ns"
+		terminate_pids "${pid}"
+		rm -f "${outfile}"
+		vm_ns_stop "init_ns" "${nspid}"
+		vm_reset_g2h
+		return "${KSFT_FAIL}"
+	fi
+
+	# Let the second write happen and land, if it is going to.
+	sleep $(( gap + WAIT_PERIOD ))
+
+	terminate_pids "${pid}"
+	result=$(cat "${outfile}")
+	rm -f "${outfile}"
+
+	vm_ns_stop "init_ns" "${nspid}"
+	vm_reset_g2h
+
+	if [[ "${result}" != *FIRST* ]]; then
+		log_host "connection did not work before the assign: [${result}]"
+		return "${KSFT_FAIL}"
+	fi
+
+	if [[ "${result}" == *SECOND* ]]; then
+		log_host "old connection still delivered after the assign"
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_local_connect_to_host_fails() {
+	local port=12345
+	local outfile
+	local result
+	local nspid
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	outfile=$(mktemp)
+	guest_send_to_host "init_ns" "${nspid}" "${port}" "${outfile}"
+
+	vm_ns_stop "init_ns" "${nspid}"
+	vm_reset_g2h
+
+	result=$(cat "${outfile}")
+	rm -f "${outfile}"
+
+	if [[ "${result}" == TEST ]]; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_assign_g2h_netns_connect_to_host_ok() {
+	local port=12345
+	local outfile
+	local result
+	local nspid
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	if ! vm_ns_assign_g2h "init_ns" "${nspid}"; then
+		log_host "failed to assign the vsock device to the guest ns"
+		vm_ns_stop "init_ns" "${nspid}"
+		vm_reset_g2h
+		return "${KSFT_FAIL}"
+	fi
+
+	outfile=$(mktemp)
+	guest_send_to_host "init_ns" "${nspid}" "${port}" "${outfile}"
+
+	vm_ns_stop "init_ns" "${nspid}"
+	vm_reset_g2h
+
+	result=$(cat "${outfile}")
+	rm -f "${outfile}"
+
+	if [[ "${result}" != TEST ]]; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_assign_g2h_netns_init_ns_connect_fails() {
+	local port=12345
+	local outfile
+	local result
+	local nspid
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	if ! vm_ns_assign_g2h "init_ns" "${nspid}"; then
+		log_host "failed to assign the vsock device to the guest ns"
+		vm_ns_stop "init_ns" "${nspid}"
+		vm_reset_g2h
+		return "${KSFT_FAIL}"
+	fi
+
+	# The device now belongs to a local-mode namespace, so the guest's
+	# initial namespace must no longer reach the host.
+	outfile=$(mktemp)
+	guest_send_to_host "init_ns" "" "${port}" "${outfile}"
+
+	vm_ns_stop "init_ns" "${nspid}"
+	vm_reset_g2h
+
+	result=$(cat "${outfile}")
+	rm -f "${outfile}"
+
+	if [[ "${result}" == TEST ]]; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_assign_g2h_netns_host_connect_ok() {
+	local port=12345
+	local outfile
+	local result
+	local nspid
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	if ! vm_ns_assign_g2h "init_ns" "${nspid}"; then
+		log_host "failed to assign the vsock device to the guest ns"
+		vm_ns_stop "init_ns" "${nspid}"
+		vm_reset_g2h
+		return "${KSFT_FAIL}"
+	fi
+
+	outfile=$(mktemp)
+	host_send_to_guest "init_ns" "${nspid}" "${port}" "${outfile}"
+
+	vm_ns_stop "init_ns" "${nspid}"
+	vm_reset_g2h
+
+	result=$(cat "${outfile}")
+	rm -f "${outfile}"
+
+	if [[ "${result}" != TEST ]]; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_assign_g2h_netns_reset_on_ns_delete_ok() {
+	local port=12345
+	local outfile
+	local result
+	local nspid
+	local i
+
+	nspid=$(vm_ns_start "init_ns")
+	if [[ -z "${nspid}" ]]; then
+		log_host "failed to create a namespace inside the guest"
+		return "${KSFT_FAIL}"
+	fi
+
+	if ! vm_ns_assign_g2h "init_ns" "${nspid}"; then
+		log_host "failed to assign the vsock device to the guest ns"
+		vm_ns_stop "init_ns" "${nspid}"
+		vm_reset_g2h
+		return "${KSFT_FAIL}"
+	fi
+
+	vm_ns_stop "init_ns" "${nspid}"
+
+	# The holder is gone, but the namespace itself is dismantled from a
+	# workqueue, so the device does not come back the same instant. Retry
+	# until it does, rather than expecting the first send to succeed.
+	outfile=$(mktemp)
+	for ((i = 0; i < 5; i++)); do
+		sleep "${WAIT_PERIOD}"
+		guest_send_to_host "init_ns" "" "$(( port + i ))" "${outfile}"
+		result=$(cat "${outfile}")
+		if [[ "${result}" == TEST ]]; then
+			break
+		fi
+	done
+
+	rm -f "${outfile}"
+	vm_reset_g2h
+
+	if [[ "${result}" != TEST ]]; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
 shared_vm_test() {
 	local tname
 

-- 
2.53.0-Meta

