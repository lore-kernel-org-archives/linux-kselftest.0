Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A64418D0
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033541; cv=none; b=JW2kYtQRlygb0Mj/19YbQMiOr5qS+cT53h58Ck375inKQa8OrQzIDjZvHYo41NmRYipFuONFygCUbIWFBZ1dVZgM8bBdRHbtzAz3gxmneJVcOI1jr2nZtsVem1kChtL/1NHvsgoAqti0iTRJ9bRZhcvT7Zi0ftKpLwHozyjOVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033541; c=relaxed/simple;
	bh=43YZlXDQmW65hszyjr5m3UtpfpB8+72+oSXEtxR8B+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJGUVyUDfAu53mgkbHisZhDC2IfqbDgDEV0u3ed5/Lr/WNsA+LwLB542pUAYMQq2vUMhXZfidSP3PKfh50A1pjqGgw4eDN0Yo0gaOAX8wkSp3KQZPHUXlFwKXF+gUK66Ucfgo3+Pl1w6/xPs4wgVNHC3ZAOBhRlYf3YAl716obU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc9Oa/dK; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc9Oa/dK"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc4425b6bso3081897b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033528; x=1769638328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3I8QcIsIeOrh9cIrz38ZjjL+G5z3ujRC9KA0ugGud8=;
        b=Dc9Oa/dK474AK/J1sokviXcv8eJSFE4pPf5/G+DevjWBG93ky/wb3ViOV1OQ14dV4J
         ieioWkyh7NgUeINzpDNPMoGlTdpDGXJMTpzvC3Wzr+IK37FiULLAxXhAmq5wfOqMB7Ri
         o4ibr4Kgbip0rGfdEjuypC9e7cv6838XEFn9Z21KFaZJXj8krfF8vufTthSdUgh/UsMz
         rsZu1TOirsQqhe8EJGOOkaCXM9ApDKAa10F9eM2Rb17Zp25He0YuwWUI+Onkb+6ineji
         0IvH4vkvO4HBFjWamSEmZIi/YI7QFSMQ9CifTEBGpjOZK1Hlv/NdzdPoSsxwYmnTexKS
         u8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033528; x=1769638328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y3I8QcIsIeOrh9cIrz38ZjjL+G5z3ujRC9KA0ugGud8=;
        b=Sy6wvk11ZWO1qs4tJFYuOW4KNON4VjUE+FiUX5TPvb+e4iaK1F5GGkiQ9mUNzV/lDL
         9Yf0IlA5s2I6rSs6LPWvupMEtIQ1yK4/zqtwhADfiImM24QAhk8joJRdW5uenV6m+HSg
         ZiOzU1agOwug12pYoUSFjf9OBaftS5ASzaWPYv7GHLWMsBCC938Q2CMGrwxc5Kv4IvfQ
         Fm9LmFD/HGqC6EtIdqNY/QD0L1NsSVezOPVmSS+PojUwn1t1TeFIrOO824im87ElADFG
         Xsns6F6BkFdQLF5IJaxvxsM2FbgZOHVu50VBJHaM8s6VC/BGlnS6DwaM2uabrnDD0Vw3
         ULAg==
X-Forwarded-Encrypted: i=1; AJvYcCX1G4uh4BUO+1JOAqocgl5WHHtezqBKrGM5ztMunu7tGxwjHIx8eqM2ERna3oD9BXA5yL+slUlv5J8OXop6AyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcB0c3xpWgIrYkE8mNkbuDUSJT6cCb+v2nzfjhl0LG6YQILc6p
	caUhNMYgz+qmSatq00M+tdIbfCdwAff0HizvZtdmAyFNJTL7Du6yz6fq
X-Gm-Gg: AZuq6aL582DNJhOwo6j6sYJe03hZUvFpYbR52CfbXflGvjTSkWWO7AocckXvjhOKq9E
	ToKvAxJMD1ZqLxetMGY2vxcWwvu64ehPz7A3bHWMJVTP59AkrV4q5/luV0rtl4rXMdqriu7hd6z
	AU6+CxXHjOLsImxIJ+IjSpv946RdBjsVXU0J9YrqROSUQBi3MemFrXauGVq/n7Ok3wYhzkWSmhx
	vQyQMG/LsUpenMbRHy+nQ9vte+spIuRIMlyUrU0ddMioajZ6DP1nblFG3e9em2QovpBtOqU56GT
	HKLDtRBgwNhj6Jd9HkW3+9R0Z4xYVWkClbFzi1eWuMoyC+jgtltf8U3E++n9UbvXxW1DGx82wQF
	LyaHs4ieI3+Q0Ow/Fbd6hyN8ssJjcukbz61SOtaPyctEG1WsS0RFAwP53p4t1YUcAz41h/E1Q/y
	hVGcsmsbiALw==
