Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34969396D13
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898224; cv=none; b=EZw4jszz6R11+qk9LPmY+l5gzdfRSfMULvA47J0eLAGMwTivNZpP6Y+1lyqIlnLQhAsxx6ncLyQiFhY981YFOVDNvp2smWFg4kVIqKcbZ8quI74QqYtYPFd/Gr9anLNsd4VwAi+SL926eyEja+S62CFSSu1tx+bTvca5GPcduak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898224; c=relaxed/simple;
	bh=cT/13qstn8/nOhBjQXRq0PqqXbdhTgppzUWbgSGQO70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGbLpqqr1qZtrTVUgxRqQfH6hY9hOL0kBpbJd+k75ovzc0VKxhlK2MGcOKvHqVcXXLF0kP+TLNRauXjbOAQ8WrRcQs/DBHyLe1+YmiFIKjxG5HAg7yexyy22YrbaG6R6lvgXDuJt63og21sTwm9x7cOKCGiQ2esMdEI+RV7fxJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8aaPRcY; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8aaPRcY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so1219158a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774898222; x=1775503022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f2zrKZrRaGjASZcWc6dPmrf+99AFfJekwpd+WSzFDo=;
        b=d8aaPRcYZSX7vySqHaQcFAOVSDfstKn2CX6UHyPseriRxIDyX9/Y93+rJWIWVawSxV
         +sQpksv8RIa/yE5NuYRlq5XRqQb+QTAfTHiKu7x4Cc8R0Nk64lxPTyaJCbMFKOC/C1cr
         NLKWHEBc/SqahVRsExjxPCTpnq2Ek3LSx4KSzohpB/AIzZmUFxgfLbtjnjf1+7p7jD6i
         Y/TbsfLvj90l/dKQzUubJEsLXh2E8XfBalxK/3LiuBwHDs8S+3S2PvEkalI/WPDvTRmd
         PzmEbOrDl0HnVLOx/5vPzcHyeEVk/GxxGOABa/Xw6byIWOVHrz3FB8FFvEFtUJRNRdx9
         rg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774898222; x=1775503022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5f2zrKZrRaGjASZcWc6dPmrf+99AFfJekwpd+WSzFDo=;
        b=kd+Babvek6ddZbcF2vyjL5fTwcVFwPS+3d2v1fNEYaUFYZFQutAzY9wubhQTI+BdDr
         cIilUxns3EYVfPd3o5O69EAkgq6uhsS+lOZUCi8w1LEUtta2ubBT5VAD56oVYtx/lWGP
         HZ3hxaPl7JxFlvYIL9OQP+L0kM6sPxC4jr4bvWH8L43xftSLZf+8y8ELGiSLuhZj65D6
         B3eHvoCFNmutdtj6Raw6UFq/HIJUKyMt8dhgwXoDt/sEPd56EJ2DxlVEqyS9aeL2rrbK
         IaCn7KUbdMVLhKtDeIRH+MjxRod456XTjIOyQyiqF55dcRS4rAUU0+ryePmpGfMfNCgn
         hGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbcOC/mboyMigbAet3amvYfLpLqQQ7PvWmKTg64pKg7yz7cpHH6vndkcoHlvk5vV9mW8p7Xk+1ZkjHmR9cE6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyITfhYkheT+QnJtuDYVGD9p/ZcwVZCG7JhdPBfLW3G+j/P0HUT
	GzDBAgE7UlzBGzLmwWWJ+aGpyPtCA1vHBJd/Zw178WGUxe+xbgx+6WzB
X-Gm-Gg: ATEYQzyuNM9q0j2BiKrsOOybvJTm5jsPRmQFKjKQiY1P0nfYUnzhwCRRrQEEY87Sk5v
	8k+UA4CUl9lXtp2Lowfaqe7Xlm12BCXly/joxKKRCd8qXdEQx/JIL5IBMZ79zqdzFTu+ooGStyV
	Aq3FDcWcx7nAMES3VI6qdQwI0XHnO4mKjD1TgJRPCxT4pl7oPPBqixHYFHrww0TbuJ+KM7kZ52K
	UbzL0QEunapvzLxyxqBw2efkkF+bvel19BGqcmGEd2bmUvEj9SSBVWjirZiJo8+lXXbkt/++/qj
	RHhdCgRVs3CLs8su5/MpITNA3WCVP63C3zYHxtuhb2q5ST06pin0vYYkQ3m2cNijshpV+pEQU9/
	TMlF1oXEWkx07ewQDCIDvh/ENdO7V4gysbMFil3upj341/4TUAzVC7E7f00mJiY4n5i1q0fMhsI
	iYT7v6ZMKONza8098ZzcOuKiIs3BWpkfk2x8KEPYZz
X-Received: by 2002:a17:90b:3cce:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35c3000c6f0mr12496361a91.12.1774898222332;
        Mon, 30 Mar 2026 12:17:02 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm9627178a91.17.2026.03.30.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:17:01 -0700 (PDT)
