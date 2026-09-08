Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95F55D88F
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876253; cv=none; b=KJ8lIANl4w4xyvdIDf7HPBq5HJuKxWdZxLdG1CmT8AChXKJd3T4ngxUYhGbnP+PjUdfR6FqjssKP3GJrEIgl1bwxVqawsfkC09xbFl8Nlpo6ZW/HMJDDFgKcfFdxUGO87rImZSd8FW0wCSBpEbyvM7/lna2q3CU4ExktRw0dz1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876253; c=relaxed/simple;
	bh=T6U9OLyO1XxLOwAi7oui+xs/MXoNt7l8Uqjk+PGlDXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkLYbMG8TcOdXXkPW4mRACXTJe44cnwue+ivj7bCIHLwWJoqzX7zwsVB2c4ii2/ohfEZfyH+dpYEICYrRFrP0kpbFGj4o8BehUJOlxZcMgMOaqo+QWQ2z3D4DhsdQf3OxK0EQEsKItvsJLBguDiKKBGnruF98c6HU5WP7wz9T98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ka4YtA/5; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ka4YtA/5"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0CA553F427
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788876240;
	bh=oZW+3HacXHXxgA1Yfz0voc7XtCtL4kOFjCa7sts9YXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ka4YtA/5hiT+igL0IZ85skVlSPrIjL6vggeBDxeHmNUjxjYBUzQEK4CxbvYbpocY3
	 Jhr7XxpoqxsPb1jBT9OESdah6tn+tNVKHSaAiLITlol6U1iiE6xnz5ilmOw/oR2gGI
	 6camIH6UEn++C89ZYnNwWxk7316a8dY8MiEZ70CIzEA3jvUsQLZXQB7yWMISYxUWFj
	 QLhoU7rhlQ5kRQR2So/46poK1rJPjCOU+H1G5hJ+x0UXMW31EdDm10CPnUIXlMZwve
	 9Dp0NjUSuprD0jrJ4iUCvEB/FPHZGqzdA4T1nSrtjYSOTImm+wVpl9EHwenygn7Eg/
	 t1hs9txFKjcskk/K7i0g77qt316MCk+oIyu3D6MPBd8/4DZ/y4TgrJtCMlmXYeIa06
	 zu9jmTJCwJb18rhDY227yPKz7QyrTA/qTf3zZTpGcKqVkcIVmcBLtP/dlXJix5uPZR
	 +M3M4R07JZcdvuMN9RTYLSn0S2ipWXRQ/KY29AoZe/Fftc4uH1P4z51JQhWhh/b7OE
	 s3k4th14CVGXdDEj4VhNZ/DhrIeY9a1PCMJoOoRjlGe8/bLkoswmdw8qMx9DvsEeEd
	 UbMgAXh5ltAV2aMRpds4qPILQWWnAUnkGwP4EqLtOup8Cm6HRPL/j2CrX/WT3Elg+L
	 EvvRSmHMw4qAWENhM6b+iY64=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso314020266b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 07:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876238; x=1789481038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZW+3HacXHXxgA1Yfz0voc7XtCtL4kOFjCa7sts9YXQ=;
        b=n4TNK9WOfmHxvDk4DE1Goee0kU6n47uglqFjUdLrlOPfeau055FVE5XmXFWc4TeB9Z
         1e9VSUxRLRpd1bpK19UKNddH81wEgieGOI7Qmv2ItkGdNxCsZyf4YPJN5rp/91yumRzl
         T3jfcVZ/X8tCPmCaxr5HexTZZLN/X2XVlb0thHNbRKHKEvKRS+ZuKJGL19Xe9eE9ER45
         CL2nR+CgKdH4zggF6ad7+xbiie7yqP7TVEamVUHp2mO+w3Iqe//QexGh8tTfNyE0E3KS
         npa+lPtilkIupCfSn9a9+snjf0q7Z3B9kHIHx9QcAIyYCjB6/zD2ZLKLArci6MpwY4IT
         mklg==
