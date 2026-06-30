Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EB31E830
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854335; cv=none; b=ls2J7QW6DwlKaMxS6Hgs1ZiiRLLF2HkyOxgX+9ZyRwp/Owjqwmk8A13kZIkcPahZubfIaei13XnoNmigKDl1ap4PWg//WR+wn6nJcd+39ZLh+JPi2GUQgvGWFFwoc2v0k8fTPyS1a7/yLnUEmM8n85tMwGgAuL5bHa+Wzbb3xbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854335; c=relaxed/simple;
	bh=8FG7ZFmw3F40yTw3byN4Wrjifv1WRBP6iWaBrd7AOJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbOs65622ouWVd5umbYNnmntE7odL3zWzyDsOt8mKlL+fjW7jyDiZW//BtktbG0v5++/Dc8uFUoi98GhJanEoSBnV1Mu7+ZPocMu4hRMorfjzwpDZQ6GR20Y8xZUdsbblaCN8jQh8U/Jwkl29ry8QI9kS9wTcA4WjYubYIciS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YagGg0Gq; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YagGg0Gq"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e512a9a6bso197065785a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854332; x=1783459132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lel2Y3CZmRG0qaIuB9j1lDgS4wpuSucao3lSJ/Gln9c=;
        b=YagGg0GqfauPqQTYyhZdH7kZPJo9ES4gnEpL/lciDAglimH6E++NXYXL59zEdF/l6L
         CV/7NrovIHrYsIYFq9PtmyGQy7K5ctIkvCbDHwCE2V9+Yn111xyuMs9OB0ZrZZl9D1yP
         CPiGgSIZTGZ0IN3Bmpno/z1SKux5KtYnli0s12D3vEi2d7eHA5aUbrzbzae9p3nj86HU
         +hpwwevkFd2AJvmv0P5QnFqoIA2OMPVhiBUX2VQNYnY6equtv0fk4goy5AHeaIuzplzB
         4OoLLZam9WqbAGRHKZdtQoDlvZquBdA91vP9Jjim2p7mJAHetxuwaXt8yA526+coXoj0
         8BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854332; x=1783459132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lel2Y3CZmRG0qaIuB9j1lDgS4wpuSucao3lSJ/Gln9c=;
        b=ogLfNLdPg9YdjNDzC9HZELtUuqqXgfTppHKpIMzCh4Y6IQe712sAPxmKBXHqFQM8P+
         sDMO9+ZtVpQQEFr2Ta6SpCO382UCrDpbp1NSLCi6IKdYdfG4Qbpup0mdCghA/nhXvWVQ
         EW6DTqUbkkr+toSFM6KtVeBzKEo0Khxe3cd3ymYyG21RV1moN7QxKZ3FdVU+LKntIR9H
         KRjiY5jlWh6RQ2vdVyc2k2iwDX1cijaGVAuEz+7jIs7UntbAcVj9hS3E5tLZzNgIIRlH
         9AkugmrtJI+fZb2/xuHlEXGsK+FbhOKrvZe9aWKkVlhZOqar9CHdqg8M0Of2p+jYfEnY
         1fog==
X-Forwarded-Encrypted: i=1; AFNElJ8A6/OX4rJ0QyDq+2+KvIHAYLqFxG+SxtZxqjo0lIwRbPKoHFbTprL4dzTWJtTESIL0+E7hdsDGlG3E5BymHm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIxTS9OBvn7yqPSkBbCeMnLHyG8dmv0hqxDw/YPxSGtk2nnlZ
	vbvfaObiPFW4EJCK+psTKYkWLgFdiCUGlV8wsinO1PKNGvHmpoFlqR4jy/Abg7XTLNw=
X-Gm-Gg: AfdE7ckvPz48BS3ahSjvSalHM3+gCbAfUE/etRWXQ9OI5GsZR431JfpiOAc4s1IabbY
	X48/V7B3b/0p+UzdjE0uW9rtE4LuR0gaJeWM7rmD/3J8TdlScrNCynFntRjdr9Td3AHZakFw3S5
	9Uis+oNJFndHNhtLmBrw9zU1qhowzrh880rM/m+VSYuPM+h7Dr5l3I00pCOWY2wpLgNSUmcE0fs
	HjS+XEmobQKvqZKyTRmJCVXOLvBHjITa/dRjSmzaLFG2H3qWAYYAQyK+jkIj99O2YoXV964XfSo
	C/bgy1UJqW6oScW0VTBW2BkhX18xzGejc33FIVd3ktptgdo7uNO2hYS7Zmy8XFXZ+fzvUkvnQZ3
	Ums6Umc1oek2t7shuvtHXp0YVetmiMCj+HEE/en34kr85T8+sSbGkf+TcVc0GYAo6qkkH4fqJFV
	evrCcQdb/LmGvwNtPUh2gL0hTADLwZXGfiHkAp73ATV+Rca/NEp/lBnUcSMkwLWkr/D8vvG/+l6
	w==
X-Received: by 2002:a05:620a:a190:20b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e6e55e500mr269113785a.47.1782854331991;
        Tue, 30 Jun 2026 14:18:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
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
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 02/10] mm/memory_hotplug: add mhp_online_type_to_str() and export string helpers
Date: Tue, 30 Jun 2026 17:18:34 -0400
Message-ID: <20260630211842.2252800-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mhp_online_type_to_str() as the inverse of mhp_online_type_from_str(),
and export both so a driver can render and parse the memory online type
through its own sysfs interface.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/base/memory.c          | 9 +++++++++
 include/linux/memory_hotplug.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b318344426fa..3a2f69d3af7b 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -46,6 +46,15 @@ int mhp_online_type_from_str(const char *str)
 	}
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(mhp_online_type_from_str);
+
+const char *mhp_online_type_to_str(int online_type)
+{
+	if (online_type < 0 || online_type >= (int)ARRAY_SIZE(online_type_to_str))
+		return NULL;
+	return online_type_to_str[online_type];
+}
+EXPORT_SYMBOL_GPL(mhp_online_type_to_str);
 
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 7c9d66729c60..5d4b628c4a1f 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -127,6 +127,7 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
 extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
+const char *mhp_online_type_to_str(int online_type);
 
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
-- 
2.53.0-Meta

