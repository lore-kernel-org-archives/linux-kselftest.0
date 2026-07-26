Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456E2749ED
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785089221; cv=none; b=oN+Twd6CGjat+lswN2TDKJyuT9T1kCDq1S+/0MurEIMTvlAq1IU+zqLdEuJiJJFvKJLdSwMY5pJlcvEMCFveoRGT5W8XumhSBtSJPE75Q5OR6dYjK+td1xTAs1+f1v10UDSvHiy2BiXj9jJjh2yeCAl8B+yb/2Q7a0CAvTB6gBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785089221; c=relaxed/simple;
	bh=VP67dr9w9wDR5WyFl8WuFjGgx8gkJgc1is146QNn/Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NtAFM368w9YL4lmMPE3KnpXhNBxPdRVqroZ56hAbu9OP+F+5+rwdMNWGfdmP1Zifv4r4a0cCLqS690epmgbzQP/ZF+c8RoJnYiEBaqrmNnOVnEoQqp3L1maAuIx6VA9zeD0zD+xzIhpORV2GYB37Egm1jktVW2dYfwRYg8g8ElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoEX7OHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZi6FHt7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoEX7OHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZi6FHt7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6sQ5720928
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 18:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zV9yk3n4HM3INqeeRePJvl
	1qdihZTblDN9JRjrVWAS4=; b=AoEX7OHGpdPSRgD6ppot9hC7v61IbO6vbCsCnP
	SMkiQnrCPvUjOH/eloN7MdhsKo7E7BerzHn9LLugJwJvqASKQYkxGYcSPSqXkP/R
	zuxpZxgmIO5rirBljAeGYqjj/nccphH3RLFVKHZR43c+7cwND4QoRHQG+LNeS46m
	JSZzpJ8eT/jBMPZ5hcgrjEzLFiOuwpR3z6fmpyTBmdrcp7HD2tXbFVYVrjhCRNBG
	+IREc0uN5y3xDBvjODGHu+oLq82n+QTG+wCA4t2yQ8MLeYfpFo9zEz3Z5maCjELF
	fm6Hr1USlASZGhAjICEVzvz0VIlwSRXoHD7y0pEpZv/clyzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk8th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 18:06:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso1263401a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 11:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785089217; x=1785694017; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zV9yk3n4HM3INqeeRePJvl1qdihZTblDN9JRjrVWAS4=;
        b=FZi6FHt74p7xeXrmGirZVMN55jj+6XtH8nWwjCqFAqtQ7TALvQSJ/1FtaUQn9S9PRa
         JpVtzu6DGKz8yAsSg2GFNpHZ2hJGeQwUqz1ha1H7E52wgvb93hq4U1UOsHGA/f/M+95q
         7KmzGYB7jOP9cstLysnzX+rlt2t+SrGTSnkzV5ZwaVYvz5AkD7oxsM86muuJ7Wrv6low
         13QyzEtQg5VYVlVtQQIGVAROtKHAWBLw4tbIJBCqTZsMPI4FgtmjcXvb66yVBjk0Ejcn
         JrhDyXc3dZewbcC/fChEC7VOYHeAUKbYvBNb5Z/kDTvDcZyy/fVYI/UY92YwJPW2lG0b
         pk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785089217; x=1785694017;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zV9yk3n4HM3INqeeRePJvl1qdihZTblDN9JRjrVWAS4=;
        b=K50M9A1eu8hEpxmeyPqOlfztyIb9nKYSa0+s3G2E+q/9F+wRmbIcZN8NYnHvU9eLh8
         OBOeOZ2NqXwIZZKipGHDKNT/SKQEP0K5XX6fQxXh0H/iWEfN0MnzQ6AZOHo9TkGtK4/H
         A60HOPBfO/DCQTUMmc9xnLPU3Un5l56Xe93KbPLQPdBxCPh0EHd4DOIUIc6w+idKBn5m
         UlFwYpYKaaavqK8BfVeFcIje0iYeqjcV8T7kV7vXulWhrEbTs6o3IdIWGpzBxGvSxp0J
         L5vJ/KjOQ03Soy1rJUo+a0pOqW4vFLxRgYQXxuyCIGTSi3b6JbbqV6hJ6rPwtmHXnomx
         QV4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rry1dDdGQuMO+PcSND2ZfdZR9VrlAajWzq4xRXWMcyX0uUYL6Q9Nbu1tFE7Ot5Zc8EjciaY/Mc86dw3CwyRj18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLNIBvWwkswb702HdwK3+fxkadyKfsBn95iXKB/szZbmD4vvK
	SYM3QpynJ5Pg1mb3lR8EwP3K5W/5WidCCwQxdqbFCq61PMH78hGOuP3aW2CwQjIVYcHnzyFhb0Y
	H81xbfnUxZBokWWMH9U+OwSvbywHY4ec3eYhbZjWL9VZVzA4ooyxmPft6CX2TjQwqsW8wFlNMSE
	4hhRQ=
