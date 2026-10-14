Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C514A3D25
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981621; cv=none; b=nKN77NBj6f9os7MWMfy0p1Yu+YBXuPPKWmDiEjxQeO91Xy+Bit+iBiV1knBHKZUdbNJUchRC4+RP0TMXv0NeczY0KHEWV0+32pClMA9LaNEOFtQ2+xC7qaKyqQjXMBDg/ieVklfJyrTPVXpBgVJn3iWx2JsG7SfffzP2jcrryT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981621; c=relaxed/simple;
	bh=3TZQ+HlcGjCGA3F/2zGyQPW/1sgKKdWUwMizSTdv6LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHqXdodCNkakWVkCJgqI4vNSp5qnwBYG22BNaQM2AEqD9XmEZ7ITkZAnrsLZCegsAoXKlqBK7/hGcQV5hOsmWdAnzNCleyP4P75df/cmrWk/WE3qvmmzlY6YgHhOAknRnM7253BLRNhfLQ5OmNvePrwmwXtpcO7W3elmzQel9D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj84rAdf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj84rAdf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1af482519so14076985e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981617; x=1792586417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOKE8b/KvX2bdCRB6QWafpMhNH6cuJzRy6nqCP30ARo=;
        b=nj84rAdf8EGlbvO7JsUQsWSZ7r7hMiN/imZjyYZU4sOoUE7wp41E0glAmx11bsmnHj
         37vsbf9SJ1ZyhAJSdZYF0c3kuLMKKRXP6bgGau0UhbCD2qi5RMQzDwHkPmUpmhhIyuht
         RmAx6bl4nqlwTxPcwqoCYMKUfgmxzp0VDyujeb2mB/wvjKpANRjk5jkhO86XQ+wPekIS
         Rds9dGf29XWs1qncb45+jdzHqC7FdF0Jv/dLLfT6393Wlu/sDdFsCFFrtA7UAUISvh7U
         LBq+4dd56FoN1JyiMMyHY7ZrPBVTiOqzoez0irD1uu43XczTt4ODLGR5JxFfYUOQmVe9
         /nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981617; x=1792586417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOKE8b/KvX2bdCRB6QWafpMhNH6cuJzRy6nqCP30ARo=;
        b=M2tNjse6NPOcd2Vj/y+3V97D6XNOzB/i5klCROyatVzLH5bIM8yoh4RCj/fSgNk7mc
         ZLuGwVfw1B5109kXoK/YyBvnsRwAeA37Y+5Q25rzmHQCh/s98SSsU3gYRMiAAA/abpY2
         8Pw2hTKXgKMcI0fmD290Yrrz/9UojKhNeTM/189X2TBQYGAyJZCWhLErAJV81kYmcgUJ
         ti6ZVAG7Ir6SkpcwZAFIC6CQxtnGAx8s+davOjwUPD7slMNEjhxEWBrTsZXvCU3EVALp
         ZUKvewCoQEBWwyGVFhhHg8O3ciWSjpvzbN33Vp1aqiJ7eWtCJ5/z1PcF+vufGxHo5dOs
         ENqQ==
X-Forwarded-Encrypted: i=1; AKwUvByxJGQuqkjd6GmoIbta01Xx8BMbaJQBltev/2zaQ5vXeLT1Q0/t0/DTNwszG7egAsfwikl+TeTJCwgCxTErK8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVvzvgfhQhojQbxs/aWRE7QVn/WK4IEZ8pMX71tqBubLIr+eZE
	On4Lq1GeHBWv0Wd3tXeVKn02D81Rp8+dfUAtMKiUnJ1JAqIx43SDMh7P
X-Gm-Gg: AYBFou2n+V6Bt3px+uCsp/RBH76zAQ3awRJbP8XGwkCSVLbxATJrn2fNewqTBg3jDM5
	aNv6vf8DFsFefr0pHdfCpR+PGylcE6GoKjlM8zpfOmtP7VA1Z3NX+aTqdf4iv4Oj0ETGSA0ew3P
	Uyl7UqiLG08aiujBPxhNgwA3C3C24Aa1SRkvcV8B/HuyTZiJAzY4waUmawXSJXNTQi57EoA0clE
	7hODcbGX7GfiDb9yOErFQVS3zpEoTRR+KCGfw8DcgIRKkfmL+glD6EH10nhIRkAtWRHh8uysVKV
	ghfwlOpxHWE4EYb8ThjJySTkOiTNFLm8EgdbKvuLOO1XxgOc1NFp6CXRJ4UjlktfNHvi2GQ7tT2
	TrGgCoA/nyf0QIe4jJCDm7HFfLwfLMTJq4NOpcQxwHxa01XuQPHowjlub0IHAK+u2bilfOBO9qG
	BGpITsuWCBC+StuRYwJXbtVtuK9AeChX/OAqkVepCZ0ur3ProeWp6T2GmVTZ5PxZo=
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr294242195e9.0.1791981616695;
        Wed, 14 Oct 2026 05:40:16 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:15 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v4 7/7] selftests: net: test the vxlan vnifilter request limit and dump replay
