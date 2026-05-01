Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6E3859E0
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638490; cv=none; b=hSd5f/+3y2eqFw16Nmn38HL5PztrVBJ1WIZ3lg01VRT+Sxhhqw2qPy/RNQWJ0XzbFAv/s1VDpigMr3K3VkU9j/7kEIpgLUNkzt+hLT/aZTeg54iTDaGei9uZxqVxx+4cJNRRYYLD7s+JrKrJd5pbzinDvHXQ7ck8GfjjSlkl/wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638490; c=relaxed/simple;
	bh=OBmgcolYEQMKyYQrSi+CBFo9fbF6RvfMpIQNEXT146E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uL5PeXTM7azOXaRDSJtKruOoP0bJAYD/4Nu70rG/hJlJdqLfAtds6LUkst+p5Ifww/EGIcAcGr5Tn+13ZZ+BRrX6e14nEc+ipkyySQyQO3EMt6v5l38BM4FZmlSbN/dv1lPW3oX6fHEe20E3kbgTQfCVEU7XngTuZ5ExPmdEcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bdd9PcBc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bdd9PcBc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so10371565ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777638489; x=1778243289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMtmjJ2k+w8uEBLIAQrkz6/bI6nhEEnnsMvMljpxvdE=;
        b=Bdd9PcBc5OdjZZm3Fq0p0c130lTEO/gxPkTZP2874KmpbJPyck7FXZN436ciybcJFw
         ceohFe4WfqdZOrtJ0VlCaCh17C/PWDHrX4mETFemSU/XLZTsEVfbIf1No63aYmZ/oH1H
         6E7XuaaM9KUnYCXamFK0J9YhkWhnlzDyxSWw8AbLc/TMN97Xyn43byHx/tpEmhz1edR2
         HiYygkooE5rNCNqzOSKLOUHecTKD/56uAqhAIBTtv74bxCSYN3fv8vhsPxKrcXRZL9wz
         FNzjKJzBwJnTk/VeAxmj6ejP7bHB3UhhPQXPdsb4/eM6SIE7fmeVDcfxp/d9oyZGaa6b
         CCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638489; x=1778243289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMtmjJ2k+w8uEBLIAQrkz6/bI6nhEEnnsMvMljpxvdE=;
        b=CDxi9Q8KMujuwnErCOlv+1cXiVa0kArJEkTnB+PG/WeBJomtMlYRLFWwZbrJi2eYrs
         cOXMjYBeR57woWxYpiPj/jT72nYQ15kjAQmEobdpOK7wQ7SMEiGXe9UMYNgUnWKphnay
         wEfYrq1NVkaVxrRQyZCjqMrxpcabou8sJmde2gmlg99BP1BLuRkUl8EpZSTPSHzIKKy4
         TvfvMu0ayV0ycbBr2eVxZYjdwOCJe/OvdpHgyUVbl3G2M0+xdsbXpRNaQP8trNiobV8w
         yr+5hwoTX1/82IJ6/TwuT/b/j9ghbkstncpiUBzPd4bc3G3tFlGW5B8ShK4NPPcOUjxR
         JJhw==
X-Gm-Message-State: AOJu0YyVhPBuk6xSfvwXhhtpm+LZr+dohbeuDAPYPAtieDOWIOTQyrfN
	BoWFhL+v8MjCC9cZPCdsgslj4wUpIugoY8NVofwm+nfFzLOyjrarPgRpiPC/eg6/nHI=
X-Gm-Gg: AeBDieurnkziId8gvTNGTiPtixyMLVXxh6MqhMR9Vc81fQK+GdJvO+WYthL7JThx/Xe
	iKwL13WkjfGyayJPiuMiKmzka18xmDVtHEqs5f0B+xRteLWhQB9pMpRXZGM1jzcpYei+h39UjmG
	nkBp5qikcEjg+Z/oNFV9kAIlWyh9UiXslPnsurQiCCKUaMIUFGH4+6HHtnNvll8nRI4LVj+pnvh
	w48pVOjAQ666wTt1EFTxRr3FpQkj0CuVKDZIG/BKz/cY8o8ls5keb4ZxCRwlZ/dGNmsXrrYMy88
	P5XdKabR21m0+zHtn4nkifFx0oYqYSVuDIqOY97sWXgPNd2hcFBDhsMSRSw8dmQbFbCrzEJHQPp
	58xXmiP3wklZm+v79gGcZBxNub1c+YsbEmpVayHGzl4/GXSSqQmR1dDuI6uTTEs0tI3Tq32Ni5K
	YPkbyyiakStrDeeniXP/0hdvHt2YU=
X-Received: by 2002:a17:902:7b8b:b0:2b4:6470:760d with SMTP id d9443c01a7336-2b9a23438c4mr52827555ad.14.1777638488824;
        Fri, 01 May 2026 05:28:08 -0700 (PDT)
Received: from houminxi ([38.207.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9ca953894sm23370395ad.0.2026.05.01.05.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:28:08 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	dev@openvswitch.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 0/2] selftests: openvswitch: add pop_vlan test
Date: Fri,  1 May 2026 20:27:54 +0800
Message-ID: <20260501122756.3081754-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the ovs-dpctl.py flow parser to support vlan() and
encap() match strings, then adds a test for the OVS datapath POP_VLAN
action.

The ovs-dpctl.py flow parser currently cannot express VLAN-tagged flow
matches.  The kernel unconditionally forces an exact match on VLAN TCI
when parsing flow keys, and requires both OVS_KEY_ATTR_VLAN and
OVS_KEY_ATTR_ENCAP for VLAN frame validation.  Without vlan()/encap()
parsing, no VLAN flow match is possible from ovs-dpctl.py.

Patch 1 fixes two pre-existing nla_map type bugs: OVS_KEY_ATTR_VLAN
was mapped to "uint16" instead of the correct big-endian "be16", and
OVS_KEY_ATTR_ENCAP was mapped to "none" instead of "nested".  It then
adds the vlan() and encap() flow string parsers, dpstr() display
support, and proper ovskey instance returns for encap.

Patch 2 adds a test that uses kernel VLAN sub-interfaces to generate
802.1Q tagged frames and verifies pop_vlan via pcap at the egress
veth.  A negative check confirms tagged frames arrive intact without
pop_vlan, then the positive check confirms the tag is stripped.

No regression in the existing OVS selftests.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
  selftests: openvswitch: add vlan() and encap() flow string parsing
  selftests: openvswitch: add pop_vlan test

 .../selftests/net/openvswitch/openvswitch.sh  | 132 ++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 190 +++++++++++++++++-
 2 files changed, 320 insertions(+), 2 deletions(-)


base-commit: 4baf2415992e3051cb39b831191d12cb7e85ab60
-- 
2.53.0

