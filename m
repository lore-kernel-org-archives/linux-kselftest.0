Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBB397E64
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933734; cv=none; b=jmN6zBSTb9Qlt3ov32lhepeRsrwRs6g00+uAGc4P1jt2Y2j/MbSSLLy0nXPJOP8+EzfOhrpERma18AeZULiqKNX7He13OZVfm6jSRrjO84uCI930AOC/QY8JjghTUgUfJqs/UzDlzSGn7rAER0syknW1qIPHa5vry9UgVmV4wQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933734; c=relaxed/simple;
	bh=JhnW51DmCRFybSnLbK3Q4pdM6DCF2s30FmXO1t7q5aQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rMt5KAbCi2L3F32WZpPXWAdShwpTMMpLtCpqq0dSRKGL6NUoM9SPI5EQDH60Dr2Lge8qyouU01oKm/egWUtocbgK/Xjfq5yRE4HhdWwfnxs05nH95MfYrZLfnOEy5StsFFKiIXv+QXxKRWSNnXx093ND1cBlxqQApS9oTk57nQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1uxoo+B; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1uxoo+B"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8479586724eso987916b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782933733; x=1783538533; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujCabrnr2B8RujS0oeOv8POuubqI2CZlXpFMlH3f0oQ=;
        b=v1uxoo+Bu6qbzhYAaSfNZ9UgnocuaokAhFDh0jwe5kXWbV2zZsU14FNP817/TIZ04w
         fBYBmq2mjVOcrvFTQZ5rogBdwtQjRvC3MlnTcQ4VClp96LvvJKUuCWZOFqnqAlFBAXQ4
         uVBDgHtulnPHPx8PdTP8vDU5nCb9zTp/jhnmpemBdT5Vgdvw3DcwK/z8x5HEc3IAJ71Q
         s7nz9ghy1lSg4Av7qX9zPsq7kosKtYtxOG1f2CDH52WGTL1YvCxB9PHcpepSqPCEPkeS
         r5JQvg7bQKKi8Sv7hDQ8CYcoQ7yBTppN0UKX2M4pMWTw5xvfQ4jLpI0EoPaN426Lu0zp
         mPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933733; x=1783538533;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujCabrnr2B8RujS0oeOv8POuubqI2CZlXpFMlH3f0oQ=;
        b=eud+3TsYHKmuErUm9erkHT/Ru3Geu+Do+ExrvrlNKPWA5lANPIIhvGM+K/TQZns5ww
         ptP7rJMOjwQPdf+T5OL7P6dvah3XTiFz9LUV6O38l/L3FKsbm/TWQwY+oKDVIuD6M21S
         qF9RjPNDJgaaPGBYDEL2KQ5gGI4FThcrsSNdVixbtoZxtJYd4G/FuyPUVQng1W2qTRaM
         Cbt0iUB1S0RHMl0cxq7e7PVVG4wnbDK/NHnliDOmt+1rQegTCXvW4TXN7lTum+CDW6s2
         8srJILQNA458KAVAI2VVhOd4frq7ybKPScqfRNbcjXn6QoHJKpqONpI4Ar/vZQ/zBClT
         my1A==
X-Forwarded-Encrypted: i=1; AHgh+RpcDxG/5Hs3AKeKGf3hgRbUmH7TGi3pqJuJCkE2jh611l+QsLbthpwXPUeBhBqbYVqUnGLKSKz0z/HjI3no6Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIHkBtecwL8LGG56J1pXpP4A5NW3X8OJscZdi1nNshCA/10cS
	bEzuMp2QYz4+VqDpqLLOoKysqBCZJCnIY+BOqwRtn2RnGC7ndUZ+C2H79wJCY5IMK1x7wq8MyJa
	FSfP4SrdEmIiG1XdelA==
X-Received: from pfbjw34.prod.google.com ([2002:a05:6a00:92a2:b0:847:90c9:183f])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d43:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-847c519386emr1793601b3a.48.1782933732340;
 Wed, 01 Jul 2026 12:22:12 -0700 (PDT)
Date: Wed,  1 Jul 2026 12:22:08 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701192210.2997769-1-tjmercier@google.com>
Subject: [PATCH v2] selftests: Open /dev/udmabuf O_RDONLY
From: "T.J. Mercier" <tjmercier@google.com>
To: kraxel@redhat.com, vivek.kasireddy@intel.com, kuba@kernel.org, 
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Write permissions on the /dev/udmabuf device file are not required to
issue ioctls and allocate udmabufs. Applications should be opening this
file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]

Users are pointing to these selftests as examples of how use udmabuf,
and encountering permission errors on systems where write permissions
are not available on /dev/udmabuf. Apply the principle of least
privilege to selftests which use udmabuf by removing the write access
mode from drivers/dma-buf/udmabuf.c and drivers/net/hw/ncdevmem.c.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 2 +-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index d78aec662586..ced0b95c876c 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -140,7 +140,7 @@ int main(int argc, char *argv[])
 	ksft_print_header();
 	ksft_set_plan(7);
 
-	devfd = open("/dev/udmabuf", O_RDWR);
+	devfd = open("/dev/udmabuf", O_RDONLY);
 	if (devfd < 0) {
 		ksft_print_msg(
 			"%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index e098d6534c3c..8114a29692fd 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -149,7 +149,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 
 	ctx->size = size;
 
-	ctx->devfd = open("/dev/udmabuf", O_RDWR);
+	ctx->devfd = open("/dev/udmabuf", O_RDONLY);
 	if (ctx->devfd < 0) {
 		pr_err("[skip,no-udmabuf: Unable to access DMA buffer device file]");
 		goto err_free_ctx;

base-commit: fbb7ad31ab376c5101b2ac7205fad0344fd2de60
-- 
2.55.0.rc0.799.gd6f94ed593-goog

