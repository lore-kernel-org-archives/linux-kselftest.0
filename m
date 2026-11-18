Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032841;
	b=EUTVq9a8iQQ1nKTVD8wBgd2BGwoA+XnSXOnWPvFmnmlpnWCbiHaWR5hOMY4v1wylzsmi
	 SG+TS+5xwJA6Uqq0LMLOxvv+wIaWsJ6i6KvZ7oshQTBKktflQ23Si3AIvIpT5Ia7jw0UQ
	 jqx/6jfSgqi/tAvcUKWhgBaD2CA2EK6WhEFyBsh96AFr8PfKX9touTdB3LboYIsMePKRu
	 A5/TJnG0mdLgZA714czXWL9vixqjHNw2P2dQD3DrOEpvoY7AcaNDPk9WxRhxTf1+eNDas
	 qnUebH1T95uuWnZ2xuFLGcA4i/s8MU+4oJHkVfpHrwy20ZWL/I8C4EXNKEVjzPc3Dzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6BKivAUJdW3D7tOMGZMvh3uAleH7WHkI+8KsFf6iZ14=;
	b=yNSz/cvcuc2m6DKyC2ja5CYDXr/W+uQyTrsQOJ9jYBaH2EBQuq3uxZBJ9YpHpsfWgoJu
	 blRHKOj/6r/KjDpC2WxYsmJdYS5fhpXBaPhRVjxAe/I9C+Dm+WGoBDxpRTQN4hftRum89
	 hK6lI8tjB3t9AgLEt4InV4VzrBuIUsPMWZ31s42LnLu1OBsOsHpzaSOAGmdnyR1yaVyFE
	 8Ce6XTUNWNpmw6gfQChHxdG4elwF50UkN2jrBUM/ppCutsywjFqwPfCqYfRpfl6ZI8ku8
	 Iox8ldZgOtdHEplezCxlum9YbR7jw1DzFLX20deiMOb+W5afH2ejTLZaMErPy0fsV0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ve1Z9bBT;
	arc=none smtp.remote-ip=209.85.160.98
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178C160A2606
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 20:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178C160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ve1Z9bBT
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-4adf4431ca0so454188fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032839; x=1795637639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BKivAUJdW3D7tOMGZMvh3uAleH7WHkI+8KsFf6iZ14=;
        b=XtjpRMr9UUVPiUSSeykTzN7gq7Mt/JmPGFU03asM0dtQOKO/gKgJBljDvzlvZsZhBU
         x5a/Y82mmwFK8YiaqWjUYZnvWu09ZBrtvS8tqvoB6u56XkAmkvLD2uqlygr7KdzJiHfC
         aLRSv6Mxmd3iYujKOZyHfwyVQFXvool6VzHo+iHkhyitrTbf8oxOdWDDfCrJMIJVv8ml
         n2bezLTiS/YM4mcQIEylPdG/fQMYU8Y4egjec1Dqm3MEhNPybI9jzPhuzGKWfRJorD4b
         rzNgOGZpHwD4vRgD2Ae3+OSgk6DlbLi3bXaT3Lg+yDwmpj+ahxV9+9o9K/ng/lB9qbaH
         PmKw==
X-Forwarded-Encrypted: i=1; AL+hErFdmrjNig/ZpmFwQ72yE3NlUO7mXfufh1itAuibycvncDdC5xrRgVI/WWw53gtRgYmazxkBp7skYcbmE9YVv6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LPFueqiZCOJjTgsaxriMl5q1qWxqlaB6/cu9/OyeSr1pEShqK
	ukvJy7ZiVRVKA13x8BH3hRW3R3bHhf5IoBUIc2IArgoAMrdofuwlFk8Mj6u812F3j9VUpg/xaQ4
	xR/5ZjMtVXLkN/IHPXgyo3or8Kwmtxe65oRAe8H7wQl/+IZYJbC4V8e05GyROfyLAqmwaHR0b0m
	141dB0avEFD9AS3X4OFJSB7ONtj8yVBUqTcm1X29Wm0Hvl2rbynkD1/ukJcQ4P2aN5vxBmsdof8
	usn7Pd5L5fcscVLGHKl30BOlLxP
