Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777697;
	b=rIkfKgz1MAN+dypItYiFd58P3FoGXhf2nImRaR5+Ngn4CouCsnOSSHMLOY1pVSKmyomg
	 vzYu9m9CRwDCaE8Y5ZLLqp6Y8aN+Xprpy2bInhbNDoaUCJG2fM8Esv46f2hbqtJrC6hwF
	 bWSplEP7EsAcLAI1NaQghNHkTAjm7Y7KqHegACfGKhjRo+pA877wchI3/lsqJFuMet883
	 o1FLhBlwt0wIMiFdHDmfz/xbCTU1OO8yziEmn3LetRck7+SvLSuC+wZOYMRQQDH+cDayY
	 4P/fG8AojybfWcW6EOvDfQCPqjpoHMaq4wKOBsDflkW+O1hPG9uCNru7xiLcxkE2uxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
	b=fUKdiuBRRoXix9ovhgOWGvOEbK8JylgA4UTYAv7ZNd/5A8SR0ZWc0ZuXgh2/L6T28JQB
	 7yciMOHbw4Q3AiarhOwgxjJQ7mljyLHaRBs23ebNwLaBmk5D9biXFUrA6YmrQ5Bm1zfyS
	 f+dtiU5lvkcW3YeZ1mM5lf9PhYFIIqBQp03QkzMKiCcrq2XVgXWAi1OH3CmQdnlN3nbIo
	 Gua/rOcaWzc0HiGRvFK494mP4Kl5ze0vRZrMbs7zjPYp+e671AY63qf2BES+IxnZ1Cgru
	 K5SBRgDJUJpk6IcW4wfxHYfxP+EBgdZVs81k+SyGgi0WGO/vA71LTuQzHNSW3mWEdYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4E606A32F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 21:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD4E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so2977305e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 13:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777695; x=1795382495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=agEhoXKQZko8bWKNlYxvZnSuZxTEFOAB6dprNXg3wBYx1g+Ln8WIwf64vbZs/XcPON
         0/QhMLpasTuzhFHeo2IeqL71xMbjbhWyUYmFw7eXnGCKieUdV3jr3VwLzkL89cSULzMB
         xAvKL6ck0ocm9TP4QAEy8ka5xvnobcyDJ/jRdS/TLdB/oLEFdQ+iiGgSOOmZepsfkYgO
         DVh8+4lCkqX8Vopm2PCo+FoTW7JhKM5cHIbSPA5fWhJAK02mwBR6AomTb/JGDc8S+xo6
         A4wlSMc3Qxz18C/gZ6OW3d3yJHpIFgPY9uvsP2VlxtWYVPLc9BnPdg6CEmcmdGzqNWv0
         uCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777695; x=1795382495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=o1+WfqHRsAUUNTjTXWoe7qHCBoKlQaL/ozIntyQG6XNc+yhfkwDuEtBgBarlIx/iYZ
         oP9yoHw2pvWDeQagldJSdPWhzHO6si1IF9A5bTNtVHDhLZKjApFqUB5cfp+cvlSLRvML
         ucMRpLNz8E+y5x+JuVYDcfOTsgfx+NqoXrAoxZErsoFW+oaN8yxBPVRHCmhIFUCyU8gm
         5MFZMxWKkn4Ga6Mzq4U/HNl60ZbreJG3BadbMQi6G8eH39sn6bVC0hTod3pDLXxN/8ot
         xHjO5rKHs/z7HbB2e93sLSQ3x3+lYm/MmCWdtmYaY7izmBA6apdL5QsDkZHcd9cdnauY
         x0ug==
X-Forwarded-Encrypted: i=1; AL+hErGOlmNp1pkYeNq7GzEYQtdb99nQrFn5420TXKGafXEPHM94ua5nMlUimLfaWtbiWlpzMl0biT1ht0zi61UyUmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5reLN93bV/5qEaoqPRjKuSpbZKNGOCyCmGooL5QJYEoVi29Jh
	qZy1nWf6O5qLS0dFKkYgiFWUWrwROgGfQAaDBsYSExr2FgofKLH1HXsH
X-Gm-Gg: AYBFou1bstd8aUfiL5+ADMrRKeqoF5d91/lfskq2MkVUpdh5qilvK2h1/4EpeSOlu9f
	6l3up8mwCww/ZPKQYZpk02FyB0GKAZeEXyTdy0bs4HotwgnL9ojN/oQnFMx5QEuGgFOCz+upr1o
	OpGvoxYbbSo9dcC1AVJMNZY/XOWLFBrbwr5qvAM2p1DFzQwBy4RocSVs+peoXf1ZCt9n6e1s2cQ
	LIv2uFDq/hSj4fkUHZwGFgLRGXnnSwKYP8BV5P+NjydoD0OCb95o8qan2SGNnH7RBDF2Hi/HqWu
	dof6kRB2spZhoEGJ2uv+9vxzX/MrJBdBlLjY7uwoVq9Wy0k9aoAitg1Ye+eIjbQqe2kOX/xzB46
	cCDHqdFjK4Mz/jsGB85DHflr5DJAebLB8gTL8md7pDJz9eRaAAWrZ7wlviPb4Vw0QXRBuCRSJ0c
	aK+baSQ7unQetwqH3oUro2k4qjcpbTIMkKjd+zATpHFfvb7svfsuNKzKIEo/4tsliEHW1mA4DIr
	tEgz9wpSqbfeqcm218QcKm6lxhB8W32vdvy7HaXQjOsqSxct835zqXQxpxtpPlPE01tozKypLuw
	MQKJUwVdrOLM+HEdsf/Fn1FF/2utxbHwoo78sjRM7kmFpBxpAVtCHVQCT29tluYBTscZK+fb
X-Received: by 2002:a05:600d:644d:20b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4bb55a3f05cmr146093485e9.2.1794777695431;
        Sun, 15 Nov 2026 13:21:35 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm217726975e9.0.2026.11.15.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:21:34 -0800 (PST)
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
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:21:16 +0100
Message-ID: <20261115212117.48496-1-emmaonana18@gmail.com>
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

Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")
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