Date: Wed, 14 Oct 2026 15:38:14 +0300
Message-ID: <20261014123814.388557-8-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014123814.388557-1-alishmery18@gmail.com>
References: <20261014123814.388557-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the vnifilter tests for the request-size limit, the 24-bit VNI
range, and the dump/replay round trip the limit requires.

The API test gains: the largest accepted add and one VNI past it; a
rejected oversized add and a rejected multi-entry add whose entries are
each under the limit but sum over it, each checked to install nothing
(the range is asserted absent first, since vxlan_vni_add() folds an
existing VNI into the update path and would return 0 either way). The cap
is symmetric, so it also checks a maximum-size delete accepted and a
max+1 delete rejected, with every VNI in the max+1 range installed first
so the refusal can only come from the cap; a within-cap delete of a
never-installed range, which must fail on the missing VNI; an inverted
range accepted as a no-op; and the 24-bit bound exercised through END,
not only START.

bridge(8) places one VXLAN_VNIFILTER_ENTRY per comma-separated item into
a single message, so the multi-entry case is reachable without a
hand-built netlink message.

vxlan_vnifilter_dump_replay() builds a contiguous run twice the limit
from two requests, then replays every range the dump reports into a
second device and requires all to be accepted and the two dumps to
match. Without the dump clamp the run dumps as one over-limit entry that
replay rejects; with it the run dumps as limit-sized entries that
replay.

vxlan_vnifilter_api() had no teardown of its own device and namespace;
add veth-host and the test netns to cleanup(), which runs on EXIT, so a
failing case does not leave them or its entries behind.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: assert the dump is non-empty before replay, so
the replay case cannot pass vacuously; rebased.

 .../selftests/net/test_vxlan_vnifiltering.sh  | 119 +++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
index 6fb5af013dac..bb35e89d2d03 100755
--- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
+++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
@@ -84,6 +84,7 @@ ret=0
 # all tests in this script. Can be overridden with -t option
 TESTS="
 	vxlan_vnifilter_api
+	vxlan_vnifilter_dump_replay
 	vxlan_vnifilter_datapath
 	vxlan_vnifilter_datapath_pervni
 	vxlan_vnifilter_datapath_mgroup
