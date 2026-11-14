Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694561;
	b=5qdcRKE36ZE+qjKC5hDIzsJO+phBrZ8XjzIyLE3kVZBEfW1S7uj/OUNeY9rYC5pVx1oS
	 M84YCmL5b8ZstTTaQs2toi3dlPV71P539qNP76Gbc3aSQmwljJjRwW+gZPmZz6CnPI4Of
	 nCswTXi7jY0+b+QQeC3diQP9ayTufXQeePJzq/IksEk+CZGyFavH+vR9T0tApOToD8afY
	 BVINFaewM+CEKNre2acogxm/4jj+Qmft6tzAxPF5o89kNaP0ZB82AVSIj7VKH/n8HSCPp
	 HoL5QXDbD1DTgh8E1hyi84Hiy1m9tQruf3I3avQrG0nSuv0aUOGPJC8DVcZSZudERlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vVFQu5tmbsGUy5eDDIaYC2PNXdJQ/xEX0QGUSt8uN7Y=;
	b=r9F5y+pT9wfp/RqrhCGc/vptD0frok1hVlADepcTuy6mSXtjA2ovv2NVzEivr4a7w9Ge
	 SLn57/0Xa+fNjiqpRnVSP7WpdX3KBUd8i3OYIjsFBT0hyPvBUL+owSlNzIbqRUbW5t0WS
	 uPSkjozp504jFEol64G/ZW/TvY8KlgMMjv/e0hNXdRGSRFKUTLzHA3ryrz1yaN0ISoLap
	 BHXdsMEBiB3p2JKHP2b4efK2nU3kPXih+IK2skp9E2JhyIIZlfqj+eMHMqfWW7nmMO+6k
	 wuH38t5T9mJ+lDZqPAqlbjuR8gJLAlk7lgFXQ71gif+KKLb3mx12LC6DXMXGSNdYrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+8qV9Dl;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68900606A8AE
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68900606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+8qV9Dl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2552991f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694559; x=1795299359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVFQu5tmbsGUy5eDDIaYC2PNXdJQ/xEX0QGUSt8uN7Y=;
        b=V+8qV9Dl3l/bisIEe2xrnamURGQ+S2e+aTIrbgzpgAMmD+00Ks2W403SUDBmmBlfws
         IZI2j+5Uejpm5+eFwoL8FP6QGrvMj2BTgK+XvQPSWDKYSzbcl1Evt+6w14RxHaKpr4jY
         7SeejsusyIMA2VvExhEf3/hQ/X52UBeU5WO1z3YNkPFwwrvqTu7pJ8J5oHeqZeo/giEk
         lGoO2UpsIk8djcIg5RjyWYGcsIGViqxeajdETOfcR3RITMAs1iFeJsNX1E2FCKFUl4/Y
         eAuO9Fclbe10eyxGw+PmGNiN0MewPeuLPWAIizWBp9csGER7plurI3/DG0NKVgJVmbEg
         XjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694559; x=1795299359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVFQu5tmbsGUy5eDDIaYC2PNXdJQ/xEX0QGUSt8uN7Y=;
        b=Cj8KHDkf3oBL0BGOhrzVX2RlwGfW44Vy6v/6AIBdsnw5BOX8SoPbVsaXbfaQGE8IoN
         knbgXib0jiWz8vTbQHEFiGB7sQ4zbpNZhdQzNhvN3oCS4W/SPkXI0oHW2Z1saro1cCi/
         Eq3NvLca6MPzS85fxaP6Ve7etSeXLCj1COnZDKrMgerKGGJMFgL++BpJEkEKvP5ydCAN
         Y4orjDifNxbU13EgHjTsU/INywN/qzCkIS8uEbqowJ0TjyV9LYXY2HHiEzCfH6sm36sV
         2Ni54G7H1aZb9y0IoPtAdkCagCDtWg3l7nuUV+tgoe4g5h6cNbYlsUzYaWaDKDc5zoca
         LaOQ==
