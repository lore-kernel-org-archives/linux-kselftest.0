Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385C49B203
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353507; cv=none; b=D+vgd1aBlfVwCOGgNZURPMnlZgwCdT94sKbeb9Jl3YsrSk/LPQeFfmHgKqR87Z9CcN79a4vFyfcqWxxbP+/ou6RN6Ml/vSf8wUr9EIFTDT2oXvDzug5cpTd8xHWzpBcpuhp58ZjOFjUNd5k4GFm+uvs3ts0VnCqn19lrHVrsIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353507; c=relaxed/simple;
	bh=+y+47c37F4DPDLDMUi9M4DCcyjsBthCXYAq7Hd4lqhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVtACCmnwP308MGg7IoNSYY0MMLeWoyD3WG2iXBZyyjEARNayfSiS+RJDxJjPaUA7XFW3u+5t2hgukgRxFHcXHIAPJUmG3rqN0HIdVHSLSeNwaz09DlN1hS1BbR9/6pn/wAindeAS9V+le6w0WiNkz10xISmoAB97+42cJoNBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss7Clx+Z; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss7Clx+Z"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9392aa26b25so113874285a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353503; x=1788958303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6QIrF2Yp0RPJAeeACAyBLGkspKOCeNb15ukntUyn84=;
        b=ss7Clx+ZjMNW0968lkcsW9RJPE3BvYRyNB1KaMW6j5yjCpixcP45uIijPCZe+6xyjw
         +Yz2JhIB+NnI4tFgf5uTSCUEHERXeaxtX6KhmAl1iAYE7sp2CWvliNp0ivTTnaB0E5kq
         seaUhp0Gxi9HXSap3+oRTPtKDqXvu2a+aL7onBPbovYAroiuWB58+xmq79lkdMn+zU56
         VkE4N7skHeGDohmT/jWVDH7++ejWST1+b7aq9S2M8Mp8F/LjgMyB3zmW+JyB5juUFKxO
         A8+g99D1RuOyCWl5vGRsT5ThkGP5p2Dn5x8EIYGXhpSleiEVxTWcSPSPpshMkChnVpqO
         npfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353503; x=1788958303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6QIrF2Yp0RPJAeeACAyBLGkspKOCeNb15ukntUyn84=;
        b=CMnm3/FNPREdcRb67IFdwqCu+Pwb6jzKBJ6DrTzNGxKw35tZJFs1KWyo3HrsBXcvL6
         nO227t9rjlMIC1n8U1p59BjKBw3o8TM+3eEXz9kU2GKVG3yK6DAnHfyEJpTTE8pJOxNE
         VYNxU6oAgg26KvgSUYo7ASsc2GQ0tZMKLigoC6ZZF5OfE7f6VRAAu7CMTM4N2MVnGbHk
         uKw1cFFfSASHcHsjNeVuqgpQzKCAO39NJ1StcLzsHdtu/ffPM2p3k2y/zHH9LmW2yeey
         gZ4ZcqBqAMWrjvKTbgAmx1lU7jfSxirEHqgNACJomRcekZo5iuxmbmV9iRJB1Ado8X3D
         UImA==
X-Forwarded-Encrypted: i=1; AHgh+RoHhUNP+d1l44h5rVewVqPI2wLNPBerSXgBMDmDaaK1LncRZcGznuC2ux5T3uWcChFrg7+RIzN6WMtQvrvKbqY=@vger.kernel.org
X-Gm-Message-State: AFuF++mQA6SbqJQv4TDiw97R/juEj7/gQ/+N08IRq8h9sAPdjGtONXdO
	xdqiNydMxzoYjNvUoWnIUFrAKiLqxflrCNLI1RZnsl2g6pd8bZr5p5Zn
X-Gm-Gg: AR+sD13GH5XvZZOzACAh4tSdtjFgE68UpItiw/r2l7FAzl4dLRdifzWFKInoz4zwqIu
	GvxzUZpnRGlUfABscNIWRliBS/KCq71GsTEyMMr3mw4t/rfbICfSeTfLMBbjtD3ds7hjRYzLWGt
	po0znVYCjizGwULDDvja39V4nicLferlYcNBgq2ndKG/9YWeEjnE//5wuAsdDnwHYAFEiQzOEVs
	TpYPoqDsN21RY6k2IZHbdYsqzutBOqE0Q2QrE1t6CONhGBAfOe5ZBQHBG4wlgUgvXfWxIoxQ/xO
	CKAXnjpW5YukybfgyzDPp9Spo11Q2KSogTPn2Drcb/h87q/MVz/cDSSZFYgF+HxzGALMuhWwcl9
	LArzEwjJBMU9ApfIuzPA/KvtFdm5hMvI9IMgLeI4ftvmgb3aO/BeLKfm1gp6Eop+NXblX33Oqr+
	bTne7WzW9zE+ZtNUGdB/f+XUwI8tXaM5YEzCuLDRFQyAPR3NCob127
X-Received: by 2002:a05:620a:4151:b0:936:ce17:dac3 with SMTP id af79cd13be357-93961019498mr501183085a.40.1788353503162;
        Wed, 02 Sep 2026 05:51:43 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35d823sm198612785a.25.2026.09.02.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:42 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2 0/2] selftests: openvswitch: SCTP flow key coverage (IPv6 + NAT)
Date: Wed,  2 Sep 2026 08:51:31 -0400
Message-ID: <20260902125133.1828572-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCTP flow key test merged in August covers only IPv4 and only the
plain forwarding path. This series extends coverage to the two paths a
regression would otherwise ship silently on: SCTP over IPv6, and SCTP
across conntrack NAT (where OVS re-extracts L3/L4 on the recirculated
skb).

Both tests verify the association and then push a known payload across
and confirm the listener received it, so a flow-key bug that matches
handshake packets but breaks DATA chunks is caught rather than passing
on the handshake alone.

Full OVS selftest suite runs 19/19 green on a freshly built kernel.

v2:
  - no code changes; rebased onto current net-next after the tree
    reopened (v1 was deferred while net-next was closed)

Minxi Hou (2):
  selftests/net/openvswitch: add SCTP flow key test over IPv6
  selftests/net/openvswitch: add SCTP flow key test across conntrack NAT

 .../selftests/net/openvswitch/openvswitch.sh  | 183 +++++++++++++++++-
 1 file changed, 182 insertions(+), 1 deletion(-)


base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
-- 
2.55.0