X-Gm-Gg: AYBFou3FhjhSzUu0pMwdjk70Kj4rigzl31lbJLiqddXQCOOUB/OHl+Qbl3exTB4Ss3j
	LzLHOpUkrDHvQ8jrpCwaABNtdNz4eCiBfGWsKZBbVE3I3ID4tY2+27YuySG5ohRNIJFIqQBTah1
	RXza42mEHXj6dE7/I6aBQdK2UrC8Y8t9VgHC+Rw2NcIuNU/hxkDlQZ9mQrU36E8hD2MyC39KUJU
	AZMUHa+JOWDWFdRdAJcPAgK5NnIaBA1SvvMz3f5/QP4XKcGs46aNUj9/5y88v6JAvROKeKcK+mz
	xT67/6g7KZT7i4JBD8xBzJ6hBpqUCFwVOXGaXL2va12D/ILUBM5x+39btGZyhHzNfArVDYrFkZs
	5Etl6SO7GlVIp7/ubIwV/TQrhIigLVFnXrzf7wloT7uaVSO+hRpiY9khVH6fOzwcdaVgFb/hrfn
	mOBZkv4kVwA57Tr29LrwDCTKTFd34iWVWkGq/Xu6Pq
X-Received: by 2002:a05:6870:4795:b0:490:35f6:2b8e with SMTP id 586e51a60fabf-4b75fd16572mr3390941fac.13.1795032838675;
        Wed, 18 Nov 2026 12:13:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4b7469eb978sm39919fac.26.2026.11.18.12.13.58
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d62b80650so22859321cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032837; x=1795637637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BKivAUJdW3D7tOMGZMvh3uAleH7WHkI+8KsFf6iZ14=;
        b=Ve1Z9bBTA4DT9vdUf3cbYuDH1/qD6QD8PkE8vgWT2aFxlICfoY/TRJ3nbWRLtwZSMn
         LQ6rFR2B/YdWbrfUyMQTgrV43csiJoUsjcmjM72rZp709yu7E1T9oCjVgzPpd0HWskfH
         3quSKL8RJJdNIDvpHBaYPwSNYmte7qxb1J514=
X-Forwarded-Encrypted: i=1; AL+hErGWf7A1DoFG/J5so9kDtDJzxU/OuzbXrlK9coKSjr4SAcTzg7o9z4FffJUwjn9BDQUihPZHezLShaWvZf3/l5Y=@vger.kernel.org
X-Received: by 2002:ac8:640a:0:b0:55d:5ba6:bf25 with SMTP id d75a77b69052e-55d5ba6c316mr47681581cf.0.1795032837516;
        Wed, 18 Nov 2026 12:13:57 -0800 (PST)
X-Received: by 2002:ac8:640a:0:b0:55d:5ba6:bf25 with SMTP id d75a77b69052e-55d5ba6c316mr47680971cf.0.1795032836861;
        Wed, 18 Nov 2026 12:13:56 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:55 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 3/4] selftests: netfilter: check hardware offload work after DESTROY
Date: Wed, 18 Nov 2026 12:12:49 -0800
Message-ID: <20261118201250.2075007-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add a test for "netfilter: flowtable: do not queue offload work after
DESTROY". A TCP flow in a hardware offload flowtable is closed: its
hardware rule is destroyed, and the flow stays in the flowtable until it
expires, where the garbage collector keeps finding it. No STATS or
REPLACE work may be queued for it once DESTROY was.

The flowtable devices are netdevsim ports, the only devices which accept a
hardware offload flowtable, and the work is told apart by its workqueue
with the workqueue_queue_work tracepoint, as netdevsim does not show it.
The REPLACE case of the fix is a race between a packet reader and the
garbage collector which cannot be triggered from user space; this
checks the same rule through the STATS work, which the garbage collector
queues after DESTROY without the fix.

Without the fix, 6 work items are queued after DESTROY in a 20 seconds TCP
flowtable timeout run in a VM, and the test fails. With it, none are.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../testing/selftests/net/netfilter/Makefile  |   1 +
 tools/testing/selftests/net/netfilter/config  |   1 +
 .../net/netfilter/nft_flowtable_hw_destroy.sh | 162 ++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh

