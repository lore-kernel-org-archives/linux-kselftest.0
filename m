Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556451;
	b=dNaioBun7XGbp2apjZB/214m+l4WwGexaU/PrHSzlzG7g3yMX75i15VeIMT5Kx8JdCuX
	 EqnFjlLLJiUgGJS8ztFN7wiUY86CV4hep7DdDtk+zH5Ancmr+biNm2o+x2Rv7D0J0GZJx
	 aqaRiLG5f1qv3UYAa7WkTPqgbshwPEdvr/3bH0hqsEygbHLCd4rGgARlOP95rfk9ZPHxT
	 BeYEVAxZK3lECE2vxadgYsgKi+oLgZ2ZHZ5AeAPt11JlU7elqn56GihHtWT5R89wB/tEy
	 yrnpyHGIFXXVvsJy8LgNTbhm6HsTsHDL/JLFb18UxjPOPiozOgAQKJgvesJBuF+vIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
	b=xN71NcCxaXxKyyDXx3OMd8cDbhU13kt3QiWY8mtDLSbAojd2ESoHiLkFLzqFN9PEtWSz
	 9GkybRTzhTvApCGYvz5TdsogWwF/1HpNTcjlbVsUkNs41/J1UEfSS6jJS/tnK4WfXrZPk
	 aYgwFOnIxAICLP6pBC/6bVRFQxgT9aMCuAcmd5+3tfLPDgldeLn+D6fn2X4dIOBubZllM
	 szmjD0wQeb+h2Y6f18rMwkjqTDy+HbcTasn2vk3xedFHCUfe8YMNAEMT0oJLGd2oZ8PV/
	 u+SqNiWMT57XfIACwydjiTa7zi/Dp3nIVonFc8DDcFgQeKxdrsVt9UiEL5MA7Xr4kBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00F606A337
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D00F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a8eed31158so417542f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556449; x=1796161249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=tgNL8acBEFQiM09jqOQEKfm574cwa75oomLxVmAtzuC7msa6gwol4we64P9TRE1Dc7
         LXCA3IsW0m56tZnI0CQeb4Fm1L16FbwhcFbLuBopqGuvQRkrQNqL/neNI+9lyy3tn2PC
         f7coVRR4igE1DnyCqM1TZPV4Wo2SF40eBunmfhsZKzbfpatP7f6FHwEt/UPqFDXMdrbr
         yrGkO50XrHR5wyHxAKbkhWCwhQPLQeUTsIW9jKerUd+roFUgp5zxSlATOpCLFjL7eit7
         hNNj4fYtUfT7ndzyR8mLaNequNVrryrkOwM9FgKaxtjHwzgDreB2Yuq9hbI+Oou3lm1Y
         YSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556449; x=1796161249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=ky0/OfYMklN6kgDkpFY1UJBvZ1NUPjKsvK3wwb3EjD+NP1Q3P7hlYnJcYjaxBHBsHc
         Bnr7Z2jCQD0BRf+VHSfop4XiYklyiF1it9wpEMPYvExMmNewWvNj1J90n8C0Zk1tflv3
         gk5zYxUj+5JQW+Zwmh7yb9Tn1E11oknH1H4+ZUZqtHXFAA/r/cT8/vI9f2IHHJ3ghYFz
         4IPAyz8LOMEo35+F9jwTc7oEV6Y4E3n+J3x/vZ9KSHY3oDUYCNNYuq5LeNqaI02QgFLk
         i2i0rq1Eped+BSgZpIhdGxmTsVbROI+2tjMRRIKIpf7tNClkkDISjCs/iawy8fR7FYWx
         mCqg==
X-Forwarded-Encrypted: i=1; AL+hErH1y8qfWwvHpTRrRQUkgMrlDA3PPvWUZWXo8fPu8nn3hAaE+4wFfQygMvWXipu94kxXy8FEcIRBOTGnWiOZSC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vOUxw8YuNlELlRFvkzpyxwjFluWyASRHxopVXDLTphsx5pDQj
	2r0Q1qGekMvCKmxT6i+bAPCcpbD0o6V4fu7FqGp5J0UdHnrKHMRkIwlB
X-Gm-Gg: AZFdTZdv7X8tiYVnBVyz522GeAIAQkFcWjJPbIHbNIvy/u06gceIKdSnxRyNd4rQIzB
	ffsCjCT4LaNaOxkIji8DqJ4DUYIffqeh6l6RhavA2J5KmDL2HdpCDtqB/hj95rX+GzHRcnisPnB
	SZsMX9/zlo1wuWgZuZMtn+f1CbaK8HjIXzPdZDii/v27Yi/sUMTo8SFGjkw/+eQqQolUDu6+m9J
	9TzyWxfzcr6iIP9so28wJmf2iiM/dR33AgPqaZDC/dQDFAvJSjrCLbj8N+ylqRdiANvd56FwWrp
	zzRahcTF/qjbgEynLmYqHPDkaSrXXE0rgH3z3H8e/lA8Wz0NNTMNFrWwv5DUn3xCtN9oQ75PJ90
	FSJydfGqvOwNUpuTsOcWgEHveCSc7KktBNza4IY4vi8VA4WjjtHYWu4kl5RISxtZ3P8PSjUUY0G
	XMPzeIduRFLkNwofGi/CtRFactVHHoNtPXGBZIxWOALLw2w5iu4Y5z16SLQm26PR0wC6JBwksAJ
	D1Af5eAa4QXxeqD30CEoc7AHpTYglBUA9JDDgVtn2L3FNC7xqj19nX/aelXjhQh0Jo7qX0T4opB
	0MCEVrMfJxNHI34gQjhJXMUV5hjsty/MravdcX1w2OrAb/hcLHBeXndCQcfDpbrSHHhh
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr35909736f8f.4.1795556449580;
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
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
Subject: [PATCH net-next v7 1/2] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:40:24 +0100
Message-ID: <20261124214025.11603-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=`nproc`)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..22246278e6049 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -463,7 +463,9 @@ fi
 ip netns exec $NS_DST ethtool -L veth$DST combined 2 2>/dev/null
 chk_channels "bad setting: combined channels" $DST $CUR_RX $CUR_TX
 
-ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
+MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
+	grep TX: | head -n 1 | awk '{print $2}'`
+ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
 chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX
 
 if [ $CPUS -gt 1 ]; then
-- 
2.43.0

