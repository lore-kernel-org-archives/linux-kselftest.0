Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596265;
	b=CYfEGX4P1DYzKNZ4UlFa7ZZLFuBS8uo4w4sr7Wr1069K0s7ZG1wLiZZMbG+OXqFrrWIn
	 mafGVUeIGwwXM6HIJ7bO87j0Qu7/snN00Bu8v5BKtUwBv1Krw+jXc9FwwZoFHRmJUlNtQ
	 zHSR/pC+wiCF9GSiJgb+1MLH6F6KAdz8jw5jLGx3YxZx1VrsaGNhlwboZpRCXsce7NwJi
	 8a1qS8YIS39ypQHt9fjL7Jb51wuvL08PBEpqPOfjm2z10NsmDNgEJWcUGjfE/o5j2Sk8b
	 8qE2COEBjaWg7Pwl5Sk3dSLCWEfIEUEPXPU3u80dNUtYukf/HYP7MRWvHjyrL2KI4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
	b=ya3pVRwIzR+ewatC6YFa9vLi1yRlSxDEiicRkrEz+32Ont6ufOVB1yVprxlSQW0IK/ip
	 n0qCUPpef+oArVLzVEZvK63wmJQEzrWabK3KdWky0WRJdV8iMa8I3gr19uePIMgCgj5FW
	 PHN2O1i4z0LgNu24yvDUWz7/FYfpDgn9SMZ/gDKq5sc6Drt9IvSeO0D5N5tqczi7jO57j
	 3gNLKpcA/qujcP8VtsvweypyxoH6UqiNdxBY2yAtRb/KOhJTWxKV1TCTxt5QNybwBnTo0
	 O2MXzhreGzs59saQtvzEQeh6mXH01fKmmWwGL+mb8nwrBRxTZIfgq7wousEu3PxANLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB245606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 08:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB245606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0481b35c9so31770925ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596264; x=1796201064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=SvniTco1NUSUtvFcoYZ0pgwBrsTVcjU87S1hUrTrJyFmUsyENhoIOScLvhwMGkbLuL
         crXEPfrkxUMG2y8MsFu3xB5AFPvmCIE9b0hx05ZepVsUWe3XH+F5bNHrwacvZuxswKux
         SPDw4FzfkycSozQxoisv3hb11k4/iqsEXBqs8xjqwbNw4x/0W9CZQCTXmCeVD+eRxCCG
         LbhpvGxuoAMlKVfZ4hIiHvjQL13hA8gGIew0cezJbNolZcFlAhOfy0qHWJhJkG285vpA
         ev4FMA+eP50cNFVfQMgJBk7OVG6NSG34uDJoQLSj3uaTLrF+KV8Djus0iMd+Go73+heL
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596264; x=1796201064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=RxPLKDKPisVB9ySIr5BPwosuCBA7L+atBFGzDKk/7GJ8bPDFd+Cjefga8tfyCkppy8
         kE5i1KvUzliLVFnpGw+rkg4ARftSNQdatmPeudw6OJLA9lPwiw2qSFGjoczF9ubVXAkv
         mvuR6m4POVt2c8zoPjugOlDCTi+ARS8u3tFci8XjnQwPYhPFKYcePYoI0ci991CVLOIR
         wnLC47N4yx4qeUhv6/n446Cow2kYar0A+wQ/RvAfU3ikE0zhKpCADgEzAusFZL+0XxLG
         LBmxAWFOlNbAlG6HB1XWrPBT3mFOL5tuy9XG+OGHVDvmDab3Sqx7fL7p8PgDV5KSAQ3t
         L8nA==
X-Forwarded-Encrypted: i=1; AL+hErFEzk8QQQ5522SzQ4RmRVGrrqoImXsRTUf++f/C0wVTl+Hagq9QrKCIf1yTJgrspa/9IyLutUsp5TQtgTF8BK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VwIDut62bFiqR01BH6kQv6nP3r3zm0s69E/osuitdJYZY7f5U
	d8mjEQ9AitezykjnBSE5FwzbWEROBcf1AC8B/MQosaf+n+qipgm1ERun