From: Ujjal Roy <royujjal@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Yong Wang <yongwang@nvidia.com>,
	Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 5/5] selftests: net: bridge: add tests for igmpv3 MRC and QQIC validation
Date: Mon, 30 Mar 2026 19:16:11 +0000
Message-ID: <20260330191611.16929-6-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330191611.16929-1-royujjal@gmail.com>
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
 <20260330191611.16929-1-royujjal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bridge selftests that configure IGMPv3 parameters and validate the
resulting Query packet fields for Max Resp Code (MRC) and Querier Query
Interval Code (QQIC).

This also adds helper binary to encode floating-point exponential fields.

Future extensions may cover corresponding IPv6 cases.

Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 .../selftests/net/forwarding/.gitignore       |   2 +
 .../testing/selftests/net/forwarding/Makefile |  10 ++
 .../selftests/net/forwarding/bridge_igmp.sh   | 109 ++++++++++++++++++
 .../selftests/net/forwarding/mc_decode.c      |  38 ++++++
 .../selftests/net/forwarding/mc_encode.c      |  40 +++++++
 5 files changed, 199 insertions(+)
 create mode 100644 tools/testing/selftests/net/forwarding/mc_decode.c
 create mode 100644 tools/testing/selftests/net/forwarding/mc_encode.c

diff --git a/tools/testing/selftests/net/forwarding/.gitignore b/tools/testing/selftests/net/forwarding/.gitignore
index 418ff96c52ef..aa0c7f1afb4b 100644
--- a/tools/testing/selftests/net/forwarding/.gitignore
+++ b/tools/testing/selftests/net/forwarding/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 forwarding.config
 ipmr
+mc_encode
+mc_decode
diff --git a/tools/testing/selftests/net/forwarding/Makefile b/tools/testing/selftests/net/forwarding/Makefile
index bbaf4d937dd8..a26da846632d 100644
--- a/tools/testing/selftests/net/forwarding/Makefile
+++ b/tools/testing/selftests/net/forwarding/Makefile
@@ -1,5 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0+ OR MIT
 
+top_srcdir = ../../../../..
+
+CFLAGS += -Wall -Wl,--no-as-needed -O2 -g -I$(top_srcdir)/usr/include $(KHDR_INCLUDES)
+CFLAGS += -I$(top_srcdir)/tools/include
+
+TEST_GEN_FILES := \
+	mc_encode \
+	mc_decode \
+# end of TEST_GEN_FILES
+
 TEST_PROGS := \
 	bridge_activity_notify.sh \
 	bridge_fdb_learning_limit.sh \
diff --git a/tools/testing/selftests/net/forwarding/bridge_igmp.sh b/tools/testing/selftests/net/forwarding/bridge_igmp.sh
index d4e7dd659354..9841c4e4eca0 100755
--- a/tools/testing/selftests/net/forwarding/bridge_igmp.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_igmp.sh
@@ -2,6 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 ALL_TESTS="
+	v3query_mrc_test
+	v3query_qqic_test
 	v2reportleave_test
 	v3include_test
 	v3inc_allow_test
@@ -84,6 +86,7 @@ switch_destroy()
 {
 	ip link set dev $swp2 down
 	ip link set dev $swp1 down
+	ip link set dev br0 down
 
 	ip link del dev br0
 }
@@ -116,6 +119,112 @@ cleanup()
 	vrf_cleanup
 }
 
