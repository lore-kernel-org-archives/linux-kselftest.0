Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085528;
	b=JXvElR5UdT+TLkHqXUk+DkgQ9bue+8ZOTJxbFo3saGvHda8iFqkTQRsKgOM0Sd0wMl6y
	 Vk+R1AcQBYYI8A7cNSkNtyPmWZOb2euOYR10o+7XCpyO7YxvGOh95/VfHHzABeT3RpRYs
	 kowB0kYoeZMqVtrCv2GH00NTEscneRkhN24su+87VX4otmm0Uwi5CYjCo7gJMnfu6JQV4
	 FAgnc/FEoe+QBV1G5b9helVtd3JmsRa2waIb6KkCcOxo1Bdnzym5xlbKegMXF1N/wVuXW
	 wNZXju5QHfxYV8ZO/FsPfr3GZWy3zVMhA9by1egjMUAO2jdABHB79Hlmglk7n5PhuSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085528;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6Pu/O7XRC6jiugVBn+DoiAJQBIT+O5R5wQW6IGBlJEg=;
	b=I0B18DIydPpeMVo/kbfZ61yIfxzJWhinPtldS0uUYQ1zeiUTIqLIcduynvfMqs09MWso
	 Mc1u+7JJVJ6CjtnfD+Ricb4YSnqjafkQUirfzm7apr2kq58f+QQO/xt06B/T5bllbYssV
	 jfH1ZAdbNwB25yc9aUoM57tCAuoTftFlQ8iNvG8MN2sYZvya+0F1/qAAXfm86zOMg0GzH
	 rL3UvK13H9efEb4Z55J7dK29UOmEGY1A0ufl/o9bEV+pFgqoHM1EoqRMF0WFATqBgoKRb
	 3G9u476c8CFwlAouBbNlLA9QTNNiDN3D/PkjrW+imvZ2fHfAa8d5MC1Q8CbynPUBv4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhngCj56;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C6606A320;
	Thu, 19 Nov 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhngCj56
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249251F000C5;
	Thu, 19 Nov 2026 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085528;
	bh=6Pu/O7XRC6jiugVBn+DoiAJQBIT+O5R5wQW6IGBlJEg=;
	h=From:Date:Subject:To:Cc;
	b=EhngCj56F7eMn1Fp2gQ7B/kSYNJbM74fHG82r4ZeFqEGLDetWKqdkrOlJpaNrQYWn
	 /jgH/PH6UIkq3X1gvy3hCyFll9HZpODdYupdw/lj8FSv+TxLiETagsmOHo8IaX7j3A
	 J2lt+xaENVd/wInP5Dw9HRBzrLp/dmz85VK5yQkpbiyY5B4v82Au1+cxJ523i2aWVQ
	 u9D2t+7uuQRY+FntBcOtGaop1oFyK+q+h+8arhe+rpI7MQ9rJtyISjGPGBTSweOQ5F
	 VYAdLyAnnoqUPNG6j5mCS+CfS/vnk0EZHKVpOd9RTaNExxBGKXq5j9FYSViCVGrCL1
	 +LQVGPIdNeTgA==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Thu, 19 Nov 2026 11:52:01 +0100
Subject: [PATCH net-next] selftests: drv-net: netpoll_basic: xfail if no
 hits
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-net-next-netpoll-basic-xfail-v1-1-206bf59911ea@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWM2wrCMBBEf6XsswumeKH+iviw2Wx1JaQlGyVQ+
 u+mig8zcBjmLGCSVQwu3QJZ3mo6pQZu1wE/KN0FNTSGft+fnHMDJiktdasyTzGiJ1PGOpJGPAc
 6cBCmox+gKeYso9av/gr/J9x+i738U7hsdljXDxQWVNCKAAAA
X-Change-ID: 20261119-net-next-netpoll-basic-xfail-7da4cdeca5b9
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=JdYYxJK2zvNG6LV7QU4dsstQ6xvf+jboNS2+aJGdgio=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLL+Xbl6exOfcNIN5dv3J88IEJ94o6/y6+K1jMtYk/NUd
 wmf+jBvUUcpC4MYF4OsmCKLdFtk/sznVbwlXn4WMHNYmUCGMHBxCsBEiioYGabe/K3FtPrf+fvr
 VNmuVMuejbTdNandbNq3PbXXgtZfnN/N8D/Sueowz/J7d1Zr3t36/GZV9Y7my9s/SJxwsil9eX/
 Z38VsAA==
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

When netpoll_poll_dev() is not called during the test, bpftrace doesn't
print the '@hits' map, because it is empty. The test then fails instead
of reporting the expected XFAIL:

  net.lib.py.ksft.KsftFailEx: bpftrace failed to run!?: {}

This has been observed regularly in the netdev CI with netdevsim, since
a recent switch to Fedora 45: hitting this function depends on timings.

Fixes: b3019343e4bd ("selftests: net: add netpoll basic functionality test")
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
I added the Fixes tag to help people validating this on stable kernel,
but feel free to remove it if you prefer not to.
Note that the test is currently ignored on NIPA.
---
 tools/testing/selftests/drivers/net/netpoll_basic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/netpoll_basic.py b/tools/testing/selftests/drivers/net/netpoll_basic.py
index 408bd54d6779..a4dc68c828cf 100755
--- a/tools/testing/selftests/drivers/net/netpoll_basic.py
+++ b/tools/testing/selftests/drivers/net/netpoll_basic.py
@@ -236,7 +236,8 @@ def bpftrace_call() -> None:
     global MAPS  # pylint: disable=W0603
 
     # This will be passed to bpftrace as in bpftrace -e "expr"
-    expr = "kprobe:netpoll_poll_dev { @hits = count(); }"
+    # Init @hits: bpftrace doesn't print empty maps
+    expr = "BEGIN { @hits = 0; } kprobe:netpoll_poll_dev { @hits++; }"
 
     MAPS = bpftrace(expr, timeout=BPFTRACE_TIMEOUT, json=True)
     logging.debug("BPFtrace output: %s", MAPS)

---
base-commit: ac9dfaeb9cd9ab731c14d202a2f00098f0417766
change-id: 20261119-net-next-netpoll-basic-xfail-7da4cdeca5b9

Best regards,
--  
Matthieu Baerts (NGI0) <matttbe@kernel.org>

