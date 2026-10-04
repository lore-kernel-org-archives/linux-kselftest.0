Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F63D954E
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134200; cv=none; b=XATuCdTWCoXye5vw24oKhaAneH47oPfnAV40HwuH48I+wwo7rwiJ1WK7eV82kDF18Z7TlL3wuT+yCf8twW1sp1awnZgDOezOQi9+XGzJx9/rF61U05RslMVio8UV63TduBA6ypjaq6P64nJvjpJBTy/D1Lf5rmsrlNgrUvHTjzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134200; c=relaxed/simple;
	bh=fnDmQBxhOnOzTjP27W0omZjVCFDehhZddO82fJQi+aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1OfUJ70PehZDn8Qsg0QnaPk+LvH9ZguHioY68Kzr9iudz7jXjPNVTWuUgWY/A2tDaHfJVgPhSXQEbyDXeLdJGyMCWVN6zyriHzwbtVJUeY91eG8PrFRIuIPLbXZ+dcIXBefODytBPSmWnD+77gwZtPAD1DGbcAWa8EDwJCJJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=ZoM94L/q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="ZoM94L/q"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e2db5e8e4so190971666b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134190; x=1791738990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmNComV3+ZHbZ6goXTWe+Pc/3ipzZ4UsXOvFwMxOIvk=;
        b=ZoM94L/qjN2uSSjYUwazhuaiBmf8QQQcHiP9VyB1GA61kr1ONaWGSb4u+ZXY+qTVzk
         9cNHKWrOrZIZzDxBOY7V+2hoH5/PP/6vHKn5Ruksnb8o9Dvk6oU3kTa55Zg6JblmB7g/
         fdX37y/GpeFhU889LbRdUX2hNjqMCpGA//NhtBXYqVtAFnYYqN/O0KZwljrMY3xrn8El
         D/p1Ji6+DCc9axa6Fd/2AwrOZfLXr9QOZJxgcPHvaBrsYF7SXjRLqlyjhVn+xXoAWh+r
         wr7oO/zSv+ah1EFfWywPS6S3Ynme4SzUcmVOODdbS88PtuwuRXl7osa2BlSbpvEnIewT
         nlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134190; x=1791738990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmNComV3+ZHbZ6goXTWe+Pc/3ipzZ4UsXOvFwMxOIvk=;
        b=EtgO/RYgPxpAyZUwL7y0ZdddhswkyQwTIrYMZXaOIRhmqmx8vhbWJedF6OvcblMhkP
         ajqwJUkmT8Fpz78x7YJdFS1lP8QGYzNoJuw5qfyDrY2t5+9Fc0jfvhmoALWQWeYg/B5G
         vvCLOlvcYUkZYvIHxhIgIam6TYk1ehusX3og0EJiRbekVHdTAMMUm3U8M8Smw6iKLtEf
         4brFm5vxm6sKpl6Wmqb72aPH3vyNb0a9cmkYxckUG7yUbUpHzaGEv52ndUCBbfGtijnU
         QfYOscE2fC7tMD0sSA4Um5ZWC7OYVdQlUgRsbkuHVVXK9zlcTIB9Dye9tkAm7EFhFRQJ
         I1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxzfJO8/ooSHpICob0tRnvEqpg2Mq4KJSdZTCdm2UHChlj2sC+1WAhhqCWD3Q7wplK0PuNPB6N+B/COem8fxwY=@vger.kernel.org
X-Gm-Message-State: AFuF++kEMP+f9grOiw2GZ/+uZQ1nQi9NEdTb4TlmNs9X41ZSSKAUEchX
	wfljCOjY1YKHF7EeoLimryJDBAD80PSZ3vZINGLuLHQVUKUwe8B/JUxp28yMAw/ABQ==
