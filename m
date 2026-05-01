Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262A1DA0E1
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777642778; cv=none; b=I4ZHEsbSFfxmkFRBW4mdSl8FXslCtlCwyRunIB0kc6TXxUFlPMATH3RGXONAI5Q8QgrbcVay50v9HWiD/e2ftEH+1WiIa3yHUhtWLPMqhSl7VtkG3GYbYuzVcojL2V2vYNDy6rq71uqzAzm1a4Q2IYU1fuWd10yW1oj2xCw5J68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777642778; c=relaxed/simple;
	bh=MCfCjYdl0XWkEjIaPEDCZdv+RgP7gA9P260x5j3Xsog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IEWWlrTFLEN2ZdYZElSaDKzgy/TffqSe0LefAWPNBsNRbUrawql8KNOTXfXdO8X2sSyaFojSZZoaISI9umT6tbcsAe4Y7BDY8HnQtKESyrZ9SMAA1jRAqpVClkFEvVBCsW9dwzy8a9glSH1LJanhfs0XbwIqrYJYzUmOoYYr+Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8ldFaQm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8ldFaQm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso1369432b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 06:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777642777; x=1778247577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cssEscy0p2FNGQBzJbELyna0OySg7slhF/olyd4D58=;
        b=k8ldFaQmGnJyBXK9sVvvo8VcQbETu6vg9pzMEjwGhL4i3CkAoi/aNBzEPLhnZYl5X5
         K8hU5TgIb4JpDZj21Rg0KjMMFJ2r6bl9I316oUmePTiEd+xmGSj6LYj2052dQRLumIAv
         ifsRsJVhnaMiECwdmGDEG+Cq0OKIonpJOzXABJ6jIW9fVmHPaxbxge7p84zh09/SzETU
         qjadB855O+HpfpM1MtBgxu7W9Z5DA1h2W8+UD1gbgo79g2dV6mm25bxFvgmoBhztzFj4
         GT3r3SWZcHKea/BJKh/Parvuj3WPDdja544iyvPUefyexpFVcejofgMaGE5H/c0NZqN/
         ytQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777642777; x=1778247577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cssEscy0p2FNGQBzJbELyna0OySg7slhF/olyd4D58=;
        b=pl6KBEf/eMHS6pEXhS1dSWCQq7RaivXZaPB4gBilOtRxZIWf4DLIzwm/P3RzdJnkIE
         iHw3F7qECEyXQxIgGgibagGYYiNTSiO2Arfuq0dKt1isx4xEFqEpkG1zT593kUxg4XVL
         HyLjxEAumG1OvmNUGhhPA11ylGoHSdu0FPIAVMqO3/kqFxRx6eWB2GNpnmpIVvX6BQOr
         6XzocNK1dhWzFyb2921CXrknW8W2e0+gVkpofTiojUNGQdPgcXNZOBlqZonVrTkFmpQk
         NjBBeTvQOuaSWCDQX0TtGTPSUYs9QZV7MFdrXnW78Frsf0SzkVSeYTJ42g5fNQqivFOO
         CUFg==
X-Gm-Message-State: AOJu0YxEVi4g59qRhKUmiBsPEiJRlU8TYGeSR+v2eLPML5ysfaTlPR3h
	HSV1/3NTQi8Cf/nw81MVQkUUdMXRiOuzuU/9kO9zUQE0R4Myy6Ejkjvm
X-Gm-Gg: AeBDieudH8HWeufp0Ro48/hGajLkGOx4cq41NZ3SV+5UfK2IdMSX+y0bVYlp/DCjHCj
	6+54FZ25b3cAGqun4qkYJqQ/KAD6U9tuapgQarwOdXAQM6eNuumB9pdVG5xnG8arKoa2nMFFpVp
	DsVZKgTABzFF6ZOEYT8pttGThYxRbAxCFX59+qYzKShxGxFsKCuoazmNhwJi8ahN9jtrua7nCVY
	MTUtP6l0QbWvRKzce4gkyJv2YsP9/feoURzjSpUfPX1eyU7q6DDNf/KjdOXYOYb0Iivm2HQWHHf
	SRNcNp3ociBn7VCt8a8Gv1aD5h6fJzbr6p7unJ8QEGcTTtaTnlvQj1B0tkN2f1sgYPdELnzsgOE
	E5CfKoKre1fqjM467+eogZuFthxi/jjO9iV7vUGPxrgcjeYn19xSS1CDrCzVxi1oVv1REQs4wtV
	gOYvx2OJ3zMKzqt/mAylcuhn9Z3E4=
X-Received: by 2002:a05:6a00:23c3:b0:834:df57:9d31 with SMTP id d2e1a72fcca58-8351a4028e2mr3213177b3a.28.1777642776842;
        Fri, 01 May 2026 06:39:36 -0700 (PDT)
Received: from houminxi ([38.207.130.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm2548386b3a.22.2026.05.01.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:39:36 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	dev@openvswitch.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2 0/2] selftests: openvswitch: add pop_vlan test
Date: Fri,  1 May 2026 21:39:21 +0800
Message-ID: <20260501133924.3100680-1-houminxi@gmail.com>
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
---
v1 -> v2: rebase to latest net-next/main, drop --base=auto

v1: https://lore.kernel.org/netdev/20260501122756.3081754-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests: openvswitch: add vlan() and encap() flow string parsing
  selftests: openvswitch: add pop_vlan test

 .../selftests/net/openvswitch/openvswitch.sh  | 132 ++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 190 +++++++++++++++++-
 2 files changed, 320 insertions(+), 2 deletions(-)

-- 
2.53.0

