Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AA380FCD
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271797; cv=none; b=X42pCYTagGN9Q7+MZlHUV0XIGp+CaHK6voZ4PhwE8qW4debmQHYz2VMwPtjs27V0XVfYP2qveo+hgAYfwh0FL/cS3ecJFhUGzmYbRsUEKx9LeHu+1pUPsPyy4Bq81rEgDNilODvS97kwkSUPZAwCyPByt6vFmNpLqvTNsHC0Ir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271797; c=relaxed/simple;
	bh=UprTbNUUvXH99g2NCx2ct2QD9UMqg+J0yXIvULzVEkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BaR2JqNVoeb3g2AAdYVJyHuJXOcVjqUlHnUBwYjqh2eIYzl4e24IMDsH1uHP7coyTF0GHhVtB3FHI4VwVjF6YGId4J84n5roG1oWI5i5CzIb/kMNxrFvy8uH5AnvtjYCEs/U5N7/z2NQQelciQFso/jygBUjUzBizcY28cuyAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=mgV5xqH+; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="mgV5xqH+"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b12d146e6fso1193823eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 07:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271793; x=1788876593;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klux3Px16MgfpuFL4Thl1laPfvZCFrqMR76ZeHwaoNE=;
        b=IaP/i0EDt7QT4NlmN4+dxXqjxiwcJ8Vdr9yu1PHziH0AA2yk84ibM9n+Wf5Lxse+de
         nnt4ZZhKSyORKenJv/2XStGHNF/xPxOCh7vyf1A5Vm47+/rERpcGQmetlVSXQmDvxoui
         CUaj/iF7O7GsQ9zgbZUdTVENsysmOcduZqq+P3gkVkE6ZRzAnwK8No9bbYbx3duWWIp7
         d7qT25QHH5ePK95ySzn6aX6b+G/b40CixeALfDIaXIi93HUevFLslF+8E0bJB0iaEYUc
         XwOzVB4ayfJ+rnLBHYd3vcPCtN8tF8nJNgoUzEpDDrx60J9NeutTAsCljPy3tBU5kIjx
         GkIg==
X-Forwarded-Encrypted: i=1; AHgh+RqjxwY0bxtUzhlBrXdqVpyXIoZB6GhBKufGFZuqYRly164Vu0RaqdtsJOK1t57lQnBoKqELg6geAVkSSBuxAOA=@vger.kernel.org
X-Gm-Message-State: AFuF++m1u7qqGLi2G3dOlL6to7hwk+gOxgqVZVJ5JcAV92M+5seBke0h
	64l3eF+mSccZkZ8XCZvqKs6pQRpqBbKvnCfnv+ycxF7P2am0tPltrzl7
X-Gm-Gg: AR+sD11yjbgUF1B0z4/f3S0/NdSvyq85/tMZsct9Q3HS87/29ZlaidYDcViYgpLBKeg
	Y7Ux4aWOewARopXuUFePJhBRO4ABuksTJW7oJWa4qRySjbTWI2//YZlCi7Fy1JWmgJn4kIwBkOP
	Co1y6KMixpERWRxP8NoppEGikwvI/a9ca3W5VHFhUTeFxmWVIXwVPV4Vk2W4+Mlq4hHHFwqpv8J
	0r8UEI0cl7zleFdqGGmT313zvdtTma9wlr1pRrVmlJ1u/wWgxeggyQhXJ2W6AiWqRQZhsNuKFmR
	5MLhhtQCQnBEWLtOQSGIjoj/zqmtVZXWVbFSXEWrSmv2YoEWrLKDPFRHqALP1UP73/8GQzDNu2Y
	VMKYluYUDFSqLKg0L60H0LqTBVAQUqX4iAPdOv7KJ3fmtGkvHBoUjweMQqFmOhjc8MFcpsa5KON
	jiXgAxkD0JLuvMyLtKB0RVLx2lUT9nGKz6S3xnpevIJdlH8mxLl03W9KuMj9lNP+N7dR/llw1ei
	NdKq725qk8oqNrPzRpnFFjugr3+3D+Lt0XiBIx1Lqs9gXUfd1RCuZl5p47aEsIdUw==
X-Received: by 2002:a4a:de54:0:b0:6b1:bb82:f7a3 with SMTP id 006d021491bc7-6b1c6493d32mr23982278eaf.5.1788271793018;
        Tue, 01 Sep 2026 07:09:53 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96ce3dsm11066967a34.18.2026.09.01.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:09:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AB2060B50;
	Tue,  1 Sep 2026 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1788271790;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=klux3Px16MgfpuFL4Thl1laPfvZCFrqMR76ZeHwaoNE=;
	b=mgV5xqH+k13vCIzrWoRJdltr88WENTmx5T41hD1GXD49M4oSnj9xQaafgJGIu0Rire71sl
	ktRbAYwC/tL/54WqR+JxjtkxtD9Z4mx2PJlv1BgM+EmIsCcjjAaX0PY/CQOU4dnZOyuZcx
	huIQymEZrXMpFko8idN1Oe45Jfu45rfs+sOoDIS++y5jTjEtMpOZONGjB7FmrPnrpAVWol
	FqKbmL+5H9RB5goLkP8jMVe3f6CkGTM/tzvQrd4PaXA4nMYfLPVMbm72emn+DW8+W+nfWi
	cdHGrh09sfLHMYwozXH02K7UIM81S+PUkjSQKlhGvC6lvHTud6YgciL0MyR9LA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 01 Sep 2026 11:09:37 -0300
