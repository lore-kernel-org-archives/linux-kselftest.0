Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7C2F25E4
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123825; cv=none; b=im6aSCcZPv3Zl94tQeDwfNDg5qREmUYNp2d0L4Tjj/iBtNSAnTn6QHfQuNrKX3W5jh3STQSILlFQaXmuP5phAWJhFs7GnfTUvSAC7F6TOh6Nr/GOgqLxujj+6n5XGvCqw9s9pjz4I73k+xg3H0blMXT9wgDIXPh32xXMdFhvna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123825; c=relaxed/simple;
	bh=ZzM+CCCQqrBBbllRZD9oibWkuHbAMqZCqBVIxEMPmh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TPS7h9PKBM7tWdvg5+hKnOboBdo5qE4hyNxaO837gQT86SEi0n+uPY+CIGMgacuk4K2yDbsgErZNjD75Y5ZX3HNEJ7rME8W+bgxHAIF3juIQpSoKgk2337MMdmpF9Mn70ToWC943WWvmSPNu3NmdGjewVpdxeDgeNN60VT3zdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhN5iqRn; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhN5iqRn"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so230964b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123822; x=1790728622; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CZBn+eDayIvlQNT7notJ1Nrx/JVsU458mj9MKMefVpw=;
        b=RhN5iqRn+PPr4+HkDgBJSL7gYcyQTpk4rmYkvRuH7Q9rV2zrGB6Ji4Rv6QXd71nJ1h
         Lfrfz/eQP1X479wY64SOB/fU5TvlvEB2+CRvDIxj6VJMinymZTJh0bAmVd0E60UsajTd
         2EaURTJ9SoQ239bZwFuZ/RdVL9LwEZefzsZT2f0ISF6Kff1145D0q4YIdPBPFl6w8LwT
         ZqMCOTMNz6Ug2oSpOyss129xe+RqIeuWO029MTzM+vovqqfF37G+OItap2qrgifsGR3N
         7fOQ2bwZtBba2C2Q4t7a/NBguISLLLakjaHq5naDGEMkPS9IajQCB9oavMYTToGbEmaf
         c15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123822; x=1790728622;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZBn+eDayIvlQNT7notJ1Nrx/JVsU458mj9MKMefVpw=;
        b=A1nVBHWr4Yw/pexoKns8u8eUExfXljczdIWwdZKx4aPKg770Ou7A9Cc8Pitf7qQGsS
         XO5WpznIS+QXOzfTypme4Yn1CdlU16xghr8VeFNCkJkBEwqkVcLN3oMhemIUb0NfRrba
         U29Nxyq6bNshVSgTlHULIEAZn7E2mPSll6yfiMiAbdM8A/Ad3Jcb8YFgHVoHwS1PqjtI
         t01/GzcPSVQWyd4Gtn0I7M97MbLOwYg1xjtiKTlT6vttLe86l4NIL4pxCSJZbpXvoMAq
         8f+hF25mafl2KYdAzDWCuuwr94HP+vJ503rSGinRcopy6j+xTKA6v0UG9XgwZv++RLey
         QaNw==
X-Forwarded-Encrypted: i=1; AKwUvBwNGiGianDM/3hHlrewChUiTtjrfTppazI6FaFQIImRZJ1ReqLxr4GjET5qRzdjqUjb0EDq8oaYRmhL6k3+m5I=@vger.kernel.org
X-Gm-Message-State: AFuF++muCZJThKXJvw1bH5waayjuc4CDKfHHZET0cMeOaRUJCOvTZX6U
	W4QqaJql9cFP+OVO4CdrNhK01xUXy6rJX/B41NLn+O2daxRQUJ9X1tnH
X-Gm-Gg: AYBFou3iZ/BGm/DoqPXnlW6A/iTISGesfdi45SJjR89o8gkD3VICk2rjv8G5TyTvd7c
	bNcbH1VRXo+hgREkR+9WL/hBcCbcBBbYbU2F4Zztp/EjqRAnIaFfAg1sQpSXK/ypvrbQ0YGe9AN
	rB9YaFv5MiaDuUQTUqGU0iPLEPw3RDZOooaO8r0bVrhuDQI630DFIXk0vsys5kuCmPy4kj3hpBT
	VdVWZKDntuVW/c/MnH6+p+Kp1CyN2ZivIpHX0wL6W7jk87TaT2+DxUGCdU0Zm/kQ1VYLnmzT8Z9
	hJ7ay3jTIFMt4OhvcPhbanbcoremBCBTZMhq2X0aufms81IAp4QFpU5rDZaLVWt+UcUNmaDXegZ
	A1Wma1WwZ+w3CUps20JCpoaZQXSXDcAMXBOtzPCkCMKja7QZct8lFa5w4pZq5kMyO6FGbJd0j/1
	ENHJCMzzkVTZl8cjJpNTqf30B9hy9ZyK742SHeJHZ5Vf5DaOyZxgD1yiNyOlbMhoJuuw4afDtTy
	hhNGa+AzgRR+IFh/9yE
X-Received: by 2002:a05:6a00:1749:b0:878:3830:a48b with SMTP id d2e1a72fcca58-87d1c5ba947mr1135793b3a.59.1790123822185;
        Tue, 22 Sep 2026 17:37:02 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9778sm427895b3a.49.2026.09.22.17.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:37:01 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH net 0/4] net: lwtunnel: accept encap attributes without
 NLA_F_NESTED
