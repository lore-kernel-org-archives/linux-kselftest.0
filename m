Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E44F3ECC
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 23:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812026; cv=none; b=lSZKq3wGK6zzDsZraO8zeJQ/pfGM0FKJUxOgBlke/Wh/3htc4u3lMiIO1A0zT0hGrfY5153ssUmIg60QIhlOdBF91rmw8M4ExtGeWK1XNFaFOB/0kgqJuzYcoHnj9g/lew2Gy33Hl0ZdUDdcFe+4LLUz70oniWypNNqP5gUCokc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812026; c=relaxed/simple;
	bh=fXmvbaq+zCQusRkupX1jC5a1EgGfZp9ZyOpuO0BI8+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDx7WdrexW9dLwWMhVN9z541f0tgpgZwZKaGj2C5L7kf3OZ1pYcef3uPxMOtTuzBPxoh9W6KMQ/1prLq7/d2bpFKNSgADbUjjfNIPLBi1dMKhzRll/AsrOIdpLMhfo7U7R+bl306mUINJ4sDD3RLFcfaODsJHW1JjAiv1Dn0E58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/vomn7g; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/vomn7g"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805c194bc92so6924629a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812023; x=1791416823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6QOkhPcQnsn+fArNZjI2d6w/nkTnw2V0POtC44FnOI=;
        b=J/vomn7gg2Jxu+TXJ9anqKxQfAQyTLLDSYbKtqwTvsFoN2WbJX6r8LrKaniAPDoVEt
         wfNOGXd2L46niLhh+i431fJlzHpURkZKTTTm4q81IlEnSWQBxnR/mkpfTeF1R5Rie9r3
         uJ4y1rvJQ7HkNI+8fcYeD+TnxCt5Qa/D9X6oycgKRODTMKf/Ap1F82hpiV7mGUoa3L9P
         aMZfc5dC080FGUDdq13E5ZTVnRuIYK7cxwlEZ0UjrvElsh2FIiI0C+fDAt2YTYgSKv9+
         WQrJ+DSLKjt+kAsmOmhSjWMBuTOln7lOYW8gD2an+U7YfzyN6WQxee0HV7yDeLMhGINy
         QcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812023; x=1791416823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6QOkhPcQnsn+fArNZjI2d6w/nkTnw2V0POtC44FnOI=;
        b=xGZA9HQtFbZhf2K/BST4Y3rM24uWw4FJ3cptL0WJbWLDeqSdWXwVsGhPcOcyiVZxP7
         +MFk17jyYhZKzih6ViorzQQuitBveX0A686Xd10HuYRQoLglacfztc6Vn/7lHasVVn7M
         ozVv/pfvnG+lrvUw8YfNbf7h0uEShCEzBXWGSkgeQ9cADPofoGhrXat+V2gb/sj2E4RA
         jh5u8uqUhboRZhmrUA0XxFfewzWEh2PExzZGCKBWEjOs9lhV6IJN0etRTJjzamUMAyDK
         ++DVSBulDX6n1hrOYAXlnRlUv9HLa4Homo4aoMiPsXdmaI9SKG0t4edqjllHMFLjsu6P
         Ok2w==
X-Forwarded-Encrypted: i=1; AKwUvBxYpcYw4m6cP4T66AUF4Fccsio1MvvVFv1nl1pMVgkXAOkwcx1T8Ql/g2kb0fmZu3qjaT5QobpYaT2iXzSC8dY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdLgNefLqoq70VxhIfWmLd98LTZENbhsO3BJWZvGmyfnTQrxG+
	zqFrLjTp2QiVb/nmeVRSFFKeZ+oWCbYqPtZCrovPJ6XafqVV90GCcCPo
X-Gm-Gg: AYBFou38Hf/MPJpxgp07lPhEDZHkU5eB0zis0Fdja6FbwqtcHcH8eKnHtE/wFdrQUHY
	a6QDUsWvLktLg3gbrDPs2db15fD/CD2h+1AEd88BeG2TU5HxTqrWo+dKmRsIOMuddgNP5zkeUgd
	BorpAWmvO1up9HaKHNYlnczLflE7cfrwNkdwCC8g7fybV5ET3TFa2C5fL7zzBF9+pakbQc+XS8f
	foFnqj11o2i6hWf3EG2g/jbO12iz4BiZYnW5dEVEGxVC5nmoCqW2lhWmWg/6qx59XG04vWIIz+b
	07YYrqNCvJQF2GXsbmWcgZY/mhLhMAavE/RVTl9BWc8/kqebb6lecKqJ3oPCx7LZOS8ALX4XF/1
	3dVCpIyloZKorw8n/IQMxN1hdmupKdM3lue0ycBXknq/WogqoD1SDV9rpi5poKBCmGMJKAWU2cM
	itedl6il1HvnoQaSLWM21SPGh+Gz9+0/x0WLB4aKtuDWiRDg3bAINlX245OzCsMpXkeKZt
X-Received: by 2002:a05:6830:6d0b:b0:813:baf6:c644 with SMTP id 46e09a7af769-8204b2bd01cmr3744930a34.26.1790812022660;
        Wed, 30 Sep 2026 16:47:02 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212a413937sm1258025a34.8.2026.09.30.16.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:47:01 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 30 Sep 2026 16:46:49 -0700
Subject: [PATCH net-next v2 4/4] selftests: drv-net: psp: test that
 rx-assoc fails on closed and listen socks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-psp-defeat-v2-4-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Cover two of the basic psp assoc states that have been defeatured. Do
not include tests with shutdown(), connect(..., AF_UNSPEC), etc. I don't
think the coverage is worth the complexity. That should be done with
packetdrill.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- drop assoc_tx_non_established test
---
 tools/testing/selftests/drivers/net/psp.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 0a2329f41431..473500901879 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -319,6 +319,32 @@ def assoc_sk_only_unconn(cfg):
         ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
 
 
+def assoc_rx_unconnected(cfg):
+    """ Test that an Rx assoc is rejected on an unconnected socket """
+    _init_psp_dev(cfg)
+
+    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
+def assoc_rx_listener(cfg):
+    """ Test that an Rx assoc is rejected on a listening socket """
+    _init_psp_dev(cfg)
+
+    with socket.create_server(("localhost", 0)) as s:
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+        ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+
+
 def assoc_version_mismatch(cfg):
     """ Test creating associations where Rx and Tx PSP versions do not match """
     _init_psp_dev(cfg)

-- 
2.52.0

