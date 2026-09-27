Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889F93CB918
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546057; cv=none; b=uyeqq6q+EOeW4wdRG46lBV0DTkhRFk9tcT77fUR5Cg9bUlcBhpr4NGtha+Wh/5MFSPwqCUCPojkofC49b5XjGjGQtpRLKkyPMVh8kKKYId8w8RekkW3RgEMDIaspJ2+HSdScmZoDB8zpu0l8K/LXnM+FMWVcyFspjg9CG3h7+nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546057; c=relaxed/simple;
	bh=Lfxdl5FHI9p0iRHS5UbPOIM60iTEgOcCPeyqVKZDtdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXCaquCGPE1rkIe1tTcYKwx+O44rcL7N7VNdI8ij9kcRMA9vFLVsdm0H9/Ieg7GMFABz56TTK0k/rkZ0M5qPotRhf/nowW5chbMkyvZzPKXZzLbDl/40sNSeV+f5yzoKkEWsSzPqZFOw0wsnlJr4Zi81Bdk+7kLp71fFO2loBBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phOgc6Eo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phOgc6Eo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so13240195e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546050; x=1791150850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/WHvsIO5Y+Y96SRnZS9/e4Q5LXfwyvIQtvUTuw0f7U=;
        b=phOgc6EoAdIzvaqg5iPhsxSotT4GCXZNVdTdGB7TBEt5XvbagQ8Y1Di995i7LWbDpo
         7hWffigVb2hQHRKQbv7MiO2w5D1IeYRpoqs/YFuAs/zISdEVLlVmw3rIghY2MsdthXRI
         7OH/CnV14wwlURKBo6iHiZNS5lsT6J5bMcy6nsXWCjMTAxhc2DBgBIx75CEun1Ivta4+
         DBtmgl+O7BRe7QemYZ/I74cp/KqQt1DOIWypSTpS+0l63m3KNhS52JrIOsttPeqMmiGS
         KB4+7xoe++dD81PJF+4LVDqX8N+FrA8qPD7n3fwSxm6TFYTTc+35kR54FQCs7VAQ+kUc
         p90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546050; x=1791150850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/WHvsIO5Y+Y96SRnZS9/e4Q5LXfwyvIQtvUTuw0f7U=;
        b=AxPdIu34BUTXoRfpWIEerQCQI5s7yuESMDHmntH/eqoxJcz0WXlDNg3jUbo6bSUHdb
         jjw2r9BrTd0HpNWVQ7sOTpJdZrTi4VVnvjqGX0jLBMqRUp7BEXVX4DRhZvy16vf/BP1V
         0rxZrfubEsmfarlpahupqRgPNnXdWzxHyADz3O0YEaJuOB9z6EPegcfnpyj6ljI7eodf
         M6w1J+BCVLKQt/Mg+mpxJrapSKcJK1HqfE+V+z5dIGb7+orXpTnGRTJmexACrpO5lInE
         i4GnyOj2AdpRvl91s8dgzNZ8aTmm1TeiG6J7K+7sjVJxAs2Ao/Q7Fu/QKFLow0314tRW
         vWLg==
X-Forwarded-Encrypted: i=1; AKwUvByyx9VflWh1ZkFJU+SQr+co5BRYfy1eqjGFHU//2tYUQCg8Ne+GBcaWJSliZiZB+j7t8viwEqBNWVfqgWoc2SY=@vger.kernel.org
X-Gm-Message-State: AFuF++mBRVn+j8oBzjTFL4escZWUvEQUS1dKF/P1SgfTBbJReQy1j0nF
	Jl2mScprA/s0n1CK00QsXPckczl1kr86eHTfmhQSf3k46C7GMBNqsNUSMA9+KTpYgXQ=
X-Gm-Gg: AYBFou113np9NRmr7lG4Ryw2A2QjtlU2McWCfPddwhZ7LKVYcvhMDGlM7QEXg8ixU8g
	SoZnNU3O4ay8XIw85W7ALqYpdaHzzgCRvqfG2zarqi3m8r6rdxD15C8B6D7a+xESErcgcGSflD1
	pIdxQ0eJINxRBjCZFdxyzF4XIGam6j2OwnvIEOE+sPMDVwgfSAa2w6YFUjIrljJtWhj/KKks0OE
	8HI8TBv4Mkp0iXWSXeMgKHxua1EQi9jz7eG6d4M4n8Ch4XILpcCnFvq3sveMF30d45arcOXk1mr
	xW/Uvci+t0g0ZHQ3KIYeIzK3bj01d+h/6GOrqwBVazXzqejPRYEdWuWtJUT3P/1cIkSkRfItS7N
	vnBu6uwkMnYFULc08lxRiDQr68n3JLMNPS+8vc5BeFD5nTfHneY+VD0tVxBGdKl8zIQzuV1lDuF
	noXZV5Pip7Nb+vYnw0KJRf4bNnRFubhJ0Dv47XCWIyXsv6Rq97kXNOsE9lIoFkzSPT/+VGJsOks
	A==
X-Received: by 2002:a05:600c:3ba9:b0:49f:fe48:d177 with SMTP id 5b1f17b1804b1-49ffe48d294mr86161315e9.32.1790546049505;
        Sun, 27 Sep 2026 14:54:09 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:54:09 -0700 (PDT)
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
Subject: [PATCH net-next v3 6/6] selftests: net: test the vxlan vnifilter request limit and dump replay
Date: Mon, 28 Sep 2026 00:52:09 +0300
Message-ID: <20260927215209.2581830-7-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
References: <20260927215209.2581830-1-alishmery18@gmail.com>
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

Notes:
    v3: was 5/5. Add the request-limit, 24-bit-range, symmetric-delete and dump/replay cases; give the test its own netns teardown.

 .../selftests/net/test_vxlan_vnifiltering.sh  | 114 +++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
index 8deacc565afa..f48bc861bb88 100755
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
@@ -163,8 +164,9 @@ check_vm_connectivity() {
 cleanup() {
 	ip link del veth-hv-1 2>/dev/null || true
 	ip link del vethhv-11 vethhv-12 vethhv-21 vethhv-22 2>/dev/null || true
+	ip link del veth-host 2>/dev/null || true
 
-	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32
+	cleanup_ns $hv_1 $hv_2 $vm_11 $vm_21 $vm_12 $vm_22 $vm_31 $vm_32 $testns
 }
 
 trap cleanup EXIT
@@ -371,6 +373,116 @@ vxlan_vnifilter_api()
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
+	for range in $(bridge -netns $testns vni show dev vxlan-src | \
+		       grep -oE '[0-9]+-[0-9]+|[0-9]{2,}'); do
+		bridge -netns $testns vni add dev vxlan-dst vni "$range" \
+			2>/dev/null || rc=$?
+	done
+	log_test $rc 0 "dump/replay: every dumped entry is accepted on replay"
+
+	src_ranges=$(bridge -netns $testns vni show dev vxlan-src | \
+		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
+	dst_ranges=$(bridge -netns $testns vni show dev vxlan-dst | \
+		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
+	[ -n "$src_ranges" ] && [ "$src_ranges" = "$dst_ranges" ]
+	log_test $? 0 "dump/replay: source and destination dump the same ranges"
 }
 
 # Sanity test vnifilter datapath
-- 
2.53.0