X-Gm-Gg: AR+sD11F87W7PDwcP7VlpngOV9RbPZ16o4IdMqYc9LLHVokrj47Yb55SooWr3RcOnj+
	CJaSMlYeXxaNieekVcdf7/4Cy1NfwtWrCgVTjBlUSKDahzdT2fcyU9oJL0WX8S9goosCPQPq+s6
	jFBtO5e0cXVGZrToAteM41UixOJEZvK/uX1F68ck1O3ALMQvy9CEWq6DdfIdljC5QJJhqINOWJI
	nD88H32jUw40MLbNEuWOGWiz5YWO1/ze0RS3OToYP9ZEotSqPfZQe91V8ZNAHVpZBAqgZ40mjYJ
	a5Hm13JcXSXTpyEWQ+q9bxU8WhvUAekdRA6hDkOUU/p69lyG2cHyPY2hQtsRM2tNkDwwzOW8Ph0
	EvxYiDr85eWJp8JN0Ysc8Nji5wrs1JjM=
X-Received: by 2002:a05:6a20:b7a7:b0:3c6:61b9:917d with SMTP id adf61e73a8af0-3c67df11232mr5273642637.49.1785089217111;
        Sun, 26 Jul 2026 11:06:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3c6:61b9:917d with SMTP id adf61e73a8af0-3c67df11232mr5273624637.49.1785089216658;
        Sun, 26 Jul 2026 11:06:56 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm23183297eec.7.2026.07.26.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:06:56 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
Date: Sun, 26 Jul 2026 23:36:40 +0530
Subject: [PATCH RESEND v3] selftest: remoteproc: Add test for start/stop
 sequence
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-remoteproc_selftest-v3-1-3c8c160afbbc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK9MZmoC/31OPQ+CMBD9K6azJfQKAk4OujroaIyBesgZodoW1
 BD+uwUTR3O55L3L+7ieWTSEli1nPTPYkSXdeCLnM6aqvLkgp7PnDEJYhAlEvIi4wVo7vButThZ
 vpUPreHKWeRGLOJUlMG++GyzpNQUf2G6z32zX7Pi927a4onJj6qisyDpt3tMHnZj0viwS48ahn
 yBL0yjJuOCPltTpmVuqm9WIqVGB0vUU3MHPGmaQCAFCQiA9hCz95x2G4QM5089jBgEAAA==
X-Change-ID: 20260724-b4-remoteproc_selftest-7d3ab51583f2
To: Shuah Khan <shuah@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Wasim Nazir <quic_wasimn@quicinc.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785089213; l=8254;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=trSdLWb2y/gjwhbJto6bQhAwYCE/7nL3fYz2OgjVCGk=;
 b=ehWruX+p1u9M1feMI1kQQOJrnDzgISximH2XLl/f/6TOTVXeoOcMKZO+P0jxKirUfwd8LsL8M
 SOdF/p2OBjEAN4pnMR4xUg3lsPI63kj35VfDGaGMQXv5DEBgaTHhBEw
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: cW34n--XkPdljWzOW-h9aYNFFM1yGjrF
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a664cc1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Y6iQgpuz3mea8FKb5PoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cW34n--XkPdljWzOW-h9aYNFFM1yGjrF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE4NCBTYWx0ZWRfX5tSOeOf6dj/C
 5sZqUd9II4dpRi80IlOhOecEHn56pGF4ePqtdPeAwg1vehrxdYE7WPvpwMRccZyi05j4Bcy37Dy
 RGalTo6sbZ1dX8f1A/gZSqi0FQFGFLwZvfW8P8SQIWO8EPF6QeavUlq9DspGlKWA6JtL/MRb62S
 5S75DID2ibRGJAD2cy6cyxF8ALDOD+77QLAH+cvUB20q5WsKNUOe0JnOUFDSULRF7Vf0HqKeid4
 LDDK6CEClAFBsVs/NuPyv6eRYfja0QD5c7SbmYSzKwPtk77ikPPCVVw8YRUDUYBg095xJeLTp0Z
 IfWjYgnUpEBu1TG072QLtkAPN4C2e9laNZxoh3d6DMIedyv+eBPuX9/H5oCoHCFxese+phBVtc0
 mW5kvN6XzgLvqzsoepsGfEu2tsdrsnnkrAGIXmr8dc9SB/45OLotddYrG50A6T8Tdg+GfTqkO2G
 oFdSyTih1MNlIzJRW+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE4NCBTYWx0ZWRfX38x3GdGTXdr3
 l9113+vZfGFmqNf7wx7vO4T9fNtJ+/IW2VmK1/w3hpRUH99+VXtgzmLhYajzYqmoemWa9mksvFW
 v36zp9puGzN0khRbsmqn4FjBU9iRk4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260184

