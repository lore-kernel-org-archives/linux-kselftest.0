Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333071;
	b=cJb0MouO3lolFRhhd6h7WWpZr398bTf5s/5In0zZ9mPvyPyd9w06wRl5dQ2QuBNXEfYW
	 UXt3ApqLaZl/QwoD2bc341Vy2b6PR9N14h4nqSEUwVhlv8Jmq67htnVEiv4gcKPUhRxlH
	 kGjGIRTj+OVnGpsRstiB1ZjqbPBClLr0PUGW95nent0vJWMY41G+B/Dm0Pc4nbs/17PW2
	 R+ZPlWgM+asXGuzelKbRUhQLdgOOiLknjT58Hg+ftLYn/DIVaDjSfD6XEebH/uPTuEzo9
	 6zq8wFNI09J7VlyEjhiu/UqDf3iRV+4TmJZ85M8402CEAuRUz5yE0uLAshs6akqc83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=j4YGurCdBlU79iqxbYdPe60ZsQ+6Te0huBGXd52spLE=;
	b=iVNwDlmjMOQz0qx6Qvco1WeNGCI37yf2dizVNSOwZkbSiT6FJKvd4HIMykzUzftlhq3j
	 JAM9gYF2Q0gsbPIANuthtXET6YnkvzpjiPMIDf0Iyppp7D3OCon/wKDNm+n5UvUIAay9e
	 qxKCkIHM5aqDEEkgE4I847zDHjCD7HyU13eSozWD8poQWJb9UUw92Bz5SaMXBVZXymZXU
	 Gq1rn4NiOxc2Oc3cerOvJI168DK3MzgTCOtbc1QVxU/kodBdk43BWc/LVXAEIYhohrEJu
	 in7h3kNP+r5CD1+L3XP0EZK9SkkRThXSUJ9N+uWSp+ty/HnRSomMbsvT1guBr3Hticg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZy3OUE6;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825B606A32A
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 07:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2825B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZy3OUE6
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OX2Dl1yXBEikHAL+zTZY/BAfC4M/xpOaeaiU2uI76oM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795333069; v=1; x=1795937869;
 b=tZy3OUE6qa3SVi6r2dUIbaBeo+tNB1hk5K7KNCbrDb4ju+yRldOyjnAaYjxi/FLI6sp6OAx0
 Qy1axH3yZqGVyzkdw4HH6xyX9mRwzGdZThKoqA9LEQWggLfzYZ7gAAfNOWJygMr2tlBOdeZsd/P
 hXpD3F9V/MRAmfbB5di8UZpM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 295cb77bfbe198e6;
	Sun, 22 Nov 2026 07:37:49 +0000
X-Mizu-Trace-ID: 295cb77bfbe198e6
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 22 Nov 2026 02:37:36 -0500
Subject: [PATCH 1/3] dma-buf: align large mappings to PMD boundaries
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
Message-Id: <20261122-feat-udmabuf-huge-pfnmap-v1-1-dcba888940c2@linux.dev>
References: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
In-Reply-To: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A dma-buf exporter whose buffer is backed by physically contiguous memory
can map it with PMDs from a ->huge_fault() handler, which only works where
the user address and the buffer offset are aligned alike to PMD_SIZE.

dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
whatever page aligned address the default allocator returns. A 4 GiB
udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
its PMD-sized ranges can be mapped with a PMD.

Use thp_get_unmapped_area(), as filesystems that support huge mappings
do. It aligns a mapping that covers at least one whole PMD to the buffer
offset and leaves smaller mappings where they would be placed anyway.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5c6957f8839a8..015a03c8d04db 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -608,6 +608,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
+	.get_unmapped_area = thp_get_unmapped_area,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
 	.unlocked_ioctl	= dma_buf_ioctl,

-- 
2.43.0