diff --git a/tools/testing/selftests/net/netfilter/Makefile b/tools/testing/selftests/net/netfilter/Makefile
index df3c20c90f5d..75d7d4495623 100644
--- a/tools/testing/selftests/net/netfilter/Makefile
+++ b/tools/testing/selftests/net/netfilter/Makefile
@@ -30,6 +30,7 @@ TEST_PROGS := \
 	nft_fib.sh \
 	nft_fib_nexthop.sh \
 	nft_flowtable.sh \
+	nft_flowtable_hw_destroy.sh \
 	nft_interface_stress.sh \
 	nft_meta.sh \
 	nft_nat.sh \
diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 629b2b29ed1a..bf7be95f7d25 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -16,6 +16,7 @@ CONFIG_DUMMY=m
 CONFIG_FAIL_FUNCTION=y
 CONFIG_FAULT_INJECTION=y
 CONFIG_FAULT_INJECTION_DEBUG_FS=y
+CONFIG_FTRACE=y
 CONFIG_FUNCTION_ERROR_INJECTION=y
 CONFIG_INET_DIAG=m
 CONFIG_INET_ESP=m
diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh b/tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh
new file mode 100755
index 000000000000..c0675378bd86
--- /dev/null
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh
@@ -0,0 +1,162 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Once the hardware rule of a flow is destroyed, no more hardware offload work
+# must be queued for it. The flow is removed from the flowtable later, by the
+# garbage collector, which can still find it in the meantime.
+#
+# A TCP flow with a FIN has its hardware rule destroyed while it stays in the
+# flowtable until it expires. Check the workqueues used for the offload work,
+# which the netdevsim devices of the flowtable do not otherwise show.
+#
+# ns1 <-> (nsim) nsr1 (nsim) <-> ns2
+
+source lib.sh
+
+ret=0
+tracing=/sys/kernel/tracing
+trace_mounted=0
+tmpfile=$(mktemp)
+nsim_ids=""
+
+checktool "nft --version" "run test without nft tool"
+checktool "socat -h" "run test without socat"
+
+cleanup() {
+	if [ -d "$tracing/events/workqueue" ]; then
+		echo 0 > "$tracing/events/workqueue/workqueue_queue_work/enable"
+		echo > "$tracing/trace"
+	fi
+	[ "$trace_mounted" -eq 1 ] && umount "$tracing"
+	ip netns pids "$ns1" 2>/dev/null | xargs -r kill 2>/dev/null
+	ip netns pids "$ns2" 2>/dev/null | xargs -r kill 2>/dev/null
+	cleanup_all_ns
+	for id in $nsim_ids; do
+		cleanup_netdevsim "$id"
+	done
+	rm -f "$tmpfile"
+}
+
+trap cleanup EXIT
+
+setup_ns ns1 ns2 nsr1
+
+if [ ! -d "$tracing/events/workqueue" ]; then
+	mount -t tracefs nodev "$tracing" 2>/dev/null && trace_mounted=1
+fi
+if [ ! -d "$tracing/events/workqueue/workqueue_queue_work" ]; then
+	echo "SKIP: workqueue tracepoints are not available"
+	exit $ksft_skip
+fi
+
+modprobe -q netdevsim
+if [ ! -d /sys/bus/netdevsim ]; then
+	echo "SKIP: netdevsim is not available"
+	exit $ksft_skip
+fi
+
+nsim_new() {
+	local id="$1" ns="$2" name
+
+	echo "$id 1" > /sys/bus/netdevsim/new_device || return 1
+	nsim_ids="$nsim_ids $id"
+	name=$(ls /sys/bus/netdevsim/devices/netdevsim"$id"/net)
+	ip link set "$name" name "nsim$id" netns "$ns" || return 1
+	echo "nsim$id"
+}
+
+nsim_ifindex() {
+	ip netns exec "$1" cat /sys/class/net/"$2"/ifindex
+}
+
+base=$((256 + RANDOM % 128 * 4))
+a1=$(nsim_new "$base" "$ns1") || exit $ksft_skip
+a2=$(nsim_new $((base + 1)) "$nsr1") || exit $ksft_skip
+b1=$(nsim_new $((base + 2)) "$nsr1") || exit $ksft_skip
+b2=$(nsim_new $((base + 3)) "$ns2") || exit $ksft_skip
+
+# Link the peers: netdevsim takes a netns file descriptor and an ifindex.
+exec {fd1}</var/run/netns/"$ns1"
+exec {fdr}</var/run/netns/"$nsr1"
+exec {fd2}</var/run/netns/"$ns2"
+
+link=/sys/bus/netdevsim/link_device
+if ! echo "$fd1:$(nsim_ifindex "$ns1" "$a1") $fdr:$(nsim_ifindex "$nsr1" "$a2")" > $link ||
+   ! echo "$fdr:$(nsim_ifindex "$nsr1" "$b1") $fd2:$(nsim_ifindex "$ns2" "$b2")" > $link; then
+	echo "SKIP: Could not link the netdevsim devices"
+	exit $ksft_skip
+fi
+
+ip -net "$ns1" link set "$a1" up
+ip -net "$nsr1" link set "$a2" up
+ip -net "$nsr1" link set "$b1" up
+ip -net "$ns2" link set "$b2" up
+
+ip -net "$ns1" addr add 10.0.1.2/24 dev "$a1"
+ip -net "$nsr1" addr add 10.0.1.1/24 dev "$a2"
+ip -net "$nsr1" addr add 10.0.2.1/24 dev "$b1"
+ip -net "$ns2" addr add 10.0.2.2/24 dev "$b2"
+ip -net "$ns1" route add 10.0.2.0/24 via 10.0.1.1
+ip -net "$ns2" route add 10.0.1.0/24 via 10.0.2.1
+ip netns exec "$nsr1" sysctl -q net.ipv4.conf.all.forwarding=1
+
+# The statistics of a flow are polled once a tenth of its timeout went by, and
+# the flow must stay around for longer than that after it is closed.
+ip netns exec "$nsr1" sysctl -q net.netfilter.nf_flowtable_tcp_timeout=20
+
+if ! ip netns exec "$nsr1" nft -f - <<EOF
+table inet filter {
+	flowtable ft {
+		hook ingress priority 0
+		devices = { $a2, $b1 }
+		flags offload
+	}
+
+	chain forward {
+		type filter hook forward priority 0; policy accept
+		ip protocol tcp ct state established flow add @ft
+	}
+}
+EOF
+then
+	echo "SKIP: Could not load a hardware offload flowtable"
+	exit $ksft_skip
+fi
+
+if ! ip netns exec "$ns1" ping -q -c 1 -W 2 10.0.2.2 > /dev/null; then
+	echo "SKIP: no connectivity through the netdevsim devices"
+	exit $ksft_skip
+fi
+
+ip netns exec "$ns2" socat -u TCP-LISTEN:12345,reuseaddr /dev/null &
+sleep 1
+
+echo 1 > "$tracing/events/workqueue/workqueue_queue_work/enable"
+echo > "$tracing/trace"
+
+# Send data for the flow to be offloaded, then close the connection.
+(for _ in 1 2 3 4 5 6; do echo data; sleep 0.3; done) | \
+	ip netns exec "$ns1" socat -u - TCP:10.0.2.2:12345
+
+# The garbage collector runs every second: let it destroy the hardware rule,
+# and go through the flow a few more times before it expires.
+sleep 8
+
+cat "$tracing/trace" > "$tmpfile"
+echo 0 > "$tracing/events/workqueue/workqueue_queue_work/enable"
+
+destroy=$(grep -n "workqueue=nf_ft_offload_del" "$tmpfile" | head -n 1 | cut -d: -f1)
+if [ -z "$destroy" ]; then
+	echo "SKIP: the hardware rule of the flow was not destroyed"
+	exit $ksft_skip
+fi
+
+late=$(tail -n +"$((destroy + 1))" "$tmpfile" | grep -c "workqueue=nf_ft_offload_\(stats\|add\)")
+if [ "$late" -ne 0 ]; then
+	echo "FAIL: $late offload work items were queued after the hardware rule was destroyed"
+	ret=1
+else
+	echo "PASS: no offload work was queued after the hardware rule was destroyed"
+fi
+
+exit $ret
-- 
2.53.0