X-Forwarded-Encrypted: i=1; AL+hErGRTNHG+ovPK5CqqbwnPa60C/I/Bths1IJ2aaS38RpykO0xcyotJrjq5u2OY2vLm3UV3OFemqY5ATYAaZWCHKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jhrc1P3CSxflJWrpdYwOeAiYbBbiecHK0TJzxQpvbPOZXuntx
	KFDbWtHpzwQpOJWXzlNMAFlwENXzLR5zPl716vRMjR2zhPHUAILE2cdH
X-Gm-Gg: AYBFou2AhrDhR7ijEwC5P6ksooYu7sQz0nMULKKJxvlSuOd9lK1nttbymh+halfaXGf
	yNJThNQjgVutV58aHmmiN8+38fuoICadM/6xvOBr30zoPG8doOTc4siwjsZlyHLghv/hpx8b7lm
	aPFOAkwZZNr5XSU5gZ0uTKitsCGsoPcDNMmhSHvV4yPyMEcHVcqwjDtOVhDtRvgzWKgnrEXuYcK
	2FrGrQEVYCBkE+xIJP6kZ/AgBcKwVIQa00+y3XY5Nu90BuFRKcQadOlwifZCzC12fFm9qzVJjgw
	65y04mFdUqwycJKu2OCicrBz3bNIeBkNjp9TmzbDT885VY4ALL2x5IWHebfk8Wdkrt9RIuJdeVn
	2jbRwNpUSfgvgRRnAoi6T+P3KvD98lSXomwRFBXELQjoZ3L18jfTuhktNBf6yEcOhFCovAI4azW
	m7DHYb+EzMjHVDnrvSCtBviZsZyAysVidXBNLB5MWZSKO0s9v85lvL87VgnLibtKWlCFKasn1J5
	FjP8pyVMm8gkp2g4FpZeguRN3HnP9AMY0IWRGwslv1hoDWq7gsfP9Z978buDZiO4SH1wsVOuurm
	zmbSMsahSYQbIsDIWP4WCIk=
X-Received: by 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr10700834f8f.12.1794694558600;
        Sat, 14 Nov 2026 14:15:58 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:58 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 8/8] selftests: net: test the vxlan vnifilter request limit and dump replay
Date: Sun, 15 Nov 2026 01:14:12 +0300
Message-ID: <20261114221412.255825-9-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

Extend the vnifilter tests for the request-size limit, the 24-bit VNI
range, the dump/replay round trip the limit requires, the rollback of a
VNI add that fails, and an FDB update that is refused.

The API test gains: the largest accepted add and one VNI past it; a
rejected oversized add and a rejected multi-entry add whose entries are
each under the limit but sum over it, each checked to install nothing
(the range is asserted absent first, since vxlan_vni_add() folds an
existing VNI into the update path and would return 0 either way). The cap
is symmetric, so it also checks a maximum-size delete accepted and a
max+1 delete rejected, with every VNI in the max+1 range installed first
so the refusal can only come from the cap; a within-cap delete of a
never-installed range, which must fail on the missing VNI; and an
inverted range accepted as a no-op. The 24-bit bound is checked on each
endpoint alone: a lone VNI past the space is sent as START only and is
refused only by the START bound, and a two-VNI range from a valid START
is refused only by the END bound. The absence probes use vni_listed(),
which fails when "bridge vni show" itself fails, so a failed show cannot
pass for "absent".

vxlan_vnifilter_dump_replay() builds a contiguous run twice the limit
from two requests, each checked on its own, and requires the dump to
report exactly 10000-14095 and 14096-18191. It then replays every
reported range into a second device and requires all to be accepted and
the two dumps to match. bridge(8) prints entries, not netlink messages,
and no YNL spec covers RTM_GETTUNNEL, so this replays one entry per
request and cannot see the per-message budget of "vxlan: vnifilter:
clamp the dumped VNI range to the request limit"; that budget was
checked with raw netlink outside the tree.

vxlan_vnifilter_add_rollback() drives, without a memory cgroup, both
failures that "vxlan: vnifilter: roll back a VNI add that fails" undoes:
a VNI whose default FDB entry does not fit under maxaddress, and a VNI
whose group join would exceed net.ipv4.igmp_max_memberships. Each add
must fail and leave the VNI absent.

