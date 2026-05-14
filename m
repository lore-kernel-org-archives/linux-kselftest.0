Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41028F5
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800551; cv=none; b=MGTWdQBJLa+wmPdCTz6APMMC/7lv25hW2c5npW2FcKKgF0LSYSEXYRsjnAtwjCi2jx1MOgvpc3JI9myxC33L4POTpKLl7JIGAtej/vw/n03C7voJFxarhbc+Lkevm9cgtr3v/DQNeXPljn/MlDEUofCUSJ9WpJtUiLLd6X9B/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800551; c=relaxed/simple;
	bh=MtJHNlbiZerjdPEzOlj263GMPVJy10WoBSXyLLQ4UyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cc36oTHdz310ip7hqIzswD+u37M9olbGfnSonFmH+NMm4X41Zk43nPeIJvdIL5A+wComDwuqfYywwCPGvPMASbZtEP7ik8a4JtSsU61BkQKvRSWeMwMj5cU0cJmk6wXynSqN29Xky4wJn77qH1DTfY24HTrQNFFagpCm+OH20O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=gbeNdo8Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="gbeNdo8Q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so73859665e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 16:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1778800549; x=1779405349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqoRDlzgxB40s7RWtbhlam/wZ2ILK++oCwT7V3WKKyA=;
        b=gbeNdo8QG1aCXE7m8O44UomH2iz4583WE2KQB6K61nttTm0LW8fhMfwtl+u8MoTwvm
         f5VXpf0BNn5R5JeU4YvZ3+/RM2zpDiwXqCj4o6YyljD1iAmeeniOdUFWpv1CUPDjv/Fj
         u7ua3CJESJamqZN/sSjIUHr7Dysx9xstHz+zZxIHut2jpJwhBOeoMcmoIWPGPpsVez68
         oLNrk93ICLK2Gwd26LKwRMxkJ55RwSyHMdxp6QgTViz+6hNKVi4e+BpPsV2gXNfApJNN
         YSU9FkJpoh/9SzoOaahSRrGS8Me0YjYo9zzRrlOMl2es0NrLnuDY4CuiuxuXHph2e9xM
         nwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778800549; x=1779405349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqoRDlzgxB40s7RWtbhlam/wZ2ILK++oCwT7V3WKKyA=;
        b=iTCKDQWnGRtEu1lW4shdJpWLOJyBaw3n7lOX5vNNoVF5enTYLEOFPo+HC55HnvCZbp
         leXZwSgRmGvzXlLrD2gPeJaJQ4+uPed/VAz4DSQr28gIzKy4KvbLYfuBEynYyJ+glA4q
         C9O3CeQ5KOvyp0yYle1fv48XdEqZydxQGfV03kXSchZzirW4f60TzlgbXh27AOE8RIJT
         lqttgchJaMDm7cdXpNcgxJam9NTWN5aa1nvuGrpSVAFmRTi7smzkBFFqRsp2R9xbQRix
         2vKo02miUOfVdlZvMy1xIukL62YXtY5aZ3kjE3QyiWHX+tf2wiiGjaIzHOQZpOgv8tDa
         ISXA==
X-Forwarded-Encrypted: i=1; AFNElJ/6dJ3r4OnRsZK4mMU04KnA3Ks0i0ZWxpRgW5uUBg0ri7sGTY7xpjGKhUicHcJqEGPvFPRU68PdnAhgZOZx6TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOvdi2uUpUpxf93V77hsFKx0gpIdoecXeTciieQK/eGZ8wObm
	/nH5zUjoQSX+TdozxLDedvvfdV6XFz5njWsHgAKtwktHWAz8OKzueIPk0O5pSHJD7YA4bebOpQ0
	F4Wr9xL0yDvwNEx7Jeh3LrcbIFlajkmcM8yZVw6ZAfk/fMi0D47TL3csoqw6boEs=
X-Gm-Gg: Acq92OGnx5KAk3BD5bKBoIO85FYHVSQNoiRtZk/R7aLWp+VkAJ/5dXJ6NTSi1Nf//Ut
	UtrxECPDun8cNO7tXJhX4lTGpMlVt8/LHKECKuEOjCZuazaAHaXFo/KvRs+VoMtB5YK0fgZM0Gf
	I6mSsfKQHoCw+nvcSbDP2bq7GpoLF4gsk9+MzTBbjc/36J5ZeUnb4A5fwXaY/QBa11RlJP6Sadn
	wGBpTw8UsKvHu8jZgKakdZPEHdz26ti66Xr/L0wPr4eDXgV2yb2HaonoUYVyEd1tH2CKD2cd1Ed
	MN4OPPOgc8CjP0+GLmgFj/8E1SXUOMZqLbGs915Wr3Czjd47rDq00Jza98bApQdRSxQ1Z5eHuAl
	kSrm9u0L21UtP1I+hi81nGXKU+dVSvUmpGuqYLkT5m/DDneW4jR3iWgOgx3tyL7CHuSJ9KJL+qq
	hsd3t+McbgyHPNji8cKX3/7GakXANVrfo5rvQ1ffc306U95Q==
