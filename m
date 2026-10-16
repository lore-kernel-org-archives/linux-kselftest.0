Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89431463B8F
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143157; cv=none; b=YkF9pMO3l042lItxbGDCNtv+gkdxJouNDwYBAHsl+5Jt5fx/fY40Qh+VY/+3NqqhrDsOfFIFMRKPuwHlGkk1lTk3+LZxI7ipTO32ib+BMsiIRzm0a3MSwtgpKPYPWuJF8YxYZChyvINmTeIQMG2YE4UErHVO0al2LoBxBBOJzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143157; c=relaxed/simple;
	bh=sWkP4JPpzh1PrUWgTn0gKtwQ2WpS/1O8YY32jiHfj9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FoSvrBwAIc7q4S7TfLTsnR+La23pc5UtlBZwoxpGcaxilTAt1KQ1X+M7dSIM5gIjfzcSyOT+XRMB44Y7rlAPr1Ndv9yRW8lqLBuhMKj8MiOLGNQF6Pt4OqWPXLhdefBJFh88nJG/JZtjbzrc+rREtwUEibohEDg92jE4naQ9cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dskCgRcn; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dskCgRcn"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so4486866eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143153; x=1792747953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4EHfv55CyvmCv6DKOzDwfo547V/LhUX2GtLqYL05K0=;
        b=dskCgRcnPjt5HwMZBceVdt217XXbp6cpjEQ9oIIR26EZ2Dr8PnyUvZrlmq5MGzRImz
         4EfN9W/L2QY2mPrHG2prMNPOFd261a/lmzNWJW8moxDze7nALpBS/yy4u8Xx5Fa7T3Vj
         tonW+K4zH/EBoI26PQCNpmB74YNXLWeZJR/cGxAQ7fifFpz+98EkUxoLe5PQbIQwHSS1
         OW68wO04D5iMyiABS9+p/lqrGyZ/kDMO4a27ki9pIEomcv6MH5LRZVAaEwb8ud1xip6K
         QV7HRCvArG7ivvKBX8WVYNF3OHws93CGfRQ9+WTNk2F9hvm+/s6tQ6WCmOdAZhn91AMG
         6fzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143153; x=1792747953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4EHfv55CyvmCv6DKOzDwfo547V/LhUX2GtLqYL05K0=;
        b=cNZru+Xjb4I2LZh0EbuNK1rTz8oywOnNLWybTv7+ob5pcn1uRm5nwFsPfMLfS68fg0
         t1O31utiYX6m3Da/hmGsYLs+csxCWWVcaArLyK9T3YaKhYm18rhZqmtLT+ZNXgzyUCuw
         /qE652yjAYN4DE8xZ+b55X7cJhT2akI7Py+ysDC/uwaNYKCVkTKIcW9RIsPSBbGWKbCF
         IqBvrzFXX1B09X6b35Vqpbg6ylFr91hkpbmxZKe4vPLf52d6jQuN/3b93jMOkKy4o8cD
         Fndl8BocFA8igoBUP0FaNdMDEIMMyqsmbn9vaHCc0EmhJ/KyseVUawclnSueWSSyAnIx
         yN2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHvLKq3ggwkOQldtVJOAOoa7ylCrGT9WJ5AyWFbNE6HzttfDnxa4gqTpzbOEpGeT0Gz9h0dQG51MoJWN0UwMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZR0llEycE3rL7oCdxwGzdU9UGJl/jkcyirLdZ2/bcZc3JReF8
	067HCD6zrGattB+TFphPO/tDNu7xPTL5Y3KTO5ypntYoHoj4Y4Uz5LiH
