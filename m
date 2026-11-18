Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032835;
	b=RRcaERM8ALzPhMcs+8PdqIor7jdLeM3kiSG8txBh2Rgk51wBxKNrnXjORS/+8X/aIdp6
	 2Ms2WB3e0MSjuU3vVl4BAHMAv1h3F39l1hWVRLz2NopvJV87KyyWZJj7nL9eEFg9gQgst
	 CYVZg5aUo5klsrEO1EHGi85LkgrR1bpL8/EVlufSFqe+XCqiArfSSVCd4ZIa07rq1QJUI
	 ewYDI26PiBptRjk13F+AQ3IvnrbGc0IKoRpcYPABxvJBq8TLdMtm7GV+815jN/4akguVs
	 AP+lbnbLpKRApojdY2+u5OiXg0P1MrSCcBIbMLlshIeAzljIx1CIi5bSLu9kJHjw1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032835;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
	b=LnzNChzB7iP98c2U+LeW9lzGEFWxpj+2CInjqOpIFKNj2OVjCmLc/VivAGktxWIaRpgf
	 nzYn7nUTxo/Vh8ZtJup+vhvAtV6ZRosObnp/JCxvtdGC6hN3opH63ZBlmBNIQoZ+8H4kX
	 zFiIn+4KrvtgZPEX9RJmjTd0u1lOjZu8SMueOJJG0wnrwKeM1VtD8cSzDCv92K8ObJy5y
	 s4/odqsKkSVFZ2glSrQ4BlLzTqOzLKHJmy2c2HeUXVPam8HElrT1O9OtV/108oECwye+w
	 xm245z+O1Bs9lr6uTwR1u4CVGH2IF+vJcDs5ngLNmdobp3NDhUDWgSR7HHOGf4GbVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718660A2611
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 20:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E718660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b179528d56so805835a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032834; x=1795637634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=1ueW+O13VBhTZ3zAYEI5Xg6LZlwo9Wxxe0Z0ele6dfKdHACuJXmIM6LJETQ9ijRjr/
         OQsNI7RHi+r5vsiyvBVDceTcqKhRHbY9Ya3MJE2ydJSMUzRCa0srGQoe7Ukx/pxGiC+k
         f4Aa67UBf9VimaLyBVYWT+sUggoh6NKD8YBg3ZM5+rY5xfQlRU6OFSRJhCRYSB/7enTj
         +3rYuZzQFGURBAWVUPfRfIByCDfilbXOzBVHsxbyUxRL/ZPWjr4bqJwfKtwCLHn2+Eeo
         enRURx52bkmTxY7ESrPNrp8C3sTCUEAVDfCV39qa1XCCdow+h0fL9MYSjBOdk3TOR3p1
         g5Qw==
X-Forwarded-Encrypted: i=1; AL+hErEi3LiYHhXz4FpfX7YQHagxKQVhmrfPtOLL4hr4YiWf9JfUFh5WW+DZ+obrbfs5vUZvxRbSGjxWLw69zt7PLmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZCQGcUR20DmKQq12OT53AZWaGKN4dHXuInksodN4o7sRH71xl
	vguGguAsl4Kb4xW/VrTDp35Bv00546WvMJ54Q0duxGhDX6weX0ei7v6YID78FrEISttTm2HGsxz
	X+eNS+MAIRGsqyR3etTKzaM4MBr1tDmcuAWKCXxUjHi7X4YjHChbJtu6An377GGKCyj4nrCBSBu
	UHFsdoE3yXASTqSg0JkvQ2zYwg5hUKGjlXFCAPvJpbMiVMQzRzV9oYm1k6Znn5Wg0yq3UtdpM/1
	6XMbzYIO5dkJROToL1lgK9sIiFf
