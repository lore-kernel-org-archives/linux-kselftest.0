Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC3340408
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871130; cv=none; b=EJWLKN0G/A/PdBqmUuXoPqdl8MfqP6KjLQ201HphJfwgrWvvKPzHgPqcc0YQKRqmG/ZHQOD64c5BAqEeEVvS4kGsqO8BSLkPHB6S5h+HoF5v/8fMSewhYugEu/Ci8sYOfDRmmMFQlehFIlWL96Ajwf/5oWT8pO29q9TvL4MnbnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871130; c=relaxed/simple;
	bh=JQAGfqE0PffesD9sKQCzYKMipVFSPTwh6dBNXQMkTdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svbRWaSt8tzBxDEJiNEd77NMpqPdiH+NgsZGj+X7RJ2HZr3yB2YCDOg85fk/4UR2/zjWQS0GzoSvoiuW1CBRUjWN8Ay560Z/78oKCyOouB4zxIurZ1dYcLMSCjK3W79W2rFkkj+RpT5/F0yUKZFf6KEJFHjpdNG24LazzLxtNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FoUENce0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FoUENce0"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e50a650a0so114561885a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871128; x=1784475928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BguinuoorksxpsezVhTMBAsbvTRcZT92EAAvPgOWJAM=;
        b=FoUENce01JxYTluhLc5Y7qWU6Bow1Kaez1AeUpF4WAYoDJEI8anyrVCnOoZcX54xly
         /OpZn4309Edh6qvdQnG86scRqFn5z32sdULz3ce8ufWYgAQjNfBKEBWr7YKL53Orj0Td
         x4yieCRsqVgCIPXOzs/+E590i6XSdjooMpw2Ot+BmM51Z0Oh+SRs8n6D2FHpL0fTm6SX
         McKloS72wuX/qKbCMW5R7ZqwgqfLTeUZOc7LOSiHWmE3iYX6nqijsIQeoW6+0exIE3cZ
         2cDDOLteKNEqM3oEVPa8tvJxnwGCNnyFF/0F8CHAKEayG1woayG8tm+wxjYkKEX3skI4
         Lgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871128; x=1784475928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BguinuoorksxpsezVhTMBAsbvTRcZT92EAAvPgOWJAM=;
        b=YKpz6fKEBq7s4heDib6xSPO5pKKkQXZsdFCvzqSo7fZwj0S582PyyUeKjnmARLP6Mp
         +VtJHSEQKGXcPeBk2cZN/rW3wUiNiFUpeX8A1sCJ0kBIDB+RGOkvvUwr8i0IRlH9WUxu
         pysC1dYdOwcstg4IOU+94Mz18OQkMqqK2spaLUoB+zi9/OTM3JeMTPhs04zm+5+drkae
         ZT9v20jIpgr5RxdufofiikZ3DujtzBEqLKG9ykvHAl5xYOIuwcDNJnqcFTFfA6UsfZhN
         1sl4Fl6HL6m3lv6xSZWxBEmkURrqWNqYnWRZCYzZJYkFA2Mpub3FscQObottWhpnrOlB
         GyWA==
X-Forwarded-Encrypted: i=1; AHgh+RrQq7FMAu7nRzx2RtgELcGA9XT3lsLyFLJJWQN2Hqvr9jFBbX254+BH9N3zo4RRYOce6daF/p35RlxQ1fZcaoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9inCdwx1cuiezdfS6YRs90V+3Ib0zFMmO0XzJi+Eg/KOr8DY
	Rm4dLUGjbwtZfJdcLKh3+GyI+L7cUKUKc+pfR2KackhFDq1sNW3rusNVntn2Ee1Uc5o=
X-Gm-Gg: AfdE7clAH4EPxKTsp99A93Gt0z2fh4dt87B+XdbLiwyRhusB18zjwrD/g+j/NNHbvui
	gxNnNAOueuT1G3IjYp2TLsueJThF0EawL2B33knclIojuJRmZZ3mqcUMdnSwYG6jvzgmM1NVK9O
	7YaBZZp0qeDhABiQd8iFhVAqRbJKd3U+77Y7mJIxChv033bOSTSA/67d3oyvsrmKQ9PCoLhbBN5
	IQncyjwg8QoCRo5p3fWzD7SbbS1d7nqjcLUfYxUU4t83CHtSDDUfA9UOIM1H4fjCtfMYE26vHex
	06agjz5hqCAbl9jveJleHVussuzVRAceaUFT9WwaOhHkKjqQKKTHTGJbnxXkoRYyIAt93TMUrkQ
	VwLviY4AeHtvOEMpbR+bwh5Km7AXhBn4z5TZ7eIQUKwU+y+Orcior/+VYA9BS+MamXz5MHGBE7s
	qcBTY3fVqFvV1YDCJpSpBpq9Qv+8nQmYVVRdylQPq9dOEWhPx2TahpY2lB5DRasCQBEYqnYAyhN
	l7ZPp00aSJX
X-Received: by 2002:a05:620a:400b:b0:92e:c117:5ed3 with SMTP id af79cd13be357-92ef2e222a1mr610227085a.83.1783871127659;
        Sun, 12 Jul 2026 08:45:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:27 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net
Subject: [PATCH v7 07/10] dax/kmem: resolve default online type at probe time
Date: Sun, 12 Jul 2026 11:45:01 -0400
Message-ID: <20260712154505.3564379-8-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve the default online type in kmem at probe time explicitly
instead of implicitly inheriting the system default by calling
add_memory_driver_managed().

No behavioral change at this point (still system default).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/kmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 592171ec10f49..38ed5c4e9c83d 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -73,6 +73,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	mhp_t mhp_flags;
 	int numa_node;
 	int adist = MEMTIER_DEFAULT_DAX_ADISTANCE;
+	int online_type = mhp_get_default_online_type();
 
 	/*
 	 * Ensure good NUMA information for the persistent memory.
@@ -172,8 +173,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * Ensure that future kexec'd kernels will not treat
 		 * this as RAM automatically.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, mhp_flags);
+		rc = __add_memory_driver_managed(data->mgid, range.start,
+				range_len(&range), kmem_name, mhp_flags,
+				online_type);
 
 		if (rc) {
 			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
-- 
2.53.0-Meta

