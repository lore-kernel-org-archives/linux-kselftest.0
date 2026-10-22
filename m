Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692033;
	b=zp+JGh1zWzxbS5yv8Xeml1/cIqENpqHs65V3cy9i+9JlltpQ4AE1sDzw8LAg/e3eNZIM
	 VO485IgdnRlQjf2lfPCFhWc65c8oZhA6EeOAumbP8Wjscb6K37QpYaashGZV7Vud09rOF
	 UhrpI9n1t/LgjlTIvjO3FUrQXa/itn3PXw/vcdyV4XYQqVJccyCQ6FRLv4IKtqUSVwAmO
	 w4JxLQa0jHWDYQitn/nQy90meHSx0iogPv3OSy4pVUKeZSVh6Lc1EiNPXP2Zf7NFAACjn
	 xxn3ZwW/8T+UsFFnqOJZq75oGPhci5Twib20bdicC4MxlvGrzAcjtZRfD7nJ4wxCyCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692033;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
	b=Ongh6CZK7HzmwbmOrsEsv3Cy9aHfWd8MWmQ5VCyX2kyWGXaNv+zj/2hqQt3pStQ2U0Gn
	 aBKqZxZ4Q+sH45g1xS6stE8D4xyqjrg7ZeRKSjs1C4kdOySkSlKhfJPuToJsFTu0yStoL
	 Tg9sYMitzM+3ms9nOb3UwcgSaDWGrRGT3gi2FDb5w6PvciD8wi3rt/Yar0g3isTmwwhf2
	 7qa2RJ8HRSZdT1w9dlTMkoWKjVl7Ct13GwkhR3C1iAE35TUblEMinUIqjKI0PISk57W34
	 ouLySA3Ug2TXSmDK8tszYBz+KjmetheuRMjsyAvVpXtVTP5jhrx/gXmVvapvYDl7ftQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCBHNZ1z;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B4606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 18:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCBHNZ1z
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eafb65e169so107192e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692032; x=1793296832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
        b=VVhrMAbtbtgNeXS01v/bej4yxhvguYsWnm3Qpn1oxeRW+nNlv456CaF55CoztXjmeX
         ntWdeoY6UNOzjEgCkjYfjb0qjCRYhATeN7RDKen6YcHgrN39U8WPiWkGuTm+qdQoBV5Q
         qAieqLyxqBK01ZwjM5IjlwvQ04QC8CQvkWxDJsVtTw7CpFUzmC00YigUEHXnhywC4TD8
         /JqBnsqae+U7TQvAmaKhKeatvbG1T+5vY1mn/IIsJbHdUKuJwfse9OUbXWGHEdLLuo/n
         eiDXkOfHJlv0TjW82dmzM9832+mlTIWc0ZLasgTA5XyXFiheC1Je0AGylICfC+1qF852
         E8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1520bbSQWa//UDmvx+bojGROzIvn7xRraZk+7xfhQLmMsSjHh64bvckht7FtCs+w9dzVJ9Ra7AvlqUwqUD4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIimU9XwrlX8NmwvIXuPV8LSH2W7H8sVyh19FRk+qPpPWE8kg8B
	U/oTrvl+YBoD34dQJqUBsJStSOW7Xc8u8xJt/tehEoTz6xbENkSmYWnLKXil2pyly2FuY4RdJpz
	gvhKP9QI4MOHHfkylZonjUfHDG2Bry8FyFtL+NVycXq3WDvRvVQjmfrMM7x78F+1SeYDmQIQKX1
	27xBLyfl2o6aRr1Oyz95/5NCHefWzyBk2aeSb2nSY5Nu3Esjr4atkzUKsQkpskQFPQMEQkfjVMt
	yRYqSgc+shT/fpzf6cqn7zkjKbc
