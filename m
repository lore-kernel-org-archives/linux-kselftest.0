Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2D234984
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 00:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770685184; cv=none; b=ils+zQGsQ2HGTp7AKGoU3hVvVCMfKe0gZD+MWDcSMEJQKNEmWtsUqaE/ZMict55BRtk8ysJQWzFWZwn7fbe2dEXKdpDJLBeg3rmxeyRxFdCcVB2LqLKnBiUSYTh5FEMnRYhjqmTlI5ZoalpF26onLlyNg2OECzzWqgFTQeR3vjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770685184; c=relaxed/simple;
	bh=rX1FE3i5slVrCvxi5yfMhbxhuZWwNhm0BeNvs15Cr7w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TtjQJ+mUvl3aH6N3dgvfkt1FE0CLQSw16MpHob1OefDqw6QnBOv/SDWakF0OGmZzURPa6angG04XzKE3zqLsgKT+dMPNuOWksbmt/gMV/E4dVi36rLFT5aLj+fEHeiYKwS3wTG/bsloP+A2hSZ9+PyZeDMYuv2eLaJe78B9c7hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--treapking.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x8iaGZIV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--treapking.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x8iaGZIV"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35301003062so9890861a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770685182; x=1771289982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kCxe4KUTZpsszSXX1fJw0CECWXD0bnRktmIBoClkf/A=;
        b=x8iaGZIV4VxBFHR7dBfutt/274STYH875f5oT5G76dr6DcOaNvlRHfINoq7jkoBOHI
         12QoH/t3nMK7x+ubS0uhCTbTtcuxPYVRgLf2p7sOT7IkUpfN513061nj+Hy6hMuo/IDc
         fBKKL4ZRXdsfgEJsmYVDMLsawwz0SBqs+BqTZeU5XF8y9yqRlOOs7YtT+6fju3S7kyiC
         cYttb/nVx0NGA03s0WEu2PhMB0xvY8GCFEhGTleY62SWsWJ7FNxWUCjhWZ3E9YI1CdRy
         hwLacnoDkGhjJjglSlkUP39DKxveQIs5inf8joHNl4a2CoaFicDxZACToOvXi9DfIMVQ
         6rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770685182; x=1771289982;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kCxe4KUTZpsszSXX1fJw0CECWXD0bnRktmIBoClkf/A=;
        b=L0ZyCL/ANp+hybuyDgGarW83nJFEosY3PGeZmRcgsxynqwSi35dpHRwLq6TkipYldg
         44DJl4o+ad/O9iu4CEVdR8EEwBMSJQRsetSKqmCEwXS0wrOmW0/Y4Hin/eKX8jkyTZXk
         yzEKvDJsZyHUhg/vTETtOF3+MfaCa64DVzeKCdyJLkUfgP67jKvFd78PRtvN5ZST6NQV
         218+QbD13ou207j4IOZXgIl4PXUuAFoqx8FLO1OdDm6PzOh3672SQWzwLM0vFDGBVmyc
         sUXYfs1tOkd9ezVLuHrEJJUaKveXsQogcxiiphqXwnDW3qXrqV7YeSB+16txKJKrJjOK
         HL5g==
X-Gm-Message-State: AOJu0Ywh5RnArof5KZWcnZ8cIVDHEl28XnybSgdxfqWHqW9vkZNXbBiA
	24tAwBpSsU6VqUWXlwYJs0ZlDyRReLRokZK5cDUtgRnug/FHr/z8PBRaA+rVLAFWcsr2cjCfKzF
	uCtlLMrSvIGLA806Q1w==
X-Received: from pjbgj1.prod.google.com ([2002:a17:90b:1081:b0:352:e5f6:780a])
 (user=treapking job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5546:b0:356:3cfd:3ee1 with SMTP id 98e67ed59e1d1-3563cfd4172mr4606434a91.23.1770685182177;
 Mon, 09 Feb 2026 16:59:42 -0800 (PST)
Date: Mon,  9 Feb 2026 16:59:36 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260210005939.3230550-1-treapking@google.com>
Subject: [PATCH net] selftests: netconsole: Increase port listening timeout
From: Pin-yen Lin <treapking@google.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pin-yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"

wait_for_port() can wait up to 2 seconds with the sleep and the polling
in wait_local_port_listen() combined. So, in netcons_basic.sh, the socat
process could die before the test writes to the netconsole.

Increase the timeout to 3 seconds to make netcons_basic.sh pass
consistently.

Fixes: 3dc6c76391cb ("selftests: net: Add IPv6 support to netconsole basic tests")
Signed-off-by: Pin-yen Lin <treapking@google.com>
---

 tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh b/tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
index ae8abff4be40..64d3941576d5 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
@@ -247,8 +247,8 @@ function listen_port_and_save_to() {
 		SOCAT_MODE="UDP6-LISTEN"
 	fi
 
-	# Just wait for 2 seconds
-	timeout 2 ip netns exec "${NAMESPACE}" \
+	# Just wait for 3 seconds
+	timeout 3 ip netns exec "${NAMESPACE}" \
 		socat "${SOCAT_MODE}":"${PORT}",fork "${OUTPUT}" 2> /dev/null
 }
 
-- 
2.53.0.273.g2a3d683680-goog

base-commit: 6d2f142b1e4b203387a92519d9d2e34752a79dbb
branch: net-upstream
