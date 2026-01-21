Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5A43D4EC
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033536; cv=none; b=Sms9LHPWvT9YEMG56X/sKMQ6DUjPyQM+YwCUTD+1mxnukhAYZ8wgFsKsa1C7trbVFdLugGsOfZrJ3jWKc7Kik3zhxNVmBpmOLuT9zyjdy04r5u0S67LkINoMSeNJekKm1nfaek5lyccyCDfz/koQds0GbBx8Z9SsRT+N++vXccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033536; c=relaxed/simple;
	bh=P4erHizl27nbkGk13UaQgtaMcmfPrCQL8OW5nr9GtQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpShaMNW+/VUPK/4MvV+MVs88XhAEHahBA3fbAJJhezM/+YzXNXrSrFfuhw/ampVyln0wGKrfLBleTJkMYmJ/X4iIxupL4DN7bzwdGT0ltjEouvLCm39wr0S6zImLMhihDUfe1zlney0ER8cpa4AAbw9chJVjCmYFvTmkheB30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX+Ki3ni; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX+Ki3ni"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6467b7c3853so326983d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033526; x=1769638326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnWUXZAQs2u/RX1G1g/cLNdC4zcJTVF/JpiRxAH0cLc=;
        b=GX+Ki3ni1gmYlUQWy3Q3fjHsgnMlGoIplsLk7tFb7aOkP+FjHR5a4F4aXX/xSZCpHV
         7NKUmvCEUFVJZKJaL/FdMIw+coVyyvllvtq0yiyueCKEEN+NEztXmyDsW298+9uiQzVQ
         Kn1ihdkV24XHlonR2x2EoU9kTxbDhVX6DIYA2KoP/1trI3i5+wquN+pcI1srfD7bWYxl
         VI7EZXTi0SrL4pkRknKLtbf5vi6+24AmJzrLjq5tO+p/jChRu1oN7pJmvaLajtfUsuDG
         ufCQWkc4TLtPxsgXcA9oC+OmCXI2NCnMlwuqiTrQ8hw62g2+Z+G251i2OXEb+FGRfAt0
         vKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033526; x=1769638326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnWUXZAQs2u/RX1G1g/cLNdC4zcJTVF/JpiRxAH0cLc=;
        b=tIwITKk+LDnMOQd3QdFB7xAY5ycXdqpRHih4xXEtbxJR8yvNQFG+RC8MKMkopFGkxd
         bHrN0AqC88byiBCIfAxtguZ+VLcJ9CZyWbawBYNaFRPL19TnrjvkLaHr/y0kVnY/vHqN
         8skF6PMYZL42mutSpRa3onEiAI1rDEWsDEzILkKKs65HKe4PmcwmD5d0QHG6gfavrPJF
         yQIhZS9NwrIpw2HWu3VUOoYqH92cBpDyGj79KmtQHp3QIFoWzEmPEZ6xxkUkJLQ04ApB
         e/kerPBMl7dbZi8VA3EHpA1VwbpFq3OSVanKWoRu3EN+SIk7/uWFfmAK3ZSwR+fj8A41
         fEww==
X-Forwarded-Encrypted: i=1; AJvYcCU7VOLNqNPuYTT2w4NPGd9gPhnl0kMoEP2AZz4KTw5O7//82T6V9KDDoiMODkg16e3Py2OLrg71JlbP7FsnMJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHY/dpx61H8+rAwLPCTKy48n93GCAKneCJb9QXxQ036aFjnHja
	7wr2AxbR/bcsnGY8mKSLSesHsA5JhO1An6Ph/wKnZt7O+8ie3NiNNm7z
X-Gm-Gg: AZuq6aL/v5z10ImUnuiLQLHjiYaJUgqLwWw5c/sFatWxuzwnCHMAnGZCmL8TC9KNZ3/
	8GZWte0rUtRhfCyCQ7TOpTRQi11MOkT7rZTZN77Cxcfx1g2HQWN1xhLEAWXsWxO/De+qJGQ/wYh
	+R5Bmgh1ZkedEmk1QdsZgl2qnUhhRhidxZGIgGIUg+Clw+LfiZB1k3j0LST7OVi4bo+atIdy4dA
	7pYqo/VTF2WPVm2u2ahlrMlJoYIox8h7RNkvID5gnMFkytbTuLOLy798AXkq4J+e5FTzbirI8F4
	DaXrJyu6rtVNA4rVxjgX7jsH08WX7tYE2aCn7gedoCnvBZdZp14XBnk53jESnm7a5tJm7WrQWYT
	aV/9TeyZ43AGLZYeY8hkxGOkWy6tqoBFGJod7NLLtPJcp0HERlah7rH3l/m6XBBbzRehtGZLtmA
	oZU13LzPQt