From: Wasim Nazir <quic_wasimn@quicinc.com>

Add test to validate end-to-end start/stop sequence for
each remoteproc instances available on target.

Add first test sequence to validated each instance sequencially
to identify any issue while booting each instance.
Add second test sequence to validate all instances concurrently
to identify any race scenario within instances doing bootup.

Additional user argument (--seqdelay) is available to add
delay is seconds, between start/stop sequence. This is added
as different target might have different threshold to start
any instance (default is 5 secs).

Running tests:
	./remoteproc_test.sh --seqdelay 10

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
This test validates the core start/stop lifecycle of remoteproc instances
via the sysfs interface (/sys/class/remoteproc/remoteprocN/state).

Two test scenarios are exercised:

1. Sequential: each remoteproc instance is started and stopped one at a
   time to isolate per-instance boot failures.

2. Concurrent: all instances are started together then stopped together,
   to expose race conditions between instances during simultaneous bootup.

The test is target-agnostic and works wherever CONFIG_REMOTEPROC is
enabled and remoteproc instances are present. It skips automatically
when neither condition is met. A --seqdelay argument allows callers to
tune the wait between start/stop operations for targets with slower boot
times (default: 5s).

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Changes in v3:
- Drop SSR/recovery handling; not needed for the start/stop path
- Remove Qualcomm-specific "ss"/"SSR" terminology; use "instance"
- Add --seqdelay argument for configurable start/stop delay
- Expand commit message to describe test rationale
- Link to v2: https://patch.msgid.link/20240927112132.3927298-1-quic_wasimn@quicinc.com

Changes in v2:
- Update commit message to better describe the test purpose
- Rework start/stop flow: stop all instances first for a clean
  baseline, then test sequential and concurrent start/stop
- Link to v1: https://patch.msgid.link/20241024150505.988479-1-quic_wasimn@quicinc.com
---
 MAINTAINERS                                        |   1 +
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/remoteproc/Makefile        |   4 +
 tools/testing/selftests/remoteproc/config          |   1 +
 .../selftests/remoteproc/remoteproc_test.sh        | 157 +++++++++++++++++++++
 5 files changed, 164 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a112ce9f0fa0..88103c326008 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22949,6 +22949,7 @@ F:	Documentation/staging/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
+F:	tools/testing/selftests/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Bjorn Andersson <andersson@kernel.org>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 74183c27f6e3..f69eb544a72e 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -103,6 +103,7 @@ TARGETS += pstore
 TARGETS += ptrace
 TARGETS += openat2
 TARGETS += rdma
+TARGETS += remoteproc
 TARGETS += resctrl
 TARGETS += riscv
 TARGETS += rlimits
