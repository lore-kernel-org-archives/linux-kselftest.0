Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F8404BCB
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590982; cv=none; b=IyIxqOatpcPX2kpALS9x2d3dedbTV8kOYcDwoTy+HLdo+8VH1uSPATcuBZCMiygrkc54kIWXdqvYsGo9NdDR1ZzENjHlHKw09Rlec/NtLwJexo3HdD/ONYAjUNrd83nmr5SkN0lEh3h1A6HieFe/DcVWDaIVD9+CWgIaWnt34F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590982; c=relaxed/simple;
	bh=2weJseZmfhhuMkVl4mobPkyhlKlV9CmmuBH9aDTWvdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNjXKJi4CZEefJxKAp1KWQsnTgtj23FfcvWPs9336afhqe2oqpBTCS3JNRPMD4N6pBascx0M1f0YciOOrOIo0/E/XLXOEZPykyf6ekBYzOauL5ZJwJEiWTQkstNwTrRQw74J8zFquUnNPb2MZYAKt4Jz0ryO3X4DurEu7PZ1rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=rZ0sIeyO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="rZ0sIeyO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1529954f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783590979; x=1784195779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/tf5HNf/pTiFtMMkWJrXjHDGjF4y30NaNB9JlvlgwM=;
        b=rZ0sIeyOYmmDsf/qxuuinDtT6eXIk2Hm9TFIhDQ7VecjW/VKkcklSxIQD0MVpRYij5
         jRIwAAUz6cY1WhECaMa1OZ2eGVygtrE+hSaKRB0XbujkoHLIhD8uZ8rZ71l0tFDbJB5I
         1M05jxn2hNYqmelNZzHThr8Qd+MT0yuWRRdUQ9z+hVjWIFRJcsrU894zHVtW1CAW7Dp5
         rQfCxzxCllSEF+M5r/CrOkrJj3/oD4gL7b39zZSgWa4vy4JA32Rf2Xmyfbe8Qe0FhZNp
         OvaX0/ipUrhc0ckw4AQ+X26eYJrz2dQTNDG3VCltI8n/NDaJ252w/2bsjHXFIoIxvN2l
         YfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590979; x=1784195779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/tf5HNf/pTiFtMMkWJrXjHDGjF4y30NaNB9JlvlgwM=;
        b=mnok2R/RoKzl1ItIqedkk/nRpbPA5E9CJHnwgmJ1zyq/EXAr1aivqkXjTGoHOdjQsR
         C+/9dqcgYHJVMS6rVwaawlhIlyQfVdP9DxLb+5VqEcXZIrfqAdtJKpMhve8WL+9bB07o
         aBBtcUM2LCCwqzvJBtcEs3eO5ojY6KEvdIrBZKwxdy5U8MmmedtSgMFwoiRiu9jQLzj/
         obFkonTEqf9jXGqU0ffwkSj8gPMBJxAYb0fEqddsRLUBFahijg89JkuHSSk4k4/Dq6oT
         ltVmOoaKsyvTjEDWT7RqHunBEMfqB7RijfJO/L0LbzLixMyBmymaiEIpwTFasy4DjBpE
         8v4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqouFNdO5LX/isZWU0D2f2BG7kL0uM1vp1Mf5rYel3sbOzV/h+YSJrQbDykxFNCfDbzKWnbXGkyRHHW6ceDObA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkL1/k7QWi0/LVjBzxkSJ96L/QeEnTNHRPJ9zs2+MSnQSul5zk
	g7kjXAwIb3xz7i2WIhSun4SrWZxf9Ilg7B8N3/yNX4/r0eO3huckISmrHdXO/mtEhGE=
X-Gm-Gg: AfdE7cmN3eGuTl24BLaEJC8gcmuP7mn7Ec+85Cs5KxZb4dSEJQjW1nuPZKfKz3pJPzH
	GmM41sTT+o4Tjz1pF57rcvV2PzqCZ6U//k82W0H6omPTAlyogWWDL0fnhhbLkVLsjJXBOZpiRuw
	JoQIY9nMq9rIdj+VjDBGL6g8BskzPLJb+G7RhXEkefTLb2SJfl2jt9SSTvIhfMP/Ziff6wxQ1o8
	t/GINUhs1L72kvTZN3SZcn73adyDVn0m0OQMTmZpPIdI1MIPC0HxDAeMw2VXLqRSej0SrHE0M+P
	4B0xZfQlN3YD7VO0dfiB4ek2qKFX6mQL2AzMblRS38Xj1dUnAbf6GtSdGYoUhuKP4KCg8HriI02
	2PwnGjYXh8k/I76wUOUkGDUlcmfS8aolRFYmzgjWa1GO/ynXQFYYVLhp4mCoRsD+b+VksoWqUBZ
	Bk43qzLEsZD5LFuXMNv3kyCQ==
