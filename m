Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010988;
	b=B11tsPxB4xVx6pQXytwJFxxORtwllPLC27z7X+nd0NhaULWCbXuPgaCi7ppgN5sCeVdo
	 1Q1CUcDmr/JGTQpFkhELyCCyEzc6wSBdBvXD5/aFNgoJuhLjC6g9A0Rdqy+m4u3nxtqWI
	 u6kC+lWakAZH2CqKVe/jlNvU2I0do/bDqx0TRaiNKGUVzJYSD7L8ylrupk/OAfQySdBaP
	 tx4/bAZS5aJqn9qtUw40xb6IOxin/OtgZtRIEP3jqUzwJjIEwarZCmeGeAoyjCeeMs4+1
	 u/vYSEu5gR4TNJw1dun82TfI8HuvHCiuEw39G7HfUPY2ODPvqyLlumJwMUH6muIpWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
	b=wIXD/TzZQH0CArRNiGwbtcM6ZC7NfUEPq0pUhmaIERIJ4URAAgh/deqj9+HWdatPaTcp
	 SHhZZ26nKdWpKQfE+6CTme+0utH9QKFfgRq1pWmOEsXk3tzqJw24mLiiwIqmHRgEP/yBZ
	 GfNSnNRQnKvpcdUvpuxYTJ8vlGc0RHCcXzJpRHlkXqR5qYaOeoYjYe1vq67MG4fqJlx9s
	 gwAXqIN5our6vH5tnWG3iXP1gQeVQVIaUzWVqu58DZ8f4Ie7VYy2kJtICpSmSkvGWz3oU
	 Zv87+0P0urC4PgqWiCkHSs1fSDPXRLGfgu2iELC5UAjgNhmjZXRnKm/7Fh9LT1SUGHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAnecXSD;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE060A3808
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BE060A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAnecXSD
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71aed54d4c5so643780eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010985; x=1795615785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
        b=LAnecXSDfxZKBC7lRKXezKA7kvBi80WIMW4p7syBsLb2sx99DS24F+9izV7rEHKh4S
         uUDaCJTRi/Blg/8pyTYCFCnPvM6viGAohCKP/iLaIN4+hvlWWxJIFKrcrHJ0DGj1VCEJ
         97hSq8VH09GnRuruyRZAKJHcn6hzf4r2gnfxEZIvU++MHl4EHk0pbdVQ6VpHv+wNV7B9
         cgZijaS4+K2FrnG3Z93Pw7fQnwMKQFsmo8yqd4h0zgW6sAk9kN0WWH1C9ERMbjlbvjAy
         u+adpm7CzPFKDzBomD4Jr8f8lGd+A5d3qtKpO29CPK+x+R6AL7R6f4HEaidVejdM7Kpi
         GzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010985; x=1795615785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
        b=biOkQxeixs7hOk7uSCB7P3dYSAda4SPNKrljS+YqGbGI1urP/KbDe8tMzkaQ3Q6fHf
         1yL7AknrxqNEzxDyAcmmuzn/7y5utPSz8PM9D9BIxyQLW5njkSUNakwvCFnI7ggStX1+
         jDAoZW3f7Ay/WlH9NZCCkZxFOvri2I16t2dB7NdQzPy/sL4DRjflto8Egcscaq1tvPLU
         lZt/1OcmV0JxnxuT8Yu7xmnX9Jk2MfD4VWQmS8c0iTP5V6FgBjiCUXQ5sc09gNCxAQnz
         LCzHOwLiCI4z4qeenPFSrJSVPI7oDKNrGdClkiXCttmaFU02HJnXCGP18/haYu5j51Cx
         yAMg==
X-Forwarded-Encrypted: i=1; AL+hErEJYUUcyNYRRUy0hBogReKogQ6AMgspZHosgCtLZ8ReeEDeZ1U68Of2MJKYA2hQpUVwT/rzODS723z//KWxDGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1GeyUdma/oa0TKkA2P+Qe6kPN0+k0wXJzKhHKZfRZZgPVip3K
	d4reMqkJ8z4ZMJwi2lbSwtv7YMeJl0X4K1oXXy1aNs6TLFGg5W3s7vZ9
