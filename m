Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334712;
	b=2Bgox9OITmCW/5BHVW86FSTeubU+Kz1vYbMlvYZcUGJ3Ibx8td7ttjyeJ5ZPUPvQHvti
	 7aqE2/xyv4qE+UcydVx6hvKVKSfqqvfXKn93zXBGTNPQiGQhbLpZ/JJasHzTtLJA7rGSv
	 bc5CmrlwujXRmjXA88uEggM7LzN61vYWCI4XsiGBfNEHQ4IgnKF+WRXb7k/ByQngGmQFY
	 nt2765YDX7nBGVyEvX2+jlw9VWi6FaexDrbdhQ7AcpGj8HtTM/ZT0dusiBHWmKAQKBmYZ
	 V2WuljtKAvL2Wn2DfJvQharCnf6Ueg+HwjQ+XtBS2M/fkUF/wRXWyqq+WmkSJUUtNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bMdKaLnci5rE3Vyxt1ztOm4nlJPbyxipNoi6qOdT6zs=;
	b=bie+DvhKKIqE3fQCPEX+gp5j9445WhEuiAPPe3dDs6SYVgKPpZ7n6C+/iGq8shpONnKr
	 NR4racrwMYNGkZ6yWJj9Wwx69Wex2WvdBY4c42MpBJUlpE6xkmsNCwAYhnXuNfHp19FQC
	 usMAURmXLE9qsihocmaQ8MDDndXKORUBzwivpX+wClqtIE2AKFz8qqI4hepOD+HyvqBi0
	 rZ9W01nGg14ANCOmanYiAs1fm85/Mx+DTtLXzPLWIADCuMRuBmxzAtGD1ZdXx7CRHAK/P
	 uOj3qLxHegnqBMcg6h7IvqrnMap/flB6NIa3Y4PokEYZl2xjnO5z9pe6HohVRzQbiEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JdVCMErj;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EC606A336
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538EC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JdVCMErj
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso5942575ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793334712; x=1793939512; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMdKaLnci5rE3Vyxt1ztOm4nlJPbyxipNoi6qOdT6zs=;
        b=JdVCMErjF+4JfBwV8owjnae0AaqwdnF512qEm9m1iEtGtFSWg8l3O6IrJNSWb80veq
         MC4Sw+oX8BcfqD29ZeDuqldB2IC0M3nfP6NyUFw3NLeEVKlpeux+CoUrSHR+KjvXfA1x
         WBzvXZK33fVOfJDNPQ1nkguTbsTOz1/xEk81NpWcgxrmaiayGRUMPMJsSc9KQ2d8EjAk
         hUAJ8Bp0DAMOWvjKB1Lyz6IFb11j/a662N7Pk/sbC93uY3iD+Yi2rIDJdQevUvzFpcYK
         ZtEn02hE6EdRygHmDjUXwGEGj9Cu5nMdKBDGu3Xi1ZL9jXzaiiNRBXlWB9RYkYjScP/p
         BRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334712; x=1793939512;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMdKaLnci5rE3Vyxt1ztOm4nlJPbyxipNoi6qOdT6zs=;
        b=jXVPbRRwhMcI7Rut2csLslVpfO8OKz+KfVZwZP2G2VJGI31ynL1mlGnHZu4GAFe95p
         KR4hXp0NjSOYI/7zKQVuAehVBfn6xWhh/kFK4tXC1iqrpXO2VMMzN8s3lEr6e9wljMQB
         cQRlPbA9r+71pbwuK9BjpQi+anYzrf4vbErEZlLUu98xfjJk3R9FmMrcgUKfvLk16nCs
         LoD+WlveCi7X8yh9tD8vRxoU0bLPpbykW6RdTIPq4stN/slamZlL4b34XHyD+KD/jx6x
         VL6AbyE2WriHwuDbh3ZTIU+uZSmo6ZMVTkZEP+S3KO4af/R8VcRFgJkQXxCsh2ng5WVA
         K6LQ==
X-Forwarded-Encrypted: i=1; AKwUvByT62e98MhNgKxJxnsxWFzIbnTT6yB1JinPtCLVytDGBTS0f1OjxwQ1XaRjEun58AhinAhXSDyr+7zQ4124wG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK4sH0RBuDReU3qSfCjyEofGJSI0dxHtTtnVSES1VVNzJElvxY
	iWbbofqyExpUuTmAI5/IonCLf7KI0EjiY8RG8BHybEMPGulVmASvorFtNkU4MFSFv80j+fdFfQB
	lXoV/zw==
X-Received: from plkg13.prod.google.com ([2002:a17:903:19cd:b0:2e8:1f84:7c18])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c27:b0:2e9:460e:ca57
 with SMTP id d9443c01a7336-2eb36426e0bmr13063885ad.15.1793334711324; Thu, 29
 Oct 2026 21:31:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 04:31:45 +0000
In-Reply-To: <20261030043145.2185700-1-weiwan@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030043145.2185700-1-weiwan@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030043145.2185700-3-weiwan@google.com>
Subject: [PATCH net v2 2/2] selftests/net: psp: test bidirectional data transfer
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

_data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
only verify unidirectional data transmission from the test socket to
psp_responder. As a result, they do not exercise the receive path for
PSP-encrypted TCP data segments arriving at the test socket (such as
packets redirected across a netkit interface associated via dev-assoc,
which relies on SKB_EXT_PSP surviving packet scrubbing).

Use the existing "data echo" command in psp_responder to verify that the
test socket can also receive PSP-encrypted data from the peer in both
_data_basic_send() and _data_basic_send_netkit_psp_assoc().

Signed-off-by: Wei Wang <weiwan@google.com>
---
 tools/testing/selftests/drivers/net/psp.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 473500901879..e507951b440b 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -120,6 +120,12 @@ def _check_data_rx(cfg, exp_len):
     ksft_eq(read_len, exp_len)
 
 
+def _check_data_echo(cfg, s):
+    _send_with_ack(cfg, b'data echo\0')
+    s.settimeout(1.0)
+    ksft_eq(s.recv(5), b'echo\0')
+
+
 def _check_data_outq(s, exp_len, force_wait=False):
     outq = 0
     for _ in range(10):
@@ -478,6 +484,7 @@ def _data_basic_send(cfg, version, ipver):
 
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
+    _check_data_echo(cfg, s)
     _close_psp_conn(cfg, s)
 
 
@@ -726,6 +733,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, ipver):
 
         data_len = _send_careful(cfg, sock, 100)
         _check_data_rx(cfg, data_len)
+        _check_data_echo(cfg, sock)
         _close_psp_conn(cfg, sock)
 
 
-- 
2.56.0.317.g454f8302e1-goog

