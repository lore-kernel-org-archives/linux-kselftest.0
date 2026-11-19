Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048243;
	b=DFMH9UEpFluRf66Xw/VVPXEk5UdzpirEjVQhu6ZtGTJqAs53COrJ1KDgYBoqgJ1AP6pH
	 QHzAJ5EmQN0OtWLtVbmol1XZV/JVBv9mrs+Q3BsR1X6S8h/E1+Kn3pGjdTrgQQUKziZ4W
	 46S3Z5RwE82YTjpq8PduUtBruX/nVsSniuRif9K6A5cmW6T/w6ZTdkkSxFBVngNS3CUXq
	 1Kdhkskkbp7TLpqDJtEDdT95Khy830RDUzjUATkebOp7ni7OSDHijRRrkmtmkdVLq3nyl
	 5LljwVCryUJpKDTUljSkLlmOkhHpjbTELfDuYhGZAf0YYu9B3CWYcp8twWcicsLlb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
	b=jcuK/es4F5v3/gfN6NUYY5pY9IPL3fnooBZOwUvC8tZA8gRrQrQUwTtaO76jIYKv4KTg
	 sg1sw0HouK4YNRVtxlGMx5/F4wpwjZwmPVN2vVPs/ht6QwGpwHVcJ8g3PEsHnZDF9/dLN
	 xScXFAqowz5bHtg8mAvvfavCnhMvL+PrUFVdjDde4MhQJjs9a4U6TTAjd8mVZZpB3fVbn
	 zpZ07VyoSEheqkhOOPLBi0alpPCUnklwxs0tIQmDjNgl5Ij9vPLgQT9liKWxBltQ9d6Kx
	 Ys2IIvwn5emj5tNGa7xiUKO6EuhrH1TuwAhgDM3uGe3FMpAZbGcR9vJXaP1O9ogalsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADF606A32F
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ADF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b89399d92cso232231a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048241; x=1795653041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=DA7ly8QklzTVI7vPByhXLORbOFKqcXC58tufHLEdaxrOBAgryP/bxMy8mJSB2CBH/8
         ado34FlA3guZ02gcBVrHlUq0WnZCAr9MTeyv9c//VuYh0Rjht8q2cqzQseKZ2UakxqDC
         py2sLEVftQnh7sMRtlOe+3Q33a+VTzYGzFL73vTTAt2BkjaS9KZeU2O2EHm8+I3a4SK2
         AuulkU7iy32PXxQbvH8aJfbM8R+Yy6Twtcd6eoXg8JYDXAqZE5K6CUPSbF8vkX5rZu5Y
         af9FdJpKLabOZkxQrTEds7KXKdFETs6vAz7Y/OoDQUHbEtMi7TF9djIVNa8O+k0K4x1a
         V2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048241; x=1795653041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=oxTSuK4jHtBNL7xNmkb6PYR2wNeZ+Gjap+CmmsdFu3T7Eq1iimZQON1VETS8OnPk+E
         yCwyYalVL0KeCxA9ek1Kh5zfmN9frLpSbIy4Su9cxaJeBk6CQ/jeTgv/2HtJYLgo4Vkc
         zNoix4EKdTyp5h5srub41o3Y16U4wE9sNT+KLJBBGGYfbwxFACMV8xGeWqiO6KRzjO8E
         Kk4xtq39wKDH2wACFyJiY8GCkJxFBCNquot5ZuXXPKRlBKV9ciQam2r8kkzh5ufoHV0F
         oaesrqOhGb8yJOfjo81l/lvzIGCItjeXHvXS4j9dmcrG4roZdRq35xuWr0FK3tRKT0Mt
         ryjg==
X-Forwarded-Encrypted: i=1; AL+hErHe8w9gz/jzwMO1dN5TTFhs9iup/o76RXXSf1k2GqPc+cJNVWwVQopJOw2XkBGfSrVWyGNvFdjgyinq2SmxVWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t2HdTTLXue2AJQH3ZebOIP9ll1FCPasFU9pV1ewCXx4zC78GW
	sSXOTF9tKuZTMN8Th55Do+h7IcVap3c2C2lTN7KI8tZmf58YkUhaF514
X-Gm-Gg: AYBFou25qcJxzmgtL5KwAqioA+vfzmX0H0qvWWPsnpWoy08PxWAZtJpR8u3XEYKTHor
	V5PaBHQdqCPJcS0aE28MVxKeT+4mAHMoLt37CLWjbE8dDN/SKqI0Ctlz7pC9YGNXrmGosPgAFPU
	NYdSO+NZ2duWkUYYQny//5zDAcGA/DJQrfiD4JaDh9hVRisHGzotFjHqsYMvABapAAFvGJCo7ij
	dJnBRzkZLiVP6qJfQfWzeAO1xxDYOMY6WGedZqJ3fqGHGFRBEkAyoZAsp1OhNs2ybx4i6ZJ7QHy
	RHmmit0ocA2oG+QYj/uyKMX1GjaYP6JK7u52QzPu5Y01R9uEfqSMpFHeBakliwy9wbor8ZOv1uM
	/L5MmC7BCcQlcEf8PACgoWcyZL2EusdJMOsbdWB66ToppPHQtGQnzWW3FQqgu1yFRgcFh+cipcD
	mSYJ+F2yu171BRXUGgq50/swBymNap/pY+qB4EvVb3O17aA2wKRBAqBdiKbvAm0cHaPAhRQDOsQ
	dkiV0fUfyaDJAPVERiED4W4121Dul8DZcCp21L57MR8ggEcDZgElFH0HLSp6uxH4hiYvkDrFMTn
	+hEjPKHL8yG6bYMOCiSePm2k5xc52YTGv28F5jsyRk9KMEW/MiWi
X-Received: by 2002:a05:6402:3137:b0:6b7:aca7:4cee with SMTP id 4fb4d7f45d1cf-6b887eac9d2mr3678935a12.3.1795048241161;
        Wed, 18 Nov 2026 16:30:41 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:40 -0800 (PST)
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
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Thu, 19 Nov 2026 01:30:02 +0100
Message-ID: <20261119003003.40482-4-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 2a37d21f97da5..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -464,7 +464,9 @@ fi
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

