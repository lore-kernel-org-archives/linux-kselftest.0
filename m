Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779237;
	b=F42txUSAZNohx68DN7tDDCXO0NsGppqMVyRUMIqVjAsmdrRXFaR5XvossxOXxTTRjy1K
	 7r2av3Hu4RXx+XSfeh/9LtKiHtD1kRF+TkuvPkbKnOETeL+8pMoD3ECklSybqUo5G199D
	 EXCPBvD7Lzglhw43BAz+7YsRLo4Qp1uXORpLrxDA22xoZm7mBETZM0+vbp38DkVP17yvf
	 2ql1J0PCR5uvyEpmNY/89WBkAWkrbExNcKdBcTHeV7TXM9HaZeMxQsxbPAoD+9EU1QP6A
	 79g58tUrSs6mYr01w05GJtJz8hVtMcqhB1VvQSk5RZOPFciMxVC+V5fRP0TUBXnLG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
	b=Fdfiupey+csqYh9A0zm3CuKt2luvOT40lJCswRTDLZmGDlQnGuKJ8RuIElPZlaueO319
	 tVDSqn3XSgDlqZdR7rqAAENk2X9l96R7BEYMKIG0L4EnxJwOzMQB/oQUYO92z7sSBBXUW
	 LdQ3kicW2eaYafrmLJ00ywHnSVO5nJdi17Ne6yQaqItC+qP039UJqygbcG3g/tjyq8qOh
	 7gklxSYbDj0zJ3dhcdio8rVdyp8mI5dvkPxheSXVhP4XJ0V0sO3m6XsDhUVFoOsvNa4u+
	 NlhQ9C4DeKI9uRJvufqUC4HGD/N/2MfJaySKYp8VZ2simmFNI9yyr0/WTF1qcQmPuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCC606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 21:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FCC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4946589267bso343611f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 13:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779235; x=1795384035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=i0vogCSliLZJGYDRv14NGvoJrO5SGotB1IECpyR/cQn7RkJjcbXtZ15LN3HdYRuzJK
         3ghnZOKGJad3pty8zTXUIZyySoqi8t2T6QndoUZVwetLEruinA3Q23qATRL9sGf1hOf4
         Z7Vc7cAvyNjD8JJ8NLUXTZqI6ZeVlaC1M87vbmcRfiGsVmZj6cLm0rggjPOMTeej35rb
         hpi9+DgGTyVh7vvBbDkGkrVt9fQAn43NYaliIguXV3JrZaBTpt9dH7BGClgcmthhrLOo
         aOBH+5LgzrDvj4Wo//E5vupbxzwtPtwBU/4eJ9RBWvtUstHxE6d7ZyC2C4Dghe53V1Z7
         YZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779235; x=1795384035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=ysDZ8Cd0av0Nu/B75mFBFtfy+BJEoQgheV1YfXwINW/XpMBXYKhx7SsX0cZP8OlXQ/
         tP4RhC4/EzKdi1qpeK/GbsMJ8W/LvjDnT9a6HRFjvIofDB4ayrTOUd2TN/C++zSLe7Wl
         34utlIpd9oyai8SCI2YV7nRgnti/v3QStd6+IHQ7jWo0M1i/draKDi2tXB+wSY0nFeNM
         VTUSMBLccaLboNeZLKFmrTXW0g+8ARiG2maVWU7uK/b3iLTHJSxBP/z7C4uMFRL+uxrI
         ks337QXbduqsLSF+pEkSlY3BVfFFJ66cw3MroXuIAds8Lzlmy7NMKVVeGIc/ZDgj9TMW
         kNrQ==
X-Forwarded-Encrypted: i=1; AL+hErFzxrWpjI0edmajMXtUUU15/PXuVFqfUnEe91rdCjHC4sbvhhAfAG53tOsvhxnrRznuukyNIiaqETLFwexZuM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8et6NPw7L8lZO0rRXf3kw2i0EB//HQIAd1te0KWbJgOME4tFy/
	Qu2XNMfzhEdPmlYswa6NM/NrKPTOrQkHk4p/YryGdMzQCv8lUHDESFR6
X-Gm-Gg: AYBFou1+F2vZow/4n1yRLlVlGtsSlkmHgE11XtZ1Tt9TLchVxuHFvSfE1udS/PffX1E
	bAbExyMBg1Y2ZNUFEg/5i8k9vT+xyWOryQOthXKR+UEY6LXMcG7in/Xygk2z0QFHRs3oqK0B9Qp
	gSJLqPEiRzrzqwK70JVqqGe+EeQ1AaOnyAUhjVhmqiKw3AbhAif5EIkkDx+/ryVfnkzn5sqS56Q
	Yhg5TEuRyxSxeN9tz1Mx6kNvJCG4bwF45QuaT9k4f8Dh0YInalheBfQ4jAOF9oykEs67gtywTU6
	YeJeyPVY9wyoVUpzxfy9rlIek4nLmFVmidkYB80XsYPCfZDF0WH26Syj5RTgO4+IssMtubf86y1
	V+IAUFSOtDyzu9CaI+IcyOUVnuZFTl1PRErwu5YG3SomDqlbPCDOjUOJAm0PIjZaAFeu+uxoWjK
	o98s+MzBb5doNd7gWOqodfEqq0raHkpnhjSIOSf2AuW0+5i/U921zcPZpYLdu77NQx2L0obObI0
	e07Iy7wLsG1UKVfh9XLpZzYaQRXQaUqK5LHpgF7eNwf9UBs7poz0R45XNejsUZJAMJ0zsIW0Uq8
	zwjgSn9EZSksU4KCEABYnt8Xpxc2Yrv8+p8q/VeRz860MjyzF3EUm1PBEL7gp+uXHWzWexGjvQ=
	=
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr144632065e9.0.1794779234728;
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6f93b3e9sm43204765e9.1.2026.11.15.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: davem@davemloft.net,
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
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:47:02 +0100
Message-ID: <20261115214702.50817-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2: correct Fixes tag (was c017800af5c71, now 1ec2230fc721)

 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

