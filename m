Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD34A0F04
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308003; cv=none; b=IERO2EYllO8aNatcmlSs0WD1UPh3KjJ+ZInUPUDXcl5bD54SxheXxUjdc9FkaN2Rs2dFsKJFyEuk2GzxkYzL+Y8VpzPPuMvCyGvMCMJrCiqDQD1DHZKGMgwXx+wnMroITWjMkcwkrIU+kguTddamE6fXhrrp0r3WxqAh+uUfZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308003; c=relaxed/simple;
	bh=kTgr8P/nHMLEmyjBo2BvdohBA5jClZbefuaaY9uAsrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBhVHfruyFdlkh/an5t9U2bKJbcM1pMkDziW9WSE3+tVoqE04AxnWDOeqPF+V7M8rZejZA+msbqwUFKJPlFGDcd9r/mGRITCHw4c9VG44+aTvUWp2nLaf65v9gRnwVPEyE+vYnFoqjfHCMb+Q/m2uXb4guQNemX7PIMXbpXn8XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=AEjHVivS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="AEjHVivS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c399641so10302565e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791308000; x=1791912800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cydJHqNsAliFhPASrleIpr3STINpYAHg93P+bPMs80o=;
        b=AEjHVivSJ+YedYBovT6GmaA8mndUir6AhdtlTYoCt3O7LESb5VAvg/Bo1gQmy+VYF+
         rwWALCSIJMH87foXZf7ynZziiTiMmzAdBjEopfwSJ9uMNbd/T7musXjQDcAzzKOwNFvr
         xT5VKQ8cslpJr3eurM24mDiSdB4KJ3xjWry6WaTPxEEk2ePQaq6sAOVO8hg8jLDq/8Ud
         LfKztFsfpPZpN01Rac+Ornu0f0lbGCkZ/jTZTFVEap7XgYzv5Awmq5YVhjMOEGsNmJ56
         Bazn5JyvMMG6siQ7CVT35FnEm0jLTqIix2Fxgv5ttzL8ppVwlFOrA8KvFpcYXRpW4HiZ
         f9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791308000; x=1791912800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cydJHqNsAliFhPASrleIpr3STINpYAHg93P+bPMs80o=;
        b=fVDCui5iKQcYJvsharShNI/51Jp4MBLjnDaSdYRxTdxVg7w79G+wTUltRJSexKwhhA
         Zf46kSKTH5sdvpDzE3kWauDca6E18t3GdktmGyHy693XDtg3Fjs6lp8MXyIck4A5JXVt
         lMw/YkWQURTkTgCNyCGkyVaFuR61+7bX6W+0/nAs61x/NN4s02xsf7xw/wntY+bj8ftN
         Hutyd7iu1PjJmzKeqxpwS2lz+ddjQtAvO/9c/ea6V+gvrefZCIFeGeSiiDuSau/CA8UE
         HfSyFDLpBmUIWhpn0DHyD8kufuVVU2RI2Y6EovqtgLZBwElhip+27g9AhcMb5dr8a9uz
         wO1w==
X-Forwarded-Encrypted: i=1; AKwUvBzTZtc7WCGfua+phUHkCfOW+ClgiQBSVoPgnEVqBZWwp8W8xVBPHdTEgGRd0JLUJwPfg17tCjdFq3NSN6Z9NZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nHWoAcicbBb6cD9kp2reXYWxEmzb0WsVpvJkhiWnXpuBMIIoFG
	vvJeaPcnpHu5NLyUi/ajEuXI5N17IO7GwG3VY6RANI2yKlIBu01NYZVv+S6pk8tkrBI=
X-Gm-Gg: AYBFou2qZkSj/BK77ZWNW8cf971E8PX4tCvlYmXJ0WnGBfgRM7uc0gvfXNN3diCdxUw
	T1nsAwpM9H9E2mO7whAow64W6e4apXobJSuXEMgbVi/7NsjBx3gI0Y3JVpxyZyEkJz4oySjVqR4
	fnXFAR1mygdKJwYvJrPkY/WWdTrmgfG5xNMM9vG5X37aioIbkibJK+LpOx9FnYVKhLi8wDPEL6N
	UuezIWX53mmNkyn/G5w8gZyaIP1+lUfIkDLJ0LmW5p9SMm1DlPfD2Dg0VCd9//OeViZULbuH2Mq
	qUJlb1Uids+imgKykEvcZUo2neul2Nx9Xob4MylQJCekI08HsD4d2C4sHOsCXGzVWiYa03Yk357
	UtfQ+fmcAjvMPtkMoXjUgSNhM0FiW3ryGVe/YYaCsWx8ybnPzTxDEt99M8pBhRPy3E5Q2gZsFhi
	fyfsD31yg1fr1uzUp/l4X9xKZOdoyWOe/yfxnzVEuU/4BD4FE9fnBCA8fqDiYPEV43trTkCTmR1
	clpqfkuDw900xI=