X-Gm-Gg: AZFdTZeSRX3Sg7k4HnwXWzLK9t9bz9cI74XCS2FzmykFTvUvNTp/cKk8s2toxoS2jSi
	G6eMYdAtMvJEN7K9dSduDTMM+fJl2iIxUktjmfffdjP+Un9vNDBXlwQ8Q2nb/HyqeZVbQBkI0nG
	T2RxhJ7jbCbdjl8PnEcYWOWnCLqXeoBwSLM0thf4vhUzPq755deOKWqY2qtG4FYAGWVBS8+Gs4L
	pTnVXIJ2YljkSaCzeFUazvYVdQ8JIYOOnyKRQEVfjCpQfP+KD4gaxcdb8h+Em4AEW4j10Ma2rRQ
	l6js5VP90LNB6MzvXiF+B7o+0lnW3rsrrUHm7SF6BvgaYBpNucLuyMZcHaELIDjIbRhvkUN8jQr
	ba6uST0BtiidCyOFuIdrQEg51auPXT9mOxNX4jCp6YZFADf/AZATABwIxBoOeDB09bDnTSE/FOx
	3wNV9nRFTP6PMdoA7qM+dtE59t9tNru4PD2VBqJ8H+bRw=
X-Received: by 2002:a17:90b:4405:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b3d068738bmr3428098a91.1.1795032834308;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6e01d7fsm377556a91.3.2026.11.18.12.13.53
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55b9c13273dso24329871cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032832; x=1795637632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=Jpep7sDz2EJWI9hZMR2W0pc+SzWJf4CIrgdpDZqXr9JYyExwWMH71NbYuJ6s7WyY8B
         HlAplMcZDeObXddACBH9ztkkIgoZEsz9dfhA909cJyu4zoNjMwS8KFffuFaJdUHa+bti
         IM0ZeUpvk6UGOin1OLdfHMySzP6fXtO666MoI=
X-Forwarded-Encrypted: i=1; AL+hErE1gl513bAwQU3yRu2gic5i8LMcnQAtpv5PYLPSh4+LKTBwvBnp4gLqqJoE9dcAkPpik7OLJjgebOwVjwel7Rg=@vger.kernel.org
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52255471cf.64.1795032832294;
        Wed, 18 Nov 2026 12:13:52 -0800 (PST)
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52254921cf.64.1795032831764;
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 1/4] netfilter: flowtable: do not queue offload work after DESTROY
Date: Wed, 18 Nov 2026 12:12:47 -0800
Message-ID: <20261118201250.2075007-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

nf_flow_offload_refresh() can be reached by a packet path reader which
looked the flow up before it was torn down. NF_FLOW_PENDING keeps the
DESTROY work from being queued while another work item is pending, but
once the DESTROY work has run and cleared the bit, a reader can take it
again and queue a REPLACE (or STATS) work for a flow which is already
being removed.

GC removes a hardware flow after NF_FLOW_HW_DEAD is set, and frees it after
an RCU grace period, which the reader can outlive in a preemptible RCU
read-side section. The queued work then dereferences a freed flow and
the flowtable, and can program the hardware again with a rule keyed by
the freed flow's cookie.

NF_FLOW_HW_DYING is set when DESTROY is queued, and DESTROY needs
NF_FLOW_PENDING, so a work item which holds the pending bit and finds
NF_FLOW_HW_DYING clear prevents DESTROY from being queued until it
completes. Check it after taking the pending bit, and do not queue
anything other than DESTROY when it is set.

Not reproduced: this is a race between a long RCU read-side section and
the GC and offload workers. Found by review of a related change.

Fixes: c29f74e0df7a ("netfilter: nf_flow_table: hardware offload support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6..62f460d38efa 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1088,6 +1088,19 @@ nf_flow_offload_work_alloc(struct nf_flowtable *flowtable,
 	if (test_and_set_bit(NF_FLOW_PENDING, &flow->flags))
 		return NULL;
 
+	/* GC only removes a hardware flow after its DESTROY work has run, and
+	 * NF_FLOW_PENDING keeps another one from being queued, so nothing can
+	 * free the flow while this work is pending, unless DESTROY was queued
+	 * before we took the pending bit. A reader which found the flow before
+	 * it was torn down must not queue more work then, as the flow could be
+	 * freed before that work runs.
+	 */
+	if (cmd != FLOW_CLS_DESTROY &&
+	    test_bit(NF_FLOW_HW_DYING, &flow->flags)) {
+		clear_bit(NF_FLOW_PENDING, &flow->flags);
+		return NULL;
+	}
+
 	offload = kmalloc_obj(struct flow_offload_work, GFP_ATOMIC);
 	if (!offload) {
 		clear_bit(NF_FLOW_PENDING, &flow->flags);
-- 
2.53.0

