Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54849453A55
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390103; cv=none; b=Gvikcga5rCtZTcf4D9cA9iHl6xlYoTxYYhmHBjdHXiuIs1OMwwB3FO7yNN+emNzTLZWTBTqLSuF5g47EDgSsa1MbYCpImWfmXch/vQVSQo03nq/oiA8HivyAJsD6vpkCyLcS6iKsl0uzHDtHoevpHqL/uPtajJ0T3yU0V51KSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390103; c=relaxed/simple;
	bh=kcIMEAxlbhdfWGQi3kEqTjk3KEi3PkKRsRCd1DxpZ8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S729ro4A/wiJk10bkpFYIeX7lOn2fGJMkX7PSC9PaSlDqLgiPZjkUF14H+bkua5PcFgPSk+qOkTrdjMdEMyGBEaYaXVt6QK8Aq2MJQhOl2THKp5tW6sqVLpXHNLyy0RLNqWTT8G542vOJo4Ei9ccWsT2p2JDoQzWQi1/cuIXPtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtEMLlZq; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtEMLlZq"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so759163b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390091; x=1788994891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bD7DqrZxcDKFi14tO3Iywp9XBJtjTzYJFW9TgEI/w0=;
        b=jtEMLlZqbh5XoxZ+hKv7J7qrNerk3mPJJlwU0e3x9mRqLH8KV0Zl0oTzAcSGcH6BXy
         XARuMM9w8trkSpV0z0WKyOHwnWbSu8Li9tLpUo82HMxwARMHtLFYCAu3dAZf2Ve+uf3Z
         46cR78RWPllWXa3TYSJY2SFo9eO+IJ09FBGzSYCYjf4nJ/aWPSD8OCnwxV4vUHLStcrl
         l5l4xIWNdwqPtK13gAKo11uqCj324hT3oX0hF/C4wvgVDquZ5U+OuLEsq6CozKso3Y5D
         FIpAGpf9xhDkwPH60evF7VIrbLaR0HDxJAbhup3iYaS2kFdR+uxjvaVXr/0asVKL/ifm
         J3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390091; x=1788994891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bD7DqrZxcDKFi14tO3Iywp9XBJtjTzYJFW9TgEI/w0=;
        b=JhrnDd2XLnNeWSuyQu9HY4y0AemILVWDfi04Y9F+30TqXWsg8O2R2lUFdhUsvR+GV9
         Hc8/6cHuMff880QOK3qI6jC11Pe1DIQpbNfCnC/kB2xmKNhq6r6niwz1Xh0tIIjED/0E
         pVG3fq0RM4y2+RW2NMd1ooqu9sbJwgtTyaqJxRIzpg9AIOyX312t4w3+AkUcyIszeRBh
         LQjYs705o+EsHCZqtxGZseRvkXKs8EOU2lzyuD4YTL90DZJGoghkemVwsIMUXVQVh5Zc
         jE9Xy1wBJbixfZwJsgyf+bdZKYnWi1EWknXe8FKhnz/cPJXn67VxRsEduCWBDOU6wx+q
         IZrA==
X-Forwarded-Encrypted: i=1; AKwUvBzMu5Yd5DbfplT2YGB9PF6C2DNMY67zG6xH+GpCcWTPXOZ1f+moskxI08r/I+/rOp5MYdJjAFnxGZECAsH6Ywo=@vger.kernel.org
X-Gm-Message-State: AFuF++mtpoA8qJbihNLHNl1wdHzEfszRXjnkP50ggQSHSRZvsWAMTMQd
	/cwC77xwhfeDxSxPfow9LHSxIVzCdXQeMLmxmLAaZvydTlHwYF6w3nnd
X-Gm-Gg: AYBFou0hSfIBgGvMpc6VG+YNBXKkcucQoXqzflQdORWt4n4rKTZFIefWrRnWoHPY+aJ
	OrGDVALGaX+HCaa1U7rl3byV7mu0g5cPlnx29LM+70w8XhGa3+XOhHg/5HExb3Nrh1vtjkBdycb
	LFTumSsJZRLYp3S3zaDMrXmpZFxWd2TwNfGvI2QKvzuDdBlmRtr6RBtCBpzDyK4RvmFa1OTI6sm
	sWgltukVbRne3hhpWP9lPedYoLTgmezqKX7q7yrOQNWaQ/2J+J9w746aqpgbfoZDVnG/WyKqy7Z
	j9UY65PuZZrdwDzLw6MNrUN/itcQjxa32hyPJmkO5L7bh1Hy+l5xwsRcG/sIJFyUivbQ7Jdrp1h
	ag4qusN6sM37imS9jZaK1NGq4Lhhbm+v3V/oNlIXATpIkTlmTdlcGHo9HnNjcH0l2LwWvz6keQy
	9Uz1MGM6GtaWsLrDq8MeseKemUaCNgvDUjHLdFIjrMB3X2IPbmDk/33zN8
X-Received: by 2002:a05:6808:c1e8:b0:493:a860:5809 with SMTP id 5614622812f47-4b6bc459a08mr7099648b6e.4.1788390090927;
        Wed, 02 Sep 2026 16:01:30 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:12::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b69b820671sm3086593b6e.15.2026.09.02.16.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:29 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 02 Sep 2026 16:00:52 -0700
