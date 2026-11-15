Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761103;
	b=48Lm1kAV6n4k8p+7z45nIdv8Zw3SXkVbNz8NK/WP3X0RjSOfVYrMhWCYU45MVuk264sf
	 ZgTF9F3cp4drmDKA4TepP5pWthud5EJjY+1vTl+E3tWkbkI5oViHQgHlv8RtVzVr04eEP
	 ZS660nbKA7yBH6pGuDnNwiQdOraiRqPmQhwxoM+j1yENLKMnyKaFYyju9A9IvOavuLNFs
	 sH6WqwFXAk+AhpmthV9riVhB38wn2We0AvcxHbstURvGyKg/64/psWlI/BnOF1ZGkca0y
	 +X0cF1a7qeq9BM/X2fNnTs9VHZcL8dHr55YrzlJ/QdRcGvUA73ZaUPtareoGas9IQ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761103;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L3TGxP7qqA0la5s0RG5cIWXn2l7QhsuMhoN4cxeO4Hs=;
	b=Dn4soLHOb+DfLBfhdfYpTTmdTCKkckIJSPSxtLHTV38TPPhWneKM6vMoh/H4cUDvsyPa
	 aBXHvKuQIe1rVGpXIlfQBdNJYpofyYSxPZM+4E1LbmP+HchqTOQvX5yM1hB5F3/VvIjin
	 HPkygo4wTHg0mdMV2eEadyulYvJfuCZkhdYn6Ed/NDkSiPPsKL5FI6jEaUkMtLn1QdP67
	 jbe7nQMNSHhbP9lIODWrFdquFw/CvJZBzMKyFcB4T6dwnsKaLHfX9EhuQbZKeYkq8S7fW
	 pZ9jdNnMV2KvNnPMYDit20Q4daeVPNOMlYQ4plwcKspb1U/pbOggl9MNhAACQTvwmfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=mrxxdaNI;
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD729606A330
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD729606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=mrxxdaNI
X-KPN-MessageId: e26a4228-e113-11f1-92b2-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e26a4228-e113-11f1-92b2-005056992ed3;
	Sun, 15 Nov 2026 17:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=L3TGxP7qqA0la5s0RG5cIWXn2l7QhsuMhoN4cxeO4Hs=;
	b=mrxxdaNIwhC3ZTqqQ26N4TwZ/ouZI9bzk9uW3otajPF8cg2dlaOWFLTd8jW3eBfXOfTD0ngjqHgpd
	 iKaIOvynwDaBtRWSVnfhCCOtKSqSVofEem7J3YFxRWIxLJzJAW9FyBRa4xgJ6TJu8QAOJQqWGa9AA2
	 NbcA+oIp2kuCRELsRtoXuILoFYeETqGa58n62OxN5xQpkW1mWLhZIg4i0wnANvFX8EUiGO/24G0KKU
	 ua5CVv3C/2W3biU67b5m/3cGgAH3VXXcHoCZlkOfK+cjPzVrAIDbDw5hVgd72oA8rOY2aqKe6vQ+5C
	 XU/HDZTgxbABphbCJbbaF7PpQEi4BJA==
X-KPN-MID: 33|vllI3dAWnNhJoVSYOxk+5UPkq2nQn9RcWolZU46x9g9hMKS4LzLKbrWf1GBMp+L
 0YhbJbXU8u2ukSBc/HnxFEa6bOedNUEyKVsCkFuGDteg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Dv4l8WQg7t/lEeO49pzW44JM0/yKJjFICor/Bi3cM9x+m6wGVY1YOz488lM2j8d
 y4EB5IyOoNgSjp15+ywbfrw==
Received: from [10.56.187.180] (unknown [83.172.175.28])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id e241d4c4-e113-11f1-9bd1-00505699d6e5;
	Sun, 15 Nov 2026 17:44:54 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Sun, 15 Nov 2026 11:44:46 -0500
Subject: [PATCH 1/3] selftests: sort the TARGETS list
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ksft-targets-wildcard-v1-1-7512a50d0976@xs4all.nl>
References: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
In-Reply-To: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

