Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000542123C
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781150; cv=none; b=ebztzhmxcm/t8kCyTYUFgDFOKcoe0n4Lp7hXIjo2Yo8s9JRsgQcaXTw9taVUt9sRcv6tZvX8oyMSeVVaofknKTG9CjWMgWO8asCYQruWL3cz+u+52/KDh5ALGGRR4CV0enpo9PDrJ/ixqdAZeraLtxT7wQNraA/N692KGbi5ttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781150; c=relaxed/simple;
	bh=v4jcurBknsFwSFqxXV+HHE5IZcn3tXxARlW04I6mzDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xl/X+thy7pd1xCLKYYRpk4jIE7rqS+l0img+32vwLRgNz8HC2nIzzRA/KPAwoVWKf016q1ymA2UL92f6ZGayIVHgDH2OSA8yB8b5Em1ULot1dHTNcyR8CUxbED6uquzkc7CehSoKeuB7oIEEE7D9sUPRy371prm0SunrFAfZTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sto4dhjz; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sto4dhjz"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4073787a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785781148; x=1786385948; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N85O2htbxOwQYBQXBqLzGIcLGYl30Jy447s5MbRSUDA=;
        b=Sto4dhjzb+DF/TRfseUlLPUjYWcz/0BF5+ssA1IbvFEQTxycOPf8u5Em7v1rGrIZev
         oJDBNW1Vtuq8981m877lR9+CC0zEpDYZ35Ly8XZ6tbmJJZtxhFJJXa74O+UkKukQESPZ
         WntxGfe6smgkVOHE7z/sq2OHSgajxj6GidoXQQkGQEkeS5WjqbtApSQvAlbCSelumJk2
         awZwzK87GyIxiaNAmPDwPTQCzRTmSY917Wum09WBgWQFfNH6daN/TMamXahkrmpPpaHb
         giW9hLXHqydbsnMKKlBx8vaIFygDK4YwVkspYgU7RlbbSFUBs+g2nTNAKPtVCQZ7jU9x
         ig7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781148; x=1786385948;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N85O2htbxOwQYBQXBqLzGIcLGYl30Jy447s5MbRSUDA=;
        b=oopqTln0U55EheYIjuhk+VnVO+S8GzGFWk5SrhOXx76AXDWAP0rYwqtDXk4c+uCc0q
         NkbywhTvkJlHL/kopkrgwFQKP/XUfQ7nQ1PEnUtrqOzFY/zV7u6pjm+I5Meh7iS5o0ex
         7V2z94iq27KllFkREemf1dgMUGI8fWOZLpAcbQbCOhkIw14uZl9uUpE0RTwDXRHFQPqa
         eYFNtHRzxdK+2guomiE/CWHtmGPWL+madt33xWMF7COF2Zao5G2Lp8nIfS7paWt/XGt1
         iNX1xFkEn/09KbQzJbpAxxboLNEylCDvXjFsHNlWbE9LqLHRlJ4IX+7wauPE6H1ZoBdp
         Gqig==
X-Forwarded-Encrypted: i=1; AHgh+Rr1/yMyLTejy8WGC4JHd08+Ou3ikaaOYALHbypmEK57TKL1jbzYvKANLRKzxMqE97gY204iGREbbDgM01wKOq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqPfyNU690Mu29DZV2HG1jkTucGYtMBboI5FWbFvlX6Bo5Xh1
	bvFXZeAGaLGTad6CVoGFj2GE3Y8+RfeO9fRcn6ymb2b56Kd+4IxruBbWQR+2U4Y4tg7RS1N63YF
	xNgfugDhi4VjILgJnqegprf++GA==
X-Received: from dycnh9.prod.google.com ([2002:a05:7300:ce89:b0:313:f483:7fe2])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5746:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-38fbc425f10mr9496461a91.11.1785781147399;
 Mon, 03 Aug 2026 11:19:07 -0700 (PDT)
Date: Mon,  3 Aug 2026 18:18:26 +0000
In-Reply-To: <20260803181852.491437-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260803181852.491437-2-almasrymina@google.com>
Subject: [PATCH net-next v2 2/2] selftests: drv-net: ncdevmem: gracefully
 retry bind()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

During tests, ethnl_rings_set randomly bounces the link causing a
transient IPv6 Duplicate Address Detection "tentative" race, resulting
in spurious -EADDRNOTAVAIL aborts inside the ncdevmem server.

Add a simple 10 second retry loop around bind() to absorb the link bounce.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
v2:
- Refactored C99 mid-scope variables to strictly adhere to C89 styling.
- Dropped single-line curly brace avoidance syntax.
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260801131220.1367229-2-almasrymina@google.com/
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index ffe1d5c1fa4e1..67901a0123e8c 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -843,6 +843,7 @@ static int do_server(struct memory_buffer *mem)
 	char iobuf[819200];
 	int ret, err = -1;
 	char buffer[256];
+	int retries = 10;
 	int socket_fd;
 	int client_fd;
 
@@ -898,7 +899,12 @@ static int do_server(struct memory_buffer *mem)
 	fprintf(stderr, "binding to address %s:%d\n", server_ip,
 		ntohs(server_sin.sin6_port));
 
-	ret = bind(socket_fd, &server_sin, sizeof(server_sin));
+	while (retries--) {
+		ret = bind(socket_fd, &server_sin, sizeof(server_sin));
+		if (!ret)
+			break;
+		sleep(1);
+	}
 	if (ret) {
 		pr_err("Failed to bind");
 		goto err_close_socket;
-- 
2.55.0.571.g244d577d93-goog