X-Gm-Gg: AYBFou089I0xFGKiRVcaWpszvHIHzuIjuYjPuiGoG/fZaDHOrCU3KZliW9Uq4yyLDoe
	Vk1P8+lvfYQsP4MHjgBgvxuSf6Od0sUHx449/w2IkqfXi7lWX6mppWxHDVu2yCYEqPn70kYXNdJ
	FQ492N/vuxOk7GhlyoUyR3YldrUWWz2zvJlU4qGH92BiKbj7wQBlTP92LSS0RKyHe32xQcTxgry
	Fe/gA+zMXzVr9rXVe3EIwnMVlfyPxKUBf+gLWElMH8RN5Cybhj8JotN+fRJSGB21Gn5/aaYo7GO
	OrL/cABgKo3BBf6S2lru9JGUaL56MVE+uocyBzcSUy6OL8B8No8LuPnvmgGBUE1Wpje2rCtS9Tm
	IrWZhGnReI5imWVnpKns0N0ipzObR4WzwWU8sAHz3kYZxmOs63D6i2569rnMrke4m3FxQuR0RXy
	e9XIS8QNoHjKJ4XbdIJ5S7/zsjddS5/193xnSi1OmxjW/Ue09ji7rSgl1Adc0MP8UdTX7HoX5TU
	TI/oxSEmzm6z2fxT/2an10pPL9douNiPhZMk4e4oHvmTNhHMFZq7eOyL23EdoKFaimjVRqYcTES
	C8qYhQwlGc5TyS5bHZctjnDvOX2+KfcJzh235ZxP5V8+MRiPIPK7jCO/XakZG6r4hWhviMfc2yr
	ljSdolBKBr2P/KUMof68kQ0F+xSC2S4IBs913Ebj1BBflmvhy4I8PJW+d+mzJAfl4sNiw6Ysu70
	hlMfHAfEdWayYXQT61WCTw5oHJ8dalTxVJ4w==
X-Received: by 2002:a17:906:794f:b0:c2e:49b4:ab8b with SMTP id a640c23a62f3a-c2e6ece55e7mr448593666b.8.1791134190462;
        Sun, 04 Oct 2026 10:16:30 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf9ddbesm317345166b.69.2026.10.04.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:29 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 1/4] netfilter: conntrack: pick up a TCP flow whose SYN was never answered
Date: Sun,  4 Oct 2026 19:16:25 +0200
Message-ID: <20261004171628.3544978-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
References: <20261004171628.3544978-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Dotzler <geldot@protonmail.com>

When only one direction of a connection passes the host, conntrack sees
the SYN but not the SYN/ACK. The client's next ACK is invalid in
SYN_SENT, as is every packet after it.

Had the SYN not been seen, the loose pickup in tcp_new() would have
taken that ACK, with window checks off in both directions. Delete the
SYN_SENT entry and look the packet up again so that tcp_new() picks it
up. This applies only with nf_conntrack_tcp_loose, without synproxy,
before any reply, and to an original direction ACK at the expected
sequence number. No TCP state or transition is added.

Signed-off-by: Gary Dotzler <geldot@protonmail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/netfilter/nf_conntrack_proto_tcp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/netfilter/nf_conntrack_proto_tcp.c b/net/netfilter/nf_conntrack_proto_tcp.c
index ad6f1986d52a..31bd4b926e48 100644
--- a/net/netfilter/nf_conntrack_proto_tcp.c
+++ b/net/netfilter/nf_conntrack_proto_tcp.c
@@ -1173,6 +1173,22 @@ int nf_conntrack_tcp_packet(struct nf_conn *ct,
 			return NF_ACCEPT;
 		}
 
+		/* No reply seen and the client continues after its SYN: the
+		 * reply takes another path. Recreate the entry through the
+		 * loose pickup in tcp_new().
+		 */
+		if (tn->tcp_loose && !nfct_synproxy(ct) &&
+		    old_state == TCP_CONNTRACK_SYN_SENT &&
+		    index == TCP_ACK_SET && dir == IP_CT_DIR_ORIGINAL &&
+		    !test_bit(IPS_SEEN_REPLY_BIT, &ct->status) &&
+		    ntohl(th->seq) == ct->proto.tcp.seen[dir].td_end) {
+			spin_unlock_bh(&ct->lock);
+
+			if (nf_ct_kill(ct))
+				return -NF_REPEAT;
+			return NF_DROP;
+		}
+
 		/* Invalid packet */
 		spin_unlock_bh(&ct->lock);
 		nf_ct_l4proto_log_invalid(skb, ct, state,
-- 
2.53.0