diff --git a/tools/testing/selftests/remoteproc/Makefile b/tools/testing/selftests/remoteproc/Makefile
new file mode 100644
index 000000000000..a84b3934fd36
--- /dev/null
+++ b/tools/testing/selftests/remoteproc/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+TEST_PROGS := remoteproc_test.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/remoteproc/config b/tools/testing/selftests/remoteproc/config
new file mode 100644
index 000000000000..a5c237d2f3b4
--- /dev/null
+++ b/tools/testing/selftests/remoteproc/config
@@ -0,0 +1 @@
+CONFIG_REMOTEPROC=y
diff --git a/tools/testing/selftests/remoteproc/remoteproc_test.sh b/tools/testing/selftests/remoteproc/remoteproc_test.sh
new file mode 100644
index 000000000000..d58c1e10005c
--- /dev/null
+++ b/tools/testing/selftests/remoteproc/remoteproc_test.sh
@@ -0,0 +1,157 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+#
+
+DIR="$(dirname $(readlink -f "$0"))"
+
+KTAP_HELPERS="${DIR}/../kselftest/ktap_helpers.sh"
+if [ -e "$KTAP_HELPERS" ]; then
+    . "$KTAP_HELPERS"
+else
+    echo -n "1..0 # SKIP $KTAP_HELPERS file not found"
+    exit 4
+fi
+
+RPROC_SYS=/sys/class/remoteproc
+RPROC_SEQ_SLEEP=5
+
+rproc_instances=
+num_tests=0
+test_err=0
+
+check_error() {
+	if [ $? -ne 0 ]; then
+		test_err=$((test_err+1))
+		ktap_print_msg "$@"
+	fi
+}
+
+parse_args() {
+	script=${0##*/}
+
+	if [ $# -eq 2 ] && [ "$1" = "--seqdelay" ]; then
+		shift || true
+		RPROC_SEQ_SLEEP=$1
+	else
+		ktap_print_msg "Usage: ${script} --seqdelay <time in secs>"
+		ktap_print_msg "Proceed with default sequence delay = $RPROC_SEQ_SLEEP"
+	fi
+}
+
+rproc_stop_instances() {
+	for instance in ${rproc_instances}; do
+		rproc=${RPROC_SYS}/$instance
+		rproc_name=$(cat $rproc/name)
+		rproc_state=$(cat $rproc/state)
+
+		echo stop > "$rproc/state"
+		check_error "$rproc_name state-stop failed at state $rproc_state"
+	done
+	sleep ${RPROC_SEQ_SLEEP}
+}
+
+rproc_start_instances() {
+	for instance in ${rproc_instances}; do
+		rproc=${RPROC_SYS}/$instance
+		rproc_name=$(cat $rproc/name)
+		rproc_state=$(cat $rproc/state)
+
+		echo start > "$rproc/state"
+		check_error "$rproc_name state-start failed at state $rproc_state"
+	done
+	sleep ${RPROC_SEQ_SLEEP}
+}
+
+rproc_seq_test_instance_one() {
+	instance=$1
+	rproc=${RPROC_SYS}/$instance
+	rproc_name=$(cat $rproc/name)
+	rproc_state=$(cat $rproc/state)
+	ktap_print_msg "Testing rproc sequence for $rproc_name"
+
+	# Reset test_err value
+	test_err=0
+
+	# Begin start/stop sequence
+	echo start > "$rproc/state"
+	check_error "$rproc_name state-start failed at state $rproc_state"
+
+	sleep ${RPROC_SEQ_SLEEP}
+
+	echo stop > "$rproc/state"
+	check_error "$rproc_name state-stop failed at state $rproc_state"
+
+	if [ $test_err -ne 0 ]; then
+		ktap_test_fail "$rproc_name"
+	else
+		ktap_test_pass "$rproc_name"
+	fi
+}
+
+rproc_seq_test_instances_concurrently() {
+	# Reset test_err value
+	test_err=0
+
+	rproc_start_instances
+
+	rproc_stop_instances
+
+	if [ $test_err -ne 0 ]; then
+		ktap_test_fail "for any of $rproc_instances"
+	else
+		ktap_test_pass "for all $rproc_instances"
+	fi
+}
+
+#################################
+### Test starts here
+#################################
+
+ktap_print_header
+
+# Parse user arguments
+parse_args $@
+
+# Check for required sysfs entries
+if [ ! -d "${RPROC_SYS}" ]; then
+	ktap_skip_all "${RPROC_SYS} doesn't exist."
+	exit "${KSFT_SKIP}"
+fi
+
+rproc_instances=$(find ${RPROC_SYS}/remoteproc* -maxdepth 1 -exec basename {} \;)
+num_tests=$(echo ${rproc_instances} | wc -w)
+if [ "${num_tests}" -eq 0 ]; then
+	ktap_skip_all "${RPROC_SYS}/remoteproc* doesn't exist."
+	exit "${KSFT_SKIP}"
+fi
+
+# Total tests will be:
+# 1) Seq tests for each instance sequencially
+# 2) Seq tests for all instances concurrently
+num_tests=$((num_tests+1))
+
+ktap_set_plan "${num_tests}"
+
+### Stop all instances
+#
+# Intention is to stop all running instances. If any instances are not yet
+# started it will be don't care case as test_err is not checked.
+# NOTE: Assuming no instances are in crashed state
+rproc_stop_instances
+
+### Test 1
+ktap_print_msg "Testing rproc start/stop sequence for each instance sequencially"
+for instance in ${rproc_instances}; do
+	rproc_seq_test_instance_one $instance
+done
+
+### Test 2
+ktap_print_msg "Testing rproc start/stop sequence for all instances concurrently"
+rproc_seq_test_instances_concurrently
+
+### Restore all instances
+rproc_start_instances
+
+ktap_finished

---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260724-b4-remoteproc_selftest-7d3ab51583f2

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