X-Gm-Gg: AYBFou0RgZFpFwlN3lfZo0RnhRyiSsGG8sDBS4OVhqn7hPJFZYtQiyQ2FBbfSw5SBvU
	7jddd7ElnAAcJkPLVmcWFGlP8iJXnZzc4DWB6Sebg7w0p84bgN4sdPjmfp8j03lnyF53OIGw93C
	0rGeq/jSJ4x1+Hmh8JxC5+MosPnE6n4SvmEe4Z1go50Hzh6iQoiQirAslj/4NsE/d6wkLZpzjuJ
	S6yF8SNy3W+be7jKtdVZw929yOhQnVOOdqnDgpPRzdZdextDuzBJdXpXOrZTUspb6hGVLbtwDKA
	S7UILO2m/ThNzPLEDO1V8q2QHmgvBdkcuEEpEy78Xnv/zD81CnzvLQqAdh8TVNTyb2RXWsLeLFl
	SpjwveiKukn83L/53sxY4XnazDgn7YvWZXTHR3zX/N958H2wjSqqcqrklossx0/rZ0UgWCb8JXv
	VhRa1yciyPFM5jK/gRFkFXJuLh1rrnLdU7gmqKD8WyNtr/lbNVhrqF62ba0zC2EWas/OyaIXdNo
	rWBnnh1KAhsFfJ1J4cacRU6m9b7lmJXPWPGJYKUDFSUOrh61odJqvkNOuqLwytAYC1iLX521WbP
	STZT6meDy/StQ9NftucGvE+y2a1LZ+cZGz4s9D22RPqU
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr25799822eec.21.1792143153301;
        Fri, 16 Oct 2026 02:32:33 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm5157172eec.18.2026.10.16.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:32:32 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v7 0/4] gtp: ynl spec for the GTP netlink family, two fixes, and a selftest
Date: Fri, 16 Oct 2026 09:32:21 +0000
Message-Id: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a ynl spec for the gtp genetlink family, two small driver
fixes, and a selftest.

Patch 1: the GET and dump replies carried the family id in the command
field, so ynl dropped them. Use GTP_CMD_GETPDP instead.
Patch 2: new in v7. On the netdev CI debug kernel, the selftest hit an
RCU warning: adding a PDP context looks up the device without the RCU
read lock. Hold it around the lookup.
Patch 3: the spec (NEWPDP/DELPDP/GETPDP/ECHOREQ), no uapi change.
Patch 4: a selftest that adds, dumps and deletes PDP contexts.

The multicast notifications are not in the spec: they reuse the request
command values, which the ynl C generator can't express with the
current uapi header.

v7:
 - new patch 2: fix the RCU warning the selftest found on debug kernels
 - selftest: add a docstring to GtpFamily (pylint)
 - Cc Stanislav for lib/py
v6:
 - spec: use the gtp_version uapi enum for the version attribute
 - spec: family only applies to the MS address, fix its doc
 - selftest: also skip on "Unknown device type", printed by iproute2
   with extack support when the kernel has no gtp
v5:
 - ynl: add CFLAGS_gtp so the generated code builds with older headers
 - spec: doc fixes, min-len for the IPv6 attributes
 - selftest: only skip when GTP is unavailable, close the ynl handle
v4:
 - spec: request/reply attributes now match the handlers
 - selftest: fix the gtp.ko autoload crash, check ENOENT, delete by
   TEI and by MS address

v6: https://lore.kernel.org/netdev/20261013031000.528393-1-anilkaushikwireless@gmail.com/
v5: https://lore.kernel.org/netdev/20261012024800.400616-1-anilkaushikwireless@gmail.com/
v4: https://lore.kernel.org/netdev/20261010105740.223992-1-anilkaushikwireless@gmail.com/
v3: https://lore.kernel.org/netdev/20261009060615.4177402-1-anilkaushikwireless@gmail.com/
v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (4):
  gtp: set a valid genl command in PDP context get and dump replies
  gtp: hold RCU for the device lookup when adding a PDP context
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 196 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   7 +-
 tools/net/ynl/Makefile.deps                   |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            | 123 +++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   9 +-
 9 files changed, 340 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