@@ -139,8 +140,9 @@ check_vm_connectivity() {
 cleanup() {
 	ip link del veth-hv-1 2>/dev/null || true
 	ip link del vethhv-11 vethhv-12 vethhv-21 vethhv-22 2>/dev/null || true
+	ip link del veth-host 2>/dev/null || true
 
-	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32
+	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32 $testns
 }
 
 trap cleanup EXIT
@@ -347,6 +349,121 @@ vxlan_vnifilter_api()
 	# change vxlan vnifilter flag
 	run_cmd "ip -netns $testns link set dev vxlan-ext1 type vxlan external novnifilter"
 	log_test $? 2 "Cannot unset vnifilter flag on a device"
+
+	# A single request may add at most 4096 VNIs. bridge(8) puts one
+	# VXLAN_VNIFILTER_ENTRY per comma-separated item into a single message,
+	# so both the single-entry and the multi-entry paths are reachable here.
+
+	# The largest accepted add, and one VNI more rejected.
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 10000-14095"
+	log_test $? 0 "Add a request of the maximum VNI count"
+
+	# The rejected oversized add must install nothing. Assert the range is
+	# absent first: vxlan_vni_add() folds an already-present VNI into the
+	# update path and returns 0, so a later probe cannot tell "installed
+	# nothing" from "installed part" unless it started absent.
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 20000"
+	log_test $? 1 "VNI 20000 absent before the oversized add"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 20000-24096"
+	log_test $? 255 "Cannot add a request over the maximum VNI count"
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 20000"
+	log_test $? 1 "The rejected oversized add installed nothing"
+
+	# Two entries each under the limit but summing over it: the per-message
+	# total is what is bounded, not the span of one entry. This is the shape
+	# a per-entry check would have let through.
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 30000"
+	log_test $? 1 "VNI 30000 absent before the oversized multi-entry add"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 30000-32047,32048-34097"
+	log_test $? 255 "Cannot add a multi-entry request summing over the maximum"
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 30000"
+	log_test $? 1 "The rejected multi-entry add installed nothing"
+
+	# The cap is symmetric: a delete may touch at most the maximum too.
+	# Install a maximum-size range and the VNI past it, so the max+1 delete
+	# below has every VNI present and can only be refused by the cap, not by
+	# a missing VNI.
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 40000-44095"
+	log_test $? 0 "Populate a maximum-size range to delete"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 44096"
+	log_test $? 0 "Add the VNI past the maximum range"
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 40000-44096"
+	log_test $? 255 "Cannot delete a request over the maximum VNI count"
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 40000-44095"
+	log_test $? 0 "Delete a request of the maximum VNI count"
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 44096"
+	log_test $? 0 "Delete the VNI past the maximum range"
+
+	# A within-cap delete of a never-installed range reaches the handler and
+	# fails there on the missing VNI, not on the cap.
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 50000-50010"
+	log_test $? 255 "Cannot delete a range that was never installed"
+
+	# A start above the end selects nothing and is accepted as a no-op.
+	# Use a VNI no earlier case installs, so the absence check is meaningful.
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 55000"
+	log_test $? 1 "VNI 55000 absent before the inverted range"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 55000-50000"
+	log_test $? 0 "An inverted range is accepted as a no-op"
+	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 55000"
+	log_test $? 1 "The inverted range installed nothing"
+
+	# The VXLAN header carries 24 bits. The bound is on both endpoints, so a
+	# range whose END alone leaves the space is rejected too.
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Add the highest VNI the header can carry"
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Delete the highest VNI the header can carry"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215-16777216"
+	log_test $? 255 "Cannot add a range whose END leaves the 24-bit space"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 100-4294967295"
+	log_test $? 255 "Cannot add a range whose END wraps past the 24-bit space"
+}
+
+# A device may hold a contiguous run longer than one request's limit, built
+# from several requests. The dump coalesces it, so the dump must break the run
+# into entries each no larger than the limit, or the configuration it reports
+# cannot be replayed. Install such a run, then feed every range the dump
+# reports back into a second device and require all to be accepted.
+vxlan_vnifilter_dump_replay()
+{
+	local opts="external vnifilter local 172.16.0.1 dev veth-testns"
+	local range rc=0 src_ranges dst_ranges
+
+	cleanup_vnifilter_api &>/dev/null
+	setup_vnifilter_api
+
+	# The destination is on a different dstport so re-adding the same VNIs
+	# does not collide with the source under vxlan_vni_in_use().
+	run_cmd "ip -netns $testns link add vxlan-src type vxlan $opts dstport 4789"
+	log_test $? 0 "dump/replay: create source device"
+	run_cmd "ip -netns $testns link add vxlan-dst type vxlan $opts dstport 4790"
+	log_test $? 0 "dump/replay: create destination device"
+
+	# 8192 contiguous VNIs sharing the default remote: one run, twice the
+	# limit, installed in two accepted requests.
+	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 10000-14095"
+	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 14096-18191"
+	log_test $? 0 "dump/replay: populate a run larger than the limit"
+
+	# Assert the dump is non-empty before replaying it, so an empty or
+	# failed dump cannot let the replay check below pass without testing
+	# anything.
+	src_ranges=$(bridge -netns $testns vni show dev vxlan-src | \
+		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
+	test -n "$src_ranges"
+	log_test $? 0 "dump/replay: source dump is non-empty"
+
+	for range in $src_ranges; do
+		bridge -netns $testns vni add dev vxlan-dst vni "$range" \
+			2>/dev/null || rc=$?
+	done
+	log_test $rc 0 "dump/replay: every dumped entry is accepted on replay"
+
+	dst_ranges=$(bridge -netns $testns vni show dev vxlan-dst | \
+		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
+	[ "$src_ranges" = "$dst_ranges" ]
+	log_test $? 0 "dump/replay: source and destination dump the same ranges"
 }
 
 # Sanity test vnifilter datapath
-- 
2.53.0