The TARGETS list in the selftests Makefile is supposed to be kept in
alphabetical order, but several entries have drifted out of place.

No functional change intended.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/Makefile | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 07c3719f8b04..458300dcb702 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -12,22 +12,22 @@ TARGETS += cgroup
 TARGETS += clone3
 TARGETS += connector
 TARGETS += core
-TARGETS += cpufreq
 TARGETS += cpu-hotplug
+TARGETS += cpufreq
 TARGETS += damon
 TARGETS += dax
 TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
-TARGETS += drivers/ntsync
-TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
 TARGETS += drivers/net/bonding
 TARGETS += drivers/net/netconsole
 TARGETS += drivers/net/team
 TARGETS += drivers/net/virtio_net
+TARGETS += drivers/ntsync
 TARGETS += drivers/platform/x86/intel/ifs
+TARGETS += drivers/s390x/uvdevice
 TARGETS += dt
 TARGETS += efivarfs
 TARGETS += exec
@@ -35,27 +35,27 @@ TARGETS += fchmodat2
 TARGETS += filesystems
 TARGETS += filesystems/binderfs
 TARGETS += filesystems/configfs
+TARGETS += filesystems/empty_mntns
 TARGETS += filesystems/epoll
 TARGETS += filesystems/eventfd
 TARGETS += filesystems/failfs
 TARGETS += filesystems/fat
 TARGETS += filesystems/file_stressor
 TARGETS += filesystems/freeze
+TARGETS += filesystems/fscontext_ns
+TARGETS += filesystems/fsmount_ns
+TARGETS += filesystems/fuse
+TARGETS += filesystems/mntns_unbindable
+TARGETS += filesystems/mount-notify
+TARGETS += filesystems/mount_cycle
+TARGETS += filesystems/move_mount
+TARGETS += filesystems/nsfs
 TARGETS += filesystems/openat2
 TARGETS += filesystems/open_tree_ns
 TARGETS += filesystems/overlayfs
 TARGETS += filesystems/statmount
-TARGETS += filesystems/mount-notify
-TARGETS += filesystems/mount_cycle
-TARGETS += filesystems/nsfs
-TARGETS += filesystems/fuse
-TARGETS += filesystems/move_mount
-TARGETS += filesystems/empty_mntns
-TARGETS += filesystems/fsmount_ns
-TARGETS += filesystems/fscontext_ns
-TARGETS += filesystems/xattr
-TARGETS += filesystems/mntns_unbindable
 TARGETS += filesystems/umount_propagation
+TARGETS += filesystems/xattr
 TARGETS += firmware
 TARGETS += fpu
 TARGETS += ftrace
@@ -80,6 +80,7 @@ TARGETS += membarrier
 TARGETS += memfd
 TARGETS += memory-hotplug
 TARGETS += mincore
+TARGETS += mm
 TARGETS += mount
 TARGETS += mount_setattr
 TARGETS += move_mount_set_group
@@ -101,14 +102,14 @@ TARGETS += net/rds
 TARGETS += net/tcp_ao
 TARGETS += nfsd
 TARGETS += nolibc
-TARGETS += pci_endpoint
 TARGETS += pcie_bwctrl
+TARGETS += pci_endpoint
 TARGETS += perf_events
 TARGETS += pidfd
 TARGETS += pid_namespace
 TARGETS += pipe
-TARGETS += power_supply
 TARGETS += powerpc
+TARGETS += power_supply
 TARGETS += prctl
 TARGETS += proc
 TARGETS += pstore
@@ -146,12 +147,11 @@ TARGETS += ublk
 TARGETS += uevent
 TARGETS += user_events
 TARGETS += vDSO
-TARGETS += mm
 TARGETS += vfio
 TARGETS += x86
 TARGETS += x86/bugs
 TARGETS += zram
-#Please keep the TARGETS list alphabetically sorted
+#Please keep the TARGETS list alphabetically sorted (LC_ALL=C sort -f)
 # Run "make quicktest=1 run_tests" or
 # "make quicktest=1 kselftest" from top level Makefile
 

-- 
2.56.0

