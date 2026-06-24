Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47363B0AE1
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309549; cv=none; b=UkqkUdC02lAEevb6TlncxpsHB29XKD/5BXeJZam1p8DyZk15tbD1DFfxiVNnWzY+ptTs6QC93Odf10ba1mpSfJ5W1psehTkztaA+1pRelE8Rp40kCoRq9t28Hox0X7H3v9ac5lX9Ve8Vk8ZtRNhadEYcesNZg4CkMFArhHq8ps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309549; c=relaxed/simple;
	bh=jLHVNY6cQEgKL3Q7WFwqzYEQ72tquerqepTpM8X9NFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVQlDBssaqhlKfTkmSwNWJX7RtTuie1yAoMDe7DhqGd7KFfkrnwr6cyn5YtQP0s3x0kuwT2fNEwXXgU41+Q5LP0CY2Epp0bXdTdNRUT8n3BEqZfRV4XxKgRG1xCtxx+xkCjmYNJlTdvRmJlz8QX0YDvgEAeBwm1DT8u7219TLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtPmQPIA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtPmQPIA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8084045e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309546; x=1782914346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ke4xsnfQvAtj9HUGdRHxC0rQqe0tdop+3YHmyiDVwDY=;
        b=BtPmQPIAdMiU0GA4mRA5grwqXptR6kXOHRDahxG3rnTyXIRRHN6dqPx7pnTnQqjRs9
         IybfJKG++3yQn19zhAOFdu6BBaOP9RQkj/7Sx1jI9M92O8f8biP10UAzK+adSKAT+mgT
         zZgggYo8pnrFzUFif16yo+05Uis7ufmKfCfQkNddaEFACzkayUsVZvocMsIfoNJjurtm
         rOR8tdbJ6bEOTC5UCuucFHXNCT17eb9syJpTW4KeTsOvSV40esplm6pEPeyNWDm6befQ
         0d6Wo1U6pBGhvicAY+g9e2qSFcolquIQXmHRhEnjEy6Zp7/bFFlZFAJZP2OxszIsviDg
         aFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309546; x=1782914346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ke4xsnfQvAtj9HUGdRHxC0rQqe0tdop+3YHmyiDVwDY=;
        b=Mt2H3Fab9dbPOCB5Wpw+s8BNxOn4j591mMnMlgk49tuAkV+pofkYg+mDZM1LSkpePA
         GVlvVFmy9YT8D6mkcvLV+MUpcB6zmNn2N/1abWCuM6tZjZ7Eg2gcq5SdZi8qaYJ2lBZb
         CHDhJ+Jf/RSKUQYTUobvMrw81tds/vV8ZW0KyT6z05KceZ1UyyeJcsISSwyxyIpxd+Kq
         4OAky58UiKDta38Hm9DZxEVcxXDzoTS3krVEXyBjCEgt87r3RvJWeL2MHZf2VajJPhDb
         2QVvaSi71uCFwjnQ9zyeZs6rcOPJ6OLTadJh8WdCe7cdcYrb8a3RGFk3ejrA6VKlPhOm
         bNEg==
X-Forwarded-Encrypted: i=1; AFNElJ+a3oyxFHQQlTwJ19WO2ojoWx3kc8tZvbs8yKaX+OOEA2ObcDxKXnbfd+PkctbJpQdLZstERjEPuENqmSn8hZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUiZI2yKoCq3r64H3kZ/+QpLIFH99A9MAQFkP0H7tGU5YJMZ6
	rGYipKKg9XSW7WRWgjiB48/X+cS61D/SFmDRA0YuzLl1XGjSvxVrF5Rj
