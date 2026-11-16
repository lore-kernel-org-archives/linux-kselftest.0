Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818511;
	b=q7wKge4DPIoSG61loPJZJBoY7WgAdmgMEoxlvKLemgXlbe0SusdEQ1u+7pK1r0W2X0gZ
	 FOZzx18Ejq5D7ue6pSEm9X3Q2gTk/JoEYF9zZmJhsS1mBzMi1uWKJ1KVR+mcSsge7CWOZ
	 0bqKhEE5xKOPGMvCHGjibvkLNdr10oCLXMAfc7x0c4/QCXQhgWlbYmRRs30+j8rwNFmLT
	 z9Du2E295huhLHuNaDK6xix8lOQlG9CCzipBtdMDGkNF2jHKtA6o0qnvtfeOQkGWgbXEP
	 Cy2Oo1F3UhLFMfMuJk4M18ki62zDZkjNljI5lNGDFayxsnS051SZpljpQP7F7vNW9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=bCgyFyMYOsbF0iZeLiRZcv7CRi5cnAevsAePsfuJOt2eCJNoe9MgTVfplB30WVy4rMqv
	 L5nBvUv8hsa0rzS/F2ZBssFnVY7JcKmtQuiCNGoBDiJgs7L6oJH15h7+yRbZmGbtIqItt
	 apZVrh9EyscF4TmfN+5/dwdmXOW4zwftcpMuRyS3CcP003w4JiASCwSttlzxwN9/83hZI
	 7rerxjUXBaKVVfeR/AR9S6srplwhHC0NAxfJtvZrQmEvHDaMBSjZYBnvDbf7SfVt9FR+l
	 VF1ppvuDEITtpUAmQXpQoTYnaXY56kxZLNszJQTtgOu4ZTvyyYlTPTatbEv+5qZ7RHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67115606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67115606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb5f0c5348so1071995e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818509; x=1795423309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=wd16GRgRSa7VO6+SybNxvyCo3e+ypxaoEE943KTIsD/URI0L7FNt5Y1QxdgztsIbzP
         vF20g6P9Ktu74GZMlimq0HKk+vWaEwle6X4Svezwg4s6RXBYrx8S5z74domL7lWnZp1v
         /XMRjxSCLazvCJaMC/+r+zmbSmeWpNmUanwHqyrECn6LRLebioR7kYeyQ4az0mgpDkJ/
         wRREOG4SCTvGq7W7qQSyGbktgz+TJLCZ0QdACr6bLtQdcj5lBieMVBPjEwV2ycuHNLch
         mN4WLOER4fz3sU/0HEfVHSC17CBGoVwI9r3N5DycUvO3wwahoUbNbqP2Dp6ogpE46k7n
         IyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818509; x=1795423309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=UBo12l4aX+5x5hOcOfoZaJJYNyqnEKbKgcmURe3/EBdTsuPyI6yZO/e2gZwp5kurlM
         lYvDnfU73HnV/0QGUzyqaSRarL2X333WdexVAaooqdb9WZZcDcB1CiChwUCmbfWUK2hF
         rV3/MZ5wkt1APPSUOKpVnJqbR6r3fiSJBygR9iv9JLex+7QCBKw6Elu8EN7yuLcRqPIe
         MisozsVqGAZXvdcWL9HdrLftFcBiGovNXdG+lvZeyrr/qtSkkNrgbNv+p92wzwgyU8aE
         ge7g+npPGjD8XAjv0A8JVD86rfJM/n7Z70FwmNxkoWdwvVvIpWQi/yGy+m9nVHPXsfZT
         AsQA==
X-Forwarded-Encrypted: i=1; AL+hErF37OUl0ELzjM3BKHJIob1wqmjvf6w4cyYOrjrUN7P6sKjaPvRv3vZdNFmgjZNzl6I2PpnUDBREobWDeUEp6J0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EWg7ovae/5TcGTlA2vZDEEicvnmvrqrO3oQe4OrtcCh5dLkTF
	sWKpBOWBlkzlV4Y3LASyma4T5Yh26UnVf/XikcSISfPOIA5teHkvDBUj
X-Gm-Gg: AYBFou3k2ZY7PBIZvcMym+XxDWYlBeDVwdr8zohfXGYMGNejxFhT3zDWMvfOv56DUEO
	URpfpS3u1SiGzPemAUWyQcmGxvAhusL4flE0fv+Uj5KdDJPA7tgA+yLHNAmzol7h5CfBiLwsrrb
	P/PCd5ttbrvUASuA93el66l5rnjlvPWdxHGu0x0Pn12U4zxtLk3/4A7sJqzpm83EBQiRzFfCN/h
	3RuQa2vPG2y51EwcPFPHbPXcKU09qiQjHJ2xDRBXhOYnBq9vLVLnrGe2HdQ6SDyNIO0QrRZVydz
	fif8KxytSukDb+J3K05dY2FOwOffhZMbWBT3UmRpHwMLXcrGhao7tjAPwzXVUTCdLN3VkxhRKLu
	2WcDiMhNez7wX6RlAZbJsU+3i1ca6e4O4WvXnrfSaxoDlMuC2FXYn+FZ+a/VEDeT38pl9apageo
	1LyR1qMiz5XgFCG1xg1zbwiNIxJhYYea85KibRniSDy/SWnsRBYcoh0waZRXxmfjZtOO7+BGrjd
	JoM1j0vsHtNjP4V/1lKNAkdh/KehsykGaMmNXKmJlCRVTJo3+CCKj6tJJammFdXKWXsKNuzt2zU
	Oca56G9Vz0sZEFt+R3pMvIVzum+twTzCGXLUXJIOAEvqgDFT6c7vp1mSTqgrzbhzGsFSDhc4
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr42466605e9.0.1794818508748;
        Mon, 16 Nov 2026 00:41:48 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:47 -0800 (PST)
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
Subject: [PATCH net v3 1/2] selftests: net: veth: propagate channel-check failures to exit status
Date: Mon, 16 Nov 2026 09:41:06 +0100
Message-ID: <20261116084107.6675-2-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
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

