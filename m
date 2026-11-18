Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032837;
	b=glC/wu6Dio6S7E3M+OpA0LKOseV0s2bggmyPSp2nZ7SoSgcbHzbHsHGT9suSpwTQRvj+
	 ZRF5P5lSllH7mDmZLt1nYT3CLwalJB2olHIaxPRlgM4uyFEyXgkoERlAgpN9dpIXlF3Lm
	 fUJ6ev9iKjGLuvQDIo7/VCWep0e9F9t67BfFt0FJVuiqqHWsk9vVHajpUPU4yP4y+eDHg
	 BXD47wNDOQ6TutpXm+p2mHeFrYUJVtZZaym72VLEdRSFfEWo0wewYdkpLo6jXuzZ9aslu
	 J5gSZND//puv2uVtLztzpnzIc0eabegukzYHPtSQzYgItfPZpVOt+Om5MS6VqBQFULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
	b=wrzJh9qrrXY5NkvWJfqlqqKZk4MGEmbo17E1KLdpNtc8ZDSIN18iXTzQUiXyt1aszxzf
	 dEBOnEk+5766UxZ+igaTIYMaTFgeZzh8ogtzZYS9gEkohxC5MPJJuDeugx4BIZ2giePd6
	 YwkPAXvUxbuvaiL+1ntKMNjPCb+JnZEZilKXg2YzPv/+1q1V9UxDHAtpIewGJ7NLijd/A
	 rO1Aoub9iAYQZ1XeMc5+vcVWnudEMC8VpcKxxHsxddRyxEpn0ORDaCpr1ZOvb89usZfl6
	 ztxgY5FQAVkUA1xDvlEaROrH/+Q/KAFzGcFZPvLmJQUjwQljNoghYHPZ/tp1USHAh6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu;
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C45D60A2629
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 20:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C45D60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so463180137.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032835; x=1795637635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=t0NH+/rEY4lVAUQVnImnSl5rZbZMHI2/WzMdDVrjlYY1Hnyo6RG8EoRCh8d0R0HKbT
         K5XaHZteLCdIh7wseO0Wf5Rj6d8s6WguBEL/b/d6WtwJMGniCwVbknRBaD4apTtuL8Wh
         sKVpy3TdUzgeg343JDMzDDNdMBmF0kjomPH7T9Cyts5CtlBdABEVmNR1un2jbL2QaCwy
         O2H2pZD7SLb77k7k+ix4M7qchmVLGTcEYQzqPV2xhvmPYCTK7K9dbaOlIIRMqC+li6Hj
         AWGMOpimF92cpHTojATYxAr6olJNFsOdOyRACjMtxpkj2aQ8vS4MdIAfcMzVad6q4p6d
         VgYw==
X-Forwarded-Encrypted: i=1; AL+hErGbGc9xV+WDQ1SPzp/u6JkelLugzeX0p3se7nncmbhxGXPLjP7LtYOr+or7mv20tHZGxh0E3dEOVp/CCFq5lQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mt8Q1VzSljxgYVmJsIQiLEHjWkTfASA3dmH0n8ztjgCZhSLVc
	k4hkXvi12gKVVFBocu4Yrmmcbc6PmaOUbbQ+YAf/1of2doq0y2M6Ca1XqrO4HkDJxGPIUDAOV20
	h9RagO4j6VH5AOxA07yC1jbCg4/EFlwWemX5KqoDxiuiigDYu6vTGyMnADK9LOzuOLT3K5RCBsY
	vCeOZVIxJXYv56OdKaw2d884f9LJ2ck67yZD2QcvfQQRFEHO4f7Wg2V29aY/gu2JF/PJuTBGWA4
	xq4GPAw8EMJ5AbSTED3E4MU1Cal
