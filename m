Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709198;
	b=ujzQYVaYKvK/ErLgSAwtq9RCc7+MC55pf2Cn5s4r1ISMsulLiLHGvFFFvLiVyhDLspUq
	 EAhN5nZItGhn7FjwGqXp/hEeKq3sxdGac5gZg1eO2TipGXnMTteG8MQaWs3+UsviHVOvP
	 gG5lKnqyFAEPymmkRLnsLTvxpg4GzGkZxXRwSaFATiWFyaYlN9p3L8Qk74rU6EkncsV5S
	 9cY4nEkxYkmZUWCUKOhWGRmD+/JwIlLjpd6j0xUvCLoZ9YL9v+CmesoeiYAoiDHvVvg1I
	 5ShJcMIe4uHn0cqE8qKFjGwqaB1jv2A4mag/2f1tWvuFzyM1bbBVOgqqVqsfTztQs+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
	b=JRO6oFL1CrmdoKfII7Wn/T5NSHoiSBL7z0H1NikTxNTK1SYS+wHhb4Gh5IH5CGgoLwCm
	 qD2Ra6gg0edeYdLiJZlci/ub71OlVBo8TzF8pg/wtA/CM6ogAkdkLXhKP/MNaHLmU6E4Z
	 GtlOumGDAkG3QMp4SRv/dc6NO9yl6mKGvnvTE+VSifkYKm2IdAPYU0BXhrXYbS4ff9XJD
	 YjPGyJA0Z0gk1ZPxUkQY8MxLUJgUJbQF4r+Y2Hvaw+8Y5E7zV1OaqyjGsWIkihlUnHk7G
	 8KSNMtgjLLNjAwQoqGPhoKihqDRfNeKmS94IXjojh2THVTRw7yew2v52kzFPO9YjC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvh0mr3r;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E43606A329
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 16:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E43606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvh0mr3r
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385c497bf94so5849159eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 08:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709197; x=1796313997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
        b=qvh0mr3rDqqpVnveocsKUzUNI6NI5TxhPFvsGkKIcmh18I6LftHdeDNtLUtzdxKG7y
         AEH9uo+jHCsDZlrqB8fui/gCIJtnleS1hvgm8t7iQ09l7lSR/Q6orx54eB9tZk7MOyXm
         yxvXc24KTE/IbseWBrNHHC9QVAxCM+9yroQINIJk939J0PAAvMdtrUSLmN3bk6suGMwT
         uFjCcDc5Tyx91ETQpk0ZJS79V3bVyadWEzelyBLbG3/wMz910Hm2QVlyhXzOndWfyEBF
         xrwuFZq+QI3IbhgsNr29XzF5ctO2CETkziu0rgcYiPnQ8sZkK908goG65he6IjF/fVdH
         FBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709197; x=1796313997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
        b=QrzWX/JuL7zvvDGIkOjcPhsWsW/i5JUjkJEGIX2yzql8VNmchgldiO08EnBczHstvH
         5H95lSNqUnHHj9eATWv6gGTSG3YEKxXo6wqXVEPzrf3XgT8piX2lxeaM1lOQ5hcpRkZR
         evCQnzpfy78PF0/XX1+2vy3WJfKaLhdTpaQuklmATpQj0p59Di1dwLQUqqTIm9izLZyA
         g4t8xpG9G1iy9teRnNF5sX68J8l+/dwgOPjk4MsaY4P3dFBPf2HjB1KXPwIk/j824D2I
         8ydpfA5X6Gr3tK/PhRpzFsY7jqnGA1oygnoYmvpAKThJhAmmhptHo6hdy9K4jdj50sLJ
         n1eg==
X-Forwarded-Encrypted: i=1; AL+hErFOdqgB8oqyIiL/+Xh5Soovt7hafjd9d7JHX+cDI8Fc2yewpVVXBm4gwdlLG/xBMmPXjTIxiB1gH/ppB4ZQB9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LqU/jQOiviIfL2niGujg0plmVnZNToBx6x63PMSpEx3pESk1x
	KKwIlS+w33ZD6Xoux2ZiEhQGdGuzTDDQ3ui1JHh1PVIr+e3WnqhT72P3
X-Gm-Gg: AZFdTZeQxnh3ZpCIdALiGUjr8dQZ3FnedgjNUezvLS9b9YOlEG22hyQc+MtXxkYk8pp
	j8OCyyqms7X4WDsTumLIj8+n2/hufKG0d9KlEILc/g2SCTCkQ3ydqaiNe17q/txZM4A24Hhla6g
	8TsJflWdEA7dVBxaUfnq5m478wcCumgBrNVaEo0m/wmsgAfLRNnWReByWlLoPAGKMaoUqc0Bio3
	XlfzUaAWFa3uJIKibkjat4Y2Hsm7kLS0oIgT56/DRO50LssQLmM+IZlMN7FJLEFK9PYV66t6Y9F
	SuPwNp/PjkimFCFxkG8Ruej5se1/6fbJfQtI7w/k/TWmjsk5IcetSW2g0a17y8KzsqzA2rKFHW0
	CUY7TwUzGeYkblHHp71BOWdlYYP5We/jsczep7Zg16uXReZUnnd11kzRq492sCS43dpnt9G9fg+
	T8PR1u0FEhnxNg36ZF4Ka04LoYO4cTUba6c2plLaPTWUcppVF7216exjQ7Dtf99hNfzgOzryh0s
	C7w0stzYFaQPbbv33o8JWWyn/o3epZ/mxOEKkrZDFTqMRUZBvPzMtC3HxxbglhIiTvkpiRqQ+mM
	WhQq3kSSlWJCvhFYQ2dGmFY1SQVY0QpQU0seBodgRIsbYnpBqlWc8nvk28Lptd1bOnc3Y8fOQ5t
	+z4mjRSH+B5bqo35IzA==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr12735002eec.40.1795709196765;
        Thu, 26 Nov 2026 08:06:36 -0800 (PST)
Received: from arch.srmap.univ ([103.217.237.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm62904914eec.15.2026.11.26.08.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:06:36 -0800 (PST)
From: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
To: brendan.higgins@linux.dev,
	david@davidgow.net,
	raemoar63@gmail.com
Cc: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kunit: tool: remove unused JUnit imports
Date: Thu, 26 Nov 2026 21:28:56 +0530
Message-ID: <20261126160122.35088-1-jahanzaibashraf1318@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The JUnit output implementation uses ElementTree directly, so the
xml.sax.saxutils imports are unused. Remove them.

Signed-off-by: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
Reviewed-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/kunit_junit.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 3622070358e7..b76748947d65 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -4,7 +4,6 @@
 #
 # Copyright (C) 2026, Google LLC and David Gow.
 
-from xml.sax.saxutils import quoteattr, XMLGenerator
 import xml.etree.ElementTree as ET
 from kunit_parser import Test, TestStatus
 from typing import Optional
-- 
2.56.1