vxlan_vnifilter_refused_fdb_update() covers "vxlan: leave FDB state and
flags unchanged when an update fails". On a device with ageing 1, a
replace of a VNI's permanent default entry with a dynamic one must be
refused and leave the entry permanent: a dynamic entry added after it
is aged out first, which bounds the wait, and the default entry must
still be listed as permanent. Without that patch the refused replace
leaves the entry dynamic and the same ageing pass deletes it. The case
checks the end state only: a refused request that changed the state
and put it back before returning would pass it too, and only an ageing
pass running at that moment could tell the two apart.

vxlan_vnifilter_api() had no teardown of its own device and namespace;
add veth-host and the test netns to cleanup(), which runs on EXIT, so a
failing case does not leave them or its entries behind.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: absence probes fail when "bridge vni show" fails; each populate step
is logged; the dump is checked against the literal split; replay uses
its own result variable; START-only and END-only out-of-range cases
replace 100-4294967295, which the request cap refuses with or without
the END bound; new rollback cases (review of v4); a refused replace of a
VNI's permanent default entry must leave it permanent through an ageing
pass; lines wrapped to 80 columns. v4: assert the dump is non-empty
before replay, so the replay case cannot pass vacuously; rebased.

 .../selftests/net/test_vxlan_vnifiltering.sh  | 246 +++++++++++++++++-
 1 file changed, 245 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
index 6fb5af013dac..fb8401399b09 100755
--- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
+++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
@@ -84,6 +84,9 @@ ret=0
 # all tests in this script. Can be overridden with -t option
 TESTS="
 	vxlan_vnifilter_api
+	vxlan_vnifilter_dump_replay
+	vxlan_vnifilter_add_rollback
+	vxlan_vnifilter_refused_fdb_update
 	vxlan_vnifilter_datapath
 	vxlan_vnifilter_datapath_pervni
 	vxlan_vnifilter_datapath_mgroup
@@ -139,8 +142,9 @@ check_vm_connectivity() {
 cleanup() {
 	ip link del veth-hv-1 2>/dev/null || true
 	ip link del vethhv-11 vethhv-12 vethhv-21 vethhv-22 2>/dev/null || true
+	ip link del veth-host 2>/dev/null || true
 
-	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32
+	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32 $testns
 }
 
 trap cleanup EXIT
@@ -285,6 +289,37 @@ cleanup_vnifilter_api()
 	ip netns del $testns 2>/dev/null || true
 }
 