X-Received: by 2002:a05:690e:b4d:b0:649:3f08:edc with SMTP id 956f58d0204a3-6493f080f88mr4683116d50.41.1769033526167;
        Wed, 21 Jan 2026 14:12:06 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:d::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649170acbdbsm8409641d50.13.2026.01.21.14.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:05 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:48 -0800
Subject: [PATCH net-next v16 08/12] selftests/vsock: use ss to wait for
 listeners instead of /proc/net
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-8-2859a7512097@meta.com>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
In-Reply-To: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, berrange@redhat.com, 
 Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Replace /proc/net parsing with ss(8) for detecting listening sockets in
wait_for_listener() functions and add support for TCP, VSOCK, and Unix
socket protocols.

The previous implementation parsed /proc/net/tcp using awk to detect
listening sockets, but this approach could not support vsock because
vsock does not export socket information to /proc/net/.

Instead, use ss so that we can detect listeners on tcp, vsock, and unix.

The protocol parameter is now required for all wait_for_listener family
functions (wait_for_listener, vm_wait_for_listener,
host_wait_for_listener) to explicitly specify which socket type to wait
for.

ss is added to the dependency check in check_deps().

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 47 +++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 4b5929ffc9eb..0e681d4c3a15 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -182,7 +182,7 @@ check_args() {
 }
 
 check_deps() {
-	for dep in vng ${QEMU} busybox pkill ssh; do
+	for dep in vng ${QEMU} busybox pkill ssh ss; do
 		if [[ ! -x $(command -v "${dep}") ]]; then
 			echo -e "skip:    dependency ${dep} not found!\n"
 			exit "${KSFT_SKIP}"
@@ -337,21 +337,32 @@ wait_for_listener()
 	local port=$1
 	local interval=$2
 	local max_intervals=$3
-	local protocol=tcp
-	local pattern
+	local protocol=$4
 	local i
 
-	pattern=":$(printf "%04X" "${port}") "
-
-	# for tcp protocol additionally check the socket state
-	[ "${protocol}" = "tcp" ] && pattern="${pattern}0A"
-
 	for i in $(seq "${max_intervals}"); do
-		if awk -v pattern="${pattern}" \
-			'BEGIN {rc=1} $2" "$4 ~ pattern {rc=0} END {exit rc}' \
-			/proc/net/"${protocol}"*; then
+		case "${protocol}" in
+		tcp)
+			if ss --listening --tcp --numeric | grep -q ":${port} "; then
+				break
+			fi
+			;;
+		vsock)
+			if ss --listening --vsock --numeric | grep -q ":${port} "; then
+				break
+			fi
+			;;
+		unix)
+			# For unix sockets, port is actually the socket path
+			if ss --listening --unix | grep -q "${port}"; then
+				break
+			fi
+			;;
+		*)
+			echo "Unknown protocol: ${protocol}" >&2
 			break
-		fi
+			;;
+		esac
 		sleep "${interval}"
 	done
 }
@@ -359,23 +370,25 @@ wait_for_listener()
 vm_wait_for_listener() {
 	local ns=$1
 	local port=$2
+	local protocol=$3
 
 	vm_ssh "${ns}" <<EOF
 $(declare -f wait_for_listener)
-wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX}
+wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX} ${protocol}
 EOF
 }
 
 host_wait_for_listener() {
 	local ns=$1
 	local port=$2
+	local protocol=$3
 
 	if [[ "${ns}" == "init_ns" ]]; then
-		wait_for_listener "${port}" "${WAIT_PERIOD}" "${WAIT_PERIOD_MAX}"
+		wait_for_listener "${port}" "${WAIT_PERIOD}" "${WAIT_PERIOD_MAX}" "${protocol}"
 	else
 		ip netns exec "${ns}" bash <<-EOF
 			$(declare -f wait_for_listener)
-			wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX}
+			wait_for_listener ${port} ${WAIT_PERIOD} ${WAIT_PERIOD_MAX} ${protocol}
 		EOF
 	fi
 }
@@ -422,7 +435,7 @@ vm_vsock_test() {
 			return $rc
 		fi
 
-		vm_wait_for_listener "${ns}" "${port}"
+		vm_wait_for_listener "${ns}" "${port}" "tcp"
 		rc=$?
 	fi
 	set +o pipefail
@@ -463,7 +476,7 @@ host_vsock_test() {
 			return $rc
 		fi
 
-		host_wait_for_listener "${ns}" "${port}"
+		host_wait_for_listener "${ns}" "${port}" "tcp"
 		rc=$?
 	fi
 	set +o pipefail

-- 
2.47.3