X-Received: by 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fe6321cdamr17622285e9.21.1778800548808;
        Thu, 14 May 2026 16:15:48 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:a628:d33e:601:ebb9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm39155855e9.1.2026.05.14.16.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 16:15:48 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Ralf Lici <ralf@mandelbit.com>,
	linux-kselftest@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net 1/5] selftests: ovpn: reduce remaining ping flood counts
Date: Fri, 15 May 2026 01:15:40 +0200
Message-ID: <20260514231544.795993-2-antonio@openvpn.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514231544.795993-1-antonio@openvpn.net>
References: <20260514231544.795993-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralf Lici <ralf@mandelbit.com>

Commit 201ba706318d ("selftests: ovpn: reduce ping count in test.sh")
lowered the baseline traffic flood ping count to avoid flakes on slower
CI instances, however some instances were left out.

Apply the same limit to the remaining ovpn selftest flood pings that
still request 500 packets.

Fixes: 201ba706318d ("selftests: ovpn: reduce ping count in test.sh")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/test-close-socket.sh | 2 +-
 tools/testing/selftests/net/ovpn/test-mark.sh         | 6 +++---
 tools/testing/selftests/net/ovpn/test.sh              | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/ovpn/test-close-socket.sh b/tools/testing/selftests/net/ovpn/test-close-socket.sh
index af1532b4d2da..ec9a51bbf3c9 100755
--- a/tools/testing/selftests/net/ovpn/test-close-socket.sh
+++ b/tools/testing/selftests/net/ovpn/test-close-socket.sh
@@ -53,7 +53,7 @@ ovpn_run_ping_traffic() {
 
 	for p in $(seq 1 ${OVPN_NUM_PEERS}); do
 		ovpn_cmd_ok "send ping traffic to peer ${p}" \
-			ip netns exec ovpn_peer0 ping -qfc 500 -w 3 \
+			ip netns exec ovpn_peer0 ping -qfc 100 -w 3 \
 				5.5.5.$((p + 1))
 	done
 }
diff --git a/tools/testing/selftests/net/ovpn/test-mark.sh b/tools/testing/selftests/net/ovpn/test-mark.sh
index 5a8f47554286..7c1d56e9c525 100755
--- a/tools/testing/selftests/net/ovpn/test-mark.sh
+++ b/tools/testing/selftests/net/ovpn/test-mark.sh
@@ -66,7 +66,7 @@ ovpn_mark_run_baseline_traffic() {
 
 	for p in $(seq 1 3); do
 		ovpn_cmd_ok "send baseline traffic to peer ${p}" \
-			ip netns exec ovpn_peer0 ping -qfc 500 -w 3 \
+			ip netns exec ovpn_peer0 ping -qfc 100 -w 3 \
 				5.5.5.$((p + 1))
 	done
 }
@@ -101,7 +101,7 @@ ovpn_mark_verify_drop_traffic() {
 	local total_count
 
 	for p in $(seq 1 3); do
-		if ping_output=$(ip netns exec ovpn_peer0 ping -qfc 500 -w 1 \
+		if ping_output=$(ip netns exec ovpn_peer0 ping -qfc 100 -w 1 \
 			5.5.5.$((p + 1)) 2>&1); then
 			printf '%s\n' "expected ping to peer ${p} to fail \
 				after nft drop rule"
@@ -144,7 +144,7 @@ ovpn_mark_verify_traffic_recovery() {
 	sleep 1
 	for p in $(seq 1 3); do
 		ovpn_cmd_ok "send recovery traffic to peer ${p}" \
-			ip netns exec ovpn_peer0 ping -qfc 500 -w 3 \
+			ip netns exec ovpn_peer0 ping -qfc 100 -w 3 \
 				5.5.5.$((p + 1))
 	done
 }
diff --git a/tools/testing/selftests/net/ovpn/test.sh b/tools/testing/selftests/net/ovpn/test.sh
index c06e3135fbef..9b5610837032 100755
--- a/tools/testing/selftests/net/ovpn/test.sh
+++ b/tools/testing/selftests/net/ovpn/test.sh
@@ -110,7 +110,7 @@ ovpn_run_basic_traffic() {
 
 ovpn_run_lan_traffic() {
 	ovpn_cmd_ok "ping LAN behind peer1" \
-		ip netns exec ovpn_peer0 ping -qfc 500 -w 3 "${OVPN_LAN_IP}"
+		ip netns exec ovpn_peer0 ping -qfc 100 -w 3 "${OVPN_LAN_IP}"
 }
 
 ovpn_run_float_mode() {
@@ -127,7 +127,7 @@ ovpn_run_float_mode() {
 	for p in $(seq 1 ${OVPN_NUM_PEERS}); do
 		peer_ns="ovpn_peer${p}"
 		ovpn_cmd_ok "ping tunnel after float peer ${p}" \
-			ip netns exec "${peer_ns}" ping -qfc 500 -w 3 5.5.5.1
+			ip netns exec "${peer_ns}" ping -qfc 100 -w 3 5.5.5.1
 	done
 }
 
-- 
2.53.0