X-Gm-Gg: AZFdTZefdjYWdiYXWpM7M3ZcPh2pGkvSmBog/FOlViMhqKnU2WywQvzdV4nXQiebTRc
	vfxkbA6K6HHSjZwUABxbfmocU+/19yzImsCUeIkBncPrgBbMKqgywTsXrIURNymlIFImrKDvaBv
	FR8uNt0Vu5PINUJaQ0Tc5wmDWTE9/zJvS9WWPL3JnUr1UR/65s+Dp/Erf6dIO2XOfQp3xONwODQ
	OqQP4OjOAXdEvJyXQmNuSI5heqxjTCqvufEyWvH2RkbGnaaLj/wLYPJemWzShAAMxK4Lh9lP1vD
	1RWeMMtZUn+5kq4aFhmJp9qkVnlG7DeXMEurVgxf5QvnEgNiWntFN0Z7Cj/zdOkSEyWWcd4l2j1
	MqndUrsRNDnPuxJNilw93e3O/iUdoROew2zCowZZwZ7xEetljmyODyqsovyXn9gsv9QC7Uts7kr
	buzEq/G8xdZFkrdhekPHUaIsOe9Npcy22nQ9i4zmyVQJyN0j8N1X98YKaKtzCu6RGhhFFktkPnC
	bAOIyTZQgYeiuPRXSO5nAaWsItlbyRtchiPQuT0Q0DT0YFYAh5bQ2YbLSm3iS8fmhJ3mrT08rJW
	9AE5+hqDqCKu4ri+ACFffVN2XmXr2OGJPOq+Ppmo2b7gcdHRH8Y1okTXVEyZ+ZNXQYtDJIlp3y4
	0wV+9Hwb7W+FBY6498w1oFD6K6Gvbw7btgdH+FM68
X-Received: by 2002:a17:902:ea0c:b0:2f0:3123:899c with SMTP id d9443c01a7336-2f03f0c1f37mr159122655ad.5.1795596263959;
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm81877485ad.24.2026.11.25.00.44.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH v2] selftests: netfilter: fix nft_nat_zones.sh diagnostics
Date: Wed, 25 Nov 2026 16:44:16 +0800
Message-ID: <20261125084416.23282-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124071926.8818-1-zhiqizhangg@gmail.com>
References: <20261124071926.8818-1-zhiqizhangg@gmail.com>
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

nft_nat_zones.sh starts all client pings in the background and then
uses a bare wait to collect them. In bash, wait with no arguments
returns zero after all known children have been waited for, so a ping
failure does not set ret. The diagnostic after that wait is also outside
the client loop, so it would name only the final client even if it ran.

Store each ping PID and wait for it next to the matching client
namespace. This makes failed pings set ret and reports the client that
actually failed.

The veth0 ICMP counter mismatch path checks the 10.3.0.99 key but dumps
10.3.99 for debugging. Dump the same key that was checked.

OpenAI Codex helped analyze the Sashiko review and draft this respin. I
reviewed the changes.

Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Changes in v2:
- Track each ping PID and wait per client instead of adding echo after a
  bare wait.
- Report the client whose ping failed instead of reusing the final loop
  value.
- Fix the veth0 ICMP debug dump key from 10.3.99 to 10.3.0.99.

 .../selftests/net/netfilter/nft_nat_zones.sh        | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..9397f09d0c 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -167,11 +167,16 @@ ip netns exec "$gw" sysctl -q net.ipv6.fwmark_reflect=1 > /dev/null
 for i in $(seq 1 "$maxclients"); do
   cl=$(eval echo \$cl"$i")
   ip netns exec "$cl" ping -i 0.5 -q -c 3 10.3.0.99 > /dev/null 2>&1 &
+  ping_pids[$i]=$!
 done
 
-wait || ret=1
-
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+for i in $(seq 1 "$maxclients"); do
+  cl=$(eval echo \$cl"$i")
+  if ! wait "${ping_pids[$i]}"; then
+    ret=1
+    echo "FAIL: Ping failure from $cl" 1>&2
+  fi
+done
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
@@ -185,7 +190,7 @@ done
 if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" | grep -q "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"; then
     ret=1
     echo "FAIL: counter icmp mismatch for veth0: { 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"
-    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.99 . \"veth0\" . 10.3.0.1 }" 1>&2
+    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" 1>&2
 fi
 
 if [ $ret -eq 0 ]; then
-- 
2.54.0 (Apple Git-157)