X-Gm-Gg: AYBFou0KgpZWdn9RAmTIUPTOLwk2etxs7bWY5dtslVoT25RwSYuRJvaXBgx/5Q/714L
	Y8CXMjvqkDgZJPo5NidxX3BT6Tab0d5L0aHCW/YX/xZMhulzQHfYqa/l8zmJzsCZUKYwn8L0E0c
	cQ613UA+UCUy5ljco/uhRj0UPdY+orZzKWjpsvjaIYUUWVDz9bKEPngMPtpCZqCifRX5Er626vP
	XFADXFMPd51lyOvNxtJ1ifX8344bY1T8G7B3Uw8GJqY5uTiKNXKWsEULUi6P1/PPiPYOcKMIcOW
	RfySE/c0VlloLTaPm3gGGARIqcYjmVQT4640/m9npjKXNHZ2uXoWeT0tW9zOgUz/1W8owetxHjK
	9pnCBxZ/6YUPpDwu6L7nv8ICOv47ocsNUJjVSNy+Jl/aAwJQNZVcxaAThWPhI9Q7IEHv5yothHj
	ICrsuycaQhp3fEA7swA8MVL4z5aigmdFuaKgYS/MmzS68=
X-Received: by 2002:a05:6102:510b:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d6ba4045dbmr1408814137.23.1795032835350;
        Wed, 18 Nov 2026 12:13:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d6b9118245sm24937137.3.2026.11.18.12.13.55
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso23911501cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032835; x=1795637635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=EsALQCsuXxhjbc0jqsPBQ6PY9AW7CUvHgg1WNFYHBdp3+Og8jxPxQ5hA8y1U4b72Y7
         7uPr8RyKF+Wd802sl5mW5dhHhacdP3515QnUN/OfZ2kUbIu1czYlJZYqgejHkoW3rRYn
         KFpqZ+gkZMWULEQXh6Igba9wdIX3gLZToMuIA=
X-Forwarded-Encrypted: i=1; AL+hErEv1Z7zBPHq0L4YwRX9QA5q0FS1I8AiJtXaXmMeRWEXFIUObAtlLZqfSjnnkIHPmPDUwlipMat3zA3vXXdeRNI=@vger.kernel.org
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137881cf.48.1795032834681;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137191cf.48.1795032834127;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:53 -0800 (PST)
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
Subject: [PATCH net 2/4] netfilter: flowtable: restore the GRE conntrack timeout on teardown
Date: Wed, 18 Nov 2026 12:12:48 -0800
Message-ID: <20261118201250.2075007-3-florian.fainelli@broadcom.com>
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

flow_offload_add() sets the timeout of the conntrack entry to NF_CT_DAY
for every offloaded flow, and the GC keeps extending it for GRE too.
flow_offload_fixup_ct() only restores the conntrack timeout of TCP and
UDP flows when the flow is torn down, so an offloaded GRE entry which does
not see any other packet on the slow path stays for up to a day instead
of expiring after the GRE conntrack timeout.

Restore the GRE timeout, replied or unreplied, as for UDP. GRE has no
offload timeout of its own, flow_offload_get_timeout() uses the default
flowtable timeout for it, so use that one when the flow expired.

Fixes: 4e8d9584d154 ("netfilter: flowtable: Support GRE")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9df..051b15aecd89 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -237,6 +237,18 @@ static void flow_offload_fixup_ct(struct flow_offload *flow)
 		timeout = READ_ONCE(tn->timeouts[state]);
 		expired = nf_flow_has_expired(flow);
 		offload_timeout = READ_ONCE(tn->offload_timeout);
+#ifdef CONFIG_NF_CT_PROTO_GRE
+	} else if (l4num == IPPROTO_GRE) {
+		const struct nf_gre_net *tn = nf_gre_pernet(net);
+		enum gre_conntrack state =
+			test_bit(IPS_SEEN_REPLY_BIT, &ct->status) ?
+			GRE_CT_REPLIED : GRE_CT_UNREPLIED;
+
+		timeout = READ_ONCE(tn->timeouts[state]);
+		expired = nf_flow_has_expired(flow);
+		/* GRE has no offload timeout: see flow_offload_get_timeout(). */
+		offload_timeout = NF_FLOW_TIMEOUT;
+#endif
 	} else {
 		return;
 	}
-- 
2.53.0