Subject: [PATCH net] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-selftests-net-icmp_race-v1-1-0b2a27e91a0c@marliere.net>
X-B4-Tracking: v=1; b=H4sIAKDclmoC/yWMUQqDMBAFryL73VANJWivUorE+NQtNcpuWgri3
 RvbzxnmvY0UwlC6FhsJ3qy8xAzVqaAw+TjCcJ+ZbGld2ZSVUTyHBE1qIpLhMK+t+ADjrKv7unb
 20oDyehUM/Pk93yindP9LfXUPhHR8HlnnFaYTH8N0qEV45HievSYI7fsXh/uIqKAAAAA=
X-Change-ID: 20260901-selftests-net-icmp_race-6268d886249e
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788271786; l=3118;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=UprTbNUUvXH99g2NCx2ct2QD9UMqg+J0yXIvULzVEkw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEU5ZNtbO6jMIJnt/iaiBCRbVaf0TWZ09i/vgrknAQj2sJC+7NF0An791bEYL4SJaoSawW7WMkp
 CkMm10Zglrg8=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

icmp.sh backgrounds ping and then starts tcpdump, with no synchronization
between the two. If tcpdump is not capturing yet by the time the ICMP
unreachable replies come back, the test fails even though the kernel
behaved correctly:

  FAIL - got ICMP response from , should be 192.0.0.8

The empty address is misleading: it means the capture matched nothing
before its 10s timeout, not that the reply had a wrong source address.
NS1's Icmp InDestUnreachs counter still increments across such a failure,
so the replies were generated and did reach NS1. Ping sends several probes
over its 3s deadline, so losing every one of them takes a multi-second
stall in tcpdump startup, which does happen on loaded CI hosts [1].

Fix it with the idiom already used by broadcast_ether_dst.sh and
macvlan_mcast_shared_mac.sh: start tcpdump first and wait for its
"listening" banner via slowwait() before sending traffic.

Fixes: 7e9838b7915e ("selftests/net: Add icmp.sh for testing ICMP dummy address responses")
Link: https://openqa.opensuse.org/tests/5907626/logfile?filename=icmp_sh.tap.txt#line-2 [1]
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/net/icmp.sh | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/icmp.sh b/tools/testing/selftests/net/icmp.sh
index 824cb0e35eff..593d5f3abcae 100755
--- a/tools/testing/selftests/net/icmp.sh
+++ b/tools/testing/selftests/net/icmp.sh
@@ -28,10 +28,11 @@ RT2=172.16.0.0/24
 H2_IP6=2001:db8:1::2
 
 TMPFILE=$(mktemp)
+TCPDUMP_ERR=$(mktemp)
 
 cleanup()
 {
-    rm -f "$TMPFILE"
+    rm -f "$TMPFILE" "$TCPDUMP_ERR"
     cleanup_ns $NS1 $NS2
 }
 
@@ -53,11 +54,21 @@ ip -netns $NS2 route add $RT2 via inet6 $H1_IP6
 # Make sure ns2 will respond with ICMP unreachable
 ip netns exec $NS2 sysctl -qw net.ipv4.icmp_ratelimit=0 net.ipv4.ip_forward=1
 
-# Run the test - a ping runs in the background, and we capture ICMP responses
-# with tcpdump; -c 1 means it should exit on the first ping, but add a timeout
-# in case something goes wrong
+# Run the test - start tcpdump and wait for it to be capturing before
+# sending any traffic. -c 1 means it should exit on the first ping, but add
+# a timeout in case something goes wrong
+ip netns exec $NS1 timeout 10 tcpdump -tpni veth0 -c 1 \
+    'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>$TCPDUMP_ERR &
+TCPDUMP_PID=$!
+if ! slowwait 3 grep -qs "listening" "$TCPDUMP_ERR"; then
+    echo "FAIL - tcpdump did not start listening"
+    cat "$TCPDUMP_ERR"
+    exit 1
+fi
+
 ip netns exec $NS1 ping -w 3 -i 0.5 $PINGADDR >/dev/null &
-ip netns exec $NS1 timeout 10 tcpdump -tpni veth0 -c 1 'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>/dev/null
+
+wait $TCPDUMP_PID
 
 # Parse response and check for dummy address
 # tcpdump output looks like:

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260901-selftests-net-icmp_race-6268d886249e

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

