Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13E3D25A6
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797597; cv=none; b=kK2NjjHB8dHX3/046KokDNXz7gyJyyEZWu19jtB7fwH0fE28/v3rNE67t7t3GbziwdrAcgQ9JM09EVMtjm06n75gkYYH9arYSfZqIIFXoRnG/3dSGluDK8/WYuPFNPQP0dZseFvaMB3nWdnLkFs3CpNsAMLUicsaRG1h0PFdVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797597; c=relaxed/simple;
	bh=ZiieCgvQr10bJWZl83vVIkp0x1RhpipuOsxCe6TWm10=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du+I9eXQsgphJv3vSBubTTzRZmHV7340yz0S4hh4RGW3Q6i8dv8BKrBffu6B362um5mg4hKtoWeK262gB4OeYhe7qEbm1cF6H4Wq3QwMAMTP30VuZ6q+Tj5e+cN4G0uWGSgBxqeM/jTty75LB+orFzYdgR87nXGHXPMfHtPRTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DWM+GPvU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DWM+GPvU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-514ae601e01so55079311cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797595; x=1779402395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNYZS3s0Ezy+RQHVqVYSzxTe1QiuBpPaay8EBa5d/Xw=;
        b=DWM+GPvUCLHiD8HtHcxflKwcWomGBNlyfhu4QJKmNGGLMBYYcdIoiz/r2Y7k6xBLpk
         sUdaG14uE38lhr/Y/8NPYn82cNwv/qlvFw2TK9HVYkKB4NvZCygrxfAU95Y9AzS1p2Ps
         zmSOrtfhBGiR/T4a5jdsi6CNvtlExvVk7eo9/9SUA0nCbLVUzBbaFBxRq/FVNaUufE9m
         bO7HSyOG8aQA/AQPmvk8adjYBbZQJ5lXnGpNKJajtZBRBVxCYl14DOLgqOMpLm1k0LoU
         wKMdsYCyqYOZqT2z800PXFctCMnobF7jlmqXHAEy6N6kKHETJ8NpdlhQ4+BpsQi/71cT
         hpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797595; x=1779402395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNYZS3s0Ezy+RQHVqVYSzxTe1QiuBpPaay8EBa5d/Xw=;
        b=oqlI3p2D6GQ4Tk6/A9FMZlWGBZFrAXCQkI23s4/inZfhvD/l2P2xX9cg5qmxWzKWqV
         9UhdRl8gezcUC8husCNRa7DL1BM2Fiy6BfgCrf2Wl4X5bV+cwPD1ANKTXm+Zv2yJn8tR
         oa4wK+cmWcgAFYuQOwZ8FJ8xqOJ+cw628pW2fJ33H2h2DbMYKHgrg/C+9MBAD+h0g2Qo
         H3JSxYZvpgMhG3tFJMfz8odpN6X13e/bACJ88wnbcBsGSHERBBpPh9d+QW1x+96lvO2y
         MRKB8aYxjyLp95vuWxEOAtS6RgfiMNozMYYSaGwlwOU9iBOQ1GFXyQv7SOCSKyU1kLqo
         t3cg==
X-Gm-Message-State: AOJu0Yy6/W/flrPaPRXxHsgVcoqiWNs6DDWbMZVdxmEvacTifFohJ6H2
	R4jvrcUn40Unss2Iyrb2F7TJcZu0pcAs83fcHRpJaQJ81FrvObCcmIgcRkMyjr32+GxieMWd6wQ
	MJm37Q5g=