X-Gm-Gg: AfdE7clLXyyzE1av+DTpQorGAo51SVeEPEp8eMhcB+3OWBfy9yZp2a5j7Life3CR+53
	aL35683cjm6LnuP1YX+nlgbJvcx3BJZmMfv1C1+XON5h+jlapv3X71LpZVboLKqYE/RslxIvmII
	LOYSx6RouMNwjl0B9LvPJZn5UCwDtRTf/vUskYgNA58JMKvySTS+jbQ8CR+9cOlaWrzsRjqYxYT
	30rxD8xBAootWpLoO7C6MjCn0uztQTQSua9UzO/gc8WdcNFV7Ms4UHJWq/4GR7nUCz5IQmSgtFS
	ISM3Z+BRTI21k9QWhFBvLxJLzJYTIyT07oSGoZq4anQHlidW6OwuTDhWmEkXlPHz5N2eF/axwYh
	8x/XCDfeJexcyVbpp2u5aHoxbqJ1P8S4ZnmAEUjvcc+X76QOc9f/pT1yGlplf/kao44QImyg/ZF
	ajnmMj71/A8cg1+6uA47c6KGs=
X-Received: by 2002:a05:600c:83c5:b0:492:3fc4:bd6b with SMTP id 5b1f17b1804b1-4925b34eab6mr121375675e9.7.1782309545981;
        Wed, 24 Jun 2026 06:59:05 -0700 (PDT)
Received: from beast.lan ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93eesm6734311f8f.20.2026.06.24.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:59:05 -0700 (PDT)
From: Boris Shtrasman <borissh1983@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-api@vger.kernel.org,
	Boris Shtrasman <borissh1983@gmail.com>
Subject: [PATCH v2 2/2] power: supply: sbs-battery: Add PbAc, NiZn, RAM, and ZnAr support
Date: Wed, 24 Jun 2026 16:57:18 +0300
Message-ID: <20260624135718.286771-3-borissh1983@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624135718.286771-1-borissh1983@gmail.com>
References: <20260624135718.286771-1-borissh1983@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for PbAc, NiZn, RAM, and ZnAr chemistries as defined in the
Smart Battery Data Specification v1.1 (Section 5.1.30 DeviceChemistry).

Currently, the sbs-battery driver only handles LION, LiP, NiCd and NiMH.
The Smart Battery specification defines 8 possible values:
 - Lead Acid (PbAc)
 - Lithium Ion (LION)
 - Nickel Cadmium (NiCd)
 - Nickel Metal Hydride (NiMH)
 - Nickel Zinc (NiZn)
 - Rechargeable Alkaline-Manganese (RAM)
 - Zinc Air (ZnAr)
 - Lithium Polymer (LiP)

Link: https://sbs-forum.org/specs/sbdat110.pdf
Signed-off-by: Boris Shtrasman <borissh1983@gmail.com>
---
 drivers/power/supply/sbs-battery.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sbs-battery.c
index 43c48196c167..42a941e99155 100644
--- a/drivers/power/supply/sbs-battery.c
+++ b/drivers/power/supply/sbs-battery.c
@@ -860,6 +860,14 @@ static int sbs_get_chemistry(struct sbs_info *chip,
 		chip->technology = POWER_SUPPLY_TECHNOLOGY_NiCd;
 	else if (!strncasecmp(chemistry, "NiMH", 4))
 		chip->technology = POWER_SUPPLY_TECHNOLOGY_NiMH;
+	else if (!strncasecmp(chemistry, "PbAc", 4))
+		chip->technology = POWER_SUPPLY_TECHNOLOGY_PbAc;
+	else if (!strncasecmp(chemistry, "NiZn", 4))
+		chip->technology = POWER_SUPPLY_TECHNOLOGY_NiZn;
+	else if (!strncasecmp(chemistry, "RAM", 3))
+		chip->technology = POWER_SUPPLY_TECHNOLOGY_RAM;
+	else if (!strncasecmp(chemistry, "ZnAr", 4))
+		chip->technology = POWER_SUPPLY_TECHNOLOGY_ZnAr;
 	else
 		chip->technology = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
 
-- 
2.47.3