Subject: [PATCH net-next 6/6] selftests/vsock: test the assign ioctl
 privilege checks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-vsock-guest-ns-v1-6-9995383e9a8b@meta.com>
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

/dev/vsock IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS has refuses callers without
CAP_NET_ADMIN in the init user namespace.

Add two tests: one confirms that CAP_NET_ADMIN is required even by a
privileged user and the other confirms that CAP_NET_ADMIN in an
unprivileged user ns alone is insufficient.

CONFIG_USER_NS is needed to test the CAP_NET_ADMIN + unprivileged user
ns case.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/config    |  1 +
 tools/testing/selftests/vsock/vmtest.sh | 59 ++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vsock/config b/tools/testing/selftests/vsock/config
index 5f0a4f17dfc9..4b31085558fa 100644
--- a/tools/testing/selftests/vsock/config
+++ b/tools/testing/selftests/vsock/config
@@ -109,3 +109,4 @@ CONFIG_FS_DAX=y
 CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_ZONE_DEVICE=y
+CONFIG_USER_NS=y
diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 53591fa07f1a..efb94d17d997 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -28,6 +28,7 @@ readonly WAIT_PERIOD=3
 readonly WAIT_PERIOD_MAX=60
 readonly WAIT_QEMU=5
 readonly PIDFILE_TEMPLATE=/tmp/vsock_vmtest_XXXX.pid
+readonly EPERM=1
 declare -A PIDFILES
 
 # virtme-ng offers a netdev for ssh when using "--ssh", but we also need a
@@ -80,6 +81,8 @@ readonly TEST_NAMES=(
 	ns_guest_assign_g2h_netns_host_connect_ok
 	ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
 	ns_guest_assign_g2h_netns_old_conn_send_fails
+	ns_guest_assign_g2h_netns_no_cap_net_admin_fails
+	ns_guest_assign_g2h_netns_unpriv_user_ns_fails
 )
 readonly TEST_DESCS=(
 	# vm_server_host_client
@@ -174,6 +177,12 @@ readonly TEST_DESCS=(
 
 	# ns_guest_assign_g2h_netns_old_conn_send_fails
 	"Check connections made before the assign stop sending once they lose the device."
+
+	# ns_guest_assign_g2h_netns_no_cap_net_admin_fails
+	"Check assigning the guest's vsock device to a namespace needs CAP_NET_ADMIN."
+
+	# ns_guest_assign_g2h_netns_unpriv_user_ns_fails
+	"Check an unprivileged user cannot claim the guest's vsock device via a user ns."
 )
 
 readonly USE_SHARED_VM=(
@@ -186,6 +195,8 @@ readonly USE_SHARED_VM=(
 	ns_guest_assign_g2h_netns_host_connect_ok
 	ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
 	ns_guest_assign_g2h_netns_old_conn_send_fails
+	ns_guest_assign_g2h_netns_no_cap_net_admin_fails
+	ns_guest_assign_g2h_netns_unpriv_user_ns_fails
 )
 readonly NS_MODES=("local" "global")
 
@@ -333,7 +344,8 @@ check_args() {
 }
 
 check_deps() {
-	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter unshare; do
+	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter unshare \
+		setpriv; do
 		if [[ ! -x $(command -v "${dep}") ]]; then
 			echo -e "skip:    dependency ${dep} not found!\n"
 			exit "${KSFT_SKIP}"
@@ -1805,6 +1817,51 @@ test_ns_guest_assign_g2h_netns_reset_on_ns_delete_ok() {
 	return "${KSFT_PASS}"
 }
 
+test_ns_guest_assign_g2h_netns_no_cap_net_admin_fails() {
+	local cmd="unshare -n setpriv --bounding-set=-net_admin"
+	local rc
+
+	vm_ssh "init_ns" -- "${cmd}" ./vsock_assign_g2h_netns &>/dev/null
+	rc=$?
+
+	if [[ "${rc}" -ne "${EPERM}" ]]; then
+		log_host "expected EPERM (${EPERM}) without CAP_NET_ADMIN, got ${rc}"
+		return "${KSFT_FAIL}"
+	fi
+
+	return "${KSFT_PASS}"
+}
+
+test_ns_guest_assign_g2h_netns_unpriv_user_ns_fails() {
+	local helper=/tmp/vsock_assign_g2h_netns
+	local unpriv_uid=65534
+	local unpriv
+	local rc
+
+	unpriv="setpriv --reuid=${unpriv_uid} --regid=${unpriv_uid}"
+	unpriv="${unpriv} --clear-groups"
+
+	if ! vm_ssh "init_ns" -- "${unpriv} unshare -U true"; then
+		log_host "unprivileged user namespaces unavailable, skipping"
+		return "${KSFT_SKIP}"
+	fi
+
+	# The home shared with the guest is root-only, so place the helper where
+	# an unprivileged user can execute it.
+	vm_ssh "init_ns" -- \
+		"cp ./vsock_assign_g2h_netns ${helper} && chmod 755 ${helper}"
+
+	vm_ssh "init_ns" -- "${unpriv} unshare -Urn ${helper}" &>/dev/null
+	rc=$?
+
+	if [[ "${rc}" -ne "${EPERM}" ]]; then
+		log_host "expected EPERM (${EPERM}) for an unprivileged user, got ${rc}"
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

