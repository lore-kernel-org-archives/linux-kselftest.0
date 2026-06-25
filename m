Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289F243387
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411365; cv=none; b=UCmnsOQS3tMZ48PJX3cfslZxuz7EVtnEvIbRfGFmmlEz5zgNdv70WsJdto06R1YyXdRdNQpKDZjZTP2wMytQS3xf4pxzZYawvBXMsY6Cbkw20fIm3NP+Fnd+UV6Vum1sqi46EjvokfwiGBdSTx7zwmjTfDzNQ4DGi1bK65Tlzeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411365; c=relaxed/simple;
	bh=R4zMRsC5dgEt3GQ1wY+GOgTcL+mtlusQkycwEbXBb0s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VmdpX1wsEjQbSeemKIw9sBL+RI9k1NGlHX3NkdTUtxivzNVno6o+/qOBvwHqJyiYf7Qu96FBC7oT62Oryr4/cIJ3vbt2eOwfqdG7m1bOn0Y7qgJBsqfLYarADgX54FgWu2vkK6hXXvZtEH7WO94xlAOxNyPT3WN7undCnSnJqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uYvgCGwt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uYvgCGwt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-37df0ae3ca8so68674a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411364; x=1783016164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hbt4jAxuO3yIsMnFSQ/zOto2meD/sUjo/A+mTkmLM7Y=;
        b=uYvgCGwt85R1MSPJg9ffGwiyALwqY/ladzGbWwfSFILpgyLHrrkfcuTXzGLzTTnnd3
         Hk+wYStyrKokFa7eGH6722hearuTQVLF6uY9fHVMOi0b2X1nnAFBQcqZYhQzMgTzKnIe
         0qrVQadYPxE9YkBcKqD0Po8aNZMdiUYfBXr72TM3LGvoCp1Lf0ehQPx/gbLDQRjRA2M7
         V4nlN0jC22keZCOHTcnE3yjKoQaNf5XfYUtGMWjY8xcSDWFm5C40kUVwPGlH2yMdbNx6
         unlIguNHENRUahx7hMGGh2v/Ts63ehEwRvJ0TtXPb93vc9oUw6UXrSMYs0VhOFCPss6F
         g4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411364; x=1783016164;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hbt4jAxuO3yIsMnFSQ/zOto2meD/sUjo/A+mTkmLM7Y=;
        b=o4llg44sxxg+kFbBNozrPRfL/M/dDGW+Npmzyln5/GOW1F0amgZ/8Mc8644bHMek/D
         +mEhgK8oaSKMXIl/YffdQ8OxD8PrIANOjuUSYhBC/WEUorz2cjgHggUyb21Pja4ngAw+
         wJRv7oLdsHLi3CSQcnHbVK9H7pqXHk5liATWVtXSBsxP4zGXk9cDl6Q2PvJDKpK+u7pz
         410/5y8q8SgglpHHMhP6CWCGKBes6WNn5mJzOp3KST7ws3Li725ldatjH7ToPY3MVfTS
         PuzPokfVlMh84phFYF4B1Xf3AmTr8K5pbbcJL8LvhSSUwjdNO6nvvZVhBf2DaXiDKqXQ
         d9fg==
X-Forwarded-Encrypted: i=1; AHgh+Ro58RqlbLfu+97Jj5Z57z4T9ap3iME8xQQzHXY3ztiuGeULTdjCn+ZNOvnh/v7cCaciU/3TXrzp71GSPbSGoz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1zhMaAf4a9eoQVYyd7xpbWmpiXnViMGcEGk5IZY2FExP6WyvL
	flUoR7OwmyeBUJd8tJxcfruy0XOlzGCoDuJBgPzieT8G+WCJelKEpgE2z6SzHnYLS70vtAjq8mw
	7rjupZTAGzQ7MNxzdzA==
X-Received: from pjqa10.prod.google.com ([2002:a17:90a:a50a:b0:36b:a5eb:cb3c])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3509:b0:36b:b1f4:e0ac with SMTP id 98e67ed59e1d1-37dfa25191amr3459010a91.14.1782411363681;
 Thu, 25 Jun 2026 11:16:03 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:15:55 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625181557.1086105-1-tjmercier@google.com>
Subject: [PATCH] selftests: Open /dev/udmabuf O_RDONLY
From: "T.J. Mercier" <tjmercier@google.com>
To: kraxel@redhat.com, vivek.kasireddy@intel.com, 
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Write permissions on the /dev/udmabuf device file are not required to
issue ioctls and allocate udmabufs. Applications should be opening this
file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]

Remove the write access mode from the drivers/dma-buf/udmabuf.c and
drivers/net/hw/ncdevmem.c selftests.

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
-- 
2.55.0.rc0.799.gd6f94ed593-goog

