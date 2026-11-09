Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187390;
	b=HGu4KM4bn1IoN60yUzv/z1fCY3lCKn7uC4R07AD/GmHC2JLZBaIHv12RD2H2LAktxlXu
	 jVyPUCaVp/AobgDp3dOLjWXmpqW/ABuqGPCbQGW7SfWhlrL9Aaj6DY3CmepfvJaSs2SSR
	 ROYDDRha3lc+dFGcFvixNoZzdk2EEV4GLR1CQN7pKz3jjxi/iF+UvVWJW5h+MPAdoQTvV
	 hQkT505kEw0Ne3ydjOSDJRGEGjVYapTN/rD70H+c4i2SSA/6LPoA7T0FLZga5jrsUssDF
	 Xm8lMA1WBBptC0hR3XQ45yFX8lwdfCYGFpcVVryRcWF4A1TKAhoEoUWXae1dLLFxtuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
	b=BbDFub2cqBGNel5XTkWKi5Bnebi8+Tep6CHfp+LccwaRzkVL0UAJDRznqj8YcpQWLABO
	 RQ3T34+qYIWM0zlkcLdAUwIA+CRbxuNDcmchBmBWproxf57v2xONrlscXHQHY8jC/Iu1/
	 eLySfhImkiYUU+aQwGVROCvqy3EpmnY9pBAgLo4lBZtm+SBZEiZuuErGAsXED2FDBGL8s
	 CzhyvRRCG15IU/zUzpSRVEljaKLTjsjLAx9qs6wlFgcks29pcji3SgLguQv4mKhv3fXRn
	 mm1VY+Y8etMdnJ1NoT3h62H5Q1QhRyXOKnGDAXoqbQNobk/tkH+2lXIGnAIS29UUeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CDD606CCFF
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CDD606CCFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so898540eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 17:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187389; x=1794792189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=y8YvaNYB3OxVaJ9hMq/KOa6Yw5s0K1WQp1FrX4v8U+wWxjTtHHKf6FfFW4IpimQbOQ
         gleXCx5Wgw188412YGJOc8KDRIOEFz2f4sYuhHpkypqD7KNaB+VaJ4aeBXfuaaasfx4E
         c3kwZ6wiu9o6K7KFb/B53Hae0+1vjxJoxviR82Eh4F7osMDv0M44eKvSO3Y9WgOjUbf7
         xn0viNKqIf0j4aWDXYWGUEi0hDRBZ+dEd1KR6Z8yc8HeMChsNXYwuuV6Q1YvxJLEdTnV
         2LnMPwB3sUowjvHqsCuqEpCVLMTlx2rBYnNu6opuH/FVY9IqcxKsPOgcA04rlhZ1nRaP
         GtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187389; x=1794792189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=nOxDkX8JHjMcUEe0OUHe3XQBi4dqQ1c0xkTAJrSoZeaWOLiZjzCxD7IE4or4iEbPuP
         mRYOZzUPaexCO5VqCwWyYt5AZMi/YEp7SpeBSU8/iNB0irpqoqETKEuGX50erdZS7Mtn
         fkphMGUF+roYDubeA6eEHvtMEhfzIoaXuId1ANdw6lAoFlQc48M+vJF9aclYTCwr8oO/
         GmF3W5ryVNZ5sAw0Muc0TeNntZaj2k8FW0jQQ2uMVRK9t8d5NwgOsxQMm/xvMDZXJfoJ
         xuQM67/byV3dDC6/DiGmYdNX6BbiBm8sTtcbqkRhFjJnQJHU7lyvVaIPz5MypEPT+4gj
         h7bA==
X-Forwarded-Encrypted: i=1; AL+hErH9hIZOI1gZkh4DfEiJ/jDBu5iDtvj1ws8lLY0VGkuRoyw8p9t/Mu818yOxKWx4sIAONq+8+wVpwRcAN/L4TjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kNMCzrGS3Ztkg33+cpGZrqle6yHysoExBjXsk89HucO+UUnB+
	x/u/BZOj+1TMGQdicckkKDdmkZ+MnfLvBApU3KTdBARjcaks+2NEuiWJ
X-Gm-Gg: AYBFou0iEnxaTkFGosMPue5rkxCdIt1Wcm9a5/RstYcIZdJLJXLFnFH8oi72E1HuCGy
	J7tWVlMDqFDRFllUsiiGftSFf8BhxEfhy1BFI/Ntry5lvrLXhGCYTz8nd4kKpCnLSo1mSDVU+Mf
	GeSvfYIGUgOLV08kmFcDUoY/yMO1xQun8ws83OLski74qFQgHB9lMg0qLeXMWtQyDb5zCUvd/gb
	0mmNuy6ZeBckalHe/HIks8WrqEABtv4ZdYyBvSPpOsezYOGynL/tctJQ3zIWKf/6ZCe1nIO/BNS
	uVl6wtD4KmCRdvEbtBEnTgOLT07+HOanxkypNq0mGrqFbSRsEA8dj0AcpP+qswialZjXsaq64ha
	5Z7YHfrKL4OECNFNSnKq92cE7z2IGOYpGy/drfsR/NWAni1vTPfMl3MBeGWA0E9/n50lF7VAxJN
	uU4+YfiaNg9cld6+tuTJ2MBNYzR2J370jONPqo8nWr3T2hnyFXZVfOJIGzPQsYkZZOyuSp2wWsv
	SqQix2oFGSanXJwIJkMvslxJpeRgr9wBK1C/5xDlzjMxwWBFsADUeBTPRkz4Ry+PpsNz1OuKQLM
	TjwKfAt2cd22JWgGraCUhtXe
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr6502765c88.40.1794187389081;
        Sun, 08 Nov 2026 17:23:09 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:08 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:51 -0500
Subject: [PATCH v4 2/5] docs/mm: ksm: describe how smart scan picks the
 scans to skip
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-2-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
pages KSM has failed to merge before.

Neither says how often an unmerged page is looked at, or that the scans
are picked by the global scan number so that identical pages of
different ages still meet in some scan, which merging through the
unstable tree depends on.

Add a section on smart scan that describes both.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/ksm.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 5a80573162def..f954d221e8017 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
 The frequency of such scans is defined by
 ``stable_node_chains_prune_millisecs`` sysfs tunable.
 
+Smart scan
+----------
+With ``smart_scan`` enabled, ksmd skips pages that it has already tried
+to merge without success. The ``age`` of a page's ksm_rmap_item counts
+the scans that went by while the page stayed unmerged. A page younger
+than three scans is looked at on every scan; after that it is looked at
+every second scan up to an age of five, every fourth scan up to an age
+of eight, and every eighth scan from then on.
+
+The scans that look at a page are picked by the global scan number
+``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
+on every scan, so two identical pages can only be merged in a scan that
+looks at both. As the periods are powers of two, every page is looked
+at on each scan whose number is a multiple of eight, so two identical
+pages meet at least every eighth scan whatever their ages.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c

-- 
2.43.0