X-Received: by 2002:a05:690e:134c:b0:649:328b:66c1 with SMTP id 956f58d0204a3-6493c85636fmr4655728d50.71.1769033527964;
        Wed, 21 Jan 2026 14:12:07 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:42::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6494686dd20sm1661755d50.22.2026.01.21.14.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:07 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:50 -0800
Subject: [PATCH net-next v16 10/12] selftests/vsock: add namespace tests
 for CID collisions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-10-2859a7512097@meta.com>
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

Add tests to verify CID collision rules across different vsock namespace
modes.

1. Two VMs with the same CID cannot start in different global namespaces
   (ns_global_same_cid_fails)
2. Two VMs with the same CID can start in different local namespaces
   (ns_local_same_cid_ok)
3. VMs with the same CID can coexist when one is in a global namespace
   and another is in a local namespace (ns_global_local_same_cid_ok and
   ns_local_global_same_cid_ok)

The tests ns_global_local_same_cid_ok and ns_local_global_same_cid_ok
make sure that ordering does not matter.

The tests use a shared helper function namespaces_can_boot_same_cid()
that attempts to start two VMs with identical CIDs in the specified
namespaces and verifies whether VM initialization failed or succeeded.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v11:
- check vm_start() rc in namespaces_can_boot_same_cid() (Stefano)
- fix ns_local_same_cid_ok() to use local0 and local1 instead of reusing
  local0 twice. This check should pass, ensuring local namespaces do not
  collide (Stefano)
---
 tools/testing/selftests/vsock/vmtest.sh | 78 +++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 38785a102236..1bf537410ea6 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -50,6 +50,10 @@ readonly TEST_NAMES=(
 	vm_loopback
 	ns_host_vsock_ns_mode_ok
 	ns_host_vsock_child_ns_mode_ok
+	ns_global_same_cid_fails
+	ns_local_same_cid_ok
+	ns_global_local_same_cid_ok
+	ns_local_global_same_cid_ok
 )
 readonly TEST_DESCS=(
 	# vm_server_host_client
@@ -66,6 +70,18 @@ readonly TEST_DESCS=(
 
 	# ns_host_vsock_child_ns_mode_ok
 	"Check /proc/sys/net/vsock/ns_mode is read-only and child_ns_mode is writable."
+
+	# ns_global_same_cid_fails
+	"Check QEMU fails to start two VMs with same CID in two different global namespaces."
+
+	# ns_local_same_cid_ok
+	"Check QEMU successfully starts two VMs with same CID in two different local namespaces."
+
+	# ns_global_local_same_cid_ok
+	"Check QEMU successfully starts one VM in a global ns and then another VM in a local ns with the same CID."
+
+	# ns_local_global_same_cid_ok
+	"Check QEMU successfully starts one VM in a local ns and then another VM in a global ns with the same CID."
 )
 
 readonly USE_SHARED_VM=(
@@ -577,6 +593,68 @@ test_ns_host_vsock_ns_mode_ok() {
 	return "${KSFT_PASS}"
 }
 
+namespaces_can_boot_same_cid() {
+	local ns0=$1
+	local ns1=$2
+	local pidfile1 pidfile2
+	local rc
+
+	pidfile1="$(create_pidfile)"
+
+	# The first VM should be able to start. If it can't then we have
+	# problems and need to return non-zero.
+	if ! vm_start "${pidfile1}" "${ns0}"; then
+		return 1
+	fi
+
+	pidfile2="$(create_pidfile)"
+	vm_start "${pidfile2}" "${ns1}"
+	rc=$?
+	terminate_pidfiles "${pidfile1}" "${pidfile2}"
+
+	return "${rc}"
+}
+
+test_ns_global_same_cid_fails() {
+	init_namespaces
+
+	if namespaces_can_boot_same_cid "global0" "global1"; then
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_local_global_same_cid_ok() {
+	init_namespaces
+
+	if namespaces_can_boot_same_cid "local0" "global0"; then
+		return "${KSFT_PASS}"
+	fi
+
+	return "${KSFT_FAIL}"
+}
+
+test_ns_global_local_same_cid_ok() {
+	init_namespaces
+
+	if namespaces_can_boot_same_cid "global0" "local0"; then
+		return "${KSFT_PASS}"
+	fi
+
+	return "${KSFT_FAIL}"
+}
+
+test_ns_local_same_cid_ok() {
+	init_namespaces
+
+	if namespaces_can_boot_same_cid "local0" "local1"; then
+		return "${KSFT_PASS}"
+	fi
+
+	return "${KSFT_FAIL}"
+}
+
 test_ns_host_vsock_child_ns_mode_ok() {
 	local orig_mode
 	local rc

-- 
2.47.3

