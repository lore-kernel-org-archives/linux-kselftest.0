Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285665;
	b=fwlkybc5/RIOrApTwnoDVjq8ImGO5P7qfWvdwrRkqNIjqpZKpBqR4b/7ZRdorkd7pe8N
	 RfqG2CMip95v3TD0G8mh3FpYFqGwgW0wWuyzEQJmfDn/XcZue5AFJbAkgX/pDFpoLR2V1
	 kZlHTr+8Gdf4QR5zp51cGsdfflZZ9CFawKhApapueToubs+jAInOEvck1SisHoZIB8iTC
	 +wdgB9CIYLJsCG5JmPRsKNiu/Q5TMiUV65ivKtfzL0t3kjD6u5jBKFkUsgO3uEb7AhHxo
	 WIR+HU02BULAoS9nzHZPYKbazPAx+8rn4yPvepsP9sV1oRA79bEq86h7ry13G3j6aNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
	b=Hv4NhskHenQgCziF0OOU5iPx7eFtQDaqop5EXAVOv/sUpDZgmqfn5V1rNl7iMJ6ksLl4
	 c/yK7HtlWqp+c9fuvER6XglOv9N1YUWHaoSAeIgCVMbiqDXX2aERKHU+U6Alc2aAxZjgx
	 +aK40vKz+8sP6gjAWP4iDxIMZnXm9eTYNEpd5MGasjzQaL0Ch9H3+xcnKZA9uesIyXL9S
	 +uzuMOFEhK87+jGaQ2sbmAj9faVf4YOfAglL+AIl5BXwGGRh6Yu4Rszo0reX9mb+R3Dl+
	 AlkZYs2kkxoF/QK2D+5300UuLnVjyL6S5FbpsuVA0g1/QSR5qCgBvlspoAk+ovnwyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99667606A320
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99667606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb8ecdcbb8so1084165e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285663; x=1795890463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=zXUPGsQLwEGN+zZGgQ9AjMgexb5EbRMM7gpPxJDdobyNUS9iZUN8Y6df7qz0H/enee
         3ctFakO8DuPpa4olem5aEcHDy5tiXtIqRlvedpEFh4EYARvvHUS6rpLYqSCReB33iCYX
         MW6CfgOn//FkYORRt+7zqN92XcOhaHIW8Mpp6RAQmUPOgJ3RqyDgzpzITQGb7U6bCIRs
         1TPtoujMNEMP0grI7TvSvT96s0We++NnfDI4HQ92oLQEfo6sztp0uAWjLEObFUc/WV2g
         W7YdhrpI9uD9ooGQLISmiiQM9U5XT+Fmyf5JlOKFpmHP7zdAVWGPJ8t8TsvOMb+FE/QN
         V+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285663; x=1795890463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=2z0R5D2sLSE9CFedwruGMSsbIOTtNMvjtfeZ373vrbMGzaxwFeo1zImUJWYP/mxCxf
         ljAXQt2rYUmMdxcxvl/qInAPEGKkXeztbZkorjQ3EWbwjp4tTwaJXeJfDsVYPEUYf/Xb
         Lyw5zZAT/HR5NHMlGA6T5yxlD5TJRV4bpsv8MlYHBFr+K+qreD9PH1atRB1m3zpZqxld
         qTCa9sweq8SrqODhknd7aJeugtAAOseMuLfaCw/RCCVglLExiKWAvtedN/+Mei7LUFKH
         mr5SSfgY6d94qW/Zg2w9Z1jjdlCITrnxod+eLvxBqv/k6sbPNS06RV/a0GBI5LTiq1+D
         CoqA==
X-Forwarded-Encrypted: i=1; AL+hErFOU0faFdmp/Y5Fgf54C6NLK1DHv9govkkC3SQgJqcTDJNB8+F9dUmGnffi2BpxiDh8XZrfFtogiTp9ZffBkZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z9CRsKwLUHfVMpQAHIg2J1mej3s1DxlQX8ctzx66cgNp6kj98
	+1FsPuOyuzrUyIcEcDL7YSsnTIBPLnWGDNVz9nPeT3ietlVUyoH9bF/v
X-Gm-Gg: AZFdTZcwWN8jIe1a+9YS2lpT2N9/LZvVXA429yn5kJcZxMUIcEiI+N0q58NrSUcXdtD
	b8S03HXrwyZYu7uRAGO70lg8TxUPshdL/Yz20CzEVCvt08ZlwTZUtyXBzTLctYiZPK/gmfAcUWh
	mV4u3bbNL2qpEEwmgMdSem96izOoKNT6e374nW5Vu49aVKENsVlpNIMBMwD+kIUfl3GyJy3KrHp
	gsGm7WRYAkaEBEhboanWWXkt/l1AcKFoGadO7JyJvQJqHRaGqOVAitSIsFsapcrGgD0RGvdo1qK
	r7RhV5lZzVIrGhuJ2wErX8zVj4hUquP0valWEq9Br4YkF87s1oqtl4ACD0a0umJPRPU7l5RTHvE
	BFpM5Qb3TipkdoJAH/2aAoAG2+XZC2PfgB9SL8OD2VQoH88N7NSwr33eR8Z8QDOJq1B2q2djaPD
	w+lKjexyd5RGoJhkLY9Da05cfLEJ2hejf1Akm707YBrFhJjve77oSRIZugQw+jN5Irp1lbfqxtJ
	n8IxovrmPQ7jE1Q7PpVlirvCzd5SpewzY1MHFF77H9ejlFhH93hBcjB72TjnVJtqW7F7xIQWbU/
	LWw4pDvb37AiJHle8YNhrAMhCBzC24gFdEqYs/8XXnA4fL+nvsMsckIAQlIc2EWpktDVcA==
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr15300169f8f.2.1795285662799;
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
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
Subject: [PATCH net-next v5 2/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Sat, 21 Nov 2026 19:22:16 +0100
Message-ID: <20261121182217.4609-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..7a2bbed0263e7 100755
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