X-Gm-Gg: AYBFou1C/1bYwmdHEhiw5pi8xf3Ts/rUrWsv/QzKVM+pDBdWbKsDuWHiYkd3nUVct2f
	xITBoYfBeiC9nqye3zlDHDL9ZD5H5LIXDG4emwOZT/tZV7itFVE4RDRWJE1WY4liW15vZqO0jts
	Q195BVglGM0z1SW0J/lLoauhzaPJJuqCItOt5+BULCOH/5F8klNmSMl09hDiK8Z6DuD+y68ceCu
	rn57fiJsrnWIPIolfDsAcNg9gXEbs69IOfoGFWKgWceTdTL/LS/DDue7iLwVwYtLsQRI9NzhtVC
	kadbRJc3wocP2uxW+Gvf9VUUeBATKWpMEkIfiYiL3+Q93nY9svZt/dGFh8bSe2A6sLdM4NJEkNg
	PCMpuPE1UbZ1gCHy3Z0I575gU66r9xbvM9AHACRZXKunLP8RsKdegmePosPufNbZusUgo6JQ8WU
	8SiJgtzsFK7KcGZsLdj17q4srrWeavZocD5E6ZcZ46yZn1x5nTqNdVD4eVXltGowbNmYWt6sb05
	ir2j+InGkL3yFqP/4GunVd3A5RqE/XBv2cnJIm8yORhxRJOfQGYkggSEKCX8Fzg3bWk1DHpFB67
	MncFYrRE9BPVxt4TPty9aIBFwCE=
X-Received: by 2002:a05:6820:1355:b0:71a:ee31:7b87 with SMTP id 006d021491bc7-71b18460540mr1709015eaf.32.1795010984713;
        Wed, 18 Nov 2026 06:09:44 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:42::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b19516ea1sm1983557eaf.11.2026.11.18.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:44 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:05 -0800
Subject: [PATCH net-next v5 3/6] psp: document lock ordering with the
 netdev instance lock
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
Message-Id: <20261118-psp-v5-3-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

PSP core calls driver ops with psp_dev::lock held, and drivers may take
the netdev instance lock inside them. mlx5e_psp_set_config() has done so
since commit 1e6e0cec0dab ("net/mlx5e: psp: Make PSP steering config
dynamic"). That commit established a lock ordering that was not
documented anywhere.

Document it. psp_dev_create() and psp_dev_unregister() take
psp_devs_lock and psp_dev::lock, so assert that they are not called
with the netdev instance lock held. The next patch adds a work item to
PSP core which relies on this ordering.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v5:
- new patch
---
 net/psp/psp_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index 273b010d2355..ba44154cf8dc 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -19,6 +19,8 @@ struct mutex psp_devs_lock;
  *
  * psp_devs_lock protects the psp_devs xarray.
  * Ordering is take the psp_devs_lock and then the instance lock.
+ * The PSP instance lock must be taken before its main netdev's instance
+ * lock.
  * Each instance is protected by RCU, and has a refcount.
  * When driver unregisters the instance gets flushed, but struct sticks around.
  */
@@ -53,6 +55,7 @@ int psp_dev_check_access(struct psp_dev *psd, struct net *net, bool admin)
  * @psd_caps:	device capabilities
  * @priv_ptr:	back-pointer to driver private data
  *
+ * Context: Must not be called with the netdev instance lock held.
  * Return: pointer to allocated PSP device, or ERR_PTR.
  */
 struct psp_dev *
@@ -64,6 +67,8 @@ psp_dev_create(struct net_device *netdev,
 	static u32 last_id;
 	int err;
 
+	lockdep_assert_not_held(&netdev->lock);
+
 	if (WARN_ON(!psd_caps->versions ||
 		    !psd_ops->set_config ||
 		    !psd_ops->key_rotate ||
@@ -127,12 +132,16 @@ void psp_dev_free(struct psp_dev *psd)
 /**
  * psp_dev_unregister() - unregister PSP device
  * @psd:	PSP device structure
+ *
+ * Context: Must not be called with the netdev instance lock held.
  */
 void psp_dev_unregister(struct psp_dev *psd)
 {
 	struct psp_assoc_dev *entry, *entry_tmp;
 	struct psp_assoc *pas, *next;
 
+	lockdep_assert_not_held(&psd->main_netdev->lock);
+
 	mutex_lock(&psp_devs_lock);
 	mutex_lock(&psd->lock);
 

-- 
2.52.1

