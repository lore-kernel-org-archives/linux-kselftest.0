Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E993264D8
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 01:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386103; cv=none; b=jHMBlhPYCGl4Q3lDeIvcfaMmu7qlzwQmk6DEfwjExqg4Wb+s2G60HPoIBKM92ZsWmOB8NtvDAI6XTSBaE6bSiJf71Gud30b39G6ZgwxfpXeNU2M3ARX0Qeheyw9u+BwZODwjCZxotpoGywxEDr+t9O/IkzlItR6xD0ToPRH0cy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386103; c=relaxed/simple;
	bh=8f074t0PhW4bKYmSqUt9X0UaX6qttBGQDYhsJlTCgsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oc1pGW0w4rH+oit7a+5mPzCjLagF3jw/3ToSv89XM4dzpA7JG8A4CgTQDkp3kA4ZYlfpZs2l02nfZRK7k/hX0syLYr354mVvO519SZjJfw4Dtte3rvd5TGKUM9pXb7OxFfZzdEZLV0HmFjnA1YzdJlm54LgIeRlf/RJrzzYW7Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg50hycZ; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg50hycZ"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-804ef461aedso833273a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 18:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386099; x=1790990899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=Yg50hycZffOpgymx+oaSY4I4ygK9OwVQCjcJNRBj4JhEUcXMwyIyceQxh2/hXs0MuF
         bH4uwOVEG+lv31cUsUF82cDxVYC4GLtL7LTmKqhUG/RPrPIF+yXS4sP+wVm859Kn/Pw+
         Mqv2FB9w/Ok12hCiQYscB1MtLoJtH6L+oNXrkEh/N+cYu6pe9HYe0qzNb/dX2q9SI+XW
         kMG1e4ttOwgexa6st3D07KOKArt3KOVwfr9Jv0xZUTxSlubk1c0VK75qD/DuNBozRMYj
         1ctwIcqcAgjNjMw07ZDXgjsFXYph0Zy1re9mwF83KRvBYa/af1DK8L1kiGgh+PY/rx8i
         JdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386099; x=1790990899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceesP0p9wSFk3r7eOvCPcEnEaxwgQZImuOn8nzfUzVI=;
        b=c9+UgcIgEh+nRlPgYUo+HNWD5tk8NILnll2fJ4ZQsGx5fkfzwT6PgyZTi5/mlIjyTw
         mjgQWnnlDltCYOfdv2I0XFtalGqSG3z9AVtbAAdsrAmXJkxmW84U3QdNlmAw/9zRiniY
         khtnTy9av3UjmGDqZYatcijcUcMGLmfPWUeqRmIMw5IJyDUDYCl462M/LJci8m6VQTSp
         1MqcaOrJATlZJPiBTW8DHgx+8+R4h/7voLLptLCCRPYcsLG5pTNqYeLrZThUwDF8eOWV
         d3D/hzPMJbWbrKDINjxUWumAbBp0sd5x0oXT1aNG84EzpCNURhNCvhP6SXQVN+tnuB6b
         mkMA==
X-Forwarded-Encrypted: i=1; AKwUvByiSFzTvY9nXj+R36pkwluQh+Ydid2hZyEyptcF8dZE4gKijIrAFYeNCqP2U07hCAL+3/gGyNnn9FWkarRY2sw=@vger.kernel.org
X-Gm-Message-State: AFuF++kYja225FzT7y930RYOI+hRTNEz8t7fCQyOpSXBN4u4XjW+1aEw
	fVYS4h6CD9yDAtZyn8LpkEu+nwB4L3QnG9pYr/MqAfQzk7zJM6UADi5T
X-Gm-Gg: AYBFou1I1VyIuy9hoZlUEUDoSBfEnF/CKhv4s0gZ16eb7ZqU4SqKww9DuGwu0IaiDVv
	Oy5ggIArpWfNwBX0PrNYoJIg2AoFhiSvfaJVJjdNZQzT3DGH/lka95CdIqwOL4IPgEMSGfIZBB4
	8CRc6USHAWU2A5UXb1YqlB9B9TKb6KI3VUssHLPDq3Kh4nwLVY09ibz1pHL4aF1MmPJUSwybwdu
	mELa8jODTLikS0QC2K4bRogijbvSuwTfm2dPP7cNiVQezSjCsYxlheQyB99aHapYBTGQiComGU6
	JSGbwgh9Msv8rqo7nm0Yuf0JYqtZ9VBiJ8eE6q9eSOepPS18a35I7Mvp6foLUSC7Xi3IIPn+Fk/
	oRyFMrRqOIyq1j+qohMsmXGckHMHjGUiNhXKJOAYuuwpal8XUbzJUzW/kC2x51dI2eBHaUjbN+T
	S6EKXdn5OBWmat6+H3uoIrxCLV7a9RHxda3kXV4XHVy1CozNl18xt2V2bf8y8SwUaElQwN
X-Received: by 2002:a05:6830:dc5:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-81782c8976amr9142398a34.11.1790386099697;
        Fri, 25 Sep 2026 18:28:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e814ac66sm4210989a34.5.2026.09.25.18.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:18 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:59 -0700
Subject: [PATCH net-next 4/4] selftests: drv-net: psp: test that assocs
 require an established socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-4-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
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

Cover the three ways a PSP association could previously be installed on a
socket with no connection behind it: an unconnected socket, a listener,
and a socket whose connection has already started to go away.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 0a2329f41431..6b761c981c6b 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -319,6 +319,49 @@ def assoc_sk_only_unconn(cfg):
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
+def assoc_tx_non_established(cfg):
+    """ Test that a Tx assoc is rejected in a post established state after shutdown """
+    _init_psp_dev(cfg)
+
+    with _make_lo_conn() as s:
+        assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+        s.shutdown(socket.SHUT_WR)
+        with ksft_raises(NlError) as cm:
+            cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                                "version": 0,
+                                "tx-key": assoc['rx-key'],
+                                "sock-fd": s.fileno()})
+        ksft_eq(cm.exception.nl_msg.error, -errno.ENOTCONN)
+
+
 def assoc_version_mismatch(cfg):
     """ Test creating associations where Rx and Tx PSP versions do not match """
     _init_psp_dev(cfg)

-- 
2.52.0