X-Forwarded-Encrypted: i=1; AKwUvByxPgv2mLPy9S8aRQkXxewQMbT7xg7kmR98cHr2BGFLKegxAhljMU9B3rSN8jFREBIWsCY00oVHSFLryFrpZrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lUJh21H1MjsYRbOxQz1ve8jjWNJ0e5L0QNPWHR+bpaVPYTzWH3
	bSvr4JJV64nrxcQ/fUK/rgc8OCdh5w+ncamzu423YFo79LpjdLRUymN6vMarCHUUh6RdzDG/TbM
	8EStFZ7dlQ6d5FXYUT8p9Auz67BqTC81oZpQnTzn8Xb3gI7anMkb10XBbggy7WN/AU8F8M1VXDL
	7mxSAkpLnE3g==
X-Gm-Gg: AYBFou1pDftyY6GZXJ8a8zeXr/LjdKBk3Hk4WWB46HnB1RmzzT6k9aW2mPLPCjQ7kuD
	ovPAWEnXZRNFYRUDrqOZ1x6t9mlXrSyNq/L5Sql8R5JOLaLhQo88oXc3NzQYex5Cx7xfUfP5JZr
	3Azo3m8rA43sj7ql9dAxrvysbJhVfLvWxJ9R1mT7oN3I/41VOotGUhqQrUFT22oNVeqwwlmC0/q
	kedaBp62sYzujl684QqiLIH6R38NF+Uj5SejUM6GP2irKl/Ez8vubuc0ddmhld4e/2C2WV+3/Pp
	ug8oHtkPNUu3vdXRMyiBPDeXwyyjs9j6ztwvsN0hbzngFMxib+3mxwGbDhL92RMSgz84ellhk4j
	XdU+WQPO0xu22jyqtUVvV6sBarH2XztY4OXo4wTZjn/wE3ZNIQJHrsYNr14F3iEztbQ==
X-Received: by 2002:a17:907:d23:b0:c26:19de:9ae6 with SMTP id a640c23a62f3a-c2619dea7c4mr931872966b.37.1788876238290;
        Tue, 08 Sep 2026 07:03:58 -0700 (PDT)
X-Received: by 2002:a17:907:d23:b0:c26:19de:9ae6 with SMTP id a640c23a62f3a-c2619dea7c4mr931869866b.37.1788876237770;
        Tue, 08 Sep 2026 07:03:57 -0700 (PDT)
Received: from localhost ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm631394566b.6.2026.09.08.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:03:56 -0700 (PDT)
From: Andrei Gherzan <andrei.gherzan@canonical.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Andrei Gherzan <andrei.gherzan@canonical.com>
Subject: [PATCH net 2/2] selftests: rtnetlink: update ipsec_offload expected output
Date: Tue,  8 Sep 2026 15:03:25 +0100
Message-ID: <20260908140325.13367-3-andrei.gherzan@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908140325.13367-1-andrei.gherzan@canonical.com>
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch ("netdevsim: print IPsec salt/key in network byte
order") makes the netdevsim IPsec debugfs file print salt/key in
network byte order on every host, instead of host CPU byte order.

Update the expected output of kci_test_ipsec_offload() to match: the
values change from the little-endian-only representation to the new,
endianness-independent one. No other changes are needed since the
output is now the same on every architecture.

This depends on the previous driver patch: applied on its own, this
change would regress the test on little-endian hosts (which still
print the old host-order value), though it happens to have no effect
on big-endian hosts (whose old host-order output already matched).

Fixes: 2766a11161cc ("selftests: rtnetlink: add ipsec offload API test")
Reported-by: Kleber Sacilotto de Souza <kleber.souza@canonical.com>
Link: https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@canonical.com/
Signed-off-by: Andrei Gherzan <andrei.gherzan@canonical.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index ace3a99023ed0..4843d474538f4 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -932,11 +932,11 @@ kci_test_ipsec_offload()
 	run_cmd diff $sysfsf - << EOF
 SA count=2 tx=3
 sa[0] tx ipaddr=$dstip
-sa[0]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
-sa[0]    key=0x34333231 38373635 32313039 36353433
+sa[0]    spi=0x00000009 proto=0x32 salt=0x64636261 crypt=1
+sa[0]    key=0x31323334 35363738 39303132 33343536
 sa[1] rx ipaddr=$srcip
-sa[1]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
-sa[1]    key=0x34333231 38373635 32313039 36353433
+sa[1]    spi=0x00000009 proto=0x32 salt=0x64636261 crypt=1
+sa[1]    key=0x31323334 35363738 39303132 33343536
 EOF
 	if [ $? -ne 0 ] ; then
 		end_test "FAIL: ipsec_offload incorrect driver data"
-- 
2.43.0

