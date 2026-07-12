Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57734342515
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871122; cv=none; b=NqJDkYt7G+WThn2rOWzPSRt3WQdXeZKU/nxtxoBO7DlDqEISEu6HkUV67OW64NOeieNwwXqjw+PjsnN6z6Lalx6fvZ3uKFTMQg/JzmA8wN0LJk5+LVkZU+aktZMIvBOi2feo76+WwnY3Lj7DxUkMzJsP+vqahsOGDxJUyelQwf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871122; c=relaxed/simple;
	bh=tfx6dOdIwwqQC/jjpRe//jhDfVXsvDei4cyYZa9VMO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBalCaG5+yK1SnD0zaFElWJEde9J1NdWkar8eUyu0TBAZVnpV2RoI4axN1V8p3xihzKI1SxZ/FLIWDkXGCc5QCbvN3i5MieCWm+Ni1Ts5XszB1kUEbVn6pfjZXiwVLeJTQo3A2tAU+t71DeWcKrOSrhhbUgzTJqvQpyf7d1PSrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Hd6ZiYZ9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Hd6ZiYZ9"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92ed3993c1eso135900685a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871119; x=1784475919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1M/Y6Dv0V9NOM4+/puP8NWosRoeWXHurd+5rEoqGA8=;
        b=Hd6ZiYZ9vy8K93CSp1Z34ZGIMASH4elXiBdZXrC6yyBmWbdzdJyIK3O8MSVz+6tsc2
         utX5GWJWE0ABixdnE7u3QW2T6WemFjDfCtJfnaPCUnfEuWEZMPhC14NLdyLzuW5HB/sN
         7Fh90VZPJz4shIXzBdk4LswOsVRPDKJTVHv2vK9NMo8nvSFms1NV/6fxKx1/eXmujuGd
         Or41BZ+BM8jQX7qMCebwTTo66TXNyyIvqFAWfFsZr7X5jvMKgVJWXMf+IrZRvsN5vF3m
         MaTOk9tCNEJ0ZIW4722WeQvyaa4J8MXyYlT28TLT4Q2QRItcbL1Jhe2BIiw/xnpQHtyi
         pQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871119; x=1784475919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1M/Y6Dv0V9NOM4+/puP8NWosRoeWXHurd+5rEoqGA8=;
        b=Dx67EiRVxqE1OwgjUvWAckRo+SSX35TpvNuhVdK3PiEwff60HCH8MUPu2JOD3SD026
         d6JSGxaapll+go6za9boUIDTfHD1W82n14KuxzfvgZu3bJDd8y55BIFU4Azc/j5yXyGq
         dgz/DhxffBjUvZqnhV59LAwQz/LvTbeNAvq1GMJ9q5mB96eFZ+X2qdtHUJdJ5Ts8ymHX
         i5uc32g4+24nW2X6+svuVQoa132JUi+XBFrv9vO4lOcsalyTV1G2Ea7jSKzr3HAHUVSv
         whZTIw/tLHRU3s+/pTKk3AtPO3j0ELMjBIxyMxdiKY2R/5eFz3GYyBGm5LaXqQHgtqBk
         DSVA==
X-Forwarded-Encrypted: i=1; AHgh+Rpyly9WlCXYtgxTkaZOuNroqHuJThbm5DBCqhqYNB68MjYP2rm5pyiwgbQuuslo4+OD9XOI9kwcp0gVCGgQj+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMjhucXYEiq7Vla+6947eeDdlTCAWG94P6F/ERvZyuktc8/wV
	YUdtHABTXMYTa48LY9Oi4igbNU4rDdFQBp1+pPNLvGYlwV5jUS6lfICMvU7YT1dJgRg=
X-Gm-Gg: AfdE7cmsRwvZzicCRXRlDpt6wXOdqQeGvy9wUgVCX4hFpnoa+QqOOU8fMt+rrvSmbPd
	8F0MxAEPBVgr48UL2VuHY0Xaw9sKB3wdFiZHQ/7pwhtOzQUlAbll+8fyQt3/1y2heRwFJk0yAJs
	M8S9XjsOPZjJceLLqMvuYaI2FNH49TZqnpCOZ40N2i7ewGmTmV6SGPaBHRsmm9WmWnoQFVdrCDk
	1lmrwRkQ7anVnSR+dGgD1nDvmxdFvZRIHC5RTl+MiWVLw43jlThdZ/ik+hP9UWWeteFEePuQFq2
	CNSo5kfWU+rLLTDVHRs5Mk4/MIR24DjISmH/CernWkSsp8y+FDxNPZq1uY1lO6x3MrNERxbH5dH
	y7ghSi/prmaYETAyXWH8Jhd/YQmGoDxdUYiayoLDZ+dNcg2SLLvW9+ZEa6GNIhtPamqtxGKkoZk
	RAPirYs8MdcyaNsadllWOmDlk/mPlFyibsVISvVMnWyPsrZSdRoF8AQ2dgHvDDahF1mLL+W0dG1
	v8I0TWdwiBy
X-Received: by 2002:a05:620a:480c:b0:92e:6533:26eb with SMTP id af79cd13be357-92ef2bb48d0mr596324285a.6.1783871119197;
        Sun, 12 Jul 2026 08:45:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:18 -0700 (PDT)
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
Subject: [PATCH v7 02/10] mm/memory_hotplug: add mhp_online_type_to_str() and export string helpers
Date: Sun, 12 Jul 2026 11:44:56 -0400
Message-ID: <20260712154505.3564379-3-gourry@gourry.net>
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

Add mhp_online_type_to_str() as the inverse of mhp_online_type_from_str(),
and export both so a driver can render and parse the memory online type
through its own sysfs interface.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/base/memory.c          | 9 +++++++++
 include/linux/memory_hotplug.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index bcfe2d9f4adbd..5eead3346f1e3 100644
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
index f04b915678dbd..8f6da2656f4e2 100644
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

