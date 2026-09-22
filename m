Received: from mail-oi2-f26.google.com (mail-oi2-f26.google.com [74.125.231.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902242F3C10
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 01:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039904; cv=none; b=fJRf+vvgPNvoEkX9ap77LMjDG6AiRw0Uq7IUlv1dt4q3cGckTxlmFioWppVMpyYy+qS4wD37T7T4h/4uf+pz+iZ5f56kg6heulnZ6vhN7KPLRacLL1MMn4cq7HTTiqvHFcDYQz1uqQ25I4uPjHgp3yOB1ASykIy9/Wiz7NIgq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039904; c=relaxed/simple;
	bh=cS9vNKu7FK5uQuQp6x72bj2FugS7mq6eGvzVjip2oIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lePtGMojhhell2PPesgAyx7c79fpZGTdhbEhtY3/e7Rda5eRx6yKI6V6b9MRaiM2xo42y8/pG0uqqSYYH6Bs8BiDZNkH/OTkVA4iwqPatj8mLfrtsuoODeqyjK31LLMD2+g1VI0v21IeWv69zdkmfMg1f0nlFJTEugnkGRfjqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAgYGnV8; arc=none smtp.client-ip=74.125.231.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAgYGnV8"
Received: by mail-oi2-f26.google.com with SMTP id 46e09a7af769-80a18990c76so2573904a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 18:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790039901; x=1790644701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOcxxxCAKSQioxaCmq9VVEr3ww8ELRw40nRpvvXToPE=;
        b=XAgYGnV83DZzPD98Sv48z1rn5c9hysvhHdi0L0zfgjlCntlPiV1WEvsP+DdJ9SjFKd
         PKQly6wMCabbqzajOQzf3CWWfs9ZEnVDHRz86TmCr53Jrcqr7ry7uCWUX/azcupUPaTZ
         MhNb4WC7pVNjP2+7ZRJM17BnGIRRihfjincD38po/XttMVLFLJfgQaDOZgdERcJMswSi
         yHGrQuJX1zkgfDmzL5EBYWlJNwQMt1SZ+KKjw2XZw9rLxrWwUC/zZ2oOoc2Hl0asLS1L
         XtxPVegOuZrxcZZfsNvM/uhuSuVMZin5bhxdo05uzs4c3umbGXZh1Cwv13Yv15YWu1xI
         ddiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790039901; x=1790644701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOcxxxCAKSQioxaCmq9VVEr3ww8ELRw40nRpvvXToPE=;
        b=HX5RjMQzqfNSNIFycX2ltd/VICwttOoPFGa3JMgKpnpeJGNu/bxYVCR3tQUn+xz1hO
         N5GPC00Tjn+AOGpuzqfwGqfit7tzdvrSDTtLD+5nbLG+rS0iC11hP9BwxiuEzz0r2tYE
         CJHBy5oJa8eOsdoTfADhDb2yq96ehUyztNLTQtD71HOP0UUoZmSQXKcAY9OcgexxB5Od
         wvyK4RoYzDncFxNFRD/IqQB/eFhD6/V5dXqwdflOPTSfzb/IewVnLeV8wnGvEbCZ0p7a
         apnfGEK9svk+J2agp13RLAnzQTgwUBEqHUVrMp5mhv6B7bRIsaJGr4jK40RImzD7j6z7
         4eWQ==
X-Forwarded-Encrypted: i=1; AKwUvByBCN3fve4yI2CgyZpPECLDZu2wH/1lrRMhm/nfbQoHJNDbdLDfScbmZMff42cr5E0c9tJJJtscKWfVJEongUA=@vger.kernel.org
X-Gm-Message-State: AFuF++lSsSqauSvdRrc8ZLVXxeToVxAmtFMZc2HfflXsCAHU+ztAvVNq
	CZ28yR5jKhdMGoc1Y40DtnKGDb4hnuwxwsXCpDHvugWdozpD8QdUALzY
X-Gm-Gg: AYBFou3txOOgI7H5KTqEB21ovol/uFeZK6CIFqievNMzckQU7QOpo31RHdUMZ4c1Cs1
	GSV/fjuFe9+UCJ8DYzj0Wzx7jy7voHYD8nseAA2LyoBaNcVq202q27Qrn7A3uWU51MAfPbUnJur
	MrnpnE+GgvIjBdxORVc9McIFnVGoeHuDG8eXGLlkaPVzxLr3DoiU8sBakGpkApnlF2jY7XLIW8M
	8FGOm15wRey10JWvDQ4xqEhBX0kEkjEg8t9SU5VXMolLM526T2ct0z66puJ+4X9cNn07rb2JU8d
	WqY1dEJBj/bDkdDIgaV7OhWiYAyNg0PltFCWtRvluHvcS3NJKoH7PwhfAsnItTxqZKBoQVDCnXT
	s+tM42viidacrJdHCvIiub1demQ3AzbwxqWBvEgXA1m7SP7D3E1PlXNNRJhASgwdlC0HWk/sTs1
	RNrKDc1YMuk89/SkOVybDrIrMG8MV4BdTdJ298UnsNwMdH5sMxWDhrjDwfE3vhvx7jOFg=
X-Received: by 2002:a05:6830:4905:b0:7e6:d384:459e with SMTP id 46e09a7af769-80ddff5b5f6mr12954905a34.3.1790039901424;
        Mon, 21 Sep 2026 18:18:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e5983e4dsm608478a34.6.2026.09.21.18.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:18:20 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 21 Sep 2026 18:18:04 -0700
Subject: [PATCH net-next v2 1/6] vsock: constify the transport in
 vsock_for_each_connected_socket()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vsock-guest-ns-v2-1-693bd78fde9e@meta.com>
References: <20260921-vsock-guest-ns-v2-0-693bd78fde9e@meta.com>
In-Reply-To: <20260921-vsock-guest-ns-v2-0-693bd78fde9e@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, sargun@sargun.me, 
 jlinbox@meta.com, Stanislav Fomichev <sdf.kernel@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Allow const transports to be passed too. The function only compares the
pointer against vsk->transport, which is itself const, and never writes
through it.

No functional change.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 include/net/af_vsock.h   | 2 +-
 net/vmw_vsock/af_vsock.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 5549298c1ec6..370fcd3ddabc 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -233,7 +233,7 @@ bool vsock_check_source(const struct vsock_sock *vsk,
 			const struct vsock_transport *transport,
 			const struct sockaddr_vm *src);
 void vsock_remove_sock(struct vsock_sock *vsk);
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk));
 int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
 bool vsock_find_cid(unsigned int cid);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index f840498b58af..8d6b705f8640 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -480,7 +480,7 @@ void vsock_remove_sock(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_remove_sock);
 
-void vsock_for_each_connected_socket(struct vsock_transport *transport,
+void vsock_for_each_connected_socket(const struct vsock_transport *transport,
 				     void (*fn)(struct sock *sk))
 {
 	int i;

-- 
2.53.0-Meta

