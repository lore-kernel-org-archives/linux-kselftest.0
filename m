Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23278346A00
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438274; cv=none; b=NJiR63lQicfujr96LrIiZWjFsAXMvk7LYjUdd9UvT09PEF0zNZpp9IbhmTMIU2sUgS6XisWs8i7jAVWGEZjB+BkCiQmI+jjuOHZkzBK/HwZO9auEmycInZ5izurJUH3PLRZq0bsBniPfR++h3QS1zhGLPulup5aA8xHfdM2DXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438274; c=relaxed/simple;
	bh=Cq8ZzrMm3CGi0RM5HOgynfAVi/zZ/p+NhaJGJ/csZCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujFdOLD7+LSkvoL5CrOmZwnt3PwBcE4pD1Ke0c+gJ+1xOicUN96yme+JwenRygTWYrqGHLxoeWv95bCJIyfyDh6gFvZ0tL8nQtJ8bJHMKwk6VhtVJ9ByV57OcOkuhTd2UH98h6c/bKNaZCzeqxUaF12SVCH8Fyc6aeeRkSn1SeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ3vfek1; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ3vfek1"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ae222d87dso28147d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 10:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771438272; x=1772043072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAWE751YSOrD9FsbhK2tX9K0BdH9Fj+XqGCptsOgLbc=;
        b=lQ3vfek19/TPDGVoW0qJolBoOaC9v4wx70NXe9In4xQ7zUngHnQnQRAjTcgxZX6zlI
         Pbd0JQpjx6Mr48dnUmj4I083ockdOXWHXLwgB8p6af1GXEwLvJKNry1uW3UWRLW6reBf
         WtL1/JeYQ+bd9JWTSYDf/P0SfJO4O/jDYbd2C/EWaYfBCwcPTNKkNriMJzfBnqnBVHGz
         A8kOMUvpBuY6WIu8JKX4YyrijerCvoNhqO6gWYea82udAHojLZWP6jOwP8r3Pt9lVT6W
         Su/8dJ9dYppKw2BmuEX8RUX1/wmgzWsj0dLWpuJX6WpvThyRC91JTmNF8FQJPGGfIwlW
         LRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438272; x=1772043072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAWE751YSOrD9FsbhK2tX9K0BdH9Fj+XqGCptsOgLbc=;
        b=P7m8sOi/E8QZ+MIJIynhuVQc85j2mAHB9iQxzW2OYzlOUC4TiecEJ2rTEUA5ryj7sy
         uUuK3AwTSvWHVbIdXhhvhnTfReqBg8DITE8wdUQisL/2agjMDou/iqsXC+SZCOcMFETE
         J0fMQ6fzlVhVn7oB2NcVhDfl/GT4y26OOcZT6CiRDODQo0iLoV2h5XxTjjt22ZPxoiAC
         kOYoaW5wcdnOI6hqAU+08IQ7E+7TVYcpSC3e6tAR4T1iX2SoHtkctcTk0ymrjlZYzN8Q
         RjVrZikXu2FX5jCnQgVR5PegyXG9oOf5zmMRZBupui1Y79XwtKw8w5OsPUhyEE5xCUQN
         jBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1GqiBFFIRPBt8wkaE3YHs6lRXZsVZXOqF/8HagBjGYCWiU3m+/0kzFtqY+Pmj64/PohWzF3WCxeQ4KXm7jLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyulA9E6DQgOeb/6JGQseiKgSupRCt3bxHBuue3bFYCEKoBY0Rx
	yv1yaNqxsf/Z/jBmM/uPzUhrmPlwB80mmD3OJ5Mo+ckumeiPZ6FNoxGI
X-Gm-Gg: AZuq6aKtpD9a96OP7G4fIu0vM/j5I4a0ffR+VDo1v86M5p40RJUyrcG/wr6aXge5Yz7
	zJJozYJIj6u81zIXwlIZi9JkL4z3Pyq2aZ2rbyO4o41JQe9vkbxjnD6yO47Jb+3laprhpn00k3W
	iVuP5FLmu4ClXewod9liCagoss3fShw+Bm70BqANZD4qNQpYLTia8gbMAbG12CgUOX33FifEh+J
	w9Y2WR/6/6i5RaDMye+NELWZKn48DvVe2HQyZwCzxK91G+84x+zGFFLBDXfiN96Kg9U5dxOuVjk
	PVismG1wSfzbrhs+m1k+ifbkkSwn06VmdKbnEnUG+4ba9gOIcgBq70xBifBTpMj5a6MPoFjWa2i
	mwVg2MINS7ccskbJTb2F3t1w4QUUee2kKTTvSypcPhnyXa8guyVxFuxhoWUHIkqPr+NvcWk+RlW
	hpuQf04J8qVpWa/XAxJMGfIQ==
