Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE83DB964
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403660; cv=none; b=FA9G8MDVtBrlYCtz7GWeTmULoLGihip5ozQ4/lOU7KPfmV/VMgnEwKeu5On5AYWKdb0gZ35Fv2uxB3IDrfFCqBZqrcbAnJfViFt3OYGtcLFPh0sjWvmanKzdH/RdUtPGo+BefkR0qT0pNBOX0gXhHh8ldE3d99pjLGuWAfKDqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403660; c=relaxed/simple;
	bh=xROy1Y0XmFv89eTwsOqpRjwNw/zTYKT/R8hDR+t8O7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sk68gai5VEesSuiAPxkvDGQ9QQjq2digE1OeY8M1BsTH4mXPE+sLSX3BQweLtUiwZouFRW8w/hH80PAWddsYA2GuQrSRXuWT4EYjh+0T9s4F6+KpCZf9MxTjVvlYCf8pX+KQmUn+WktURL4tUz++TE/ZpF3gZaEp+toE4mNckhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6deDcJs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6deDcJs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so282215e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403658; x=1783008458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RukUpK2hqIlqtjKrnPXSEkZXvAhn4lqBD25H3vkwCjM=;
        b=r6deDcJsYLfWofk8JN/2eBR17YYgl4MGW8dmQM9DOuxxCIs938K+uDudi9fVNRYsq6
         f5yAqARTs3IZ2jsYM9D8nJZv5rglcRHeDkPPz0nmaYmC5zuJYteEit5B35UrvMSMMO0z
         qcPdCmQGChLO6FGQwJ4F7a8Q5tQZDxo76vbjIVvr3IxQvlJ02ofRpTJE2EbjcnGiy0De
         RZV9TbvYd2TwNkSfwrOCY8EHPHor3wSoz6JlQHspUStxUX6V80kvM4FJp5ZXL0A3tqxr
         A79tHLgGBKoaZQs2bHbRRhJ12SHhAUa75YuzPRcIXADEw57QTBGiGOR+dqse5o9K/tJM
         FktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403658; x=1783008458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RukUpK2hqIlqtjKrnPXSEkZXvAhn4lqBD25H3vkwCjM=;
        b=LCJdnPRsuB3Lko6Z1okcsQy2rE7wbDSTO+Tlj1MeQ3FoBjnVj1p0UGxsaDNlbfPKuk
         M/SlZyd2gVe++oGETsjG+FM2Ye9mvNJRmHjEz2/ogXwItA91coDP4NQ0Nv2BLsqBafKX
         +oR8OCqPX6a6agN1n68EtHrJi8xZ4ar73rzhUwfVU2KryqBfDzkoyQvSTUvdPbWX9IwF
         Cjt95vpmA6Qs9E1Q3FGV4VCJU3CzNrv/dxKEFO+oNALKa7E2487HAJu9nnSn0gyk9c+N
         6B9LBL0DT46uB8R/lu+2WP+/7Rdf+YXvO2JSyKZcrQTIUrZu4xchReRygKzEeuION+k/
         gP3w==
X-Forwarded-Encrypted: i=1; AFNElJ9t/oUgfmgs7/ekqwRlggJbGTayvawq7JvCuZzXEcbg7NMHaQNbLAIpoAZmyOn7Iufz5Bfg80mDIMb41yrgfxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0EQvgdRFK9xgrz4me6QUiP+Z2GWSDrslzb29UMQVjGHx3uvi
	51fMzD0MTgpvy/8ByZQUBDyGuPSpDGZO92GhG3K/6PD9ll3PJ5mpdqSL
X-Gm-Gg: AfdE7cm404z04Sxi3hsq2it+A+4F+Y4KpXZWHm2zryVqjbnQ+5kLzsfPr24aSYGNbW2
	/9wG0KtmsojWf2GgwVdsJ6wvXsotScIyO3NTlHI1lObWtxT0aVqggp4DM2aT3vllswUjH0VZayx
	pkh0A/sIy6LICMAYHSs9QEAw7eV8vIO+x85R1SzqPAk1Qp+RFDTal8LQ1jCm2XYhpW3arJTMIpD
	3brBjFPkQOA9DPpNwY7k8T7RkGxHPaz70hH6UFZ3YAq5e59Qs2wTuCV1w0R4i1AtNDZ3vQe7Edn
	uR34fURKCUNHpMHuJASvDn9eETiZU2y2VfGhlM7O/u+cHHcnz2voqPBi9bQDCNbmWVW24BRYgrF
	VoChG/f0RNzBWiq1biup9UbgAqT3UXb7i5aRj6JevnwDTu4wwg55cFGGx9njw08HB7ZeJjzSY9+
	RfdnnPdHDgDTv+
X-Received: by 2002:a05:600c:8b53:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-49266864977mr45557685e9.14.1782403657634;
        Thu, 25 Jun 2026 09:07:37 -0700 (PDT)
Received: from beast.lan ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fef710sm12844515e9.7.2026.06.25.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:07:37 -0700 (PDT)
From: Boris Shtrasman <borissh1983@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Shtrasman <borissh1983@gmail.com>
Subject: [PATCH v2 1/2] selftests: helpers: handle multi line in test_sysfs_prop_optional_list
Date: Thu, 25 Jun 2026 19:05:54 +0300
Message-ID: <20260625160556.54830-2-borissh1983@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625160556.54830-1-borissh1983@gmail.com>
References: <20260625160556.54830-1-borissh1983@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify test_sysfs_prop_optional_list to allow multi line parameters, in
order to comply with checkpatch output that limit line by 100 chars.

Allow use cases like:

test_sysfs_prop_optional_list \
        property_name "value1","value2","val3","very_long_option"\
        ,"extra_long_option" \
	,"even_more_data"

Signed-off-by: Boris Shtrasman <borissh1983@gmail.com>
---
 tools/testing/selftests/power_supply/helpers.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/power_supply/helpers.sh b/tools/testing/selftests/power_supply/helpers.sh
index 1ec90d7c9108..ff1175aeed72 100644
--- a/tools/testing/selftests/power_supply/helpers.sh
+++ b/tools/testing/selftests/power_supply/helpers.sh
@@ -108,7 +108,7 @@ test_sysfs_prop_optional_range() {
 
 test_sysfs_prop_optional_list() {
 	PROP=$1
-	LIST=$2
+	shift
 
 	TEST_NAME="$DEVNAME".sysfs."$PROP"
 
@@ -118,9 +118,9 @@ test_sysfs_prop_optional_list() {
 	valid=0
 
 	OLDIFS=$IFS
-	IFS=","
-	for item in $LIST; do
-		if [ "$DATA" = "$item" ]; then
+	IFS=",$IFS"
+	for item in $*; do
+		if [ "$item" ] && [ "$DATA" = "$item" ]; then
 			valid=1
 			break
 		fi
-- 
2.47.3