+# Succeed if "bridge vni show" lists VNI $2 on device $1. A failed show
+# returns 2, so a probe expecting the VNI to be absent cannot pass on it.
+vni_listed()
+{
+	local out
+
+	out=$(bridge -netns $testns vni show dev $1) || return 2
+	grep -qw "$2" <<< "$out"
+}
+
+# Print the VNI ranges "bridge vni show" reports for device $1, sorted;
+# fail if the show itself fails.
+vni_ranges()
+{
+	local out
+
+	out=$(bridge -netns $testns vni show dev $1) || return 1
+	grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' <<< "$out" | sort
+}
+
+# Succeed if "bridge fdb show" lists, on device $1, an entry whose line
+# matches the extended regex $2. A failed show returns 2, so a probe
+# expecting the entry to be absent cannot pass on it.
+fdb_listed()
+{
+	local out
+
+	out=$(bridge -netns $testns fdb show dev $1) || return 2
+	grep -qE "$2" <<< "$out"
+}
+
 # tests vxlan filtering api
 vxlan_vnifilter_api()
 {
@@ -347,6 +382,215 @@ vxlan_vnifilter_api()
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
+	run_cmd "vni_listed vxlan-ext1 20000"
+	log_test $? 1 "VNI 20000 absent before the oversized add"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 20000-24096"
+	log_test $? 255 "Cannot add a request over the maximum VNI count"
+	run_cmd "vni_listed vxlan-ext1 20000"
+	log_test $? 1 "The rejected oversized add installed nothing"
+
+	# Two entries each under the limit but summing over it: the per-message
+	# total is what is bounded, not the span of one entry. This is the shape
+	# a per-entry check would have let through.
+	run_cmd "vni_listed vxlan-ext1 30000"
+	log_test $? 1 "VNI 30000 absent before the oversized multi-entry add"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 \
+		 vni 30000-32047,32048-34097"
+	log_test $? 255 "Cannot add multiple entries summing over the maximum"
+	run_cmd "vni_listed vxlan-ext1 30000"
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
+	# Use a VNI no earlier case installs, so the absence check is
+	# meaningful.
+	run_cmd "vni_listed vxlan-ext1 55000"
+	log_test $? 1 "VNI 55000 absent before the inverted range"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 55000-50000"
+	log_test $? 0 "An inverted range is accepted as a no-op"
+	run_cmd "vni_listed vxlan-ext1 55000"
+	log_test $? 1 "The inverted range installed nothing"
+
+	# The VXLAN header carries 24 bits, and both endpoints are bounded. A
+	# lone VNI is sent as START only and spans one VNI, so only the START
+	# bound refuses it; a range from a valid START spans two VNIs, so only
+	# the END bound refuses it. Neither is large enough for the request
+	# limit to catch.
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Add the highest VNI the header can carry"
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Delete the highest VNI the header can carry"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777216"
+	log_test $? 255 "Cannot add a VNI past the 24-bit space"
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 \
+		 vni 16777215-16777216"
+	log_test $? 255 "Cannot add a range whose END leaves the 24-bit space"
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
+	local range replay_rc src_ranges dst_ranges
+
+	cleanup_vnifilter_api &>/dev/null
+	setup_vnifilter_api
+
+	# The destination is on a different dstport so re-adding the same VNIs
+	# does not collide with the source under vxlan_vni_in_use().
+	run_cmd "ip -netns $testns link add vxlan-src type vxlan $opts \
+		 dstport 4789"
+	log_test $? 0 "dump/replay: create source device"
+	run_cmd "ip -netns $testns link add vxlan-dst type vxlan $opts \
+		 dstport 4790"
+	log_test $? 0 "dump/replay: create destination device"
+
+	# 8192 contiguous VNIs sharing the default remote: one run, twice the
+	# limit, installed in two accepted requests.
+	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 10000-14095"
+	log_test $? 0 "dump/replay: populate the first half of the run"
+	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 14096-18191"
+	log_test $? 0 "dump/replay: populate the second half of the run"
+
+	# The run must come back split at the limit, exactly. Comparing with
+	# the literal split, not only with the replayed copy, also catches a
+	# dump that drops or repeats VNIs where it resumes.
+	src_ranges=$(vni_ranges vxlan-src)
+	log_test $? 0 "dump/replay: dump the source device"
+	[ "$src_ranges" = "$(printf '10000-14095\n14096-18191')" ]
+	log_test $? 0 "dump/replay: the run is dumped split at the limit"
+
+	# bridge(8) prints entries, not netlink messages, so this replays one
+	# entry per request; it does not see the per-message budget.
+	replay_rc=0
+	for range in $src_ranges; do
+		bridge -netns $testns vni add dev vxlan-dst vni "$range" \
+			2>/dev/null || replay_rc=$?
+	done
+	log_test $replay_rc 0 "dump/replay: replay accepts every dumped entry"
+
+	dst_ranges=$(vni_ranges vxlan-dst)
+	log_test $? 0 "dump/replay: dump the destination device"
+	[ "$src_ranges" = "$dst_ranges" ]
+	log_test $? 0 "dump/replay: source and destination dump the same ranges"
+}
+
+# A VNI whose add fails must not be left installed. Two steps can fail
+# after the VNI is published, and both are reachable without memory
+# pressure: installing its default FDB entry, once the device holds
+# maxaddress entries, and joining its group, once the socket holds
+# net.ipv4.igmp_max_memberships groups.
+vxlan_vnifilter_add_rollback()
+{
+	local opts="external vnifilter local 172.16.0.1 dev veth-testns"
+	local full="dstport 4789 remote 172.16.0.2 maxaddress 1"
+	local groups grp vni k fail=0
+
+	cleanup_vnifilter_api &>/dev/null
+	setup_vnifilter_api
+
+	# The device's own default entry uses up maxaddress 1, so no VNI that
+	# inherits the device remote can install its own.
+	run_cmd "ip -netns $testns link add vxlan-full type vxlan $opts $full"
+	log_test $? 0 "rollback: create a device with room for one FDB entry"
+	run_cmd "ip -netns $testns link set dev vxlan-full up"
+	run_cmd "bridge -netns $testns vni add dev vxlan-full vni 100"
+	log_test $? 255 "rollback: refuse a VNI whose FDB entry does not fit"
+	run_cmd "vni_listed vxlan-full 100"
+	log_test $? 1 "rollback: the VNI whose FDB entry failed is absent"
+
+	groups=$(ip netns exec $testns sysctl -n net.ipv4.igmp_max_memberships)
+	run_cmd "ip -netns $testns link add vxlan-mc type vxlan $opts \
+		 dstport 4790"
+	log_test $? 0 "rollback: create a device for multicast groups"
+	run_cmd "ip -netns $testns link set dev vxlan-mc up"
+	# VNIs above 255 so that no group address can match the VNI probe.
+	for k in $(seq 1 $groups); do
+		grp=239.1.$((k / 256)).$((k % 256))
+		bridge -netns $testns vni add dev vxlan-mc vni $((1000 + k)) \
+			group $grp 2>/dev/null || fail=1
+	done
+	log_test $fail 0 "rollback: join as many groups as the socket allows"
+	vni=$((1001 + groups))
+	run_cmd "bridge -netns $testns vni add dev vxlan-mc vni $vni \
+		 group 239.2.0.1"
+	log_test $? 255 "rollback: refuse a VNI whose group cannot be joined"
+	run_cmd "vni_listed vxlan-mc $vni"
+	log_test $? 1 "rollback: the VNI whose join failed is not installed"
+}
+
+# A refused FDB update must leave the entry's state as it was. Replacing a
+# VNI's permanent default (all-zeros) entry with a dynamic one is refused,
+# because only unicast entries can be replaced, so the entry must stay
+# permanent and survive ageing. A dynamic entry added after the refused
+# request is due for ageing no earlier than the default entry, so once it
+# has been aged out the default entry has been through the same pass. The
+# check is on the end state only: a request that changed the state and
+# put it back before returning would pass it too.
+vxlan_vnifilter_refused_fdb_update()
+{
+	local opts="external vnifilter local 172.16.0.1 dev veth-testns"
+	local zero="^00:00:00:00:00:00 dst 172.16.0.2 .*src_vni 100 .*self"
+	local mac=02:00:00:00:00:01
+
+	cleanup_vnifilter_api &>/dev/null
+	setup_vnifilter_api
+
+	run_cmd "ip -netns $testns link add vxlan-age type vxlan $opts \
+		 dstport 4789 ageing 1"
+	log_test $? 0 "refused update: create a device with ageing 1"
+	run_cmd "ip -netns $testns link set dev vxlan-age up"
+	run_cmd "bridge -netns $testns vni add dev vxlan-age vni 100 \
+		 remote 172.16.0.2"
+	log_test $? 0 "refused update: add a VNI with a remote"
+	run_cmd "fdb_listed vxlan-age '$zero permanent'"
+	log_test $? 0 "refused update: the VNI's default entry is permanent"
+	run_cmd "bridge -netns $testns fdb replace 00:00:00:00:00:00 \
+		 dev vxlan-age dst 172.16.0.3 src_vni 100 self dynamic"
+	log_test $? 255 "refused update: cannot replace the default entry"
+	run_cmd "bridge -netns $testns fdb add $mac dev vxlan-age \
+		 dst 172.16.0.4 src_vni 100 self dynamic"
+	log_test $? 0 "refused update: add a dynamic entry"
+	slowwait 25 eval "! fdb_listed vxlan-age '^$mac '"
+	log_test $? 0 "refused update: the dynamic entry is aged out"
+	run_cmd "fdb_listed vxlan-age '$zero permanent'"
+	log_test $? 0 "refused update: the default entry is still permanent"
 }
 
 # Sanity test vnifilter datapath
-- 
2.53.0