X-Received: by 2002:a05:6000:2582:b0:46d:d5da:f0a8 with SMTP id ffacd0b85a97d-47df07a9985mr6724774f8f.47.1783590978626;
        Thu, 09 Jul 2026 02:56:18 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm49320207f8f.14.2026.07.09.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:56:18 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-rdma@vger.kernel.org
Cc: cgroups@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jgg@ziepe.ca,
	leon@kernel.org,
	parav@nvidia.com,
	mbloch@nvidia.com,
	cmeiohas@nvidia.com,
	roman.gushchin@linux.dev,
	bvanassche@acm.org,
	zyjzyj2000@gmail.com,
	shuah@kernel.org,
	tj@kernel.org,
	mkoutny@suse.com,
	hannes@cmpxchg.org,
	alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com
Subject: [PATCH rdma-next 13/13] RDMA/selftests: Add rxe_netns_names test
Date: Thu,  9 Jul 2026 11:55:32 +0200
Message-ID: <20260709095532.855647-14-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709095532.855647-1-jiri@resnulli.us>
References: <20260709095532.855647-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Add a kselftest script that exercises per-netns RDMA device naming
with RXE. Cover duplicate names across namespaces, move conflict
handling, move-with-rename, and same-namespace rename requests.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 tools/testing/selftests/rdma/Makefile         |   3 +-
 tools/testing/selftests/rdma/config           |   2 +
 .../testing/selftests/rdma/rxe_netns_names.sh | 282 ++++++++++++++++++
 3 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/rdma/rxe_netns_names.sh

diff --git a/tools/testing/selftests/rdma/Makefile b/tools/testing/selftests/rdma/Makefile
index 07af7f15c1bf..a91c14c45006 100644
--- a/tools/testing/selftests/rdma/Makefile
+++ b/tools/testing/selftests/rdma/Makefile
@@ -3,6 +3,7 @@ TEST_PROGS := rxe_rping_between_netns.sh \
 		rxe_ipv6.sh \
 		rxe_socket_with_netns.sh \
 		rxe_test_NETDEV_UNREGISTER.sh \
-		rxe_sent_rcvd_bytes.sh
+		rxe_sent_rcvd_bytes.sh \
+		rxe_netns_names.sh
 
 include ../lib.mk
diff --git a/tools/testing/selftests/rdma/config b/tools/testing/selftests/rdma/config
index 4ffb814e253b..e1ff54ec0f57 100644
--- a/tools/testing/selftests/rdma/config
+++ b/tools/testing/selftests/rdma/config
@@ -1,3 +1,5 @@
 CONFIG_TUN
 CONFIG_VETH
+CONFIG_DUMMY
+CONFIG_NET_NS
 CONFIG_RDMA_RXE