X-Received: by 2002:a05:600c:1394:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a17b53fc1fmr31811145e9.22.1791307999766;
        Tue, 06 Oct 2026 10:33:19 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:d2::15:413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1272esm714121f8f.27.2026.10.06.10.33.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 10:33:19 -0700 (PDT)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 2/2] selftests: net: veth: test peer ndo-xmit after GRO toggle while down
Date: Tue,  6 Oct 2026 18:32:37 +0100
Message-ID: <20261006173241.65945-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006173241.65945-1-tianyi@cloudflare.com>
References: <20261006173241.65945-1-tianyi@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that toggling GRO on a veth device while it is down updates the
peer's ndo-xmit XDP feature once the device comes up, for both GRO on
and GRO off.

xdp-features is only visible through netlink, so read it with the ynl
CLI, as double_udp_encap.sh does. Skip the checks if the CLI is not
found, as in an installed kselftest tree.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
This commit only covers the peer's ndo-xmit flag. Paolo asked for
selftests on the device's own XDP features when commit 7a6102aa6df0
("veth: Update XDP feature set when bringing up device") was applied
[1], which refreshes them in veth_open(); those are out of scope here.

[1] https://lore.kernel.org/all/155aabf8b873bb8cdcafbd6139c42b08513e5fe6.camel@redhat.com/
---
 tools/testing/selftests/net/veth.sh | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 9709dd067c72..8b867e0675a7 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -9,6 +9,8 @@ readonly DST=1
 readonly DST_NAT=100
 readonly NS_SRC=$BASE$SRC
 readonly NS_DST=$BASE$DST
+# shellcheck disable=SC2155 # prefer RO variable over return value from cmd
+readonly YNL="$(dirname "$(readlink -f "$0")")/../../../net/ynl/pyynl/cli.py"
 
 # "baremetal" network used for raw UDP traffic
 readonly BM_NET_V4=192.168.1.
@@ -74,6 +76,37 @@ chk_tso_flag() {
 	__chk_flag "$1" $2 $3 tcp-segmentation-offload
 }
 
+chk_xdp_feature() {
+	local msg="$1"
+	local target=$2
+	local expected=$3
+	local feature=$4
+	local ifindex
+	local out
+	local st
+	local flag
+
+	ifindex=`ip netns exec $BASE$target cat /sys/class/net/veth$target/ifindex`
+	out=`ip netns exec $BASE$target "$YNL" --family netdev --do dev-get \
+		--output-json --json "{\"ifindex\": $ifindex}" 2>&1`
+	st=$?
+
+	printf "%-60s" "$msg"
+	if [ $st -ne 0 ]; then
+		echo " fail - ynl cli error: $out"
+		ret=1
+		return
+	fi
+
+	flag=`echo "$out" | grep -c "\"$feature\""`
+	if [ "$flag" = "$expected" ]; then
+		echo " ok "
+	else
+		echo " fail - expected $expected found $flag"
+		ret=1
+	fi
+}
+
 chk_channels() {
 	local msg="$1"
 	local target=$2
@@ -222,6 +255,7 @@ fi
 
 [ $CPUS -lt 2 ] && echo "Only one CPU available, some tests will be skipped"
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
+[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
 
 create_ns
 chk_gro_flag "default - gro flag" $SRC off
@@ -283,6 +317,18 @@ chk_gro_flag "        - peer gro flag" $SRC off
 chk_tso_flag "        - tso flag" $SRC on
 chk_tso_flag "        - peer tso flag" $DST on
 ip -n $NS_DST link set dev veth$DST up
+if [ -f "$YNL" ]; then
+	chk_xdp_feature "        - peer ndo-xmit" $SRC 1 ndo-xmit
+	# make sure the peer flag is set before disabling gro while down
+	ip netns exec $NS_DST ethtool -K veth$DST gro off
+	ip netns exec $NS_DST ethtool -K veth$DST gro on
+	chk_xdp_feature "        - peer ndo-xmit re-armed" $SRC 1 ndo-xmit
+	ip -n $NS_DST link set dev veth$DST down
+	ip netns exec $NS_DST ethtool -K veth$DST gro off
+	ip -n $NS_DST link set dev veth$DST up
+	chk_xdp_feature "        - peer ndo-xmit cleared" $SRC 0 ndo-xmit
+	ip netns exec $NS_DST ethtool -K veth$DST gro on
+fi
 ip netns exec $NS_SRC ethtool -K veth$SRC tx-udp-segmentation off
 ip netns exec $NS_DST ethtool -K veth$DST rx-udp-gro-forwarding on
 chk_gro "        - aggregation with TSO off" 1
-- 
2.55.0

