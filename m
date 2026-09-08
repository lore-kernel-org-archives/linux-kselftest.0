Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A0563FDB
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887952; cv=none; b=NpbMFNc93dn34jHcjjYLCLT6eWwSXlejEuZ7Kkn84cVYK5Bpjio4Wa4bmYZTVAvPAZmP3NUgTmNshVqmRjme2w8uEsuTDO+S9Z9x2fN2XZPi0g1GweoLKd/3SRxc5AqNGi7i2WAGOB4XZYorjTcjzvi6F1daPVvDO1+61KOEibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887952; c=relaxed/simple;
	bh=pSBJ0wuxuKY2n7MkyYRk/Tilh69ZMtqLinFYVMSY9U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0iAvAxnMnbxCmRYNhRI/hCPb0yUyjpOuoYwFXhkn/3JgH4YAZ5/BlMGM4OCLz/ro04odAbWnhcL23AHTy/6Ko8dkXwwR8GR6BDCCEjfLt8WG+3L6OnEDk4AWbDACVHmeyQV9ReKJ0AwF5b0P3rYMjeGySijM7NDOzJtB4SMe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbkgEb55; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbkgEb55"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8588583a7c3so49571237b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887949; x=1789492749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aDG6sDgF0mv/hfmJI710/QSKPFn+zrHlrTu7ob1YyU=;
        b=BbkgEb551OgcNtzwN+3h1Jfv9yaCeraLNcNDOIMuhteOxZ2Vebep11rHJmscl9JWAr
         x4wvJPEw/qyFeSQn1xqxQJMh5c5fagiIkHhJMfXGQxPOM4rg98jg1MGCAJgejFe0odlP
         vQCPFsv64gIelzhVIqgJ+IWY+vYJkE1De/4NF7goKCf7rQ47Y8mX22CHYDvXXd3fCHs/
         +zdoeNdolnTb0ZCubqkoT3biJ4o2xZ5rQ2O2lGVrd1lNqyvOzFBU6Nqab1Qh1iMqOgIC
         n38osTznOQ7atcrmg3w74kD9tuKl6NGUcAOGs91+b6ZXklqb9kxYn14ouDwI1AdCDSA6
         Kiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887949; x=1789492749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aDG6sDgF0mv/hfmJI710/QSKPFn+zrHlrTu7ob1YyU=;
        b=Hu6HAx4hmTkxALGSnureZgFKX8X//tuxrLrtJ+lsMwuAN0KjAfxJR4AsOW4XujCTrX
         07Yq3vhjMdtMgg80Fo/NoZ54KMGuxhS5zPXeT4G720R/lugMllhoXnsmXsRaYsjOZ1zK
         vy/ibt6yCiXkwZn+C/r4rIyJW+RRsegMsuXefLSJG1oiKFcL4HdbsGYsbO/H3RhYF0Lf
         Qtr11KnXoQ/zd9Jd+NMMkaohLfxRfe5/PUuzMDCnzOXN7xQDHZyjIO9F3x1PqDxSQGpC
         EVnN6/EIqdBq+U6LnOBltzNVXS8t69F7T0dsTlT7Wp6YnNsxeKwtX2n4qqpOdq0PWbU6
         j+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB9jfKpfzYEWQ3VdwfWpqQAsF1VfAyipWxfUtnVYzSx+ThztaS2buskLSnYPUDf/OjMsBnHckvKc+dU/FTZJk=@vger.kernel.org
X-Gm-Message-State: AFuF++naIH9twaq0J4WiMmLF5uKbvtyzmnsiuM8XLvzri2Z5+EFMC9eE
	ZG4DnFhEgtuGk4ZYLZn3377dmipo3qIOvgsi1TY3cZozZcZQdynk6YTR
X-Gm-Gg: AYBFou1pAOSOBcNE2JIa96IRQP+jsNlLJSuWheykWxrc9sze44MFq/h24nt3nOpG/3B
	By6DSPCiBl3B/mPoATabywnbCpxyghCokpuPU3BOYwuCBRYbTgdS1y/pA2zqDlm2d9XO/Uq3hwA
	5ZXfBYgyI8cTbg7wV4umNhx67/pHbHs71nD0LooohO9SRUxGfa1fWu+6gaKzrPqWSIAQLNNBQZM
	hRICzo9ZbAwp6DrgXwmj85uruivdP487cTv6AMcgkXEwgC7HMI7ATVYAvD+v2rWCilBzwgi6vOs
	/uayxd7YofqKwhrr7PstV6I13jYnn3RVVkJauBO9mRxceBsoU7VPF6B9w+7QVWQlgNcb0naUpHT
	SzibSA+eDzPXP/AQqiF5LqZA7nfzRDzlSrrQ3GbIH9xDZZeVYVAn5F1Q39eajtCyXqd2aWQVMwz
	SJtIQ+ZcPrY/4FbEM+7r8f5t8rKIXL4wb3tU/BKRUhn939fQNY8Nfe5jkLhpIo5EjVSg==
X-Received: by 2002:a05:690c:88f:b0:823:2ad3:d392 with SMTP id 00721157ae682-871290a54d7mr102670407b3.31.1788887949335;
        Tue, 08 Sep 2026 10:19:09 -0700 (PDT)
Received: from houminxi ([104.167.197.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c94ddsm120081361cf.23.2026.09.08.10.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:19:08 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v3 0/4] selftests: openvswitch: pylint cleanup of ovs-dpctl.py
Date: Tue,  8 Sep 2026 13:18:55 -0400
Message-ID: <20260908171859.1967327-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a respin of the ovs-dpctl.py pylint cleanup series. The series
raises the pylint score of ovs-dpctl.py from 7.69 to 10.00. Each patch
targets one warning class and makes no behavior change.

v2 -> v3:
- Rewrote patch 3/4 (docstrings). In v2 many of the added docstrings
  were shifted by one method and described the wrong operation (e.g.
  OvsDatapath.create carried "Destroy a datapath."). Every docstring
  is now derived from the method it documents.
- Dropped the ctact -> CtAct class rename and the parsed_len ->
  parsedLen variable rename that had leaked into patches 2/4 and 3/4.
  Class and variable names now stay as upstream has them; the
  corresponding invalid-name warnings are covered by the module-level
  disable in patch 4/4 instead.
- Moved three hunks to the patches they belong to: one f-string
  conversion went to patch 1/4, the bare-except fix and the two
  @staticmethod decorators went to patch 2/4 (the v2 patch 2/4
  changelog claimed the except fix but the hunk itself sat in 3/4).
- Rebased onto ab217fbb9b21 ("Merge branch 'net-sysfs-use-ops-lock-
  for-speed-and-duplex'") to resolve the pw-ci contest conflict.

v2: https://lore.kernel.org/netdev/20260905104026.3776396-1-houminxi@gmail.com/
v1: https://lore.kernel.org/netdev/20260513121240.2590767-1-houminxi@gmail.com/

Thanks,
Minxi

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (4):
  selftests: openvswitch: convert %-formatting to f-strings
  selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
  selftests: openvswitch: add missing docstrings in ovs-dpctl.py
  selftests: openvswitch: suppress pylint complexity warnings

 .../selftests/net/openvswitch/ovs-dpctl.py    | 408 ++++++++++--------
 1 file changed, 236 insertions(+), 172 deletions(-)


base-commit: ab217fbb9b2169ce677b09a66558d5c3adcfbb76
-- 
2.55.0