diff --git a/tools/testing/selftests/rdma/rxe_netns_names.sh b/tools/testing/selftests/rdma/rxe_netns_names.sh
new file mode 100755
index 000000000000..a7e57706fdff
--- /dev/null
+++ b/tools/testing/selftests/rdma/rxe_netns_names.sh
@@ -0,0 +1,282 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Exercise RDMA device name handling across network namespaces.
+
+source "$(dirname "$0")/../kselftest/ktap_helpers.sh"
+
+NAME_PREFIX="rxe_netns_names_$$"
+NETDEV_PREFIX="rxn$$"
+NS1="${NAME_PREFIX}ns1"
+NS2="${NAME_PREFIX}ns2"
+RXE_A="${NAME_PREFIX}rxe_a"
+RXE_B="${NAME_PREFIX}rxe_b"
+RXE_SAME="${NAME_PREFIX}rxe_same"
+RXE_NEW="${NAME_PREFIX}rxe_new"
+DUMMY_A="${NETDEV_PREFIX}a"
+DUMMY_B="${NETDEV_PREFIX}b"
+OLD_MODE=""
+MODE_CHANGED=0
+MODS=("dummy" "rdma_rxe")
+TEST_SAME_NAMES="same RDMA device name can exist in two net namespaces"
+TEST_MOVE_CONFLICT="move without rename fails on destination name conflict"
+TEST_MOVE_RENAME="move then rename succeeds"
+TEST_COMBINED_MOVE_RENAME="move with requested destination name succeeds"
+TEST_SAME_NETNS_DUP_RENAME="same-netns rename rejects duplicate name"
+TEST_TEARDOWN_RETURN="netns delete returns device to init_net and renames on conflict"
+
+ksft_skip()
+{
+	ktap_skip_all "$*"
+	exit "$KSFT_SKIP"
+}
+
+fail()
+{
+	ktap_exit_fail_msg "$*"
+}
+
+need_cmd()
+{
+	command -v "$1" >/dev/null 2>&1 || ksft_skip "missing command: $1"
+}
+
+rdma_ns()
+{
+	local ns=$1
+
+	shift
+	ip netns exec "$ns" rdma "$@"
+}
+
+rdma_dev_exists()
+{
+	local ns=$1
+	local dev=$2
+
+	if [ -n "$ns" ]; then
+		rdma_ns "$ns" dev show "$dev" >/dev/null 2>&1
+	else
+		rdma dev show "$dev" >/dev/null 2>&1
+	fi
+}
+
+add_dummy()
+{
+	local netdev=$1
+
+	ip link add "$netdev" type dummy || return 1
+	ip link set "$netdev" up || return 1
+}
+
+add_rxe()
+{
+	local dev=$1
+	local netdev=$2
+
+	rdma link add "$dev" type rxe netdev "$netdev"
+}
+
+rdma_dev_on_netdev()
+{
+	local netdev=$1
+
+	rdma link show 2>/dev/null | awk -v want="$netdev" '
+		{
+			for (i = 1; i < NF; i++)
+				if ($i == "netdev" && $(i + 1) == want) {
+					dev = $2
+					sub(/\/.*/, "", dev)
+					print dev
+					exit
+				}
+		}'
+}
+
+wait_rdma_dev_on_netdev()
+{
+	local netdev=$1
+	local dev
+	local i
+
+	for i in $(seq 1 50); do
+		dev=$(rdma_dev_on_netdev "$netdev")
+		if [ -n "$dev" ]; then
+			echo "$dev"
+			return 0
+		fi
+		sleep 0.1
+	done
+
+	return 1
+}
+
+setup_devs()
+{
+	cleanup_devs
+
+	add_dummy "$DUMMY_A" || return 1
+	add_dummy "$DUMMY_B" || return 1
+
+	add_rxe "$RXE_A" "$DUMMY_A" || return 1
+	add_rxe "$RXE_B" "$DUMMY_B" || return 1
+}
+
+cleanup_devs()
+{
+	ip link del "$DUMMY_A" 2>/dev/null
+	ip link del "$DUMMY_B" 2>/dev/null
+}
+
+setup()
+{
+	OLD_MODE=$(rdma system show 2>/dev/null |
+		   sed -n 's/.*netns \([^ ]*\).*/\1/p')
+	[ -n "$OLD_MODE" ] || ksft_skip "failed to read RDMA netns mode"
+
+	rdma system set netns exclusive >/dev/null 2>&1 ||
+		ksft_skip "rdma netns exclusive mode is not supported"
+	MODE_CHANGED=1
+
+	ip netns add "$NS1" || return 1
+	ip netns add "$NS2" || return 1
+}
+
+cleanup()
+{
+	cleanup_devs
+
+	ip netns del "$NS1" 2>/dev/null
+	ip netns del "$NS2" 2>/dev/null
+
+	if [ "$MODE_CHANGED" -eq 1 ]; then
+		rdma system set netns "$OLD_MODE" 2>/dev/null
+	fi
+
+	for m in "${MODS[@]}"; do
+		modprobe -r "$m" 2>/dev/null
+	done
+}
+
+rdma_supports_combined_move_rename()
+{
+	rdma dev help 2>&1 | grep -Eq 'netns .*name|name .*netns'
+}
+
+[ "$(id -u)" -eq 0 ] || ksft_skip "must be run as root"
+need_cmd ip
+need_cmd rdma
+need_cmd modprobe
+
+trap cleanup EXIT
+
+for m in "${MODS[@]}"; do
+	modinfo "$m" >/dev/null 2>&1 || ksft_skip "module $m not found"
+	modprobe "$m" || fail "failed to load $m"
+done
+
+setup || fail "failed to create net namespaces"
+
+ktap_print_header
+ktap_set_plan 7
+
+if setup_devs &&
+   rdma dev set "$RXE_A" netns "$NS1" &&
+   rdma_ns "$NS1" dev set "$RXE_A" name "$RXE_SAME" &&
+   rdma dev set "$RXE_B" netns "$NS2" &&
+   rdma_ns "$NS2" dev set "$RXE_B" name "$RXE_SAME" &&
+   rdma_dev_exists "$NS1" "$RXE_SAME" &&
+   rdma_dev_exists "$NS2" "$RXE_SAME"; then
+	ktap_test_pass "$TEST_SAME_NAMES"
+else
+	ktap_test_fail "$TEST_SAME_NAMES"
+fi
+cleanup_devs
+
+if ! setup_devs ||
+   ! rdma dev set "$RXE_A" netns "$NS1" ||
+   ! rdma_ns "$NS1" dev set "$RXE_A" name "$RXE_SAME" ||
+   ! rdma dev set "$RXE_B" netns "$NS2" ||
+   ! rdma_ns "$NS2" dev set "$RXE_B" name "$RXE_SAME"; then
+	ktap_test_fail "$TEST_MOVE_CONFLICT"
+elif rdma_ns "$NS1" dev set "$RXE_SAME" netns "$NS2" >/dev/null 2>&1; then
+	ktap_test_fail "$TEST_MOVE_CONFLICT"
+elif rdma_dev_exists "$NS1" "$RXE_SAME" &&
+     rdma_dev_exists "$NS2" "$RXE_SAME"; then
+	ktap_test_pass "$TEST_MOVE_CONFLICT"
+else
+	ktap_test_fail "$TEST_MOVE_CONFLICT"
+fi
+cleanup_devs
+
+if ! setup_devs; then
+	ktap_test_fail "$TEST_MOVE_RENAME"
+elif rdma dev set "$RXE_A" netns "$NS2" &&
+     rdma_ns "$NS2" dev set "$RXE_A" name "$RXE_NEW"; then
+	if rdma_dev_exists "$NS2" "$RXE_NEW" &&
+	   ! rdma_dev_exists "" "$RXE_A"; then
+		ktap_test_pass "$TEST_MOVE_RENAME"
+	else
+		ktap_test_fail "$TEST_MOVE_RENAME"
+	fi
+else
+	ktap_test_fail "$TEST_MOVE_RENAME"
+fi
+cleanup_devs
+
+if ! rdma_supports_combined_move_rename; then
+	ktap_test_skip "$TEST_COMBINED_MOVE_RENAME"
+elif ! setup_devs; then
+	ktap_test_fail "$TEST_COMBINED_MOVE_RENAME"
+elif rdma dev set "$RXE_A" netns "$NS2" name "$RXE_NEW"; then
+	if rdma_dev_exists "$NS2" "$RXE_NEW" &&
+	   ! rdma_dev_exists "" "$RXE_A"; then
+		ktap_test_pass "$TEST_COMBINED_MOVE_RENAME"
+	else
+		ktap_test_fail "$TEST_COMBINED_MOVE_RENAME"
+	fi
+else
+	ktap_test_fail "$TEST_COMBINED_MOVE_RENAME"
+fi
+cleanup_devs
+
+if ! setup_devs; then
+	ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
+elif rdma dev set "$RXE_A" name "$RXE_SAME" &&
+     rdma dev set "$RXE_B" name "$RXE_NEW"; then
+	if rdma dev set "$RXE_A" name "$RXE_NEW" >/dev/null 2>&1; then
+		ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
+	elif rdma_dev_exists "" "$RXE_SAME" &&
+	     rdma_dev_exists "" "$RXE_NEW"; then
+		ktap_test_pass "$TEST_SAME_NETNS_DUP_RENAME"
+	else
+		ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
+	fi
+else
+	ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
+fi
+cleanup_devs
+
+if ! setup_devs; then
+	ktap_test_fail "$TEST_TEARDOWN_RETURN"
+elif ! rdma dev set "$RXE_A" name "$RXE_SAME" ||
+     ! rdma dev set "$RXE_B" netns "$NS2" ||
+     ! rdma_ns "$NS2" dev set "$RXE_B" name "$RXE_SAME" ||
+     ! rdma_dev_exists "$NS2" "$RXE_SAME"; then
+	ktap_test_fail "$TEST_TEARDOWN_RETURN"
+else
+	ip netns del "$NS2"
+	returned=$(wait_rdma_dev_on_netdev "$DUMMY_B")
+	ktap_print_msg "device returned to init_net as '${returned:-<missing>}'"
+	if rdma_dev_exists "" "$RXE_SAME" &&
+	   [ -n "$returned" ] &&
+	   [ "$returned" != "$RXE_SAME" ] &&
+	   [ "${returned#ibdev}" != "$returned" ]; then
+		ktap_test_pass "$TEST_TEARDOWN_RETURN"
+	else
+		ktap_test_fail "$TEST_TEARDOWN_RETURN"
+	fi
+fi
+cleanup_devs
+
+ktap_finished
-- 
2.54.0