+check_binary()
+{
+	local cmd=$1; shift
+	local args=$@
+
+	if [[ ! -x "$(command -v "$cmd")" ]]; then
+		log_test_skip "$args $cmd not found"
+		return $EXIT_STATUS
+	fi
+}
+
+tcpdump_show_with_filter()
+{
+	local if_name=$1; shift
+	local filter=$@
+
+	tcpdump -e -n -r ${capfile[$if_name]} "$filter" 2>&1
+}
+
+validate_query()
+{
+	local if_name=$1; shift
+	local test="$1"; shift
+	local value="$1"; shift
+	local pattern=""
+	local field_val=""
+	local pos=""
+	local msg="IGMPv3 query: verify $test"
+	check_command tshark || return 1
+	check_binary "./mc_encode" $msg || return 1
+
+	if [ "$test" = "MRC" ]; then
+		pos=1 # MRC field offset within IGMP header
+		field_val=$(tshark -r ${capfile[$if_name]} -Y "igmp.type==0x11" \
+			   -V 2>/dev/null | grep "Max Resp Time")
+	elif [ "$test" = "QQIC" ]; then
+		pos=9 # QQIC field offset within IGMP header
+		field_val=$(tshark -r ${capfile[$if_name]} -Y "igmp.type==0x11" \
+			   -V 2>/dev/null | grep "QQIC")
+	fi
+
+	local enc_val=$(./mc_encode $value)
+	pattern="ip proto 2 and igmp[0] == 0x11 and igmp[$pos] == $enc_val"
+	local opt_str=""
+	tcpdump_show_with_filter $if_name $pattern | grep -q "igmp query v3"
+	ret=$?
+	if [ "$field_val" != "" -a $ret -ne 0 ]; then
+		opt_str="Bad $test value in IGMP packet: $field_val"
+	fi
+	check_err $ret "$opt_str"
+
+	log_test "$msg" "configured=$value, expected=$enc_val"
+}
+
+v3query_mrc_test()
+{
+	RET=0
+	local qri_val=160
+	local br_qri=$((qri_val*10))
+
+	# Set MRT to validate
+	ip link set dev br0 type bridge mcast_query_interval 12500 \
+					mcast_query_response_interval $br_qri \
+					mcast_igmp_version 3
+	check_err $? "IGMPv3 QUERY bridge configuration failed"
+
+	ip link set dev br0 down
+	tcpdump_start $h2
+	ip link set dev br0 up
+	sleep 2
+	tcpdump_stop $h2
+
+	validate_query $h2 "MRC" $qri_val
+	tcpdump_cleanup $h2
+
+	ip link set dev br0 type bridge mcast_query_interval 12500 \
+					mcast_query_response_interval 1000 \
+					mcast_igmp_version 2
+}
+
+v3query_qqic_test()
+{
+	RET=0
+	local qqi_val=160
+	local br_qqi=$((qqi_val*100))
+
+	# Set QQIC to validate
+	ip link set dev br0 type bridge mcast_query_interval $br_qqi \
+					mcast_query_response_interval 1000 \
+					mcast_igmp_version 3
+	check_err $? "IGMPv3 QUERY bridge configuration failed"
+
+	ip link set dev br0 down
+	tcpdump_start $h2
+	ip link set dev br0 up
+	sleep 2
+	tcpdump_stop $h2
+
+	validate_query $h2 "QQIC" $qqi_val
+	tcpdump_cleanup $h2
+
+	ip link set dev br0 type bridge mcast_query_interval 12500 \
+					mcast_query_response_interval 1000 \
+					mcast_igmp_version 2
+}
+
 v2reportleave_test()
 {
 	RET=0
diff --git a/tools/testing/selftests/net/forwarding/mc_decode.c b/tools/testing/selftests/net/forwarding/mc_decode.c
new file mode 100644
index 000000000000..5b626101497d
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mc_decode.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include <stdlib.h>
+#include <linux/bitops.h>
+
+#define IGMPV3_FP_EXP(value)            (((value) >> 4) & 0x07)
+#define IGMPV3_FP_MAN(value)            ((value) & 0x0f)
+
+/* IGMPV3 floating-point exponential field threshold */
+#define IGMPV3_EXP_MIN_THRESHOLD        128
+
+static inline unsigned long decode_field(const u8 code)
+{
+    /* RFC3376, relevant sections:
+     *  - 4.1.1. Maximum Response Code
+     *  - 4.1.7. QQIC (Querier's Query Interval Code)
+     */
+    if (code < IGMPV3_EXP_MIN_THRESHOLD) {
+        return (unsigned long)code;
+    } else {
+        unsigned long mc_man, mc_exp;
+        mc_exp = IGMPV3_FP_EXP(code);
+        mc_man = IGMPV3_FP_MAN(code);
+        return ((mc_man | 0x10) << (mc_exp + 3));
+    }
+}
+
+int main(int argc, char *argv[])
+{
+    uint8_t qqic = 0;
+    if (argc >= 2)
+        qqic = atoi(argv[1]);
+    unsigned long qqi = decode_field(qqic);
+
+    printf("%lu\n", qqi);
+
+    return 0;
+}
diff --git a/tools/testing/selftests/net/forwarding/mc_encode.c b/tools/testing/selftests/net/forwarding/mc_encode.c
new file mode 100644
index 000000000000..a2183b864be4
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mc_encode.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include <stdlib.h>
+#include <linux/bitops.h>
+
+/* IGMPV3 floating-point exponential field threshold */
+#define IGMPV3_EXP_MIN_THRESHOLD        128
+/* Max representable (mant = 0xF, exp = 7) -> 31744 */
+#define IGMPV3_EXP_MAX_THRESHOLD        31744
+
+static inline uint8_t encode_field(unsigned int value)
+{
+    uint8_t mc_exp, mc_man;
+
+    /* RFC3376: QQIC/MRC < 128 is literal */
+    if (value < IGMPV3_EXP_MIN_THRESHOLD)
+        return (uint8_t)value;
+
+    /* Saturate at max representable (mant = 0xF, exp = 7) -> 31744 */
+    if (value >= IGMPV3_EXP_MAX_THRESHOLD)
+        return 0xFF;
+
+    mc_exp  = (uint8_t)(fls(value) - 8);
+    mc_man = (uint8_t)((value >> (mc_exp + 3)) & 0x0F);
+
+    return 0x80 | (mc_exp << 4) | mc_man;
+}
+
+int main(int argc, char *argv[])
+{
+    unsigned int qqi = 0;
+    if (argc >= 2)
+        qqi = atoi(argv[1]);
+
+    uint8_t qqic = encode_field(qqi);
+
+    printf("%u\n", qqic);
+
+    return 0;
+}
-- 
2.43.0

