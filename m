Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13D380FD1
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787450997; cv=none; b=gtqPVKSFMvscrKEOwL9VSWWTn051eCe85bbTpznDjiUlzsVB6EdkQ3wxus7UfAff8kWGogM4//KCa1XNDkjeqw4cNtluF8yTzeBQ/joapWUKW2cKbQt+jpGI8KasumKgWNQ4N08GcHrU/ETTc5/dnTPWWkkJjf9XhDUc4A+VPdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787450997; c=relaxed/simple;
	bh=2cu7WoZVO4U5qTWQNLd3f6N6w0xjt0Up63T4e6lKG+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrbJ/Rxc9HxymhGHjGU8/TQ29qinD100ZfVEis7jmeTH1f3gZiCzDxZ1taYu3NV9joxWslZfCDPwhWcYPmR7DSQwyotpPf3xyrBDYPe6DYVrzsHS4iwAu3ZPHgjjxemJw42hEdqMNBjhR5V846Qn0+xQRn5+5P6Ngzmi61sSJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyKwk9RP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyKwk9RP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caea3f742bso36932425ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 19:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787450994; x=1788055794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzKUGtLsldRAu0IUIgJKtLAkxGeLYC3EhzLHUx6XU+E=;
        b=pyKwk9RPer2DXcB2ARF96clbRYEk7LFXQPp7YsZX2LqDJYrD9pLLWg50xDexbN5VHd
         zW4J+sEWDWrT7J9DbXt3jOUXUSFsQMy8p13wowaAPktYVEIsbpy30c86ZhIB1sacBFHG
         jFvIUaaDCX2IT8FaQ8dO+T6p1df9e0v7aUaccNs4SIhUTMyNrYrdKkotR9DLv/cPNR1e
         jtjEt/oC78t3Lv4eRvm39tKa8n4IYqfKo7U3icb3jR9RJSAPZp7ylzbfNnc9IdmLGxwu
         UVAaOQKhU1xZUDhCXLn5/u/cAapBzAm+d1PT1oq4cZxDXmFZUnq3/E9IDeb7Z71blALW
         nInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787450994; x=1788055794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzKUGtLsldRAu0IUIgJKtLAkxGeLYC3EhzLHUx6XU+E=;
        b=ThANqPgge9Zyafktjti/+QunueBuEPrry/0rPpoYypQD83hlFOpVGCfkQvyPz1mxtw
         pMe9z6fHH/lLXCdWGmE8tGGc4XiPXRy/wx5RaSTzngTjW36URZ0v0+xMOhgfpw1COmXC
         Od+dzfzbADOgav7cJavV+IeCdChXgyiXzxcPINB3Jo7+Fqc92JuuFlQtz32cWCpHvVUD
         g1QAeHHiRtO9j7oY/IpLMZfpovOvSZlcIQQkUHuxCiZF8S0OpFtsk55jFrXl1IkGZFG7
         6GVuY+JMR3qPSH3YtacznaG0iqZROMkpTC8RlwNa4PP4LZVkYkH7SGzblhdt5b2XtoE1
         BrCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCMoMv9c6byPUj0uAEfeBNoFlvXAwYfdHEp9D9GyLLMhItPMZE3N/6Nuelo5ueVkkmANktfnYwDvnPLA6434Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lj3KLn8zlRDjsKhfIqnSjtg97nlPVmniiDa6edAfJXSOAapZkF
	m0uDys2CJtKTjNMkRBRfyOn6m8V+EWZ7ctxK0PDnhvBwiCuvLLPUq9G6
X-Gm-Gg: AR+sD134nzYHxfgEIYy7H4bY5OUDhwp+duXIdpHH5GZFMbUVHEdbtxj1Cd0EDTSjU2/
	TjIKTCwYJSkRRH9AMdVh2U9O3OZGLDq579VOeCjuQ+ZLSAp3VfwxrhB/s1xacNfAPKik+aCnYHb
	QujtBgYI5Sg2oTDX/asELFh0ZE977ukqCADJIAHHjw9b+fGsOC6DN8ygEJxcmGMEdt6UyW+PULV
	NSnnPCx9q/Tgefd49CKw5xX3J6NBVA8vBsX5Ca5qwwFXYYMm9u6tqIrmUnNaCYDuSWNumE7IYDh
	jZVanZr0ZOkMmZDzxI3ETh+jK2dxw2rdO4BwiLlvCDe8ru03hiTu5cykYOlXaOfS6QzcO14mWb6
	Dgak0uJpAI5YCoyKD+/Xn1Rw/RNCQfxiIkjBlq0QqeRFU+LYXBopOqZC8iAzKq5Ywl6PPlE6CiT
	x9Vm1lgndXk/knZHsivKaMAcaFJYecTAuLymDPz1jDoTqTfxSLufaP
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr25586751637.18.1787450994456;
        Sat, 22 Aug 2026 19:09:54 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm11371949c88.10.2026.08.22.19.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 19:09:53 -0700 (PDT)
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
Subject: [PATCH net-next 0/2] selftests: openvswitch: SCTP flow key coverage (IPv6 + NAT)
Date: Sat, 22 Aug 2026 22:09:40 -0400
Message-ID: <20260823020942.3101898-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCTP flow key test merged last week covers only IPv4 and only the
plain forwarding path. This series extends coverage to the two paths a
regression would otherwise ship silently on: SCTP over IPv6, and SCTP
across conntrack NAT (where OVS re-extracts L3/L4 on the recirculated
skb).

Both tests verify the association and then push a known payload across
and confirm the listener received it, so a flow-key bug that matches
handshake packets but breaks DATA chunks is caught rather than passing
on the handshake alone.

Full OVS selftest suite runs 19/19 green on a freshly built kernel.

Minxi Hou (2):
  selftests/net/openvswitch: add SCTP flow key test over IPv6
  selftests/net/openvswitch: add SCTP flow key test across conntrack NAT

 .../selftests/net/openvswitch/openvswitch.sh  | 183 +++++++++++++++++-
 1 file changed, 182 insertions(+), 1 deletion(-)


base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
-- 
2.55.0

