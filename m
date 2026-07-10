Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5B1331ECA
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721966; cv=none; b=mCIRn8dgD889JMEai6mAv71uBClVP8OIKUvRkXhvLNhmMIbrOzZPqSkEHeiFsb7Box2C+E7cxjbiwp/MI4/sGDmNeQ/iNVuTRH7aI9wNTMzdcOtucUWekOuX8kWr/pjaY65VFQqtPYWXjbJuiQpplNaRSU1Q0cfDTwyF3F63i/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721966; c=relaxed/simple;
	bh=rMwXG/xzrygpew45ffALhZX5cO4JIo9QIeLG3lp+VJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jwDxhbYvb1YICjeO86nu2SXmpUSg5EO3jr6cAGLMmbzT3d65gZJFCTwtbaRmc0PmFehkwZFBFuuD+9sLoyn8WmlO9flDBwlV4hA69vNEw6dkPDnEP4419fMZ1sjIgRT64SO68npVF4KojjIO+MWv/2Mnh/e8d/VEnWFCH0Q1xmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwnCiyXm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwnCiyXm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso784362f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783721963; x=1784326763; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lHX1102TV+TIQ6w7Elpz5FAV9Km6tggV36g0BGdy0xM=;
        b=mwnCiyXma9bS/lQ59kjHN5GKJ2pcqdH1XLjqWZGNpEvifLfXjPvzEyFmR6HV3LETxL
         7n9zxK/FUqvjOmuMHrChAlbyo3n2RkNQh4rf+QzTrO/PPWpRRlMOmPDyeHI5PBonIzkj
         mr5X2/s/3ir5oBJXD+U2dXYH6lkjhtTrSMD6vRbUiEj+NPITvTuaTOeiMbFAhXs++Hih
         9H7zXsOp1PEyNYw9M4xEvyUwX7SMpQ+qsiRm6b/7LwEBX6DJfdSaKBdGl/AgKG1mkmuO
         ZgD/yBzoHDBw2XsAgyD9XcG1CNriVLJv7Z45fgsCBP2keQtBv7Y91wwJhww+83iPy5a4
         coCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721963; x=1784326763;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lHX1102TV+TIQ6w7Elpz5FAV9Km6tggV36g0BGdy0xM=;
        b=NCGDDgQ1pgl5D+2lI2ySMeRkH1WDvztHZnMydnJyw1Ec6FTNTwITC44ayM6T1jGB16
         L8exDndf3m7MQp+gqXj2EzJCJneMNipdqvzkfplfcLjsEdGunJsrpQiiI6I9B2DvMYaB
         8aMUOPEAQX0glgS7I3F0a760QZ2e/dP0SsHBwUPM6Q1EFmPgpgGzqc+pYdQj9hVOpDIv
         b7cs5b7H2JcgMJ6nbO3WjXmSm638h4Na66m9UrpIWk+cn3Z0VCO4ccHiVIaQRgOhnqF2
         8fj36fcfcGN5K3NWYSX+W2YcoEQkyzN5Fbr4TaxFCwM7Hd2cUXu4LEVbjRpif/Ofp9yZ
         2ahw==
X-Forwarded-Encrypted: i=1; AHgh+RoquJRENcNuDqwmwGMDSohaA3lIyPmk9y7Fde9eGpW//McZ+eaUe+Qz3VKrup+G3PPDrXFFM+yOHe65/knjdVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUnc9yrNsMym9W62j/c+lpWTyZ/f8w8835EZFXxptVsQEQVcd
	FdrAZhDiAbYEURKQf2u1zJxYoAGVuWwEyHifKg3GF4Eg3WBF04/GNPoI
