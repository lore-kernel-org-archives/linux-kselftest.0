Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555052;
	b=o/dgksGQhnT4dGXvylkOuT7p2LHlDVdiK8R23rZNhMbDTiKyiiYEIzwDoMKPS30srWzJ
	 /AcN7L/ujumQhJY/I/1I1lZYiX4Hw2QoG+Y87XAwUVqCPenRllj4UI01C0RfLJE2KjXkF
	 wy6jf/NCMn+/GvppLbZPTkC2jvzSzMo/uTVY+ZPwtb5duRFUrA1j4//giTgsb7GrQz1F4
	 iQnCqpo7u77LZhCHfX9eZuin7gTiFm6wh0DWHKP82UEr0e4QGHI9mqiaUXPJLGbqIjNE3
	 mWXlXIr7t8j9VRO8tlN0+sBNtDrdJ1hXfQegHlNiiHVAGBqN3xnFCh5U/zH07Q3RMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
	b=sHe8u/AdUXgHhVbTl4hk1FFuOUKICzVzF4NWf5FnfDdqJg302wchiLBCB1wdDkTZY6Bu
	 gfgBczvNwoJM5yuJVO+GRdSfaTkOHq/x2cJgAH3diRY6yPQMvG9XalxMSXg6eFLSCL2CT
	 FmODtzRw1ki152b/X9nTfjq6xDrS5rnaVZC8KsvemGiJ+ob+9Wv+zcnU5Io8r62FN9qp4
	 bVcILpUdjKYpuUHpfvORBBbvf8rIvIFPkX4HWZ9Xl5ktdzfAxZZyHcq95ehMFfACd/Ph+
	 gSeVVhC0sCk2N03qN/ki1fLx1hlSEdxjJreGXzC7Inuv+stDjpPKa89FzqPKVQazvOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBAC60A260D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBAC60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490b7266f7bso187061f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555040; x=1796159840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=zQskcA8ZlHw7+1G3I3S8bg8c2UnVXlDZpZFu/cHgKNGJGagbRIqOyY8ZsJbyrXc3gZ
         s4tIZ/+yuoMMpwlJUeGZrac0nZPZTc2nZOorRhGee391KR2ctTyoGtIXZ7o3NSEJxRjc
         m4vcvdkH/VXXFLIiQpsIbfJd5cvuFI3aSATqy6dwE9CDrGlBMc7f2YT3ZLeuP8gnBA90
         7kVR8RjQwfYJQq+Qw3NCCdLS9Q9rOShcLzOfNWvczoRzXOeCMuPdUHYNIpcrXOZV3vf3
         ClZeVw94hZhtQX9wsvJnTTvEMf6F31dOKw5kDD3tOtGEHOWCZhTDg7ROxHfnuJLC5yFC
         CIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555040; x=1796159840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=PFXiSSkBdGPZ4YfEAU52ZXTDVCSib/q99BuuViOhVm5ATGkccNAaRBTpjs8XOAITJu
         v11Z7g0Yk8czuLfe5vX3H5G0j7sowhHuEM3jTrwLYPVoq588qM/anQAo15HAwsnXQb6h
         N+r3uB+S+7paeHwIt0iuCbox2d+MvKtTbF5gKkXuc/FvufYn7vshN2imssid4t8E46dY
         eq11YvtX8QWCKicGNqyD1ojzxC+DY6ekImIrn2oWGfz39B8ysVfLH9m/DeFi2IpHznzZ
         tviGWPZ0N04PRhc9xPDHb+DGCMCTwAaH1aR7HTWL9ZZ1ry9UzYQ1ZNZrjtENSpCOGM03
         rpvQ==
X-Forwarded-Encrypted: i=1; AL+hErG7alDO88kXuqiw/qcye5ybStD8dkm70NqQlEKilvgX1yaBVRZOS2rNeYnlk4aGuGYMCyWXzq6pLUHE+EpD520=@vger.kernel.org
X-Gm-Message-State: APuU4Z85jwfqtIUU18APjzUilJQbWQ080cwSSKfMCy5TV5KoIWa8SdQU
	VQLbdVafugF+yNADYJWr+2YtFHqtAyaWQaVtkpjkPTdrADD8SWUT49xS
X-Gm-Gg: AZFdTZe0VwxNr1ZD+gyWV3P4r2YsbTj1xHxzaGhg/MkVf0hyNnj8F+ULGiT+jfM9+tu
	kPRBuaG9z8ta/Kes+rXlbk4pkIgPAespjDn6/aiPt/F9ylTLFoUXIPnddPZmVjuS0lMsjV196eH
	KzRuSn5q3Qv5hIR8Ps0m22Ll0GDDN81fY/1rVeL7oj5Hal+hWJiXioVi6F5iroSd8okb/tV1hIZ
	Rokbl9wfgt2FsLHsdu/FhNUFAAaWWmJgk8iYMwOjGlGlTN0MDwye8ey1kqtHi042SI5o1fEckvZ
	op5Nb0YZ4FdMYs1c1L17qUjOQWK+IaXC6EnMar8rZG9HxLqxAwkq5Mhxb2x4Ip9wskDGG1O3Q5P
	phBmBQyKJfMkLfEZH69Y2oSssj4Cay1X19VWlajnlyK54Hms/yGDSvclp0Va9OMdQSpfcFlg1qI
	R5dd4QfFq5496/rL33lz4/JPymQxT/9mqu9iT4wsP2pD3Rq+eU+TX1tLOQhj+We97T85GF1/wOU
	4wKXsSMJwiOh2SOkOJP6RSfi1ezNXC7gd/LMr3nMtQKcVgzeEc+3EoQuXrx6g/B04+1mxOphgEt
	SHgmqmYfEnWdof5ERRr4UnwMU792TFItaO6MSRlxrTK51eWFFOmaP6D4ydgkSwVNoI/s
X-Received: by 2002:a05:6000:4812:b0:4a6:bc53:2472 with SMTP id ffacd0b85a97d-4abb3b41cf6mr29086128f8f.5.1795555040099;
        Tue, 24 Nov 2026 13:17:20 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:19 -0800 (PST)
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
Subject: [PATCH net-next v6] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:16:44 +0100
Message-ID: <20261124211645.5751-2-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=nproc)
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