X-Received: by 2002:a05:690e:1384:b0:64a:e063:d3ad with SMTP id 956f58d0204a3-64c556dfed0mr2342999d50.94.1771438271947;
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fc4bb9sm6143499d50.20.2026.02.18.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 18 Feb 2026 10:10:36 -0800
Subject: [PATCH net v2 1/3] selftests/vsock: change tests to respect
 write-once child ns mode
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-vsock-ns-write-once-v2-1-19e4c50d509a@meta.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
In-Reply-To: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The child_ns_mode sysctl parameter becomes write-once in a future patch
in this series, which breaks existing tests. This patch updates the
tests to respect this new policy. No additional tests are added.

Add "global-parent" and "local-parent" namespaces as intermediaries to
spawn namespaces in the given modes. This avoids the need to change
"child_ns_mode" in the init_ns. nsenter must be used because ip netns
unshares the mount namespace so nested "ip netns add" breaks exec calls
from the init ns. Adds nsenter to the deps check.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 35 +++++++++++++++------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index dc8dbe74a6d0..e1e78b295e41 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -210,16 +210,17 @@ check_result() {
 }
 
 add_namespaces() {
-	local orig_mode
-	orig_mode=$(cat /proc/sys/net/vsock/child_ns_mode)
+	ip netns add "global-parent" 2>/dev/null
+	echo "global" | ip netns exec "global-parent" \
+		tee /proc/sys/net/vsock/child_ns_mode &>/dev/null
+	ip netns add "local-parent" 2>/dev/null
+	echo "local" | ip netns exec "local-parent" \
+		tee /proc/sys/net/vsock/child_ns_mode &>/dev/null
 
-	for mode in "${NS_MODES[@]}"; do
-		echo "${mode}" > /proc/sys/net/vsock/child_ns_mode
-		ip netns add "${mode}0" 2>/dev/null
-		ip netns add "${mode}1" 2>/dev/null
-	done
-
-	echo "${orig_mode}" > /proc/sys/net/vsock/child_ns_mode
+	nsenter --net=/var/run/netns/global-parent ip netns add "global0" 2>/dev/null
+	nsenter --net=/var/run/netns/global-parent ip netns add "global1" 2>/dev/null
+	nsenter --net=/var/run/netns/local-parent ip netns add "local0" 2>/dev/null
+	nsenter --net=/var/run/netns/local-parent ip netns add "local1" 2>/dev/null
 }
 
 init_namespaces() {
@@ -237,6 +238,8 @@ del_namespaces() {
 		log_host "removed ns ${mode}0"
 		log_host "removed ns ${mode}1"
 	done
+	ip netns del "global-parent" &>/dev/null
+	ip netns del "local-parent" &>/dev/null
 }
 
 vm_ssh() {
@@ -287,7 +290,7 @@ check_args() {
 }
 
 check_deps() {
-	for dep in vng ${QEMU} busybox pkill ssh ss socat; do
+	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter; do
 		if [[ ! -x $(command -v "${dep}") ]]; then
 			echo -e "skip:    dependency ${dep} not found!\n"
 			exit "${KSFT_SKIP}"
@@ -1231,12 +1234,8 @@ test_ns_local_same_cid_ok() {
 }
 
 test_ns_host_vsock_child_ns_mode_ok() {
-	local orig_mode
-	local rc
-
-	orig_mode=$(cat /proc/sys/net/vsock/child_ns_mode)
+	local rc="${KSFT_PASS}"
 
-	rc="${KSFT_PASS}"
 	for mode in "${NS_MODES[@]}"; do
 		local ns="${mode}0"
 
@@ -1246,15 +1245,13 @@ test_ns_host_vsock_child_ns_mode_ok() {
 			continue
 		fi
 
-		if ! echo "${mode}" > /proc/sys/net/vsock/child_ns_mode; then
-			log_host "child_ns_mode should be writable to ${mode}"
+		if ! echo "${mode}" | ip netns exec "${ns}" \
+			tee /proc/sys/net/vsock/child_ns_mode &>/dev/null; then
 			rc="${KSFT_FAIL}"
 			continue
 		fi
 	done
 
-	echo "${orig_mode}" > /proc/sys/net/vsock/child_ns_mode
-
 	return "${rc}"
 }
 

-- 
2.47.3

