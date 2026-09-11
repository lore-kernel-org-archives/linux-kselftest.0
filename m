Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186A43F091
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123879; cv=none; b=KQDazgEWNTQ2C3ttk/cmSGmbMB1P0tcg4JyKKF10gcyRzA/dPKl8zGLWCR8MWdZ5Sc/p1zcLRmzIp0r6Bq4cZKb1pqSIJY57exLZAyKIo7ZfNhYgb+JI0ErRlM/oMJt2+7ahHVL7JQkNQhXPBT3CabRnfvbZzTfjAJEunPAA/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123879; c=relaxed/simple;
	bh=tUSiW1gzmcpR51eI+ftkT0cq87urkbDu1YspEiOmjAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyE7kNuKg3Ouh+nzAG/NHfrb3ngmEloHebiG1ycjgX1dd7/rzCx5jMYx37fUaJzNuOeFZi3Ut10Hyer7siJdcndNM6CBijWVwaxdvwcqdaWYlGZSZ8/ynVBaocnvutjpGmKFcdZ+SY3j6+Of4NmFNiRvQYMLJ3ZUU6PvxC6Jln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSvBVO/H; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSvBVO/H"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so108210a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123876; x=1789728676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dy3tPiCmSC6ac2E9SuBSByLfrAsVVo0KwKwuZ8yfA3I=;
        b=qSvBVO/HtLiTvZM1LsrL9FHKC9u5U9o7eW2GW28bNRhwyuBPPuDQAaE5DysJmMuSKO
         udal2XWtTqwFPTZ54T3NWcqIV+9MeBgE600oPPduQPauqxZuzsQy4Z5FXLuHAT67SJ/9
         1Sn7TrUvOKFK6FIPddGwsL8bbcyhvqvqkHMEwls8yjyY0F5e+XINsASLaq1GMppfXcvO
         Y0Ykjdrm4N5NRZSNzZHPqQI4WfYJAnP0wQ8uw/Er+FUZC//BjIolso+yR89fray3pmFA
         dXUn5Qjrf8sv+hEf7KCNC52xPndtwTB3nocHAN+vCt4GwowoAup3f8MOKxZsxWkgieZs
         AW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123876; x=1789728676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy3tPiCmSC6ac2E9SuBSByLfrAsVVo0KwKwuZ8yfA3I=;
        b=RVuovemrA+hvYOmgyDk1MXkqvR7Le2FRg49gdBa6nzwreH/FltE40i2xXW36cf8ge3
         yERdVjHzFUI8Wqajt96m/7I2OjfP4HVhhko5bf4SRO/dtokOy7pgtq1amVni0scocJnp
         xVs1c0iU4GuibwLQexoViqovbUXI2fkoQ9NXB4Cpzu+QJR7eppNhdtEnSuiqthY0EeK7
         71oP0TExa9+CvmjAioNnE5e0hJrJkdCNbNP5iAs37SqQMBt8jLFlJcf/m0fNaaEU1Mzr
         IXXOZkOIfm8vEYmpW0nKejt4RfkI4p1dfU210vPpPwLVhK7DFMIXLi1GA2xlBKURd4lX
         gm2w==
X-Forwarded-Encrypted: i=1; AKwUvByFZ6EbUFEern8BBFPj26b8i36z/1wyuoL2C05r5gKeL3Wb2Dh15uEkfwTlfyWNtNAUKFlHaCZpcFr6sTXkFCk=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Bqa/eLaw3ILxats35DtsRmwDDAu0fRjnoFRfoo3uRJU71ZI/
	I1L8/nM/Iu1JcrZFpZtINT7snasowrNmZoB/BW9SQzTr/4zzeo2ZbyWP
X-Gm-Gg: AYBFou29nPjMjrHDOI4DNyVIlxCBJc7x8SBf+T8Ds2prC7ibBf3VkWSaG17u3M0ruwx
	LYWvYGF7ofb035p6qZklwIyo4vnApFFfX/opeF8hhoWmH7wugxGcMMwesMNMPbQHalUCfxSkFXi
	QcdTpwZVXH3ptSca26JnesXDzlnbSsKbacegQ/rQARkYDyY0zvZkQs2GH2V1goxstkXl2/IHh/u
	rF48oCY7AMf9zFqTekabrojjmiY0JIInP5dJuXlwFUBmzxJNWlBxbnK91PrgebPAYZy3AnLv11o
	RVgh3NIiZu7DSocDUif5S/BLh9EbhUyVQSOMvINvBRD4Q5YwQHLiCh7amsRk9Ou7ugcnNcao45g
	6g43UDux1JPpleG9HALp97+KxWEtWr3gtMejvS37bYFJOznqBDQHSK27aIBAB1vt8DujeoIgQi0
	w8SNF+/wEKLiKxR7C+aKkPACt1XhGw5Bts23i5oKSayqMoq0m7A7JrQ0rXqkgQCl/w61LlLfDog
	SeMvvJ//BEkxMu1QqpuRygCrO71itQLWlVW0f7qoPq0LGOqWgTCUxa9+iZq4w==
X-Received: by 2002:a17:90b:578f:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39d97eea626mr3603449a91.4.1789123876272;
        Fri, 11 Sep 2026 03:51:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:f7e5:8b43:47c8:5245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm4876004a91.1.2026.09.11.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:51:15 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Fri, 11 Sep 2026 19:51:00 +0900
Message-ID: <20260911105103.7771-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911105103.7771-1-sigefriedhyy@gmail.com>
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..17ead2203451 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0

