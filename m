Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801139A4A4
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390084; cv=none; b=msyUcVql9NxmHX1fj1mvtUbCwQU9//JvwB8CmrHJ5QyblQOAHXmHKgr9mX0oDBqpfaG7STIDJvHQgt+hK3uooxkhYQtMSRdRPLEEIg78nJdPDhZ8KWZcuEtc1nfn9jy2pz78mGMrxQnke2fEjLLcM49DUYwCtr14qiE+n7uivgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390084; c=relaxed/simple;
	bh=dqBzikGa14hqqrjBAPe6y9B3zxWzEgOKtDsMRinPnZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwZ/TCUgcB+Hq1nw6GbwCOqr0th2N9LTeOMWotWCuL2mWn02NeWTYRrfCEyNZ5MRJbr457qoXxyvqjoK1xsr0od2c/QCLgBaI4v8zRYcpTkSd5k1glCBKFNa38EM3pFTizVqupO9nEK2tdiaI0m0xnTe6RVTxQWlZEaB5letuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS/oc9Hs; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS/oc9Hs"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so758966b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390071; x=1788994871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMJ26BWtmMrRnikBYx5aKuMSmpbwrNZ5wPGOE3sWg+I=;
        b=NS/oc9Hs/kVwiejmZ7MPNrn6+wn+zRHOWaT93IT2LjLmJ+RO0MmW77B7NylKm0NVkt
         YagYJoRDEQxQxwoHPluJ3u1ibpr7/CQXyfoymvj4rnDBjNTEsN3ehMjTVnzKDLVicAqU
         Ik9SMedEsF/hVxj5knJ8kTChfDbSnZKdf9EIs03LmDZ4swRlJZRQMe19iULPOArImK23
         h2tTXXM0k84o5RUa0YitPwSz/udjr/wTvdE31p0X60UdHj+8yZ4u+xao8fDgi3vxX7m2
         3O6lWpzLFLuVsrT//36AjsL0vg9UZ8iBt+lTAy0iZlcDbHfbYWk4eAXWm8+ioPHtBF2m
         J1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390071; x=1788994871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMJ26BWtmMrRnikBYx5aKuMSmpbwrNZ5wPGOE3sWg+I=;
        b=UcdXYLGsK52pqbgifBy/COt6JegDbSCGjeWHsBMXnrPI01biz7bZ5yfX1kdGb3g+K+
         Lm4GxqRSE1ksRqTV3GSbK4g/RQ8Vb77R2nc7EDuMmQyagPprArqJVYmtsKC1UVaXxwnh
         6f5DzeaGjW4JIzOlyVe+OZ+0FILSDvv0M1ZfHqRr8/M4cSR9+qSbFcdxjfCzNHxADBh9
         5WXmF7oJMqz47jcYvRHYZ1OC4nveNzwYx6vMkUY2ysrCtYTivlR6asaaT8Dk25np5d3/
         b0BZQYcl5ZQa7iLgFwDp3q1JBLu2ZurLJofsxwcezcP7z4cVDq+s7Gk6sTiQgXO2OGGz
         I2pA==
X-Forwarded-Encrypted: i=1; AKwUvBxrNjtcNRAc+xjzy48p0JH/vCDlLZR4nwUQRFw1nLRmZp4ZcBxURkuhW3seq4zOMBoiYsaisfquWRLI+Toucyg=@vger.kernel.org
X-Gm-Message-State: AFuF++n0Rwa3tg3GgPwEMmDzWFpNKutr5x+iaZo9Lzc4RlHeRe4izJz6
	ZN458E2y/MRN1+Z2XT60VNQ9J/76mGom/wC8EjOJziapN4IcRQOEZ+LL
X-Gm-Gg: AYBFou2hrVHv7fb/W7tBOa635GbB5MMPzC3fxllDHyQg7VEzuy0Y7S3z8ufbIvlfQFm
	LzAybnzkXGqXW6RflL/G4wz1oVoOlddvOiqR4LmO8W6YVOziIa9UYn4P8cio8ga4rPunJD0veWu
	fiE2XCf7DMSOSMvEsfsZ6ZNm2ZnNq0xCWSiJCOnBsq/GjjM3Ca42Hhwb/pmkxS3xFFbWlUw+GGR
	LOiJuCmjYY19dJAePU58uPCLVsn5FaOPWwdeDoNQUxiQ0axEs5XdTnxJ874xcGBnh305ydLyGy4
	AgGO46566mKxTaqFmrLPu8nekZp41LAW5oED7aH9ze882M35/2/y904R4oJH/QSEBiv7mmdL8xN
	fxw0BEFVzit8qIWDqe7/5rLve39GgBm/2lbkOv497ZuJrjxBXj/x23E++1oQnjcslM5mreLeBvq
	5aaqsW8DeOp6rNR3IrhOCSdi3WRgjMrEqEi7Qk4ZkxRTXjCIWf4uisrVq2YiWr1EDHnrw=
X-Received: by 2002:a05:6820:1898:b0:6ae:4131:98c6 with SMTP id 006d021491bc7-6b47ecdabc4mr6868224eaf.2.1788390070886;
        Wed, 02 Sep 2026 16:01:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1d::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40f92004fsm3807143eaf.15.2026.09.02.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:09 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 02 Sep 2026 16:00:47 -0700
Subject: [PATCH net-next 1/6] vsock: constify the transport in
 vsock_for_each_connected_socket()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, sargun@sargun.me, 
 jlinbox@meta.com, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Allow const transports to be passed too. The function only compares the
pointer against vsk->transport, which is itself const, and never writes
through it.

No functional change.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 include/net/af_vsock.h   | 2 +-
 net/vmw_vsock/af_vsock.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 3357ee62d10b..87fdec60ba45 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -230,7 +230,7 @@ struct sock *vsock_find_connected_socket_net(struct sockaddr_vm *src,
 					     struct sockaddr_vm *dst,
 					     struct net *net);
 void vsock_remove_sock(struct vsock_sock *vsk);
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk));
 int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
 bool vsock_find_cid(unsigned int cid);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index a33b2a2d381d..29cde17e08f3 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -448,7 +448,7 @@ void vsock_remove_sock(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_remove_sock);
 
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk))
 {
 	int i;

-- 
2.53.0-Meta

