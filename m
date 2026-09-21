Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD748F841
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035203; cv=none; b=AV/3WJIV0bbPrzWhVyAJjrSZprVArMeSMyzeVe4bguGONX/gQ0YeKS5cWfHAm9LgbEU2S5FLZe4AosHxKj9FZs67lW0pqn9mxuV3B0QJK7amJst8YJ9q68hKTzIPunlX3VeCmQAgDNm9ABiSYiRGX4LxfnDojAKU+QuCE7UGk5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035203; c=relaxed/simple;
	bh=J8Mf3HYZaTmZYQFkYELALEytTws8uvz/goY09yFk2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+efMPM7hAbWZjqVwE+xWCuliLfai5RVzuznH2k+GjLK/K93t8lgbQ+WJRk1ePhA6yDxP6mwKSQJUo02UfabkYorBxa7EluADlN/MQ+PzXzaBF5M4oBOPgONm0bdfDKYQ9GvmpqxwBvjBWJOoVV/5oR9E0D/K9afDuwcsQQI2hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZeH802w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZeH802w"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd77300825so36240655ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035201; x=1790640001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=GZeH802wT7ZdEDiryypJYzjlclFsC85waUniUFFQtpKyQICaLHmzqfRUGdIqNgBvIv
         i0JexKwM0YGfy9UiOQhy4CNa2KjJYHJE4UdpVaMpAHZkqVq154369KpoQwPZoMi6N8HE
         zaJbW2tvmMjVcmSnBPVlH1r61nsPcmjhbsCsbYnzXjTovbG1OxSE+H++p/K7KoOjr5H+
         VEPAJOpkOamMxIsjZ5cemJLghkrf49ddZOPWG5vFm6SsfLI7D+UxZyvBUKCSGWmUiton
         miKRPdoLocdgM1QQLDMNzCWtTCWckmkeEb2P06TrZ49GisJdFAG1cZziE5p0mvtz9kRK
         VGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035201; x=1790640001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=JRsmP5AHENBvvZnWkPkyaw7PO8ngmKzzFo7GzGIrGp3xqYNe88Ld8fdkGphbmYmdew
         KxbL+2vlPkixXz6IZuAqkWpTUJL/SM+91+lCCMHeSfnHersGcFGiEnHRP+WS078o9vN1
         741hbNxHJyG26L3TIL1+mNCMCUgUp+gh+6Xn4lI037Ov9v/8Cd9Y0lMzENzyIdTaKbvH
         50toWGJ0NOdDxpGKSyJ8IzbU3lcMqPdk3Y103KgQhMVTs+i5Ja2fENIbNVpzknd8Bte1
         85mKdpjiLmNEpeU0m8YtPcWGRibFACVu8AOPtr8tfaNimE7palvW21UYYPUAwpj6A3eg
         jeow==
X-Forwarded-Encrypted: i=1; AKwUvByfqMxrjVi++zjh0v1bVOwIAEgjucIsisvcGXaqE20TFGCEBGMf7Qmzi/m80Hw4diZkAyOR30BYOVYcwBfOIgw=@vger.kernel.org
X-Gm-Message-State: AFuF++kGj4gCNRmWeL5wPbSD8RFqPIpjzCfTbe3f8d+krunL++fK28Z0
	UHaxQFSlKSnwbVfRBBjOGeNtFzBSWNVflWOZnEF6L4DMEfajiA7dOBuS
X-Gm-Gg: AYBFou2hRNFk6v17q1ntYuMuL5JuvERK+Ld3TuEYaxtEzHol4Y+o7k0H3YzHBkVtPxK
	ysW/mHVEMTqXhT1r7j0ttspZQwir184xxdhyUcxiKXeAdpQCf3PzO5zp+eC0fXcH50ese8srNCW
	SXcKFDAcYax9ANK8rqQ3CA5Bg7QVbXphcyEnJkeZ0PF55CZsWTom3sXWa1mUIqlh8o70uaRBeD+
	52/IXvZp6+XWy5GnviwBEmK/EzSwHae3gYwiYFzsnhzYhUpQuDemWQcZ65q+g2/hpFsUCeLypWV
	JGP6m8BEPL2So8LPgAQ+k5WDdxq018b+dfwKfqfnfzeLVKV2XuWvfwdRCD2D7SC8g9fnFdySutz
	iJIdqEAmv5Dv+uriBAo2m5N6vuz34/ASP0xssZaggtueeEoNV6KtNn4+Rb1KTfifckSt7w5/Df2
	Ckk04LP0KgI6UlPznUO32J2E7lL0Cs3LOZ2in3AthtVPaEaapkD0OROIPZiszyrbsEC+7gZ8B56
	dkfDjjZ4UEyzIEWnPQGF0Co77O5WLt095FW8xdNDssmnkwYmTK4b0D1DDzAJln1ZkCxLZ9hgSS7
	dA==
X-Received: by 2002:a17:903:2ad0:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2ddb1b78d1bmr200524995ad.18.1790035200778;
        Mon, 21 Sep 2026 17:00:00 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d045e78sm386135ad.51.2026.09.21.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:00:00 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Tue, 22 Sep 2026 08:59:48 +0900
Message-ID: <20260921235951.3214-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921235951.3214-1-sigefriedhyy@gmail.com>
References: <20260921235951.3214-1-sigefriedhyy@gmail.com>
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
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
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

