Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818524;
	b=xK5z47mtiYHwDQ9GFgI/Zsin+gswMQg2GmtcpTw2v0KbjcP23WupuLxL74TwQnMssXEL
	 w+NCK0l0/hBFdaNZpkkaAaceG2Vwf/gh62dr9mok50imhnRsaQ+02DgsP6KuAFX5pFbLR
	 2PrLuQYsAV5aDwriXFZeQ20ZhnlymkGhc2nbQSR5lstM3/6+2yPUmJKaP02kiPe+p02I+
	 la90zrxXuYDzVBbLcXq55FPSMUnsnIFoYWFRxnUhFJUCmYWQKTSC0PVhoi17IkmuMoOdp
	 4QcfXPoYu+OSwKDt21evRqqOTgsrTzsHfsZH1heoLt1oOpakNPKJ5dXz5zySOfvJFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
	b=WGF1BAa7Rxn+673b1vYZRDaxurxdpsVtp9b1PN0y75R4beLC3bGA5F5/TebyZaivduaS
	 q+LRnrm57/vWHmiHAQh6fc9m6O5TTdccMCicze99UXZawK3K8F3nZ+MJaW9+QmsaWrZXh
	 hmvINf4vUkt6TEZUZJENT2AL8pg0mBda+jxQE8SyfDGokoHel4UaCckyzxodKFGz57tJC
	 iqQhx2HFhk52XtAdIRgVONU3TElxO2SNU/S3ssxCtFwJKttIEx9/H0Ln1eFK24OtUPxf4
	 xi+vrpT1Qo+sZA9kJ7IpvxPhzs5brmbX3sTd47i70HhiH+L0nXRBAroF5BvciRtouwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A3606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473A3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7457105e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818522; x=1795423322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=ZoA9pBn2SaQcXdbdTbDGdUqkVqrFSWt+g1wynpHCOei8Q80uX3HN3uHnYFkli9EpRG
         32eCjf+w9PF111gI8CFo/2Fi6iAE8awhIK8ghCdj1w/Z5crBUJCEdB83o/LRmQazFxCj
         h5RvnVii23vtsdO+89HmwI8+MkPFeZOKVW9+kNYlK7TFWubhLKPo5wYsAhYf/4RCkI1T
         UoVlloGuVEBvVpV5t3vXpqc9paD7z+rZ0msoiFb0TefH5FcBOiGaSkEvImmecOZo97oE
         lJpXf2p7y7H1i7zqcUPmiYhnOp7/Ab9yXqGHGSu6bD6g4r8JAACBJYaBTBaZ/1hZOsdg
         BvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818522; x=1795423322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=KRvGadUAv/vnkKerxRvGSgkG7OsktL152eNo6mv9zYnGwCGzA5UjNGdhglel82NR3f
         OrJ/nrmKrAXO+6ajeBHJT9/t8zhZ1HXbWxkZH+XcxyVJTeHosyrDSoKCtIaZIIRjNV18
         d/ahvqb0rwzODZ0MWiMbS0JgyDF3+o4A5UtDGJOVwLNRVw5FliRd4y2P7bZ4cxBMZgOJ
         hAaZ+BcrnbcDWP5L3wyjyNoxoWvChfW1su8H4fS+JXdYEJg5jj6CKU95sKk79mKOVv7y
         3K09CR8AlisazLmXZ/5tzzCJKJPxfZ9jKVZ5VdgaJSEda9GD+rxGePQ4wAJx9JzbdK5d
         gYlQ==
X-Forwarded-Encrypted: i=1; AL+hErGi+lvpPKbLJjoj81UVAXwDvEzTi2rPYbBCUKGwD/o/P0UYKXIVH4FX6oaDjywqrbE6VMnn7NcfLWXPy4uMZFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P66SqeHfeszElPGmRX/TUnSwmywz2BOKK8lhoMVl6Su/JCBMm
	xObHgQLKSCgX6HZaLsKfQZf7t0TlXpaGOhJngTZ0PV1a+tqp7fnO+CF+
X-Gm-Gg: AYBFou1097gc5JgZrHEXy07G8RHSQ8wTrDHfII65vlhbzIC1+7DL3EPHT+PBI/AEbml
	X1YGhU80gGON3v2V98pG/9pjIadl0pvMEq/ZTs/lMRygsytZauuRSUlj7QowFZlSo12EjeiqoHE
	xqzfRA6SLK7sKd3KOs4WECauaquuOBWKOUC0iWOPH2lpkC1KucuNYPUbe1ZF/Pp0gZJNEhi9cwA
	kDY2pETAToSJUuipIATKQ4b7WEikt+fiFY+ueMleJv4zH54c17tSvemVBzDnO/bu43Wlovp55xz
	mZI8z8Wue3E/Cibj0PCsVefpeq4zt78r7zWJa/S14r0sXGLHIYck4IvnkTNbeO/ya224dJMwg/s
	pMrXM0Qk5gOqGdF+gmSH+z/9b1kpFKAPnN/RB6uwpQWnDB9Jb1gVI01/JGO6jLebvn7qpzlAJZD
	R/0pR+bCfK5lfSdbQnzI76tvqqk9UEhAIrVfVyzCjYZ26wZFVvMz/18P4YUW2WsS8OQ77NfF6W3
	P12zJrtr2tPP4kyy4FTAsL0SS66Zli57oyHKwse0iR9/FV+QNaI9/PMmyboCguRzNzKBox3jZki
	+TkhC4vO4ALQ4Uhm2ANcP3gj1RyOWc4S771p4+dRjCeVrTvqxvsHS+qF4Sa9PY4+RuqgFdiVfH6
	cSwhTsCBIxiEBiqh6UKE=
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr21460175e9.1.1794818522364;
        Mon, 16 Nov 2026 00:42:02 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:42:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 16 Nov 2026 09:41:07 +0100
Message-ID: <20261116084107.6675-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 5c1dbe1516bb4..0b173beed3442 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,7 +474,7 @@ if [ $CPUS -gt 1 ]; then
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -483,7 +483,7 @@ if [ $CPUS -gt 1 ]; then
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	CUR_RX=2
 	CUR_TX=2
 fi
@@ -491,7 +491,7 @@ fi
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
 	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