X-Gm-Gg: AYBFou3eWL93P+MuVz4hGWtnElowsgyQpi+QulcMX2+UXBwMDPj52HamaXBtCd5swz4
	stqesS0wbMGc5XxtqECtgAoNmzsKkQpQBhjAIMTIEm6GiZS3OyjFP9skQNLKzaLsKN06TXVRTes
	tbuuMfZxHqVcNq4PeVB7ow8/17fnHuQ7dGsLb8GHeqe/ddRNmuQ4vcTYiQcG3ZtfYG+OOAJ5O6j
	l/2Ggcjnu6tQOytwoQZfD2+d8trdVCI8wijgKSFgc2Z9e8MVXPi88Jq0yyIBPmUo8DdTxNIpv1L
	2SUUgMbnXkUyVC8lbNYvNNUMIk9dvDbxbM72M4oeYtC1fnXftPoZl9Xtp4vtarVj09jrqYm3dwJ
	rHLfT+hzKkxs+uJch3CWpgBGreFe7nqJte6RjNi++8a7aFows14UnANOs8eQRwvH9Wv4RwooLfx
	lweAIRCzeSUk0UZmaowGIs0G97EuDKMSazeW6hXKcfOaI=
X-Received: by 2002:a05:6102:c15:b0:7c1:94eb:d72b with SMTP id ada2fe7eead31-7ccc333f1dbmr96349137.34.1792692031708;
        Thu, 22 Oct 2026 11:00:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7ccc1c6c457sm4338137.0.2026.10.22.11.00.31
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:00:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b09ee23de2so2251557b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792692031; x=1793296831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
        b=aCBHNZ1zQwzFXz03A8JO9R1IyFq8Yaqo+dbxxxTSeXSBkUK6Zy/NIIwctdFHp/sg6Z
         ce9G1SCcfcQIlFE01rOZHTkLQg0cWZf2kg138KR701DGpqMa1a5BchjH0PLEJ7QD9B59
         vvf/xAY/4ySe/JRQvQcvlW8zmtqEyRtKo1bWA=
X-Forwarded-Encrypted: i=1; AKwUvByJgLngl2dRS779mkN/i241AdBtHCppbd01r9YGwRY0kIx8mCF2ndQu4bBYz7XAC86zVuuKaZpZ3D7EhPyw6gs=@vger.kernel.org
X-Received: by 2002:a05:690c:2604:b0:8b0:dca9:8fc8 with SMTP id 00721157ae682-8b134089d4cmr31279897b3.92.1792692030621;
        Thu, 22 Oct 2026 11:00:30 -0700 (PDT)
X-Received: by 2002:a05:690c:2604:b0:8b0:dca9:8fc8 with SMTP id 00721157ae682-8b134089d4cmr31279647b3.92.1792692029727;
        Thu, 22 Oct 2026 11:00:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b156107beesm1968187b3.16.2026.10.22.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:00:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
	Niklas Cassel <cassel@kernel.org>,
	Aman Gupta <aman1.gupta@samsung.com>,
	linux-pci@vger.kernel.org (open list:PCI ENDPOINT SUBSYSTEM),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH] selftests: pci_endpoint: Do not link with pthread
Date: Thu, 22 Oct 2026 11:00:21 -0700
Message-ID: <20261022180022.1282641-1-florian.fainelli@broadcom.com>
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

This tool does not make use of POSIX threads there is no need to link
with libpthread as a result.

Fixes: 392188bb0f6e ("selftests: pci_endpoint: Migrate to Kselftest framework")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 tools/testing/selftests/pci_endpoint/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pci_endpoint/Makefile b/tools/testing/selftests/pci_endpoint/Makefile
index bf21ebf20b4a..b4ddfc52e79d 100644
--- a/tools/testing/selftests/pci_endpoint/Makefile
+++ b/tools/testing/selftests/pci_endpoint/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -O2 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
-LDFLAGS += -lrt -lpthread -lm
+LDFLAGS += -lrt -lm
 
 TEST_GEN_PROGS = pci_endpoint_test
 
-- 
2.53.0