Date: Wed, 23 Sep 2026 09:36:55 +0900
Message-Id: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcfs2oC/yWMQQqDMBAAvyJ77kJM0dZ+pXhY043dIqsk0Qri3
 03rcQZmNogchCM8ig0CLxJl1AzlpQD3Ju0Z5ZUZrLG1aco7Dt+ErI4m1NEP1CPxranIX01XWcj
 ZFNjL+l8+QTlBe8o4dx926TeDfT8AgJR5GXkAAAA=
X-Change-ID: 20260918-lwt-encap-noflag-ae795af30b52
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Eyal Birger <eyal.birger@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Xin Long <lucien.xin@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=ZzM+CCCQqrBBbllRZD9oibWkuHbAMqZCqBVIxEMPmh8=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsx8pEqF5NV94MtMGYigX0r6FVebRw/ek6cZ+c
 ZDAAJBL4HWJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarMfKQAKCRAq19F1Kl0b
 TabtEADK21qqwY+zxEap8CxTUPOMXvvY5Z2WT5fsC41gOfVWdYzjTTVxGKMffF8zeJWcKhpRK9n
 UQfM4/8/hSisIorrmyK+YLKr3r9+paZ95647p2YpL1hHlhIa6DzoZe9yufEqN7fCtz8mud2yimg
 Y+FpHJT0tHcqwNgbVg1M1SNRN6+oZ5QhQ2Vggc85JcEw7r12hMy5Spuf7FiTzztl6iS3REDOfka
 XwNKXSV1Ua0rpDaxKdC7DTgfzcO37H8Clq/bDgz4kx/sV7sl0w9lCJvNWat5EBJDivLcEOGdPhH
 /fOlXeEXkCCIrEdYhzbYESZ61Y75O3RZEkPAnSXBBlYucSQ5t5TNHRYU6uJAiNhUG1Tm24t7CYq
 LoTUCacZAcw+TOhhfZz9HtexR1gTU01zfLsqBee9kgjPIxCrNczUEWZBmRRP0UxPkUhnWPLGmBJ
 iv2MzySiAaUbxOjAUzPgzWwybYgFLGbiMhj48NjY/WxQTcnL0WMCIoNSsP5Q96kM9940OosRzgD
 74Yjr1X7faMiFasvKDPF/H1AZtS3HJvDbyMXRrZ8fpFvP5fq4eEdi/1GlOP4NXb27AZzgqINy6k
 DSON0talx13U/+OlVfhMqmTdzHMwuV+SpBWqgxULeVjIyzvEm4ZzbMsJMoQO5zvBNvx6SqNUY95
 1cXmOQPMgxtA7Jw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

"ip route save" stores a route dump and "ip route restore" sends it
back to the kernel unchanged.  The kernel dumps RTA_ENCAP, and some of
the attributes nested in it, without NLA_F_NESTED, but rpl, ioam6,
xfrm and the geneve, vxlan and erspan options of the ip and ip6 encaps
require the flag when parsing them.  Restoring such a route fails with
"NLA_F_NESTED is missing", and none of them has been restorable in any
release.

Setting the flag in the dumps would change the UAPI: userspace that
does not mask it off the attribute type, such as parse_rtattr() in
iproute2, would no longer find RTA_ENCAP, and dumps that have already
been saved would still fail.  The series therefore only makes the
parsers accept what the kernel itself dumps.  The dumps, and the
attributes accepted with the flag set, stay as they are.

Patch 1 adds lwtunnel_nla_parse() to the lwtunnel core, so that the
missing flag is documented once next to the build_state callback
instead of being worked around in each lwtunnel.  It is
nla_parse_nested() without the flag check: the nested attributes are
still validated strictly, which nla_parse_nested_deprecated(), used by
the older lwtunnels, would not do.  Patch 1 uses it in rpl and ioam6,
and patch 2 in xfrm.

Patch 3 does the same for the ip and ip6 encaps, whose geneve, vxlan
and erspan options are nested one level further down: the level shared
by all options is validated through lwtunnel_nla_validate(), the
counterpart of lwtunnel_nla_parse() for nla_validate().  Nothing but
the NLA_F_NESTED check is relaxed.

Patch 4 adds a selftest that saves and restores a route of each kind.

---
Yuya Kusakabe (4):
      net: lwtunnel: accept RTA_ENCAP without NLA_F_NESTED
      xfrm: lwtunnel: accept RTA_ENCAP without NLA_F_NESTED
      net: ip_tunnel: accept tunnel options without NLA_F_NESTED
      selftests: net: add lwtunnel route save and restore test

 include/net/lwtunnel.h                          |  49 ++++++++++
 net/ipv4/ip_tunnel_core.c                       |  24 +++--
 net/ipv6/ioam6_iptunnel.c                       |   4 +-
 net/ipv6/rpl_iptunnel.c                         |   4 +-
 net/xfrm/xfrm_interface_core.c                  |   3 +-
 tools/testing/selftests/net/Makefile            |   1 +
 tools/testing/selftests/net/lwt_save_restore.sh | 116 ++++++++++++++++++++++++
 7 files changed, 186 insertions(+), 15 deletions(-)
---
base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
change-id: 20260918-lwt-encap-noflag-ae795af30b52

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

