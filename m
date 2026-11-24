Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555058;
	b=fSYRcJuCIYMmhdlik9JeoB+4RQ+nOTjR393DYn76DuJPD9ULfUDR827aP95oG16fwBhu
	 bk9wk6UachVwJuGSobBN4htRcgpLs5/b0mpt1MtWg3epybjFCqYgoMqgp0lrN++npFp9g
	 6L1kt0hzYJk+ELnAX1WDenbKpoBQx9LrA2qqa0TFcdJCgmisNRsiggjzmsSXgH8RRqOTq
	 iYuu99Recdr5Nn4b04H6I9PwxVZCGMnxKRHR4kiqp9E8fD5rfEZQk6eJCRp9Mqg3mVFMH
	 nMpuhZ7YapgNDEVHTGF2pAsfhLB4GukDBQBkLyxohQKW+MyVbu12cQEM1aRvFm1CWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
	b=cnOueYdngxM042D0Hz2Rs+ocNSLN5Fg9QJSsEKgQVM9peBAGF4xF/fQY6sHzLDkjdIIp
	 wCO76ow+BK7SF8YYa+kYvMXc++zgPywwb5dn4gAlk/yTxllwtk+O4G6dlkwNtyx0hdVca
	 BPBUoWLpI4LvFEO6TPBMaWPwkoithwtY+ecuHIXhVbg7USG772AWrTKX6SzExGWJDSv3X
	 /oRY26yNQPuDUHn7TxsnxFEJX3k37olVuk1LFvIFo4tLYeq1BJTYDwUQgXVUU+LPLQMG1
	 IsE83KrzgiuSB9egpSez3WxNy3k7x+q2TVm7/u9KS8L5HrfpKWDmR7BZ3pnv74Go0cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2PIYrI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBB606A680
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DBB606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2PIYrI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso11508505e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555055; x=1796159855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=GL2PIYrIRpaC5rEfwK58c4QXdqCa62VtMZeg/Gf53XM/8avpaP3BiMh3NxbbFalaNX
         6TPayS4v0zk2Z7E6zpWNN8y63hw+NozjuUfQJq3931vwVaoIfWgF5FbIxrcPBdwlmogt
         oW21UZVGoo6oWvk2rJgdK1Rhb/79yD+Ca5fp7caFv/ZyUSmxmh7p/1MOml30zBU6HIfi
         Mgu876CjesSi0Kc4c6jLwivGfmq5tdlW1X2SOsk9t1dXdEhiM+BQrmY/EqaVRq1RdWPb
         e3UlDe5zqGBoOwnFFh0Yuhbk8Ezl60AUhi79R+mQIG610LaBXv2pQAeBytJoq2OmkXmt
         NHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555055; x=1796159855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=cinWTWxtxe7j++rMkBjH0yXRuRxDmdlUosQhoGQpb85dxy0dRnoUWCODzElnXIe7KS
         828rd3y+8WkTgm2TsBWBrsTQWINnQvPfgkM8z2GKoQZiVhT6VXsfO8BvAtwVSGJxAWPo
         8goiSPNQezcFKTIjYtkPCQoUUaBFBKBHdTMiKl3+vTxSIQbFTez9XfzMiLWajFEWqfLb
         q+0k9pXjucPOLpTPsMfirDfKEx+PL5ikMsGV7NBr+pUsb+Vmy6M+su+j36+XuVGGuB+0
         8rHWiOk5cj6VdWVwNDLrrS6fJRhIU1W/QFUeNTSsy9ufSt5Ss+u3V3pi2VMdhPB8sXHf
         /bcA==
X-Forwarded-Encrypted: i=1; AL+hErF0HmEJXris8GqyxRSMq5UJPIq7lCDy6KoMiU8+03gPE0vad0yIjUTXIhEsN5iIGmn7XqzPfIb/JaBH/QppD5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z86tgLFdC9qZroj2ilBDo1onO7Psd1Qpokw3i5UN9t6Uadxgbeh
	L7sDD2ZPvBA3KFIU9Ex96o9O0O6K7lEU2/CokHy8Vx/s8PL7WnO7K0yl
X-Gm-Gg: AZFdTZdYmUEiAjjvaY7j3obgB1ct8Ehc8oa3vfUAbaV3XNyeD9NYkvJk7N8osU0nha9
	3WyIq1KZwFv6kPTwmqSg4GKoyOaaekKyli7u8baGmUOMOxh7jlxKJMhPF7yfCk83ocH7Vk565kt
	cAr4oT4m7+cSXG7zz4w7ihWXLxM2buN/kPjwEoHOjj7PT86icYI7XpV4w3zkV+2JPrmzd3vAON0
	C4Be/Z6Purc+R3zroBDiTvpJpsMDCYQio8+ZFCSy3hTJgoumrCgVWLHz9RvdV9fHpFcxfUYfSO6
	/UESX6N68JvFeqZA6Wq7PWb3LF3yK7WTulsM1GcArtpxGR6Lc/6SOP8VCj1BQ8HOPZMteN+sssx
	a8P8wSl/IdtJK+oPaA54ugIaAMuqXx2w4l4KK/FLlK5UCBrEXkbIAndI76i87Y6+s37kOMEAMeq
	mPeL1ct1cs/gG0dyBNGB9P5SBJqXRL9BmBv59WjpgYmt8eUXUJX1TQIdZxnIsLy71eiQMF4Ucfm
	SjN1zHjKd+YffMJNKDcbteIr9Tcwp/p7S2kIPm9vPJqfoZcZ3uQrsloBH/zFORsCITPN8Ahckpd
	9msDp775il0k+rDkTRxm1XBZYnf4yoPtlJukv65W1+utX9SxaWfQUDLrlEgkUhJHOO32
X-Received: by 2002:a05:6000:4a15:b0:4a6:9f2f:4151 with SMTP id ffacd0b85a97d-4aba57e9972mr28188997f8f.0.1795555054760;
        Tue, 24 Nov 2026 13:17:34 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:34 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v6 2/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:16:45 +0100
Message-ID: <20261124211645.5751-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211645.5751-1-emmaonana18@gmail.com>
References: <20261124211645.5751-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
@@ -473,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -483,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

