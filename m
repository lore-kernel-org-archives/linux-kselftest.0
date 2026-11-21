Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285612;
	b=SbxIbRGJQO0rIlJdft/GudNAsUM1jQO1ZbYy58MlC327AOdYCDYgnr8kWSJ+///ttG5e
	 aKh6yzLf3Bue4Wd5KOoC8qKHw0DsZDGgfchVhdySOHCS3Hr2Rag+ruH4MY7P6r21JyvTO
	 c8G1BNpchTNrFIC4KXRi9/xZbRN7YlCsp0o/e3D/CW2e+OirleOdxZqtLwBBVsDSDJn81
	 oLD0iWmJWCYD6XaFN5tYcwjNRuSAE/noBFJO7A6muE2LPrmY9NjE3GDmchkIHcWr8axJ0
	 kJdwODEEJqzhu70ie3BcOmkmvq7VbmunhYPENwF/zC8u7Ls/0OpG7Mbgnl7M7BSvaxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
	b=EHUPofRBpzGdHW+wJNrAZmwMnvW7hpouK6lOAFDcXe+tyNSz0hvE2kGxEOjMQ788xigv
	 Zj5qGuxb3braiFnl7lhXOnyo5N/VCwGjSUesmPSMi21ncrx1bVDs7dbSyZCXVR4w4g54I
	 4lkmN5lQw5m0GSbHklP96Qr5AY9YddDHdZKqxiJYkYjg41ELqaxjo2usmLKb7tOpRdGa1
	 pD6egYislEU1xDBqDmNT4x45lPLQbIpv7h7Lb2NzulTushD+DsOxJ0apXKMZXd2gXBU0D
	 l0eEaFSj4lWQY9OAnSgsa0mKeV/eLID6pGegqFqKHEEByX8eSf6KQQkptC0xGqoeISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67A606A32A
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F67A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5e3cbf45so1616585e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285609; x=1795890409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=fKvVJIJ3xbhMBJPHM5lDunHvwr/SsXQmTjyx6iydI08yXI/VFQAys1nPxfXh2/vKId
         /j+pNTygWGLlZbjeaO8Yq02y6RA1fZ02FPFjhA3564s4/koTy8ZvpVZo6uUqgoytzELk
         2ZC3WjtzjDSklWaf0cSW0ELGxJ0Kcf60hxCEJn1ZuxzlGjGZYwhTf5i/4c27bl6e7JLs
         S0AUM7oLy+k0khZvIAu3zCW9H2YhrvOATfEyLUddeVsUB2kBLVROU1D0epJCMUoAsBgc
         2dXeSUGNqUJ7Nc2tXt1cBJdPbHgiTAlX7jMa+ANtAOQk09A0bHT6c1S2HkKmMzjhcE/N
         x/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285609; x=1795890409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=YhwVqUUABlGPhDu6FJP0Tp0GcquNYPkIx8t6/MOnJR+tqXCfUGM7B8lggnF92z0op5
         UlQcBYNa3n5FDiUI28cdZuhsrDH0JKvasPJw4jdbxGhsvXcyTALOafqpNK1KEJGoMSwK
         7r5pCrRyMqUnvYZJBXgU4OAuLJkmh3jQi7rO9upDD/KPqF6e4P/10O1k8azPGecc/lzD
         0O9ZS+XUpETpCk3uf/yEf1s5Tix70W9+Fuq+Kpf8ptaTWihpdUfdq6kxutPJ2uOTy8GH
         pU2n0Em50BiiGZHHa6/0yavGnYthI+qBgwBMGKeaLrWwfdbr1Gk+ODxwc4nX6UI+azqc
         VSFw==
X-Forwarded-Encrypted: i=1; AL+hErFkypBBWflQORPsAve8cf1ploXtUir2ASivX9KNF+uk28GotsU2Vu3wsuM0K8gscpIQajStDVhyOn5eVkS1DCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O1TiHMmaHVA8hT2fYq5259BklPixiaekSRRddrIffmLRG80yX
	1M9sKG29HnWeiYF/9g6oTMsRt+wf+g76P7TeK5BHaqHwrORHrc5fNNkc
X-Gm-Gg: AZFdTZcWDDZvQeqAphUriegY3qJwWJZglLFgVXfM6IUGm/8thNloYuEzrnuNTR282Nf
	/jd1kiuSGUi3iiFK2KdNMdxoM+xtuD1p1l1fp3LE8YA2NDJYkCzUxuLVs1yskAa8/kkqAo1CTQM
	3HR5jUNK1YAGEW7lgIR5Z39Vl0KZLDOxDjfbHFrLvtnJv+fO7QDeDvNeOzd1AGuP4fMo53qJeT+
	XmjsQXxNZHxtxnD1JVjIeS8lcK+KClxlVJ/gCwa4ORFCFUYQqJD+7DypyzIi8dPq7/W3Jbqu8kr
	rfOZsS+3XdNaYeh868E0y8zs091F/RkLFCSK3EKT2z/LOxa5QUJ+0/boautvJTfOB4Cqq//WSXr
	dYQFeYmhA3cwbwRP/mVaaVO7akpFJV3kRS3bjFyIaZN8tdaYtws6YMTxeUm/H3Cmoo+MWuIdBS1
	5jGbO6u+KWQU6oSIN89Ywk0ye+NllQAK/jomDtretF3dmLqXWYI+iJdbziBuwVD2qKegu0kjS77
	bHTe1kqhnhuzKgigYbnC9N1+Gpq0qF/oyF8fR5k81yKxvjNex14sP3/rmA+Ij5mWd1Akw934Amg
	1Ma5k4MB66Orvh5o3YDow3FECFjMpJCmQo5Zme+RqS3xFNRsX7nmuYS5IW5SaqiROfcQHw==
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr143498125e9.0.1795285609454;
        Sat, 21 Nov 2026 10:26:49 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:26:48 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Sat, 21 Nov 2026 19:22:15 +0100
Message-ID: <20261121182217.4609-2-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=`nproc`)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

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

