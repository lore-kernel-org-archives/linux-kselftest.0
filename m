Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95C635E1AC
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375886; cv=none; b=RhXmgzbkzbnkGZOaaxuN/L+QU42E9ctYLIVjg6rFuH85Ja6zRB09WrCoVM/5ix5dTl9vTWXi86LbItFIyrj3M96o072s4WtqLFU3sTpfHBCEBde52LCVtIBRUKo+QfvbF7XBvcn0Hv9jL5fFoB3Gz1a/dsk9RrtLEtOo6v0uOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375886; c=relaxed/simple;
	bh=yEG8AcAGFaZQJcqSqjpjUwp6DdocXK0MT8prbUyfCWI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDfARrMWNNyYXh7DXWqsgZoWNFBe8KeWboN3mJ/iZhd8CKfLZm2A428nXBG0uBNK254bwSu/Xx5XOa2xz5jP8e4EK6wruFqdAZA58RweNG7PTJChe2HC+GkjSQWb3osX2/ohKUKSyLi3ze4co5WI4DMFm+JVLupDagUMWw9uFKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SN2wOjVe; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SN2wOjVe"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e519c39196so454871e0c.3
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375884; x=1792980684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HFKyVkuGCKpOVLuQsnhKod7q0RL600zFuUYepG6R/FE=;
        b=SN2wOjVeTNBbwr1PVrBSc6+QHzRxPQcXYHqcW/0lG0xVB3dcguknspbJqE/JJRz8eh
         jARFkMflUGn2MKp3IB/XiaZDDJCDGszCaplOeGhaCWl17SWcXPVi4vjytHn3MFwtJ10n
         TBkFZdCEop5KlOJx+9/rGyTnvQRHiwWERZIAhpiCBR8vSr8iBlh/FMX8d34vdXlSJW3x
         Gfdo1FtBzMZMmWvaJL26tu08ursDA2RGxnUAN2QIapE7A5kM8JNsPdFndLSj4ALdl1se
         CIF7suD8am+ga/fbX/19E0mppnkJMAgSx+L2rdgsnc5Gdcu+e5cPQyle8aBz0rH0uHuV
         36VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375884; x=1792980684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFKyVkuGCKpOVLuQsnhKod7q0RL600zFuUYepG6R/FE=;
        b=jjl75c+e1c6J5BZd/72B+yDwEoIqwdKIgH9LAoUhY+F9vMqALmtm+cjF48AxCA6xWk
         dVbRSkPbMx23Rs0QZndH09RHdjHdE2X/0/ZnGt0FqyebmYsMQDFfyIJRgTu6RiLwrqK4
         6EeirUDEQAiLvbq0+HCulIumSoc0oExxzB/syRclbFsz1PthaNbMK6daAYbx7rHFmOrc
         L4yN677PHs3596jmYBMu8acefEAA2RGMUqETjkjW+FPMpR1+tuHZLfhUSL7BgpWqsBN7
         QkPu17XYrWBGFtB/oJJFFWgftDF2YZgQg4bIw7VCnexSvve9QDQUwRa3xw/TEBAZR914
         q2pQ==
X-Gm-Message-State: AFq9FYJ0YkQ6oa/G7XH70PGvk8jjY6v5uXhPUzCTHTNkXLbabLRKzh5s
	wH6Iule57u2QQThqTB9YtQZcoZZM7OvyzZdw2b5+0nRnumJgR3fmzt8dHSquDXly67wElZPFbyI
	M0Vqp
X-Gm-Gg: AYBFou0Ea5D+Y/x8QnvwYvjlLJUoq2EWh4bm0m/0Pkz8YN2j2Fw54MPHOXsJY1U1Pin
	pnJxu1a1+dcrD92UMgKuvuZcHIClRVq22Kc0JKOmDbc728wkyzw65F6GBSfvZ/Lu+n8e7eCpLTI
	d0fLunvvONlrNZ1yY1EiFxUlM2QWvDe47P0LkUlHpwh3GZHqDe3d4QOMuMLvm+rzSBATWWdwlIx
	7PpvF2p5sqdRtkFzNMR5WuF7are86o3sLpbl55PBCJpo4cLjoz2jUtaD/BlTIktcTAUmd14SAkr
	K+loM3lUgUSKNcnmJZvL8MqoKkeMOplR7BfJ7Hxy/SJOiGuzXQyQSwI6vkbEqf1MhcPlmnw6H16
	kCuDVF+aN6gWi+V7xShlSxHG/h/orOwBCiEuMO0FlQ2aIV9hfYCZz6LhuzDXHqJ/ZXm86unEl7U
	j2DKDLVL25V5+uFegvnNCy2EuesVpsSVI16QDO47ItcOeAlH8J1FZcxGKHTwvkHqazl2SEP/VLq
	tz8AATqECciNVjEyTiKwjxwiaudp7DHT4RZAmO/9Kju4zche19YGz+lv0pT+AZKXAT4v234CdgL
	gtqSXNjUbC3nFRF24BEzPBqKmjGLeQ==
X-Received: by 2002:a05:6122:4b10:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5eab9b59387mr1211022e0c.18.1792375883763;
        Sun, 18 Oct 2026 19:11:23 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:22 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 4/8] kho: do not modify incoming serialized blocks
Date: Sun, 18 Oct 2026 22:11:07 -0400
Message-ID: <20261019021111.990394-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When restoring an incoming block set via kho_block_set_restore(), the
physical chain of blocks is already linked and bs->head_pa is already
set. However, kho_block_add() unconditionally rewrites last->ser->next
and bs->head_pa, and kho_block_set_shrink_one() clears
new_last->ser->next even when operating on an incoming block set.

In the upcoming KHO read-only mode, incoming serialized blocks are
mapped read-only and must not be modified. Guard the ser->next and
bs->head_pa updates in kho_block_add() and kho_block_set_shrink_one()
with !bs->incoming.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..a4e945f28fad 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -93,10 +93,12 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
+	if (!bs->incoming) {
+		if (last)
+			last->ser->next = virt_to_phys(ser);
+		else
+			bs->head_pa = virt_to_phys(ser);
+	}
 
 	return 0;
 }
@@ -133,10 +135,10 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
-	if (new_last)
-		new_last->ser->next = 0;
-	else
+	if (!new_last)
 		bs->head_pa = 0;
+	else if (!bs->incoming)
+		new_last->ser->next = 0;
 }
 
 /**
-- 
2.56.0.176.g3575e65682-goog