X-Gm-Gg: AfdE7cmESf+gy6LdTt/nr7Qo/bdhOT8di26Yk4CoEp6iAsIifAJ3VJvLkFyR4Mbaazq
	OXFoMNjv8ma70/bkZhkwu9+g+VauyacnThx7ucaPcUaC4iPbkRKG5CsWRut4BBAtTe7tWDXhT7M
	BixrSAlWyBwFsz01Frr37KTVx5Bq/VpONapfEZ8tk5HLK3TzB99ltieQUYIr4+7Y7Si7B7a4zOm
	u9r6jZKARTSxujVI1AvVTTWvkHCcmE+kr3e1XYftQ8mitayhxodimHNVdXE9e0i/x6d6AmpbJeg
	rTz66UmTvcEtdSF75iTSH5az+O96X6GQfHbnSVrAqWM6QGtCxNONnpLlf2zApu9Ov/XXx77epJ9
	pLO1BVqeHFixQT5VJK3KOf8bbYwFQmR6Tl5O7Zyhm0C+hTdw7/qiFT5JmUUq/ok2Ppbowy6JMml
	49kbFhYc7S8QNYEWvJxNfmYlzlA11jWQdSbtg3mHLo8Do8NRjX5FERG55bzZQ=
X-Received: by 2002:a05:6000:186e:b0:470:7fdf:61fa with SMTP id ffacd0b85a97d-47f2dcf408amr498442f8f.38.1783721962995;
        Fri, 10 Jul 2026 15:19:22 -0700 (PDT)
Received: from [192.168.1.243] ([143.58.204.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm64602353f8f.26.2026.07.10.15.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:19:21 -0700 (PDT)
From: Andre Carvalho <asantostc@gmail.com>
Date: Fri, 10 Jul 2026 23:19:17 +0100
Subject: [PATCH net] selftests: netconsole: only restore MAC when it
 changed on resume
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCMBBFf6XM2oGkYHz8iriI6R0d0UQyVYTSf
 ze1y3O550xkqAqjYzdRxUdNS27gNx2lW8xXsA6NqXd9cDvvOGNMJRs/Y+KKR4kDS5At9kEO8EJ
 NfFWIfv/RE7U/ndfR3pc70rjkaJ5/dEvm9HsAAAA=
X-Change-ID: 20260710-netcons-mac-reload-f6f5e86f9e1f
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, matttbe@kernel.org, 
 Andre Carvalho <asantostc@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721960; l=1886;
 i=asantostc@gmail.com; s=20250807; h=from:subject:message-id;
 bh=rMwXG/xzrygpew45ffALhZX5cO4JIo9QIeLG3lp+VJo=;
 b=SgBukk6tUV0LYwGEDip6kQYCMUZWS2uKsj3fj/4xPkk94B+G/72XHpkXzD4Vt7aVi2bxYhd4g
 n2GvezkO1utAhZo8Qpi+kgr5UbwLpMsMH/KBq/lvQVPqEqPc8fm185T
X-Developer-Key: i=asantostc@gmail.com; a=ed25519;
 pk=eWre+RwFHCxkiaQrZLsjC67mZ/pZnzSM/f7/+yFXY4Q=

The "mac" bind mode reactivation downs the interface, restores the saved
MAC and renames it to trigger a target resume. This assumes the recreated
interface comes back with a different MAC, which is true under
MACAddressPolicy=none (as on the Netdev CI) but not when MACs are
persistent. In the persistent case netconsole resumes the target on its
own, and the down/restore/rename flow instead drops it and fails the test.

Guard the block on the MAC having actually changed so the test passes
under both policies.

Fixes: 6ecc08329bab ("selftests: netconsole: validate target resume")
Reported-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Closes: https://lore.kernel.org/netdev/f398373e-2cb4-4649-a491-9763df94d98b@kernel.org/
Signed-off-by: Andre Carvalho <asantostc@gmail.com>
---
 tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
index cb59cf436dd0..d9111f2102bc 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
@@ -44,7 +44,8 @@ function trigger_reactivation() {
 	# Restore MACs
 	ip netns exec "${NAMESPACE}" ip link set "${DSTIF}" \
 		address "${SAVED_DSTMAC}"
-	if [ "${BINDMODE}" == "mac" ]; then
+	if [ "${BINDMODE}" == "mac" ] &&
+		[ "$(mac_get "${SRCIF}")" != "${SAVED_SRCMAC}" ]; then
 		ip link set dev "${SRCIF}" down
 		ip link set dev "${SRCIF}" address "${SAVED_SRCMAC}"
 		# Rename device in order to trigger target resume, as initial

---
base-commit: 1cd23ca80784223fa2204e16203f754da4e821f8
change-id: 20260710-netcons-mac-reload-f6f5e86f9e1f

Best regards,
--  
Andre Carvalho <asantostc@gmail.com>

