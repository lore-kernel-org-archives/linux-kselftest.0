Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032831;
	b=0JEjJiJyrs4bdnyHvJtbe6+uEM5ZIqtSPt8WrFS4HdL5/UW8DBfE633enOpHka4wBCcX
	 KTL+gD3c4YPiLpiCDngiBuekENrDhEvJ4j0aNpeLN8aa7jRDjyCXU7mtG45hki9nU9hoM
	 s6oSnz7XvT2MvXJ4cS7K3m3uO2IH3NbeZjm6T3UqEiPLB8QH04dEAUkTicfBWtofFyTgo
	 kCVLRdIutcEt/w5SbEWuIGK6qaLcUl+gDQUQsCGNeKOZw0Y/Uq3gsclpEhO9cdoetchzv
	 BZUen+YGNby46iTKF+pgebirtu0er8m/eWUi1BoxySJatqG4m0PnpdFw8WVNrpV1zOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032831;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
	b=NUnemYk2ENTFHYwdzxgk4ewzjC7EEDAQl1sleyxJv6Ijx920wgr0G3vRizZXfmMNWtuP
	 kwVQ1foVExF++a2v1wJr/yZv41LZ0wqvBh3d8Sid5wjrqlrLCk1HK8PyQLbyL9fyjOQ4S
	 IaN9augyCwz+/0rWB4jdPDRc51E6q0MvjGky6vbT+148H7b1EvMeoncVr/OOSRnhYOoCH
	 JzkfhYfnGTZFEKVDd0P6yhf4chkDkNu/6pWCsHZ8bB+1AkdTUYhwdVGLfWbXk5etk6Fml
	 S4cwc5rLRtWB7DVFmpw4Gb8YXCUP99nrw4xb7dKagCGXr5b8n4870bCBNA6Xiqwu9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DAA606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1122110a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032831; x=1795637631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=DB7HsAxtGpS4nXqR+yrfh3Px6QlvzrRmKZJxKz5Bb9/BnM0poYrDwOrhWeT0DBIae/
         yOY67Tm0zhUfAj88ILWVmlNycA42uirLxIaNZ4hn9FGZVhy+rKfvd7xkhV8wvi2FDHcL
         XQJtfQ985Do1EMUpalKGpjy/CIUMq9kI1bCIhy51Pv3//wZmyl5cnDGZB8kinegqsALW
         cdzQfvNWxMxi6xEDR04M1qkc0bq5qF+iM0jZMoIEn6snJf6IIjNTFsUAPh+qRT9vHKTM
         HkR1RsYojMWWb1BKMm+f1yxJVS4nnjdAhnuvz8qpP0vJJxf0yqQa8rq8RAGyETkaTFL9
         cj2Q==
X-Forwarded-Encrypted: i=1; AL+hErFKMLXNUpQo39SEWHmpksX2PTSuSy5xhP+VUaQsemBxrPy3rPcih2ynMNDQ9OBGL78QKl9UHJoNq/pVzpIurXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P2wEtrCEm3c4tHSQXQHUeBoNCljHYRb2R9Wdo9y7dsaQwPuRp
	9imvw7CpZ2yv25b5B09uhFE1P3fthrauOBGSqSB0b/wuyBYhh2KzlUgLL9IInJLH/JZtfpx0mcI
	QLJp4Xi4N27y9EqZDELOp5iwK7ack9cRIGUwbzEjM61Yg3DQzub8QPaMYHuo4vSF0uueXkJVlMd
	a9ZEYuhxM76qngfdMnP0ybxqKbcCvtRl0nP4VeX85rhPZ2pBog+VDj9ZP27V2o29/aG6V1kClJM
	UVJJ46dJJcmXqbXTKRPmmfjkrsj
X-Gm-Gg: AZFdTZf7OnrsrhdUvtk/j+FtWuSrlkq2NfBZpef6oWeRFu3d/OynHk8umbmI67KVxs8
	xLdvRXg4piTYOM3qaBhc9C4X5kcUMUXDPqIsY+mHYnSy/wPDMTDeU+aIJ969Ke2ZB5OwnUgiUFL
	NfTTXriNYD3RC7T9nc++SjUCNiG2NWZ3aEiWOZrorrF4mIR7zy4+DxLI+39nF+k1RQioXTjqXux
	b6cwxysqGiNLvBiLPsMdY9YjT4lK311HTenfvYetgCQFq11LwUODme8JLuKjIyr1ZOC9LFOANKl
	o2iIga4MsGY06OZaDdJkWmqz0zDTOqctTNPqeC+prvn/o9UWWwXOZ0t+ExWutDgXSFH3GChsZ1+
	O2QcGGgl84skdoPPtmpEklWQAqg9cr4fAi/4V60Je7TmvxcNjXkCZRogiAMLlcj3JW3ChSer2N1
	JEhsOR8KfgSWEnxvzO3lXga5ldwqLBxRThi5/nFp/07vc=
X-Received: by 2002:a17:90b:2496:b0:3b3:fc1f:a5ba with SMTP id 98e67ed59e1d1-3b3fc1fb76amr47762a91.44.1795032830712;
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6a748cesm371526a91.1.2026.11.18.12.13.50
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d62b80650so22855711cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032829; x=1795637629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=EcnMcg+pj4DD81piCV7cmJQrVefYzvFVLEk4AkTXVzEMWCyqPt+KqltiIdTrmmUrpv
         Xeh+vD355s8wizgxcwUZVm5HWxnXJK/xOtpWJ3zwd9w3YEP2Vo+A/1TVif4Unh9LBDOz
         cwE0zMKljtC9NbA614J0iUSO3AgbackW9Wj3I=
X-Forwarded-Encrypted: i=1; AL+hErE+Pt7y351nTjJNRbhnonF+wGykXDRELqTXVeZ2cjUjd687gOzTMkBe6YqPDdxehh2TB79A2OSp3E583jLi+Sk=@vger.kernel.org
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59604311cf.10.1795032829405;
        Wed, 18 Nov 2026 12:13:49 -0800 (PST)
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59603571cf.10.1795032828766;
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
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
Subject: [PATCH net 0/4] netfilter: flowtable: Preliminary fixes
Date: Wed, 18 Nov 2026 12:12:46 -0800
Message-ID: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

This patch series was created based upon the Sashiko review of the
Broadcom Flow Accelerator support:

https://lore.kernel.org/all/20261116222519.1416501-1-florian.fainelli@broadcom.com/

These changes were not encountered in real world testing but appear to
be valid. Test cases were added to ensure there are no regressions
moving forward.

Florian Fainelli (4):
  netfilter: flowtable: do not queue offload work after DESTROY
  netfilter: flowtable: restore the GRE conntrack timeout on teardown
  selftests: netfilter: check hardware offload work after DESTROY
  selftests: netfilter: check the GRE timeout after flowtable teardown

 net/netfilter/nf_flow_table_core.c            |  12 ++
 net/netfilter/nf_flow_table_offload.c         |  13 ++
 .../testing/selftests/net/netfilter/Makefile  |   2 +
 tools/testing/selftests/net/netfilter/config  |   4 +
 .../net/netfilter/nft_flowtable_gre.sh        | 137 +++++++++++++++
 .../net/netfilter/nft_flowtable_hw_destroy.sh | 162 ++++++++++++++++++
 6 files changed, 330 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh

-- 
2.53.0