X-Gm-Gg: Acq92OGQ25tfc/n0luZkP+cQ7JeA1dO3/rQMwwYeJ/8sALWSg1GJPeztm7HlPuP09UT
	mF197NwO6Jr2JFKcKNzhGAeDehz3cAqM7I0mbYsuvtzvw0Rcvyojc5MFr0R9tLB2N/vgb1Bu615
	dNVFaD60GwLPOc/Bfz4DUg33VYi/pv/VFlmNFZ6/gclGpkcMZLVub9f4Q9Gi3XTvtTgeJrpCIn/
	SrHlnl2OuUSrK15G72Z8fo9zRqtnluGzpk+3aNA5fBSB9SUq7oOlmclE5Wt/uV2wZXNm5Rp63mT
	IC4NLviJyrOh2mfNFymHIHqiqidcpeMtQ6oYwYYheApzO/XvTsiwvDKBN1uuNiUuxGg/03HNbSA
	u7wjcTF0TTPMwTi+UZFHGLbrvR1y51dr4WR3FNzmcjo+brIQVnFt89/45D61nTIOHeuyvWreDIZ
	d3AhzEQDHSC0p+/c27UAwqwjOmsNpQrK3YUqeIlQmoPavZssRAx+g=
X-Received: by 2002:ac8:7dcd:0:b0:50e:6055:274e with SMTP id d75a77b69052e-5165a025376mr20219891cf.17.1778797595002;
        Thu, 14 May 2026 15:26:35 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:34 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one helper
Date: Thu, 14 May 2026 22:26:20 +0000
Message-ID: <20260514222628.931312-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the logic for deserializing single entries for files into
separate helper functions. In preparation to a linked-block
serialization for files.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a0a419085e28..a2510563469a 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -752,6 +752,46 @@ int luo_file_finish(struct luo_file_set *file_set)
 	return 0;
 }
 
+static int luo_file_deserialize_one(struct luo_file_set *file_set,
+				    struct luo_file_ser *ser)
+{
+	struct liveupdate_file_handler *fh;
+	bool handler_found = false;
+	struct luo_file *luo_file;
+
+	down_read(&luo_register_rwlock);
+	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
+		if (!strcmp(fh->compatible, ser->compatible)) {
+			if (try_module_get(fh->ops->owner))
+				handler_found = true;
+			break;
+		}
+	}
+	up_read(&luo_register_rwlock);
+
+	if (!handler_found) {
+		pr_warn("No registered handler for compatible '%.*s'\n",
+			(int)sizeof(ser->compatible),
+			ser->compatible);
+		return -ENOENT;
+	}
+
+	luo_file = kzalloc_obj(*luo_file);
+	if (!luo_file) {
+		module_put(fh->ops->owner);
+		return -ENOMEM;
+	}
+
+	luo_file->fh = fh;
+	luo_file->file = NULL;
+	luo_file->serialized_data = ser->data;
+	luo_file->token = ser->token;
+	mutex_init(&luo_file->mutex);
+	list_add_tail(&luo_file->list, &file_set->files_list);
+
+	return 0;
+}
+
 /**
  * luo_file_deserialize - Reconstructs the list of preserved files in the new kernel.
  * @file_set:     The incoming file_set to fill with deserialized data.
@@ -781,6 +821,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	int err;
 	u64 i;
 
 	if (!file_set_ser->files) {
@@ -808,39 +849,9 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 */
 	file_ser = file_set->files;
 	for (i = 0; i < file_set->count; i++) {
-		struct liveupdate_file_handler *fh;
-		bool handler_found = false;
-		struct luo_file *luo_file;
-
-		down_read(&luo_register_rwlock);
-		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
-			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
-				if (try_module_get(fh->ops->owner))
-					handler_found = true;
-				break;
-			}
-		}
-		up_read(&luo_register_rwlock);
-
-		if (!handler_found) {
-			pr_warn("No registered handler for compatible '%.*s'\n",
-				(int)sizeof(file_ser[i].compatible),
-				file_ser[i].compatible);
-			return -ENOENT;
-		}
-
-		luo_file = kzalloc_obj(*luo_file);
-		if (!luo_file) {
-			module_put(fh->ops->owner);
-			return -ENOMEM;
-		}
-
-		luo_file->fh = fh;
-		luo_file->file = NULL;
-		luo_file->serialized_data = file_ser[i].data;
-		luo_file->token = file_ser[i].token;
-		mutex_init(&luo_file->mutex);
-		list_add_tail(&luo_file->list, &file_set->files_list);
+		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.53.0

